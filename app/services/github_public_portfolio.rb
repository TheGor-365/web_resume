# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

# Small, read-only public GitHub profile preview for the existing Turbo panel.
# No access tokens, private repos, arbitrary user-supplied URLs, or JS needed.
class GithubPublicPortfolio
  class FetchError < StandardError; end

  CACHE_SECONDS = 30 * 60
  CACHE_MUTEX = Mutex.new
  USERNAME = "TheGor-365"
  API_BASE = "https://api.github.com"

  def self.call
    CACHE_MUTEX.synchronize do
      now = Time.now.to_i
      return @cached_data if @cached_data && @cache_expires_at && now < @cache_expires_at

      account = get_json("/users/#{USERNAME}")
      repos = get_json("/users/#{USERNAME}/repos?sort=pushed&direction=desc&per_page=30&type=owner")
      raise FetchError, "Unexpected GitHub API format" unless account.is_a?(Hash) && repos.is_a?(Array)

      # Limit the public preview to recent, owned, non-fork repositories.
      clean = repos.select do |repo|
        repo.is_a?(Hash) && repo["fork"] == false && repo["private"] == false &&
          repo["html_url"].to_s.start_with?("https://github.com/#{USERNAME}/")
      end.first(8)
      data = {
        account: account.slice("avatar_url", "public_repos", "followers"),
        repositories: clean.map { |repo|
          repo.slice("name", "html_url", "description", "language", "pushed_at", "stargazers_count")
        }
      }
      if data.fetch(:account)["avatar_url"].to_s !~ %r{\Ahttps://avatars\.githubusercontent\.com/}
        raise FetchError, "Unexpected GitHub avatar URL"
      end
      @cached_data = data
      @cache_expires_at = now + CACHE_SECONDS
      data
    end
  end

  def self.get_json(path)
    uri = URI.join(API_BASE, path)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true,
                               open_timeout: 3, read_timeout: 5) do |http|
      http.get(uri.request_uri, {
        "Accept" => "application/vnd.github+json",
        "User-Agent" => "GorRails-WebResume-PublicPortfolio",
        "X-GitHub-Api-Version" => "2022-11-28"
      })
    end
    unless response.is_a?(Net::HTTPSuccess)
      raise FetchError, "GitHub API HTTP #{response.code}"
    end
    JSON.parse(response.body)
  rescue FetchError
    raise
  rescue StandardError => error
    raise FetchError, "Request failed (#{error.class})"
  end
end

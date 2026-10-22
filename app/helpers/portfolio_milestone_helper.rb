# frozen_string_literal: true

# Presentation-only translations. Experience rows and original evidence remain
# unchanged in PostgreSQL. New/unrecognized events retain their source text.
module PortfolioMilestoneHelper
  REPOSITORY_EVENTS = {
    "property_finder" => "property_finder",
    "web_resume" => "web_resume",
    "rails-project-64" => "blog",
    "rails-project-65" => "classifieds",
    "rails-project-66" => "quality",
    "ai-course-actions-runner" => "runner"
  }.freeze

  CATEGORY_KEYS = {
    "Учебный проект" => "educational",
    "Личный проект" => "personal",
    "Обучение" => "education",
    "Инфраструктурный проект" => "infrastructure"
  }.freeze

  def portfolio_milestone_key(experience)
    repository = experience.note.to_s[%r{https://github\.com/TheGor-365/([A-Za-z0-9_.-]+)}, 1]
    return REPOSITORY_EVENTS[repository] if REPOSITORY_EVENTS.key?(repository)

    # Certificate award: no repository, so identify the specific educational event.
    if experience.company == "Обучение" && experience.start_at&.to_date == Date.new(2026, 5, 19)
      "hexlet"
    end
  end

  def portfolio_milestone_category(company)
    key = CATEGORY_KEYS[company]
    key ? I18n.t("site.timeline.categories.#{key}") : company
  end

  def portfolio_milestone_text(experience, field)
    return experience.public_send(field) unless %i[title overview].include?(field)

    key = portfolio_milestone_key(experience)
    key ? I18n.t("site.timeline.events.#{key}.#{field}") : experience.public_send(field)
  end

  def portfolio_milestone_note(experience)
    original = experience.note.to_s
    key = portfolio_milestone_key(experience)
    return original unless key

    return I18n.t("site.timeline.events.hexlet.note") if key == "hexlet"

    url = original[%r{https://github\.com/TheGor-365/[A-Za-z0-9_.-]+}]
    return original unless url

    I18n.t("site.timeline.labels.repo_source", date: experience.start_at.to_date.iso8601) + ": " + url
  end
end

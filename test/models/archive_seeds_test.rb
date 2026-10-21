require "test_helper"

class ArchiveSeedsTest < ActiveSupport::TestCase
  test "archived certificates and experience seeds are repeatable and non destructive" do
    load Rails.root.join("db/seeds.rb")

    assert Certificate.exists?(title: "Hexlet — Ruby on Rails Development (2026)")
    assert Experience.exists?(company: "ИП Еремин")

    counts = [Certificate.count, Experience.count]
    existing = Experience.find_by!(company: "ИП Еремин")
    existing.update!(overview: "Confirmed edit in existing database")

    load Rails.root.join("db/seeds.rb")

    assert_equal counts, [Certificate.count, Experience.count]
    assert_equal "Confirmed edit in existing database", existing.reload.overview
  end
end

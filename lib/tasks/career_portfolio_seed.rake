# frozen_string_literal: true

# Curated, public portfolio milestones only. Safe to re-run; no historic job
# records are deleted or rewritten. All dates are source-event dates (repository
# creation or certificate issue), NOT assertions of commercial employment.
namespace :career do
  desc "Idempotently seed public portfolio milestones and Hexlet certificates"
  task seed_portfolio: :environment do
    milestones = [
      ["Property Finder", "Учебный проект", 2020, 8, 25, "property_finder"],
      ["Web Resume", "Личный проект", 2023, 3, 11, "web_resume"],
      ["Rails Project 64", "Учебный проект", 2024, 7, 8, "rails-project-64"],
      ["Classifieds", "Учебный проект", 2025, 9, 13, "rails-project-65"],
      ["GitHub Quality", "Учебный проект", 2025, 12, 2, "rails-project-66"],
      ["Hexlet Ruby on Rails", "Обучение", 2026, 5, 19, nil],
      ["AI Course Actions Runner", "Инфраструктурный проект", 2026, 7, 9, "ai-course-actions-runner"]
    ]

    milestones.each do |title, company, year, month, day, repository|
      next if Experience.exists?(title: title, company: company)

      source = repository ? "https://github.com/TheGor-365/#{repository}" : "Hexlet Ruby on Rails certificate issued 2026-05-19"
      Experience.create!(
        title: title, company: company,
        start_at: Time.utc(year, month, day, 12),
        overview: "Public portfolio milestone. See the source and localized presentation.",
        note: source
      )
    end

    [
      ["Hexlet — Ruby on Rails (RU)", "hexlet_ru.jpg"],
      ["Hexlet — Ruby on Rails (EN)", "hexlet_en.jpg"]
    ].each do |title, filename|
      Certificate.find_or_create_by!(image: filename) do |certificate|
        certificate.title = title
        certificate.school = "Hexlet · 19.05.2026"
      end
    end

    puts "Public portfolio: #{Experience.portfolio_milestones.count} milestones; #{Certificate.count} certificates"
  end
end

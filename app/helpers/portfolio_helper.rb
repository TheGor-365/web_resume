module PortfolioHelper
  # Evidence-based: years are repository creation years, not employment dates.
  # Private repos are intentionally not listed on the public-facing site.
  def public_portfolio_projects
    [
      {
        name: "GitHub Quality", year: "2025–2026", stage: :educational,
        url: "https://github.com/TheGor-365/rails-project-66",
        stack: "Rails · PostgreSQL · GitHub OAuth · CI · RuboCop",
        ru: "Учебный сервис для проверки качества GitHub-репозиториев: авторизация, запуск линтеров и история результатов.",
        en: "Educational GitHub repository quality checker with OAuth, linter runs and a history of results."
      },
      {
        name: "Classifieds", year: "2025", stage: :educational,
        url: "https://github.com/TheGor-365/rails-project-65",
        stack: "Rails · PostgreSQL · AASM · Pundit · Bootstrap",
        ru: "Учебная доска объявлений: публикации, роли, модерация, статусы и управление записями.",
        en: "Educational classifieds platform with listings, permissions, moderation and state transitions."
      },
      {
        name: "Web Resume", year: "2023", stage: :personal,
        url: "https://github.com/TheGor-365/web_resume",
        stack: "Rails · PostgreSQL · Hotwire · Chartkick",
        ru: "Этот персональный сайт: профайл разработчика, проекты, сертификаты и техническая хронология.",
        en: "This personal website: developer profile, projects, certificates and a technical timeline."
      },
      {
        name: "Property Finder", year: "2020", stage: :educational,
        url: "https://github.com/TheGor-365/property_finder",
        stack: "Rails · PostgreSQL · Devise",
        ru: "Учебное приложение недвижимости с пользовательскими профилями; ранняя работа на Rails.",
        en: "Educational real estate application with user profiles; an early Rails project."
      },
      {
        name: "AI Course Actions Runner", year: "2026", stage: :infrastructure,
        url: "https://github.com/TheGor-365/ai-course-actions-runner",
        stack: "GitHub Actions · CI/CD · Automation",
        ru: "Публичный исполнитель workflow для автоматизации. Не является демонстрацией закрытой AI-платформы.",
        en: "Public workflow runner for automation. Not a demonstration of the private AI platform."
      }
    ]
  end

  def portfolio_copy(project)
    project.fetch(I18n.locale == :en ? :en : :ru)
  end

  def developer_milestones
    [
      { year: 2020, name: "Property Finder", description_ru: "Создан репозиторий Rails-приложения о недвижимости.", description_en: "Real estate Rails repository created." },
      { year: 2023, name: "Web Resume", description_ru: "Создано первое веб-резюме на Rails.", description_en: "Original Rails web résumé repository created." },
      { year: 2025, name: "Classifieds", description_ru: "Учебный проект с модерацией и контролем доступа.", description_en: "Educational project with moderation and access control." },
      { year: 2025, name: "GitHub Quality", description_ru: "Начало работы над учебным анализатором репозиториев.", description_en: "Educational repository quality checker initiated." },
      { year: 2026, name: "Hexlet Rails", description_ru: "Получен сертификат Ruby on Rails-разработчика (19 мая).", description_en: "Ruby on Rails developer certificate awarded (May 19)." },
      { year: 2026, name: "AI Actions Runner", description_ru: "Создан публичный репозиторий workflow runner.", description_en: "Public workflow runner repository created." }
    ]
  end

  def milestone_description(milestone)
    milestone.fetch(I18n.locale == :en ? :description_en : :description_ru)
  end
end

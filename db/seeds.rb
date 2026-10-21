certificates = [
  { title: 'Bash',              image: 'bash.jpg',                    school: "codeacademy.com" },
  { title: 'Bootstrap',         image: 'bootstrap.jpg',               school: "codeacademy.com" },
  { title: 'Code Foundation',   image: 'code_foundation.jpg',         school: "codeacademy.com" },
  { title: 'CSS',               image: 'css.jpg',                     school: "codeacademy.com" },
  { title: 'Deploy',            image: 'deploy.jpg',                  school: "codeacademy.com" },
  { title: 'Git / GitHub',      image: 'git_git_hub.jpg',             school: "codeacademy.com" },
  { title: 'How to code',       image: 'how_to_code.jpg',             school: "codeacademy.com" },
  { title: 'JavaScript build',  image: 'javascript_build.jpg',        school: "codeacademy.com" },
  { title: 'JavaScript',        image: 'javascript.jpg',              school: "codeacademy.com" },
  { title: 'jQuery',            image: 'jQuery.jpg',                  school: "codeacademy.com" },
  { title: 'Regexp',            image: 'regexp.jpg',                  school: "codeacademy.com" },
  { title: 'Ruby on Rails 2',   image: 'Ruby_on_Rails.jpg',           school: "codeacademy.com" },
  { title: 'Ruby on Rails',     image: 'ruby_on_rails.jpg',           school: "codeacademy.com" },
  { title: 'Ruby',              image: 'ruby.jpg',                    school: "codeacademy.com" },
  { title: 'SQL 2',             image: 'SQL_2.jpg',                   school: "codeacademy.com" },
  { title: 'SQL',               image: 'SQL.jpg',                     school: "codeacademy.com" }
]

historical_experiences = [
  {
    title:    "Администратор",
    company:  "ИП Еремин",
    overview: "закупка продукции (мультимедия: фильмы, софт, PC игры), контроль качества обслуживания, товарный учет, кассовый учет, замещение продавца при необходимости",
    note:     "Причина увольнения - направление закрылось из-за развития новых технологий на рынке",
    cpe:      67,
    start_at: DateTime.new(2011,1,3,19),
    end_at:   DateTime.new(2013,4,1,19),
    image:    ""
  },
  {
    title:    "Менеджер доставки",
    company:  "OOO АЛЬФА",
    overview: "контроль качества блюд на выдаче, контроль работы курьеров, контроль автопарка, работа с промоутерами, учет и заказ тары",
    note:     "Смена названия компании",
    cpe:      39,
    start_at: DateTime.new(2013,6,1,19),
    end_at:   DateTime.new(2016,8,1,19),
    image:    ""
  },
  {
    title:    "Менеджер доставки",
    company:  "ООО ЧинЧин",
    overview: "обязанности те же, что и в 'ООО АЛЬФА'",
    note:     "Причина увольнения: желание сменить профиль работы",
    cpe:      39,
    start_at: DateTime.new(2016,8,1,19),
    end_at:   DateTime.new(2017,6,1,19),
    image:    ""
  },
  {
    title:    "Индивидуальный предприниматель",
    company:  "ИП Хачатрян Гор Ашотович",
    overview: "создание и ведение, интернет магазинов с доставкой, ведение ИП (налоговый учет, бизнес аналитика), настройка рекламы в фейсбук и я директ, контроль доставки и отгрузки, составление и заключение договоров",
    note:     "Причина закрытия COVID-19",
    cpe:      88,
    start_at: DateTime.new(2017,2,1,19),
    end_at:   DateTime.new(2020,4,1,19),
    image:    ""
  },
  {
    title:    "Самозанятый",
    company:  "Разные виды работ",
    overview: "подработки с частичной занятостью, для того чтобы максимально уделять время учебе",
    note:     "Проекты можно посмотреть в разделе 'Пэт проекты'",
    cpe:      74,
    start_at: DateTime.new(2020,5,1,19),
    end_at:   DateTime.new(2023,4,1,19),
    image:    ""
  }
]

# Keep the original five historical, non-IT records for archival continuity.
# Display of these records is filtered at the controller/model layer.
certificates.each do |attributes|
  Certificate.find_or_create_by!(title: attributes.fetch(:title)) do |entry|
    entry.assign_attributes(attributes)
  end
end

historical_experiences.each do |attributes|
  Experience.find_or_create_by!(
    title: attributes.fetch(:title),
    company: attributes.fetch(:company),
    start_at: attributes.fetch(:start_at)
  ) do |entry|
    entry.assign_attributes(attributes)
  end
end

# Source dates below are GitHub repository CREATION dates, not paid work.
# Each entry is a technical milestone, not a claimed job/employer.
technical_milestones = [
  {
    title: "Property Finder — Rails",
    company: "Учебный проект",
    start_at: Time.zone.local(2020, 8, 25),
    end_at: Time.zone.local(2020, 8, 25),
    overview: "Раннее учебное Rails-приложение о недвижимости и пользовательских профилях.",
    note: "Дата создания репозитория; код: https://github.com/TheGor-365/property_finder"
  },
  {
    title: "Web Resume — персональный сайт",
    company: "Личный проект",
    start_at: Time.zone.local(2023, 3, 11),
    end_at: Time.zone.local(2023, 3, 11),
    overview: "Ruby on Rails: профиль, проекты, сертификаты, PostgreSQL и графики.",
    note: "Дата создания репозитория; код: https://github.com/TheGor-365/web_resume"
  },
  {
    title: "Classifieds — модерация объявлений",
    company: "Учебный проект",
    start_at: Time.zone.local(2025, 9, 13),
    end_at: Time.zone.local(2025, 9, 13),
    overview: "Rails, PostgreSQL, авторизация, модерация, AASM и Pundit.",
    note: "Дата создания репозитория; код: https://github.com/TheGor-365/rails-project-65"
  },
  {
    title: "GitHub Quality — проверка кода",
    company: "Учебный проект",
    start_at: Time.zone.local(2025, 12, 2),
    end_at: Time.zone.local(2025, 12, 2),
    overview: "Rails, GitHub OAuth, история запусков линтеров, тесты и CI.",
    note: "Дата создания репозитория; код: https://github.com/TheGor-365/rails-project-66"
  },
  {
    title: "Hexlet — Ruby on Rails",
    company: "Обучение",
    start_at: Time.zone.local(2026, 5, 19),
    end_at: Time.zone.local(2026, 5, 19),
    overview: "Завершённая программа обучения разработке Ruby on Rails.",
    note: "Дата сертификата — 19 мая 2026 года; не является записью о трудоустройстве."
  },
  {
    title: "AI Course Actions Runner",
    company: "Инфраструктурный проект",
    start_at: Time.zone.local(2026, 7, 9),
    end_at: Time.zone.local(2026, 7, 9),
    overview: "Публичный workflow runner для автоматизации с GitHub Actions. Не является демонстрацией закрытого продукта.",
    note: "Дата создания репозитория; код: https://github.com/TheGor-365/ai-course-actions-runner"
  }
]

technical_milestones.each do |attributes|
  Experience.find_or_create_by!(
    title: attributes.fetch(:title),
    company: attributes.fetch(:company),
    start_at: attributes.fetch(:start_at)
  ) do |entry|
    entry.assign_attributes(attributes)
  end
end

# Owner-supplied Hexlet RU/EN certificates are added only once approved JPGs
# exist locally. These are not included in the public repo yet.
%w[ru en].each do |locale|
  filename = "hexlet_#{locale}.jpg"
  next unless Rails.root.join("app/assets/images", filename).file?

  Certificate.find_or_create_by!(title: "Hexlet — Ruby on Rails (#{locale.upcase}), 19.05.2026") do |entry|
    entry.school = "Hexlet"
    entry.image = filename
  end
end

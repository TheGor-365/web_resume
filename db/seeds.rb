Certificate.create([
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
])



Experience.create([
  {
    title:    "Администратор",
    company:  "ИП Еремин",
    overview: "закупка продукции (мультимедия: фильмы, софт, PC игры) | | контроль качества обслуживания | | товарный учет | | кассовый учет | | замещение продавца при необходимости",
    note:     "Причина увольнения - направление закрылось из-за развития новых технологий на рынке",
    cpe:      67,
    start_at: DateTime.new(2011,1,1,19),
    end_at:   DateTime.new(2013,4,1,19),
    image:    ""
  },
  {
    title:    "Менеджер доставки",
    company:  "OOO АЛЬФА",
    overview: "контроль качества блюд на выдаче | | контроль работы курьеров | | контроль автопарка | | работа с промоутерами | | учет и заказ тары",
    note:     "Причина увольнения: желание сменить профиль работы",
    cpe:      39,
    start_at: DateTime.new(2013,6,1,19),
    end_at:   DateTime.new(2016,4,1,19),
    image:    ""
  },
  {
    title:    "Менеджер доставки",
    company:  "ООО ЧинЧин",
    overview: "обязанности те же, что и в 'ООО АЛЬФА'",
    note:     "Смена названия компании",
    cpe:      39,
    start_at: DateTime.new(2016,6,1,19),
    end_at:   DateTime.new(2017,4,1,19),
    image:    ""
  },
  {
    title:    "Индивидуальный предприниматель",
    company:  "ИП Хачатрян Гор Ашотович",
    overview: "создание и ведение, интернет магазинов с доставкой | | ведение ИП (налоговый учет, бизнес аналитика) | | настройка рекламы в фейсбук и я директ | | контроль доставки и отгрузки | | составление и заключение договоров",
    note:     "Причина закрытия COVID-19",
    cpe:      88,
    start_at: DateTime.new(2017,6,1,19),
    end_at:   DateTime.new(2020,4,1,19),
    image:    ""
  },
  {
    title:    "Администратор",
    company:  "Азбука вкуса DAILY",
    overview: "инвентаризации | | контроль порядка в зале, на складе | | работа на кассе | | обучение стажеров | | прием поставок | | консультация покупателей",
    note:     "Причина увольнения нехватка времени на учебу",
    cpe:      34,
    start_at: DateTime.new(2020,6,1,19),
    end_at:   DateTime.new(2021,4,1,19),
    image:    ""
  },
  {
    title:    "Самозанятый",
    company:  "Разные виды работ",
    overview: "подработки с частичной зонятостью, для того чтобы максимально уделять время учебе",
    note:     "Проекты можно посмотреть в разделе 'Пэт проекты'",
    cpe:      74,
    start_at: DateTime.new(2021,6,1,19),
    end_at:   DateTime.new(2023,4,1,19),
    image:    ""
  }
])

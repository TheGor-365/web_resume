module ExperiencesHelper
  LEGACY_EN = {
    "ИП Еремин" => {
      role: "Retail administrator",
      overview: "Product procurement, customer service quality, stock and cash-register records, retail operations."
    },
    "OOO АЛЬФА" => {
      role: "Delivery operations manager",
      overview: "Quality control, courier coordination, fleet supervision, packaging and supply tracking."
    },
    "ООО ЧинЧин" => {
      role: "Delivery operations manager",
      overview: "Delivery service operations and team coordination."
    },
    "ИП Хачатрян Гор Ашотович" => {
      role: "Entrepreneur",
      overview: "Online retail operations, order fulfilment, digital advertising, analytics and business administration."
    },
    "Разные виды работ" => {
      role: "Independent project work",
      overview: "Part-time work alongside professional study."
    }
  }.freeze

  def localized_role(experience)
    I18n.locale == :en ? LEGACY_EN.dig(experience.company, :role) || experience.title : experience.title
  end

  def localized_overview(experience)
    I18n.locale == :en ? LEGACY_EN.dig(experience.company, :overview) || experience.overview : experience.overview
  end
end

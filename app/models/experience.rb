class Experience < ApplicationRecord
  # Milestones are not a claim of employment or paid commercial work.
  # Historic job records remain in the database, but stay off this portfolio.
  scope :portfolio_milestones, -> {
    where(company: ["Учебный проект", "Личный проект", "Обучение", "Инфраструктурный проект"])
  }
end

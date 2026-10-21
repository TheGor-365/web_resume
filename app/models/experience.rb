class Experience < ApplicationRecord
  # Separate technical milestones from the archived non-IT career history.
  scope :public_technical, -> {
    where(company: ["Учебный проект", "Личный проект", "Обучение", "Инфраструктурный проект"])
  }
end

class Update < ApplicationRecord
  default_scope { order(date: :desc) }

  before_save :calculate_case_growth_rate
  # after_commit :calculate_daily_death_growth_rate

  belongs_to :county
  validates :date, uniqueness: true

  private

    def calculate_case_growth_rate
      current_cases  = self.cases
      previous_cases = Update.where(date: (date-1.day ) ).sum(:cases)
      self.case_growth_rate = ((current_cases - previous_cases) / current_cases) * 100
    end

    def calculate_daily_death_growth_rate
      # do math to calculate daily death growth rate
    end
end

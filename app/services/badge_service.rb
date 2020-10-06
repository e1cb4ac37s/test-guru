class BadgeService
  HASH = {
    '1' => {
      rule: I18n.translate('badge_service.first_attempt_rule'),
      method: :first_attempt,
      arg: :test
    },
    '2' => {
      rule: I18n.translate('badge_service.passed_all_by_category_rule'),
      method: :passed_all_by_category,
      arg: :category
    },
    '3' => {
      rule: I18n.translate('badge_service.passed_all_by_level_rule'),
      method: :passed_all_by_level,
      arg: :level
    }
  }

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    if @test_passage.passed?
      badges = Badge.all
      badges.each do |badge|
        rule = HASH[badge.rule]
        send(rule[:method], rule[:arg])
      end
    end
  end

  private

  def first_attempt(test)

  end

  def passed_all_by_level(level)

  end

  def passed_all_by_category(category)

  end
end

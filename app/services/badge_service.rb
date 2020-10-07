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
    @user = test_passage.user
    @test = test_passage.test
    @earned_badges = []
  end

  def call
    if @test_passage.passed?
      badges = Badge.all
      badges.each do |badge|
        rule = HASH[badge.rule.to_s]
        @earned_badges << badge if send(rule[:method], badge.rule_arg)
      end
    end
    if @earned_badges.any?
      @earned_badges.each { |b| @user.badges << b }
      return @earned_badges
    end
  end

  private

  def first_attempt(test_id)
    @user.tests.where(id: test_id).length == 1 if @test.id == test_id
  end

  def passed_all_by_level(level)
    @user.tests_by_level(level).uniq.length == Test.where(level: level).count if @test.level == level
  end

  def passed_all_by_category(category_id)
    @user.tests_by_category(@test.category).uniq.length == Test.where(category_id: category_id).count if @test.category.id == category_id
  end
end

module TestsHelper
  def test_level(test)
    case test.level
    when 0..1 then t('g.tests_helper.easy')
    when 2..4 then t('g.tests_helper.normal')
    else
      t('g.tests_helper.hard')
    end
  end
end
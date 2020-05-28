class Code < ActiveRecord::Base
  MIN_TEST_COVERAGE = 50
  MAX_CALL_BACK_PER_MODEL_AVERAGE = 9
  NESTED_CONDITIONS_LEVEL_AVARAGE = 3

  def legacy_code_or_not
    legacy_code? ? :legacy_code : :not_legacy_code
  end

  private

  def legacy_code?
    return true if test_codes_count == 0
    return true if test_coverage < MIN_TEST_COVERAGE && (high_call_back_average? || high_nested_conditions_level_average?)

    false
  end

  def high_call_back_average?
    call_back_per_model_avarage > MAX_CALL_BACK_PER_MODEL_AVERAGE
  end

  def high_nested_conditions_level_average?
    nested_conditions_level_avarage > NESTED_CONDITIONS_LEVEL_AVARAGE
  end
end


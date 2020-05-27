class Code < ActiveRecord::Base
  def legacy_code_or_not
    is_no_test_code = self.test_codes_count.zero?
    is_test_coverage_under_half = self.test_coverage < 50
    is_too_many_model_callback = self.call_back_per_model_avarage > 9
    is_deep_nested_condition = self.nested_conditions_level_avarage > 3

    if is_no_test_code || is_test_coverage_under_half && (is_too_many_model_callback || is_deep_nested_condition)
      return :legacy_code
    else
      return :not_legacy_code
    end
  end
end


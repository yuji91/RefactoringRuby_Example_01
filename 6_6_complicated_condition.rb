class Code < ActiveRecord::Base
  def legacy_code_or_not
    def no_test_code?; self.test_codes_count.zero? end
    def test_coverage_under_half?; self.test_coverage < 50 end
    def too_many_model_callback?; self.call_back_per_model_avarage > 9 end
    def deep_nested_condition?; self.nested_conditions_level_avarage > 3 end

    if no_test_code? || test_coverage_under_half? && (too_many_model_callback? || deep_nested_condition?)
      return :legacy_code
    else
      return :not_legacy_code
    end
  end
end


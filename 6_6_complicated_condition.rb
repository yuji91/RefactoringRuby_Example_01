class Code < ActiveRecord::Base
  def legacy_code_or_not
    if (self.test_codes_count == 0 || 
        self.test_coverage < 50 &&
        (self.call_back_per_model_avarage > 9 ||
        self.nested_conditions_level_avarage > 3))
      return :legacy_code
    else
      return :not_legacy_code
    end
  end
end


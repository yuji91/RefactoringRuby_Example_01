RSpec.describe do
  require './6_6_complicated_condition.rb'

  code_without_test_code = Code.new(test_codes_count: 0, test_coverage: 0, call_back_per_model_avarage: 9, nested_conditions_level_avarage: 3, created_at: Time.now)
  code_with_half_test_coverage = Code.new(test_codes_count: 30, test_coverage: 50, call_back_per_model_avarage: 9, nested_conditions_level_avarage: 3, created_at: Time.now)
  code_with_many_call_back_and_half_test_coverage = Code.new(test_codes_count: 30, test_coverage: 50, call_back_per_model_avarage: 10, nested_conditions_level_avarage: 3, created_at: Time.now)
  code_with_many_call_back_and_without_half_test_coverage = Code.new(test_codes_count: 30, test_coverage: 49, call_back_per_model_avarage: 10, nested_conditions_level_avarage: 3, created_at: Time.now)
  code_with_deep_nested_code_and_half_test_coverage = Code.new(test_codes_count: 30, test_coverage: 50, call_back_per_model_avarage: 9, nested_conditions_level_avarage: 4, created_at: Time.now)
  code_with_deep_nested_code_and_without_half_test_coverage = Code.new(test_codes_count: 30, test_coverage: 49, call_back_per_model_avarage: 9, nested_conditions_level_avarage: 4, created_at: Time.now)

  describe 'legacy_code_or_not' do
    it { expect(code_without_test_code.legacy_code_or_not).to eq :legacy_code }
    it { expect(code_with_half_test_coverage.legacy_code_or_not).to eq :not_legacy_code }
    it { expect(code_with_many_call_back_and_without_half_test_coverage.legacy_code_or_not).to eq :legacy_code }
    it { expect(code_with_many_call_back_and_half_test_coverage.legacy_code_or_not).to eq :not_legacy_code }
    it { expect(code_with_deep_nested_code_and_without_half_test_coverage.legacy_code_or_not).to eq :legacy_code }
    it { expect(code_with_deep_nested_code_and_half_test_coverage.legacy_code_or_not).to eq :not_legacy_code }
  end
end


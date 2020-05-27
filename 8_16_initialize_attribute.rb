class User < ActiveRecord::Base
  # このコードのリファクタリングでは、spec/8_16_spec.rbも変更してください。
  median_score = User.pluck(:score).median 
  average_score = User.pluck(:score).average 

  # 中央値と平均値以上はA, 中央値以上はB, それ以外はC
  def rank(median_score, average_score)
    if self.score >= median_score && self.score >= average_score
      return :A
    elsif self.score >= median_score
      return :B
    else
      return :C
    end
  end
 
  # 中央値と平均値の半分以下の点数は落第
  def failed?(median_score, average_score)
    if self.score <= median_score.div(2) && self.score <= average_score.div(2) 
      true
    else
      false
    end
  end
end


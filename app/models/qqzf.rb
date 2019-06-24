class Qqzf < ApplicationRecord

  def self.ransackable_scopes(auth=nil)
    %i(tagged_with_type tagged_with_feature tagged_with_keyword)
  end
end

class Rainbow < ApplicationRecord
  acts_as_taggable_on :genders,:keywords, :features, :types, :collections # collection用来给句子归类，写一个标题, 比如"祝寿彩虹屁大集合"

  scope :poisonous_soup,  ->{ tagged_with("毒鸡汤", on: :types)}
  scope :rainbowfart,     ->{ tagged_with("彩虹屁", on: :types)}
  scope :golden_sentence, ->{ tagged_with("金句", on: :types)}
  scope :famous_quotes,   ->{ tagged_with("名人名言", on: :types)}

  scope :tagged_with_type, ->(*tag) { tagged_with(tag, on: :types)}
  scope :tagged_with_feature, ->(*feature) { tagged_with(feature, on: :features)}
  scope :tagged_with_keyword, ->(*keyword) {tagged_with(keyword, on: :keyword)}

  # search_methods :tagged_with_type

  def self.ransackable_scopes(auth=nil)
    %i(tagged_with_type tagged_with_feature tagged_with_keyword)
  end
end

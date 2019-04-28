class Rainbow < ApplicationRecord
acts_as_taggable_on :genders,:keywords, :features, :types

  scope :poisonous_soup,  ->{ Rainbow.tagged_with("毒鸡汤", on: :types)}
  scope :rainbowfart,         ->{Rainbow.tagged_with("彩虹屁", on: :types)}
  scope :golden_sentence, ->{Rainbow.tagged_with("金句", on: :types)}
  scope :famous_quotes,   ->{Rainbow.tagged_with("名人名言", on: :types)}
end

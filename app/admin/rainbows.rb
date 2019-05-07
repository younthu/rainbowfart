ActiveAdmin.register Rainbow do

  scope :all
  scope :poisonous_soup
  scope :rainbowfart
  scope :golden_sentence
  scope :famous_quotes

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:sentence, :gender_list, :feature_list]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
  permitted
end


  filter :sentence
  filter :explain
  filter :tagged_with_type,
         as: :select,
         collection: -> {Rainbow.type_counts.map(&:name) },
         label: 'Types'

  filter :tagged_with_feature,
         as: :select,
         collection: -> {Rainbow.feature_counts.map(&:name)},
         label: 'Features'

  filter :tagged_with_keyword,
         as: :select,
         collection: -> { Rainbow.keyword_counts.map(&:name)},
         label: 'Keywords'

  index do |list|
    selectable_column
    id_column
    column :sentence
    column :explain
    column :feature_list
    column :type_list
    column :collection_list
    actions

  end

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :sentence
      f.input :explain
      f.input :gender_list
      f.input :feature_list
      f.input :type_list
      f.input :collection_list
    end

    f.actions
  end
end

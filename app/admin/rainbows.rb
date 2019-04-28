ActiveAdmin.register Rainbow do
  scope :poisonous_soup do |rainbows|
    rainbows
  end

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

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :sentence
      f.input :explain
      f.input :gender_list
      f.input :feature_list
      f.input :type_list
    end

    f.actions
  end
end

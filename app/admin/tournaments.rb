ActiveAdmin.register Tournament do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :start_date, :end_date, :total_rounds, :format, :num_players, :name, :description

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :start_date
    column :end_date
    column :total_rounds
    column :format
    column :num_players
    actions
  end
  
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :start_date
      f.input :end_date
      f.input :total_rounds
      f.input :format
      f.input :num_players
    end
    f.actions
  end

end

ActiveAdmin.register Match do
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
  permit_params :tournament_id, :player1_id, :player2_id, :player1_score, :player2_score, :winner_id, :description

  index do
    selectable_column
    id_column
    column :tournament_id
    column :player1_id
    column :player2_id
    column :player1_score
    column :player2_score
    column :winner_id
    column :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :tournament_id
      f.input :player1_id
      f.input :player1_score
      f.input :player2_id
      f.input :player2_score
      f.input :winner_id
      f.input :description
    end
    f.actions
  end

end

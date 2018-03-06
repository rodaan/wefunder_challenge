ActiveAdmin.register Player do
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
  permit_params :email, :first_name, :last_name, :phone, :company

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :phone
    column :company
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :company
    end
    f.actions
  end

end

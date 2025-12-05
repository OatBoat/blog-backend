class AddAdminToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :admin, :boolean, default: false
    
  end
end

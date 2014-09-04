class CreateUsers < ActiveRecord::Migration
    def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :github_url
      t.string :twitter
      t.string :description

      t.timestamps
    end
  end
end

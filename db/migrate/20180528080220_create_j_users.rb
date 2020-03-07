class CreateJUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :j_users do |t|
      t.references :user
      t.string :username, comment: '用户的登录名'
      t.string :password, limit: 32, comment: "用户的密码"
      t.timestamps
    end
  end
end

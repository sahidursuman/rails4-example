namespace :update_jane do

  desc %{reset username 'jane' to default '123123' password}
  task reset_to_default_password: :environment do |t|
    jane = User.where(username: 'jane').first_or_create(username: 'jane', email: 'jane@zoeoberon.com', role: 'user', password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
    jane.update_attribute :password, "123123"
  end

end

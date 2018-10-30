class UsersController < Clearance::UsersController
    # before_action :set_post
    
    # validates :birth_date, :presence => true
    # before_create do |user|
    #     user.birth_date = user.login.capitalize if user.birth_date.blank?
    #   end


    private

    def user_from_params
        first_name = user_params.delete(:first_name)
        last_name = user_params.delete(:last_name)
        email = user_params.delete(:email)
        password = user_params.delete(:password)
        birth_date = user_params.delete(:birth_date)
    
        Clearance.configuration.user_model.new(user_params).tap do |user|
          user.email = email
          user.password = password
          user.first_name = first_name
          user.last_name = last_name
          user.birth_date = birth_date
        end
      end



end

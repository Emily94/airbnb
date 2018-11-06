class UsersController < Clearance::UsersController
  
  params.require(:user).permit(:email, :first_name, :last_name, :password, :birth_date {avatars: []})

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

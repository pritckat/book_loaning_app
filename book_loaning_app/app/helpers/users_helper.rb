module UsersHelper

    def user_header
        if @user == current_user
           "Welcome #{@user.username}!"
        else
            "#{@user.username}'s Page"
        end
    end
end

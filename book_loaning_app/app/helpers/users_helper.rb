module UsersHelper

    def user_header
        if User.find(params[:id]) == current_user
           "Welcome #{current_user.username}!"
        else
            user = User.find(params[:id])
            "#{user.username}'s Page"
        end
    end
end

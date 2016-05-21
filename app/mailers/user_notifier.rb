class UserNotifier < ApplicationMailer

  def friend_requested(user_friendship_id)
    user_friendship = UserFriendship.find(user_friendship_id)

    @user = user_friendship.user
    @friend = user_friendship.friend 

    mail to: @friend.email,
          subject: "#{@user.first_name} wants to be friends on JitsList"

  end

  def friend_request_accepted(user_friendship_id)
    user_friendship = UserFriendship.find(user_friendship_id)

    @user = user_friendship.user
    @friend = user_friendship.friend 

    mail to: @user.email,
          subject: "#{@friend.first_name} has accepted your friend request."

  end  
end

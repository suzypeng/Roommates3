class UsersController < ApplicationController
  # skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
    
   def index
    @users = User.all.order({ :username => :asc })
    render({ :template => "users/index.html" })
  end


 def show
    the_username = params.fetch("the_username")
    #@user.id
    @user = User.where({ :username => the_username }).at(0)
    render({ :template => "users/show.html.erb" })
  end

  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.username = params.fetch("query_username")

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/users/#{@user.username}", { :notice => "Welcome, " + @user.username + "!" })
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end


  def update
    the_id = params.fetch("user_id")
    user = User.where({ :id => the_id }).at(0)
    user.username = params.fetch("input_username")
    user.save
    redirect_to("/users/#{user.username}")
  end

  # def update
  #   @user = @current_user
  #   @user.email = params.fetch("query_email")
  #   @user.password = params.fetch("query_password")
  #   @user.password_confirmation = params.fetch("query_password_confirmation")
  #   @user.username = params.fetch("query_username")
    
  #   if @user.valid?
  #     @user.save

  #     redirect_to("/", { :notice => "User account updated successfully."})
  #   else
  #     render({ :template => "users/edit_profile_with_errors.html.erb" })
  #   end
  # end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end

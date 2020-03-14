Rails.application.routes.draw do



  # Routes for the Status resource:

  # CREATE
  post("/insert_status", { :controller => "statuses", :action => "create" })
          
  # READ
  get("/statuses", { :controller => "statuses", :action => "index" })
  
  get("/statuses/:path_id", { :controller => "statuses", :action => "show" })
  
  # UPDATE
  
  post("/modify_status/:path_id", { :controller => "statuses", :action => "update" })
  
  # DELETE
  get("/delete_status/:path_id", { :controller => "statuses", :action => "destroy" })

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  post("/insert_task", { :controller => "tasks", :action => "create" })
          
  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  
  get("/tasks/:path_id", { :controller => "tasks", :action => "show" })
  
  # # UPDATE
  
  post("/update_task/:path_id", { :controller => "tasks", :action => "update" })
  
  # # DELETE
  get("/delete_task/:path_id", { :controller => "tasks", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

   # READ
  get("/", { :controller => "users", :action => "index" })
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:the_username", {:controller => "users", :action => "show"})

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })  

  # UPDATE RECORD
  get("/update_user/:user_id", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

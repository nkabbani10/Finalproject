Rails.application.routes.draw do



  # Routes for the Investorproject resource:

  # CREATE
  post("/insert_investorproject", { :controller => "investorprojects", :action => "create" })
          
  # READ
  get("/investorprojects", { :controller => "investorprojects", :action => "index" })
  
  get("/investorprojects/:path_id", { :controller => "investorprojects", :action => "show" })
  
  # UPDATE
  
  post("/modify_investorproject/:path_id", { :controller => "investorprojects", :action => "update" })
  
  # DELETE
  get("/delete_investorproject/:path_id", { :controller => "investorprojects", :action => "destroy" })

  #------------------------------

  # Routes for the Founderproject resource:

  # CREATE
  post("/insert_founderproject", { :controller => "founderprojects", :action => "create" })
          
  # READ
  get("/founderprojects", { :controller => "founderprojects", :action => "index" })
  
  get("/founderprojects/:path_id", { :controller => "founderprojects", :action => "show" })
  
  # UPDATE
  
  post("/modify_founderproject/:path_id", { :controller => "founderprojects", :action => "update" })
  
  # DELETE
  get("/delete_founderproject/:path_id", { :controller => "founderprojects", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Favourite resource:

  # CREATE
  post("/insert_favourite", { :controller => "favourites", :action => "create" })
          
  # READ
  get("/favourites", { :controller => "favourites", :action => "index" })
  
  get("/favourites/:path_id", { :controller => "favourites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favourite/:path_id", { :controller => "favourites", :action => "update" })
  
  # DELETE
  get("/delete_favourite/:path_id", { :controller => "favourites", :action => "destroy" })

  #------------------------------

  # Routes for the Investor resource:

  # CREATE
  post("/insert_investor", { :controller => "investors", :action => "create" })
          
  # READ
  get("/investors", { :controller => "investors", :action => "index" })
  
  get("/investors/:path_id", { :controller => "investors", :action => "show" })
  
  # UPDATE
  
  post("/modify_investor/:path_id", { :controller => "investors", :action => "update" })
  
  # DELETE
  get("/delete_investor/:path_id", { :controller => "investors", :action => "destroy" })

  #------------------------------

  # Routes for the Founder resource:

  # CREATE
  post("/insert_founder", { :controller => "founders", :action => "create" })
          
  # READ
  get("/founders", { :controller => "founders", :action => "index" })
  
  get("/founders/:path_id", { :controller => "founders", :action => "show" })
  
  # UPDATE
  
  post("/modify_founder/:path_id", { :controller => "founders", :action => "update" })
  
  # DELETE
  get("/delete_founder/:path_id", { :controller => "founders", :action => "destroy" })

  #------------------------------

  # Routes for the Project resource:

  # CREATE
  post("/insert_project", { :controller => "projects", :action => "create" })
          
  # READ
  get("/projects", { :controller => "projects", :action => "index" })
  
  get("/projects/:path_id", { :controller => "projects", :action => "show" })
  
  # UPDATE
  
  post("/modify_project/:path_id", { :controller => "projects", :action => "update" })
  
  # DELETE
  get("/delete_project/:path_id", { :controller => "projects", :action => "destroy" })

  #------------------------------

end

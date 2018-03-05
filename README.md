# README

How to actually run this Git Repo on your C9 Workspace. 

1. Go to c9 and create a new workspace and name it
2. Choose Rails tutorial and click Create Workspace
3. Once c9 has loaded, in the terminal type "git clone *Link of this repo*"
4. cd into the newly created file
5. Type "rvm install ruby-2.4.2" to install Ruby
6. Type "gem install rails -v 5.1.4" to install Rails 
7. Type "bundle install" to install all the plug-ins (gems)
8. Type "rails db:migrate" to fill in the database
9. Type "rails server -b $IP -p $PORT" to start your Rails app
10. Go the share button in the top right corner to find your Application link
11. Open that link and the website will appear 

Quick Rundown of each controller and their methods: 

1. Posts_Controller :

    new - creates a post variable
    
    create- creates a post variable that if saved, will redirect you to that post, otherwise renders the 'posts/new' link
    
    show - shows a post based on the id of the post that is written in the URL
    
    index - shows all posts that have been created
    
    post_params - requires a post (the title) but only permits content (the post can be empty as long as it has a title)
  
  
2. static_pages_controller: 

    home - creates a post1 and post2 variables. Post1 is the last post made, post2 is the second to last post made
  
  
3. users_controller : 

    show - creates a user profile associated with the id in the URL
    
    new - creates a user variable
    
    create - creates a new user, if it saves then it redirects to the user's page, else it renders the 'new' link
    
    members - can search for a member given a :query. If search fails then we show all users
  
  
4. Charges_controller: 

    A controller for the payment system using stripe. I will not fill this out since we are not focuisng on this aspect of our system
  
  
Minimal testing has been implemented. Basic testing that should always be passed. 

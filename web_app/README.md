# Bookmarklet-Web App
##Todo
-refactor
-add tests

##Site Map V1:

#####site:  
  - ~~root/group#index: Display all groups of user~~  
  - ~~groups#show: Display all bookmarks of group~~
  - ~~groups#show: Lock/Unlock group~~
    - ~~set keycode row to min/max of 4~~
  - ~~bookmark#new: Create a new bookmark~~
  - sendto#new: Send to emails, belongs to bookmark, stores if they opened
  - bookmark#show: Display individual bookmark
  - users#show: Settings page  

#####api:  
  - ~~post create to bookmark~~
  - ~~take screenshot of page~~
  - API security

##Database:
##### User:

##### Group: User Specific Group of URLs

##### URL: Used to store urls
   - url  
   - keywords  
   - default_note  
   - og_tags
   - default_image

##### Image: User Specific Image Associated with URL

##### Notes: User Specific Notes about url

##### Shares: Used to track when User shares with another User

## Features  
### Authentication
The backbone of authentication is through the gem [Devise](https://github.com/plataformatec/devise).

####API sessions create
The API uses a custom session method for creating found in api::v1::sessions#create
When the user passes in a successful username/email and password they recieve their
auth token and uuid.

####API session validate
The API use tokens to authenticate and uses uuid to find the user.

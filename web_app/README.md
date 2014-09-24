# Bookmarklet
This project is a means to simplify storing and sharing links with my wife and friends.
Think Pinterest meets Evernote meets something else that already exists =).

##User Case
#####Primary Use Cases:  
 1. Cameron wants to save all the links he's collecting
 for a project he is working on.
 2. Hayley wants to share a link with Cameron.

#####Secondary User Cases:
 1. Fohrcard wants a place where all employees can add competitor sites they see.
 2. Alex wants to search for cool sites for "Furniture Design"

##Language:  
-Bookmark: A collection of URL, Group, Users, Notes, etc  
-Group: A collection of urls under one folder system  
-Url: A url that links to a website  
-User: A person who has an account with link app to store/share links  

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

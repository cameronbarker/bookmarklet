Bookmarklet
============  
This project is a means to simplify storing and sharing links with my wife and friends.
Think Pinterest meets Evernote meets something else that already exists =).

Following the [culdesac.is process](https://coggle.it/diagram/54221b1fce4f4391090025e3/dee2224d6c3b8a1c04f9c442e154f9555a3f695c0716fb6c4770f997d7270a9c)

##Goals based on scenarios
#####Primary Use Cases:  
 1. Hayley wants to share a link with Cameron immediately.
 2. Lauren wants to share a collection of links she created for things to do in NYC with her AirBNB tenants (already exists no beed to build).
 3. Cameron finds multiple links each day for Hayley but doesn't want to annoy Hayley with 5 different emails/notifications.

#####Secondary User Cases:
 1. Cameron wants to save all the links he's collecting for a project he is working on.
 2. Fohrcard wants a place where all employees can add competitor sites they see.
 3. Alex wants to search for cool sites for "Furniture Design"
 4. Cameron wants to see visual previews of what the sites look like

##Competitor Analysis
[Dart](http://tossdarts.com/)  Share and comment on links with in the dart community  
[Potluck](https://www.potluck.it/)  Out of business  
[Kippt](https://kippt.com/)  Collect and organize your boards, not meant for sharing  
[Point](http://www.getpoint.co/)  Real time communication around links and pages, collaboration on pages  

####Thoughts:  
-The majority of the sharing platforms makes the sharee and sharer install the application.  
-Dart allows users to share with their friends through a chrome extension and an app.  They allow
users to comment on a share.  It takes the experience of facebook and puts it into a chrome extension and app.  
-Kippt's organization by groups is interesting, you can put links into groups and
add collaborators to that list for others to add to. They alos make it so you can leave
a note on the board.  This is perfect for primary use case 2.  
-Point's real time collaboration tool is geared towards feed back and teams. Perfect for
primary use case 1 if Hayley and I both have the app.  

####Conclusion
I think primary use case 3 still havent been fully covered.  The links we are sharing
are not meant to be collaborated on or bother the user.  It's my own personal product hunt or
reddit list that should be seen when the sharee has time.

##User's (to be worked ona)
Male 20 year old programmer.
Female 20 year old receptionist.  

##User Questions  
####Goals:  
Find out if people are sharing links with friends and if they are receiving links from friends?  
Do they share a lot in a day?  
How do they share?  
Would they like to receive 10 links in realtime, hourly, or at the end of the day?

####Survey  
See the questions [here](https://camerobarker.typeform.com/to/wZMt9P)  
See the results [here](https://camerobarker.typeform.com/report/wZMt9P/SJdO).  

####Findings:  
Find out if people are sharing links with friends and if they are receiving links from friends?
-People are sharing at least weekly and the majority is sharing links and receiving links daily.

Do they share a lot in a day?  
-People find more than 1 link a day to share with their friends but are pretty
split between how many articles their friends share with them.

How do they share?  
-Social media seems to be the main place. I'd hypothesize that this is due to "discovery honor" concept.

Would they like to receive 10 links in realtime, hourly, or at the end of the day?  
-The majority would like to receive one email at the end of the day.

##Scenario Mapping
####Cameron-
  I'm on a site and want to share it with hayley now through email  
  I found site and I dont want to bother hayley but I do want to send it to her  

####Hayley-
  Wants to see camerons sites in an email with a little bit of info about each site  
  I want to control how often and when I see them  

##Feature Mapping
  See the feature map [here](https://coggle.it/diagram/54296ed4dc7a0cb9090026b4/74c6a46ee62904ee874dbed5d24de92e953a103b5c3d2107f9a173f3aceb004e)  

##Wireframe
####Chrome Extension  
![Chrome Extension](https://raw.githubusercontent.com/cameronbarker/bookmarklet/master/_assets/wireframe/Chrome_Ext_Wireframe.jpg)

####Email Sent  
![Email Extension](https://raw.githubusercontent.com/cameronbarker/bookmarklet/master/_assets/wireframe/Email_Wireframe.jpg)

##Prototype

#### Prototype v1:
See prototype [here](http://culdesac.is/prototype/bookmarklet).
#### Prototype v1-update-1
#####Ideas  
- We've added the from section as we don't plan to create a user account
- We pushed the first two sections labels inline.  

![Email Extension](https://raw.githubusercontent.com/cameronbarker/bookmarklet/master/_assets/wireframe/Prototype-Chrome-v2.jpg)


##Resources:
####Language:  
-Bookmark: A collection of URL, Group, Users, Notes, etc  
-Group: A collection of urls under one folder system  
-Url: A url that links to a website  
-User: A person who has an account with link app to store/share links  

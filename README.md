<b>B.T.T. (Better Transportation Transparency)</b>

<b>Summary:</b> B.T.T. is a portal that allows customers of Uber and Lyft to register complaints and incidents they have had when using the ride sharing services. B.B.T. is a similar to the Better Business Bureau (<a>https://www.bbb.org/</a>), but focused on the unregulated gig economy platforms. This complaints will be publically viewable on the site, and a email sent to the ride sharing company notifying them of such complaint and requesting a resolution.

<b>Problem:</b> Currently there is no aggregate data sets outside of the ride sharing companies that provides insight into the safety of using their platforms. When an incident is reported, the information is handled between the company and the customer. If the police are involved, the information become public, but it is difficult to aggregate that data. As more and more people are turning to ride sharing platforms over public transportation, there needs to be a way to inform riders of the potential dangers of using ride sharing services.

<b>Solution:</b> Create a portal that allows registered users to report on instances of misconduct when using Uber or Lyft. Display those complaint on B.T.T. while being filtered to complaints occuring in the user’s area via a location aware application. Forward complaint to ride sharing service for review and resolution, and post if complaint has been resolved on B.T.T.s

**System dependencies**

Ruby version - Rails 5.2.3

**Testing**
    -All tesing can be run be using "rails test" command.

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Dev Docs
**Endpoints**
1. /register 
   * method: POST  
   * accepts: JSON  
   * request:```{"username": "<username>" , "email": "<email>", "password": "<password>"}```
   * response:```{"error": "<error>", "data": "<data>"```  
   * This is used to submit new user registration to the website.

2. /login 
   * method: POST  
   * accepts: JSON  
   * request:```{"username": "<username>" , "password": "<password>"}```
   * response:```{"error": "<error>", "data": "<data>"```  
   * This is used to sign in to the website.
   
3. /getCurrentUser
   * method: GET  
   * accepts: none
   * request: none
   * response:```{"error": "<error>", "data": "<data>"```  
   * This is used to verfiy currently logged in user.
    
4. /logout
   * method: GET  
   * accepts: none
   * request: none
   * response:```{"error": "<error>", "data": "<data>"```  
   * Logs out any logged in user.
    

# sprints_profile_management_project


https://github.com/user-attachments/assets/04470eab-4642-474c-b0d3-dbf73c9afc19


Develop a User Profile Management with advanced features to manage user data.
The app will have multiple functionalities like creating, fetching, updating, and deleting user profiles.
The project will also include caching, error handling, and responsive UI.

## Project details
this project consists of 3 screens
1. user list
2. user details
3. add new user

#### user list
this screen displays the list of users retrieved from the API endpoint with the options to:\
add a new user/
view user's details\
and delete an existing user (both adding and removing a user will update the endpoint)\

#### user details
this screen displays more details about the user and allows the user to edit their details (this will also update the endpoint)\

#### add new user
this screen takes the entered data and adds a new record to the users in the endpoint

### user model 
the user model class contains:\
ID\
Name\
Age\
Gender\
Email\
Phone number\
Address\
### Ui&Ux design :https://www.figma.com/design/sBPzQg1RO0wmHxRJJHVtpZ/Egy-Tour?node-id=195-6

### [endpoint](https://usersapi-production-4ffe.up.railway.app/docs#/)
#### used packages:
[Dio](https://pub.dev/packages/dio)
[Shared Preferences](https://pub.dev/packages/shared_preferences)

Team members:\
Mostafa Elzohirey (coordinator)\
Mahmoud Sobhy Awad\
Ahmed Emad Mahmoud\
Mohamed Salah\
Shaza Allam\
Menna Raafat\

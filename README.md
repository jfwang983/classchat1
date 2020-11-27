# ClassChat

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
ClassChat is an online classroom app designed to provide the basic features needed to run online logistics for a class while retaining an easy-to-use chatroom for students and teachers to quickly communicate.

### App Evaluation
- **Category:** Education / Social Network
- **Mobile:** Developed for only mobile usage
- **Story:** Allows teachers to post assignments, grades and announcements. Students can view what the teacher posts. Additionally, students and teachers can chat in the chatrooms.
- **Market:** Students and teachers in education.
- **Habit:** Frequently. Students and teachers would actively engage with each other.
- **Scope:** Focused on basic online class logistics then expand to make logistic handling more robust.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in as either a student or teacher
* Students can access announcements, grades, and assignments
* Teachers can post and delete announcements, grades, and assignments
* Students and teachers can text on the chatrooms
* Teachers can create and delete chatrooms

**Optional Nice-to-have Stories**

* Users can customize profile with profile picture and biography
* Users can switch between classes

### 2. Screen Archetypes

* Login/Register
* Announcements
    * Teachers can post new announcements (title + description)
    * Students can view announcements
* Assignments
    * Teachers can post new assignments (title + description + points)
    * Students can view assignments
* Grades
    * Teachers can post grades for assignments (title + points earned + letter grade)
    * Students can view grades
* Chatroom
    * Teachers can create new chatrooms (title)
    * Students and teachers can chat in chatrooms

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Announcements
* Assignments
* Grades
* Chatroom


**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Announcements

## Wireframes
<img src="https://i.imgur.com/AwwBIec.jpg" width=600>

## Schema 
### Models

#### Classroom Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id (default field) |
| classId       | String   | unique classroom id generated for students to use to join class |
| teacher       | Pointer to User | teacher of the classroom |
| students      | Array of pointers to Users | all students currently in class |
| announcements | Array of pointers to Announcements   | classroom announcements |
| assignments   | Array of pointers to Assignments  | classroom assignments |
| chatrooms     | Array of pointers to Chatrooms   | classroom chatrooms |

#### User Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id for the user (default field) |
| name          | String   | name of user |
| classroom ids | String   | ids corresponding to classrooms the user is in |

#### Announcement Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id for the announcement (default field) |
| name          | String   | name of announcement |
| date          | Date     | announcement date |
| description   | String   | announcement description |
| classroom id  | String   | id to corresponding classroom |

#### Assignment Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id for the assignment (default field) |
| name          | String   | name of assignment |
| description   | String   | assignment description |
| pointValue    | Number   | point value for assignment |
| dueDate       | Date     | assignment due date |
| grades        | Object   | key for each student's user id with value as their grade |
| classroom id  | String   | id to corresponding classroom |

#### Chatroom Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id for the chatroom (default field) |
| name          | String   | name of chatroom |
| chats         | Array of pointers to Chats | all chats sent in chatroom |
| classroom id  | String   | id to corresponding classroom |

#### Chat Model
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | String   | unique id for the chat (default field) |
| user          | Pointer to User | user that sent the chat |
| message       | String   | actual message sent |
| timestamp     | Date     | time message was sent |

### Networking
#### List of network requests depending on user and screen
- Teacher Account
    - Classrooms Page
        - (READ/GET) Query all classrooms that the user is a part of
    - Announcements Page
        - (Read/GET) Query all announcements for corresponding classroom
        - (Create/POST) Create a new announcement
        - (Update/PUT) Update an existing announcement
        - (Delete) Delete an announcement
    - Assignments Page
        - (Read/GET) Query all assignments for corresponding classroom
        - (Create/POST) Create a new assignment
        - (Update/PUT) Update an existing assignment
        - (Delete) Delete an assignment
        - (Update/PUT) Update a student's assignment grade
    - Chatrooms Page
        - (Read/GET) Query all chatrooms for corresponding classroom
        - (Create/POST) Create a chatroom
        - (Update/PUT) Update a chatroom's name or description
        - (Delete) Delete a chatroom
        - (Create/POST) Create a message in a chatroom
- Student Account
    - Classrooms Page
        - (READ/GET) Query all classrooms that the user is a part of
    - Announcements Page
        - (Read/GET) Query all announcements for corresponding classroom
    - Assignments Page
        - (Read/GET) Query all assignments for corresponding classroom
    - Chatrooms Page
        - (Read/GET) Query all chatrooms for corresponding classroom
        - (Create/POST) Create a message in a chatroom

<img src='http://g.recordit.co/lo8Q12KU0Y.gif' title='Progress' width='' alt='Progress' />

# openCX-*netinder* Development Report

Welcome to the documentation pages of the *NetTinder* module of **openCX**!

You can find here detailed information about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

The developers: *Carlos Duarte*, *Joaquim Rodrigues*, *Leonardo Moura*, *Maria Viana*, 
and *Mark Meehan*.

---

## Product Vision
For conference participants who want to take their networking experience to the next level, NeTinder is an app that matches them by their interests, 
maximizing the time each one spends learning more about their favourite areas.

---
## Elevator Pitch
Have you ever been to a conference and thought to yourself that many of the companies or participants that you talk to have very different interests than you do? Do you feel that you 
end up wasting your time talking to people you don't want to instead of connecting to others that share your passions and have common goals to yours?
With NeTinder, we are fixing this for good.
By using our app paired with a microbit smart-tag device, you can select the topics aborded in a conference that are of most interest to you, and when you are nearby someone that is a 
good match, your microbit will bleep and display a number. That number will also be displayed on the match's microbit, helping you find each other in such crowded places.
And the more you network with others, the more prizes you win!

---
## Requirements
### Functional requirements
- The system shall be based on two main components: a mobile app and a microbit.
- The app shall allow the user to pick his main areas of interest (that will be debated in the conference).
- The app shall feature a login system so that a user can access his personal information.
- The app must let users claim the prizes they have won, and check their progress in getting them.
- The microbit shall detect when a match is nearby the user via bluetooth.
- The microbit shall emit a noise and display a number that will allow easy idenfitication by the other participant that he was matched with.
- The app and the microbit shall communicate with each other in order to sync information.

### Non-functional requirements
- Bluetooth communications should be smooth and stable

### Use case diagram 

![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/docs/use_case_diagram.jpg?token=AGNJ76E5Y37536EOU4JSAYK5XQLDU)

#### Pick tags
* **Actor** - A person attending the conference

* **Description** - In order for a participant to be matched with others, their favourite topics need to be explicited (which assume the form of tags). When the tags are selected, more appropriate matches will be found and the user's interaction will be much more valuable.

* **Preconditions and Postconditions** - The user needs to have signed up to the app and be authenticated. After picking the tags, these should be visible in the user's profile. The system should have one more tag in the list of selected tags.

* **Normal Flow**

    1 - User thinks of a tag that is of his interest

    2 - User checks if the tag is present in the list of available tags. If the tag exists, he selects it
    
    3 - The system rememebers the tag as selected by the user
    
    4 - The system now uses the tag to match the user with others that have picked this same tag

* **Alternative Flows and Exceptions**. It may happen that the tag a user wants to select doesn't exist. In this case, he will be unable to select it and the system will send an error message, as tags are assign per event (it doesn't make sense to match tags that have nothing to do with the event's context).

#### View list of matches
* **Actor** - A person attending the conference

* **Description** - The user must be able to check his matches. 

In order for a participant to be matched with others, their favourite topics need to be explicited (which assume the form of tags). When the tags are selected, more appropriate matches will be found and the user's interaction will be much more valuable.

* **Preconditions and Postconditions** - The user needs to have signed up to the app and be authenticated. After picking the tags, these should be visible in the user's profile. The system should have one more tag in the list of selected tags.

* **Normal Flow**

    1 - User thinks of a tag that is of his interest

    2 - User checks if the tag is present in the list of available tags. If the tag exists, he selects it
    
    3 - The system rememebers the tag as selected by the user
    
    4 - The system now uses the tag to match the user with others that have picked this same tag

* **Alternative Flows and Exceptions**. It may happen that the tag a user wants to select doesn't exist. In this case, he will be unable to select it and the system will send an error message, as tags are assign per event (it doesn't make sense to match tags that have nothing to do with the event's context).

#### Check/manage points and available discounts

### User stories
We have a more up-to-date set of user stories in our Trello board, that we have made public so that you can watch our progress as development continues (https://trello.com/b/8qWwiWTX/netinder).

The board consists of user stories. Each one of them is assigned a priority as a label, and these priorities can assume one of four states: Critical, urgent, moderately important and nice to have. 

We are also identifying each user story with a label that identifies it as part of the frontend, backend or microbit portion of our software.

In the description of each card you can take a look at the acceptance tests and use-case scenarios. Each card is also assigned to one (seldom multiple) of the team members.
Our kanban board is made up of several lists: 
- Backlog - requirements that are not yet specified as user stories
- Todo - user stories awaiting a developer to pick them
- In progress - user stories currently being developed
- Review in progress - user story that has been developed but is awaiting review (by means of approving a pull request)
- Reviewer approved - user story that has been approved by more than one member of the development team
- Done - fully implemented requirements
Each one of the cards in our Trello board has a mockup as an attatchment. Be sure to check it out!

We are also assigning points to each of our stories as a way to measure the effort requires to implement each one of them. We'll be using the following set of fibonacci numbers while sizing a user story, from minimum to max effort: 1, 2, 3, 5, 8, 13, 21. 

| **Identifier** | **Name**                                       | **Priority**          | **Description**                                                                                                           | **Mockup**                                                                                                                              |
|----------------|------------------------------------------------|-----------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| US101          | Pair microbit with app                         | Urgent                | As an Authenticated User, I want to access my profile page, so that I can see my personal data.                           |                                                                                                                                         |
| US102          | Create sign-in/sign-up UI                      | Urgent                | As a user, I want to access the sign-in/sign-up menu, so that I can enter my login information                            | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6)     |
| US103          | Store user information as JSON file            | Urgent                | As a user, I want to have my information stored so it can be exchanged                                                    |                                                                                                                                         |
| US104          | Notify with microbit using sound and LED panel | Moderately importante | As an authenticated user, I want to have a microbit identifying me so that I can spot my match faster                     |                                                                                                                                         |
| US105          | Sign-in/sign-up                                | Urgent                | As a visitor, I want to sign in/sign up, so that I can personalize my experience                                          | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6)     |
| US106          | Logout                                         | Urgent                | As an Authenticated User, I want to logout from the system, so that I can end my session                                  | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/conferences.png?token=AGNJ76BDET7R7LN4ZXHXKKS5XQJ3K) |
| US107          | Sense potential match nearby                   | Urgent                | As a user, I want to know which users are around me, so that I can be matched with the ones with the same interests.      |                                                                                                                                         |
| US108          | Update account info                            | Moderately important  | As a user, I want to know which users are around me, so that I can be matched with the ones with the same interests       | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6)     |
| US109          | Notify match nearby                            | Moderately important  | As a user, I want to be notified so that I am alerted to the presence of a match nearby                                   |                                                                                                                                         |
| US110          | Manage tags                                    | Moderately important  | As an authenticated user, I want to manage my tags so that I can be matched with other attendees                          |                                                                                                                                         |
| US111          | Delete account                                 | Nice to have          | As an Authenticated User, I want to delete my personal account, so that I can delete all my personal data from the system | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6)     |
| US112          | Manage points                                  | Nice to have          | As an Authenticated User, I want to manage and view my points, so that I can trade them                                   | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6)     |
| US113          | View attended conferences' list                | Nice to have          | As a user, I want to see my conferences, so that I can know which ones I attended                                         | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/conferences.png?token=AGNJ76BDET7R7LN4ZXHXKKS5XQJ3K) |
| US114          | View previous matches                          | Nice to have          | As an Authenticated User, I want to view my previous matches, so that I keep tabs with them                               | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/matches.png?token=AGNJ76A7R7FMO2TWURRS42C5XQJ5O)     |

**Acceptance tests**.
*US101*
Participant uses his microbit to find a match:
- Given that the participant needs to use his microbit 
- When he wants to interact with it 
- Then he needs to pair it with the app

*US102*
User wants to add a tag:
- Given that the user wants his information stored
- When he is adding a new tag
- Then he needs to sign up/sign in 

*US103*
User matches with another one:
- Given that a user is matched with another participant
- When both of them are in close proximity
- Then their personal information needs to be added to each user's history of matches

*US104*
User finds a match:
- Given that the conference environment is crowded and congested
- When the user is walking around the campus
- Then he needs be easily identified (using sound and microbit LED panel)

*US105*
User wants to save his information:
- Given that a user needs his information to be stored permanently
- When he is participating in a conference
- Then he needs to create a profile so that the information can be linked to him

*US106*
User won't be attending more conferences:
- Given that a user might not be attending conferences anymore
- When he leaves the current one
- Then he must be able to logout from his account

*US107*
Match with user nearby:
- Given that a potential match may be nearby:
- When a user is in close proximity with others
- Then he needs to sense nearby participants and check if a match can happen

*US108*
User needs to change his email address:
- Given that a user can be contacted by others through his email address
- When he has been matched with other participants
- Then he needs to alter it whenever he wants to

*US109*
User finds a match:
- Given that the conference grounds are crowded
- When the participant is walking by
- He needs to be called to attention whenever a match is nearby

*US110*
User has a new interest:
- Given that a user can start linking a new knowledge area after a talk
- When he is attending the conference
- Then he needs to be able to add new tags as interests

*US111*
Right to be forgotten:
- Given that every EU citizen has the digital right to be forgotten
- When he uses our app services
- Then he needs to be able to completely remove his information from our app/servers.

*US112*
Trade points for goodies:
- Given that a user accumulates points the more matches he gets
- When attending the conference
- Then he needs to be able to exchange these points for goodies provided by the sponsor companies

*US113*
Check accumulated points from past conferences:
- Given that a user might want to check his points from past conferences
- When he is logged in to the app
- Then he must be able to see a list of events he attended previously, as well as the amount of points he has collected 

*US114*
Keep in touch with matches
- Given that a user might want to talk to a participant he was matched with
- When the conference is over/while the conference is occurring
- Then he must be able to see a list of people he was matched with


**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).

### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.

---

## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).

### Prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

---

## Implementation
Regular product increments are a good practice of product management. 

While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---
## Test

There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---
## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management
We are using a Trello board to manage user stories - and set their priorities, categories, use cases, assignee, due date and current status.
Our kanban board is public for viewing. You can consult it using the following link: https://trello.com/b/8qWwiWTX/netinder.
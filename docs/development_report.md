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

Briefly describe each use case mentioning the following:

* **Actor**. Name only the actor that will be initiating this use case, i.e. a person or other entity external to the software system being specified who interacts with the system and performs use cases to accomplish tasks. 
* **Description**. Provide a brief description of the reason for and outcome of this use case, or a high-level description of the sequence of actions and the outcome of executing the use case. 
* **Preconditions and Postconditions**. Include any activities that must take place, or any conditions that must be true, before the use case can be started (preconditions) and postconditions. Describe also the state of the system at the conclusion of the use case execution (postconditions). 

* **Normal Flow**. Provide a detailed description of the user actions and system responses that will take place during execution of the use case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the use case name and description. This is best done as a numbered list of actions performed by the actor, alternating with responses provided by the system. 
* **Alternative Flows and Exceptions**. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions. 

### User stories

#### 1. Visitor

| **Identifier** | **Name** | **Priority** | **Description** | **Mockup**|                                                   
| -------------- | -------- | ------------ | ------------------------- | --------------|
| US001          | Sign Up | High         | As a Visitor, I want to register into the system, so that I can have access to user's privileges. | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/sign%20up.png?token=AGNJ76AAGI37TQFMPJ2BTYK5XQJVS) |
| US002          | Sign In   | High         | As a Visitor, I want to log in into the system, so that I can authenticate myself and have access to user's privileges. | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/sign%20in.png?token=AGNJ76FLKT5QGBS53X3O2EK5XQIWQ)|

#### 2. Authenticated User

| **Identifier** | **Name** | **Priority** | **Description** | **Mockup**|                                                   
| -------------- | -------- | ------------ | ------------------------- | --------------|
| US101          | Profile page          |              | As an Authenticated User, I want to access my profile page, so that I can see my personal data.                                  | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US102          | Edit Profile          |              | As an Authenticated User, I want to edit my profile, so I can keep it updated.                                                   | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US103          | Log Out               |              | As an Authenticated User, I want to log out from the system, so that I can end my session.                                       | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/conferences.png?token=AGNJ76BDET7R7LN4ZXHXKKS5XQJ3K) |
| US104          | Delete Account        |              | As an Authenticated User, I want to delete my personal account, so that I can delete all my personal data from the system.       | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US105          | See Notifications     |              | As an Authenticated User, I want to see my notifications, so that I can know when someone with the same interests as me is near. | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US106          | Clear Notifications   |              | As an Authenticated User, I want to clear my notifications, so that I can keep them organized.                                   | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US107          | View previous matches |              | As an Authenticated User, I want to view my previous matches, so that I can remember who I matched with.                         | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/matches.png?token=AGNJ76A7R7FMO2TWURRS42C5XQJ5O) |
| US108          | See my conferences    |              | As an Authenticated User, I want to see my conferences, so that I can know which ones I attended.                                | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/conferences.png?token=AGNJ76BDET7R7LN4ZXHXKKS5XQJ3K) |
| US109          | Check my points       |              | As an Authenticated User, I want to check my points, so that I can see how many points I earned                                  | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |
| US110          | Manage my points      |              | As an Authenticated User, I want to manage my points, so that I can trade them.                                                  | ![](https://raw.githubusercontent.com/softeng-feup/open-cx-netinder/master/mockups/profile.png?token=AGNJ76C4TFMABRZX5DUH5EK5XQJZ6) |

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in Gherkin), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

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

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:
  * [Trello.com](https://trello.com)
  * [Github Projects](https://github.com/features/project-management/com)
  * [Pivotal Tracker](https://www.pivotaltracker.com)
  * [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.

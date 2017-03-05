# Taiga-Client iOS #

An iOS-Client for the agile project management tool https://taiga.io.

### how to use ###

App can be used with your Taiga-account. Just login with your account-credentials. If using a custom installation of Taiga, you can enter the URL in the "Server" input field, otherwise leave empty.

#### demo-account ####
username: r31r0c-demo

password: demo123

### development state ###

Application is still under development. Currently following features are integrated:

* Login
* Auto-Login
* List all projects
* Create project
* List user stories of project
* Show user story details (most important details)
* List issues of project
* Show issue details (most important details)
* List wiki-links
* Show wiki page
* Share user stories or issues

There is no caching or loading in predication. Everytime entering a view, data is fetched from the server. Even user interface wasn't that important until now.
Application is just available in portrait-mode, as it doesn't make that much sense having these long lists in landscape.

### tested devices ###

* iPhone 5s with iOS 10.2.1
* Simulator iPhone 6s
* Simulator iPhone 7
* Simulator iPhone 7 Plus
* Simulator iPhone SE

### Who do I talk to? ###

* Dominik Reichinger (dominik.reichinger@students.fh-hagenberg.at)
* Michael Rockenschaub (michael.rockenschaub@students.fh-hagenberg.at)
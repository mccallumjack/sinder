[![Coverage Status](https://coveralls.io/repos/mccallumjack/sinder/badge.svg?branch=master&service=github)](https://coveralls.io/github/mccallumjack/sinder?branch=master)
[![Build Status](https://travis-ci.org/mccallumjack/sinder.svg?branch=master)](https://travis-ci.org/mccallumjack/sinder)
#Sinder
Sinder is a tool to help programers find open sourced projects on Github that they might be interested in contributing to. Users can flip through projects and, if they have logged on with Github, star any repos that they are interested in contributing to.

Check it out at https://sinder.herokuapp.com
#Sample Screenshots
![Homepage](/sinder_homepage.png)

![Mainpage](/sinder_display_page.png)

#Schema
![Schema](/sinder_schema.png)

#Data Flow
![Data Flow](/data_flow.png)

#Features
##Sinder:
- Allows a user to browse anonymously
- Allows a user to sign in with Github and create an account if they don't already have one
- Remembers user interactions to avoid showing the same repo multiple times
- Allows a user to reset their interaction history
- Removes repos that a user already stars or watches from list of possible matches
- Stars repos on the user's Github profile if they star it in our app
- Allows a user to filter repos by language
- Regularly updates repo information

##Repo Information:
- Title
- Link to Github repo
- Creator and project name
- Project description
- Project language
- Number of stargazers
- Number of forks
- Number of contributors
- Date of most recent activity
- Participation rate
- Pull request rate
- Contributor guidelines
- Code of conduct
- The three newest issues

# sinder

#Team Norms

##Workflow
- Update master frequently
- Create tickets in pivital tracker for all work you do and things you think of that needs to be done
- Good commit messages, present tense
- Code review and leave comments
- Hold each other accountable for team norms
- Pair as needed
- Features: +1 for code review, +2 for merge
- Bugs: +1
- Grab vertical slice
- Write tests on everything you grab

##Tech Stack
- Rails
- Postgres
- Materialize CSS
- Whenever gem (https://github.com/javan/whenever)
- Octokit gem (https://github.com/octokit/octokit.rb)
- Figaro gem (https://github.com/laserlemon/figaro)
- Nokogiri gem (https://github.com/sparklemotion/nokogiri)
- Travis CI
- Coveralls
- Pivotal Tracker (https://www.pivotaltracker.com/n/projects/1388960)


## Heroku Deployment

www.sinder.herokuapp.com

## Our Team!
![Mainpage](/team_sinder.jpg)

From right to left:

Jack McCallum: [https://github.com/mccallumjack](https://github.com/mccallumjack)

Michael Kunc: [https://github.com/michaelkunc](https://github.com/michaelkunc)

Amber Taniuchi: [https://github.com/amberzilla](https://github.com/amberzilla)

Joe Awad: [https://github.com/joeaawad](https://github.com/joeaawad)





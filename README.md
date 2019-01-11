#  Hi!
This project is an MVP architecture implementation on a Swift 4.2 project. 
Based on the sports data base free API www.thesportsdb.com/api.php the application offer the possibility to seach for leagues with autocomplete, select a league and then select a team from the league then show the team's players.

## Architecture
### Modules
The application contains many fonctionnal parts, thats reflected on the architecture. There are two principal modules: the home module and the players module (I am not talking about swift modules a module here is a group of swift files)
The home module itself contain 2 sub-modules: the autocompletion module and the teams module. It's decomposed like that to reduce the home module responsabilities and for reusability purpose.
### Communucation between modules
Modules communucate using presenters like shown on the diabgram
![Architecture](/Documentation/architecture.png)

### Repositories
Repositories are the model layer access points.
## Unit tests
Nimble and Quick are used for unit tests. Fake test implementations are used for unit testing presenters.

## What to do next?
* HomeViewController contains a lot of instantiation code and wiring of MVP components. It's not the role of a view controller. So next we need an object that inject those dependencies. It may be a router that creates modules and manage navigation.
* Repositories contain a lot of common code. So maybe create protocol repository that does the common stuff.


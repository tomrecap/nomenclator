##Nomenclator

[Nomenclator](http://nomenclator-mobile.herokuapp.com) is a new, mobile-friendly front-end for [Perseus](http://www.perseus.tufts.edu/hopper/). I built it while learning AngularJS.

###How To Use It
Click on any word to add it to the vocabulary list. The vocab list is in the right side menu, which you can open by pulling on the text or tapping the hamburger icon. Right now, the only poem on the site is Catullus 51, but now that the interface is ready to use I'm thinking about adding more texts.

###Cool Features
- Uses AngularJS to add words to a JavaScript object and bind the object to the vocabulary list.
- The backend is a RESTful API that uses Nokogiri to look up words in [Perseus under Philologic](http://perseus.uchicago.edu/) and translate the results into a JSON object with vocabulary data.
- Lots of plugins
	- Uses [Angular-xeditable](http://vitalets.github.io/angular-xeditable/) to make vocabulary list items customizable.
	- Implement side drawer menu with Snap.js, via [angular-snap](https://github.com/jtrussell/angular-snap.js). I tried [mmenu](http://mmenu.frebsite.nl/) and [ng-mobile-menu](http://shoppinpal.github.io/ng-mobile-menu/), but Snap.js turned out to be better for complex menu items. (For instance, each of my menue items includes a form (for changing the vocabulary word.)
	- Styling done with [TopCoat](http://topcoat.io/), via [topcoat-rails](https://github.com/esampaio/topcoat-rails). This was my first time using a styling framework, and it is really convenient. 
- Uses sprites for icons.
	- I made these by hand; no TopCoat.

###To Do
- Make vocab list items editable. √
- Make it possible to re-order the list.
- Make list items collapsable. √
- Make a mobile stylesheet. √
	- or a separate mobile interface? √
- Add citations to vocabulary entries.
	
- Add error handling.
	- What should happen when the user requests a word that's not in the dictionary? √
- Fix bug where clicking on white space grabs the entire passage. √

- Download all of the texts in Perseus's library.
- Process texts into usable form.
	- Basically, every word needs its own `<span>` tag to be clickable.
- Build out site for browsing or finding texts.
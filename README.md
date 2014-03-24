##Nomenclator

Nomenclator is a new front-end for [Perseus](http://www.perseus.tufts.edu/hopper/). I built it while learning AngularJS.

###Cool Features
- Uses AngularJS to add words to a JavaScript object and bind the object to the vocabular list.
- The backend is a RESTful API that uses Nokogiri to look up words in [Perseus under Philologic](http://perseus.uchicago.edu/) and translate the results into a JSON object with vocabulary data.

###To Do
- Make vocab list items editable.
- Make it possible to re-order the list.
- Make list items collapsable.
- Make a mobile stylesheet.
	- or a separate mobile interface?
- Add citations to vocabulary entries.
	
- Add error handling.
	- What should happen when the user requests a word that's not in the dictionary?
- Fix bug where clicking on white space grabs the entire passage.

- Download all of the texts in Perseus's library.
- Process texts into usable form.
	- Basically, every word needs its own `<span>` tag to be clickable.
- Build out site for browsing or finding texts.
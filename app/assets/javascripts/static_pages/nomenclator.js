var nomenclator = angular.module("nomenclator", ["xeditable", 'shoppinpal.mobile-menu']);

nomenclator.controller("NomenclatorController", ["$scope", "$http",

function NomenclatorController($scope, $http) {
	$scope.words = [	
		{
			token: "dulce",
			lemma: "dulce",
			form: "adv. indec.",
			// partOfSpeech: "adv.",
			lemmaDefinition: "agreeably, charmingly, delightfully",
			needToCheck: false,
			expanded: false
		},
		{
			token: "ridentem",
			lemma: "rideo",
			form: "3rd sg. m. pres. act. prtcpl.",
			// partOfSpeech: "v.",
			lemmaDefinition: "to laugh",
			needToCheck: false,
			expanded: false
		}	
	];
	
	$scope.visibleState = function (wordEntry) {
		return wordEntry.expanded ? "+" : "-"
	};
	
	$scope.definition = function (wordEntry) {
		if ( wordEntry.missing && wordEntry.expanded ) {
			return "Not found"
		} else if ( wordEntry.lemma && wordEntry.expanded ) {
			return wordEntry.lemma + ": " + wordEntry.form + " " + wordEntry.lemmaDefinition
		} else if ( wordEntry.expanded ){
			return "Fetching definition; please wait."
		} else {
			return null;
		}
	};
	
	$scope.addWord = function () {
		if ( $scope.newToken == null ) {
			return;
		};
		var newWord = {
			token: $scope.newToken,
			lemma: null,
			form: null,
			lemmaDefinition: null,
			needToCheck: true,
			expanded:false
		};

		$scope.words.push(newWord);
		$scope.newToken = "";
		$scope.defineWord(newWord);
	};
	
	$scope.addClickedWord = function ($event) {
		$scope.newToken = angular.element($event.target).text().toLowerCase();
		$scope.addWord();
	};
	
	$scope.deleteWord = function (wordObject) {
		var position = $scope.words.indexOf(wordObject);
		$scope.words.splice(position, 1);
	};
	
	$scope.getDefinitions = function () {
		angular.forEach($scope.words, function (word) {
			if ( word.needToCheck ) {
				$scope.defineWord(word);
			}
		});
	};
	
	$scope.defineWord = function (wordObject) {
				apiUrl = "definitions?q=" + wordObject.token
				
				$http.get(apiUrl)
					.success(function (data, status, requestHeaders, config) {
						angular.extend(wordObject, data)
						angular.extend(wordObject, { missing: false, needToCheck: false })
					})
					.error(function (data, status, headers, config) {
						angular.extend(wordObject, { missing: true, needToCheck: false })
					})
	};
	
	$scope.updateDefinition = function (wordObject) {
		wordObject.needToCheck = true;
		$scope.defineWord(wordObject);
	};
}]);
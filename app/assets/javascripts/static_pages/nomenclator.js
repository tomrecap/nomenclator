var nomenclator = angular.module("nomenclator", ["xeditable"]);

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
			expanded: true
		},
		{
			token: "ridentem",
			lemma: "rideo",
			form: "3rd sg. m. pres. act. prtcpl.",
			// partOfSpeech: "v.",
			lemmaDefinition: "to laugh",
			needToCheck: false,
			expanded: true
		}	
	];
	
	$scope.visibleState = function (wordEntry) {
		return wordEntry.expanded ? "+" : "-"
	};
	
	$scope.definition = function (wordEntry) {
		if ( wordEntry.lemma && wordEntry.expanded ) {
			return wordEntry.lemma + ": " + wordEntry.form + " " + wordEntry.lemmaDefinition
		} else if ( wordEntry.expanded ){
			return "Fetching definition; please wait."
		} else {
			return null;
		}
	};
	
	$scope.addWord = function () {		
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
						word.needToCheck = false
					})
					.error(function (data, status, headers, config) {
						console.log("lookup failed!");
						console.log("data: ");
						console.log(data);
						console.log("status: ");
						console.log(status);
					})
	};
}]);
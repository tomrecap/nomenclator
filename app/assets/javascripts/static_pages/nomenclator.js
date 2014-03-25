var nomenclator = angular.module("nomenclator", []);

nomenclator.controller("NomenclatorController", ["$scope", "$http",

function NomenclatorController($scope, $http) {
	$scope.words = [	
		{
			token: "dulce",
			lemma: "dulce",
			form: "adv. indec.",
			// partOfSpeech: "adv.",
			lemmaDefinition: "agreeably, charmingly, delightfully",
			needToCheck: false
		},
		{
			token: "ridentem",
			lemma: "rideo",
			form: "3rd sg. m. pres. act. prtcpl.",
			// partOfSpeech: "v.",
			lemmaDefinition: "to laugh",
			needToCheck: false
		}	
	];
	
	$scope.definition = function (wordEntry) {
		if ( wordEntry.lemma ) {
			return wordEntry.lemma + ": " + wordEntry.form + " " + wordEntry.lemmaDefinition
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
			needToCheck: true
		};

		$scope.words.push(newWord);
		$scope.newToken = "";
	};
	
	$scope.addClickedWord = function ($event) {
		$scope.newToken = angular.element($event.target).text().toLowerCase();
		$scope.addWord();
	};
	
	$scope.getDefinitions = function () {
		angular.forEach($scope.words, function (word) {
			if ( word.needToCheck ) {
				apiUrl = "definitions?q=" + word.token
				
				$http.get(apiUrl)
					.success(function (data, status, requestHeaders, config) {
						angular.extend(word, data)
						word.needToCheck = false
					})
					.error(function (data, status, headers, config) {
						console.log("lookup failed!");
						console.log("data: ");
						console.log(data);
						console.log("status: ");
						console.log(status);
					})
				
			}
		});
	};
}]);
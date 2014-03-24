var nomenclator = angular.module("nomenclator", []);

nomenclator.controller("NomenclatorController", NomenclatorController);

var NomenclatorController = function ($scope, $http) {
	$scope.words = [	
		{
			token: "dulce",
			lemma: "dulce",
			partOfSpeech: "adv.",
			lemmaDefinition: "agreeably, charmingly, delightfully",
			needToCheck: false
		},
		{
			token: "ridentem",
			lemma: "rideo",
			partOfSpeech: "v.",
			lemmaDefinition: "to laugh",
			needToCheck: false
		}	
	];
	
	$scope.definition = function (wordEntry) {
		if ( wordEntry.lemma ) {
			return wordEntry.lemma + ": " + wordEntry.partOfSpeech + " " + wordEntry.lemmaDefinition
		} else {
			return null;
		}
	};
	
	$scope.addWord = function () {		
		var newWord = {
			token: $scope.newToken,
			lemma: null,
			partOfSpeech: null,
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
				$http.get("my api url")
					.success(function (data, status, requestHeaders, config) {
						console.log("success!")
						console.log("word: ");
						console.log(word);
						console.log("data: ");
						console.log(data);
						console.log("status: ");
						console.log(status);
						console.log("headers: ");
						console.log(requestHeaders);
						console.log("config: ");
						console.log(config);
					})
					.error(function (data, status, headers, config) {
						console.log("lookup failed!");
						console.log("word: ");
						console.log(word);
						console.log("data: ");
						console.log(data);
						console.log("status: ");
						console.log(status);
						console.log("headers: ");
						console.log(headers);
						console.log("config: ");
						console.log(config);
					})
				
			}
		});
	};
};
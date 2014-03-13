var rainforestApp = angular.module("rainforestApp", [])

.factory('RainforestService', ['$http', function($http) {

  return {
    status: function(apiToken, callback) {
      $http.get("/status/" + apiToken ).success(callback);
    }

  }

}])

.controller('MainCtrl', ['$scope', 'RainforestService', function($scope, RainforestService) {

  $scope.loading = true;
  
  $scope.$watch('apiToken', function() {

    RainforestService.status($scope.apiToken, function(result) {
      $scope.sites = result;
      $scope.loading = false;
    });

  });

}])
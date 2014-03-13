var rainforestApp = angular.module("rainforestApp", [])

.factory('RainforestService', ['$http', function($http) {

  return {
    status: function(apiToken, callback) {
      $http.get("/status/" + apiToken ).success(callback);
    }

  }

}])

.controller('MainCtrl', ['$scope', '$timeout', 'RainforestService', function($scope, $timeout, RainforestService) {

  $scope.loading = true;
  
  $scope.$watch('apiToken', function() {

    RainforestService.status($scope.apiToken, function(result) {
      $scope.sites = result;
      $scope.loading = false;
    });

  });

  $timeout(function() {
    window.location.reload();
  }, 2 * 60 * 1000);

}])
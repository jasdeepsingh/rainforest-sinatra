var rainforestApp = angular.module("rainforestApp", [])

.factory('RainforestService', ['$http', function($http) {

  return {
    status: function(callback) {
      $http.get("/status/token").success(callback);
    }

  }

}])

.controller('MainCtrl', ['$scope', 'RainforestService', function($scope, RainforestService) {

  $scope.loading = true;

  RainforestService.status(function(result) {
    $scope.sites = result;
    $scope.loading = false;
  });

}])
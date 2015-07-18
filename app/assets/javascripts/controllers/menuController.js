(function() {

  var app = angular.module('MenuController', []);

  app.controller('MenuController',
    function($scope, $http) {
      var url = 'http://localhost:3000/api/repos';
      $http.get(url)
        .success(function( response ) {
          $scope.repos = response;
        })
        .error(function(data) {
          console.log('server side error occured.');
        });

    }
  );

})();
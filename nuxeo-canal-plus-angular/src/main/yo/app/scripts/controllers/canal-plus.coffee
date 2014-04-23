
angular.module("nuxeoCanalPlus")

.controller("DashboardCtrl", 
['$scope','nxSession','nxNavigation','$routeParams',
($scope,nxSession,nxNavigation,$routeParams) ->
  $scope.docs = nxSession.getDocument('/').query('SELECT * FROM Document')
])


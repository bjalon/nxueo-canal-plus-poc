
angular.module("nuxeoCanalPlus")

.controller("DashboardCtrl",
['$scope','nxSession',
($scope,nxSession) ->
  #$scope.docs = nxSession.getDocument('/').query('SELECT * FROM Document')
])


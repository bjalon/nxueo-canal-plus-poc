
angular.module("nuxeoCanalPlus")

.controller("DashboardCtrl",
['$scope','nxSession','$location'
($scope,nxSession,$location) ->
  #$scope.docs = nxSession.getDocument('/').query('SELECT * FROM Document')
  
  $scope.navigate = (doc)->
    $location.path("/incident/" + doc.uid + "/view")
])


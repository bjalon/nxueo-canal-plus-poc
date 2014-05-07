angular.module("nuxeoCanalPlus")

.controller("DashboardCtrl",
['$scope','nxSession','$location','nxHeader'
($scope,nxSession,$location,nxHeader) ->
  nxHeader.selectedType = 'incident'
  
  $scope.navigate = (doc)->
    $location.path("/incident/" + doc.uid + "/view")
])

.controller("KMCtrl",
['$scope','nxSession','$location','nxHeader'
($scope,nxSession,$location,nxHeader) ->
  nxHeader.selectedType = 'km'
  
  $scope.navigate = (doc)->
    $location.path("/article/" + doc.uid + "/view")
])

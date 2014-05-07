angular.module("nuxeoCanalPlus")

.controller("PortailCtrl", 
['$scope','$http','nxSession','$location','nxHeader','nxUrl','$routeParams'
($scope,$http,nxSession,$location,nxHeader,nxUrl,$routeParams) ->
  query = "SELECT * FROM Article,Depeche WHERE know:portail ='"+$routeParams.portail+"'"
  $scope.docs = nxSession.getDocument('/').query(query)
  $scope.portailName = $routeParams.portail


  $scope.search = ()->
    query = "SELECT * FROM Article,Depeche "
    $scope.docs = nxSession.getDocument('/').query(query)

  $scope.navigate = (doc)->
    $location.path("/article/" + doc.uid + "/view")
])
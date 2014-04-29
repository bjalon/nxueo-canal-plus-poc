angular.module("nuxeoCanalPlus")

.controller("IncidentCreateCtrl", ['$scope','nxSession','$location','plateformes', 'priorite',($scope,nxSession,$location,plateformes,priorite)->
  $scope.plateformes = plateformes
  $scope.priorite = priorite
  $scope.doc = {type: "IncidentCommercial", properties:{}}

  $scope.create = ()->
    $scope.doc.name = $scope.doc.properties["dc:title"]
    $scope.doc = nxSession.createDocument("/incidents",$scope.doc).then (doc)->
      $location.path ["/incident",doc.uid,"view"].join("/")

  $scope.cancel = ()->
    $location.path("/")

  $scope.goToDashboard = ()->
    $location.path("/")


  ])
.controller("IncidentEditCtrl", ['$scope','nxSession','defaultSchemas','$routeParams','$location', 'priorite', ($scope, nxSession,defaultSchemas,$routeParams,$location,priorite)->
  $scope.priorite = priorite
  $scope.doc = nxSession.getDocument($routeParams.docId).fetch(defaultSchemas)

  $scope.goToDashboard = ()->
    $location.path("/")

  $scope.save = ()->
    $scope.doc.save().then (doc)->
      $location.path "/incident/" + doc.uid + "/view"

  $scope.cancel = ()->
    $location.path "/incident/" + doc.uid + "/view"
])

.controller("IncidentViewCtrl", ['$scope','nxSession','$routeParams','$location','defaultSchemas', 'priorite', ($scope, nxSession,$routeParams,$location,defaultSchemas, priorite)->
  $scope.priorite = priorite
  $scope.doc = nxSession.getDocument($routeParams.docId).fetch(defaultSchemas)

  $scope.edit = ()->
    $location.path "/incident/"+$scope.doc.uid+"/edit"

  $scope.goToDashboard = ()->
    $location.path("/")

  ])

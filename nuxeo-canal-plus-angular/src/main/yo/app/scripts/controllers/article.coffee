angular.module("nuxeoCanalPlus")

.controller("ArticleCreateCtrl", ['$scope','nxSession','$location','plateformes', 'priorite',($scope,nxSession,$location,plateformes,priorite)->
  $scope.plateformes = plateformes
  $scope.doc = {type: "Article", properties:{}}

  $scope.create = ()->
    $scope.doc.name = $scope.doc.properties["dc:title"]
    $scope.doc = nxSession.createDocument("/default-domain/workspaces/canal",$scope.doc).then (doc)->
      $location.path ["/article",doc.uid,"view"].join("/")

  $scope.cancel = ()->
    $location.path("/km")

  $scope.goToDashboard = ()->
    $location.path("/km")


  ])
.controller("ArticleEditCtrl", ['$scope','nxSession','defaultSchemas','$routeParams','$location', 'priorite', ($scope, nxSession,defaultSchemas,$routeParams,$location,priorite)->
  $scope.doc = nxSession.getDocument($routeParams.docId).fetch(defaultSchemas)

  $scope.goToDashboard = ()->
    $location.path("/km")

  $scope.save = ()->
    $scope.doc.save().then (doc)->
      $location.path "/article/" + doc.uid + "/view"

  $scope.cancel = ()->
    $location.path "/article/" + doc.uid + "/view"
])

.controller("ArticleViewCtrl", ['$scope','nxSession','$routeParams','$location','defaultSchemas', 'priorite', ($scope, nxSession,$routeParams,$location,defaultSchemas, priorite)->
  $scope.doc = nxSession.getDocument($routeParams.docId).fetch(defaultSchemas)
  $scope.doc.$then (doc)->
    $("#contenu").html($scope.doc.properties['know:contenu'])

  $scope.edit = ()->
    $location.path "/article/"+$scope.doc.uid+"/edit"

  $scope.goToDashboard = ()->
    $location.path("/km")

  ])

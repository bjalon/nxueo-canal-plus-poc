angular.module("nuxeoCanalPlus")

.controller("incidentAdvSearchCtrl", 
['$scope','$http','nxSession','$location','nxHeader','nxUrl'
($scope,$http,nxSession,$location,nxHeader,nxUrl) ->
  $scope.searchModel = {}


  $scope.search = ()->
    needAnd = false
    needWhere = true
    query = "SELECT * FROM IncidentCommercial,IncidentTechnique "
    if ($scope.searchModel.keyword? || !$scope.searchModel.keyword == '')
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '
      query += "ecm:fulltext = '" + $scope.searchModel.keyword + "'"
      needAnd = true
    $scope.docs = nxSession.getDocument('/').query(query)
    $scope.docs.then () ->
      $("#resultBox").attr('style','')

  $scope.navigate = (doc)->
    $location.path("/incident/" + doc.uid + "/view")
])
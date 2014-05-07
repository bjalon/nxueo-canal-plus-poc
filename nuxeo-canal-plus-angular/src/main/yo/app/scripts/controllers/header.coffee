angular.module("nuxeoCanalPlus")

.controller("HeaderCtrl", 
['$q','$http','$scope','$routeParams','$location','nxHeader','nxUrl'
($q,$http,$scope,$routeParams,$location,nxHeader,nxUrl) ->

  $scope.doSearch = () ->
    if $scope.searchTerm?
      nxHeader.searchTerm = $scope.searchTerm
      $location.path("/search/" + $scope.searchTerm)

  $scope.isActive = (tab)=>
    if tab == nxHeader.selectedType      
      return true
    else
      return false
])


.controller("SearchCtrl", 
['$q','$http','$scope','$routeParams','$location','nxHeader','nxSession','nxUrl'
($q,$http,$scope,$routeParams,$location,nxHeader,nxSession,nxUrl) ->
  nxHeader.searchTerm = $routeParams.searchTerm
  $scope.searchTerm = $routeParams.searchTerm
  needAnd = false
  needWhere = true
  query = "SELECT * FROM IncidentCommercial,IncidentTechnique,Article,Depeche "
  if ($scope.searchTerm? || !$scope.searchTerm == '')
    if needWhere
      query += ' WHERE '
      needWhere = false
    if needAnd
      query += ' AND '
    query += "ecm:fulltext = '" + $scope.searchTerm + "*'"
    needAnd = true
  $scope.docs = nxSession.getDocument('/').query(query)
  $scope.docs.then () ->
    $("#resultBox").attr('style','')

  $scope.navigateTo = (doc) ->
  	if doc.type == "IncidentCommercial" || doc.type == "IncidentTechnique"
      $location.path("/incident/" + doc.uid + "/view")
    else 
  	if doc.type == "Article" || doc.type == "Depeche"
      $location.path("/article/" + doc.uid + "/view")

  $scope.doSearch = () ->
    if $scope.searchTerm?
      $location.path("/search/" + $scope.searchTerm)

  $scope.isActive = (tab)=>
    if tab == nxHeader.selectedType      
      return true
    else
      return false
])


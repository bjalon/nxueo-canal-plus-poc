angular.module("nuxeoCanalPlus")

.controller("kmAdvSearchCtrl", 
['$scope','$http','nxSession','$location','nxHeader','nxUrl'
($scope,$http,nxSession,$location,nxHeader,nxUrl) ->
  $scope.busy = true
  url = nxUrl + "/directory/rubrique"
  $scope.rubriques = {}
  $http.get(url).then (response) -> 
    data = response.data
    if(angular.isArray(data.entries))
      $scope.rubriques = data.entries
      $('.ui.selection.rubrique.dropdown').dropdown onChange: (val) ->
        $scope.searchModel.rubrique = val
      $scope.busy = false
    else
      $scope.busy = false
      $q.reject("just because")
  $scope.theme = {}
  url = nxUrl + "/directory/theme"
  $scope.themes = {}
  $http.get(url).then (response) -> 
    data = response.data
    if(angular.isArray(data.entries))
      $scope.themes = data.entries
      $('.ui.selection.theme.dropdown').dropdown onChange: (val) ->
        $scope.searchModel.theme = val
      $scope.busy = false
    else
      $scope.busy = false
      $q.reject("just because")
  $scope.decodeurs = {}
  url = nxUrl + "/directory/Decodeur"
  $scope.decodeurs = {}
  $http.get(url).then (response) -> 
    data = response.data
    if(angular.isArray(data.entries))
      $scope.decodeurs = data.entries
      $('.ui.selection.theme.dropdown').dropdown onChange: (val) ->
        $scope.searchModel.theme = val
      $scope.busy = false
    else
      $scope.busy = false
      $q.reject("just because")


  $scope.searchModel = {}
  $(".ui.selection.portail.dropdown").dropdown onChange: (val) ->
    $scope.searchModel.portail = val

  $(".ui.selection.docType.dropdown").dropdown onChange: (val) ->
    $scope.searchModel.docType = val

  $(".ui.selection.decodeur.dropdown").dropdown onChange: (val) ->
    $scope.searchModel.decodeur = val

  $('.ui.radio.plateforme.checkbox.active').checkbox onChange: (val) ->
    alert val
    $scope.searchModel.plateforme = val



  $("#periode").kalendae
    attachTo : "periode"
    months: 2
    mode: "range"
    subscribe:
      change: (date, action) ->
        console.log date
        if $scope.searchModel.dateMin?
          if (date.isBefore($scope.searchModel.dateMin))
            $scope.searchModel.dateMax = $scope.searchModel.dateMin
            $scope.searchModel.dateMin = date
          else
            $scope.searchModel.dateMax = date
        else
          $scope.searchModel.dateMin = date
        return

  $scope.search = ()->
    needAnd = false
    needWhere = true
    query = "SELECT * FROM Article,Depeche "
    if ($scope.searchModel.dateMin? && $scope.searchModel.dateMax?)
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND ' 
      query += " dc:created BETWEEN DATE '"+Kalendae.moment($scope.searchModel.dateMin).format("YYYY-MM-DD") + "' AND DATE '"+Kalendae.moment($scope.searchModel.dateMax).format("YYYY-MM-DD")  + "'"
      needAnd = true
    else if ($scope.searchModel.dateMin?)
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '
      query += " dc:created >= DATE '"+Kalendae.moment($scope.searchModel.dateMin).format("YYYY-MM-DD") + "' "
      needAnd = true
    if ($scope.searchModel.keyword? || !$scope.searchModel.keyword == '')
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '
      query += "ecm:fulltext = '" + $scope.searchModel.keyword + "'"
      needAnd = true
    if  $scope.searchModel.portail?
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:portail = '" + $scope.searchModel.portail + "'"
      needAnd = true
    if  $scope.searchModel.docType? 
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:type = '" + $scope.searchModel.docType + "'"
      needAnd = true
    if  $scope.searchModel.decodeur?
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:decodeur = '" + $scope.searchModel.decodeur + "'"
      needAnd = true
    if  $('.plateforme input:checked').attr('id')?
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:plateforme = '" + $('.plateforme input:checked').attr('id') + "'"
      needAnd = true
    if  $scope.searchModel.rubrique?
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:rubrique = '" + $scope.searchModel.rubrique + "'"
      needAnd = true
    if  $scope.searchModel.theme?
      if needWhere
        query += ' WHERE '
        needWhere = false
      if needAnd
        query += ' AND '  
      query += "know:theme = '" + $scope.searchModel.theme + "'"
    $scope.docs = nxSession.getDocument('/').query(query)
    $scope.docs.then () ->
      $("#resultBox").attr('style','')

  $scope.navigate = (doc)->
    $location.path("/article/" + doc.uid + "/view")

])
"use strict"
angular.module("nuxeoCanalPlus", ['nxSession', 'angular-carousel'])
.value("nxUrl", "/nuxeo/api/v1" )
.value("defaultSchemas", ["dublincore", "incident", "incident_schema", "connaissance"])
.value("plateformes", [
    id: "SAT"
    label: "SAT"
  ,
    id: "ADSL"
    label: "ADSL"
  ,
    id: "TNT"
    label: "TNT"
  ,
    id: "cable"
    label: "Cable / Fibre"
  ,
    id: "cplay"
    label: "CPLAY"
  ,
    id: "pcmac"
    label: "PC / MAC"
  ,
    id: "tablette"
    label: "Tablette"
  ,
    id: "smartphone"
    label: "Smartphone"

  ])
.value("priorite", [
    id: "p1"
    label: "P1"
  ,
    id: "p2"
    label: "P2"
  ,
    id: "p3"
    label: "P3"
  ])
.factory("nxSession", ["nxSessionFactory","nxUrl",(nxSessionFactory,nxUrl)->
  nxSessionFactory(
    apiRootPath: nxUrl
  )
])
.config ($routeProvider) ->
  $routeProvider
  .when("/dashboard"
    templateUrl: "views/dashboard.html"
    controller: "DashboardCtrl"
  )
  .when("/incident/create"
    templateUrl: "views/incident_create.html"
    controller: "IncidentCreateCtrl"
  )
  .when("/incident/*docId/edit"
    templateUrl: "views/incident_create.html"
    controller: "IncidentEditCtrl"
  )
  .when("/incident/*docId/view"
    templateUrl: "views/incident_view.html"
    controller: "IncidentViewCtrl"
  )
  .when("/search/*searchTerm"
    templateUrl: "views/search.html"
    controller: "SearchCtrl"
  )
  .when("/km_advanced_search"
    templateUrl: "views/km_advanced_search.html"
    controller: "kmAdvSearchCtrl"
  )
  .when("/incident_advanced_search"
    templateUrl: "views/incident_advanced_search.html"
    controller: "incidentAdvSearchCtrl"
  )
  .when("/km"
    templateUrl: "views/km.html"
    controller: "KMCtrl"
  )
  .when("/article/*docId/view"
    templateUrl: "views/article_view.html"
    controller: "ArticleViewCtrl"
  )
  .when("/portail/*portail/"
    templateUrl: "views/portail.html"
    controller: "PortailCtrl"
  )
  .otherwise redirectTo: "/dashboard"

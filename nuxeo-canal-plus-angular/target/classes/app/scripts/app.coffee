"use strict"
angular.module("nuxeoCanalPlus", ['nxSession'])
.value("nxUrl", "/nuxeo/api/v1" )
.value("defaultSchemas", ["dublincore", "incident", "incident_schema"])
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
  .when("/search"
    templateUrl: "views/search.html"
    controller: "DashboardCtrl"
  )
  .when("/advanced_search"
    templateUrl: "views/advanced_search.html"
    controller: "DashboardCtrl"
  )

  .otherwise redirectTo: "/dashboard"

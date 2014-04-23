"use strict"
angular.module("nuxeoCanalPlus", ['nxSession'])
.value("nxUrl", "/nuxeo/api/v1" )
.value("defaultSchemas", ["dublincore"])
.factory("nxSession", ["nxSessionFactory","nxUrl",(nxSessionFactory,nxUrl)->
  nxSessionFactory(
    apiRootPath: nxUrl
  )
])
.config ($routeProvider) ->
  $routeProvider
  .when("/nav/*path/edit"
    templateUrl: "views/edit.html"
    controller: "EditCtrl"
  )
  .when("/nav/*path/new"
    templateUrl: "views/edit.html"
    controller: "CreateCtrl"
  )
  .when("/nav/*path"
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  )
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

"use strict"
angular.module("nuxeoCanalPlus", ['nxSession','ui.bootstrap','blueimp.fileupload'])
.value("nxUrl", "/nuxeo/api/v1" )
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
  .when("/incident/*id/edit"
    templateUrl: "views/incident_edit.html"
    controller: "DashboardCtrl"
  )
  .when("/incident/*id/create"
    templateUrl: "views/incident_create.html"
    controller: "DashboardCtrl"
  )
  .when("/incident/*id/view"
    templateUrl: "views/incident_view.html"
    controller: "DashboardCtrl"
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

angular.module('nuxeoCanalPlus')

.factory "nxHeader", ['$routeParams','$location',"nxUrl",($routeParams,$location,nxUrl)->
  
  class nxHeader
    constructor: ()->
      @selectedType = undefined
      @searchTerm = undefined

  return new nxHeader()
]

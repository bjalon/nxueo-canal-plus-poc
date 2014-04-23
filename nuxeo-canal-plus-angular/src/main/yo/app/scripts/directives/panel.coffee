angular.module('nuxeoCanalPlus')
.directive("nxqlpanel", ['nxSession', (nxSession)->
  directive =
    restrict: 'EA'
    transclude: true
    scope: true

    link: ($scope, element, attrs)->
      $scope.title = attrs.ptitle
      $scope.docs = nxSession.getDocument('/').query(attrs.nxql)
    templateUrl: 'views/panel.html'
    replace: true
  directive

])

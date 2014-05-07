angular.module('nuxeoCanalPlus')
.directive("nxqlpanel2", ['nxSession', (nxSession)->
  directive =
    restrict: 'EA'
    transclude: true
    scope: true
    templateUrl: 'views/depeche_panel.html'


    link: ($scope, element, attrs)->
      $scope.title = attrs.ptitle
      $scope.docs = nxSession.getDocument('/').query(attrs.nxql,5)
    replace: true

])

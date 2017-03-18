'use strict';

/**
 * @ngdoc overview
 * @name valeiMeSaoFranciscoApp
 * @description
 * # valeiMeSaoFranciscoApp
 *
 * Main module of the application.
 */
angular
  .module('valeiMeSaoFranciscoApp', [
    'ngAnimate',
    'ngResource',
    'ui.router',
    'ngSanitize'
  ])
  .config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/');
    $stateProvider
    .state('main', {
        url: '/',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
    })
    .state('about', {
        url: '/about',
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
    });
  });

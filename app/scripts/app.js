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
    .state('plot', {
        url: '/plot',
        templateUrl: 'views/plot.html'
    })
    .state('map', {
        url: '/map',
        templateUrl: 'views/map.html'
    })
    .state('about', {
        url: '/about',
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
    })
    .state('equipe', {
        url: '/equipe',
        templateUrl: 'views/equipe.html',
        controller: 'equipeCtrl'
    });;
  });

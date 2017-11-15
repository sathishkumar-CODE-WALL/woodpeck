var app = angular.module('app', ['ngRoute','simplePagination','ngSanitize']);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'views/temp.html',
        controller: 'index'
      }).

      when('/subcat/:subcatId', {
        templateUrl: 'views/subcat.html',
        controller: 'subcat'
      }).
      when('/cat/:catId', {
        templateUrl: 'views/catprod.html',
        controller: 'catprod'
      }).
      when('/about-us', {
        templateUrl: 'views/about-us.html',
        controller: 'pageabout'
      }).
      when('/finished-leather', {
        templateUrl: 'views/finshedleathers.html',
        controller: 'finshedleathers'
      }).
      otherwise({
        redirectTo: '/'
      });
	   
  }]);
  
	app.controller('index', function($scope,$http,Pagination) {			
		$http.get('cake/product/getall').success(function(data, status, headers, config) {
			console.log(data.length);

			$scope.datas=data;	
			$scope.pagination = Pagination.getNew(24);
			$scope.pagination.numPages = Math.ceil($scope.datas.length/$scope.pagination.perPage);

		});		
	});
	app.controller('catprod', function($scope,$http,$routeParams, $route, Pagination) {	
		var subcat=$routeParams.catId
		$http.get('cake/product/catprod/'+subcat).success(function(data, status, headers, config) {			
			$scope.datas=data;	
			$scope.pagination = Pagination.getNew(24);
			$scope.pagination.numPages = Math.ceil($scope.datas.length/$scope.pagination.perPage);	
			
		});		
	});
	app.controller('subcat', function($scope,$http,$routeParams, $route) {	
		var cat=$routeParams.subcatId
		$http.get('cake/product/getprod/'+cat).success(function(data, status, headers, config) {			
			$scope.datas=data;
					
		});		
	});	
	app.controller('categories', function($scope,$http) {		
		$http.get('cake/cat/getcat').success(function(data, status, headers, config) {
			$scope.datas=data;	
		});
		$scope.clickedPage = function(value){
			$scope.activeValue = value;

		};
	});
	app.controller('pageabout', function($scope,$http,$sce) {		
		$http.get('cake/admin/get_pageabout').success(function(data, status, headers, config) {			
			$scope.datas=$sce.trustAsHtml(data.about);		
		});		
	});
	
	app.controller('footercontent', function($scope,$http,$sce) {		
		$http.get('cake/admin/getpage/2').success(function(data, status, headers, config) {			
			$scope.datas=data;		
		});		
	});
	
	
	app.controller('finshedleathers', function($scope,$http,$sce, $location) {		
		$http.get('cake/admin/get_pagefinishedleather').success(function(data, status, headers, config) {			
		$scope.datas=$sce.trustAsHtml(data.about);

		});		
	});
	
	app.controller('catprod-manknit', function($scope,$http) {		
		$http.get('cake/cat/getprods/1/').success(function(data, status, headers, config) {
			$scope.mkt=data;	
		});		
	});
	
	app.controller('headcat', function($scope,$http) {		
		$http.get('cake/cat/getcat').success(function(data, status, headers, config) {
			$scope.datas=data;	
		});
		$scope.clickedPage = function(value){
			$scope.activeValue = value;

		};
	});
	
	app.controller('banner', function($scope,$location,$route) {		
	 $scope.locations = window.location;
	});
	
		
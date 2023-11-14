var myApp=angular.module("angularjs_module",['ngRoute'])

myApp.config(($routeProvider)=>{
  $routeProvider.when('/trangchu', {
           templateUrl: 'trangchu.html',
           controller: 'trangchuCtrl'      
        }).otherwise({ redirectTo: '/trangchu' }); // Đặt trang chính là '/'
  
       
  })
'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/
const api = "api"
/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')
const User = use('App/Models/User')
Route.get('/','UserController.index')
// Route.get('test', ({view}) => {
//   return view.render('pages.testpage')
// })

// Route.resource('user','UserController').except(['index','show'])
Route.resource('users','UserController').middleware(new Map([
    [['show','index'], ['test']]
  ])).validator('CreateTests')


Route.resource('product','ProductController')
Route.resource('tests','TestController').validator('CreateTests')
Route.get('/aaa','UserController.listNew').prefix('api/v1')


Route.get('login', 'UserController.login')
Route.post('login', 'UserController.postLogin')
Route.get('logout', 'UserController.logout')

Route.post('login','UserController.loginApi').prefix(api)
Route.get('user/show/:id','UserController.show1').prefix(api)

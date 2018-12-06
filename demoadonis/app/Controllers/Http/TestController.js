'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const Test = use('App/Models/Test')
/**
 * Resourceful controller for interacting with tests
 */
class TestController {
  /**
   * Show a list of all tests.
   * GET tests
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request, response, view, session }) {
    let test = await Test.all();
    // session.clear()
    console.log(session.get('username1'));
    
    return test
  }

  /**
   * Render a form to be used for creating a new test.
   * GET tests/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create ({ request, response, view }) {
    return view.render('pages.testpage')
  }

  /**
   * Create/save a new test.
   * POST tests
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response }) {
    
    console.log(request._body);
    
    // // const testInfo = request.only(['name','description'])
    // const test = new Test()
    // test.name = request._body.data.name
    // test.description = request._body.data.description
    const test = new Test()
    test.name = request._body.name
    test.description = request._body.description
    await test.save()
    return response.status(201).json(test)

    
  }

  /**
   * Display a single test.
   * GET tests/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, request, response, view }) {
  }

  /**
   * Render a form to update an existing test.
   * GET tests/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update test details.
   * PUT or PATCH tests/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response }) {
    console.log(request);
    let test = await Test.find(params.id);
    test.name = request._body.name
    test.description = request._body.description
    // return request._body.name
    test.save()
    return response.status(201).json(test)
  }

  /**
   * Delete a test with id.
   * DELETE tests/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
    console.log("kafhsdfhadfh",request.params.id);
    
    let ccc= await Test.find(request.params.id);
    ccc.delete()
    return response.status(201).json(ccc)

  }
}

module.exports = TestController

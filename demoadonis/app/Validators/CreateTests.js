'use strict'

class CreateTests {
  get rules () {
    return {
      'username' : 'required|unique:name',
      'email' : 'required',
      'password' : 'required'
    }
  }
  get message(){
    return {
      'required': '{{field}} không được bỏ trống',
      'unique': '{{field}} đã tồn tại'
    }
  }

  async fails(error) {
    this.ctx.session.witErrors(error)
    .flashAll();
    return this.ctx.response.redirect('back');
  }
}

module.exports = CreateTests

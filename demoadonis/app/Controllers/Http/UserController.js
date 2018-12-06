'use strict'

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */
const User = use('App/Models/User')
const Hash = use('Hash')
const Helpers = use('Helpers')
const Drive = use('Drive')
const { validate } = use('Validator')
/**
 * Resourceful controller for interacting with users
 */
class UserController {
    /**
     * Show a list of all users.
     * GET users
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     * @param {View} ctx.view
     */
    async index({ request, response, view, session }) {
        let ccc = await User.all();
        // return ccc;
        // console.log(ccc.username, 'hihihi');
        // session.clear()
        const abc = session.get('username')
        const abc1 = session.get('username1')
        console.log(abc, abc1);
        return view.render('pages.users.listusers', { ccc });
    }

    /**
     * Render a form to be used for creating a new user.
     * GET users/create
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     * @param {View} ctx.view
     */
    async create({ request, response, view }) {

        return view.render('pages.users.adduser')
    }

    async listNew({ request, response, view }) {



        const user = await User.find(1)
        const posts = await user.news().paginate(1)


        return posts
    }

    login({ view }) {
        return view.render('pages.login.login')
    }


    logout({ response, view, session }) {
        session.clear();
        return response.redirect('/login')
    }
    async postLogin({ request, response, view, session }) {
        try {
            const username = request._body.username
            const adults = await User.findByOrFail('username', username)
            // console.log(adults.$attributes.password);
            const isSame = await Hash.verify(request._body.password, adults.$attributes.password)

            if (isSame) {
                session.put('username', username)
                // return view.render('pages.users.listusers',{username})
                // return username
                // response.sendView('pages.users.listusers', { username: username })
                return response.redirect('users', { username })

            }
        } catch (error) {
            return response.redirect('back')
        }

    }



    async loginApi({ auth, request, response, view }) {
        const adults = await User.findByOrFail('username', request._body.username)
        // console.log(adults.$attributes.password);
        const uid = request._body.username
        const password = request._body.password

        const isSame = await Hash.verify(request._body.password, adults.$attributes.password)

        if (isSame) {

            let token = await auth.attempt(request._body.username, password)
            return response.status(200).json({ data: token, message: 'Login successfull', status: true });
        }
    }

    show1({ request, auth, params }) {
        console.log(request._qs.token);
        console.log("auth", auth.user.id);
        console.log("number", params);

        if (auth.user.id !== Number(params.id)) {
            return 'You cannot see someone else\'s profile'
        }
        return auth.user
    }

    /**
     * Create/save a new user.
     * POST users
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     */

    // async upload(nameInput,pathSave){
    //     const profilePic = request.file(nameInput, {
    //         types: ['image'],
    //         size: '2mb'
    //     })

    //     await profilePic.move(Helpers.tmpPath(pathSave), {
    //         name: profilePic.clientName,
    //         overwrite: true
    //     })
    //     if (!profilePic.moved()) {
    //         return profilePic.error()
    //     }
    // }
    async store({ request, response, view }) {
        const user = new User();
        if (!request._files.image) {
            user.username = request._body.username;
            user.email = request._body.email;
            user.password = request._body.password;

            await user.save()
            return view.render('pages.users.listusers')
        }



        const profilePic = request.file('image', {
            types: ['image'],
            size: '2mb'
        })
        // return profilePic;
        // await profilePic.move(Helpers.tmpPath('img'), {
        await profilePic.move('public/img', {
            name: new Date().getTime()+ "." + profilePic.clientName ,
            overwrite: true
        })

        if (!profilePic.moved()) {
            return profilePic.error()
        }

        user.username = request._body.username;
        user.email = request._body.email;
        user.password = request._body.password;
        user.image =new Date().getTime()+ "." + profilePic.clientName ;

        await user.save()
        // await Drive.move('img/1543998928336adonis.jpeg', 'public/img/'+user.image)
        return response.redirect('/users')
    }

    /**
     * Display a single user.
     * GET users/:id
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     * @param {View} ctx.view
     */
    async show({ params, request, response, view, session, auth }) {
        console.log(request);

        let ccc = await User.find(params.id);
        // console.log(ddd);
        // session.clear()

        return ccc;
    }

    /**
     * Render a form to update an existing user.
     * GET users/:id/edit
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     * @param {View} ctx.view
     */
    async edit({ params, request, response, view }) {
        let edit = await User.find(params.id);
        console.log(edit.id);
        return view.render('pages.users.adduser', { edit })
    }

    /**
     * Update user details.
     * PUT or PATCH users/:id
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     */


    async update({ params, request, response, view }) {

        const user = await User.find(params.id);
        // return user.image
        const imageDelete = user.image
        if (!request._files.image) {
            user.username = request._body.username
            user.email = request._body.email
            user.password = request._body.password
            await user.save()
            return response.redirect('/users')
        }

        const profilePic = request.file('image', {
            types: ['image'],
            size: '2mb'
        })
        const nameImage = new Date().getTime()+ "." + profilePic.clientName
        await profilePic.move(('public/img'), {
            name: nameImage,
            overwrite: true
        })

        if (!profilePic.moved()) {
            return profilePic.error()
        }

        user.username = request._body.username
        user.email = request._body.email
        user.password = request._body.password

        if (profilePic.clientName) { user.image = nameImage }

        await user.save()
        if(imageDelete){ await Drive.delete(('public/img/'+imageDelete))}
        return response.redirect('/users')

    }

    /**
     * Delete a user with id.
     * DELETE users/:id
     *
     * @param {object} ctx
     * @param {Request} ctx.request
     * @param {Response} ctx.response
     */
    async destroy({ params, request, response }) {
        const user = await User.find(request.params.id)
        const imageDelete = user.image
        await user.delete()
        if(imageDelete){ await Drive.delete(Helpers.tmpPath('img/'+imageDelete))}
        return response.redirect('/users')
    }
}

module.exports = UserController

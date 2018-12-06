'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class NewsSchema extends Schema {
  up () {
    this.create('news', (table) => {
      table.increments()
      table.string('name', 255).notNullable()
      table.string('description', 255).notNullable()
      table.string('slug', 100).notNullable()
      table.integer('user_id').notNullable()
      table.integer('category_id').notNullable()
      table.boolean('status').defaultTo(false)
      table.timestamps()
    })
  }

  down () {
    this.drop('news')
  }
}

module.exports = NewsSchema

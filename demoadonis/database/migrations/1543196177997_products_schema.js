'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductsSchema extends Schema {
  up () {
    this.create('products', (table) => {
      table.increments()
      table.string('product_name', 255).notNullable().unique()
      table.string('product_image', 255)
      table.string('slug', 100).notNullable()
      table.boolean('status').defaultTo(false)
      table.integer('price').notNullable()

      table.timestamps()
    })
  }

  down () {
    this.drop('products')
  }
}

module.exports = ProductsSchema

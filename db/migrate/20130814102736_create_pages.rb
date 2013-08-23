# coding: utf-8
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :page
      t.string :custom_url
      t.text :text

      t.timestamps
    end

    Page.create(title: 'Оплата и Доставка', page: 'info', custom_url: 'info', text: 'Test Text')
    Page.create(title: 'Оптовые цены', page: 'sale', custom_url: 'sale', text: 'Test Text')
  end
end

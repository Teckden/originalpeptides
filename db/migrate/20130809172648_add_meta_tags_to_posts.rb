# coding: utf-8
class AddMetaTagsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_description, :string
    add_column :posts, :meta_keywords, :string
  end

  DefaultMetaTag.create(
      title: 'Главная страница блога',
      method: 'posts_index',
      meta_keywords: 'пептиды',
      meta_description: 'купить пептиды'
  )
end

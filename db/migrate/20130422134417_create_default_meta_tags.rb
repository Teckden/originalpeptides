# coding: utf-8
class CreateDefaultMetaTags < ActiveRecord::Migration
  def change
    create_table :default_meta_tags do |t|
      t.string :meta_keywords
      t.string :meta_description
      t.string :title
      t.string :method
      t.timestamps
    end
    DefaultMetaTag.create(
        title: "Главная страница",
        method: "store_index",
        meta_keywords: "IGF-1, DSIP, Гонадорелин, Gonadorelin, Melanotan, Melanotan-2, Sermorelin, CJC-1295, PT-141, HGH, HGH 176-191, ipamorelin, MGF, PEG-MGF, механический фактор роста, GHRP-2, Thymosin Beta4, Tb-500, GHRP-6, IGF-1LR3, igflr3, игтропин, kigtropin, хайгетропин, gonadotropin, MOD GRF, igf, ифр, худеем, похудеть, накачяться, мышечьная масса, загар, загореть, сила, выносливость, восстановление, гормон роста, пептиды, пептид, peptides, peptid, инсулиноподобный фактор роста, gormon, похудеть, быстро накачаться, бысторо похудеть, спорт, диета, востоновление",
        meta_description: "Магазин спорта. Только у нас качественная продукция по самым низким ценам."
    )
    DefaultMetaTag.create(
        title: "Оплата и доставка",
        method: "store_delivery_info"
    )
  end
end

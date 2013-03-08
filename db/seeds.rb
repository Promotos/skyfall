# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(user_id: 'admin', password: 'admin', password_confirmation: 'admin', email: 'promotos@gmx.de')

HouseholdAccountCategory.create(category_id: 'Essen', category_text: 'Alles was mit Essen zu tun hat.', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Trinken', category_text: 'Alles was mit Trinken zu tun hat.', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Deko & Krams', category_text: 'Ist das Kunst oder kann das weg?', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Kleidung', category_text: 'machen Leute', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Werkzeug & Material', category_text: 'Der Laden fällt ja schon auseinander', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Hobby', category_text: 'Jeder sollte eins haben', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Drogerie', category_text: 'Dinge die jeder haben sollte', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Haushalt', category_text: 'tbd', user_id: admin.id )
HouseholdAccountCategory.create(category_id: 'Garten', category_text: 'Grünzeugs', user_id: admin.id )

HouseholdAccountShop.create(shop_id: 'Aktiv Markt', shop_text: '', user_id: admin.id )
HouseholdAccountShop.create(shop_id: 'Netto', shop_text: '', user_id: admin.id )
HouseholdAccountShop.create(shop_id: 'Aldi', shop_text: '', user_id: admin.id )
HouseholdAccountShop.create(shop_id: 'Müller', shop_text: '', user_id: admin.id )
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130621170728) do

  create_table "apariciones", :id => false, :force => true do |t|
    t.integer  "cuna_id",    :null => false
    t.datetime "momento",    :null => false
    t.integer  "canal_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "fecha"
  end

  add_index "apariciones", ["canal_id", "cuna_id", "momento"], :name => "index_apariciones_on_canal_id_and_cuna_id_and_momento", :unique => true
  add_index "apariciones", ["canal_id"], :name => "FK aparicon canal_idx"
  add_index "apariciones", ["cuna_id"], :name => "key aparicion cuna_idx"

  create_table "asuntos", :force => true do |t|
    t.text     "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "canales", :force => true do |t|
    t.string   "nombre"
    t.string   "siglas"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "description"
    t.string   "foto"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "organizacion_id"
    t.integer  "estado_id"
  end

  add_index "candidates", ["estado_id"], :name => "key_estados_idx"
  add_index "candidates", ["organizacion_id"], :name => "key_organizaciones_idx"

  create_table "candidates_cunas", :id => false, :force => true do |t|
    t.integer "candidate_id", :null => false
    t.integer "cuna_id",      :null => false
  end

  add_index "candidates_cunas", ["candidate_id", "cuna_id"], :name => "index_candidates_cunas_on_candidate_id_and_cuna_id", :unique => true
  add_index "candidates_cunas", ["candidate_id"], :name => "FK_idx"
  add_index "candidates_cunas", ["cuna_id"], :name => "FK cunas_idx"

  create_table "candidatos", :id => false, :force => true do |t|
    t.integer  "vocero_id",     :default => 0, :null => false
    t.integer  "eleccion_id",   :default => 0, :null => false
    t.integer  "municipio_id"
    t.integer  "tipo_cargo_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "candidatos", ["eleccion_id"], :name => "index_candidatos_on_eleccion_id"
  add_index "candidatos", ["municipio_id"], :name => "index_candidatos_on_municipio_id"
  add_index "candidatos", ["tipo_cargo_id"], :name => "index_candidatos_on_tipo_cargo_id"
  add_index "candidatos", ["vocero_id"], :name => "index_candidatos_on_vocero_id"

  create_table "cunas", :force => true do |t|
    t.string   "sigecup_id",       :null => false
    t.date     "sigecup_creacion"
    t.integer  "duracion"
    t.string   "video"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "organizacion_id"
    t.string   "nombre",           :null => false
    t.string   "grupo"
  end

  add_index "cunas", ["nombre"], :name => "index_cunas_on_nombre", :unique => true
  add_index "cunas", ["organizacion_id"], :name => "key_cunas_organizacion_idx"
  add_index "cunas", ["sigecup_id"], :name => "index_cunas_on_sigecup_id", :unique => true

  create_table "elecciones", :force => true do |t|
    t.date     "fecha"
    t.text     "nombre"
    t.integer  "ano"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "nombre_corto"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "estados", ["nombre"], :name => "index_estados_on_nombre", :unique => true

  create_table "informes", :force => true do |t|
    t.date     "fecha"
    t.text     "resumen"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "municipios", :force => true do |t|
    t.integer  "estado_id"
    t.text     "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "municipios", ["estado_id"], :name => "index_municipios_on_estado_id"

  create_table "organizaciones", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "nombre_corto"
    t.string   "rif"
    t.integer  "tolda_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "tipo_id"
  end

  add_index "organizaciones", ["tipo_id"], :name => "FK tipo_idx"
  add_index "organizaciones", ["tolda_id"], :name => "FK tolda_idx"

  create_table "temas", :force => true do |t|
    t.text     "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "nombre",      :null => false
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tipos", ["nombre"], :name => "index_tipos_on_nombre", :unique => true

  create_table "tipos_cargos", :force => true do |t|
    t.text     "nombre"
    t.text     "nombre_corto"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "toldas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "voceros", :force => true do |t|
    t.integer  "organizacion_id"
    t.text     "nombre"
    t.text     "foto"
    t.text     "descripcion"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "voceros", ["organizacion_id"], :name => "index_voceros_on_organizacion_id"

  create_table "websites", :force => true do |t|
    t.text     "url"
    t.text     "nombre"
    t.text     "descripcion"
    t.text     "logo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end

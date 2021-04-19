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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210418220246) do

  create_table "Alunos", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "nascimento"
    t.integer  "celular",           limit: 8
    t.string   "genero"
    t.string   "meio_de_pagamento"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "faturas", force: :cascade do |t|
    t.float    "valor_da_fatura"
    t.date     "vencimento"
    t.integer  "matricula_id"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["matricula_id"], name: "index_faturas_on_matricula_id"
  end

  create_table "instituicao_de_ensinos", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.float    "valor_total"
    t.integer  "quantidade_de_faturas"
    t.integer  "vencimento"
    t.string   "curso"
    t.integer  "instituicao_de_ensino_id"
    t.integer  "aluno_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["instituicao_de_ensino_id"], name: "index_matriculas_on_instituicao_de_ensino_id"
  end

end

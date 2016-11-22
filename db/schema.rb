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

ActiveRecord::Schema.define(version: 20161119125321) do

  create_table "BusinessPartner", primary_key: "partner_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "nama"
    t.string  "alamat"
    t.string  "telp",   limit: 100
    t.string  "fax",    limit: 100
    t.string  "kontak"
    t.string  "email",  limit: 200
    t.integer "plevel"
  end

  create_table "Cabang", primary_key: "cabang_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "kode",   limit: 5
    t.string "alamat", limit: 150
    t.string "kota",   limit: 100
    t.string "telp",   limit: 100
    t.string "email",  limit: 100
    t.string "kontak", limit: 100
  end

  create_table "Departemen", primary_key: "dep_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "kode",       limit: 10
    t.string "nama",       limit: 150
    t.string "keterangan", limit: 200
  end

  create_table "ErpLog", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "dateAndTime"
    t.string "action"
    t.string "status"
  end

  create_table "Finishing", primary_key: "finish_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama",       limit: 100
    t.string "keterangan", limit: 150
  end

  create_table "Inquery", primary_key: "inquery_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "noQuotation", limit: 20
    t.date   "tanggal"
    t.bigint "sales_id"
    t.bigint "project_id"
    t.bigint "prodspec_id"
    t.bigint "stanspec_id"
    t.bigint "finish_id"
    t.bigint "kontrator"
    t.bigint "konsultan"
    t.string "alamat",      limit: 200
    t.bigint "cabang"
    t.bigint "quotation"
    t.index ["cabang"], name: "FKD7CB12A35911AA6B", using: :btree
    t.index ["finish_id"], name: "FKD7CB12A317E81717", using: :btree
    t.index ["konsultan"], name: "FKD7CB12A3D1BEA5AA", using: :btree
    t.index ["kontrator"], name: "FKD7CB12A3D3443967", using: :btree
    t.index ["prodspec_id"], name: "FKD7CB12A3CA79E23B", using: :btree
    t.index ["project_id"], name: "FKD7CB12A310513BB", using: :btree
    t.index ["quotation"], name: "FKD7CB12A3204CAB79", using: :btree
    t.index ["sales_id"], name: "FKD7CB12A31B38EFF8", using: :btree
    t.index ["stanspec_id"], name: "FKD7CB12A3A2728028", using: :btree
  end

  create_table "Jenis", primary_key: "jenis_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama", limit: 50
  end

  create_table "POInternal", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date    "tglPo"
    t.bigint  "quotation_id"
    t.string  "poNumber",           limit: 25
    t.string  "poCustomer",         limit: 25
    t.integer "approveByMarketing", limit: 1
    t.integer "approveByFinance",   limit: 1
    t.integer "approveByFactory",   limit: 1
    t.index ["quotation_id"], name: "FK3DEBC5DC13C6769B", using: :btree
  end

  create_table "Price", primary_key: "price_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "kode",     limit: 100
    t.bigint "jenis_id"
    t.bigint "unit_id"
    t.float  "harga",    limit: 53
    t.index ["jenis_id"], name: "FK49CC129F3FC8D7B", using: :btree
    t.index ["unit_id"], name: "FK49CC12996B0DA39", using: :btree
  end

  create_table "PriceListMarketing", primary_key: "pricelist_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "produk_id"
    t.bigint "cabang_id"
    t.float  "price",     limit: 53
    t.index ["cabang_id"], name: "FK84FA647F494D0539", using: :btree
    t.index ["produk_id"], name: "FK84FA647F831329D9", using: :btree
  end

  create_table "ProductSpecification", primary_key: "prodspec_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama",       limit: 150
    t.string "keterangan", limit: 200
  end

  create_table "Produk", primary_key: "produk_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "kode"
    t.string "nama"
    t.float  "weight",   limit: 53
    t.bigint "price_id"
    t.float  "stockLE",  limit: 53
    t.float  "stockLI",  limit: 53
    t.index ["price_id"], name: "FK8EFE244DA6BD9FB", using: :btree
  end

  create_table "Project", primary_key: "project_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama",     limit: 150
    t.bigint "owner_id"
    t.index ["owner_id"], name: "FK50C8E2F9ABD50EB0", using: :btree
  end

  create_table "Quotation", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date    "tglQuotation"
    t.string  "noQuotation",       limit: 18
    t.integer "revise"
    t.bigint  "spdcf_id"
    t.string  "matrial",           limit: 100
    t.float   "length",            limit: 53
    t.float   "thickness",         limit: 53
    t.string  "paymentTerm",       limit: 100
    t.string  "price",             limit: 100
    t.string  "loco",              limit: 100
    t.string  "positionMatrial",   limit: 100
    t.string  "delivery",          limit: 100
    t.string  "validityStock",     limit: 100
    t.date    "validityPrice"
    t.float   "vat",               limit: 53
    t.integer "status"
    t.integer "statusDesc"
    t.float   "marginMinimum",     limit: 53
    t.integer "direkturKeuangan"
    t.integer "direkturMarketing"
    t.integer "assistenDirektur"
    t.integer "marketingManager"
    t.integer "canProceedToPO"
    t.index ["spdcf_id"], name: "FK1EE3B56CCFE46E5B", using: :btree
  end

  create_table "Spdcf", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "inquery_id"
    t.bigint  "customer_id"
    t.string  "alamatPengiriman",       limit: 150
    t.date    "tglSdpcf"
    t.date    "tglKonfirmbyProduksi"
    t.date    "tglKonfirmbyFinance"
    t.string  "note",                   limit: 150
    t.string  "transportation",         limit: 100
    t.float   "ppn",                    limit: 53
    t.string  "validityPrice",          limit: 100
    t.string  "validityStockLE",        limit: 100
    t.integer "productionTime",         limit: 1
    t.integer "productionTimeDays"
    t.integer "productionCondition",    limit: 1
    t.integer "finishing"
    t.integer "finishingDays"
    t.integer "deliveryMode",           limit: 1
    t.string  "deliveryModeDesc",       limit: 100
    t.integer "deliveryTime",           limit: 1
    t.integer "deliveryTimeDays"
    t.integer "wasKonfirmByProduction", limit: 1
    t.integer "wasKonfirmByFinance",    limit: 1
    t.index ["customer_id"], name: "FK4C60C2ADF13EDA5", using: :btree
    t.index ["inquery_id"], name: "FK4C60C2A9F6FFB7B", using: :btree
  end

  create_table "StandartSpecification", primary_key: "stanspec_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama",       limit: 150
    t.string "keterangan", limit: 200
  end

  create_table "USER_", primary_key: "user_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username",      limit: 20
    t.string "password",      limit: 20
    t.bigint "departemen_id"
    t.bigint "cabang_id"
    t.string "nama",          limit: 100
    t.string "alamat",        limit: 150
    t.string "telp",          limit: 50
    t.string "email",         limit: 100
    t.index ["cabang_id"], name: "FK4D495F4494D0539", using: :btree
    t.index ["departemen_id"], name: "FK4D495F42D923B59", using: :btree
  end

  create_table "Unit", primary_key: "unit_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama", limit: 100
  end

  create_table "branches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "branch_code",  limit: 5
    t.string   "address",      limit: 150
    t.string   "city",         limit: 50
    t.string   "phone_number", limit: 20
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "department_code", limit: 4
    t.string   "department_name", limit: 20
    t.string   "description",     limit: 200
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "password",        limit: 14
    t.string   "first_name",      limit: 14
    t.string   "last_name",       limit: 14
    t.string   "phone_number",    limit: 20
    t.string   "email_address",   limit: 50
    t.integer  "department_id"
    t.integer  "branch_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
    t.index ["branch_id"], name: "index_employees_on_branch_id", using: :btree
    t.index ["department_id"], name: "index_employees_on_department_id", using: :btree
  end

  create_table "inquery_item", primary_key: ["inquery_id", "id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "inquery_id", null: false
    t.bigint  "produk_id"
    t.integer "jumlah"
    t.integer "id",         null: false
    t.index ["inquery_id"], name: "FK1816FB0F9F6FFB7B", using: :btree
    t.index ["produk_id"], name: "FK1816FB0F831329D9", using: :btree
  end

  create_table "poin_items", primary_key: ["po_id", "id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "po_id",                 null: false
    t.bigint  "produk_id"
    t.integer "jumlah"
    t.float   "price_hpp", limit: 53
    t.string  "note",      limit: 150
    t.integer "id",                    null: false
    t.index ["po_id"], name: "FK2830C725293EA4D6", using: :btree
    t.index ["produk_id"], name: "FK2830C725831329D9", using: :btree
  end

  create_table "produk_material", primary_key: ["produk_id", "id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "produk_id",   null: false
    t.bigint  "material_id"
    t.integer "jumlah"
    t.integer "id",          null: false
    t.index ["material_id"], name: "FK8F6740F9290B229F", using: :btree
    t.index ["produk_id"], name: "FK8F6740F9831329D9", using: :btree
  end

  create_table "quotation_items", primary_key: ["quoation_id", "id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "quoation_id",              null: false
    t.bigint  "produk_id"
    t.integer "jumlah"
    t.float   "price_finance", limit: 53
    t.float   "price_list",    limit: 53
    t.float   "disc",          limit: 53
    t.integer "id",                       null: false
    t.index ["produk_id"], name: "FK2530874D831329D9", using: :btree
    t.index ["quoation_id"], name: "FK2530874D2F2C285D", using: :btree
  end

  create_table "spdcf_items", primary_key: ["spdcf_id", "id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint  "spdcf_id",             null: false
    t.bigint  "produk_id"
    t.integer "jumlah"
    t.float   "price_hpp", limit: 53
    t.float   "margin",    limit: 53
    t.string  "note"
    t.integer "id",                   null: false
    t.index ["produk_id"], name: "FK9583678B831329D9", using: :btree
    t.index ["spdcf_id"], name: "FK9583678BCFE46E5B", using: :btree
  end

  add_foreign_key "Inquery", "BusinessPartner", column: "konsultan", primary_key: "partner_id", name: "FKD7CB12A3D1BEA5AA"
  add_foreign_key "Inquery", "BusinessPartner", column: "kontrator", primary_key: "partner_id", name: "FKD7CB12A3D3443967"
  add_foreign_key "Inquery", "Cabang", column: "cabang", primary_key: "cabang_id", name: "FKD7CB12A35911AA6B"
  add_foreign_key "Inquery", "Finishing", column: "finish_id", primary_key: "finish_id", name: "FKD7CB12A317E81717"
  add_foreign_key "Inquery", "ProductSpecification", column: "prodspec_id", primary_key: "prodspec_id", name: "FKD7CB12A3CA79E23B"
  add_foreign_key "Inquery", "Project", column: "project_id", primary_key: "project_id", name: "FKD7CB12A310513BB"
  add_foreign_key "Inquery", "Quotation", column: "quotation", name: "FKD7CB12A3204CAB79"
  add_foreign_key "Inquery", "StandartSpecification", column: "stanspec_id", primary_key: "stanspec_id", name: "FKD7CB12A3A2728028"
  add_foreign_key "Inquery", "USER_", column: "sales_id", primary_key: "user_id", name: "FKD7CB12A31B38EFF8"
  add_foreign_key "POInternal", "Quotation", column: "quotation_id", name: "FK3DEBC5DC13C6769B"
  add_foreign_key "Price", "Jenis", column: "jenis_id", primary_key: "jenis_id", name: "FK49CC129F3FC8D7B"
  add_foreign_key "Price", "Unit", column: "unit_id", primary_key: "unit_id", name: "FK49CC12996B0DA39"
  add_foreign_key "PriceListMarketing", "Cabang", column: "cabang_id", primary_key: "cabang_id", name: "FK84FA647F494D0539"
  add_foreign_key "PriceListMarketing", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK84FA647F831329D9"
  add_foreign_key "Produk", "Price", column: "price_id", primary_key: "price_id", name: "FK8EFE244DA6BD9FB"
  add_foreign_key "Project", "BusinessPartner", column: "owner_id", primary_key: "partner_id", name: "FK50C8E2F9ABD50EB0"
  add_foreign_key "Quotation", "Spdcf", column: "spdcf_id", name: "FK1EE3B56CCFE46E5B"
  add_foreign_key "Spdcf", "BusinessPartner", column: "customer_id", primary_key: "partner_id", name: "FK4C60C2ADF13EDA5"
  add_foreign_key "Spdcf", "Inquery", column: "inquery_id", primary_key: "inquery_id", name: "FK4C60C2A9F6FFB7B"
  add_foreign_key "USER_", "Cabang", column: "cabang_id", primary_key: "cabang_id", name: "FK4D495F4494D0539"
  add_foreign_key "USER_", "Departemen", column: "departemen_id", primary_key: "dep_id", name: "FK4D495F42D923B59"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "departments"
  add_foreign_key "inquery_item", "Inquery", column: "inquery_id", primary_key: "inquery_id", name: "FK1816FB0F9F6FFB7B"
  add_foreign_key "inquery_item", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK1816FB0F831329D9"
  add_foreign_key "poin_items", "POInternal", column: "po_id", name: "FK2830C725293EA4D6"
  add_foreign_key "poin_items", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK2830C725831329D9"
  add_foreign_key "produk_material", "Produk", column: "material_id", primary_key: "produk_id", name: "FK8F6740F9290B229F"
  add_foreign_key "produk_material", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK8F6740F9831329D9"
  add_foreign_key "quotation_items", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK2530874D831329D9"
  add_foreign_key "quotation_items", "Quotation", column: "quoation_id", name: "FK2530874D2F2C285D"
  add_foreign_key "spdcf_items", "Produk", column: "produk_id", primary_key: "produk_id", name: "FK9583678B831329D9"
  add_foreign_key "spdcf_items", "Spdcf", column: "spdcf_id", name: "FK9583678BCFE46E5B"
end

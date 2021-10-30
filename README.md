# プロジェクトの作成
logを取りそこねたので、コマンドのみ
```
username@pcname project % rails _6.0.0_ new action_text_app -d mysql
```

# データベースの作成

データベースのエンコーディング変更

ファイル：config/database.yml
```
  encoding: utf8
```
データベースの作成
```
username@pcname action_text_app % rails db:create
Created database 'action_text_app_development'
Created database 'action_text_app_test'
```
# Gemfile　の変更

scaffoldで簡単にページを作りたいだけなので不要なjbuilderをコメントアウトする。
そしてActionTextはActiveStorageを使用するのでimage_processingを有効にする。

ファイル：Gemfile
```
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
```

```
username@pcname action_text_app % bundle install
```


# ActionText インストール
```
username@pcname action_text_app % rails action_text:install
Copying actiontext.scss to app/assets/stylesheets
      create  app/assets/stylesheets/actiontext.scss
Copying fixtures to test/fixtures/action_text/rich_texts.yml
      create  test/fixtures/action_text/rich_texts.yml
Copying blob rendering partial to app/views/active_storage/blobs/_blob.html.erb
      create  app/views/active_storage/blobs/_blob.html.erb
Installing JavaScript dependencies
         run  yarn add trix@^1.2.0 @rails/actiontext@^6.0.4-1 from "."
yarn add v1.22.15
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
warning " > webpack-dev-server@4.3.1" has unmet peer dependency "webpack@^4.37.0 || ^5.0.0".
warning "webpack-dev-server > webpack-dev-middleware@5.2.1" has unmet peer dependency "webpack@^4.0.0 || ^5.0.0".
[4/4] 🔨  Building fresh packages...
success Saved lockfile.
success Saved 2 new dependencies.
info Direct dependencies
├─ @rails/actiontext@6.1.4
└─ trix@1.3.1
info All dependencies
├─ @rails/actiontext@6.1.4
└─ trix@1.3.1
✨  Done in 6.77s.
Adding trix to app/javascript/packs/application.js
      append  app/javascript/packs/application.js
Adding @rails/actiontext to app/javascript/packs/application.js
      append  app/javascript/packs/application.js
Copied migration 20211027014600_create_active_storage_tables.active_storage.rb from active_storage
Copied migration 20211027014601_create_action_text_tables.action_text.rb from action_text
```

# ActionText データベース作成
```
username@pcname action_text_app % rails db:migrate:status
Schema migrations table does not exist yet.
username@pcname action_text_app % rails db:migrate
== 20211027014600 CreateActiveStorageTables: migrating ========================
-- create_table(:active_storage_blobs, {})
   -> 0.0246s
-- create_table(:active_storage_attachments, {})
   -> 0.0283s
== 20211027014600 CreateActiveStorageTables: migrated (0.0530s) ===============

== 20211027014601 CreateActionTextTables: migrating ===========================
-- create_table(:action_text_rich_texts)
   -> 0.0263s
== 20211027014601 CreateActionTextTables: migrated (0.0263s) ==================
username@pcname action_text_app % rails db:migrate:status

database: action_text_app_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20211027014600  Create active storage tablesactive storage
   up     20211027014601  Create action text tablesaction text
```

# サクッとページの作成（ex: blog)
logを取りそこねたので、コマンドのみ
```
username@pcname action_text_app % rails g scaffolod blog
username@pcname action_text_app % rails db:migrate
username@pcname action_text_app % rails db:migrate:status

database: action_text_app_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20211027014600  Create active storage tablesactive storage
   up     20211027014601  Create action text tablesaction text
   up     20211027015440  Create blogs

```


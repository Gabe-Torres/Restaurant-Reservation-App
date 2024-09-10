<div align="center">
    <h1> Restaurant Reservation App :bento: </h1>
</div>

![GitHub issues](https://img.shields.io/github/issues/Gabe-Torres/Restaurant-Reservation-App.svg)
![GitHub issues closed](https://img.shields.io/github/issues-closed/Gabe-Torres/Restaurant-Reservation-App.svg)
![Pull request](https://img.shields.io/github/issues-pr/Gabe-Torres/Restaurant-Reservation-App.svg)
![Pull request closed](https://img.shields.io/github/issues-pr-closed/Gabe-Torres/Restaurant-Reservation-App.svg)

[![website down](https://img.shields.io/website-up-down-green-red/http/monip.org.svg)](https://restaurant--reservation--app-d95952ee056a.herokuapp.com/)

![Made with Ruby on Rails](https://img.shields.io/badge/Made%20with-Ruby%20on%20Rails-%23990000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Made with Ruby](https://img.shields.io/badge/Made%20with-Ruby-%23990000?style=for-the-badge&logo=ruby&logoColor=white)


Technologies used:<br>
<div>
  <img src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E" />
</div>

---

</div>

<p> This Reservations App is a web application designed to manage customer reservations. It allows host to make new reservations, view existing reservations, and see detailed information about each reservation, including the customer's name, party size, reservation time, and assigned table.
</p>

<details>
<summary>Made by: </summary>

### 
- Gabe Torres [![GitHub](https://img.shields.io/badge/-GitHub-grey?style=flat&logo=github&logoColor=white)](https://github.com/Gabe-Torres) [![LinkedIn](https://img.shields.io/badge/-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/gabe-torres-74a515269/)<br><br>
</details>


--- 

## Summary 
- [Important Links](#important-links)
- [Getting Started](#getting-started)
- [Routes](#routes)
- [Test Suite](#test-suite)

## Important Links
- [Deployed site](https://restaurant--reservation--app-d95952ee056a.herokuapp.com/)


## Getting Started
<details>
<summary>Database Information</summary>

**Schema**

```ruby
ActiveRecord::Schema[7.1].define(version: 2024_09_07_182524) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservation_tables", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_tables_on_reservation_id"
    t.index ["table_id"], name: "index_reservation_tables_on_table_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.integer "party_size"
    t.datetime "reservation_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.integer "capacity"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservation_tables", "reservations"
  add_foreign_key "reservation_tables", "tables"
end
```

**Gems**
```ruby

ruby "3.2.2"

gem "rails", "~> 7.1.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"


gem 'bootstrap', '~> 5.3.1'
gem 'sassc-rails'

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "pry-rails"
  gem "annotate"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "rubocop-rails", require: false
  gem "capybara"
end

group :development do
  gem "web-console"
end
```

**Installing**
 - Fork and clone this repo
  - Run `bundle install`
  - Run `rails db:{create,migrate,seed}`
  - Run `rails s` to start the server
  - Open your browser and navigate to `localhost:3000`
</details>

## Routes

| Action | Route |
| ----------- | ----------- |
| Create Reservation | 'POST /reservations' |
| Show Existing Reservations | 'GET /reservations' |


## Test Suite
 - run `bundle exec rspec` to run the test suite

<summary>Success and Error</summary>

<h2> Success </h2> 

![Example](https://github.com/user-attachments/assets/b5a84fa7-ff37-4faf-95fa-5cd86297b998)

<h2> Failure </h2> 

![Example](https://github.com/user-attachments/assets/59674726-4fdc-45d0-bf89-243927ce909e)



</details>

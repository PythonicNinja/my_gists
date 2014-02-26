## My Gists

* Ruby version + gemset: **2.1.1@my_gists**
* System dependencies: [RVM](http://rvm.io/rvm/install),
 SQLite, [Heroku Toolbeit](https://toolbelt.heroku.com/)
* Configuration:
```
bundle install --without production [--local | --path=$HOME/.gems]
```

* Database creation:

```
rake db:migrate
```

* How to run the test suite
```
rake db:migrate RAILS_ENV=test
rspec
```

## Chrome dla aplikacji – Bootstrap

Dopisujemy do *Gemfile* dwa gemy:

```ruby
gem 'sass-rails', '4.0.1'
gem 'bootstrap-sass', '3.1.1.0'
```

Dodajemy plik *app/assets/styleshets/custom.css.scss* o zawartości:

```scss
$font-size-base: 18px;
$line-height-base: 1.6;

@import "bootstrap";

body {
  padding-top: 60px;
}
```

**Uwaga:** Musimy usunąć wygenerowany plik *scaffold.css*
który będzie nadpisywał wszystkie bootstrapowe ustawienia.

Wszystkie zmienne są opisane na stronie Bootstrapa
w sekcji [Less variables](http://getbootstrap.com/customize/#less-variables)

Przerabiamy layot aplikacji dodając panel nawigacyjny
ze strony [Getting started](http://getbootstrap.com/getting-started/)
z przykładu [Starter template](http://getbootstrap.com/examples/starter-template/).


## Wdrażanie aplikacji na Heroku

Dopisujemy do pliku *Gemfile*:

```ruby
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end
```

i uaktualniamy *Gemfile.lock*:


```bash
bundle install --without production
git commit -a -m "uaktualniono Gemfile.lock (Heroku)"
```

Wdrażanie zaczynamy od założenia sobie konta na [Heroku](http://www.heroku.com/).

Po założeniu konta logujemy się na Heroku:

```bash
heroku login
```

Tworzymy nową aplikację na Heroku:

```bash
# cd do katalogu z aplikacją MyGists
heroku create
  Creating desolate-ocean-2038... done, stack is cedar
  http://desolate-ocean-2038.herokuapp.com/ | git@heroku.com:desolate-ocean-2038.git
  Git remote heroku added
```

Wdrażamy aplikację na Heroku:

```bash
git push heroku master
```

Tworzymy bazę danych na Heroku:

```bash
heroku run bin/rake db:migrate
```

Jeśli wszystkie polecenia wykonały się bez błędów,
to aplikacja działa pod url wypisanym przez polecenie *create* powyżej:

```bash
heroku open                               # lub wchodzimy na stronę
http://desolate-ocean-2038.herokuapp.com/
```

Zmieniamy nazwę aplikacji:

```bash
heroku rename herring  # nazwa cod jest już zajęta
```


## Wdrażanie aplikacji na Shelly Cloud

Dla studentów Uniwersytetu Gdańskiego, biorących udział w przedmiocie
Architektura Serwisów Internetowych, Shelly Cloud udostępnia darmowe
konta na potrzeby zaliczenia przedmiotu. O szczegóły należy pytać
prowadzącego lub kontaktować się mailowo z Maciejem Małeckim
(smefju@shellycloud.com) **przed** założeniem konta.

 * Zakładamy konto na [Shelly Cloud](https://shellycloud.com/sign_up).
 * Instalujemy gem `shelly`

```bash
 $ gem install shelly
```

 * Logujemy się na wcześniej utworzone konto

```bash
 $ shelly login
```

 * Tworzymy nową chmurę

```bash
 $ shelly add
```

 * Dodajemy gem dla bazy PostgreSQL oraz zależności dla Shelly Cloud

```ruby
# Gemfile

gem 'pg'
gem 'shelly-dependencies'
```

i uruchamiamy `bundle install`

 * Wdrażamy aplikację na Shelly Cloud

```
 $ git add Gemfile Gemfile.lock Cloudfile
 $ git commit -m "Added Cloudfile for Shelly Cloud."
 $ git push shelly master
```

 * Otwieramy naszą aplikację w przeglądarce

```
 $ shelly open # lub po prostu https://nazwa-applikacji.shellyapp.com/
```

# Users
@barvis = User.find_by(email: "barvis@awesome.com")
@barvis ||= User.create(email: "barvis@awesome.com", password: "123456")
@sally = User.find_by(email: "sally@awesome.com")
@sally ||= User.create(email: "sally@awesome.com", password: "123456")


# Currencies
#TCDLDN
# Twilio::REST::Cliebnt.new(account_sid, auth_token)

@gbp = Currency.find_or_create_by(name: "Pounds", exchange_rate: 1.0, ease_of_use: 100)
@eur = Currency.find_or_create_by(name: "Euro", exchange_rate: 0.84, ease_of_use: 90)
@usd = Currency.find_or_create_by(name: "US Dollar", exchange_rate: 0.79, ease_of_use: 90)
# Switzerland
@franc = Currency.find_or_create_by(name: "Franc", exchange_rate: 0.78, ease_of_use: 90)
# Norway
@krone = Currency.find_or_create_by(name: "Krone", exchange_rate: 0.78, ease_of_use: 90)
# Poland
@zl = Currency.find_or_create_by(name: "Zloty", exchange_rate: 0.19, ease_of_use: 40)
# Czech Republic
@koruna = Currency.find_or_create_by(name: "Koruna", exchange_rate: 0.031, ease_of_use: 40)
# Hungary
@forint = Currency.find_or_create_by(name: "Forint", exchange_rate: 0.0027, ease_of_use: 40)
# Bulgaria
@lev = Currency.find_or_create_by(name: "Lev", exchange_rate: 0.43, ease_of_use: 35)
# Romania
@leu = Currency.find_or_create_by(name: "Leu", exchange_rate: 0.19, ease_of_use: 35)
# Croatia
@kuna = Currency.find_or_create_by(name: "Kuna", exchange_rate: 0.11, ease_of_use: 30)
# Russia
@ruble = Currency.find_or_create_by(name: "Ruble", exchange_rate: 0.012, ease_of_use: 30)
# Pakistan
@rupee = Currency.find_or_create_by(name: "Rupee", exchange_rate: 0.0075, ease_of_use: 10)
# Syria
@syrian = Currency.find_or_create_by(name: "Syrian Pound", exchange_rate: 0.0037, ease_of_use: 10)

# Locations
@uk = Location.find_or_create_by(name: "UK", currency: @gbp)
@us = Location.find_or_create_by(name: "US", currency: @usd)
@germany = Location.find_or_create_by(name: "Germany", currency: @eur)
@poland = Location.find_or_create_by(name: "Poland", currency: @zl)
@czech = Location.find_or_create_by(name: "Czech Republic", currency: @koruna)
@hungary = Location.find_or_create_by(name: "Hungary", currency: @forint)
@syria = Location.find_or_create_by(name: "Syria", currency: @syrian)

# Character Bases

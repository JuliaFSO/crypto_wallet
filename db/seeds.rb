spinner = TTY::Spinner.new("Creating mining types")
spinner.auto_spin

MiningType.create!([
    { description: "Proof of Work", acronym: "PoW" },
    { description: "Proof of Stake", acronym: "PoS" },
    { description: "Proof of Capacity", acronym: "PoC" }
  ])

spinner.success("Mining types created successfully.")

spinner = TTY::Spinner.new("Creating coins")
spinner.auto_spin


30.times do
  Coin.create!( 
    description: Faker::CryptoCoin.coin_name,
    acronym: Faker::CryptoCoin.acronym,
    url_image: Faker::CryptoCoin.url_logo,
    mining_type: MiningType.all.sample
  )
end

spinner.success("Coins created successfully.")
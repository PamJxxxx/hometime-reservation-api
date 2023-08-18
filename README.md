<h2 align="center">
  <img width="849" alt="Screenshot 2023-08-18 at 10 29 33 PM" src="https://github.com/PamJxxxx/hometime-reservation-api/assets/142566654/6dd37a32-673b-4cb6-bad9-9d9e8693071b">
  <br/>
  <br/>
  Hometime: Reservation API Assessment
</h2>

## Getting Started

- [Package versions and gems →](#package-versions)
- [Installation instructions →](#installation-instructions)
- [Documentation →](#documentation)

<h2 id="package-versions"> Package Versions and Gems </h2>

#### Ruby version
```bash
▶ cat .ruby-version
3.1.4
```

#### Database used: Postgresql
```bash
▶ psql --version
psql (PostgreSQL) 15.4 (Homebrew)
```

<h2 id="installation-instructions"> Installation Instructions </h2>

#### Clone repository
```bash
git clone https://github.com/PamJxxxx/hometime-reservation-api.git .
```

#### Install gems
```bash
bundle install
```

#### Postgresql installation (Using homebrew)
```bash
brew install postgresql@15
```

<h2 id="documentation"> Documentation </h2>

#### API Reservation endpoint (POST request)
```
api/v1/reservations
```

#### Sample payload
```
{
  "reservation": {
    "code": "USERBBBB090909",
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 43,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "userb@bnb.com",
    "guest_first_name": "Booking ASD",
    "guest_last_name": "Com",
    "guest_phone_numbers": ["639123456789", "639123456789"],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4300.00"
    }
}
```

<video src="https://github.com/PamJxxxx/hometime-reservation-api/assets/142566654/ee645534-2986-4d13-aead-81ba7cf78e15">





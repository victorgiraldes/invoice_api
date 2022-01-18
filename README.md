# Stack
- Ruby 2.6.6
- Rails 6.0.4.4
- Sqlite3

# How to Run Project ?

# Setup Project
- Clone or Fork this project

- For create database and tables
```bash
rake db:create db:migrate
```

- For view received emails
```bash
gem install maicatcher
```

# Run Project
- `rails s` to start the server
- `mailcacher` for run mailcacher

# Run tests
- `rake rspec` for run test suite

# Endpoints
## Users
```bash
- POST /users/registrations
- params: { email: 'test@test.com' }
```

```bash
- GET /users/verify_token
- params: { token: 'HEynmsrTd0' }
```


## Invoices

```bash
- POST /invoices
- params: { number: '10', date: 2020-12-25, company_info: 'company informations', charge_info: 'charge informations', price_cents: '10' }
```
```bash
- GET /invoices
```

```bash
- GET /invoices/:id
- params: { id: 1 }
```

```bash
- DELETE /invoices/:id
- params: { id: 1 }
```

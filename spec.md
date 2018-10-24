# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project (I used rails)
- [x] Include at least one has_many relationship (User has_many Books)
- [x] Include at least one belongs_to relationship (Book belongs_to Author)
- [x] Include at least one has_many through relationship (User has_many Authors through Books)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (Book has user submittable title, description, genres)
- [x] Include reasonable validations for simple model objects (users, books, artists, genres must all have names, user must have password, password must be 6 or more characters)
- [x] Include a class level ActiveRecord scope method (Book.search(query) at /books)
- [x] Include signup (bcrypt authentication or Omniauth)
- [x] Include login (bcrypt authentication or Omniauth)
- [x] Include logout (bcrypt authentication or Omniauth)
- [x] Include third party signup/login (OmniAuth)
- [x] Include nested resource show or index (users/2/books)
- [x] Include nested resource "new" form (/books/:book_id/loans/new)
- [x] Include form display of validation errors (/books/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

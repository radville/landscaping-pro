# README

The Landscaping-Pro web app allows users to view upcoming appointments with landscapers, as well as find landscapers near them. Landscapers can also make account where they can manage and create appointments with these users. 

Created in Ruby 2.6.1. 

### How to use

Visit the live site at https://landscaping-pro.herokuapp.com/. 

To join as a landscaper who can create appointments with clients, click "Join as a pro". You'll be promted to enter your information, which will show up on the "View Lawn Specialists" page. Click "Edit Profile" to change any of your information. To create appointments with clients, click "Create Appointment" and select the user and appointment details.

To join as a client, click "Sign up". You can either create a new account, or log in with your Google credentials. Click "Find Lawn Specialist" to search for landscapers by service. You can click "request an appointment" to generate an email to that landscaper. You can also edit and view your profile details with "View Profile" and "Edit Profile".

### Installing

To get a development environment running:

1. Clone this repo to your local machine with `https://github.com/radville/landscaping-pro` 

2. Run `bundle install` to add all gems from the Gemfile

3. Create and initialize the postgres database by running `rails db:create` and then `rails db:migrate`

4. Load the development site by entering `rails s` in the terminal. Navigate to `http://localhost:3000` to view the website.



## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used


## Contributing

1. Fork this repo

2. Clone the repo to your local machine with `https://github.com/radville/landscaping-pro`

3. Make your edits!

4. Create a new pull request


## Authors

* **Laura Radville** - *Initial work* - (https://github.com/radville/)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
# Ease-Address(Back End)

This is a api server that saves Mexican addresses to keep track of them. The Api includes the login and user creation, as well as authentication for each user.

This back end server works for the [project](https://github.com/JAAR91/easy-address-front), you can check the front end part of the code made with javascript.

## Built With

- Ruby on Rails
- RSpect testing framework
- Git and Github pages
- VSCode

## Deployment Live Demo

Deployed with Heroku:
To use it you need the main link: 
  - https://jaar-easy-address.herokuapp.com/api/v1/

Then for each end point you only need to add the rest of the link:
 - Create new users "user/new/", method: POST
 - To login a user "login", method: POST
 - To get all addresses "address", method: GET
 - To create a new address "address/new". method: POST
 - To update and address "address/update/id" where id is the address id, method:PATCH
 - To delete and address "address/delete/id" where id is the address id, method: DELETE

 ## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- IDE to edit and run the code (We use Visual Studio Code 🔥).
- [Node.js](https://nodejs.org/en/download/) already downloaded.
- Webpack - [click here to getting started](https://webpack.js.org/guides/getting-started/).

### Install

To get a local copy up and running follow these simple example steps.
- Open terminal
- Clone this project using the command
```
git clone git@github.com:Emmanuelaaron/carBooking.git
```
- Select the folder
```
cd carbooking
```
- To install all project dependencies run:
```
npm install
```
Then type on your terminal :
```
bundle install
```
Now to run the server you need to run the rails server and the development server. To do that first type on the terminal:
```
rails s
```
### Testing
```
bundle exec rspec
```

👨‍💻 **Jose Alberto Arriaga Ramos**

- GitHub: [@jaarkira](https://github.com/jaarkira )
- Twitter: [@91_jaar](https://twitter.com/91_jaar )
- LinkedIn: [Jose Arriaga](https://www.linkedin.com/in/jaar/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/DanSam5K/Webflix-Index/issues).

## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- Hat tip to anyone whose code was used 🔰
- Inspiration 💘
- Microverse program ⚡
- Our standup team 🏹
- Our family's support 🙌

## 📝 License

This project is [MIT](./LICENSE) licensed.
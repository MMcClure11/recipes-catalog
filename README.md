# Sinatra Recipes Catalog App

## Overview

- [About The Project](#about)
- [Getting Started](#starting)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

## <a id="about">About the Project</a>

This project allows a user to perform basic CRUD functionality on recipes with cooking time, serving size, ingredients, instructions, and categories. They can view their recipes in an alphabetized list or organized by the categories they belong to.

## <a id="starting">Getting Started</a>

To get the application started run shotgun in your terminal and then go to your browser and open "http://localhost:9393".

## <a id="prerequisites">Prerequisites</a>

This is an example of what you you need to use the software and how to install them.
<br>
bundle install<br>
rake console<br>
rake db:migrate<br>

## <a id="installation">Installation</a>

1. Clone the repo
  <br>git clone https://github.com/MMcClure11/recipes-catalog.git
2. Install the gemfile packages
  <br>bundle install
3. Created a secrets.rb file and enter your ENV variables:
  <br>ENV['SESSION_SECRET'] = "YOUR_OWN_PASSWORD_HERE"

## <a id="contributing">Contributing</a>

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

## <a id="license">License</a>

Distributed under the MIT License. See LICENSE for more information.
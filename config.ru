require_relative './config/env'

use Rack::MethodOverride

use CategoriesController
use SessionsController
use RecipesController
use UsersController
run ApplicationController
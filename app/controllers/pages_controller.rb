class PagesController < ApplicationController
  def home
<<<<<<< HEAD
=======
    @posts = Blog.all
    @skills = Skill.all
>>>>>>> model-generator
  end

  def about
  end

  def contact
  end
end

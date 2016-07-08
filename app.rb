require 'sinatra/base'
require 'faker'




class Demo < Sinatra::Application

  class Course
    attr_reader :name, :limit, :students, :id

    def initialize(name, limit, id)
      @name, @limit = name, limit
      @students = []
      @teacher = nil
      @id = id
    end

    def add_student(student)
      @students << student
    end

  end

  class Student
    attr_reader :name, :about

    def initialize(name, about)
      @name, @about = name, about
    end
  end


  class School
    attr_accessor :courses

    def initialize
      @courses = []
    end

  end

  school = School.new
  
  6.times do |i|
    course = Course.new( Faker::University.name, rand(20..30), i )
    10.times do
      course.add_student( Student.new(Faker::Name.name, Faker::Lorem.paragraph) )
    end
    school.courses << course
  end



  before do
    headers "Content-Type" => "text/html; charset=utf-8"
  end


  get '/' do
    @courses = school.courses
    haml :index
  end

  get '/:course_id' do
    @course = school.courses[ params[:course_id].to_i ]
    haml :course_show
  end

  get '/:course_id/:student_id' do
    @student = school.courses[ params[:course_id].to_i ].students[ params[:student_id].to_i ]
    haml :student_show
  end

  get '/new' do
    @title = "New comment"
  end
end

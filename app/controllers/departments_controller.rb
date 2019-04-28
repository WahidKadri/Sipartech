class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    @communes = Commune.all
  end
end

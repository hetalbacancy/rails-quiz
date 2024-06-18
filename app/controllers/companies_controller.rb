class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update]

  def index
    @companies = Company.page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def create
    @company =  Company.new(company_attributes)
    if @company.save
      redirect_to companies_path, notice: 'Successfully created entry'
    else
      render :new, alert: 'Unsuccessfully created entry'
    end
  end

  def edit
  end

  def update
    if @company.update(company_attributes)
      redirect_to companies_path, notice: 'Successfully updated entry'
    else
      render :edit, alert: 'Unsuccessfully updated entry'
    end
  end

  private

  def company_attributes
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end

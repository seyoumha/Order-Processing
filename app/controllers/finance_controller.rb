class FinanceController < ApplicationController
  before_action :authenticate

  def index  
    check_role(:finance)  

    if params[:aasm_state]
      @orders = Order.where(aasm_state: params[:aasm_state])
    else
      @orders = Order.created
    end
  end

  def approve_by_finance
    order = Order.find(params[:id])
    order.finance_approve!
    redirect_to finance_path
  end
  
  def failure
    order = Order.find(params[:id])
    order.fail!
    redirect_to finance_path
  end
end

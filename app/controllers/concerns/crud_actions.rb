module CrudActions
  extend ActiveSupport::Concern


  def index
    actual_modal = get_model_constant

    all_record = actual_modal.all

    instance_variable_set("@#{controller_name}", all_record)
  end



  def create
    obj_record = get_model_constant.new(model_params)
    debugger
  end



  private
  def get_model_constant
    controller_name.classify.constantize
  end

  def model_params
    send("#{controller_name}_param")
  end
end

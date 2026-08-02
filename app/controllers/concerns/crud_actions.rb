module CrudActions
  extend ActiveSupport::Concern

  def index
    all_record = get_model_constant.all

    instance_variable_set("@#{controller_name}", all_record)
  end



  def create
    obj_record = get_model_constant.new(model_params)
    if obj_record.save!
      render json: { success: true, data: obj_record }, status: :created
    end
  end


  def show
    obj_record = get_model_constant.find(params[:id])
    instance_variable_set("@#{controller_name.singularize}", obj_record)
  end


  private
  def get_model_constant
    controller_name.classify.constantize
  end

  def model_params
    send("#{controller_name}_param")
  end
end

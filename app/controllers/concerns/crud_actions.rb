module CrudActions
  extend ActiveSupport::Concern


  def index
    actual_modal = controller_name.classify.constantize

    all_record = actual_modal.all

    instance_variable_set("@#{controller_name}", all_record)
  end
end

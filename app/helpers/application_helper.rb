module ApplicationHelper
  def alert_for(flash_type)
    {
      :success => 'alert-siccess',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end 
end

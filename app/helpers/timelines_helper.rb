module TimelinesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_timelines_path
    elsif action_name == 'edit'
      timeline_path
    end
  end

  def current_timeline
    @current_timeline ||= Timeline.find_by(id: session[:timeline_id])
  end
end

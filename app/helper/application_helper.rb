module ApplicationHelper

  def rescue_exception(e, request_id = nil, params = {}, notify=true)
    logger.error("Error Occured: #{e.message}")
    logger.error("Error Backtrace: #{e.backtrace.join("\n")}")
    ExceptionNotifier.notify_exception(e, :data => {:request_id => request_id, :machine => Socket.gethostname, :payload => params}) if true?notify
  end

  def true?(flag=nil)
    %w(True true Yes yes).include? flag.to_s
  end

  def false?(flag=nil)
    return true if flag.nil?
    %w(False false No no).include? flag.to_s
  end

end

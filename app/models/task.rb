class Task < ActiveRecord::Base
  def progress_forward

  end

  def progress_back

  end

  def return_done_status
    case self.done
    when true
      return "done"
    when false
      return "not-done"
    end
  end
end

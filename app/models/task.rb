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

  def finish_unfinish
    case self.done
    when true
      self.unfinish
    when false
      self.finish
    end
    self.save
  end

  def finish
    self.done = true
  end

  def unfinish
    self.done = false
  end
end

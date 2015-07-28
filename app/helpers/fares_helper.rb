module FaresHelper
  def peak_status
    now = Time.now
    if (1..5).cover? now.wday
      return :peak if ((Time.parse("4:30") < now && now < Time.parse("9:30"))) || ((Time.parse("15:00") < now && now < Time.parse("19:00")))
    else # Sa, Su
      return :peak if Time.parse("0:00") < now && now < Time.parse("4:00")
    end
    return :off_peak
  end
end
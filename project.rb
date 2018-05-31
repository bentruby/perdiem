class Project

  attr_accessor :cityCostType, :startDate, :endDate, :projectDays

  def initialize(cityCostType, startDate, endDate)

    @cityCostType = cityCostType.downcase
    @startDate    = startDate
    @endDate      = endDate
    @projectDays  = buildProjectDays

  end

  private

  def buildProjectDays

    ((Date.parse @startDate).to_date .. (Date.parse @endDate).to_date).collect{ |day| day}

  end


end
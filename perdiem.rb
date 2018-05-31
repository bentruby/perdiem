class Perdiem

  require "json-schema"

  def schema
    {
      'title'=> 'Projects',
      'type'=> 'array',
      'items'=> {
        'title'=> 'Project',
        'type'=> 'object',
        'properties'=> {
          'cityCostType'=> {
              'type'=> 'string',
              'pattern'=> /High|Low/i
          },
          'startDate'=> {
              'type'=> 'string',
              'format'=> 'date-time'
          },
          'endDate'=> {
              'type'=> 'string',
              'format'=> 'date-time'
          },
        },
          'required'=> [
              'cityCostType',
              'startDate',
              'endDate'
          ]
      }
    }

  end

  attr_accessor :projects, :reimburstment

  LOWTRAVELRATE  = 45
  HIGHTRAVELRATE = 55
  LOWFULLRATE    = 75
  HIGHFULLRATE   = 85

  def initialize(json)

    errors = JSON::Validator.fully_validate(self.schema, json)

    raise "JSON Schema Validation Failed: \n" + errors.join("\n") if errors.any?

    @projects = []
    JSON.parse(json).each do |project|
      @projects << Project.new(project['cityCostType'], project['startDate'], project['endDate'])
    end

    @reimburstment = buildReimburstment

  end

  private

  def buildReimburstment

    #merge the days of the project together
    #don't replace duplicate days of high cost
    days = {}
    @projects.each do |project|
      project.projectDays.each do |projectDay|
        days[projectDay] = project.cityCostType unless days.key?(projectDay) and days[projectDay] == 'high'
      end
    end

    #determine reimburstment
    #find travel days along the way
    reimburstment = 0

    days.keys.each do |day|

      puts day
      puts days.key?(day-1)
      puts days.key?(day+1)
      if days.key?(day-1) and days.key?(day+1)
        #no gap. full day
        reimburstment += days[day] == 'low' ? Perdiem::LOWFULLRATE : Perdiem::HIGHFULLRATE
      else
        #gap, first, or last. travel day
        reimburstment += days[day] == 'low' ? Perdiem::LOWTRAVELRATE : Perdiem::HIGHTRAVELRATE
      end

    end

    reimburstment

  end

end
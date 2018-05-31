# perdiem

You have a set of projects, and you need to calculate a reimbursement amount for the set. Each project has a start date and an end date. The first day of a project and the last day of a project are always "travel" days. Days in the middle of a project are "full" days. There are also two types of cities a project can be in, high cost cities and low cost cities. 

A few rules:
First day and last day of a project, or sequence of projects, is a travel day.

Any day in the middle of a project, or sequence of projects, is considered a full day.

If there is a gap between projects, then the days on either side of that gap are travel days.

If two projects push up against each other, or overlap, then those days are full days as well.

Any given day is only ever counted once, even if two projects are on the same day.


A travel day is reimbursed at a rate of 45 dollars per day in a low cost city.

A travel day is reimbursed at a rate of 55 dollars per day in a high cost city.

A full day is reimbursed at a rate of 75 dollars per day in a low cost city.

A full day is reimbursed at a rate of 85 dollars per day in a high cost city.

## Test Cases
Set 1:

Project 1: Low Cost City Start Date: 9/1/15 End Date: 9/3/15
#### expected value: 165

Set 2:

Project 1: Low Cost City Start Date: 9/1/15 End Date: 9/1/15

Project 2: High Cost City Start Date: 9/2/15 End Date: 9/6/15

Project 3: Low Cost City Start Date: 9/6/15 End Date: 9/8/15
#### expected value: 590

Set 3:

Project 1: Low Cost City Start Date: 9/1/15 End Date: 9/3/15

Project 2: High Cost City Start Date: 9/5/15 End Date: 9/7/15

Project 3: High Cost City Start Date: 9/8/15 End Date: 9/8/15
#### expected value: 445

Set 4:

Project 1: Low Cost City Start Date: 9/1/15 End Date: 9/1/15

Project 2: Low Cost City Start Date: 9/1/15 End Date: 9/1/15

Project 3: High Cost City Start Date: 9/2/15 End Date: 9/2/15

Project 4: High Cost City Start Date: 9/2/15 End Date: 9/3/15
#### expected value: 185

## Running Test Cases Manually
Set 1:

ruby runner.rb '[{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-03T00:00:00Z"}]'

Set 2:

ruby runner.rb '[{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-01T00:00:00Z"},{"cityCostType":"HIGH","startDate":"2015-09-02T00:00:00Z","endDate":"2015-09-06T00:00:00Z"},{"cityCostType":"LOW","startDate":"2015-09-06T00:00:00Z","endDate":"2015-09-08T00:00:00Z"}]'

Set 3:

ruby runner.rb '[{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-03T00:00:00Z"},{"cityCostType":"HIGH","startDate":"2015-09-05T00:00:00Z","endDate":"2015-09-07T00:00:00Z"},{"cityCostType":"HIGH","startDate":"2015-09-08T00:00:00Z","endDate":"2015-09-08T00:00:00Z"}]'

Set 4:

ruby runner.rb '[{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-01T00:00:00Z"},{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-01T00:00:00Z"},{"cityCostType":"HIGH","startDate":"2015-09-02T00:00:00Z","endDate":"2015-09-02T00:00:00Z"},{"cityCostType":"HIGH","startDate":"2015-09-02T00:00:00Z","endDate":"2015-09-03T00:00:00Z"}]'

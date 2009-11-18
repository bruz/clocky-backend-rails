Given /^the following projects:$/ do |projects|
  Project.create!(projects.hashes)
end

When /^I choose to "([^\"]*)" the (\d+)(?:st|nd|rd|th) project$/ do |action, pos|
  visit projects_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link action
  end
end

Then /^I should see the following projects:$/ do |projects|
  projects.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end

Then /^I should see an entry for the new work session$/ do
  date_today = Time.now.strftime("%m/%d/%Y")
  response.should contain(date_today)
end


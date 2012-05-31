Feature: Admin UI


    Scenario: Partner edit form for partner 1
      Given the following partner exists:
        | id | name                |
        |  1 | Standard UI Partner |
      When I go to the partner edit page for the first partner
      Then I should see a field for "Name"
      And I should see a field for "Organization"
      And I should see a field for "Email"
      And I should not see a field for "Whitelabeled CSS"
      And I should not see a field for "Ask for RTV email opt-in"
      And I should not see a field for "Ask for RTV SMS opt-in"
      And I should not see a field for "Ask for RTV Volunteers"
      And I should not see a field for "Ask for partner email opt-in"
      And I should not see a field for "Ask for partner SMS opt-in"
      And I should not see a field for "Ask for partner Volunteers"
  

    Scenario: Partner edit form for partner != 1
      Given the following partner exists:
        | id | name                |
        |  2 | Standard UI Partner |
      When I go to the partner edit page for that partner
      Then I should see a field for "Name"
      And I should see a field for "Organization"
      And I should see a field for "Email"
      And I should see a field for "Whitelabeled CSS"
      And I should see a field for "Ask for RTV email opt-in"
      And I should see a field for "Ask for RTV SMS opt-in"
      And I should see a field for "Ask for RTV Volunteers"
      And I should see a field for "Ask for partner email opt-in"
      And I should see a field for "Ask for partner SMS opt-in"
      And I should see a field for "Ask for partner Volunteers"
  
  
    Scenario: Uploading a zip to create new partners
      When I go to the admin dashboard
      Then I should see a field for "Upload partner-creation zip file"
      When I upload the "four_good_partners.zip" zip file
      And I press "Upload"
      Then I should be on the admin dashboard
      And I should see "CSV Partner 1"
      And I should see "CSV Partner 2"
      And I should see "CSV Partner 3"
      And I should see "CSV Partner 4"
    
    
    Scenario: Uploading a zip with missing required assets
     When I go to the admin dashboard
     And I upload the "missing_csv.zip" zip file
     And I press "Upload"
     Then I should be on the admin dashboard
     And I should see "The CSV file is missing"
    

    Scenario: Uploading a zip with an invalid partner record
      When I go to the admin dashboard
      And I upload the "invalid_partners.zip" zip file
      And I press "Upload"
      Then I should be on the admin dashboard
      And I should see "Row 1 is invalid"
      And I should see "Row 2 is invalid"
      And I should see "Row 3 is invalid"
      And I should see "Row 4 is whitelabeled and missing application.css in /partner_4"
      And I should see "Row 4 is whitelabeled and missing registration.css in /partner_4"    
Feature: Create Admin Category
  As a blog administrator
  In order to maintain the order in topics
  I want to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create a category
    Given I am on the admin categories page
    When I fill in "category_name" with "Foobar"
    And I fill in "category_description" with "Lorem Ipsum"
    And I fill in "category_keywords" with "GooBar"
    And I press "Save"
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
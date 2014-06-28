Feature: Merge Articles
  As a blog administrator
  In order to void multiple similar articles
  I want to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
      | id  | title    | body         |
      | 2   | Foobar   | LoremIpsum   |
      | 3   | Foobar 2 | LoremIpsum 2 |

  Scenario: Successfully merge articles
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have body "LoremIpsum LoremIpsum 2" 
    #And show me the page

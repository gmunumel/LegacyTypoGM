Feature: Cannot Merge Articles
  As a non-admin user 
  I cannot merge two articles

  Background:
    Given the blog is set up
    And I am logged as a non-admin user 
    And the following articles exist
     | id  | title    | body        |  author     | user_id | published_at |
     | 3   | Foobar   | LoremIpsum  | publisher   | 2       | '2014-06-30' |

  Scenario: A non-admin cannot merge two articles 
    Given I am on the article page for "Foobar"
    Then I should not see "Merge Articles"
    #And show me the page

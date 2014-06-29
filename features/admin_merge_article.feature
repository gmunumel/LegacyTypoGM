Feature: Merge Articles
  As a blog administrator
  In order to void multiple similar articles
  I want to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
     | id  | title    | body         |  author   | allow_comments | published_at |
     | 2   | Foobar   | LoremIpsum   | Foo       | true           | '2014-06-30' |
     | 3   | Foobar 2 | LoremIpsum 2 | Goo       | true           | '2014-06-30' |
    And the following comments exist
     | id  | article_id | title     | body          |  author   |
     | 1   | 2          | FoobarC   | LoremIpsumC   | Foo       |
     | 2   | 3          | FoobarC 2 | LoremIpsumC 2 | Goo       |


  Scenario: Admin can merge two articles 
    Given I am on the admin page 
    And I should see "Articles" on "Dashboard"
    And I should see "New Article" on "Dashboard"
    #And show me the page

  Scenario: Successfully merge articles by body
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have body "LoremIpsum LoremIpsum 2" 
    #And show me the page

  Scenario: Successfully merge articles by author
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have author "Foo" 
    #And show me the page

  Scenario: Successfully merge articles by title
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should see "Foobar"
    #And show me the page

  Scenario: Successfully merge articles by comment 
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar 2" should have comment "LoremIpsumC"
    #And show me the page


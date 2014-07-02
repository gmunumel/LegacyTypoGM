Feature: Merge Articles
  As a blog administrator
  In order to void multiple similar articles
  I want to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
     | id  | title    | body         |  author   | allow_comments | published_at |
     | 3   | Foobar   | LoremIpsum   | Foo       | true           | '2014-06-30' |
     | 4   | Foobar 2 | LoremIpsum 2 | Goo       | true           | '2014-06-30' |
     | 5   | Foobar 3 | LoremIpsum 3 | Hoo       | true           | '2014-06-30' |
     | 6   | Foobar 4 | LoremIpsum 4 | Ioo       | true           | '2014-06-30' |
    And the following comments exist
     | id  |  title     | body          |  author   |
     | 1   | Foobar     | LoremIpsumC   | Foo       |
     | 2   | Foobar 2   | LoremIpsumC_2 | Goo       |

  Scenario: Admin can merge two articles 
    Given I am on the admin page 
    And I should see "Articles" on "Dashboard"
    And I should see "New Article" on "Dashboard"
    #And show me the page

  Scenario: Successfully merge articles by body
    Given I am on the article page for "Foobar"
    And I fill in "merge_with" with "4"
    #And show me the page
    And I press "Merge"
    Then the article "Foobar Foobar 2" should have body "LoremIpsum LoremIpsum 2" 
    #And show me the page

  Scenario: Successfully merge articles by author
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then the article "Foobar Foobar 2" should have author "Goo" 
    #And show me the page

  Scenario: Successfully merge articles by title
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should see "Foobar Foobar 2"
    #And show me the page

  Scenario: Successfully merge articles by comment 
    Given I am on the article page for "Foobar"
    #And show me the page
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I follow "Comments"
    And I follow "Foobar Foobar 2"
    And I should see "LoremIpsumC"
    And I should see "LoremIpsumC_2"
    #And show me the page

  Scenario: Successfully merge articles with one comment v1
    Given I am on the article page for "Foobar 2"
    #And show me the page
    And I fill in "merge_with" with "5"
    And I press "Merge"
    Then I follow "Comments"
    And I follow "Foobar 2 Foobar 3"
    And I should see "LoremIpsumC_2"
    #And show me the page
    #And I should not see "LoremIpsumC"
    #And show me the page

  Scenario: Successfully merge articles with one comment v2
    Given I am on the article page for "Foobar 3"
    #And show me the page
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I follow "Comments"
    And I follow "Foobar 3 Foobar 2"
    And I should see "LoremIpsumC_2"
    #And I should not see "LoremIpsumC"
    #And show me the page

  Scenario: Successfully merge articles with no comments
    Given I am on the article page for "Foobar 3"
    #And show me the page
    And I fill in "merge_with" with "6"
    And I press "Merge"
    Then I follow "Comments"
    And I should not see "Foobar 3 Foobar 4"
    #And show me the page

Feature: Cannot Merge Articles
  As a non-admin user 
  I cannot merge two articles

  Background:
    Given the blog is set up
    And I am logged as a non-admin user 
    And the following articles exist
     | id  | title    | body         |  author   | allow_comments | published_at |
     | 2   | Foobar   | LoremIpsum   | Foo       | true           | '2014-06-30' |
     | 3   | Foobar 2 | LoremIpsum 2 | Goo       | true           | '2014-06-30' |
    And the following comments exist
     | id  | article_id | title     | body          |  author   |
     | 1   | 2          | FoobarC   | LoremIpsumC   | Foo       |
     | 2   | 3          | FoobarC 2 | LoremIpsumC 2 | Goo       |

  Scenario: A non-admin cannot merge two articles 
    Given I am on the admin page  
    And I should not see "Articles" on "Dashboard"
    And I should not see "New Article" on "Dashboard"
    #And show me the page

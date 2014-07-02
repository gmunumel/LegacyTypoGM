Given /^the following articles exist$/ do |table|  
  @article = []
  table.hashes.each do |item|
    art = Article.new item
    @article << art
    art.save!
  end
end  

Given /^the following comments exist$/ do |table|  
  Comment.create table.hashes.map { |i| i.merge(article: @article[i["article_id"].to_i - 3]) }
end  

Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|    
  Article.find_by_title(title).body.should eq body
end

Then /^the article "(.*?)" should have author "(.*?)"$/ do |title, author| 
  Article.find_by_title(title).author.should eq author 
end

Then /^the article "(.*?)" should have comment "(.*?)"$/ do |title, comment| 
  Comment.find_by_article_id(Article.find_by_title(title).id).comment.should eq comment 
end

Then /^(?:|I )should see "([^"]*)" on "([^"]*)"$/ do |e1, e2|
  
  if page.body.respond_to? :should
    page.body.should =~ /#{e2}.*#{e1}/m
  else
    assert_no_match(/#{e2}.*#{e1}/m, page.body)
  end
end

Then /^(?:|I )should not see "([^"]*)" on "([^"]*)"$/ do |e1, e2|
  
  if page.body.respond_to? :should
    page.body.should_not =~ /#{e2}.*#{e1}/m
  else
    assert_match(/#{e2}.*#{e1}/m, page.body)
  end
end

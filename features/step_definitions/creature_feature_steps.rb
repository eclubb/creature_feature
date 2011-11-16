def string_to_model(namespace, model_name)
   namespace = namespace.camelize.singularize
   model = model_name.camelize.singularize
   "#{namespace}::#{model}".constantize
end

Given /^there are no (?:installed )?(\w*)? ?(\w*)$/ do |namespace, model_name|
  model = string_to_model(namespace, model_name)
  model.delete_all
end

Then /^(?:(?:there should be)|(?:I should have)) ((?:[0-9]+)|(?:some)|(?:no)) (\w*)? ?(\w*)$/ do |count, namespace, model_name|
  count = 0 if count == 'no'

  model = string_to_model(namespace, model_name)

  if count == 'some'
    model.count.should > 0
  else
    model.count.should == count.to_i
  end
end

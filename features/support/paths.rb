module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /the list of "?([^"]*)"?/
      send("admin_#{$1}_path")

    else
      begin
        page_name =~ /^the (.*) page/
        path_components = $1.split(/\s+/)
        path = path_components.push('path').join('_').to_sym
        self.send(path)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path (tried '#{path}').\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

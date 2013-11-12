# AFMotion+Rocket

Use [Rocket](http://rocket.github.io) in RubyMotion

## Usage

```ruby
@client = AFMotion::... # create your client

@client.subscribe("http://myendpoint.com/updates") do |json_patch_operations|

  json_patch_operations.each do |json_patch|
    if json_patch['add']
      @resources << json_patch['value']
    else
      # handle other cases
    end
  end

end
```

## Install

1. `gem install afmotion-rocket`

2. `require 'afmotion-rocket'` or add to your `Gemfile`

## Contact

Clay Allsopp ([http://clayallsopp.com](http://clayallsopp.com))

- [http://twitter.com/clayallsopp](http://twitter.com/clayallsopp)
- [clay@usepropeller.com](clay@usepropeller.com)

## License

AFMotion+Rocket is available under the MIT license. See the LICENSE file for more info.
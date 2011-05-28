#!/usr/bin/env ruby
html = '
<html>
  <head>
    <title>HTML lexer</title>
  </head>
  <body>
    <img src="test.jpg" alt="test image"/>
    <p class="intro">Hello lexer</p>
  </body>
</html>
'

#Parse `contents` as `tag_name` and `attrs`.
def parse_tag(contents)
  tag_name = contents.split(/\s/)[0]
  attrs = {}
  # Extract all name value pairs.
  # Look for attributes in single, double or no quotes.
  key = /\s+ (.+?) \s* = \s*/x
  val = /(['"]) ([^\2]+?) \2/x
  attr_pat = /#{key} #{val}/x
  contents.scan(attr_pat) {|k, quote, v| attrs[k] = v }
  return [tag_name.to_sym, attrs]
end


# Breaks the html `src` into tokens.
# `src` must support `each_line` enumeration.
def lexer(src)
  Enumerator.new do |y|
    in_tag = false
    last_char = ''
    contents = ''
    type = :text

    # The source might be huge. Parse it line by line.
    src.each_line do |line|
      0.upto(line.size - 1) do |i|
        if not in_tag
          if line[i] == '<'
            # yield last content when a new tag starts.
            if contents.size > 0
              y << [type, contents]
              contents = ''
            end
            type = :tag_start
            in_tag = true
          else
            contents << line[i]
          end
        elsif in_tag
          if line[i] == '>'
            # Set correct type for self-closing
            # tags viz. <img src=... />
            type = :tag_nc if last_char == '/'
            y << [type, parse_tag(contents)]
            in_tag = false
            type = :text
            contents = ''
          elsif line[i] == '/'
            type = :tag_end if last_char == '<'
          else
            contents << line[i]
          end
        end
        # Keep track of the last character.
        # This is used to figure out the tag type.
        last_char = line[i] unless line[i] =~ /\s/
      end
    end
  end
end

lexer(html).each {|h| print h, "\n" }

# Copyright (c) 2010 Michael Dvorkin
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the Simplified BSD License (also
# known as the "2-Clause License" or "FreeBSD License".)
#
# This program is distributed in the hope that it will be useful,
# but without any warranty; without even the implied warranty of
# merchantability or fitness for a particular purpose.

module PitTest
  module Note

    def should_not_segfault
      `#{@pit} p -c test`
      `#{@pit} t -c test`
      (1..12).each do |i|
        `#{@pit} n -c note#{i}`
      end
      (1..6).each do |i|
        `#{@pit} n -d #{i}`
      end
      `#{@pit} n -c note13`
      `#{@pit} l`.should.match /created note 13/m
    end

    def should_handle_all_notes
      `#{@pit} p -c test`
      `#{@pit} t -c test`
      (1..128).each do |n|
        `#{@pit} n -c note#{n}`
        `#{@pit} n -e #{n} xxx`
      end
    end

  end
end

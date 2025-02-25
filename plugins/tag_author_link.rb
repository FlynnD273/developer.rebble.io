# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Creates a link to a blog post author page and uses their full name when known.
class TagAuthorLink < Liquid::Tag
  def initialize(tag_name, text, tokens)
    super
    @text = text
  end

  def render(context)
    author_name = context[@text]
    site = context.registers[:site]
    author = site.data['authors'][author_name]
    if author
      url = "#{site.baseurl}/blog/authors/#{author_name}/"
      "<a href=\"#{url}\">#{author['name']}</a>"
    else
      author_name
    end
  end
end

Liquid::Template.register_tag('author_link', TagAuthorLink)

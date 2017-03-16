module Cloudwalk
  class About
    def self.run
      puts self.string
    end

    def self.string
      <<EOF
cloudwalk/#{Cloudwalk::VERSION}

cloudwalk (v#{Cloudwalk::VERSION}) is the command line tool of CloudWalk.io
it helps you to gain control over your payment applications.
For more information go to http://cloudwalk.io/cli

Copyright © #{Time.now.year} CloudWalk

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Happy hacking!
EOF
    end
  end
end

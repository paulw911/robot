TOYROBOT
========
* ToyRobot is a command line application which enables a robot to be placed and moved around a table. 
* This is based on the Toy Robot coding exercise created by Jon Eaves. 

<p>Licensing information</p>
```
refer to project LICENSE file
```

<p>Project source</p>
```
can be downloaded from:

https://github.com/paulw911/robot.git
```

<p>Environment</p>
```
This application was developed on: 

OSX 10.12 x86_64 

using ruby version: 

ruby 2.4.0p0

to check your ruby version run: 

$ ruby -v
```

Application Installation
---
<p>Application Installation</p>

Pre-requisities

* A 2.x ruby. If you have rbenv ```rbenv install 2.x.x```
* Bundler to run tests ```gem install bundler```

```
# Clone the repository
git clone git@github:paulw911/robot.git

# Run the specs
bundle install
bundle exec rspec -f doc

# Run the application providing input from the command line (STDIN)
# (on OSX and Linux, exit by typing EXIT, or using CTRL + D to send an EOF character)
./toyrobot.rb

# Or to use a file - refer to spec/integration for examples
# or use the testfile provided in the project root directory (testfile.txt)
./toyrobot < path/to/test_file
ruby toyrobot.rb < testfile.txt
```

<p><b>Application Specification</b></p>

<p>Description</p>
* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must stillbe allowed.

* Create an application that can read in commands of the following form:
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT

* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence un8l a valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
 
* A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
* Input can be from a file, or from standard input, as the developer chooses. . Provide test data to exercise the application.

<p>Constraints</p>
* The toy robot must not fall off the table during movement. This also includes the ini8al placement of the toy robot.
* Any move that would cause the robot to fall must be ignored.

<p>Example Input and Output:</p>
```
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```
b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```
c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

<p>Author & Contributor List</p>
```
Paul Williams
```

<p>File List</p>
```
.:

README.md

Gemfile

Guardfile

Rakefile

./lib

./spec
```
```
/lib:
filename.rb
```
```

/spec:
filename_spec.rb
```

<p><strong>Developer Notes</strong></p>

<p>Having never written a command line application and worked very little with regular expressions and text processing in Ruby, I purchased and read 2 books: </p>
<p>(1) Text Processing with Ruby - Rob Miller - The Pragmatic Bookshelf; and</p>
<p>(2) Build Awesome Command-Line Applications in Ruby 2</p>
<p>Both of these books provided me with a good foundation to move forward with the command line interface component of the project (found in toyrobot.rb).</p>

<p>After much (probably ignorant) deliberation and practise, I chose to construct 2 regular expressions using capture groups, which could be used (to provide clarity) instead of referencing the associated globals. These essentially covered the input requirements, but also allowed for some flexibility should the user inputs by slightly inaccurate. </p>

<p>In terms of the application, I validate each user command first, before calling any controller methods. Initially, I included error messages, to provide the user with clarity when incorrect inputs were entered, however I subsequently removed these as they were not included in the requirement. </p>

<p>The Controller class (controller.rb), which is called from the toyrobot.rb application file, is 'the controller'. </p>

<p>I used a Ruby module called Common (common.rb) to store much of the code which is 'commonly referenced' - to keep it in one place. </p>

<p>To position the robot, I chose to use a Ruby Struct as I thought it was the simplest and easiest way of maintaining the robot position attributes (position.rb). </p>

<p>With regard to the table (table.rb), given it was square, I didn't see the need to introduce 2 attributes for x & y 'size', so I went with a single 'size'. </p>

<p>The Robot class gives the robot a 'position' and allows reporting of that position. </p>



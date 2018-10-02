# Reference Sheet
There's a lot of vocabulary to remember. Here's a cheat sheet.

## Field Dimensions
 Field Dimensions Docs: [http://bit.ly/2cLsUBL](http://bit.ly/2cLsUBL)

* constants.Field.Length - Vertical length of the field
* constants.Field.Width - Horizontal width of the field
* constants.Field.TheirGoalSegment - Line Segment on their goal
* constants.Field.OurGoalSegment - Line Segment on our goal

(0, 0) is the middle of the field at our goal. Thus, the center of the field would be the point (constants.Field.Length / 2, 0)

## Robot and Ball Properties. 
Reference File Here

main.ball.pos() - get the robots position

## Skills
* Move - `skills.move.Move(<point to move to>)`
* Capture - `skills.capture.Capture()`
* Pivot Kick - `skills.pivot_kick.PivotKick()`
	* set its target attribute to a point or line segment
	* `kick.target=<some point or line>`
* Line Kick - `skills.line_kick.LineKick()`
	* set its target attribute to a point or line segment
	* `kick.target=<some point or line>`

## Git Stuff
Basic Process
add -> commit -> pull -> push

* git add <files>
* git commit -m "<commit_message>"
* git push origin <branch_name>

## Things don't work
* git pull rj master
* git submodule update --init --recursive
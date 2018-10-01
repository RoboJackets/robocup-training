# Reading {#t20185}


# Folder Explanation

-   **soccer**
    -   The main directory that we're working with
-   external
    -   Contains other repositories that we're working with
    -   Ex. RRT (used for path planner)
-   common
    -   Code that is "common" to both the software and firware of our robots
    -   Contains Geometry2d code.


## Soccer Folders

-   **Gameplay**
    -   Contains our whole plays system
-   Motion
    -   Self-explanatory
    -   Important. Faster robots are winning robots
-   Planning
    -   Python side of our path planner


## 

Most of the time we'll be in robocup-software/soccer/gameplay


# Literature Techniques


## Purpose of Learning Literature Techniques

-   Computer science is a language.
-   While you may be well-versed in this language, robocup-software is essentially a textbook that defines its own terminology
-   Thus, you have to know how to look up words that you don't know
-   Once you can read code, you can write code.


## Tips

-   I will teach you how to read using sublime
-   While you can do this using other text editors, it's pretty easy with sublime


## Setting up

-   On sublime, open robocup-software using the "open folder" option under file
-   This allows us to search through the entirety of robocup software using sublime tools


## Search Tools

-   Control + Shift + F will search the entire project for the occurence of a term.
-   Control + P will search the entire project for the name of a file.
-   In the terminal, you can use git grep "<term>" to search the whole repository for the occurence of a term.


# Let's read over some files together


## For Reference

-   robocup-py.cpp
    -   This file contains the code that translates our C++ files to Python
    -   robocup.\_\_\_\_\_ definitions will be in here
-   main.\_\_\_\_\_ refers to elements in the game.


## Repeated Line Up generate<sub>line</sub> method

```python
def generate_line(self, x_multiplier):
	x = (constants.Field.Width / 2 - constants.Robot.Radius * 2
	     ) * x_multiplier
	y_start = 1.2
	line = robocup.Segment(
	    robocup.Point(x, constants.Robot.Radius + y_start),
	    robocup.Point(x,
			  (constants.Robot.Radius * 2.3 + 0.1) * 6 + y_start))
	return line
```


## Reading generate<sub>line</sub> line 1

-   what is constants.Field.Width?
    -   ctrl + p to find constants.py where we find that the value of Field is robocup.Field<sub>Dimensions.CurrentDimensions</sub>.
        -   We know that robocup.\_\_\_\_\_ is defined in robocup-py.cpp
    -   ctrl + p to find robocup-py.cpp, then ctrl + f to find Field<sub>Dimensions</sub> or CurrentDimensions
        -   We find that CurrentDimensions is defined as &Field<sub>Dimensions</sub>::Current<sub>Dimensions</sub>
    -   If we ctrl + shift + f for Field<sub>Dimensions</sub>::Current<sub>Dimensions</sub>, we find the definition in Field<sub>Dimensions.cpp</sub>
    -   We find that the Current<sub>Dimensions</sub> is equal to the Default<sub>Dimensions</sub>, which is equal to the Double<sub>Field</sub><sub>Dimensions</sub>.
        -   Double<sub>Field</sub><sub>Dimensions</sub> is defined earlier in the Field<sub>Dimensions.cpp</sub> file.
        -   We can look in Field<sub>Dimensions.hpp</sub> and find that the second number in the parameters for the initialization correspond to the Width
            -   Thus, the value of constants.Field.Width = 6.
-   what is constants.Robot.Radius?


## Reading generate<sub>line</sub> line 3

-   What is a robocup.Segment?
-   What is a robocup.Point?


## Some questions to ask yourself

-   Do you know what the variables represent?
    -   Doesn't have to be exact
    -   Conceptual understanding is more important
-   Do you know what each method does?
    -   Conceptual Understanding
-   Do I understand everything that is language-specific?
    -   Ex. Ternary statements in python.
    -   Will be more problematic with C++.
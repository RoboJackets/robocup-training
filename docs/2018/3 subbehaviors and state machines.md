# Subbehaviors {#t20183}


# Questions about Plays?

-   Topics Covered:
    -   Python
    -   Play/Tactic/Skill Structure
-   Last meeting was pretty dense
    -   RoboCup is complicated
    -   If you got it, great
    -   If you didn't, great
        -   Please ask questions when you don't understand something because we can guarantee someone else has the same question.
-   And today, we're going into&#x2026;


## Additional Information

-   See the previous slide deck and docs for more information, they should be a pretty comprehensive overview of our play system.


# State Machines


## What are they?

-   A state machine is a series of states
-   You can transition between them
-   A state can transition to multiple other states
-   A state transition only occurs if a condition is fulfilled


### Examples

-   A washing machine is a state machine, going between different states to cycle between wash, dry, etc based on time.
-   School are state machines, where you transition to different classes at certain times.
-   [Wikipedia Page on State Machines](https://en.wikipedia.org/wiki/Finite-state_machine)


## Elevator

![img](https://i.imgur.com/KPv5sSk.png)


## Robocup Statemachines

-   Skills, tactics, and plays all have internal states.
-   We define those states using enums.
    -   Behaviors has some default states that we can use called start, running, complete
-   Each state has an on<sub>enter</sub>, execute, and on<sub>exit</sub>.
    -   on<sub>enter</sub> and on<sub>exit</sub> are run once at the beginning and end of the state respectively
    -   execute is run repetitively while we are in a state


# How do we implement state machines in our code?


## Implementing State Machines

-   In our code, we have three distinct parts in implementing state machines
    -   Defining States
    -   Defining Transitions
    -   Defining state actions
        -   Specifically, what we do upon entering a state, while a state is running, and upon exiting a state
-   We have a play called WhichHalf, which prints information about the ball based on whether it is in the top half or in the bottom half of the field


## Defining States

```python
# First create a state Enum (An enum is just a group of names)
# Define your states here.
      # eg: some_state = 0
      # -----------------------
      tophalf = 0
      bottomhalf = 1

# Register the states you defined using 'add_state'.
# eg: self.add_state(WhichHalf.State.<???>,
#                    behavior.Behavior.State.running)
# ----------------------------------------------------

# You must be in a play/tactic/skill for this to work
self.add_state(WhichHalf.State.tophalf,
	      behavior.Behavior.State.running)
self.add_state(WhichHalf.State.bottomhalf,
	      behavior.Behavior.State.running)
```


## Defining State Transitions

```python
# Add your state transitions using 'add_transition'.
# eg: self.add_transition(behavior.Behavior.State.start,
#                         self.State.<???>, lambda: True,
#                         'immediately')
# eg: self.add_transition(self.State.<???>, self.State.<???>,
#                         lambda: <???>,
#                         'state change message')
# ------------------------------------------------------------
self.add_transition(behavior.Behavior.State.start,
		  self.State.bottomhalf, lambda: True, 'immediately')

self.add_transition(self.State.bottomhalf,
		  self.State.tophalf, lambda: not in_bottom_half(),
		  'detected top half')

self.add_transition(self.State.tophalf, self.State.bottomhalf,
		  in_bottom_half, 'detected bottom half')

```


## Defining State Actions

```
# Define your own 'on_enter' and 'execute' functions here.
# eg: def on_enter_<???>(self):
#         print('Something?')
# eg: def execute_<???>(self):
#         print('Something?')
# eg: def on_exit_<???>(self):
#         print('Soemthing?')
# ---------------------------------------------------------

def on_enter_tophalf(self):
    print('Ball entered top half')

def on_enter_bottomhalf(self):
    print('Ball entered bottom half')    

def execute_tophalf(self):
    print('Ball in top half')

def execute_bottomhalf(self):
    print('Ball in bottom half')

def on_exit_bottomhalf(self):
    print('Ball exited bottom half')

def on_exit_tophalf(self):
    print('Ball exited top half')
```


# The lecture hall state machine

-   Let's say your lecture hall is a state


## What would determine whether we transition into our lecture hall state?


## When would we take out our notes?

-   on<sub>enter</sub>
-   execute
-   on<sub>exit</sub>


## When would we take notes?

-   on<sub>enter</sub>
-   execute
-   on<sub>exit</sub>


## When would we pack up?

-   on<sub>enter</sub>
-   execute
-   on<sub>exit</sub>


## Where would we take out our phone?

-   on<sub>enter</sub>
-   execute
-   on<sub>exit</sub>


## Additional Information on State Machines

-   While you *do not* need to know advanced state machine ideas, you need to be comfortable working with and parsing existing state machines from a diagram or from our code.
-   [Wikipedia Article](https://en.wikipedia.org/wiki/Finite-state_machine)
-   [A quick block post about state machines](http://blog.markshead.com/869/state-machines-computer-science/)
-   [You might be using state machines in a hacky way already&#x2026;](https://engineering.shopify.com/17488160-why-developers-should-be-force-fed-state-machines)
-   [Our Current State Machine Implementation](https://github.com/RoboJackets/robocup-software/blob/master/soccer/gameplay/fsm.py)


# How do I use subbehaviors?


## Adding Subbehaviors

```python
self.add_subbehavior(skill_object,
		     "Name of Subbehavior",
		     required=False or True
		     priority=10) # A higher number is higher priority
```

-   If adding a `complex behavior` or `single robot complex behavior`, don't pass in values for `required` or `priority`


### Details

-   For more docs on this entire section see [this link.](https://robojackets.github.io/robocup-software/classgameplay_1_1single__robot__composite__behavior_1_1_single_robot_composite_behavior.html)
-   These subbehaviors show up in the behavior tree when you run your program.
-   This can be extremely useful when debugging state transitions or subbehavior assignments.


## Removing Subbehaviors

```python
self.remove_subbehavior('string name')

self.remove_all_subbehaviors()
```


## Getting Subbehavior Plays

```python
a_subbheavior = self.subbehavior_with_name('string name')
```


# RoboCup Pro Tip

-   Find some code doing something like what you want
-   Tweak it until it works
-   It's less effective than working everything out, but it's great for beginners!


# Assignment

-   Write WhichHalf but vertical


## Extension

-   Write Triangle Pass


## Tips

1.  Use Move Skills to move your robots to the triangle initially
2.  Use the CoordinatedPass Tactic to pass between, setting receive points as sides of the triangle
3.  At a bare minimum, I would make setup and passing states. You may want to have a state for every side of the triangle (or not).
# Combat Tracker: commentary track

## Scope 1: keeping track of rounds and phases

### Session 1
*   combatant ≠ participation
*   extra RESTful actions
*   (no) captured groups in Capybara matchers
*   Round.next instead of a model/service

### Session 2
*   Big redesign
*   Conventions for CSS
*   /!\ propshaft and asset URLs
*   Clever stuff for the form layout

### Session 3
*   Actions
*   STI in order to have _types_
*   Polymorphic-like routes & resolve
*   Design adjustements: box shadow so that the grey background is visible
*   Tricky stuff: adjustable activity, variable activity range, removing vs. disabling suggested actions

### Session 4
*   Redesign
*   Refacto

### Session 5: starting on effects
*   Preliminary notes on effects
    *   Must be "disabled" when overriden by worse (e.g. 1 "stun no parry" must pass before a "stun" can be applied)

### Session 6: stuck on effects UI
*   Big refacto of the UI code to accomodate the effects
*   Significant time lost tweaking the design late and through the code instead of early and through Sketch
    *   Each experiment broke stuff
    *   Final approach still breaks thing (in the form)
*   For good or bad, this exercice also releaved flaws in the original design & code (such as the left padding 
    that made the first column shorter)

import
  tables,
  strutils,
  options

type
  Callback        = proc(): void
  StateEvent[S,E] = tuple[state: S, event: E]
  Transition[S]   = tuple[nexState: S, action: Option[Callback]]

  Machine[S,E]    = ref object of RootObj
    intialState:      S
    currentState:     Option[S]
    transitions:      TableRef[StateEvent[S,E], Transition[S]]
    transitionsAny:   TableRef[S, Transition[S]]
    defaultTransition:Option[Transition[S]]

  TransitionNotFoundException = object of Exception

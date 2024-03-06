grammar StateModel;

model: states transitions;
states: 'states' '{' stateDefinition* '}';
stateDefinition: ( 'initial' )? stateName labels ('error')? ;
transitions: 'transitions' '{' transitionDefinition* '}';
transitionDefinition: transitionSchema transitionMapping*;
stateName: STATE_NAME;
labels: '{' label (',' label)* '}';
label: LABEL?;
transitionSchema: 'trans' transitionType LABEL;
transitionType: 'normal' | 'error';
transitionMapping: LABEL ':' stateName '->' stateName;

STATE_NAME: [A-Z][A-Z0-9]*;
LABEL: [a-z][a-z0-9]*;
WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;

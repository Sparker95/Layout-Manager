// Small function to create a static control
params ["_text"];
private _b = (finddisplay 46) ctrlCreate ["RscButton", -1];
_b ctrlSetText _text;
_b ctrlSetBackgroundColor [0, 0, 0, 1];
_b ctrlSetPosition [0, 0, 0.1, 0.06];
_b ctrlCommit 0;
_b;
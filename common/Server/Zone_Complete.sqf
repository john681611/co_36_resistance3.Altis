if (isServer) then {
_found = false;
    {
        if (getMarkerColor _x == "colorRed") then {_found = true;};
    } forEach ztownAll;
    if (!_found) then {
      _KeyNumber = RANDOM(1000);
      profilenamespace setvariable ["Resist_SaveGame",[_KeyNumber,"new"]];
      [["Win",true,5],"BIS_fnc_endMission"] call BIS_fnc_MP;
    } else {
      _game = call getSaveGame;
			profilenamespace setvariable [format["Resist_SaveGame%1",savename],[KeyNumber,_game]];
			saveProfileNamespace;
    };
};

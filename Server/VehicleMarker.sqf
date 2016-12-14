vehicleMarker = {
  _vehicle =  _this;
  _marker createmarker [format ["%1%2",_vehicle,"_marker"], (getpos _vehicle)];
  _marker setMarkerColor "ColorBLUFOR";
  _marker setMarkerType  "mil_triangle";
  while {true} do {
    _marker setmarkerpos (getpos _vehicle);
    _marker setmarkerdir (getdir _vehicle);
    _noPlayers =  true;
    _players = "";
    {
      if (_x in _vehicle) then {
        _noPlayers = false;
        if(_players == "") then {
          _players = (name _x);
        } else {
          _players = _players + ", " + (name _x);
        };
      } 
    } foreach allplayers;
    if(_noPlayers) exitwith {}; //no players bail!
    _marker setMarkerText format ['%1 (%2)',_players, getText (configFile >>  "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
  };
  deleteMarker _marker;
};

_marker = createMarker [ format["%1",getPlayerUID player], position player ];
_marker setMarkerColor "ColorBLUFOR";
_marker setMarkerType  "mil_triangle";
_marker setMarkerText profileName;


call {while {true} do
        {
          if ((vehicle player) != player) then {
            _players = "";
            {
                if (_x in (vehicle player)) then {
                  if (_players == "") then {
                    _players = (name _x);
                  }else{
                    _players = _players + ", " +  (name _x);
                  };
                };
            } forEach allPlayers;
            _marker setMarkerText format ['%1 (%2)',_players, getText (configFile >>  "CfgVehicles" >> (typeOf (vehicle player)) >> "displayName")];
          } else {
            _marker setMarkerText profileName;
          };
          if((lifeState player) == "INCAPACITATED") then {
            _marker setMarkerColor "ColorRed";
          } else {
            _marker setMarkerColor "ColorBLUFOR";
          };
          _marker setMarkerPos getPos player;
          _marker setMarkerDir getDir player;
        sleep 2;
      };
    };

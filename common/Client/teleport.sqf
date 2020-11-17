_caller = _this select 0;

if((["TelePortR3F", 0] call BIS_fnc_getParamValue == 0) && isForcedWalk player && (count allPlayers) > 5) exitWith {hint "Teleporting with boxes is disabled.";};

_selected = {
  _idx = _x find _caller;
  if(_idx != -1) exitWith {
    if(_idx == 1) then {
      _x select 0
    } else {
      _x select 1
    };
  };
} forEach MHQs;

to_Base =
 {
private ["_Location"];
    _Location = _this select 0;
    _unit = player;
    _unit setpos (_Location findEmptyPosition [0,80, "Man"]);
    _unit allowDamage false;
    sleep 5;
    _unit allowDamage true;
 };

 to_MHQ =
 {
  _veh = (_this select 9) select 0;
  _unit = player;
  if(_veh emptyPositions "driver" > 0) then {
    _unit moveInDriver _veh;
  } else {
    if(_veh emptyPositions "cargo" > 0) then {
      _unit moveInCargo _veh;
    } else {
      hint "MHQ has no free positions.";
    };
  }
 };


 _missionsData = [];

  {
     _marker = _x select 0;
     _name = _x select 2;
    _missionsData append [[getMarkerPos  _marker,to_Base,_name,_name,"","",1,[getMarkerPos _marker]]];
 } forEach Bases;

 {
    _marker =  format["center_%1",_x select 2];
    _displayName =  getText (configFile >>  "CfgVehicles" >>(typeOf (_x select 1)) >> "displayName");
    _missionsData append [[getMarkerPos _marker,to_MHQ,_displayName,_displayName,"","",1,[_x select 1]]];
 } forEach MHQs;


 disableserialization;

 _parentDisplay = [] call bis_fnc_displayMission;
 _mapCenter     = getpos _selected;
 _ORBAT         = [];
 _markers   = [];
 _images    = [];
 _overcast  = overcast;
 _isNight   = !((dayTime > 6) && (dayTime < 20));
 _scale     = 0;
 _simul     = true;

      [
    findDisplay 46,
    _mapCenter,
    _missionsData,
    _ORBAT,
    _markers,
    _images,
    _overcast,
    _isNight,
    _scale,
    _simul
 ] call Bis_fnc_strategicMapOpen;

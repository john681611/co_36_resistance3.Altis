if (!isServer) exitWith {};
_blacklist = [6405.69,12365.6,0];
_towns=[];
 {
_text =  getText (configfile >> "CfgWorlds" >> "Tanoa" >> "Names">> (configName _x) >> "type");
_pos = getArray (configfile >> "CfgWorlds" >> "Tanoa" >> "Names">> (configName _x) >> "position");
if(!(_pos in _blacklist)) then {
  _towns = _towns + [[_text,_pos]];
}else{
  diag_log "Location Blacklisted";
  diag_log _pos;
};

 } forEach ("getText (_x >> 'type') != 'NameMarine' AND getText (_x >> 'type') != 'CityCenter'" configClasses (configfile >> "CfgWorlds" >> "Tanoa" >> "Names"));


ztownt = [];
ztowns = [];
ztownm = [];
ztownl = [];
ztownc = [];
ztowna = [];
ztownTA = [];
ztownAll = [];
//Extra areas
_towns = _towns + [["NameVillage",[5970.08,10613.9,7.92917]]] + [["NameVillage",[6132.54,10043.9,32.4986]]] + [["NameLocal",[9390.87,13127.1,37.3424]]];
{
    _pos = (_x select 1);

    if(!(_pos isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo [])) then {
          _pos = [_pos] call BIS_fnc_findSafePos;
        };


    _m = createMarker [format ["%1", _pos],_pos];
    if(!((getMarkerPos _m) in takenTowns)) then {
    	switch((_x select 0)) do
    	{
    		case "Hill":
    		{
    			ztownt = ztownt + [_m];
    		};

    		case "NameLocal":
    		{
    			ztowns = ztowns + [_m];
    		};
    		case "NameVillage":
    		{
    			ztownm = ztownm + [_m];
    		};
    		case "NameCity":
    		{
    			ztownl = ztownl + [_m];
    		};

    		case "NameCityCapital":
    		{
    			ztownc = ztownc + [_m];
    		};
        case "Airport":{
          ztowna = ztowna + [_m];
        };
    		default {
          systemChat (_x select 0);
    		}
    	};
      _m setMarkerColor "ColorYellow";
    } else {
      _m setMarkerColor "ColorGreen";
      ztownTA = ztownTA + [_m];
    };

    switch((_x select 0)) do
    {
      case "Hill":
      {
        _m setMarkerSize [100,100];
      };

      case "NameLocal":
      {
        _m setMarkerSize [150,150];
      };
      case "NameVillage":
      {
        _m setMarkerSize [250,250];
      };
      case "NameCity":
      {
        _m setMarkerSize [300,300];
      };

      case "NameCityCapital":
      {
        _m setMarkerSize [400,400];
      };
      case "Airport":{
        _m setMarkerSize [300,300];
      };
      default {
      _m setMarkerSize [400,400];
      }
    };


    _m setMarkerShape "ELLIPSE";
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;

} forEach _towns;


ztownAll = ztownTA + ztownc + ztownl + ztownm + ztowns + ztownt + ztowna + ["BLU","BLU_1","BLU_2","BLU_3","BLU_4","BLU_5","BLU_6","BLU_7"];
ztowninit = 1;

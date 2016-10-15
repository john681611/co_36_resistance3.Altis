/*
	GrenadeStop v0.8 for ArmA 3 Alpha by Bake
	
	DESCRIPTION:
	Stops players from throwing grenades in safety zones.
	
	INSTALLATION:
	Move grenadeStop.sqf to your mission's folder. Then add the
	following line to your init.sqf file (create one if necessary):
	execVM "grenadeStop.sqf";
	
	CONFIGURATION:
	Edit the #defines below.
*/

#define SAFETY_ZONES	[["respawn_west", 150]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE			"Oy! Stop wasting the ammo!\nDo you think we're running a holiday camp out here?\nStop goofing off and get back to work!"

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
		deleteVehicle (_this select 6);
		titleText [MESSAGE, "PLAIN", 3];
	};
}];

cleanServer = {
	{deleteVehicle _x;} count allDead;
	{deleteVehicle _x;} count (allMissionObjects "CraterLong");
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolder");
	{deleteVehicle _x;} count (allMissionObjects "GroundWeaponHolder");
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolderSimulated");
	{if ((count units _x) == 0) then {deleteGroup _x;};} count allGroups;
};

while {true} do {
	sleep 3600;
	Playercount = Count playableUnits;
	if (Playercount <= 1) then {
		[] call cleanServer;
	};
};

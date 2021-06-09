/*
 * 	BIOHAZARD 2 / RESIDENT EVIL 2 (c) 1998 by Capcom
 *	Autosplitter for speedrunning with Livesplit
 *	Made by CarcinogenSDA
 *	Derived from code for RE1 Autosplitter by xSHiiDOx
 *	Last updated: 12-19-2020
 *
 *	Special thanks to:
 *	dchaps, cursedtoast, darazanjoll, Squirrelies, xSHiiDOx, deserteagle417, pdPreciousRoy
 *
 *	for use with splits for every category: speedrun.com/re2/resources
 *
*/

state("bio2", "v1.0")
{
		uint time : "bio2.exe", 0x280538;
        short hp  : "bio2.exe", 0x589FE6;
		uint end : "bio2.exe", 0x589E0C;
		byte frame : "bio2.exe", 0x28053C;
        byte room_ID : "bio2.exe", 0x58EAB6;
        byte old_room : "bio2.exe", 0x58EABA;
        byte stage_ID : "bio2.exe", 0x58EAB4;
        byte PLD_ID : "bio2.exe", 0x58EAC4;
        byte cam_ID : "bio2.exe", 0x58EAB8;       
}

state("bio2 v1.1", "v1.1")
{
    	uint time : "bio2 v1.1.exe", 0x280588;
        short hp  : "bio2 v1.1.exe", 0x58A046;
        uint end : "bio2 v1.1.exe", 0x589E6C;
    	byte frame : "bio2 v1.1.exe", 0x28058C;
        byte room_ID : "bio2 v1.1.exe", 0x58EB16;
        byte old_room : "bio2 v1.1.exe", 0x58EB1A;
        byte stage_ID : "bio2 v1.1.exe", 0x58EB14;
        byte PLD_ID : "bio2 v1.1.exe", 0x58EB24;
        byte cam_ID : "bio2 v1.1.exe", 0x58EB18;  
}

startup
{

}

init
{
 
if(modules.First().ModuleName == "bio2.exe")
version = "v1.0";
else if(modules.First().ModuleName == "bio2 v1.1.exe")
version = "v1.1";
}


isLoading
{
	return true;
}


start
{
	/*
	*	Start is triggered by health value setting to 200 after coming from the 0 HP value at the title screen/load game screen.
	*/
	
  return current.hp == 200;

}

reset
{
 return current.old_room == 0xFF && current.hp == 0x00;
}


split
{
	/*
	*	Every door-animation (ladders, etc.) changes room_ID, stage_ID or both
	*	So any change triggers a split
	*	At specific moments in the game (Entering RPD or leaving boss rooms for instance) the autosplitter will check the room_ID and stage_ID.
	*	Additional splits (wrong doors, extra-splits, etc.) will be caught up under these conditions.
	*	Left the item/inventory IDs in for future revisions.
	*/

const byte Valve = 0x32;
const byte Red_Jewl00 = 0x33;
const byte Red_Jewl01 = 0x34;
const byte Blue_Card = 0x35;
const byte Serpent_Stone = 0x36;
const byte Jaguar_StoneL = 0x38;
const byte Jaguar_StoneR = 0x39;
const byte Eagle_Stone = 0x3A;
const byte Bishop_Plug = 0x3B;
const byte Rook_Plug = 0x3C;
const byte Knight_Plug = 0x3D;
const byte King_Plug = 0x3E;
const byte Unicorn_Medal = 0x47;
const byte Eagle_Medal = 0x48;
const byte Wolf_Medal = 0x49;
const byte Cog_Wheel = 0x4A;
const byte Manhole_Opener = 0x4B;
const byte Main_Fuse = 0x4C;
const byte MO_DISK = 0x60;
const byte Spade_Key = 0x59;
const byte Diamond_Key = 0x5A;
const byte Heart_Key = 0x5B;
const byte Club_Key = 0x5C;
const byte Panel_Key = 0x5D;

	if(timer.CurrentSplit.Name == "End")
	{
		return (current.end & 0x200000) == 0x200000;
	} 
	
	else if(timer.CurrentSplit.Name == "RPD")
	{     
		return current.room_ID == 0 && current.stage_ID == 1 && current.old_room == 3;
	}

	else if(timer.CurrentSplit.Name == "Stars Office")
	{     
		return current.room_ID == 20 && current.stage_ID == 0 && current.old_room == 21;
	}
	
	else if(timer.CurrentSplit.Name == "Library")
	{	
	return current.room_ID == 16 && current.stage_ID == 0 && current.old_room == 18;
	}
	
	else if(timer.CurrentSplit.Name == "Ada Shot")
	{
	return current.room_ID == 22 && current.stage_ID == 1 && current.old_room == 17 && current.cam_ID == 2;
	}
	
	else if(timer.CurrentSplit.Name == "Club Key")
	{     
	return current.room_ID == 5 && current.stage_ID == 2 && current.old_room == 6;
	}
	
	else if(timer.CurrentSplit.Name == "Red Hallway")
	{     
		return current.room_ID == 10 && current.stage_ID == 1 && current.old_room == 12;
	}
	
	else if(timer.CurrentSplit.Name == "G-Mutant")
	{     
		return current.room_ID == 4 && current.stage_ID == 2 && current.old_room == 3;
	}
	
	else if(timer.CurrentSplit.Name == "Sewers")
	{     
		return current.room_ID == 13 && current.stage_ID == 3 && current.old_room == 7;
	}
	
	else if(timer.CurrentSplit.Name == "Birkin (G2)")
	{     
		return current.room_ID == 5 && current.stage_ID == 4 && current.old_room == 9;
	}

	else if(timer.CurrentSplit.Name == "Lab Card Key")
	{     
		return current.room_ID == 20 && current.stage_ID == 5 && current.old_room == 21;
	}

	else if(timer.CurrentSplit.Name == "MO Disk")
	{     
		return current.room_ID == 12 && current.stage_ID == 5 && current.old_room == 16;
	}

	else if(timer.CurrentSplit.Name == "Chief Irons")
	{
		return current.room_ID == 27 && current.stage_ID == 1 && current.cam_ID == 10;
	}
	
	else if(timer.CurrentSplit.Name == "Club Key")
	{
		return current.room_ID == 5 && current.stage_ID == 2 && current.old_room == 6;
	}

	else if(timer.CurrentSplit.Name == "G-Mutant")
	{     
		return current.room_ID == 0 && current.stage_ID == 2 && current.old_room == 9;
	}
	
	else if(timer.CurrentSplit.Name == "Mr X")
	{     
		return current.room_ID == 10 && current.stage_ID == 0 && current.old_room == 9;
	}

	else if(timer.CurrentSplit.Name == "Birkin (G1)")
	{     
		return current.room_ID == 0 && current.stage_ID == 2 && current.old_room == 9;
	}

	else if(timer.CurrentSplit.Name == "Birkin (G1)")
	{     
		return current.room_ID == 4 && current.stage_ID == 2 && current.old_room == 3;
	}

	else if(timer.CurrentSplit.Name == "Birkin (G3)")
	{     
		return current.room_ID == 5 && current.stage_ID == 4 && current.old_room == 9;
	}

	else if(timer.CurrentSplit.Name == "Power Room Key")
	{     
		return current.room_ID == 20 && current.stage_ID == 5 && current.old_room == 21;
	}
	
	else if(timer.CurrentSplit.Name == "Master Key")
	{     
		return current.room_ID == 6 && current.stage_ID == 5 && current.old_room == 8;
	}

	else if(timer.CurrentSplit.Name == "Tyrant")
	{     
		return current.room_ID == 1 && current.stage_ID == 6 && current.old_room == 2;
	}
	
	else if(timer.CurrentSplit.Name == "Crank")
	{
		return current.room_ID == 13 && current.stage_ID == 0 && current.old_room == 14;
	}

	else if(current.stage_ID != old.stage_ID)
	{
		return current.stage_ID != old.stage_ID;
	}

	else
	{
		return current.room_ID != old.room_ID;
	}
}

gameTime
{
    return (TimeSpan.FromSeconds( (double)(current.time) + (current.frame / 60.0)));
}

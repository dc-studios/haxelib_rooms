package;

import openfl.display.Sprite;
import rooms.RoomManager;

class Main extends Sprite {

	public function new () {
		super ();

		trace( "Initializing RoomManager..." );
		RoomManager.Init( this );

		trace( "There is a total of "+RoomManager.GetNumber()+" rooms." );
		RoomManager.Add( "Room", "rooms.Room" );

		trace( "There is a total of "+RoomManager.GetNumber()+" rooms." );
		trace( "Going to room 'Room'..." );
		RoomManager.GotoRoom( "Room" );

		RoomManager.Add( "Room2", "rooms.Room" );
		trace( "There is a total of "+RoomManager.GetNumber()+" rooms." );
		trace( "Going to room 'Room2'..." );
		RoomManager.GotoRoom( "Room2" );

		trace( "Destroying Room Manager..." );
		RoomManager.Destroy();
		trace( "There is a total of "+RoomManager.GetNumber()+" rooms." );
	}

}
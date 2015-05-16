package rooms;

import haxe.ds.StringMap;
import openfl.display.Sprite;
import openfl.errors.Error;
import rooms.Room;

class RoomManager {

    private static var root:Sprite;
    private static var currentRoom:Room;
    private static var roomDatabase:StringMap< Class<Dynamic> > = new StringMap<Class<Dynamic>>();
    private static var roomNames:Array<String> = new Array<String>();



    public static function Init( container:Sprite ):Void {
    	RoomManager.root = container;
    }

    public static function GetNumber():Int {
    	if( RoomManager.roomNames == null ) return 0;
    	else return RoomManager.roomNames.length;
    }

    public static function Destroy():Void {
    	RoomManager.destroyRoom();
    	RoomManager.root = null;
    	RoomManager.clearDatabase();
    	RoomManager.roomDatabase = null;
    	RoomManager.roomNames = null;
    }

    public static function Add( roomName:String, roomClass:String ):Void {
    	var resolvedRoom:Class<Dynamic> = Type.resolveClass( roomClass );
    	if( resolvedRoom == null ) throw new Error( "Trying to add a room ( '"+roomName+"' ) that doesn't exists!" );
    	
    	RoomManager.roomDatabase.set( roomName, resolvedRoom );
    	RoomManager.roomNames.push( roomName );
    }

    public static function GotoRoom( roomName:String ):Void {
    	if( !RoomManager.roomDatabase.exists( roomName ) ) throw new Error( "Trying to go to a room ( '"+roomName+"' ) that doesn't exists!" );

    	var roomClass:Class<Dynamic> = RoomManager.roomDatabase.get( roomName );
		RoomManager.destroyRoom();
		RoomManager.setRoom( Type.createInstance( roomClass, [] ) );
    }



    public static function Update( delta:Int ):Void {
        if( RoomManager.currentRoom != null ) RoomManager.currentRoom.Update( delta );
    }

    public static function Render():Void {
        if( RoomManger.currentRoom != null ) RoomManager.currenRoom.Render();
    }



    private static function destroyRoom():Void {
    	if( RoomManager.currentRoom != null ) {
    		RoomManager.root.removeChild( RoomManager.currentRoom );
    		RoomManager.currentRoom.Destroy();
    		RoomManager.currentRoom = null;
    	}
    }

    private static function setRoom( room:Room ):Void {
    	RoomManager.currentRoom = room;
    	RoomManager.root.addChild( RoomManager.currentRoom );
    	RoomManager.currentRoom.Create();
    }

    private static function clearDatabase():Void {
    	while( RoomManager.roomNames.length > 0 ) {
    		RoomManager.roomDatabase.remove( RoomManager.roomNames.pop() );
    	}
    }
}

package rooms;

import openfl.display.Sprite;

class Room extends Sprite {
    private static var roomID:Int = 0;

    public var Name:String;
    public var Width:Int;
    public var Height:Int;

    public function new() {
        super();

        this.Name = Room.getUniqRoomName();
    }

    private static function getUniqRoomName():String {
        return "room" + Room.roomID++;
    }

    public function Create():Void {}
    public function Update( delta:Int ):Void {}
    public function Render():Void {}
    public function Destroy():Void {}
}

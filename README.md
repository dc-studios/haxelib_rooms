# Rooms
Rooms is an easy GameMaker-like room system for openfl.

## How to use
First, call 'Init' from the RoomManager.
You have to provide a sprite in which rooms will render.

```haxe
package;

import openfl.display.Sprite;
import rooms.RoomManager;

class Main extends Sprite {
	public function new() {
		super();

		RoomManager.Init( this );

		RoomManager.Add( "Splash", "rooms.SplashRoom" );
		RoomManager.Add( "Menu", "rooms.MenuRoom" );
		RoomManager.Add( "Level_1", "rooms.Level1Room" );
		RoomManager.Add( "Level_2", "rooms.Level2Room" );
		RoomManager.Add( "Level_3", "rooms.Level3Room" );
		RoomManager.Add( "GameOver", "rooms.GameOverRoom" );

		RoomManager.GotoRoom( "Splash" );
	}
}
```

> The above first initializes the room manager, providing the current Main sprite as the room container.
> It then registers rooms. You provide an easy name which you'll use in your code, and the ClassPath of your rooms.
> It then tells the room manager to display the Splash room.

Next, create your rooms classes, extending the Room class.
Create will be called when room is added in the display tree.
Update is called when you call RoomManager.Update.
Render is called when you call RoomManager.Render();
Destroy is called when you change room or when the game closes.

```haxe
package rooms;

import haxe.Timer;
import openfl.Assets;
import openfl.display.Bitmap;
import motion.Actuate;
import rooms.Room;

class SplashRoom extends Room {
	
	private var logo:Bitmap;

	public function new() {
		super();

		this.Name = "Splash Room";
		this.Width = 1024;
		this.Height = 640;

		this.logo = new Bitmap( Assets.getBitmapData( "assets/img/logo.png", false ) );
	}

	public override function Create():Void {
		this.addChild( this.logo );
		this.logo.x = this.Width/2 - this.logo.width/2;
		this.logo.y = this.Height/2 - this.logo.height/2;
		this.logo.alpha = 0;

		Actuate.tween( this.logo, 250, { alpha: 1 } ).onComplete( onTweenComplete, [] );
	}

	public override function Destroy():Void {
		this.removeChild( this.logo );
		this.logo = null;
	}

	private function onTweenComplete():Void {
		Timer.delay( onTimeOut, 3000 );
	}

	private function onTimeOut():Void {
		Actuate.tween( this.logo, 250, { alpha: 0 } ).onComplete( onSecondTweenComplete, [] );
	}

	private function onSecondTweenComplete():Void {
		RoomManager.GotoRoom( "Menu" );
	}

}
```

> The above example creates a Splash Room.
> As you can see, it simply fades in a logo, waits for 3 seconds, then fades the logo away
> and changes to the Menu Room.

I hope this library will make "Level Switching" easier to add to your projects!
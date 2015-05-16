# Rooms
Rooms is an easy GameMaker-like room system for openfl.

## How to use
First, call 'Init' from the RoomManager.
You have to provide a sprite in which rooms will render.

Next, create your cooms classes, extending the Room class.
Create will be called when room is added in the display tree.
Update is called when you call RoomManager.Update.
Render is called when you call RoomManager.Render();
Destroy is called when you change room or when the game closes.

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
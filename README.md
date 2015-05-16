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
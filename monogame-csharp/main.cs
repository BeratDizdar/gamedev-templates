/*
    depen:
        dotnet add package MonoGame.Framework.WindowsDX --version 3.8.4
*/
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

class Game1 : Game
{
    GraphicsDeviceManager graphics;
    SpriteBatch spriteBatch;

    public Game1() => graphics = new GraphicsDeviceManager(this);

    protected override void LoadContent() => spriteBatch = new SpriteBatch(GraphicsDevice);

    protected override void Draw(GameTime gameTime)
    {
        GraphicsDevice.Clear(Color.CornflowerBlue);
        base.Draw(gameTime);
    }

    static void Main() => new Game1().Run();
}

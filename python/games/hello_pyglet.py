import pyglet

window = pyglet.window.Window()
label = pyglet.text.Label('Hello, World', font_size=36,
                          x=window.width//2, y=window.height//2,
                          anchor_x='center', anchor_y='center')

@window.event
def on_draw():
    window.clear()
    label.draw()

window.push_handlers(pyglet.window.event.WindowEventLogger())
pyglet.app.run()
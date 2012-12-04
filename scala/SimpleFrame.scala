import swing._
import event._

object SimpleFrame extends SimpleGUIApplication {
    def top = new MainFrame {
        title = "First Swing App"
        val button = new Button { text = "Click me" }
        val label = new Label {
            text = "No clicks registered."
        }
        contents = new BoxPanel(Orientation.Vertical) {
            contents += button
            contents += label
            border = Swing.EmptyBorder(30, 30, 10, 30)
        }
        listenTo(button)
        var nClicks = 0
        reactions += {
            case ButtonClicked(b) =>
                nClicks += 1
                label.text = "Number of clicks: " + nClicks
        }
    }
}

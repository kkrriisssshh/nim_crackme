import std/[base64, browsers]
import nimcrypto
import nigui

const
  title: string = "nim crackme"
  labelText: string = "enter key..."
  buttonText: string = "submit"
  key: string = "aWxvdmVDQVRTOTk5ISEh"
  url: string = "aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g_dj1kUXc0dzlXZ1hjUQ"

proc isPassword*(input: string): int =
  if keccak_256.digest(input) == keccak_256.digest(decode(key)):
    return 1
  else:
    return 0  

when isMainModule:
  app.init()
  
  var
    window = newWindow(title)
    container = newLayoutContainer(Layout_Vertical)
    label = newLabel(labelText)
    textBox = newTextBox("")
    button = newButton(buttonText)

  window.width = 300.scaleToDpi
  window.height = 120.scaleToDpi
  window.add(container)

  container.add(label)
  container.add(textBox)
  container.add(button)

  button.onClick = proc(event: ClickEvent) =
    if isPassword(textBox.text) == 1:
      window.alert("you did it big bro", title)
    else:
      window.alert("get good lil bro", title)
      block: openDefaultBrowser(decode(url))

  window.show()
  app.run()
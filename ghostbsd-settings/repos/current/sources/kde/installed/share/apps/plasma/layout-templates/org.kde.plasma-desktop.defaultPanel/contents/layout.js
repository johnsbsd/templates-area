var panel = new Panel
if (panelIds.length == 1) {
    // we are the only panel, so set the location for the user
    panel.location = 'bottom'
}
panel.height = screenGeometry(panel.screen).height > 1024 ? 35 : 27

qlaunch = panel.addWidget("launcher")
    qlaunch.writeConfig("icon","desktopbsd")
    qlaunch.writeConfig("iconLocation", "desktopbsd")
qlaunch = panel.addWidget("showdesktop")
iconUrls =  "file:////usr/local/share/applications/kde4/konsole.desktop,"
    iconUrls += "file:////usr/local/share/xdg-browser-launcher/xdg-browser-launcher.desktop,"
    iconUrls += "file:////usr/local/share/applications/kde4/dolphin.desktop"
qlaunch = panel.addWidget("quicklaunch")
    qlaunch.writeConfig("iconUrls",iconUrls)

panel.addWidget("tasks")
panel.addWidget("org.kde.showActivityManager")
panel.addWidget("systemtray")
panel.addWidget("org.kde.milou")

digitalclock = panel.addWidget("digital-clock")
    digitalclock.writeConfig("showSeconds", "true")
    digitalclock.writeConfig("dateStyle","2")

pager = panel.addWidget("pager")
    pager.writeConfig("hideWhenSingleDesktop", "true")

panel.addWidget("lockout")

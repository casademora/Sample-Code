# SampleAppDelegate.rb
# CoreDataSample
#
# Created by Saul Mora on 3/20/11.
# Copyright 2011 Magical Panda Software LLC. All rights reserved.


class SampleAppDelegate

    def applicationDidFinishLaunching(notification)

        wc = MainWindowController.alloc.initWithWindowNibName("MainWindow")
        wc.window.makeMainWindow
        wc.window.makeKeyAndOrderFront(self)

    end

end
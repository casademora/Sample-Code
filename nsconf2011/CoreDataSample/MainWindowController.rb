# MainWindowController.rb
# CoreDataSample
#
# Created by Saul Mora on 3/20/11.
# Copyright 2011 Magical Panda Software LLC. All rights reserved.

class MainWindowController < NSWindowController

    attr_accessor :number_label
    
    def windowDidLoad
    
        puts "Window: #{self.window}"
        self.window.title = "My Sample Core Data Application"
        
    end
    
    def createObject(sender)
        person = Person.createEntity                #magicalrecord helper
        
        NSManagedObjectContext.defaultContext.save  #magicalrecord helper
        
        count = Person.numberOfEntities
        
        person.first_name = "first name: #{count}"
        person.last_name = "last name: #{count}"
        person.age = (rand * 100).round
        
        self.number_label.stringValue = count.to_s
    end
    
    def managedObjectContext
        NSManagedObjectContext.defaultContext
    end
end

module HotCocoa
  def application_menu
    menu do |main|
      main.submenu :apple do |apple|
        apple.item :about, :title => "About #{NSApp.name}"
        apple.separator
        apple.item :preferences, :key => ","
        apple.separator
        apple.item :quit, :title => "Quit #{NSApp.name}", :key => "q"
      end
      main.submenu :file do |file|
        file.item :new, :title => "New Status", :key => "n"
      end
      main.submenu :edit do |edit|
        edit.item :undo, :key => "z", :modifiers => [:command], :action => "undo:"
        edit.item :redo, :key => "z", :modifiers => [:command, :shift], :action => "redo:"
        edit.separator
        edit.item :cut, :key => "x", :action => "cut:"
        edit.item :copy, :key => "c", :action => "copy:"
        edit.item :paste, :key => "v", :action => "paste:"
        edit.separator
        edit.item :select_all, :key => "a", :action => "selectAll:"
      end
    end
  end
end

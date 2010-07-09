require 'rubygems'
require 'hotcocoa'
# Replace the following code with your own hotcocoa code

class Xtt
  include HotCocoa
  
  def start
    @app = application :name => "Xtt", :delegate => self
    @status = status_item
    set_status_menu
    @app.run
  end

  def set_status_menu
    @menu = status_menu
    @status.view = nil
    @status.menu = @menu
    @status.title = "Xtt Item"
    @status.setHighlightMode true
  end

  def status_menu
    menu :delegate => self do |status|
      status.item "New Status", :on_action => proc { new_window }
      status.separator
      status.item "Preferences", :on_action => proc { preferences }
      status.separator
      status.item "Quit", :on_action => proc { @app.terminate self }
    end
  end

  def new_window
    window :size => [400,150], :center => true, :title => "New Status", :view => :layout,
           :style => [:titled, :closable, :textured] do |win|
      win.contentView.margin = 0
      win.view = layout_view(:layout => { :expand => [:width, :height], :start => false,
                                          :padding => 0, :margin => 0}) do |vert|
        #@scroll_view = scroll_view(:layout => { :start => false, :align => :top })

        @status_view = text_view(:layout => { :padding => 0, :margin => 0, :expand => [:width, :height] })
        @status_view.setEditable(true)
        @status_view.setSelectable(true)
        @status_view.setUsesFindPanel(false)
        @status_view.setVerticallyResizable(false)
        @status_view.setHorizontallyResizable(false)

        #@scroll_view.documentView = @status_view
        vert << @status_view

        vert << layout_view(:frame => [0, 0, 0, 40], :mode => :horizontal,
                            :layout => { :padding => 0, :margin => 0, :align => :bottom }) do |horiz|
          horiz << button(:title => "Post", :layout => { :align => :right}) do |b|
            b.on_action { post_status }
          end
          horiz << button(:title => "Cancel", :layout => { :align => :right}) do |b|
            b.on_action { win.close }
          end
        end
      end
    end
  end
end

Xtt.new.start

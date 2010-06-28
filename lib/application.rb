require 'rubygems'
require 'hotcocoa'
# Replace the following code with your own hotcocoa code

class Xtt

  include HotCocoa
  
  def start
    application :name => "Xtt" do |app|
      app.delegate = self
    end
  end

  # file/new 
  def on_new(menu)
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

  # xtt/preferences
  def on_preferences(menu)
    window :frame => [100, 100, 100, 100], :title => "Preferences" do |win|
      win << label(:text => "Prefs window!")
    end
  end

  # This is commented out, so the minimize menu item is disabled
  def on_minimize(menu)
  end
end

Xtt.new.start

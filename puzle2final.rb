require "gtk3"
require_relative 'pn532'
require "thread"
require "ruby-nfc"

rf = Rfid.new
win = Gtk::Window.new("Gtk::Label sample")
box = Gtk::Box.new(:vertical)

label = Gtk::Label.new("Please, login with your university card",:expand => true)

label.override_background_color(0,Gdk::RGBA::new(0,0,1,1))
button = Gtk::Button.new(:label => "Clear")
label.set_size_request(100,100)
button.set_size_request(100, 200)
win.set_title("rfid_gdk.rb")
win.set_size_request(450,200)
win.set_window_position(:center)
win.signal_connect("destroy"){Gtk.main_quit}
box = Gtk::Box.new(:vertical,7)
box.add(label)


box.add(button)
win.add(box)
win.show_all

button.signal_connect("clicked") do
    label.set_markup("Please, login with your university card")
    label.override_background_color(0,Gdk::RGBA::new(0,0,1,1))
end

thread = Thread.new{
	while true do
	uid = rf.read_uid
	label.set_markup("uid "+ uid)
	label.override_background_color(0,Gdk::RGBA::new(1,0,0,1))
	
	
end
}
win.signal_connect("delete_event"){thread.kill;Gtk.main_quit}
Gtk.main
thread.join

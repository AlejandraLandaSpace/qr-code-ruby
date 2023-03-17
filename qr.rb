require "rqrcode"

p "Would you like a URL(1), wifi network(2), text message(3), or exit(4) to be encoded in the QR code? "

user_answer = gets.chomp.to_i


def url
    p "Enter the URL to be encoded in the QR:  "
    url_answer = gets.chomp
    qrcode = RQRCode::QRCode.new(url_answer)
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("url.png", png.to_s)
end

def wifi
  p "Enter your wifi network name: "
  wifi_name = gets.chomp
  p "Enter your wifi password: "
  wifi_password = gets.chomp
  encoded = "WIFI:T:WPA;S:#{wifi_name};P:#{wifi_password};;"
  qrcode = RQRCode::QRCode.new(encoded)
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("wifi.png", png.to_s)
end

def text
  p "Enter the phone number you would like to send the message to: "
  number = gets.chomp.to_i
  p "Enter your message to send: "
  message = gets.chomp
  encoded = "SMSTO:#{number}:#{message}"
  qrcode = RQRCode::QRCode.new(encoded)
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("text.png", png.to_s)
end


case user_answer
when 1
  url()
when 2
  wifi()
when 3
  text()
when 4
  p "Bye!"
  return 
end




# # Use the RQRCode::QRCode class to encode some text
# # qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# # Use the .as_png method to create a 500 pixels by 500 pixels image
# png = qrcode.as_png({ :size => 500 })

# # Write the image data to a file

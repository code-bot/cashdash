import UIKit

extension UILabel {
	convenience init(fontName: String, size: CGFloat, color: UIColor = UIColor.whiteColor()) {
		self.init()
		self.font = UIFont(name: fontName, size: size)
		self.textColor = color
	}
	
	convenience init(font: UIFont?, color: UIColor = UIColor.whiteColor()) {
		self.init()
		self.font = font
		self.textColor = color
	}
}
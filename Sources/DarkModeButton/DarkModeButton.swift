import UIKit

public struct DarkModeButton {
	public static func button(_ size: CGSize = .init(width: 64, height: 64)) -> UIButton {
		let b = UIButton(frame: .init(origin: .zero, size: size))
		b.setImage(circleImage(size: size, color: .label), for: .normal)
		b.setImage(circleImage(size: size, color: .systemBackground), for: .selected)
		return b
	}
	
	public static func barButton(_ size: CGSize = .init(width: 44, height: 44)) -> UIBarButtonItem {
		let image = circleImage(size: size, color: .label)
		let b = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
		return b
	}
	
	public static func circleImage(size: CGSize, color: UIColor) -> UIImage {
		return UIGraphicsImageRenderer(size: size).image { uiContext in
			color.setFill()
			let imageLeft = UIImage(systemName: "record.circle")?.withRenderingMode(.alwaysTemplate)
			let halfRect = CGRect(origin: .zero, size: .init(width: size.width / 2.0, height: size.height))
			let halfPath = UIBezierPath(rect: halfRect)
			halfPath.addClip()
			imageLeft?.draw(in: .init(origin: .zero, size: size))
			
			uiContext.cgContext.resetClip()
			let imageRight = UIImage(systemName: "record.circle.fill")?.withRenderingMode(.alwaysTemplate)
			uiContext.cgContext.translateBy(x: size.width/2.0, y: 0.0)
			halfPath.addClip()
			uiContext.cgContext.translateBy(x: -size.width/2.0, y: 0.0)
			imageRight?.draw(in: .init(origin: .zero, size: size))
		}
	}
}

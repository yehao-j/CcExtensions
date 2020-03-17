//
//  UIImageExtension.swift
//  Extension
//
//  Created by jesse on 2017/5/25.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

//MARK: - Properties
extension UIImage {
    public var original: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }

    /// 修改tint颜色的时候会渲染成这种颜色
    public var template: UIImage {
        return withRenderingMode(.alwaysTemplate)
    }
}

//MARK: - Methods
extension UIImage {
    /// 创建单色图片
    ///
    /// - Parameters:
    ///   - color: 图片的颜色
    ///   - size: 图片的size
    public convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(cgImage: image.cgImage!)
    }
    
    public func compressed(quality: CGFloat) -> UIImage? {
        guard let data = self.jpegData(compressionQuality: quality) else { return nil }
        return UIImage(data: data)
    }
    
    /// 改变图片颜色
    ///
    /// - Parameters:
    ///   - color: 改变后的颜色
    ///   - blendMode: 叠加模式
    /// - Returns: 修改后的UIImage
    public func tint(_ color: UIColor, blendMode: CGBlendMode = .normal) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(blendMode)
        
        let drawRect = CGRect(origin: CGPoint.zero, size: size)
        context.clip(to: drawRect, mask: cgImage!)
        color.setFill()
        context.fill(drawRect)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
    /// 目前是两张图的size都是一样的进行上下叠加
    public func combine(_ image: UIImage) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        image.draw(at: CGPoint.zero)
        draw(at: CGPoint.zero)
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return combinedImage
    }
    
    /// 修改图片方向
    public func fixOrientation() -> UIImage {
        guard imageOrientation != .up else { return self }
        var transform = CGAffineTransform.identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -CGFloat.pi / 2)
        default: break
        }
        
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default: break
        }
        
        guard let cgImage = cgImage else { return self }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        guard let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: Int(cgImage.bitsPerComponent), bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else {
            return self
        }
        context.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        
        if let cgImg = context.makeImage() {
            return UIImage(cgImage: cgImg)
        }
        
        return self
    }
    
    public func cropSquare() -> UIImage {
        return crop(ratio: 1)
    }
    
    public func cropCircle() -> UIImage {
        let data = calculateRect(ratio: 1)
        UIGraphicsBeginImageContext(data.0)
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addEllipse(in: CGRect(origin: CGPoint.zero, size: data.0))
        ctx?.clip()
        draw(in: data.1)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    fileprivate func calculateRect(ratio: CGFloat) -> (CGSize, CGRect) {
        //计算最终尺寸
        var newSize: CGSize
        if size.width / size.height > ratio {
            newSize = CGSize(width: size.height * ratio, height: size.height)
        } else {
            newSize = CGSize(width: size.width, height: size.width / ratio)
        }
        
        /// 图片绘制区域
        var rect = CGRect.zero
        rect.size.width  = size.width
        rect.size.height = size.height
        rect.origin.x    = (newSize.width - size.width ) / 2.0
        rect.origin.y    = (newSize.height - size.height ) / 2.0
        
        return (newSize, rect)
    }
    
    /// 将图片裁剪成指定比例（多余部分自动删除）
    public func crop(ratio: CGFloat) -> UIImage {
        let data = calculateRect(ratio: ratio)
        
        /// 绘制并获取最终图片，画板的大小
        UIGraphicsBeginImageContext(data.0)
        draw(in: data.1)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    public func scaled(to newSize: CGSize) -> UIImage {
        /// 计算比例
        let aspectWidth  = newSize.width / size.width
        let aspectHeight = newSize.height / size.height
        let aspectRatio = max(aspectWidth, aspectHeight)
        
        /// 图片绘制区域
        var scaledImageRect = CGRect.zero
        scaledImageRect.size.width  = size.width * aspectRatio
        scaledImageRect.size.height = size.height * aspectRatio
        scaledImageRect.origin.x    = (newSize.width - size.width * aspectRatio) / 2.0
        scaledImageRect.origin.y    = (newSize.height - size.height * aspectRatio) / 2.0
        
        /// 绘制并获取最终图片
        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
}

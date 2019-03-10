//
//  ComponentView.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

public var addComponent: IComponentView {
    struct Singleton {
        static let instance = ComponentView()
    }
    return Singleton.instance
}

public protocol IComponentView {
    func collectionView() -> UICollectionView
    func collectionView(id: String, delegate: UICollectionViewDelegateFlowLayout, datasource: UICollectionViewDataSource, scrollDirection: UICollectionView.ScrollDirection, isEstimatedItemSize: Bool) -> UICollectionView
    func label(id: String, type: AppFonts, text: String, size: CGFloat, addColor: AppColor, align: NSTextAlignment) -> UILabel
    func image(id: String, image: UIImage) -> UIImageView
    func view(addColor: AppColor) -> UIView
    func textField(id: String, placeholder: String, fontSize: CGFloat) -> UITextField
    func buttonCustomFont(id: String, title: String, corner: CGFloat, bgColor: AppColor, textColor: AppColor, isBorder: Bool, fontSize: CGFloat, type: AppFonts, borderColor: AppColor) -> UIButton
    func tableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) -> UITableView
    func textView(id: String, size: CGFloat, addColor: AppColor, align: NSTextAlignment) -> UITextView
    func stackView(views: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView
    func customImage(rounded: CGFloat) -> CustomImageView
    func circularImage(id: String, background: AppColor) -> UIImageView
    func imageFromFramework(id: String, image: String, className: AnyClass) -> UIImageView
}

open class ComponentView: IComponentView {
    public func circularImage(id: String, background: AppColor) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "image_identifier_\(id)"
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = background.color.cgColor
        imageView.layer.masksToBounds = false
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        return imageView
    }
    
    public func imageFromFramework(id: String, image: String, className: AnyClass) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "image_identifier_\(id)"
        imageView.image = UIImage(named: image, in: Bundle(for: className), compatibleWith: nil)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    
    public func collectionView() -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }
    
    public func collectionView(id: String, delegate: UICollectionViewDelegateFlowLayout, datasource: UICollectionViewDataSource, scrollDirection: UICollectionView.ScrollDirection, isEstimatedItemSize: Bool) -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        if isEstimatedItemSize{
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = datasource
        collection.delegate = delegate
        collection.accessibilityIdentifier = "collection_identifier_\(id)"
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.addBackgroundColor(addColor: .white)
        return collection
    }
    
    public func label(id: String, type: AppFonts, text: String, size: CGFloat, addColor: AppColor = .black, align: NSTextAlignment) -> UILabel {
        let label = UILabel(frame: .zero)
        label.textColor = addColor.color
        label.accessibilityIdentifier = "label_identifier_\(id)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = align
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: type.customFont, size: size)
        label.text = text
        return label
    }
    
    public func image(id: String, image: UIImage) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "image_identifier_\(id)"
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    public func customImage(rounded: CGFloat) -> CustomImageView {
        let imageView: CustomImageView = CustomImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        if rounded > 0 {
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 0
            imageView.layer.cornerRadius = rounded
        }
        return imageView
    }
    
    
    public func view(addColor: AppColor) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = addColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
   
    public func textField(id: String, placeholder: String, fontSize: CGFloat) -> UITextField {
        let textfield: UITextField  = UITextField()
        textfield.accessibilityIdentifier = "textField_identifier_\(id)"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = placeholder
        textfield.textAlignment = .left
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        return textfield
    }
    
    
    public func buttonCustomFont(id: String, title: String, corner: CGFloat, bgColor: AppColor, textColor: AppColor, isBorder: Bool, fontSize: CGFloat, type: AppFonts, borderColor: AppColor) -> UIButton {
        let button: UIButton = UIButton()
        button.accessibilityIdentifier = "button_identifier_\(id)"
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: type.customFont, size: fontSize)
        button.layer.cornerRadius = corner
        button.addBackgroundColor(addColor: bgColor)
        button.setTitleColor(textColor.color, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        if isBorder {
            button.layer.borderColor = borderColor.color.cgColor
            button.layer.masksToBounds = true
            button.layer.borderWidth = 1.0
        }
        return button
    }
    
    public func tableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) -> UITableView {
        let tableView: UITableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.addBackgroundColor(addColor: .white)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        return tableView
    }
    
    public func textView(id: String, size: CGFloat, addColor: AppColor, align: NSTextAlignment) -> UITextView {
        let textView:UITextView = UITextView()
        textView.addBackgroundColor(addColor: .clear)
        textView.accessibilityIdentifier = "textView_identifier_\(id)"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = addColor.color
        textView.textAlignment = align
        return textView
    }
    
    public func stackView(views: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}

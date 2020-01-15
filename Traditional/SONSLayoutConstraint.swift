//
//  SONSLayoutConstraint.swift
//  PrototypeCocoa
//
//  Created by Ha, Quang on 2020/01/03.
//  Copyright © 2020 Quang. All rights reserved.
//

import SwiftUI

// originally from: https://stackoverflow.com/questions/26180822/how-to-add-constraints-programmatically-using-swift
fileprivate class SONSLayoutConstraintViewController: UIViewController {
    enum Demo {
        case centerAndSize
        case usingActivate
        case usingAnchor
    }
    var demoCase : Demo = .centerAndSize
    
    override func viewDidLoad() {
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        newView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newView)
        switch demoCase {
        case .centerAndSize:
            
            let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
            let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
            view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        case .usingActivate:
            let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
            let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
             NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        case .usingAnchor:
            newView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            newView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1).isActive = true
        }
        
    }
}

struct SONSLayoutConstraint_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewControllerPreview{
                let s = SONSLayoutConstraintViewController()
                s.demoCase = .usingAnchor
                return s
            }
            .previewLayout(.fixed(width: 200, height: 200))
            
            UIViewControllerPreview{
                SONSLayoutConstraintViewController()
            }.environment(\.colorScheme, ColorScheme.dark)
            UIViewControllerPreview{
                let s = SONSLayoutConstraintViewController()
                s.demoCase = .usingActivate
                return s
            }
        }
    }
}

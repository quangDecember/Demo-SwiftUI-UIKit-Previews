//
//  PageViewController+SwiftUIView.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import SwiftUI

fileprivate class SimpleImageViewController: UIViewController {
    var imageName: String?
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        self.imageName = name
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        if let i = imageName, let image = UIImage(systemName: i) {
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(imageView)
            imageView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.0).isActive = true
            imageView.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1.0).isActive = true
        }
    }
}
struct PageViewController_SwiftUIView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var controllers: [UIViewController] = []
    
    @Binding var currentPage: Int
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController_SwiftUIView
        init(_ pageViewController: PageViewController_SwiftUIView) {
            self.parent = pageViewController
        }
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            guard index != 0 else {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            guard index + 1 < parent.controllers.count else { return nil }
            
            return parent.controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}



struct PageViewController_SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewControllerPreview {
                SimpleImageViewController(name: "alarm.fill")
            }
            PageViewController_SwiftUIView(controllers: [
                SimpleImageViewController(name: "arkit"),
                SimpleImageViewController(name: "arrow.clockwise")
            ], currentPage: .constant([0,1].randomElement()!))
        }
    }
}

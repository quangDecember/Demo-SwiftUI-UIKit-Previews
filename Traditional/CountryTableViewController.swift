//
//  CountryTableViewController.swift
//  Demo-SwiftUI-UIKit-Previews
//
//  Created by Quang Hà on 15/1/20.
//  Copyright © 2020 Quang Hà. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryNativeName: UILabel!
    
}

class CountryTableViewController: UITableViewController {
    var countryList = [Country]() {
        didSet {
            if self.isViewLoaded {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.badge.xmark"), style: .plain, target: self, action: #selector(closeTable))
        self.navigationItem.setLeftBarButton(closeButton, animated: true)
        //self.navigationController?.isToolbarHidden = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryList.count
    }

    // MARK: data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseID", for: indexPath) as! CountryTableViewCell
        let i = indexPath.row
        cell.flag.text = flag(country: countryList[i].alpha2Code)
        cell.countryName.text = countryList[i].name
        cell.countryNativeName.text = countryList[i].nativeName
        return cell
    }
    
    // MARK: delegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let countryCell = cell as? CountryTableViewCell {
            countryCell.countryNativeName.backgroundColor = UIColor.systemBlue
            countryCell.countryName.font = .systemFont(ofSize: 20, weight: .black)
        }
    }
    
    // MARK: additional
    @objc func closeTable() {
        self.dismiss(animated: true, completion: nil)
    }
}
#if DEBUG
struct PreviewCollection {
    static func singleCountryList() -> UIViewController {
        let v = UIStoryboard.init(name: "Traditional", bundle: nil).instantiateViewController(identifier: "countryTable") as! CountryTableViewController
        v.countryList = try! JSONDecoder().decode([Country].self, from: MockServerResponse.allCountries.data(using: .utf8)!)
        return v
    }
    static func countryListNavigation() -> UINavigationController {
        let n = UINavigationController()
        n.pushViewController(PreviewCollection.singleCountryList(), animated: true)
        return n
    }
    static func countryTableWithAlert() -> UIViewController {
        let alert = UIAlertController(title: "Warning", message: "some countries are at war", preferredStyle: .alert)
        alert.addAction(.init(title: "Done", style: .cancel, handler: nil))
        let v = singleCountryList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            v.present(alert, animated: true, completion: nil)
        })
        return v
    }
}
import SwiftUI
struct PreviewCountryTableViewController: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewControllerPreview {
                PreviewCollection.singleCountryList()
            }
            UIViewControllerPreview {
                PreviewCollection.countryListNavigation()
            }
            UIViewControllerPreview {
                PreviewCollection.countryTableWithAlert()
            }
        }
    }
}

#endif

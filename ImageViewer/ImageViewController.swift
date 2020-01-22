//
//  ViewController.swift
//  ImageViewer
//
//  Created by Elena Kulakova on 2020-01-22.
//  Copyright © 2020 Elena Kulakova. All rights reserved.
//

import UIKit

class ImageViewController: UITableViewController {
    
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("Animal") {
                images.append(item)
                
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        return cell
    }
    
    
    
}


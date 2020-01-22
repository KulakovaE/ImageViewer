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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("Animal") {
                images.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath)
        if let text = images[indexPath.row] as? String {
            cell.textLabel?.text = text.replacingOccurrences(of: "Animal_", with: "").replacingOccurrences(of: ".png", with: "").replacingOccurrences(of: ".jpg", with: "")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            vc.selectedImage = images[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


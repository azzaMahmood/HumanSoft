//
//  ProfileViewController.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var albumsTableView: UITableView!
    
    let viewModel = ProfileViewModel(galleryAPI: GalleryAPI())
    var albumsData: Albums?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        setupTableView()
    }
    
    func setupProfile() {
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.name.bind { [weak self] (name) in
            self?.nameLabel.text = name
        }
        viewModel.address.bind { [weak self] (address) in
            self?.addressLabel.text = address
        }
    }
    
    func setupTableView() {
        albumsTableView.dataSource = self
        albumsTableView.delegate = self
        viewModel.albums.bind { [weak self] (albumsData) in
            guard let albumsData = albumsData else { return }
            self?.albumsData = albumsData
            DispatchQueue.main.async {
                self?.albumsTableView.reloadData()
                self?.albumsTableView.animate()
            }
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let albumsData = albumsData else { return 0 }
        return albumsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        if let  albumData = albumsData?[indexPath.row] {
            cell.configureCellDescription(albumTitle: albumData.title)
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}


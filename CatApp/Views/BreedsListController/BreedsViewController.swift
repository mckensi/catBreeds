//
//  BreedsViewController.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import UIKit
import SVProgressHUD
import NotificationBannerSwift

class BreedsViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = BreedsViewModel()
    
    private var breeds : [BreedRes]?
    
    private var currentPage : Int = 0
    
    private var isPaginationEnable: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        setUpSearchBar()
        initListeners()
        SVProgressHUD.show()
        viewModel.getBreedsCats(page: currentPage)
        // Do any additional setup after loading the view.
        
    }
    
    private func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        let nibCell = UINib(nibName: "BreedsTableViewCell", bundle: nil)
        tableView.register(nibCell.self, forCellReuseIdentifier: "breedCell")
    }
    
    private func setUpSearchBar(){
        searchBar.delegate = self
        searchBar.placeholder = "Search by breed name"
    }
    
    private func initListeners(){
        viewModel.listBreedsCatsRes = { [weak self] breeds in
            guard let strongSelf = self else{return}
            if strongSelf.currentPage != 0 {
                strongSelf.breeds?.append(contentsOf: breeds)
            }else{
                strongSelf.breeds = breeds
            }
           
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
                SVProgressHUD.dismiss()
            }
        }
        
        viewModel.listBreedsCatsByNameRes = { [weak self] breeds in
            guard let strongSelf = self else{return}
            strongSelf.breeds = breeds
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
                SVProgressHUD.dismiss()
            }
        }
        
        viewModel.onFailure = {
            let banner = NotificationBanner(title: "Error", subtitle: "Ocurrio un problema con tu busqueda, trabajamos para resolverlo.", style: .danger)
            banner.backgroundColor = .systemYellow
            banner.show()
        }
    }
    
}

extension BreedsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BreedDetailViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.idBreed = breeds?[indexPath.row].id
        self.present(vc, animated: true, completion: nil)
    }
}

extension BreedsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell") as? BreedsTableViewCell
        cell?.labelName.text = breeds?[indexPath.row].name ?? ""
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let numberLimit = breeds?.count else {return}
        if isPaginationEnable{
            if indexPath.row == numberLimit - 3{
                currentPage = currentPage + 1
                viewModel.getBreedsCats(page: currentPage)
            }
        }
        
    }
    
}

extension BreedsViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        isPaginationEnable = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        if(searchBar.text == ""){
            isPaginationEnable = true
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        
        if(searchBar.text == ""){
            isPaginationEnable = true
            currentPage = 0
            viewModel.getBreedsCats(page: currentPage)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let textToSearch = searchBar.text ?? ""
        SVProgressHUD.show()
        if textToSearch == ""{
            currentPage = 0
            viewModel.getBreedsCats(page: currentPage)
        }else{
            viewModel.getBreedsCatsByName(textSearch: textToSearch)
        }

    }
}

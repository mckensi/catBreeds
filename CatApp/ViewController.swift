//
//  ViewController.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import UIKit
import Koloda
import Kingfisher
import SVProgressHUD
import NotificationBannerSwift

class ViewController: UIViewController {
    
    private var imageCats : [String]?
    private var imageCatsRes : [ImageBreedRes]?
    private var viewModel = CatsViewModel()
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        initListener()
        SVProgressHUD.show()
        viewModel.getBreedsCats(page: 0)
        
    }
    
    private func initListener(){
        viewModel.imagesCatsRes = { [weak self] response in
            guard let strongSelf = self else {return}
            strongSelf.imageCatsRes = response
            if response.count > 0 {
                var images = [String]()
                for res in response{
                    let imageUrl = res.url
                    images.append(imageUrl ?? "")
                }
                strongSelf.imageCats = images
                DispatchQueue.main.async {
                    strongSelf.kolodaView.reloadData()
                    SVProgressHUD.dismiss()
                }
            }
        }
        
        viewModel.addVote = {
            print("Voto guardado")
        }
        
        viewModel.onFailure = {
            let banner = NotificationBanner(title: "Error", subtitle: "Ocurrio un problema con tu busqueda, trabajamos para resolverlo.", style: .danger)
            banner.backgroundColor = .systemYellow
            banner.show()
            SVProgressHUD.dismiss()
        }
    }
}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        guard let image = imageCatsRes?[index] else{return}
        switch direction {
        case .left:
            print("no me gusta")
            viewModel.addVoteLike(id: image.id ?? "", urlImage: image.url ?? "", voteLike: false)
        case .right:
            print("me gusta")
            viewModel.addVoteLike(id: image.id ?? "", urlImage: image.url ?? "", voteLike: true)
        default:
            print("No hice nada")
        }
    }
}


extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return imageCats?.count ?? 0
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageView = UIImageView()
        if let count = imageCats?.count, count > 0{
            if let url = URL(string: imageCats?[index] ?? ""){
                imageView.kf.setImage(with: url)
            }
            
        }
        
        return imageView
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return OverlayView()
    }
}

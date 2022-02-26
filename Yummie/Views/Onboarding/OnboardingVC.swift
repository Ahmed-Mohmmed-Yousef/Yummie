//
//  OnboardingVC.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides = [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
        OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
        OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
    ]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            print("Go to start")
        } else {
            currentPage += 1
            let indexPaht = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPaht, at: .centeredHorizontally, animated: true)
        }
        
    }
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.id, for: indexPath) as! OnboardingCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
}

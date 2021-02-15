//1つ目の画面

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextBottun: UIButton!
    
    
    var imageArray :[UIImage] = [
        UIImage(named: "IMG_5800.JPG")!,
        UIImage(named: "IMG_5801.JPG")!,
        UIImage(named: "IMG_5802.JPG")!,
        UIImage(named: "IMG_5803.JPG")!,
        UIImage(named: "IMG_5804.JPG")!,
        UIImage(named: "IMG_5805.JPG")!,
        UIImage(named: "IMG_5806.JPG")!,
        UIImage(named: "IMG_5807.JPG")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[0]
        
    }
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    //再生
    @IBAction func slideShowButton(_ sender: Any) {
        
        // 再生中か停止しているかを判定
        if timer == nil {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            nextBottun.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextBottun.isEnabled = true
        }
    }
    //進む
    @objc func changeImage() {
        nowIndex += 1
        if nowIndex == imageArray.count {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    //戻る
    @objc func changeImage2() {
        nowIndex -= 1
        if nowIndex < 0 {
            nowIndex = imageArray.count - 1
        }
        imageView.image = imageArray[nowIndex]
    }
    //進むボタン
    @IBAction func nextPage(_ sender: Any) {
        changeImage()
    }
    //戻るボタン
    @IBAction func backPage(_ sender: Any) {
        changeImage2()
    }
    
    
    
    //画像から拡大画像で表示する。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = imageArray[nowIndex]
        
        
        if timer != nil {
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextBottun.isEnabled = true
        }
        
        
    }
    //拡大画面から戻ってくる。
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

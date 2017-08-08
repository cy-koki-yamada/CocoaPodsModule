import UIKit

public class MainViewController: UIViewController {
    
    var createSubViewController: (() -> UIViewController)?
    
    public func setSubViewControllerCreator(subViewControllerCreator: @escaping () -> UIViewController) {
        createSubViewController = subViewControllerCreator
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        let nextButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        nextButton.setTitle("Sub View", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y: 100)
        nextButton.addTarget(self, action: #selector(nextViewController), for: .touchUpInside)
        
        self.view.addSubview(nextButton);
    }
    
    func nextViewController(sender: UIButton) {
        let subViewController: UIViewController = createSubViewController!();
        subViewController.modalTransitionStyle = .coverVertical
        self.present(subViewController, animated: true, completion: nil)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


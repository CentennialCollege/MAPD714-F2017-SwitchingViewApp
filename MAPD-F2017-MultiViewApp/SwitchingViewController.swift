import UIKit

class SwitchingViewController: UIViewController{
    // PRIVATE INSTANCE VARIABLES
    private var _blueViewController:BlueViewController!
    private var _yellowViewController:YellowViewController!
    
    // this triggers after the applications loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        
        self._blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: self._blueViewController)
    }
    
    // triggers when the Switch View button on the Toolbar is pressed
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // instantiate the new view controller object
        if self._yellowViewController?.view.superview == nil {
            if self._yellowViewController == nil {
                self._yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        } else if self._blueViewController?.view.superview == nil {
            if self._blueViewController == nil {
                self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        // clean up current controller and attach the new one
        if self._blueViewController != nil && self._blueViewController!.view.superview != nil {
            self._yellowViewController.view.frame = view.frame
            switchViewController(from: self._blueViewController, to: self._yellowViewController)
        } else {
            self._blueViewController.view.frame = view.frame
            switchViewController(from: self._yellowViewController, to: self._blueViewController)
        }
    }
    
    private func switchViewController(from fromVC: UIViewController?,
                                      to toVC: UIViewController?) {
        
        // cleans up current view controller
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if self._blueViewController != nil && self._blueViewController!.view.superview == nil {
            self._blueViewController = nil
        }
        
        if self._yellowViewController != nil  && self._yellowViewController.view.superview == nil {
            self._yellowViewController = nil
        }
    }

}











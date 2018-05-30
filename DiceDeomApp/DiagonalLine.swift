import UIKit

@IBDesignable class DiagonalLine: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var flip: Bool = false
    @IBInspectable var color: UIColor = UIColor.black
  
    var path: UIBezierPath!
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
        if self.flip {
            
            aPath.move(to: CGPoint(x: 0, y: 0))
            aPath.addLine(to: CGPoint(x: rect.width, y: rect.height))
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
        } else {
           
            
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
        }
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
   
    
}


@IBDesignable class DiagonalLineCenter: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var flip: Bool = false
    @IBInspectable var color: UIColor = UIColor.black
    
    var path,path2,path3,path4: UIBezierPath!
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
        if self.flip {
            
            
            self.createTriangle1()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 255.0/256.0, green: 251.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path.stroke()
            
            
            self.createTriangle2()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 255.0/256.0, green: 38.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path2.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path2.stroke()
            
            
            
            self.createTriangle3()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 0.0/256.0, green: 253.0/256.0, blue: 255.0/256.0, alpha: 1.0).setFill()
            path3.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path3.stroke()
            
            self.createTriangle4()
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 142.0/256.0, green: 250.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path4.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path4.stroke()
            
            aPath.move(to: CGPoint(x: 0, y: 0))
            aPath.addLine(to: CGPoint(x: rect.width, y: rect.height))
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
        } else {
            self.createTriangle1()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 255.0/256.0, green: 251.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path.stroke()
            
            
            self.createTriangle2()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 255.0/256.0, green: 38.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path2.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path2.stroke()
            
            
            self.createTriangle3()
            
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 0.0/256.0, green: 253.0/256.0, blue: 255.0/256.0, alpha: 1.0).setFill()
            path3.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path3.stroke()
            
            self.createTriangle4()
            // Specify the fill color and apply it to the path.
            UIColor(displayP3Red: 142.0/256.0, green: 250.0/256.0, blue: 0.0/256.0, alpha: 1.0).setFill()
            path4.fill()
            
            // Specify a border (stroke) color.
            UIColor.black.setStroke()
            path4.stroke()
            
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
            aPath.move(to: CGPoint(x: 0, y: rect.height))
            aPath.addLine(to: CGPoint(x: rect.width, y: 0))
        }
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
    
    func createTriangle1() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    func createTriangle2() {
        path2 = UIBezierPath()
        path2.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path2.close()
    }
    
    func createTriangle3() {
        path3 = UIBezierPath()
        path3.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path3.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path3.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path3.close()
    }
    func createTriangle4() {
        path4 = UIBezierPath()
        path4.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path4.addLine(to: CGPoint(x: self.frame.size.height, y: 0.0))
        path4.addLine(to: CGPoint(x: self.frame.size.width, y:self.frame.size.height))
        path4.close()
    }
    
    
}


@IBDesignable class ArrowLeft: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var color: UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
       
            aPath.move(to: CGPoint(x: 10, y:rect.height/2 ))
            aPath.addLine(to: CGPoint(x: rect.width-10, y: rect.height/2))
        
            aPath.move(to: CGPoint(x: 20, y:rect.height/3+5 ))
            aPath.addLine(to: CGPoint(x: 10, y: rect.height/2))
        
            aPath.move(to: CGPoint(x: 20, y:(rect.height/2+rect.height/5)-7 ))
            aPath.addLine(to: CGPoint(x: 10, y: rect.height/2))
        
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
}
@IBDesignable class ArrowRignt: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var color: UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
        
        aPath.move(to: CGPoint(x: 10, y:rect.height/2 ))
        aPath.addLine(to: CGPoint(x: rect.width-10, y: rect.height/2))
        
        aPath.move(to: CGPoint(x: rect.width-20, y:rect.height/3+5 ))
        aPath.addLine(to: CGPoint(x: rect.width-10, y: rect.height/2))
       
        aPath.move(to: CGPoint(x: rect.width-20, y:(rect.height/2+rect.height/5)-7 ))
        aPath.addLine(to: CGPoint(x: rect.width-10, y: rect.height/2))
        
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
}
@IBDesignable class ArrowUP: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var color: UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
        
        aPath.move(to: CGPoint(x: rect.width/2, y:10 ))
        aPath.addLine(to: CGPoint(x: rect.width/2, y: rect.height-10))
        
        aPath.move(to: CGPoint(x: rect.width/2, y:10))
        aPath.addLine(to: CGPoint(x: (rect.width/2)+9, y: rect.height/3-2))
        
        aPath.move(to: CGPoint(x: rect.width/2, y:10))
        aPath.addLine(to: CGPoint(x: rect.width/5+13, y: rect.height/3-2))

      
        
        
        
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
}


@IBDesignable class ArrowDwon: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var color: UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.lineWidth = self.lineWidth
        
        aPath.move(to: CGPoint(x: rect.width/2, y:10 ))
        aPath.addLine(to: CGPoint(x: rect.width/2, y: rect.height-10))
        
        aPath.move(to: CGPoint(x:  rect.width/2, y: rect.height-10 ))
        aPath.addLine(to: CGPoint(x: rect.width/2+10, y: (rect.height/3)+(rect.height/3)))
        
        aPath.move(to: CGPoint(x:  rect.width/2, y: rect.height-10 ))
        aPath.addLine(to: CGPoint(x: (rect.width/2)-10, y: (rect.height/3)+(rect.height/3)))
        
        
        
        
        aPath.close()
        self.color.set()
        aPath.stroke()
    }
    
}








float eachblockarea,eachcirarea,allcir=0;
Ball[] nextBall;
int n = 5;
String status[] = {};

void setup()
{
  size(1000, 800);
  nextBall = new Ball[n];
  for(int i=0; i<n; i++)
  {
    float r_width = random(150, 850);
    float r_height = random(150, 650);
    float r_size = random(50, 300);
    nextBall[i] = new Ball(r_width, r_height, r_size);
    status[i] = "1";
    eachcirarea=nextBall[i].getBallArea();
    allcir=allcir+eachcirarea;
  }
  println("total ball area : "+allcir);
}

void draw()
{
 
  background(255);
   for(int p=0;p<5;p++)
   {
    if(nextBall[p].show)
      {
       nextBall[p].draw();
      }
   } 
}

void mousePressed()
{
  for(int p=0;p<n;p++)
  {
    
    if(dist(mouseX,mouseY,nextBall[p].position_x,nextBall[p].position_y)<(nextBall[p].size/2))
    {
      delay(150);
      if(nextBall[p].show==true)
      {
        allcir=allcir-nextBall[p].getBallArea();
        nextBall[p].show=false; 
        status[p] = "0";
      }
      if (status[p] = "0")
      {
        if(nextBall[p].show==false)
        {
          allcir=allcir+nextBall[p].getBallArea();
          nextBall[p].show=true;
          status[p] = "1";
        }
      }
    }
  }
println(" Ball area left "+allcir); 
}  

public class Ball
{
  boolean show=true;
  float position_x;
  float position_y;
  float size;

  public Ball(float position_x, float position_y, float size)  // Constructor
  {
    this.position_x = position_x;
    this.position_y = position_y;
    this.size = size;
  }
  void draw()
  {
    ellipse(position_x,position_y,size,size);
  }
  public float getBallArea()
   {
     float ballarea;  
     ballarea=(this.size/2)*(this.size/2)*3.14;
     //this.ballarea=ballarea;
     //print(ballarea+" ");
     return ballarea;

   }
}

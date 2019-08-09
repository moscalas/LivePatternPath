class lineaCompleta
{
  
  AudioSample borders;
  AudioSample inPoint;
  
  boolean sonidoPts = true;
  boolean sonidoXtr = true;
  
  float speed = 1;
  float pos;
  float c0, c1, c2 = 255;
  float c3 = 255;
  boolean mov;
  
  int numCirculos;
  int posx[];
  int posy;
  int distCirculos;
  int posXBola;
  int dir = 1;
  int xBorder = 10;
  int angulo = 0;
  
  int temp = 1;
  int temp2 = 20;
  int temp3 = 10;
  

    
  lineaCompleta(String cancionExtremo, String cancionPunto, int numeroCirculos, int distanciaCirculos, boolean movimiento, int Ypos, int Xpos) 
  {       
    borders = minim.loadSample(cancionExtremo,512);
    inPoint = minim.loadSample(cancionPunto,512);          
                           
    noStroke();
    
    numCirculos = numeroCirculos;
    distCirculos = distanciaCirculos; 
    mov = movimiento;
    posy = Ypos;
    posXBola = Xpos;
      
    posx = new int[numCirculos];
    
    for(int i=0; i<numCirculos; i++)
    {
      posx[i] = (i*distCirculos)+xBorder;   
    }
    
    posXBola = posx[0]+10;
  }
  
  void update(boolean movi, float blend, float redColor, float greenColor, float blueColor, float vel, int distancia, int numPuntos, int y, int x, int ang, boolean mutePoints, boolean muteBorders) 
  {
    mov = movi;
    c3 = blend;
    c0 = redColor;
    c1 = greenColor;
    c2 = blueColor;
    speed = vel;
    distCirculos = distancia;
    numCirculos = numPuntos;
    posy = y;
    xBorder = x;
    angulo = ang;
    sonidoPts = mutePoints;
    sonidoXtr = muteBorders;
    
    pushMatrix();
    translate(width/2, height/2);
    rotateZ(radians(angulo));
    lights();
    
    if(temp != numCirculos || temp2 != distCirculos || temp3 != xBorder)
    {
      posx = new int[numCirculos];
    
      for(int i=0; i<numCirculos; i++)
      {
        posx[i] = (i*distCirculos)+xBorder;   
      }
      
      posXBola = posx[0]+10;
      
      temp = numCirculos;
      temp2 = distCirculos;
      temp3 = xBorder;
      //println("sisisis");
    }
          
    fill(c0, c1, c2, c3);
    for(int i =0; i<numCirculos; i++)
    {    
      ellipse(posx[i], posy, 20, 20);
    }
        
    fill(255);  
    ellipse(posXBola,posy,30,30);
    
    if( posXBola >= posx[numCirculos-1] || posXBola <= xBorder)
    {
      dir = dir * -1;
      
      if(sonidoXtr == true)
      {
        borders.trigger();
      }
    }
    if(posXBola < xBorder)
    {
      posXBola = xBorder+1;
    }
      
    for(int k=1; k<numCirculos-1; k++)
    {
      if(dist(posXBola,posy,posx[k],posy) < (speed*0.6) && dist(posXBola,posy,posx[k],posy) > -(speed*0.6))
      {
        if(sonidoPts == true)
        {
          inPoint.trigger();
        }
      }
    }
        
    if (mov) 
    {
      posXBola += speed * dir; 
    }
    popMatrix();
    
  }
  
  
  
}

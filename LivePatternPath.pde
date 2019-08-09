import controlP5.*;
import ddf.minim.*;

ControlFrame cf;
Minim minim;

lineaCompleta linea1;
lineaCompleta linea2;
lineaCompleta linea3;
lineaCompleta linea4;
lineaCompleta linea5;
lineaCompleta linea6;

boolean[] movi;
float[] blend;
float [] redColor;
float [] greenColor;
float [] blueColor;
float [] vel;
int [] distancia;
int [] numPuntos;
int [] y;
int [] x;
int [] ang;
boolean[] mutePoints;
boolean[] muteBorders;

void settings()
{
  size(1280, 768);
}

void setup() 
{
  frameRate(30);
  
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  
   minim = new Minim(this);
   
   movi = new boolean[10];
   blend = new float[10];
   redColor = new float[10];
   greenColor = new float[10];
   blueColor = new float[10];
   vel = new float[10];
   distancia = new int[10];
   numPuntos = new int[10];
   y = new int[10];
   x = new int[10];
   ang = new int[10];
   mutePoints = new boolean[10];
   muteBorders = new boolean[10];
   
   for(int i=0; i<10; i++)
   {
     movi[i] = false;  
     blend[i] = 255; 
     redColor[i] = 255;
     greenColor[i] = 0;
     blueColor[i] = 0;
     vel[i] = 1;
     distancia[i] = 50;
     numPuntos[i] = 4;
     y[i] = 0;
     x[i] = 0;
     ang[i] = 0;
     mutePoints[i] = true;
     muteBorders[i] = true;
   }
   
  //String cancionExtremo, String cancionPunto, int numeroCirculos, int distanciaCirculos, boolean movimiento, int Ypos, int Xpos
  linea1 = new lineaCompleta("linea1Extremos.WAV","linea1Puntos.WAV",4,60,false,20,0); 
  linea2 = new lineaCompleta("linea2Extremos.WAV","linea2Puntos.WAV",4,60,false,20,0);
  linea3 = new lineaCompleta("linea3Extremos.WAV","linea3Puntos.WAV",4,60,false,20,0);
  linea4 = new lineaCompleta("linea4Extremos.WAV","linea4Puntos.WAV",4,60,false,20,0);
  linea5 = new lineaCompleta("linea5Extremos.WAV","linea5Puntos.WAV",4,60,false,20,0);
  linea6 = new lineaCompleta("linea6Extremos.WAV","linea6Puntos.WAV",4,60,false,20,0);
}


void draw() 
{
   background(0);
   linea1.update(movi[0], blend[0], redColor[0], greenColor[0], blueColor[0], vel[0], distancia[0], numPuntos[0], y[0], x[0], ang[0], mutePoints[0], muteBorders[0]);
   linea2.update(movi[1], blend[1], redColor[1], greenColor[1], blueColor[1], vel[1], distancia[1], numPuntos[1], y[1], x[1], ang[1], mutePoints[1], muteBorders[1]);
   linea3.update(movi[2], blend[2], redColor[2], greenColor[2], blueColor[2], vel[2], distancia[2], numPuntos[2], y[2], x[2], ang[2], mutePoints[2], muteBorders[2]);
   linea4.update(movi[3], blend[3], redColor[3], greenColor[3], blueColor[3], vel[3], distancia[3], numPuntos[3], y[3], x[3], ang[3], mutePoints[3], muteBorders[3]);
   linea5.update(movi[4], blend[4], redColor[4], greenColor[4], blueColor[4], vel[4], distancia[4], numPuntos[4], y[4], x[4], ang[4], mutePoints[4], muteBorders[4]);
   linea6.update(movi[5], blend[5], redColor[5], greenColor[5], blueColor[5], vel[5], distancia[5], numPuntos[5], y[5], x[5], ang[5], mutePoints[5], muteBorders[5]);

}






class ControlFrame extends PApplet 
{
  int w, h;
  PApplet parent;
  
  ControlP5 cp5;
  ControlP5 cp5Linea1;
  ControlP5 cp5Linea2;
  ControlP5 cp5Linea3;
  ControlP5 cp5Linea4;
  ControlP5 cp5Linea5;
  ControlP5 cp5Linea6;
  
  Accordion accordion;
  Group g1;
  Group g2;
  Group g3;
  Group g4;
  Group g5;
  Group g6;
  
  Controlador controlador1;
  Controlador controlador2;
  Controlador controlador3;
  Controlador controlador4;
  Controlador controlador5;
  Controlador controlador6;
  
  String linea1estado = "A";
  String linea2estado = "A";
  String linea3estado = "A";
  String linea4estado = "A";
  String linea5estado = "A";
  String linea6estado = "A";
  
  boolean iniciar = false;
  
  String inputTextActivado = "";
 
  String textoseclinea1 = "";
  String textoseclinea2 = "";
  String textoseclinea3 = "";
  String textoseclinea4 = "";
  String textoseclinea5 = "";
  String textoseclinea6 = "";

  String textominlinea1 = "";
  String textominlinea2 = "";
  String textominlinea3 = "";
  String textominlinea4 = "";
  String textominlinea5 = "";
  String textominlinea6 = "";
  
  String textohourlinea1 = "";
  String textohourlinea2 = "";
  String textohourlinea3 = "";
  String textohourlinea4 = "";
  String textohourlinea5 = "";
  String textohourlinea6 = "";
  
  public ControlFrame(PApplet _parent, int _w, int _h, String _name) 
  {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings() 
  {
    size(w, h);
  }
  
  public void setup() 
  {
    surface.setLocation(0, 10);
    
    cp5 = new ControlP5(this);
    cp5Linea1 = new ControlP5(this);
    cp5Linea2 = new ControlP5(this);
    cp5Linea3 = new ControlP5(this);
    cp5Linea4 = new ControlP5(this);
    cp5Linea5 = new ControlP5(this);
    cp5Linea6 = new ControlP5(this);
    
    // group number 1
    g1 = cp5Linea1.addGroup("LINEA 1")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;
    //ControlP5 cp5, String lineaR, Group grupo, int posXtiempo, int posYtiempo, int idLinea
    controlador1 = new Controlador(cp5Linea1,"linea1", g1, 50, 15, 1);  
    
    g2 = cp5Linea2.addGroup("LINEA 2")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador2 = new Controlador(cp5Linea2,"linea2", g2, 50, 45, 2);  
        
    g3 = cp5Linea3.addGroup("LINEA 3")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador3 = new Controlador(cp5Linea3,"linea3", g3, 50, 75, 3);  
    
    g4 = cp5Linea4.addGroup("LINEA 4")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador4 = new Controlador(cp5Linea4,"linea4", g4, 250, 15, 4);  
    
    g5 = cp5Linea5.addGroup("LINEA 5")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador5 = new Controlador(cp5Linea5,"linea5", g5, 250, 45, 5);  
    
    g6 = cp5Linea6.addGroup("LINEA 6")
            .setBackgroundColor(color(0, 64))
            .setBackgroundHeight(590)
            ;

    controlador6 = new Controlador(cp5Linea6,"linea6", g6, 250, 75, 6);  
    
    
    accordion = cp5.addAccordion("acc")
                 .setPosition(10,100)
                 .setWidth(380)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 .addItem(g5)
                 .addItem(g6)
                 ;
                 
    accordion.open(0);
    
    // when in SINGLE mode, only 1 accordion group can be open at a time.  
    accordion.setCollapseMode(Accordion.SINGLE);
  }

  void draw()
  {
     background(0);
     
     text("LINEA 1:",10,20);
     text("SET:",10,30);
     text(linea1estado,35,30);
     controlador1.update();
     
     text("LINEA 2:",10,50);     
     text("SET:",10,60);
     text(linea2estado,35,60);
     controlador2.update();
     
     text("LINEA 3:",10,80);     
     text("SET:",10,90);
     text(linea3estado,35,90);
     controlador3.update();
     
     text("LINEA 4:",210,20);
     text("SET:",210,30);
     text(linea4estado,235,30);
     controlador4.update();
     
     text("LINEA 5:",210,50);
     text("SET:",210,60);
     text(linea5estado,235,60);
     controlador5.update();
     
     text("LINEA 6:",210,80);
     text("SET:",210,90);
     text(linea6estado,235,90);
     controlador6.update();
     
     if(controlador1.getSegundo() == 1)
     {
       iniciar = true;
     }
  }
  
  void controlEvent(ControlEvent theEvent) 
  {
    /*println(
    "## controlEvent / id:"+theEvent.controller().getId()+
    " / name:"+theEvent.controller().getName()+
    " / value:"+theEvent.controller().getValue()
    );*/
    
    if(iniciar == true)
    {
      if (theEvent.getController().getName().equals("state"))
      {
         opcionEstado(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("movimiento"))
      {
         opcionMov(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("blend"))
      {
        opcionTransparencia(theEvent.controller().getId());         
      }
      
      if (theEvent.getController().getName().equals("color-red"))
      {
        opcionRojo(theEvent.controller().getId());              
      }
      
      if (theEvent.getController().getName().equals("color-green"))
      {
        opcionVerde(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("color-blue"))
      {
        opcionAzul(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("speed"))
      {
        opcionVelocidad(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("Distancia"))
      {
        opcionDistancia(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("NumPuntos"))
      {
        opcionPuntos(theEvent.controller().getId()); 
      }
      
      if (theEvent.getController().getName().equals("Y"))
      {
        opcionPosY(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("X"))
      {
        opcionPosX(theEvent.controller().getId()); 
      }     
      
      if (theEvent.getController().getName().equals("Z"))
      {
        opcionAngulo(theEvent.controller().getId());
      } 
      
      if (theEvent.getController().getName().equals("sonidoPuntos"))
      {
        opcionSonidoPuntos(theEvent.controller().getId());
      }
      
      if (theEvent.getController().getName().equals("sonidoExtremos"))
      {
         opcionSonidoExtremos(theEvent.controller().getId());
      }
      
      if(theEvent.isAssignableFrom(Textfield.class)) 
      {
            if(theEvent.getName().equals("hora"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.hora(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.hora(theEvent.getStringValue());
              }
            }
            
            if(theEvent.getName().equals("minuto"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.minuto(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.minuto(theEvent.getStringValue());
              }
            }
            
            if(theEvent.getName().equals("segundo"))
            {
              if(theEvent.controller().getId() == 1)
              {
                controlador1.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 2)
              {
                controlador2.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 3)
              {
                controlador3.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 4)
              {
                controlador4.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 5)
              {
                controlador5.segundo(theEvent.getStringValue());
              }
              if(theEvent.controller().getId() == 6)
              {
                controlador6.segundo(theEvent.getStringValue());
              }
            }            
      }
      
      if(theEvent.getController().getName().equals("guardarA"))
      {
        opcionGuardarA(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarA"))
      {
        opcionaCargarA(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarB"))
      {
        opcionGuardarB(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarB"))
      {
        opcionaCargarB(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarC"))
      {
        opcionGuardarC(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarC"))
      {
        opcionaCargarC(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarD"))
      {
        opcionGuardarD(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarD"))
      {
        opcionaCargarD(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarE"))
      {
        opcionGuardarE(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarE"))
      {
        opcionaCargarE(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarF"))
      {
        opcionGuardarF(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarF"))
      {
        opcionaCargarF(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarG"))
      {
        opcionGuardarG(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarG"))
      {
        opcionaCargarG(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarH"))
      {
        opcionGuardarH(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarH"))
      {
        opcionaCargarH(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarI"))
      {
        opcionGuardarI(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarI"))
      {
        opcionaCargarI(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("guardarJ"))
      {
        opcionGuardarJ(theEvent.controller().getId());
      }
      
      if(theEvent.getController().getName().equals("cargarJ"))
      {
        opcionaCargarJ(theEvent.controller().getId());
      }
      
    }        
  }
  
  void opcionEstado(int id)
  {
    if(id == 1)
    {
      linea1estado = controlador1.getSet();
    }
    if(id == 2)
    {
      linea2estado = controlador2.getSet();
    }
    if(id == 3)
    {
      linea3estado = controlador3.getSet();
    }
    if(id == 4)
    {
      linea4estado = controlador4.getSet();
    }
    if(id == 5)
    {
      linea5estado = controlador5.getSet();
    }
    if(id == 6)
    {
      linea6estado = controlador6.getSet();
    }
  }
  
  void opcionMov(int id)
  {
    if(id == 1)
    {
       if(controlador1.getValueMovimiento() == 1)
       {
         movi[0] = true;       
       }
       else if(controlador1.getValueMovimiento() == 0)
       {
         movi[0] = false; 
       }
    }    
    if(id == 2)
    {
       if(controlador2.getValueMovimiento() == 1)
       {
         movi[1] = true;       
       }
       else if(controlador2.getValueMovimiento() == 0)
       {
         movi[1] = false; 
       }
    }    
    if(id == 3)
    {
       if(controlador3.getValueMovimiento() == 1)
       {
         movi[2] = true;       
       }
       else if(controlador3.getValueMovimiento() == 0)
       {
         movi[2] = false; 
       }
    }
    if(id == 4)
    {
       if(controlador4.getValueMovimiento() == 1)
       {
         movi[3] = true;       
       }
       else if(controlador4.getValueMovimiento() == 0)
       {
         movi[3] = false; 
       }
    }
    if(id == 5)
    {
       if(controlador5.getValueMovimiento() == 1)
       {
         movi[4] = true;       
       }
       else if(controlador5.getValueMovimiento() == 0)
       {
         movi[4] = false; 
       }
    }
    if(id == 6)
    {
       if(controlador6.getValueMovimiento() == 1)
       {
         movi[5] = true;       
       }
       else if(controlador6.getValueMovimiento() == 0)
       {
         movi[5] = false; 
       }
    }
  }
  
  void opcionTransparencia(int id)
  {
    if(id == 1)
    {
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
      blend[0] = controlador1.getValueTransparent();
    }    
    if(id == 2)
    {
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
      blend[1] = controlador2.getValueTransparent();
    }    
    if(id == 3)
    {
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
      blend[2] = controlador3.getValueTransparent();
    }
    if(id == 4)
    {
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
      blend[3] = controlador4.getValueTransparent();
    }
    if(id == 5)
    {
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
      blend[4] = controlador5.getValueTransparent();
    }
    if(id == 6)
    {
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
      blend[5] = controlador6.getValueTransparent();
    }
  }
  
  void opcionRojo(int id)
  {
    if(id == 1)
    {
      redColor[0] = controlador1.getValueColorRed();
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
    }    
    if(id == 2)
    {
      redColor[1] = controlador2.getValueColorRed();
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
    }    
    if(id == 3)
    {
      redColor[2] = controlador3.getValueColorRed();
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
    }
    if(id == 4)
    {
      redColor[3] = controlador4.getValueColorRed();
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
    }
    if(id == 5)
    {
      redColor[4] = controlador5.getValueColorRed();
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
    }
    if(id == 6)
    {
      redColor[5] = controlador6.getValueColorRed();
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
    }
  }
  
  void opcionVerde(int id)
  {
    if(id == 1)
    {
      greenColor[0] = controlador1.getValueColorGreen(); 
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));   
    }       
    if(id == 2)
    {
      greenColor[1] = controlador2.getValueColorGreen(); 
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));   
    }    
    if(id == 3)
    {
      greenColor[2] = controlador3.getValueColorGreen(); 
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));   
    }
    if(id == 4)
    {
      greenColor[3] = controlador4.getValueColorGreen(); 
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));   
    }
    if(id == 5)
    {
      greenColor[4] = controlador5.getValueColorGreen(); 
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));   
    }
    if(id == 6)
    {
      greenColor[5] = controlador6.getValueColorGreen(); 
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));   
    }
  }
  
  void opcionAzul(int id)
  {
    if(id == 1)
    {
      blueColor[0] = controlador1.getValueColorBlue(); 
      g1.setBackgroundColor(color(controlador1.getValueColorRed(),controlador1.getValueColorGreen(),controlador1.getValueColorBlue(),controlador1.getValueTransparent()));
    }    
    if(id == 2)
    {
      blueColor[1] = controlador2.getValueColorBlue(); 
      g2.setBackgroundColor(color(controlador2.getValueColorRed(),controlador2.getValueColorGreen(),controlador2.getValueColorBlue(),controlador2.getValueTransparent()));
    }    
    if(id == 3)
    {
      blueColor[2] = controlador3.getValueColorBlue(); 
      g3.setBackgroundColor(color(controlador3.getValueColorRed(),controlador3.getValueColorGreen(),controlador3.getValueColorBlue(),controlador3.getValueTransparent()));
    }
    if(id == 4)
    {
      blueColor[3] = controlador4.getValueColorBlue(); 
      g4.setBackgroundColor(color(controlador4.getValueColorRed(),controlador4.getValueColorGreen(),controlador4.getValueColorBlue(),controlador4.getValueTransparent()));
    }
    if(id == 5)
    {
      blueColor[4] = controlador5.getValueColorBlue(); 
      g5.setBackgroundColor(color(controlador5.getValueColorRed(),controlador5.getValueColorGreen(),controlador5.getValueColorBlue(),controlador5.getValueTransparent()));
    }
    if(id == 6)
    {
      blueColor[5] = controlador6.getValueColorBlue(); 
      g6.setBackgroundColor(color(controlador6.getValueColorRed(),controlador6.getValueColorGreen(),controlador6.getValueColorBlue(),controlador6.getValueTransparent()));
    }
  }
  
  void opcionVelocidad(int id)
  {
    if(id == 1)
    {
      vel[0] = controlador1.getValueSpeed();
    }
    if(id == 2)
    {
      vel[1] = controlador2.getValueSpeed();
    }
    if(id == 3)
    {
      vel[2] = controlador3.getValueSpeed();
    }
    if(id == 4)
    {
      vel[3] = controlador4.getValueSpeed();
    }
    if(id == 5)
    {
      vel[4] = controlador5.getValueSpeed();
    }
    if(id == 6)
    {
      vel[5] = controlador6.getValueSpeed();
    }
  }
  
  void opcionDistancia(int id)
  {
    if(id == 1)
    {
      distancia[0] = int(controlador1.getValueDistance());
    }    
    if(id == 2)
    {
      distancia[1] = int(controlador2.getValueDistance());
    }
    if(id == 3)
    {
      distancia[2] = int(controlador3.getValueDistance());
    }
    if(id == 4)
    {
      distancia[3] = int(controlador4.getValueDistance());
    }
    if(id == 5)
    {
      distancia[4] = int(controlador5.getValueDistance());
    }
    if(id == 6)
    {
      distancia[5] = int(controlador6.getValueDistance());
    }
  }
  
  void opcionPuntos(int id)
  {
    if(id == 1)
    {
      numPuntos[0] = int(controlador1.getValueNumPoints());
    }    
    if(id == 2)
    {
      numPuntos[1] = int(controlador2.getValueNumPoints());
    }
    if(id == 3)
    {
      numPuntos[2] = int(controlador3.getValueNumPoints());
    }
    if(id == 4)
    {
      numPuntos[3] = int(controlador4.getValueNumPoints());
    }
    if(id == 5)
    {
      numPuntos[4] = int(controlador5.getValueNumPoints());
    }
    if(id == 6)
    {
      numPuntos[5] = int(controlador6.getValueNumPoints());
    }
  }
  
  void opcionPosY(int id)
  {
    if(id == 1)
    {
      y[0] = int(controlador1.getValuePosY()); 
    }    
    if(id == 2)
    {
      y[1] = int(controlador2.getValuePosY()); 
    }
    if(id == 3)
    {
      y[2] = int(controlador3.getValuePosY()); 
    }
    if(id == 4)
    {
      y[3] = int(controlador4.getValuePosY()); 
    }
    if(id == 5)
    {
      y[4] = int(controlador5.getValuePosY()); 
    }
    if(id == 6)
    {
      y[5] = int(controlador6.getValuePosY()); 
    }
  }
  
  void opcionPosX(int id)
  {
    if(id == 1)
    {
      x[0] = int(controlador1.getValuePosX());
    }
    if(id == 2)
    {
      x[1] = int(controlador2.getValuePosX());
    }
    if(id == 3)
    {
      x[2] = int(controlador3.getValuePosX());
    }
    if(id == 4)
    {
      x[3] = int(controlador4.getValuePosX());
    }
    if(id == 5)
    {
      x[4] = int(controlador5.getValuePosX());
    }
    if(id == 6)
    {
      x[5] = int(controlador6.getValuePosX());
    }
  }  
  
  void opcionAngulo(int id)
  {
    if(id == 1)
    {
      ang[0] = int(controlador1.getValueAng()); 
    }
    if(id == 2)
    {
      ang[1] = int(controlador2.getValueAng());
    }
    if(id == 3)
    {
      ang[2] = int(controlador3.getValueAng());
    }
    if(id == 4)
    {
      ang[3] = int(controlador4.getValueAng());
    }
    if(id == 5)
    {
      ang[4] = int(controlador5.getValueAng());
    }
    if(id == 6)
    {
      ang[5] = int(controlador6.getValueAng());
    }
  }
  
  void opcionSonidoExtremos(int id)
  {
    if(id == 1)
    {
       if(controlador1.getValueMuteBorders() == 1)
       {
         muteBorders[0] = true;       
       }
       else if(controlador1.getValueMuteBorders() == 0)
       {
         muteBorders[0] = false; 
       }
    }     
    if(id == 2)
    {
       if(controlador2.getValueMuteBorders() == 1)
       {
         muteBorders[1] = true;       
       }
       else if(controlador2.getValueMuteBorders() == 0)
       {
         muteBorders[1] = false; 
       }
    }
    if(id == 3)
    {
       if(controlador3.getValueMuteBorders() == 1)
       {
         muteBorders[2] = true;       
       }
       else if(controlador3.getValueMuteBorders() == 0)
       {
         muteBorders[2] = false; 
       }
    }
    if(id == 4)
    {
       if(controlador4.getValueMuteBorders() == 1)
       {
         muteBorders[3] = true;       
       }
       else if(controlador4.getValueMuteBorders() == 0)
       {
         muteBorders[3] = false; 
       }
    }
    if(id == 5)
    {
       if(controlador5.getValueMuteBorders() == 1)
       {
         muteBorders[4] = true;       
       }
       else if(controlador5.getValueMuteBorders() == 0)
       {
         muteBorders[4] = false; 
       }
    }
    if(id == 6)
    {
       if(controlador6.getValueMuteBorders() == 1)
       {
         muteBorders[5] = true;       
       }
       else if(controlador6.getValueMuteBorders() == 0)
       {
         muteBorders[5] = false; 
       }
    }    
  }
  
  void opcionSonidoPuntos(int id)
  {
    if(id == 1)
    {
     if(controlador1.getValueMutePoints() == 1)
     {
       mutePoints[0] = true;       
     }
     else if(controlador1.getValueMutePoints() == 0)
     {
       mutePoints[0] = false; 
     }
    }     
    if(id == 2)
    { 
     if(controlador2.getValueMutePoints() == 1)
     {
       mutePoints[1] = true;       
     }
     else if(controlador2.getValueMutePoints() == 0)
     {
       mutePoints[1] = false; 
     }
    }
    if(id == 3)
    { 
     if(controlador3.getValueMutePoints() == 1)
     {
       mutePoints[2] = true;       
     }
     else if(controlador3.getValueMutePoints() == 0)
     {
       mutePoints[2] = false; 
     }
    }
    if(id == 4)
    { 
     if(controlador4.getValueMutePoints() == 1)
     {
       mutePoints[3] = true;       
     }
     else if(controlador4.getValueMutePoints() == 0)
     {
       mutePoints[3] = false; 
     }
    }
    if(id == 5)
    { 
     if(controlador5.getValueMutePoints() == 1)
     {
       mutePoints[4] = true;       
     }
     else if(controlador5.getValueMutePoints() == 0)
     {
       mutePoints[4] = false; 
     }
    }
    if(id == 6)
    { 
     if(controlador6.getValueMutePoints() == 1)
     {
       mutePoints[5] = true;       
     }
     else if(controlador6.getValueMutePoints() == 0)
     {
       mutePoints[5] = false; 
     }
    }
  }
  
  void opcionGuardarA(int id)
  {
    if(id == 1)
    {
      controlador1.guardarA();
    }
    if(id == 2)
    {
      controlador2.guardarA();
    }
    if(id == 3)
    {
      controlador3.guardarA();
    }
    if(id == 4)
    {
      controlador4.guardarA();
    }
    if(id == 5)
    {
      controlador5.guardarA();
    }
    if(id == 6)
    {
      controlador6.guardarA();
    }
  }
  
  void opcionaCargarA(int id)
  {
    if(id == 1)
    {
      controlador1.cargarA();
    }
    if(id == 2)
    {
      controlador2.cargarA();
    }
    if(id == 3)
    {
      controlador3.cargarA();
    }
    if(id == 4)
    {
      controlador4.cargarA();
    }
    if(id == 5)
    {
      controlador5.cargarA();
    }
    if(id == 6)
    {
      controlador6.cargarA();
    }
}
  
  void opcionGuardarB(int id)
  {
    if(id == 1)
    {
      controlador1.guardarB();
    }
    if(id == 2)
    {
      controlador2.guardarB();
    }
    if(id == 3)
    {
      controlador3.guardarB();
    }
    if(id == 4)
    {
      controlador4.guardarB();
    }
    if(id == 5)
    {
      controlador5.guardarB();
    }
    if(id == 6)
    {
      controlador6.guardarB();
    }
  }
  
  void opcionaCargarB(int id)
  {
    if(id == 1)
    {
      controlador1.cargarB();
    }
    if(id == 2)
    {
      controlador2.cargarB();
    }
    if(id == 3)
    {
      controlador3.cargarB();
    }
    if(id == 4)
    {
      controlador4.cargarB();
    }
    if(id == 5)
    {
      controlador5.cargarB();
    }
    if(id == 6)
    {
      controlador6.cargarB();
    }
  }
  
  void opcionGuardarC(int id)
  {
    if(id == 1)
    {
      controlador1.guardarC();
    }
    if(id == 2)
    {
      controlador2.guardarC();
    }
    if(id == 3)
    {
      controlador3.guardarC();
    }
    if(id == 4)
    {
      controlador4.guardarC();
    }
    if(id == 5)
    {
      controlador5.guardarC();
    }
    if(id == 6)
    {
      controlador6.guardarC();
    }
  }
  
  void opcionaCargarC(int id)
  {
    if(id == 1)
    {
      controlador1.cargarC();
    }
    if(id == 2)
    {
      controlador2.cargarC();
    }
    if(id == 3)
    {
      controlador3.cargarC();
    }
    if(id == 4)
    {
      controlador4.cargarC();
    }
    if(id == 5)
    {
      controlador5.cargarC();
    }
    if(id == 6)
    {
      controlador6.cargarC();
    }
  }
  
  void opcionGuardarD(int id)
  {
    if(id == 1)
    {
      controlador1.guardarD();
    }
    if(id == 2)
    {
      controlador2.guardarD();
    }
    if(id == 3)
    {
      controlador3.guardarD();
    }
    if(id == 4)
    {
      controlador4.guardarD();
    }
    if(id == 5)
    {
      controlador5.guardarD();
    }
    if(id == 6)
    {
      controlador6.guardarD();
    }
  }
  
  void opcionaCargarD(int id)
  {
    if(id == 1)
    {
      controlador1.cargarD();
    }
    if(id == 2)
    {
      controlador2.cargarD();
    }
    if(id == 3)
    {
      controlador3.cargarD();
    }
    if(id == 4)
    {
      controlador4.cargarD();
    }
    if(id == 5)
    {
      controlador5.cargarD();
    }
    if(id == 6)
    {
      controlador6.cargarD();
    }
  }
  
  void opcionGuardarE(int id)
  {
    if(id == 1)
    {
      controlador1.guardarE();
    }
    if(id == 2)
    {
      controlador2.guardarE();
    }
    if(id == 3)
    {
      controlador3.guardarE();
    }
    if(id == 4)
    {
      controlador4.guardarE();
    }
    if(id == 5)
    {
      controlador5.guardarE();
    }
    if(id == 6)
    {
      controlador6.guardarE();
    }
  }
  
  void opcionaCargarE(int id)
  {
    if(id == 1)
    {
      controlador1.cargarE();
    }
    if(id == 2)
    {
      controlador2.cargarE();
    }
    if(id == 3)
    {
      controlador3.cargarE();
    }
    if(id == 4)
    {
      controlador4.cargarE();
    }
    if(id == 5)
    {
      controlador5.cargarE();
    }
    if(id == 6)
    {
      controlador6.cargarE();
    }
  }
  
  void opcionGuardarF(int id)
  {
    if(id == 1)
    {
      controlador1.guardarF();
    }
    if(id == 2)
    {
      controlador2.guardarF();
    }
    if(id == 3)
    {
      controlador3.guardarF();
    }
    if(id == 4)
    {
      controlador4.guardarF();
    }
    if(id == 5)
    {
      controlador5.guardarF();
    }
    if(id == 6)
    {
      controlador6.guardarF();
    }
  }
  
  void opcionaCargarF(int id)
  {
    if(id == 1)
    {
      controlador1.cargarF();
    }
    if(id == 2)
    {
      controlador2.cargarF();
    }
    if(id == 3)
    {
      controlador3.cargarF();
    }
    if(id == 4)
    {
      controlador4.cargarF();
    }
    if(id == 5)
    {
      controlador5.cargarF();
    }
    if(id == 6)
    {
      controlador6.cargarF();
    }
  }
  
  void opcionGuardarG(int id)
  {
    if(id == 1)
    {
      controlador1.guardarG();
    }
    if(id == 2)
    {
      controlador2.guardarG();
    }
    if(id == 3)
    {
      controlador3.guardarG();
    }
    if(id == 4)
    {
      controlador4.guardarG();
    }
    if(id == 5)
    {
      controlador5.guardarG();
    }
    if(id == 6)
    {
      controlador6.guardarG();
    }
  }
  
  void opcionaCargarG(int id)
  {
    if(id == 1)
    {
      controlador1.cargarG();
    }
    if(id == 2)
    {
      controlador2.cargarG();
    }
    if(id == 3)
    {
      controlador3.cargarG();
    }
    if(id == 4)
    {
      controlador4.cargarG();
    }
    if(id == 5)
    {
      controlador5.cargarG();
    }
    if(id == 6)
    {
      controlador6.cargarG();
    }
  }
  
  void opcionGuardarH(int id)
  {
    if(id == 1)
    {
      controlador1.guardarH();
    }
    if(id == 2)
    {
      controlador2.guardarH();
    }
    if(id == 3)
    {
      controlador3.guardarH();
    }
    if(id == 4)
    {
      controlador4.guardarH();
    }
    if(id == 5)
    {
      controlador5.guardarH();
    }
    if(id == 6)
    {
      controlador6.guardarH();
    }
  }
  
  void opcionaCargarH(int id)
  {
    if(id == 1)
    {
      controlador1.cargarH();
    }
    if(id == 2)
    {
      controlador2.cargarH();
    }
    if(id == 3)
    {
      controlador3.cargarH();
    }
    if(id == 4)
    {
      controlador4.cargarH();
    }
    if(id == 5)
    {
      controlador5.cargarH();
    }
    if(id == 6)
    {
      controlador6.cargarH();
    }
  }
  
  void opcionGuardarI(int id)
  {
    if(id == 1)
    {
      controlador1.guardarI();
    }
    if(id == 2)
    {
      controlador2.guardarI();
    }
    if(id == 3)
    {
      controlador3.guardarI();
    }
    if(id == 4)
    {
      controlador4.guardarI();
    }
    if(id == 5)
    {
      controlador5.guardarI();
    }
    if(id == 6)
    {
      controlador6.guardarI();
    }
  }
  
  void opcionaCargarI(int id)
  {
    if(id == 1)
    {
      controlador1.cargarI();
    }
    if(id == 2)
    {
      controlador2.cargarI();
    }
    if(id == 3)
    {
      controlador3.cargarI();
    }
    if(id == 4)
    {
      controlador4.cargarI();
    }
    if(id == 5)
    {
      controlador5.cargarI();
    }
    if(id == 6)
    {
      controlador6.cargarI();
    }
  }
  
  void opcionGuardarJ(int id)
  {
    if(id == 1)
    {
      controlador1.guardarJ();
    }
    if(id == 2)
    {
      controlador2.guardarJ();
    }
    if(id == 3)
    {
      controlador3.guardarJ();
    }
    if(id == 4)
    {
      controlador4.guardarJ();
    }
    if(id == 5)
    {
      controlador5.guardarJ();
    }
    if(id == 6)
    {
      controlador6.guardarJ();
    }
  }
  
  void opcionaCargarJ(int id)
  {
    if(id == 1)
    {
      controlador1.cargarJ();
    }
    if(id == 2)
    {
      controlador2.cargarJ();
    }
    if(id == 3)
    {
      controlador3.cargarJ();
    }
    if(id == 4)
    {
      controlador4.cargarJ();
    }
    if(id == 5)
    {
      controlador5.cargarJ();
    }
    if(id == 6)
    {
      controlador6.cargarJ();
    }
  }
  
  void mousePressed()
  {
    //iniciar = true;
    
    //linea 1
    if(controlador1.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea1Segundo";
    }
    if(controlador1.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea1Minuto";
    }
    if(controlador1.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea1Hora";
    }
    
    //linea 2
    if(controlador2.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea2Segundo";
    }
    if(controlador2.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea2Minuto";
    }
    if(controlador2.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea2Hora";
    }
    
    //linea 3
    if(controlador3.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea3Segundo";
    }
    if(controlador3.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea3Minuto";
    }
    if(controlador3.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea3Hora";
    }
    
    //linea 4
    if(controlador4.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea4Segundo";
    }
    if(controlador4.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea4Minuto";
    }
    if(controlador4.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea4Hora";
    }
    
    //linea 5
    if(controlador5.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea5Segundo";
    }
    if(controlador5.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea5Minuto";
    }
    if(controlador5.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea5Hora";
    }
    
    //linea 6
    if(controlador6.secondTextFieldClick()==true)
    {
      inputTextActivado = "Linea6Segundo";
    }
    if(controlador6.minuteTextFieldClick()==true)
    {
      inputTextActivado = "Linea6Minuto";
    }
    if(controlador6.hourTextFieldClick()==true)
    {
      inputTextActivado = "Linea6Hora";
    }


  }
  
  void keyPressed()
  {
    if (key == '1') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"1", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"1", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"1", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"1", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"1", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"1", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"1", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"1", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"1", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"1", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"1", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"1", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"1", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"1", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"1", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"1", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"1", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"1", 6, 1);
        }
      }
      
    }
    else if (key == '2') 
    { 
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"2", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"2", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"2", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"2", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"2", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"2", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"2", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"2", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"2", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"2", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"2", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"2", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"2", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"2", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"2", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"2", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"2", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"2", 6, 1);
        }
      }
    }
    else if (key == '3') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"3", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"3", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"3", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"3", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"3", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"3", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"3", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"3", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"3", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"3", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"3", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"3", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"3", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"3", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"3", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"3", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"3", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"3", 6, 1);
        }
      }
    }
    else if (key == '4') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"4", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"4", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"4", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"4", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"4", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"4", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"4", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"4", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"4", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"4", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"4", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"4", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"4", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"4", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"4", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"4", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"4", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"4", 6, 1);
        }
      }
    }
    else if (key == '5') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"5", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"5", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"5", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"5", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"5", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"5", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"5", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"5", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"5", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"5", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"5", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"5", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"5", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"5", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"5", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"5", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"5", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"5", 6, 1);
        }
      }
      
    }
    else if (key == '6') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"6", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"6", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"6", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"6", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"6", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"6", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"6", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"6", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"6", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"6", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"6", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"6", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"6", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"6", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"6", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"6", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"6", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"6", 6, 1);
        }
      }
    }
    else if (key == '7') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"7", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"7", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"7", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"7", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"7", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"7", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"7", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"7", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"7", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"7", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"7", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"7", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"7", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"7", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"7", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"7", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"7", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"7", 6, 1);
        }
      }
    }
    else if (key == '8') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"8", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"8", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"8", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"8", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"8", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"8", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"8", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"8", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"8", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"8", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"8", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"8", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"8", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"8", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"8", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"8", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"8", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"8", 6, 1);
        }
      }
    }
    else if (key == '9') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"9", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"9", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"9", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"9", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"9", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"9", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"9", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"9", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"9", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"9", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"9", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"9", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"9", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"9", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"9", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"9", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"9", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"9", 6, 1);
        }
      }
    }
    else if (key == '0') 
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          showText(textoseclinea1+"0", 1, 3);
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          showText(textominlinea1+"0", 1, 2);
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          showText(textohourlinea1+"0", 1, 1);
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          showText(textoseclinea2+"0", 2, 3);
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          showText(textominlinea2+"0", 2, 2);
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          showText(textohourlinea2+"0", 2, 1);
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          showText(textoseclinea3+"0", 3, 3);
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          showText(textominlinea3+"0", 3, 2);
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          showText(textohourlinea3+"0", 3, 1);
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          showText(textoseclinea4+"0", 4, 3);
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          showText(textominlinea4+"0", 4, 2);
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          showText(textohourlinea4+"0", 4, 1);
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          showText(textoseclinea5+"0", 5, 3);
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          showText(textominlinea5+"0", 5, 2);
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          showText(textohourlinea5+"0", 5, 1);
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          showText(textoseclinea6+"0", 6, 3);
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          showText(textominlinea6+"0", 6, 2);
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          showText(textohourlinea6+"0", 6, 1);
        }
      }      
    }
    else if (keyCode == BACKSPACE)
    {
      if(g1.isOpen())
      {
        if(inputTextActivado=="Linea1Segundo")
        { 
          if(textoseclinea1.length()>0)
          {
            showText(textoseclinea1.substring(0,textoseclinea1.length()-1), 1, 3);           
          }
        }
        if(inputTextActivado=="Linea1Minuto")
        { 
          if(textominlinea1.length()>0)
          {
            showText(textominlinea1.substring(0,textominlinea1.length()-1), 1, 2);           
          }
        }
        if(inputTextActivado=="Linea1Hora")
        { 
          if(textohourlinea1.length()>0)
          {
            showText(textohourlinea1.substring(0,textohourlinea1.length()-1), 1, 1);           
          }
        }
      }
      
      if(g2.isOpen())
      {
        if(inputTextActivado=="Linea2Segundo")
        { 
          if(textoseclinea2.length()>0)
          {
            showText(textoseclinea2.substring(0,textoseclinea2.length()-1), 2, 3);           
          }
        }
        if(inputTextActivado=="Linea2Minuto")
        { 
          if(textominlinea2.length()>0)
          {
            showText(textominlinea2.substring(0,textominlinea2.length()-1), 2, 2);           
          }
        }
        if(inputTextActivado=="Linea2Hora")
        { 
          if(textohourlinea2.length()>0)
          {
            showText(textohourlinea2.substring(0,textohourlinea2.length()-1), 2, 1);           
          }
        }
      }
      
      if(g3.isOpen())
      {
        if(inputTextActivado=="Linea3Segundo")
        { 
          if(textoseclinea3.length()>0)
          {
            showText(textoseclinea3.substring(0,textoseclinea3.length()-1), 3, 3);           
          }
        }
        if(inputTextActivado=="Linea3Minuto")
        { 
          if(textominlinea3.length()>0)
          {
            showText(textominlinea3.substring(0,textominlinea3.length()-1), 3, 2);           
          }
        }
        if(inputTextActivado=="Linea3Hora")
        { 
          if(textohourlinea3.length()>0)
          {
            showText(textohourlinea3.substring(0,textohourlinea3.length()-1), 3, 1);           
          }
        }
      }
      
      if(g4.isOpen())
      {
        if(inputTextActivado=="Linea4Segundo")
        { 
          if(textoseclinea4.length()>0)
          {
            showText(textoseclinea4.substring(0,textoseclinea4.length()-1), 4, 3);           
          }
        }
        if(inputTextActivado=="Linea4Minuto")
        { 
          if(textominlinea4.length()>0)
          {
            showText(textominlinea4.substring(0,textominlinea4.length()-1), 4, 2);           
          }
        }
        if(inputTextActivado=="Linea4Hora")
        { 
          if(textohourlinea4.length()>0)
          {
            showText(textohourlinea4.substring(0,textohourlinea4.length()-1), 4, 1);           
          }
        }
      }
      
      if(g5.isOpen())
      {
        if(inputTextActivado=="Linea5Segundo")
        { 
          if(textoseclinea5.length()>0)
          {
            showText(textoseclinea5.substring(0,textoseclinea5.length()-1), 5, 3);           
          }
        }
        if(inputTextActivado=="Linea5Minuto")
        { 
          if(textominlinea5.length()>0)
          {
            showText(textominlinea5.substring(0,textominlinea5.length()-1), 5, 2);           
          }
        }
        if(inputTextActivado=="Linea5Hora")
        { 
          if(textohourlinea5.length()>0)
          {
            showText(textohourlinea5.substring(0,textohourlinea5.length()-1), 5, 1);           
          }
        }
      }
      
      if(g6.isOpen())
      {
        if(inputTextActivado=="Linea6Segundo")
        { 
          if(textoseclinea6.length()>0)
          {
            showText(textoseclinea6.substring(0,textoseclinea6.length()-1), 6, 3);           
          }
        }
        if(inputTextActivado=="Linea6Minuto")
        { 
          if(textominlinea6.length()>0)
          {
            showText(textominlinea6.substring(0,textominlinea6.length()-1), 6, 2);           
          }
        }
        if(inputTextActivado=="Linea6Hora")
        { 
          if(textohourlinea6.length()>0)
          {
            showText(textohourlinea6.substring(0,textohourlinea6.length()-1), 6, 1);           
          }
        }
      }
      
    }      
    
  }
  
  
  void showText(String tiempoLinea, int line, int hms)
  {    
    if(line == 1)
    {
      if(hms == 3)
      {
        textoseclinea1 = tiempoLinea;
        controlador1.textSecond.setText(textoseclinea1);
      }
      if(hms == 2)
      {
        textominlinea1 = tiempoLinea;
        controlador1.textMinute.setText(textominlinea1);
      }
      if(hms == 1)
      {
        textohourlinea1 = tiempoLinea;
        controlador1.textHour.setText(textohourlinea1);
      }
    }
    
    if(line == 2)
    {
      if(hms == 3)
      {
        textoseclinea2 = tiempoLinea;
        controlador2.textSecond.setText(textoseclinea2);
      }
      if(hms == 2)
      {
        textominlinea2 = tiempoLinea;
        controlador2.textMinute.setText(textominlinea2);
      }
      if(hms == 1)
      {
        textohourlinea2 = tiempoLinea;
        controlador2.textHour.setText(textohourlinea2);
      }
    }
    
    if(line == 3)
    {
      if(hms == 3)
      {
        textoseclinea3 = tiempoLinea;
        controlador3.textSecond.setText(textoseclinea3);
      }
      if(hms == 2)
      {
        textominlinea3 = tiempoLinea;
        controlador3.textMinute.setText(textominlinea3);
      }
      if(hms == 1)
      {
        textohourlinea3 = tiempoLinea;
        controlador3.textHour.setText(textohourlinea3);
      }
    }
    
    if(line == 4)
    {
      if(hms == 3)
      {
        textoseclinea4 = tiempoLinea;
        controlador4.textSecond.setText(textoseclinea4);
      }
      if(hms == 2)
      {
        textominlinea4 = tiempoLinea;
        controlador4.textMinute.setText(textominlinea4);
      }
      if(hms == 1)
      {
        textohourlinea4 = tiempoLinea;
        controlador4.textHour.setText(textohourlinea4);
      }
    }
    
    if(line == 5)
    {
      if(hms == 3)
      {
        textoseclinea5 = tiempoLinea;
        controlador5.textSecond.setText(textoseclinea5);
      }
      if(hms == 2)
      {
        textominlinea5 = tiempoLinea;
        controlador5.textMinute.setText(textominlinea5);
      }
      if(hms == 1)
      {
        textohourlinea5 = tiempoLinea;
        controlador5.textHour.setText(textohourlinea5);
      }
    }
    
    if(line == 6)
    {
      if(hms == 3)
      {
        textoseclinea6 = tiempoLinea;
        controlador6.textSecond.setText(textoseclinea6);
      }
      if(hms == 2)
      {
        textominlinea6 = tiempoLinea;
        controlador6.textMinute.setText(textominlinea6);
      }
      if(hms == 1)
      {
        textohourlinea6 = tiempoLinea;
        controlador6.textHour.setText(textohourlinea6);
      }
    }
    
  }
  
}

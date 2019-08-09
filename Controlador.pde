
class Controlador
{
  ControlP5 ctrp5;
  
  int horaTime = -1;
  int minTime = -1;
  int secTime = -1;
  
  int estado = -1;
  boolean cambioEstado = false;
  
  ControlTimer tiempo;
  Textlabel t;
  int tiempoX, tiempoY;
  
  String linea;
  int id;
  
  Textlabel textHour;
  Textlabel textMinute;
  Textlabel textSecond;
  Textlabel textInfo;
    
  //Controlador(ControlP5 cp5, PApplet _parent)
  Controlador(ControlP5 cp5, String lineaR, Group grupo, int posXtiempo, int posYtiempo, int idLinea)
  {     
    ctrp5 = cp5;
    linea = lineaR;
    tiempoX = posXtiempo;
    tiempoY = posYtiempo;
    id = idLinea;
    
    ctrp5.addToggle("state")
       //.plugTo(parent, "sonidoXtr")
       .setPosition(1, 10)
       .setSize(10, 10)
       .setValue(false)
       .moveTo(grupo)
       .setId(id)
       ;
    
    ctrp5.addToggle("movimiento")
      // .plugTo(_parent, "movi")
       .setPosition(10, 230)
       .setSize(50, 50)
       .setValue(false)
       .moveTo(grupo)
       .setId(id)
       ;
     
    ctrp5.addKnob("blend")
       //.plugTo(parent, "c3")
       .setPosition(50, 300)
       .setSize(100, 100)
       .setRange(0, 255)
       .setValue(200)
       .moveTo(grupo)
       .setId(id)
       ;
     
    ctrp5.addNumberbox("color-red")
       //.plugTo(parent, "c0")
       .setRange(0, 255)
       .setValue(255)
       .setPosition(30, 10)
       .setSize(100, 20)
       .moveTo(grupo)
       .setId(id)
       ;
       
    ctrp5.addNumberbox("color-green")
       //.plugTo(parent, "c1")
       .setRange(0, 255)
       .setValue(128)
       .setPosition(30, 70)
       .setSize(100, 20)
       .moveTo(grupo)
       .setId(id)
       ;
       
    ctrp5.addNumberbox("color-blue")
       //.plugTo(parent, "c2")
       .setRange(0, 255)
       .setValue(0)
       .setPosition(30, 130)
       .setSize(100, 20)
       .moveTo(grupo)
       .setId(id)
       ;
       
    ctrp5.addSlider("speed")
       //.plugTo(parent, "speed")
       .setRange(1, 20)
       .setValue(1)
       .setPosition(80, 240)
       .setSize(200, 30)
       .moveTo(grupo)
       .setId(id)
       .setSliderMode(Slider.FLEXIBLE)
       ;
       
    ctrp5.addSlider("Distancia")
     //.plugTo(parent, "distCirculos")
     .setRange(20,400)
     .setPosition(150,10)
     .setSize(30,200)
     .setValue(120)
     .setNumberOfTickMarks(20)
     .moveTo(grupo)
     .setId(id)
     ;
     
    ctrp5.addSlider("NumPuntos")
     //.plugTo(parent, "numCirculos")
     .setRange(1,20)
     .setPosition(210,10)
     .setSize(30,200)
     .setValue(5)
     .setNumberOfTickMarks(20)
     .moveTo(grupo)
     .setId(id)
     ;
     
    ctrp5.addSlider("Y")
     //.plugTo(parent, "posy")
     .setRange(-height,height)
     .setPosition(280,10)
     .setSize(30,200)
     .setValue(100)
     .setNumberOfTickMarks(height/20)
     .moveTo(grupo)
     .setId(id)
     ;
     
    ctrp5.addSlider("X")
     //.plugTo(parent, "xBorder")
     .setRange(-1280,1280)
     .setPosition(345,10)
     .setSize(30,200)
     .setValue(50)
     .setNumberOfTickMarks(1280/30)
     .moveTo(grupo)
     .setId(id)
     ;
     
   ctrp5.addKnob("Z")
     //.plugTo(parent, "angulo")
     .setPosition(170, 300)
     .setSize(135, 135)
     .setRange(0, 360)
     .setValue(0)
     .moveTo(grupo)
     .setId(id)
     ;
     
    ctrp5.addToggle("sonidoPuntos")
       //.plugTo(parent, "sonidoPts")
       .setPosition(320, 330)
       .setSize(60, 30)
       .setValue(true)
       .moveTo(grupo)
       .setId(id)
       ;
       
    ctrp5.addToggle("sonidoExtremos")
       //.plugTo(parent, "sonidoXtr")
       .setPosition(320, 390)
       .setSize(60, 30)
       .setValue(true)
       .moveTo(grupo)
       .setId(id)
       ;
       
     tiempo = new ControlTimer();
     t = new Textlabel(ctrp5,"--",100,100);
     tiempo.setSpeedOfTime(1);
     
   ctrp5.addTextfield("hora")
     .setPosition(20,435)
     .setSize(20,15)
     .setFocus(true)
     .setAutoClear(true)
     .setColor(color(255,255,255))     
     .setId(id)
     .moveTo(grupo)
     ;
     
    ctrp5.addTextfield("minuto")
     .setPosition(50,435)
     .setSize(20,15)
     .setFocus(true)
     .setAutoClear(true)
     .setColor(color(255,255,255))
     .moveTo(grupo)
     .setId(id)
     ; 
    
    ctrp5.addTextfield("segundo")
     .setPosition(80,435)
     .setSize(20,15)     
     .setFocus(true)
     .setAutoClear(true)
     .setColor(color(255,255,255))
     .moveTo(grupo)
     .setId(id)
     ;  
     
    ctrp5.addButton("guardarA", 0, 20, 490, 80, 12).setCaptionLabel("save SET A").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarA", 0, 101, 490, 80, 12).setCaptionLabel("load SET A").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
    ctrp5.addButton("guardarB", 0, 200, 490, 80, 12).setCaptionLabel("save SET B").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarB", 0, 281, 490, 80, 12).setCaptionLabel("load SET B").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
    ctrp5.addButton("guardarC", 0, 20, 510, 80, 12).setCaptionLabel("save SET C").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarC", 0, 101, 510, 80, 12).setCaptionLabel("load SET C").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);

    ctrp5.addButton("guardarD", 0, 200, 510, 80, 12).setCaptionLabel("save SET D").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarD", 0, 281, 510, 80, 12).setCaptionLabel("load SET D").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
    ctrp5.addButton("guardarE", 0, 20, 530, 80, 12).setCaptionLabel("save SET E").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarE", 0, 101, 530, 80, 12).setCaptionLabel("load SET E").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);

    ctrp5.addButton("guardarF", 0, 200, 530, 80, 12).setCaptionLabel("save SET F").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarF", 0, 281, 530, 80, 12).setCaptionLabel("load SET F").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
    ctrp5.addButton("guardarG", 0, 20, 550, 80, 12).setCaptionLabel("save SET G").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarG", 0, 101, 550, 80, 12).setCaptionLabel("load SET G").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);

    ctrp5.addButton("guardarH", 0, 200, 550, 80, 12).setCaptionLabel("save SET H").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarH", 0, 281, 550, 80, 12).setCaptionLabel("load SET H").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
    ctrp5.addButton("guardarI", 0, 20, 570, 80, 12).setCaptionLabel("save SET I").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarI", 0, 101, 570, 80, 12).setCaptionLabel("load SET I").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);

    ctrp5.addButton("guardarJ", 0, 200, 570, 80, 12).setCaptionLabel("save SET J").moveTo(grupo).setId(id);
    ctrp5.addButton("cargarJ", 0, 281, 570, 80, 12).setCaptionLabel("load SET J").setColorBackground(color(0, 100, 50)).moveTo(grupo).setId(id);
    
     textInfo = ctrp5.addTextlabel("infoTexto")
                    .setText("* Press enter when finish to typewrite in timebox")
                    .setPosition(100,470)
                    .moveTo(grupo)
                   ;
                   
    textSecond = ctrp5.addTextlabel("secondTexto")
                    .setText("")
                    .setPosition(80,470)
                    .moveTo(grupo)
                   ;
                   
    textMinute = ctrp5.addTextlabel("minuteTexto")
                    .setText("")
                    .setPosition(50,470)
                    .moveTo(grupo)
                   ;
                   
     textHour = ctrp5.addTextlabel("hourTexto")
                    .setText("")
                    .setPosition(20,470)
                    .moveTo(grupo)
                   ;
  }
  

  
  void update()
  {
    t.setValue(tiempo.toString());
    t.draw();
    t.setPosition(tiempoX, tiempoY);
    
    
    if(tiempo.second() == 2 && cambioEstado == false && estado == -1)
    {    
       //carga los datos del set A
     ctrp5.loadProperties(("LPPsets/setA"+linea+".json"));
       horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
       minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
       secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
    }
    
    if(tiempo.second() == 3 && cambioEstado == false)
    {            
      ctrp5.get(Toggle.class,"state").setValue(false);
      if(estado <= 8)
      {
        estado ++;
      }
      else
      {
        estado = 0; 
      }
      //println(estado);
      cambioEstado = true; 
    }
        
    if(horaTime == tiempo.hour() && minTime == tiempo.minute() && secTime == tiempo.second()) 
    {
      ctrp5.get(Toggle.class,"movimiento").setValue(false);
      
          
      cargar(estado);  
            
      tiempo.reset();
      
      ctrp5.get(Toggle.class,"state").setValue(true);
      cambioEstado = false;
    }   
        
  }
  
  public String getSet()
  {
    String rta = "";
    if(estado == -1)
    {
      rta = "A";
    }
    else if(estado == 0)
    {
      rta = "B";
    }
    else if(estado == 1)
    {
      rta = "C";
    }
    else if(estado == 2)
    {
      rta = "D";
    }
    else if(estado == 3)
    {
      rta = "E";
    }
    else if(estado == 4)
    {
      rta = "F";
    }
    else if(estado == 5)
    {
      rta = "G";
    }
    else if(estado == 6)
    {
      rta = "H";
    }
    else if(estado == 7)
    {
      rta = "I";
    }
    else if(estado == 8)
    {
      rta = "J";
    }
    return rta;
  }
  
  public float getValueMovimiento() 
  { 
    float valor = 0;    
    valor = ctrp5.get(Toggle.class,"movimiento").getValue();
    return valor;    
  }
  
  public float getValueTransparent() 
  {    
    float valor = 0;
    valor = ctrp5.get(Knob.class,"blend").getValue();
    return valor;
  }
  
  public float getValueColorRed() 
  {    
    float valor = 0;
    valor = ctrp5.get(Numberbox.class,"color-red").getValue();
    return valor;
  }
  
  public float getValueColorGreen() 
  {    
    float valor = 0;
    valor = ctrp5.get(Numberbox.class,"color-green").getValue();
    return valor;
  }
  
  public float getValueColorBlue() 
  {    
    float valor = 0;
    valor = ctrp5.get(Numberbox.class,"color-blue").getValue();
    return valor;
  }
  
  public float getValueSpeed() 
  {    
    float valor = 0;
    valor = ctrp5.get(Slider.class,"speed").getValue();
    return valor;
  }
  
  public float getValueDistance() 
  {    
    float valor = 0;
    valor = ctrp5.get(Slider.class,"Distancia").getValue();
    return valor;
  }
  
  public float getValueNumPoints() 
  {    
    float valor = 0;
    valor = ctrp5.get(Slider.class,"NumPuntos").getValue();
    return valor;
  }
  
  public float getValuePosY() 
  {    
    float valor = 0;
    valor = ctrp5.get(Slider.class,"Y").getValue();
    return valor;
  }
  
  public float getValuePosX() 
  {    
    float valor = 0;
    valor = ctrp5.get(Slider.class,"X").getValue();
    return valor;
  }
  
  public float getValueAng() 
  {    
    float valor = 0;
    valor = ctrp5.get(Knob.class,"Z").getValue();
    return valor;
  }
  
  public float getValueMutePoints() 
  { 
    float valor = 0;    
    valor = ctrp5.get(Toggle.class,"sonidoPuntos").getValue();
    return valor;    
  }
  
  public float getValueMuteBorders() 
  { 
    float valor = 0;    
    valor = ctrp5.get(Toggle.class,"sonidoExtremos").getValue();
    return valor;    
  }
  
  void hora(String theText) 
  {
    horaTime = int(theText);
  }
  
  void minuto(String theText) 
  {
    minTime = int(theText);
  }
  
  
  
  void segundo(String theText) 
  {
    secTime = int(theText);
  }
  
  public int getSegundo() 
  {
    return tiempo.second();
  }
  
  void guardarA() 
  {
    ctrp5.saveProperties("LPPsets/setA"+linea+".json");
  }
  
  void cargar(int temp)
  {
    if(temp == 0)
    {
      ctrp5.loadProperties(("LPPsets/setB"+linea+".json"));
    }
    else if(temp == 1)
    {
      ctrp5.loadProperties(("LPPsets/setC"+linea+".json"));
    }
    else if(temp == 2)
    {
      ctrp5.loadProperties(("LPPsets/setD"+linea+".json"));
    }
    else if(temp == 3)
    {
      ctrp5.loadProperties(("LPPsets/setE"+linea+".json"));
    }
    else if(temp == 4)
    {
      ctrp5.loadProperties(("LPPsets/setF"+linea+".json"));
    }
    else if(temp == 5)
    {
      ctrp5.loadProperties(("LPPsets/setG"+linea+".json"));
    }
    else if(temp == 6)
    {
      ctrp5.loadProperties(("LPPsets/setH"+linea+".json"));
    }
    else if(temp == 7)
    {
      ctrp5.loadProperties(("LPPsets/setI"+linea+".json"));
    }
    else if(temp == 8)
    {
      ctrp5.loadProperties(("LPPsets/setJ"+linea+".json"));
    }
    else if(temp == 9)
    {
      ctrp5.loadProperties(("LPPsets/setA"+linea+".json"));
    }
    
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void cargarA() 
  {
    ctrp5.loadProperties(("LPPsets/setA"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
      
  void guardarB() 
  {
    ctrp5.saveProperties("LPPsets/setB"+linea+".json");
  }
  
  void cargarB() 
  {
    ctrp5.loadProperties(("LPPsets/setB"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarC() 
  {
    ctrp5.saveProperties("LPPsets/setC"+linea+".json");
  }
  
  void cargarC() 
  {
    ctrp5.loadProperties(("LPPsets/setC"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarD() 
  {
    ctrp5.saveProperties("LPPsets/setD"+linea+".json");
  }
  
  void cargarD() 
  {
    ctrp5.loadProperties(("LPPsets/setD"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarE() 
  {
    ctrp5.saveProperties("LPPsets/setE"+linea+".json");
  }
  
  void cargarE() 
  {
    ctrp5.loadProperties(("LPPsets/setE"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarF() 
  {
    ctrp5.saveProperties("LPPsets/setF"+linea+".json");
  }
  
  void cargarF() 
  {
    ctrp5.loadProperties(("LPPsets/setF"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarG() 
  {
    ctrp5.saveProperties("LPPsets/setG"+linea+".json");
  }
  
  void cargarG() 
  {
    ctrp5.loadProperties(("LPPsets/setG"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarH() 
  {
    ctrp5.saveProperties("LPPsets/setH"+linea+".json");
  }
  
  void cargarH() 
  {
    ctrp5.loadProperties(("LPPsets/setH"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarI() 
  {
    ctrp5.saveProperties("LPPsets/setI"+linea+".json");
  }
  
  void cargarI() 
  {
    ctrp5.loadProperties(("LPPsets/setI"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  void guardarJ() 
  {
    ctrp5.saveProperties("LPPsets/setJ"+linea+".json");
  }
  
  void cargarJ() 
  {
    ctrp5.loadProperties(("LPPsets/setJ"+linea+".json"));
    horaTime = int(ctrp5.get(Textfield.class,"hora").getText());
    minTime = int(ctrp5.get(Textfield.class,"minuto").getText());
    secTime = int(ctrp5.get(Textfield.class,"segundo").getText());
  }
  
  public boolean secondTextFieldClick()
  {
    boolean rtaClickSec = false; 
    if(ctrp5.get(Textfield.class,"segundo").isMousePressed())
    {
      rtaClickSec = true;
    }
    return rtaClickSec;
  }
  
  public boolean minuteTextFieldClick()
  {
    boolean rtaClickSec = false; 
    if(ctrp5.get(Textfield.class,"minuto").isMousePressed())
    {
      rtaClickSec = true;
    }
    return rtaClickSec;
  }
  
  public boolean hourTextFieldClick()
  {
    boolean rtaClickSec = false; 
    if(ctrp5.get(Textfield.class,"hora").isMousePressed())
    {
      rtaClickSec = true;
    }
    return rtaClickSec;
  }
  
}

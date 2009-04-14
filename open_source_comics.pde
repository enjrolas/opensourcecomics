

castMember me;

void setup()
{ 
  size(800, 600);
  me=new castMember("me");
  background(0);
}

void draw()
{
 me.drawCharacter(); 
}

class castMember{
  
  Position position, headPosition, bodyPosition;
  Hashtable hashtable;
  Head head;
  String emotion;
  String expression;
  Rotation rotation;
  color skinColor;
  String name;
  double headHeight;
  double bodyHeight;
  double legLength;
  double armLength;
      
  castMember(String a)
  {
    name=a;
    hashtable=new Hashtable();
    position=new Position(500, 800);
    readData();
  }

  castMember(String a, String emo, String expo)
  {
    name=a;
    emotion=emo;
    expression=expo;
    hashtable=new Hashtable();
    position=new Position(500, 800);
    readData();
  }

  castMember(String a, String emo, String expo, Rotation roto)
  {
    name=a;
    emotion=emo;
    expression=expo;
    rotation=roto;
    hashtable=new Hashtable();
    position=new Position(500, 800);
    readData();
  }
  
  void readData()
  {
    String filename=name+".com";  //'.com' files hold data about characters'
                                  //appearance
    String data[]=loadStrings(filename);  //bring in all 'attribute, data' pairs
    for(int i=0;i<data.length;i++)
    {
      println(data[i]);
      String parsed[]=split(data[i], " ");  //split up pairs into string based on numbers
      hashtable.put(parsed[0], parsed[1]);
    }
    //set the skin color
    setColor();
    setDimensions();
    emotion=(String) hashtable.get("defaultEmotion");
    expression=(String) hashtable.get("defaultExpression");
    
  }
  
  void setDimensions()
  {
    String myHeight=(String) hashtable.get("height");
    String headHeightString=(String) hashtable.get("headHeight");
    String bodyHeightString=(String) hashtable.get("bodyHeight");
    String legLengthString=(String) hashtable.get("legLength");
    String armLengthString=(String) hashtable.get("armLength");
    
    if(myHeight!=null)
    {
      double heightNum=Double.parseDouble(myHeight);
      if(headHeightString!=null)
        headHeight=Double.parseDouble(headHeightString);
      else
        headHeight=heightNum/7;
        
      if(bodyHeightString!=null)
        bodyHeight=Double.parseDouble(bodyHeightString);
      else
        bodyHeight=heightNum/3;
        
      if(legLengthString!=null)
        legLength=Double.parseDouble(legLengthString);
      else    
        legLength=heightNum/3;
        
      if(armLengthString!=null)
        armLength=Double.parseDouble(armLengthString); 
      else 
        armLength=heightNum/4;
        
      headPosition=new Position(position.x, position.y-6*heightNum/7);
      println(position.y);
      println(headPosition.y);
    }
  }
  
  void setColor()
  {
    String myColor=(String) hashtable.get("skinColor");
    if(myColor!=null)
    {
      if(myColor.equals("tan"))
        skinColor=color(238,258,33);
    }
    else
      skinColor=color(255);
  }
  
  void drawCharacter()
  {
    //calculate component position (the character object should know how to do this, 
    //i.e.  character.getHeadPosition(position, perspective)
    calculatePosition();
    head.drawHead();
    drawBody();
    drawArms();
    drawLegs();
  }
  
  void calculatePosition()
  { 
    head=new Head(headPosition, headHeight, headHeight*2/3, skinColor);
  }
  

  
  
  void drawBody()
  {
  }
  
  void drawArms()
  {
  }
  
  void drawLegs()
  {
  }
  
  
}

class Head{
    double noseCenter;
    double mouthCenter;
    double eyePosition;
    Position headBase;
    double headWidth, headHeight;
    color skinColor;
    
    Head(Position a, double b, double c, color d)
    {
      headBase=a;
      headWidth=b;
      headHeight=c;
      skinColor=d;
      noseCenter=headBase.y-headHeight/3;
      mouthCenter=headBase.y-headHeight/4;
      eyePosition=headBase.y-2*headHeight/3;
    }
    
    
    void drawHead()
    {
      fill(skinColor);
      ellipse((float)headBase.x, (float)(headBase.y-headHeight), (float)headWidth/2, (float)headHeight/2);
    }
    
    void drawEyes()
    {
    }
    void drawEyebrows()
    {
    }
    void drawHair()
    {
    }
    void drawNose()
    {
    }
    void drawMouth()  
    {
    }
  
}

class Rotation{
  double x, y, z;   //rotation in all three axes.  
                    //'x' is horizontal, y is vertical, and z is into
                    //the screen
  Rotation(double a, double b, double c)
  {
    x=a;
    y=b;
    z=c;
  }
}

class Position{
  double x, y;
  
  Position(double a, double b)
  {
    x=a;
    y=b;
  }
}
  

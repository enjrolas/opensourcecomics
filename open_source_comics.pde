

castMember me;

void setup()
{ 
  size(200, 200);
  me=new castMember("me");
}

void draw()
{
  
}

class castMember{
  
  Position position, headPosition, bodyPosition;
  Hashtable hashtable;
  String emotion;
  String expression;
  Rotation rotation;
  Color skinColor;
  String name;
  
  castMember(String a)
  {
    name=a;
    hashtable=new Hashtable();
    readData();
  }

  castMember(String a, String emo, String expo)
  {
    name=a;
    emotion=emo;
    expression=expo;
    hashtable=new Hashtable();
    readData();
  }

  castMember(String a, String emo, String expo, Rotation roto)
  {
    name=a;
    emotion=emo;
    expression=expo;
    rotation=roto;
    hashtable=new Hashtable();
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
    
  }
  
  void drawCharacter()
  {
    //calculate component position (the character object should know how to do this, 
    //i.e.  character.getHeadPosition(position, perspective)
    calculatePosition();
    drawHead();
    drawBody();
    drawArms();
    drawLegs();
  }
  
  void calculatePosition()
  {
  }
  
  void drawHead()
  {
    
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
  

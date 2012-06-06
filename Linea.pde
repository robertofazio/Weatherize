class Linea
{
  String orientamento;
  float x, y;
  color col = 255;
  color selCol = color(255, 0, 0);
  int strk = 1;
  public boolean selected = true;
  public int ID;

  Linea(int id, String temp_ort, float sx, float sy, color c, int st)
  {
    ID = id;
    orientamento = temp_ort;
    x = sx;
    y = sy;
    col = c;
    strk = st;
  }

  Linea(int id, String temp_ort, float sx, float sy)
  {
    ID = id;
    orientamento = temp_ort;
    x = sx;
    y = sy;
  }

  void update()
  {
    if (selected)
    {
      col = selCol;
    }
    else
    {
      col = 255;
    }
  }

  void display()
  {
    stroke(col);
    strokeWeight(strk);

    if (orientamento == "oriz")
    {
      line(x, y, screen.width, y);
    }
    else
    {
      line(x, y, x, screen.height);
    }
  }

  void moveDown(int step)
  {
    y+=step;
  }

  void moveUp(int step)
  {
    y-=step;
  }

  void moveRight(int step)
  {
    x+=step;
  }

  void moveLeft(int step)
  {
    x-=step;
  }
}


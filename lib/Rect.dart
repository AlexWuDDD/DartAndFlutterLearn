class Rect{
  num height;
  num width;

  //Rect(this.height, this.width);
  Rect():height=2, width=10{
    
  }

  // num area()
  // {
  //   return this.height*this.width;
  // }

  get area{
    return this.height * this.width;
  }

  set areaheight(num height){
    this.height = height;
  }
}
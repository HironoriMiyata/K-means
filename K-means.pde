
float[][] data = {
{7331.0,7333954.0},
{8366.0,4146434.0},
{10906.0,4139302.2},
{11888.0,3954940.0},
{15208.0,4715398.0},
{8904.0,3141896.2}};//ココにデータを入れる
float [][] aList={//data の要素数に合わせて変更
{1,0},
{1,0},
{0,0},
{0,0},
{0,0},
{0,0}};
float [][] bList={
{1,0},
{1,0},
{0,0},
{0,0},
{0,0},
{0,0}};
float [] a = {10906.0,4139302.2};//Aクラスタの重心
float [] b = {15208.0,4715398.0};//Bクラスタの重心
float [][] aNewList= {
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0}};
float [][] bNewList= {
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0}};
float [][] cNewList= {
{0,0},
{0,0},
{0,0},
{0,0},
{0,0},
{0,0}};
float c;
float d;
int x,y;
void setup(){
  size(1472,828);
  textSize(50);
  for(int j = 0;j < 100; j++){
    K_means();
    for(int k = 0;k < x;k++){
      c += aNewList[k][0];
    }
    a[0] = c / x;
    for(int f = 0;f < x;f++){
      d += aNewList[f][1];
    }
    a[1] = d / x;
    c = 0;
    d = 0;
    for(int k = 0;k < y;k++){
      c += bNewList[k][0];
    }
    b[0] = c / y;
    for(int f = 0;f < y;f++){
      d += bNewList[f][1];
    }
    b[1] = d / y;
    c = 0;
    d = 0;
    for(int i = 0 ;i < aList.length;i++){
      for(int h = 0;h< bList.length;h++){
        if(aList[i][0] == bList[h][0]){
           aList[i][0] = 0;
           aList[i][1] = 0;
        }
      }
    }
    if(aList == aNewList && aList == aNewList){
      text("success",100,100);
      break;
    }
    aList = aNewList;
    bList = bNewList;
  }
  text("cluster A" ,200,300);
  text("cluster B" ,800,300);
  for(int i = 0 ;i < aList.length;i++){
    for(int j = 0;j< bList.length;j++){
      if(aList[i][0] == bList[j][0]){
         aList[i][0] = 0;
         aList[i][1] = 0;
      }
    }
  }
  int r = 370;
  for(int i = 0 ;i < aList.length;i++){
    for(int j = 0;j< bList.length;j++){
      if(aList[i][0] == bList[j][0]){
         aList[i][0] = 0;
         aList[i][1] = 0;
      }
    }
    text(aList[i][0]+"  "+aList[i][1] ,200,r);
    r += 70;
  }
  r = 370;
  for(int i = 0 ;i < bList.length;i++){
    text(bList[i][0]+"  "+bList[i][1] ,800,r);
    r += 70;
  }
}

void K_means(){
  x = 0;
  y = 0;
  for(int i = 0; i < 6;i++){
    if(dist(a[0],a[1],data[i][0],data[i][1]) > dist(b[0],b[1],data[i][0],data[i][1]) ){
      bNewList[x][0] = data[i][0];
      bNewList[x][1] = data[i][1];
      x++;
    } else {
      aNewList[y][0] = data[i][0];
      aNewList[y][1] = data[i][1];
      y++;
    }
  }
}

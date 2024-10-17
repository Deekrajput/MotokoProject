import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Dbank{
  stable var currbal: Float =300;
  currbal:=300;
   Debug.print(debug_show(currbal));
  stable var starttime= Time.now();
  // Debug.print(debug_show(starttime));
  // let id=143454345365;
  

  public func topup(amount: Float){
    currbal+=amount;
    Debug.print(debug_show(currbal));
  };
  // topup();
   public func withdraw(amount: Float){
    let temp: Float =currbal-amount;
    if(temp>=0){
    currbal-=amount;
    Debug.print(debug_show(currbal));}
    else{
      Debug.print("Not enough balance");
    }
  };

public query func checkbal():async Float{
 return currbal;
};

public func compound(){
  let currtime=Time.now();
  let timeelapsedNS=currtime-starttime;
  let timeelapsedS= timeelapsedNS/1000000000;
  currbal:=currbal* (1.01 ** Float.fromInt(timeelapsedS));
  starttime:=currtime;
}

}

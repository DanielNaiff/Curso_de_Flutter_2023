double media(List <int> nums){
  double soma = 0;
  for(int i = 0; i < nums.length ; i++){
    soma += nums[i];
  }
  return soma/nums.length;
}


void main(){
  print('A media é:${media([10,10,10])}');
}

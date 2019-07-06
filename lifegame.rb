
arr=[
  [0,0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,1,1,0,1,1,1,1,1,1,0,0],
  [0,0,1,1,0,1,1,1,1,1,1,0,0],
  [0,0,1,1,0,0,0,0,0,0,0,0,0],
  [0,0,1,1,0,0,0,0,0,1,1,0,0],
  [0,0,1,1,0,0,0,0,0,1,1,0,0],
  [0,0,1,1,0,0,0,0,0,1,1,0,0],
  [0,0,0,0,0,0,0,0,0,1,1,0,0],
  [0,0,1,1,1,1,1,1,0,1,1,0,0],
  [0,0,1,1,1,1,1,1,0,1,1,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0,0,0,0],
]


copy=Array.new(arr.size).map{Array.new(arr[0].size,0)}

neighbors=[-1,0,1]

while true
  arr.size.times{|i|
    arr[0].size.times{|j|
      count=0
      neighbors.each{|x|neighbors.each{|y| count+=arr[i+x][j+y] if((x!=0||y!=0) &&i+x>=0 && i+x<=arr.size-1 && j+y>=0 && j+y<=arr.size-1)}}
      copy[i][j]= arr[i][j]==0&&count==3  || arr[i][j]==1&&(count==2||count==3) ? 1:0
    }
  }
  arr.size.times{|i|
    arr[0].size.times{|j|(arr[i][j]=copy[i][j])==0 ? print("□") : print("■")}
    print("\n")
  }
  readline
end

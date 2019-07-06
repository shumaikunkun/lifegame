WIDTH=13
HEIGHT=13

def next_state(me, other):
  if other==3:
    return 1
  elif other==2:
    return me
  else:
    return 0

field=[
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

copy=[[0]*HEIGHT]*WIDTH

while True:
  for i in range(WIDTH): #惑星のループ
    for j in range(HEIGHT):
      count=0
      for x in range(-1,2):  #衛星のループ
        for y in range(-1,2):
          if x!=0 or y!=0:
            if 0<=i+x<=WIDTH-1 and 0<=j+y<=HEIGHT-1:
              if field[i+x][j+y]>=1:
                count+=1
      copy[i][j]=next_state(field[i][j],count)
      print("□" if copy[i][j]==0 else "■",end="")
    print("\n")
  for i in range(WIDTH): #惑星のループ
    for j in range(HEIGHT):
      field[i][j]=copy[i][j]
    readline()

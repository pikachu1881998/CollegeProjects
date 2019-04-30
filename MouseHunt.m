function [cheeseFound,finalState,totstep] = MouseHunt(maze)
[sizeV,sizeH]=size(maze);
found = 0;
[CH,CV] = find(maze == 2);
[MH,MV]=find(maze == 1);
privious = zeros(size(maze));
steps = 0;
while(found == 0)
    [MH,MV]=find(maze == 1);
    Vd=abs(CH-MH);
    Hd=abs(CV-MV);
    Vertical=(CH-MH);
    Horizontal=(CV-MV);
    %horizontal movement with back up plan 
    if(Hd>Vd)
        if(Horizontal>0)&&(MV<sizeH) %moving right
            privious(MH,MV)=1;
            if(maze(MH,MV+1)==0)&&(privious(MH,MV+1)==0)
                maze(MH,MV+1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            elseif(maze(MH,MV+1)==2) %found the cheese
                found=2;;
                 maze(MH,MV+1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            else                        %back up plan changing direction fot path
                if(Vertical>0)&& MH<sizeH
                    if( maze(MH+1,MV)==0)&&(privious(MH+1,MV)==0)   %vertically down
                    maze(MH+1,MV)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH+1,MV)==2))% found the chese
                        found=2;
                        cheeseFound = 1;
                        maze(MH+1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else     %giving up
                    found = -1;
                    end
                else
                    if((maze(MH-1,MV)==0)&& MH>0 )&&(privious(MH-1,MV)==0)      %vertically up
                        maze(MH-1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                        elseif(maze(MH-1,MV)==2)%fond the cheese
                            found=2;
                            maze(MH-1,MV)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                    else                                     % Giving it up            
                    found = -1;
                    end
                end
            end
        elseif(MV>0)                                         % going left
            privious(MH,MV)=1;
            if(maze(MH,MV-1)==0)&&(privious(MH,MV-1)==0)                              %cheacking if there is a space
                maze(MH,MV-1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
                    elseif(maze(MH,MV-1)==2)                    %found the cheese
                        maze(MH,MV-1)=1;
                        maze(MH,MV)=0;
                        found=2;
                        steps=steps+1;
            else                                                   % if there is an obstacle  
                 if(Vertical>0)&& MH<sizeV
                    if( maze(MH+1,MV)==0)&&(privious(MH+1,MV)==0)   %vertically down
                    maze(MH+1,MV)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH+1,MV)==2))% found the chese
                        found=2;
                        maze(MH+1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else     %giving up
                    found = -1;
                    end
                else
                    if((maze(MH-1,MV)==0)&& MH>0 )&&(privious(MH-1,MV)==0)      %vertically up
                        maze(MH-1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                        elseif(maze(MH-1,MV)==2)%fond the cheese
                            found=2;
                            maze(MH-1,MV)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                    else                                     % Giving it up            
                    found = -1;
                    end
                end
            end
        end    
    elseif(Vd>Hd)                   % Checking if the vertical distance is longer or not
        if(Vertical>0)&&(MH<sizeV) % first movig vertically down 
            privious(MH,MV)=1;
                if(maze(MH+1,MV)==0)&&(privious(MH+1,MV)==0) % checkin if there is a free space
                maze(MH+1,MV)=1;
                maze(MH,MV)=0;
                steps=steps+1;
                    elseif(maze(MH+1,MV)==2)% chese found
                    found=2;
                    maze(MH+1,MV)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                else
                    if(Horizontal>0)&& MV<sizeH
                        if( maze(MH,MV+1)==0)&&(privious(MH,MV+1)==0)   %MOving horizontally right 
                        maze(MH,MV+1)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                            elseif(( maze(MH,MV+1)==2))% found the chese
                            found=2;
                            maze(MH,MV+1)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                        else     %giving up
                        found = -1;
                        end
                    else
                        if((maze(MH,MV-1)==0)&& MV>0 )&&(privious(MH,MV-1)==0)      %Moving horizontally left
                            maze(MH,MV-1)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                        elseif(maze(MH-1,MV)==2)%fond the cheese
                            found=2;
                            maze(MH,MV-1)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                        else                                     % Giving it up            
                        found = -1;
                        end
                    end
                end
        
        elseif(MH>0) % now moving vertically up    
            privious(MH,MV)=1;
            if(maze(MH-1,MV)==0)&&(privious(MH-1,MV)==0) %cheacking if up there any space
                maze(MH-1,MV)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            elseif(maze(MH-1,MV)==2) %found the cheese
                found=2;
                maze(MH-1,MV)=1;
                 maze(MH,MV)=0;
                 steps=steps+1;
            else                  % if there is am=ny obstecle 
                if(Horizontal > 0) &&(MV<sizeH) % moving right
                    if( maze(MH,MV+1)==0)&&(privious(MH,MV+1)==0)
                    maze(MH,MV+1)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH,MV+1)==2)) % found the cheese
                        found=2;
                        maze(MH,MV+1)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else % ese giving it up
                    found = -1;
                    end
                elseif(MV >0)     %moving left
                    if( maze(MH,MV-1)==0) &&(privious(MH,MV-1)==0)
                    maze(MH,MV-1)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH,MV-1)==2)) % found the cheese
                        found=2;
                        maze(MH,MV-1)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else % else giving it up
                    found = -1;
                    end
                end 
            end
        end   
    else
       if(Horizontal>0)&& MV<sizeH   %moving right if horizontal and vertical distance are same
            privious(MH,MV)=1;
            if(maze(MH,MV+1)==0)&&(privious(MH,MV+1)==0)
                maze(MH,MV+1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            elseif(maze(MH,MV+1)==2)
                found=2;
                maze(MH,MV+1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            else
            if(Vertical>0)&& MH<sizeV
                    if( maze(MH+1,MV)==0)&&(privious(MH+1,MV)==0)   %vertically down
                    maze(MH+1,MV)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH+1,MV)==2))% found the chese
                        found=2;
                        maze(MH+1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else     %giving up
                    found = -1;
                    end
                else
                    if((maze(MH-1,MV)==0)&& MH>0 )&&(privious(MH-1,MV)==0)      %vertically up
                        maze(MH-1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                        elseif(maze(MH-1,MV)==2)%fond the cheese
                            found=2;
                            maze(MH-1,MV)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                    else                                     % Giving it up            
                    found = -1;
                    end 
            end 
            end 
         else
            privious(MH,MV)=1;
           if(maze(MH,MV-1)==0)&&(privious(MH,MV-1)==0) % moving left
                maze(MH,MV-1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
            elseif(maze(MH,MV-1)==2)
                found=2;
                 maze(MH,MV+1)=1;
                maze(MH,MV)=0;
                steps=steps+1;
           else
                if(Vertical>0)&& MH<sizeH 
                    if( maze(MH+1,MV)==0)&&(privious(MH+1,MV)==0)  %vertically down
                    maze(MH+1,MV)=1;
                    maze(MH,MV)=0;
                    steps=steps+1;
                        elseif(( maze(MH+1,MV)==2))% found the chese
                        found=2;
                        maze(MH+1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                    else     %giving up
                    found = -1;
                    end
                else
                    if((maze(MH-1,MV)==0)&& MH>0 )&&(privious(MH-1,MV)==0)      %vertically up
                        maze(MH-1,MV)=1;
                        maze(MH,MV)=0;
                        steps=steps+1;
                        elseif(maze(MH-1,MV)==2)%fond the cheese
                            found=2;
                            maze(MH-1,MV)=1;
                            maze(MH,MV)=0;
                            steps=steps+1;
                    else                                     % Giving it up            
                    found = -1;
                    end
                end 
           end 
       end 
    end 
end
totstep = steps;
cheeseFound = found;
finalState=maze;
end

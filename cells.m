%%
N=8;
X=linspace(0,31.96,N);
Y=X;
Z=X;

grid = zeros(N^3,3);
counter = 1;
for i=1:N
    for j=1:N
        for k=1:N
            grid(counter,:) = [X(i),Y(j),Z(k)];
            counter=counter+1;
        end
    end
end
%%
scatter3(grid(:,1),grid(:,2),grid(:,3))
%%
scatter3(new3(:,1),new3(:,2),new3(:,3))
%%
scatter3(dump(:,2),dump(:,3),dump(:,4))
%%
scaledGrid = grid./3.4;
scatter3(grid(:,1),grid(:,2),grid(:,3))
hold all
scatter3(dump(:,2),dump(:,3),dump(:,4))
%%
fid=fopen('fortran.txt','wt');
fmt=['%2s' repmat('%16.10f',1,3) '\n']; % --> Fortran (2I5,F5.2) format
for i=1:N^3
    fprintf(fid,fmt,'Ar',grid(i,1),grid(i,2),grid(i,3));
end

fid=fclose(fid);
%%
N=8;
X=linspace(0,31.96,N)/3.4;
Y=X;
Z=X;

grid = zeros(N^3,3);
counter = 1;
for i=1:N
    for j=1:N
        for k=1:N
            grid(counter,:) = [X(i),Y(j),Z(k)];
            counter=counter+1;
        end
    end
end
%%
A=repmat(grid(220,:),512,1)-grid;
counter=1;
B=zeros(18,3);
for i=1:512
    if norm(A(i,:)) <= 2.3
        B(counter,:)=grid(i,:);
        counter=counter+1;
    end
        
end
%%
scatter3(B(:,1),B(:,2),B(:,3))
%%
scatter3(F(:,1),F(:,2),F(:,3))
%%
addToGrid=0;
scatter(grid(:,1),grid(:,2))
axis([0-addToGrid 9.4+addToGrid 0-addToGrid 9.4+addToGrid])

for i=0-addToGrid:2.35:9.4+addToGrid
    line([i i],[-1 11])
    line([-1 11],[i i])
end
%%
m=39.489*1.660E-27;
e=1.65E-21
sigma = 3.4E-10;

alpha = sqrt(m*sigma^2/e);

sigma/alpha






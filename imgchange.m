function imgchange()

maindir1 = 'E:\test\i';
maindir2 ='E:\test\a';
subdir=dir(maindir1);

for i=1:length(subdir)
    if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) ||  ~subdir( i ).isdir )
        continue;
    end
    subdirpath=fullfile(maindir1,subdir(i).name,'*.jpg');
    subdirpath2=fullfile(maindir2,subdir(i).name,'*.mat');
    images=dir(subdirpath);
    mats=dir(subdirpath2);
    for j=1:length(images)
        imagepath=fullfile(maindir1,subdir(i).name,images(j).name);
        matpath=fullfile(maindir2,subdir(i).name,mats(j).name);
        load(matpath,'obj_contour');
        imgdata=imread(imagepath);
        %imgdata=imcrop(imgdata,[box_coord(3), box_coord(1), box_coord(4)-box_coord(3), box_coord(2)-box_coord(1)]);
        a=[100,200,100,0];
        b=[0,100,200,100];
        imgdata=roipoly(imgdata,a,b);
        imgdata=imresize(imgdata,[300 300]);
        imwrite(imgdata,imagepath,'jpg');
    end
    
end
end
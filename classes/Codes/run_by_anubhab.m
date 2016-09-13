function [] = run_by_anubhab(name)

f = imread(name);
[c,im] = colorDetect(f);
img = extractObject(im);

detect_X(img);

end
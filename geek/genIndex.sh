#!/bin/bash

main=index.html
cat > $main <<ENDCAT
<html>
<head>
  <style>
    @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css);
    /* @import url(https://fonts.googleapis.com/css?family=Noto+Sans:400,700); */

    *,::before,::after{box-sizing:border-box}
    html{min-height:100%}
    body{margin:40px;font:1.2em/1.2 'Noto Sans',sans-serif;background:linear-gradient(90deg,#b9c3c9,#6b7c87)}
    form{position:relative;width:768px;margin:0 auto;padding:20px;border-top:30px solid #5c5d5e;border-radius:10px;background-color:#e8ebed;box-shadow:0 0 80px rgba(0,0,0,.2)}
    form::before{content:'';position:absolute;top:-20px;left:15px;width:10px;height:10px;border-radius:50%;background-color:#adadae;box-shadow:20px 0 0 #adadae,40px 0 0 #adadae}
    h1{margin:0;padding-bottom:20px;border-bottom:1px solid #adadae;color:#5c5d5e;font-size:1.1em}
    .tree{padding:20px 0}
    .tree::after{content:'';display:block;clear:left}
    .tree div{clear:left}
    input[type="checkbox"]{position:absolute;left:-9999px}
    label,a{display:block;float:left;clear:left;position:relative;margin-left:25px;padding:5px;border-radius:5px;color:#5c5d5e;text-decoration:none;cursor:pointer}
    label::before,a::before{display:block;position:absolute;top:6px;left:-25px;font-family:'FontAwesome'}
    label::before{content:'\f07b'}
    input:checked+label::before{content:'\f07c'}
    a::before{content:'\f068'}
    input:focus+label,a:focus{outline:none;background-color:#b9c3c9}
    .sub{display:none;float:left;margin-left:30px}
    input:checked~.sub{display:block}
    input[type="reset"]{display:block;width:100%;padding:10px;border:none;border-radius:10px;color:#e8ebed;background-color:#6b7c87;font-family:inherit;font-size:.9em;cursor:pointer;-webkit-appearance:none;-moz-appearance:none}
    input[type="reset"]:focus{outline:none;box-shadow:0 0 0 4px #b9c3c9}
  </style>
</head>

<body>
  <form>
    <h1>Geek</h1>
    <div class="tree">
ENDCAT

current_folder=$(basename "$(pwd)")
dirs=$(ls -d */)
idx=0
for dir in $dirs; do
  echo "<div><input id='n-${idx}' type='checkbox'><label for='n-${idx}'>${dir}</label><div class='sub'>" >> $main
  cd "$dir"
  for f in $(find . -type f | sort -d); do
    echo $f
    echo "<a href='${current_folder}/${dir}${f}'>${f}</a>" >> ../${main}
  done
  cd ..
  echo '</div></div>' >> $main
  idx=$((idx + 1))
done

echo '</div><input type="reset" value="全部折叠"></form></body></html>' >> $main
echo '首页文件生成完毕'

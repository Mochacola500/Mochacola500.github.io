# Blog
My blog using Chirpy's template.

## Chirpy Starter
Tutorial: [theme's docs](https://github.com/cotes2020/jekyll-theme-chirpy#documentation)

## post.bat
Create a new file named YYYY-MM-DD-.md with front matter context. inspired by [`Jekyll-Compose`](https://github.com/jekyll/jekyll-compose).

```bat
echo Create %filename% file.
echo --- > %filename%
echo title: >> %filename%
echo date: %YMSdatestamp% %HMSdatestamp% +0900 >> %filename%
echo categories: >> %filename%
echo tags: >> %filename%
echo --- >> %filename%
pause
```
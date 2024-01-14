# Blog
My blog using Chirpy's template.

## Chirpy Starter
Tutorial: [theme's docs](https://github.com/cotes2020/jekyll-theme-chirpy#documentation)

## post.bat
Create a new file named YYYY-MM-DD-.md with front matter context. inspired by [`Jekyll-Compose`](https://github.com/jekyll/jekyll-compose).

```bat
echo --- >> %datestamp%-.md
echo title: >> %datestamp%-.md
echo date: %datestamp% %hmsdatestamp% +0900 >> %datestamp%-.md
echo categories: >> %datestamp%-.md
echo tags: >> %datestamp%-.md
echo --- >> %datestamp%-.md
pause
```

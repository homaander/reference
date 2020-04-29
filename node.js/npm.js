/* CMD
    Инициализоровать
        npm init

    Установить и запустить отдельно
        npm install -g browser-sync
        browser-sync start --proxy "test.loc" --files "css/*.css"

    Использовать вместе с gulp
        npm install -D browser-sync

    Fetch
        npm install node-fetch --save

    Gulp
        npm install -g gulp-cli

        npm install -D gulp
        npm install -D gulp-rename

        npm install -D gulp-sass
        npm install -D gulp-autoprefixer
        npm install -D gulp-sourcemaps

        gulp -v

        Запустить дефолтную функцию
            gulp

        Запустить другой процесс
            gulp print

    Colors
        npm i colors
*/

// Fetch
    const fetch = require('node-fetch');

// Get
    const https = require('https');

// Colors
    // Examples
        var colors = require('colors');

        console.log('hello'.green); // outputs green text
        console.log('i like cake and pies'.underline.red) // outputs red underlined text
        console.log('inverse the color'.inverse); // inverses the color
        console.log('OMG Rainbows!'.rainbow); // rainbow
        console.log('Run the trap'.trap); // Drops the bass


// Gulp
    var gulp      = require('gulp'); 
    var rename    = require('gulp-rename');

    var sass      = require('gulp-sass'); 
    var auto_pref = require('gulp-autoprefixer'); 
    var sor_map   = require('gulp-sourcemaps');


    var {src, dest, series} = require('gulp');
    var {init, write}       = require('gulp-sourcemaps'); 

    // browser-sync
        var browserSync  = require('browser-sync').create();

        exports.bSync = () => {
            browserSync.init({
                proxy: "test.loc"
            });

            gulp.watch("style.css").on('change', browserSync.reload);
        };


    function print(done) {
        console.log('Hello World');

        gulp.src('./scss/file.scss')
            .pipe(sor_map.init())
            
            .pipe(sass({
                errorLogToConsole: true,
                outputStyle: 'compressed'
            }))
            .on('error', console.error.bind(console))

            .pipe(auto_pref({
                browsers: ['last 2 versions'],
                cascade: false
            }))

            .pipe(rename('file.css'))
            .pipe(rename({suffix: '.min'}))

            .pipe(sor_map.write('./'))
            .pipe(dest('./css/'))

            .pipe(browserSync.stream());;

        done();
    }

    function watchSass() {
        gulp.watch("file.txt", print);
    }

    exports.default = print;

    exports.print = (done) => { done(); }

    exports.all = gulp.series(print, sass_convert);
    exports.all = gulp.parallel(print, sass_convert);

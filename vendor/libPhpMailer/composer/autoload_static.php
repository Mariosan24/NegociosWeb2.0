<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitd61000d826a53153e9b80b03e1bd946a
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitd61000d826a53153e9b80b03e1bd946a::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitd61000d826a53153e9b80b03e1bd946a::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}

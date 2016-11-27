requires 'perl', '5.8.8';

on test => sub {
    requires 'Test::More', '0.98';
};

on configure => sub {
    requires 'Module::Build::XSUtil', '0.16';
};

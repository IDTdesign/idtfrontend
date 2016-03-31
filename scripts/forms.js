(function ($) {

    $('select.form-control-custom').selectOrDie();

    $('#forms--example').bootstrapValidator({
        live: 'disabled',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstname: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The username must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The username can only consist of alphabetical and number'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
            },
            lastname: {
                message: 'The lastname is not valid',
                validators: {
                    notEmpty: {
                        message: 'The lastname is required and cannot be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The lastname must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The lastname can only consist of alphabetical and number'
                    },
                    different: {
                        field: 'password',
                        message: 'The lastname and password cannot be the same as each other'
                    }
                }
            },
            phone: {
                validators: {
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: 'The phone must be less than 11 characters long'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The username can only consist of number'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not a valid'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    different: {
                        field: 'username',
                            message: 'The password cannot be the same as username'
                    },
                    stringLength: {
                        min: 8,
                            message: 'The password must have at least 8 characters'
                    }
                }
            },
            birthday: {
                validators: {
                    notEmpty: {
                        message: 'The date of birth is required'
                    },
                    date: {
                        format: 'YYYY/MM/DD',
                        message: 'The date of birth is not valid'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required'
                    }
                }
            },
            rss: {
                validators: {
                }
            }
        }
    });

    $('.input-group .form-control').focus(function(event){
        $(this).parent().addClass('input-group-focus');
    }).blur(function(event){
        $(this).parent().removeClass('input-group-focus');
    });

    $('input[type="tel"]').inputmask({
        mask: '99999999'
    });

    $('.form-control-date').inputmask({
        mask: '9999/99/99'
    });

}(jQuery));

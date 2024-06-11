import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome_back': "Welcome Back!",
      'email': 'Email',
      'enter_email_address': 'Enter Email Address',
      'please_enter_your_email_address': 'Please enter your Email Address',
      'please_enter_a_valid_email_address':
      'Please Enter a Valid Email Address',
      'password': 'Password',
      'enter_password': 'Enter Password',
      'please_enter_your_password': 'Please enter your Password',
      'password_should_be_alphanumeric':
      "password should be alphanumeric and greater than 6 character",
      'forget_password': "Forget Password",
      "create_account":"Create Account",
      "do_have_account?":"Don't Have An Account?  ",

      // show Dialog
      "no_internet": "Ooops! No Internet",
      "no_internet_message":
      "No Internet Connection Found. Please Check your internet connection or try again",
      "try_again":"Try Again",

      // Email Verify show Dialog
      "email_verification_required":"Email Verification Required",
      "please_verify_your_email":"Your email address has not been verified yet. Please verify your email to continue",
      "continue":"continue",
      "No":"No",
      // Toast
      "sign_in_successfully": "Sign in Successfully",

      // Exception
      "no_internet_exception":"No Internet Exception",
      "request_time_out":"Request Time out",
      "email-already-in-use-message":"Email already in use. Please use another email",
      "email-already-in-use-title":"Email Already in Use",
      "wrong-password-message":"Password incorrect. Please check your password",
      "wrong-password-title":"Incorrect Password",
      'invalid-email': 'Invalid email address. Please enter a valid email address.',
      'invalid-email-title': 'Invalid Email Address',
      'invalid-credential': 'Invalid email or password. Please check your credentials and try again.',
      'invalid-credential-title': 'Check Email or Password',
      'weak-password': 'Weak password. Please enter a stronger password.',
      'weak-password-title': 'Invalid Password',
      'too-many-requests': 'Too many requests. Please try again later.',
      'too-many-requests-title': 'Too Many Requests',
      'operation-not-allowed': 'This operation is not allowed.',
      'operation-not-allowed-title': 'Operation Not Allowed',
      'user-disabled': 'This user has been disabled.',
      'user-disabled-title': 'User Disabled',
      'user-not-found': 'No user found with this email.',
      'user-not-found-title': 'User Not Found',
      'default-message': 'Please check your internet connection or other issues.',
      'default-title': 'Error Occurred',
      'other_exception': 'Other Exception',
      'ok':"Ok",


      //
      //
      "with_or":"with Or"
    },
    'bn_BD': {
      'welcome_back': "পুনরায় স্বাগতম!",
      'email': "ইমেইল",
      'enter_email_address': "ইমেইল এড্রেস লিখুন",
      'please_enter_your_email_address':
      "অনুগ্রহ করে আপনার ইমেইল ঠিকানা লিখুন",
      'please_enter_a_valid_email_address':
      "দয়া করে একটি বৈধ ইমেইল ঠিকানা লিখুন",
      'password': "পাসওয়ার্ড",
      'enter_email_password': 'পাসওয়ার্ড লিখুন',
      'please_enter_your_password': 'অনুগ্রহ করে আপনার পাসওয়ার্ড লিখুন',
      'password_should_be_alphanumeric':
      "পাসওয়ার্ডটি অক্ষর এবং সংখ্যার মিশ্রণ এবং ৬ টির বেশি অক্ষর হতে হবে।",
      'forget_password': 'পাসওয়ার্ড ভুলে গেছেন?',
      "create_account":"নতুন অ্যাকাউন্ট তৈরি করুন",
      "do_have_account?":"আপনার কি অ্যাকাউন্ট আছে?  ",

      // show Dialog
      "no_internet": "ওহ! ইন্টারনেট নেই",
      "no_internet_message":
      "ইন্টারনেট সংযোগ পাওয়া যায়নি। আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন অথবা আবার চেষ্টা করুন।",
      "try_again":"আবার চেষ্টা করুন",
      // Email Verify show Dialog
      "email_verification_required":"ইমেইল যাচাইকরণ প্রয়োজন",
      "please_verify_your_email":"আপনার ইমেইল ঠিকানা এখনো যাচাই হয়নি। আপনার ইমেইল যাচাই করুন যাতে চালিয়ে যান।",
      "continue":"চালিয়ে যান",
      "No":"না",
      // Toast
      "sign_in_successfully": "সফলভাবে সাইন ইন করা হয়েছে",
      // Exception
      "no_internet_exception":"ইন্টারন্টে নাই",
      "request_time_out":"অনুরোধের সময় শেষ",
      "email-already-in-use":"ইমেইল ইতিমধ্যে ব্যবহৃত হয়েছে। অন্য ইমেইল ব্যবহার করুন",
      "email-already-in-use-title":"ইমেইল ইতিমধ্যে ব্যবহৃত হয়েছে",
      "wrong-password":"পাসওয়ার্ড ভুল। আপনার পাসওয়ার্ড পরীক্ষা করুন।",
      "wrong-password-title":"ভুল পাসওয়ার্ড",
      'invalid-email': 'অবৈধ ইমেইল ঠিকানা। দয়া করে একটি বৈধ ইমেইল ঠিকানা লিখুন।',
      'invalid-email-title': 'অবৈধ ইমেইল ঠিকানা',
      'invalid-credential': 'অবৈধ ইমেইল বা পাসওয়ার্ড। দয়া করে আপনার শংসাপত্র পরীক্ষা করুন এবং আবার চেষ্টা করুন।',
      'invalid-credential-title': 'ইমেইল বা পাসওয়ার্ড পরীক্ষা করুন',
      'weak-password': 'শক্তিহীন পাসওয়ার্ড। দয়া করে একটি শক্তিশালী পাসওয়ার্ড লিখুন।',
      'weak-password-title': 'অবৈধ পাসওয়ার্ড',
      'too-many-requests': 'অনেক অনুরোধ। দয়া করে পরে আবার চেষ্টা করুন।',
      'too-many-requests-title': 'অনেক অনুরোধ',
      'operation-not-allowed': 'এই অপারেশনটি অনুমোদিত নয়।',
      'operation-not-allowed-title': 'অপারেশন অনুমোদিত নয়',
      'user-disabled': 'এই ব্যবহারকারী নিষ্ক্রিয় করা হয়েছে।',
      'user-disabled-title': 'ব্যবহারকারী নিষ্ক্রিয় করা হয়েছে',
      'user-not-found': 'এই ইমেইল দিয়ে কোনও ব্যবহারকারী পাওয়া যায়নি।',
      'user-not-found-title': 'ব্যবহারকারী খুঁজে পাওয়া যায়নি',
      'default-message': 'দয়া করে আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন বা অন্যান্য সমস্যা পরীক্ষা করুন।',
      'default-title': 'ত্রুটি ঘটেছে',
      'other_exception': 'অন্যান্য অব্যাহতি',
      'ok':"ঠিক আছে",
      "with_or":"অথবা",
    }
  };
}

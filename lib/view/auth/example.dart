// Radio Button for Registration Page
/*
                        Row(
                          children: [
                            Text(
                              "Gender",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Radio<Gender>(
                              value: Gender.male,
                              groupValue: _selectGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectGender = value!;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColors.black),
                            ),
                            Radio<Gender>(
                              value: Gender.female,
                              groupValue: _selectGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectGender = value!;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColors.black),
                            ),
                            Radio<Gender>(
                              value: Gender.other,
                              groupValue: _selectGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectGender = value!;
                                });
                              },
                            ),
                            Text(
                              "Other",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColors.black),
                            ),
                          ],
                        ),
                        */


// Sign Up Coding old
/*
                                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                          loadingProvider.setLoading(loading: true);
                                          userCredential = await FirebaseServiceProvider
                                              .createUserWithEmilandPasswordSnaphsot(
                                            email: _emailET.text,
                                            password: _passwordET.text,
                                          ).then((value) {
                                            loadingProvider.setLoading(loading: false);

                                            ProfileModel profileModel = ProfileModel(
                                                name: _nameET.text,

                                                email: _emailET.text,
                                                phone: _phoneET.text,
                                                uid: value.user!.uid,

                                               );

                                            _firestore.collection("seller").doc(value. user!.uid).set(profileModel.toMap());




                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => UserVerifyPage(
                                                    userCredential: value,
                                                  ),
                                                ));
                                            return null;
                                          });
                                        } else {
                                          globalMethod.flutterToast(msg: "No Internet Connection");
                                        }
                          */
import 'package:project1/utils/import_export.dart';

class Lab22View extends StatefulWidget {
  const Lab22View({super.key});

  @override
  State<Lab22View> createState() => _Lab22ViewState();
}

class _Lab22ViewState extends State<Lab22View> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  
  Lab22Controller controller = Lab22Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                label: Text("Name"),
                  hintText: "Enter Name",
                  border: OutlineInputBorder(),
          ),
                validator: (value) => controller.nameValidator(value!),
                ),
              SizedBox(height: 10,),
              TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Enter Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => controller.emailValidator(value!),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Phone Number"),
                  hintText: "Enter Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => controller.phoneValidator(value!),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => controller.passValidator(value!),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: confirmPassCtrl,
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  hintText: "Enter Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => controller.confirmPassValidator(value!),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                if(!formKey.currentState!.validate()){

                }
              }, child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}

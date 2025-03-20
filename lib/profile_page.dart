import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final key = GlobalKey<FormState>();
  List<Map<String, dynamic>> daftarTask = [];

  void addData() {
    setState(() {
      daftarTask.add({
        'task': taskController.text,
        'date': dateController.text,
        'completed': false,
      });
      taskController.clear();
      dateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/adan.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Akhdan Jauzaa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        Text('Muhammadiyah University of Yogyakarta student',)
                      ],
                    )
                ],
              ),
              const SizedBox(height: 20),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Task Date:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Form(
                key: key,
                child: Row(
                children: [
                  Expanded(child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Harap Masukan Task';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: taskController,
                    decoration: InputDecoration(
                      label: Text('Task'),
                      hintText: 'Input Task',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ),
                  OutlinedButton(onPressed: (){
                    if (key.currentState!.validate()){
                      addData();
                    }
                  }, child: Text('Submit')),
                ],
              )),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: daftarTask.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.indigo[100],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(daftarTask[index]['task']),
                              Text(
                                daftarTask[index]['completed']
                                    ? 'Done'
                                    : 'Not Done',
                                style: TextStyle(
                                    color: daftarTask[index]['completed']
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: daftarTask[index]['completed'],
                            onChanged: (bool? value) {
                              setState(() {
                                daftarTask[index]['completed'] = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

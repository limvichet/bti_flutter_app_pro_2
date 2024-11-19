import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff34a0bc),
        centerTitle: true,
        title: Text(
          'Help and Guide',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        // Container(
        //   width: double.maxFinite,
        //   color: Color.fromARGB(255, 226, 233, 235),
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: Text(
        //       'AboutM HRCPD App',
        //       style: TextStyle(color: Colors.grey[800]),
        //     ),
        //   ),
        // ),
        Container(
          width: double.maxFinite,
          color: Color.fromARGB(255, 220, 222, 222),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'កម្មវិធី HRCPD របស់អ្នកគឺជំនាន់ ២.០',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'ជាជំនាន់ចុងក្រោយ',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        Divider(),
        Container(
          width: double.maxFinite,
          color: Color.fromARGB(255, 226, 233, 235),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'វីដេអូបណ្តុះបណ្តាលកម្មវិធី',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'ត្រួតពិនិត្យ និងស្នើកែប្រែព័ត៌មានផ្ទាល់ខ្លន',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'ស្វែងរកសកម្មភាពអវប និងស្នើចុះឈ្មោះ',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          ],
        ),
        Divider(),
        Container(
          width: double.maxFinite,
          color: Color.fromARGB(255, 226, 233, 235),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'ទំនាក់ទំនង',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '៨០ មហាវិថីព្រះនរោត្តម​ (៤១) រាជធានីភ្នំពេញុ, ប្រទេសកម្ពុជា',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
          ],
        ),
        // Divider(),
        Container(
          color: Color.fromARGB(255, 220, 222, 222),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '068 551 992',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              'ថ្ងៃច័ន្ទ ដល់ ថ្ងៃសុក្រ ម៉ោង ៨ ព្រឹក ដល់ម៉ោង ៥ ល្ងាច',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        // Divider(),
        // Container(
        //   color: Color.fromARGB(255, 220, 222, 222),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.mail),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(20.0),
        //         child: Text(
        //           'cpdmo@mo.moeys.gov.kh',
        //           style: TextStyle(color: Colors.blue[800]),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Divider(),
        // Container(
        //   color: Color.fromARGB(255, 220, 222, 222),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.facebook),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(20.0),
        //         child: Text(
        //           'www.facebook.com/CPDMO.MoEYS',
        //           style: TextStyle(color: Colors.blue[800]),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

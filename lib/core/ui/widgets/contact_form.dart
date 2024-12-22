import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validatorless/validatorless.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    super.key,
    required this.constraints,
  });

  final double constraints;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final mailtoLink = Mailto(
        to: ['kimberlymediciadvocacia@gmail.com'],
        subject: 'Contato do site "${_nameController.text}"',
        body: 'Nome: ${_nameController.text}\n'
            'Email: ${_emailController.text}\n'
            'Mensagem: ${_messageController.text}',
      );

      await launchUrl(Uri.parse('$mailtoLink'));
    }
  }

  void _openMaps() async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=R.+Emancipadores+do+Município,+346+-+sala+6+-+Jardim+Primavera,+Itupeva+-+SP,+13295-000');

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }

  Widget getLayout() {
    if (widget.constraints < 600) {
      return minLayout();
    } else if (widget.constraints >= 600 && widget.constraints < 1024) {
      return minLayout();
    } else {
      return maxWidthLayout();
    }
  }

  Widget minLayout() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Endereço',
            style: titleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'R. Emancipadores do Município, 346 - sala 6\nBairro: Jardim Primavera, Itupeva - SP\nCEP: 13295-000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 80,
              height: 45,
              child: ElevatedButton(
                onPressed: _openMaps,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                ),
                child: Text(
                  'Ver no mapa',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Email',
            style: titleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'kimberlymediciadvocacia@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contato',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Nome obrigatório'),
                      Validatorless.min(
                          3, 'Nome inválido, mínimo 3 caracteres'),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email inválido'),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: 'Mensagem',
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required('Mensagem obrigatória'),
                    Validatorless.min(
                      20,
                      'Mensagem inválida, mínimo 20 caracteres',
                    ),
                  ]),
                  maxLines: 4,
                ),
                const SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 80,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Enviar',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget maxWidthLayout() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.constraints > 1215)
            Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  minWidth: 300,
                ),
                child: form(),
              ),
            )
          else
            Expanded(
              child: form(),
            ),
          const SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Endereço',
                style: titleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'R. Emancipadores do Município, 346 - sala 6\nBairro: Jardim Primavera, Itupeva - SP\nCEP: 13295-000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 80,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _openMaps,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                    child: Text(
                      'Ver no mapa',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: titleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'kimberlymediciadvocacia@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Nome',
          ),
          style: const TextStyle(color: Colors.grey),
          validator: Validatorless.multiple(
            [
              Validatorless.required('Nome obrigatório'),
              Validatorless.min(3, 'Nome inválido, mínimo 3 caracteres'),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          style: const TextStyle(color: Colors.white),
          validator: Validatorless.multiple(
            [
              Validatorless.required('Email obrigatório'),
              Validatorless.email('Email inválido'),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: _messageController,
          decoration: const InputDecoration(
            labelText: 'Mensagem',
          ),
          style: const TextStyle(color: Colors.white),
          validator: Validatorless.multiple([
            Validatorless.required('Mensagem obrigatória'),
            Validatorless.min(
              20,
              'Mensagem inválida, mínimo 20 caracteres',
            ),
          ]),
          maxLines: 4,
        ),
        const SizedBox(height: 24.0),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 80,
            height: 45,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Enviar',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

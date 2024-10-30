import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Addtienda extends StatelessWidget {
  const Addtienda({super.key, required this.onUpload, required this.imageUrl});

  final String? imageUrl;
  final void Function(String imageUrl) onUpload;

  @override
  Widget build(BuildContext context) {
    final SupabaseClient supabase = Supabase.instance.client;
    return Column(
      children: [
        SizedBox(
          width: 500,
          height: 150,
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text('no Image'),
                  ),
                ),
        ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              //elejir una imagen
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);

              if (image == null) {
                return;
              }

              final ImageBytes = await image.readAsBytes();
              final userId = supabase.auth.currentUser!.id;
              final imagePath = '/$userId/profile';
              await supabase.storage.from('tiendas').uploadBinary(
                    imagePath,
                    ImageBytes,
                    fileOptions: const FileOptions(
                      upsert: true,
                    ),
                  );
              final imageUrl =
                  supabase.storage.from('tiendas').getPublicUrl(imagePath);

              onUpload(imageUrl);
            },
            child: Text('subir Imagen'))
      ],
    );
  }
}

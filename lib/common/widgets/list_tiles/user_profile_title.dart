
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nearsq/common/widgets/images/t_circular_image.dart';
import 'package:nearsq/utilis/constants/colors.dart';
import 'package:nearsq/utilis/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: const TCircularImage(image: TImages.user,width: 50,height: 50,padding: 0,),
                title: Text('E commerce',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
                subtitle: Text('E commerce',style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit,color: TColors.white,)),
                );
  }
}
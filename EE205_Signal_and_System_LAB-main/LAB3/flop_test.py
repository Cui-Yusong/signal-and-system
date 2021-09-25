from flopth import flopth
import torchvision.models as models

alexnet = models.alexnet()
a = 1+1
sum_flops = flopth(alexnet, in_size=[1])
print(sum_flops)
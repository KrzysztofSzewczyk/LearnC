test:
  push rbp
  mov rbp, rsp
  and rsp, -32
  sub rsp, 6760
  vmovsd QWORD PTR [rsp+320], xmm0
  vmovsd QWORD PTR [rsp+312], xmm1
  mov QWORD PTR [rsp+304], rdi
  vmovsd xmm0, QWORD PTR [rsp+320]
  vmovsd QWORD PTR [rsp+5712], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+5712]
  vmovapd ymm6, ymm0
  vmovapd YMMWORD PTR [rsp+136], ymm6
  vmovsd xmm0, QWORD PTR [rsp+312]
  vmovsd QWORD PTR [rsp+5720], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+5720]
  vmovapd ymm7, ymm0
  vmovapd YMMWORD PTR [rsp+104], ymm7
  vmovsd xmm0, QWORD PTR .liczba0[rip]
  vmovsd QWORD PTR [rsp+5728], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+5728]
  vmovapd ymm1, ymm0
  vmovapd YMMWORD PTR [rsp+5768], ymm6
  vmovapd YMMWORD PTR [rsp+5736], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+5768]
  vxorpd ymm0, ymm0, YMMWORD PTR [rsp+5736]
  vmovapd YMMWORD PTR [rsp+72], ymm0
  vmovapd YMMWORD PTR [rsp+5832], ymm6
  vmovapd YMMWORD PTR [rsp+5800], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+5832]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+5800]
  vmovapd YMMWORD PTR [rsp+40], ymm0
  vmovapd YMMWORD PTR [rsp+5896], ymm1
  vmovapd YMMWORD PTR [rsp+5864], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+5896]
  vandnpd ymm0, ymm0, YMMWORD PTR [rsp+5864]
  vmovapd YMMWORD PTR [rsp+8], ymm0
  vmovsd xmm0, QWORD PTR .liczba1[rip]
  vmovsd QWORD PTR [rsp+5952], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+5952]
  vmovapd YMMWORD PTR [rsp+5992], ymm7
  vmovapd YMMWORD PTR [rsp+5960], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+5992]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5960]
  vmovapd ymm13, ymm0
  vmovsd xmm0, QWORD PTR .liczba2[rip]
  vmovsd QWORD PTR [rsp+6048], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6048]
  vmovapd YMMWORD PTR [rsp+6088], ymm7
  vmovapd YMMWORD PTR [rsp+6056], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6088]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+6056]
  vmovapd ymm14, ymm0
  vmovsd xmm0, QWORD PTR .liczba3[rip]
  vmovsd QWORD PTR [rsp+6144], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6144]
  vmovapd YMMWORD PTR [rsp+6184], ymm7
  vmovapd YMMWORD PTR [rsp+6152], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6184]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+6152]
  vmovapd ymm15, ymm0
  vmovsd xmm0, QWORD PTR .liczba1[rip]
  vmovsd QWORD PTR [rsp+6240], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6240]
  vmovapd YMMWORD PTR [rsp+6280], ymm6
  vmovapd YMMWORD PTR [rsp+6248], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6280]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+6248]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovsd xmm0, QWORD PTR .liczba2[rip]
  vmovsd QWORD PTR [rsp+6336], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6336]
  vmovapd YMMWORD PTR [rsp+6376], ymm7
  vmovapd YMMWORD PTR [rsp+6344], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6376]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+6344]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovsd xmm0, QWORD PTR .liczba3[rip]
  vmovsd QWORD PTR [rsp+6432], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6432]
  vmovapd YMMWORD PTR [rsp+6472], ymm6
  vmovapd YMMWORD PTR [rsp+6440], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6472]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+6440]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovsd xmm0, QWORD PTR .liczba3[rip]
  vmovsd QWORD PTR [rsp+6528], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6528]
  vmovapd YMMWORD PTR [rsp+6568], ymm7
  vmovapd YMMWORD PTR [rsp+6536], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+6568]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+6536]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  vmovsd xmm0, QWORD PTR .liczba4[rip]
  vmovsd QWORD PTR [rsp+6608], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6608]
  vmovapd YMMWORD PTR [rsp-24], ymm0
  vmovsd xmm0, QWORD PTR .liczba5[rip]
  vmovsd QWORD PTR [rsp+6616], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6616]
  vmovapd YMMWORD PTR [rsp-56], ymm0
  vmovsd xmm0, QWORD PTR .liczba6[rip]
  vmovsd QWORD PTR [rsp+6624], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6624]
  vmovapd YMMWORD PTR [rsp-88], ymm0
  vmovsd xmm0, QWORD PTR .liczba7[rip]
  vmovsd QWORD PTR [rsp+6632], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6632]
  vmovapd YMMWORD PTR [rsp-120], ymm0
  movabs rax, -9218868437227405313
  mov QWORD PTR [rsp+384], rax
  lea rax, [rsp+384]
  vmovsd xmm0, QWORD PTR [rax]
  vmovsd QWORD PTR [rsp+6640], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6640]
  vmovapd YMMWORD PTR [rsp+6696], ymm0
  vmovsd xmm0, QWORD PTR .liczba8[rip]
  vmovsd QWORD PTR [rsp+6648], xmm0
  vbroadcastsd ymm0, QWORD PTR [rsp+6648]
  vmovapd YMMWORD PTR [rsp+6664], ymm0
  mov QWORD PTR [rsp+6752], 0
  jmp .L28
.L103:
  mov QWORD PTR [rsp+6744], 0
  jmp .L29                                  ; Ta część się liczy
.L78:
  vmovapd ymm1, YMMWORD PTR [rsp+136]
  vmovapd YMMWORD PTR [rsp+2664], ymm1
  vmovapd ymm2, YMMWORD PTR [rsp-24]
  vmovapd YMMWORD PTR [rsp+2632], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+2664]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+2632]
  vmovapd ymm8, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+104]
  vmovapd YMMWORD PTR [rsp+2728], ymm1
  vmovapd ymm3, YMMWORD PTR [rsp-56]
  vmovapd YMMWORD PTR [rsp+2696], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+2728]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+2696]
  vmovapd ymm9, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+72]
  vmovapd YMMWORD PTR [rsp+2792], ymm6
  vmovapd ymm4, YMMWORD PTR [rsp-88]
  vmovapd YMMWORD PTR [rsp+2760], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+2792]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+2760]
  vmovapd ymm10, ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+40]
  vmovapd YMMWORD PTR [rsp+2856], ymm7
  vmovapd ymm5, YMMWORD PTR [rsp-120]
  vmovapd YMMWORD PTR [rsp+2824], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+2856]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+2824]
  vmovapd ymm11, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+8]
  vmovapd YMMWORD PTR [rsp+2920], ymm1
  vmovapd YMMWORD PTR [rsp+2888], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+2920]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+2888]
  vmovapd ymm12, ymm0
  vmovapd ymm6, ymm13
  vmovapd YMMWORD PTR [rsp+2984], ymm6
  vmovapd YMMWORD PTR [rsp+2952], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+2984]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+2952]
  vmovapd ymm13, ymm0
  vmovapd ymm7, ymm14
  vmovapd YMMWORD PTR [rsp+3048], ymm7
  vmovapd YMMWORD PTR [rsp+3016], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+3048]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3016]
  vmovapd ymm14, ymm0
  vmovapd ymm1, ymm15
  vmovapd YMMWORD PTR [rsp+3112], ymm1
  vmovapd YMMWORD PTR [rsp+3080], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+3112]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+3080]
  vmovapd ymm15, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+3176], ymm6
  vmovapd YMMWORD PTR [rsp+3144], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+3176]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3144]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+3240], ymm7
  vmovapd YMMWORD PTR [rsp+3208], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+3240]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+3208]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+3304], ymm1
  vmovapd YMMWORD PTR [rsp+3272], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+3304]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3272]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+3368], ymm6
  vmovapd YMMWORD PTR [rsp+3336], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+3368]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+3336]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  vmovapd YMMWORD PTR [rsp+3432], ymm8
  vmovapd YMMWORD PTR [rsp+3400], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+3432]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+3400]
  vmovapd ymm8, ymm0
  vmovapd YMMWORD PTR [rsp+3496], ymm9
  vmovapd YMMWORD PTR [rsp+3464], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+3496]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3464]
  vmovapd ymm9, ymm0
  vmovapd YMMWORD PTR [rsp+3560], ymm10
  vmovapd YMMWORD PTR [rsp+3528], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+3560]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+3528]
  vmovapd ymm10, ymm0
  vmovapd YMMWORD PTR [rsp+3624], ymm11
  vmovapd YMMWORD PTR [rsp+3592], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+3624]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3592]
  vmovapd ymm11, ymm0
  vmovapd YMMWORD PTR [rsp+3688], ymm12
  vmovapd YMMWORD PTR [rsp+3656], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+3688]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+3656]
  vmovapd ymm12, ymm0
  vmovapd YMMWORD PTR [rsp+3752], ymm13
  vmovapd YMMWORD PTR [rsp+3720], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+3752]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3720]
  vmovapd ymm13, ymm0
  vmovapd YMMWORD PTR [rsp+3816], ymm14
  vmovapd YMMWORD PTR [rsp+3784], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+3816]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+3784]
  vmovapd ymm14, ymm0
  vmovapd YMMWORD PTR [rsp+3880], ymm15
  vmovapd YMMWORD PTR [rsp+3848], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+3880]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3848]
  vmovapd ymm15, ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+3944], ymm7
  vmovapd YMMWORD PTR [rsp+3912], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+3944]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+3912]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+4008], ymm1
  vmovapd YMMWORD PTR [rsp+3976], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+4008]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+3976]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+4072], ymm6
  vmovapd YMMWORD PTR [rsp+4040], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+4072]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+4040]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+4136], ymm7
  vmovapd YMMWORD PTR [rsp+4104], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+4136]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4104]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  vmovapd YMMWORD PTR [rsp+4200], ymm8
  vmovapd YMMWORD PTR [rsp+4168], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+4200]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4168]
  vmovapd ymm8, ymm0
  vmovapd YMMWORD PTR [rsp+4264], ymm9
  vmovapd YMMWORD PTR [rsp+4232], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+4264]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+4232]
  vmovapd ymm9, ymm0
  vmovapd YMMWORD PTR [rsp+4328], ymm10
  vmovapd YMMWORD PTR [rsp+4296], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+4328]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4296]
  vmovapd ymm10, ymm0
  vmovapd YMMWORD PTR [rsp+4392], ymm11
  vmovapd YMMWORD PTR [rsp+4360], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+4392]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+4360]
  vmovapd ymm11, ymm0
  vmovapd YMMWORD PTR [rsp+4456], ymm12
  vmovapd YMMWORD PTR [rsp+4424], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+4456]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4424]
  vmovapd ymm12, ymm0
  vmovapd YMMWORD PTR [rsp+4520], ymm13
  vmovapd YMMWORD PTR [rsp+4488], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+4520]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+4488]
  vmovapd ymm13, ymm0
  vmovapd YMMWORD PTR [rsp+4584], ymm14
  vmovapd YMMWORD PTR [rsp+4552], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+4584]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4552]
  vmovapd ymm14, ymm0
  vmovapd YMMWORD PTR [rsp+4648], ymm15
  vmovapd YMMWORD PTR [rsp+4616], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+4648]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+4616]
  vmovapd ymm15, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+4712], ymm1
  vmovapd YMMWORD PTR [rsp+4680], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+4712]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4680]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+4776], ymm6
  vmovapd YMMWORD PTR [rsp+4744], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+4776]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+4744]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+4840], ymm7
  vmovapd YMMWORD PTR [rsp+4808], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+4840]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+4808]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+4904], ymm1
  vmovapd YMMWORD PTR [rsp+4872], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+4904]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+4872]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  vmovapd YMMWORD PTR [rsp+4968], ymm8
  vmovapd YMMWORD PTR [rsp+4936], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+4968]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+4936]
  vmovapd YMMWORD PTR [rsp+136], ymm0
  vmovapd YMMWORD PTR [rsp+5032], ymm9
  vmovapd YMMWORD PTR [rsp+5000], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+5032]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5000]
  vmovapd YMMWORD PTR [rsp+104], ymm0
  vmovapd YMMWORD PTR [rsp+5096], ymm10
  vmovapd YMMWORD PTR [rsp+5064], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+5096]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+5064]
  vmovapd YMMWORD PTR [rsp+72], ymm0
  vmovapd YMMWORD PTR [rsp+5160], ymm11
  vmovapd YMMWORD PTR [rsp+5128], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+5160]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5128]
  vmovapd YMMWORD PTR [rsp+40], ymm0
  vmovapd YMMWORD PTR [rsp+5224], ymm12
  vmovapd YMMWORD PTR [rsp+5192], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+5224]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+5192]
  vmovapd YMMWORD PTR [rsp+8], ymm0
  vmovapd YMMWORD PTR [rsp+5288], ymm13
  vmovapd YMMWORD PTR [rsp+5256], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+5288]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5256]
  vmovapd ymm13, ymm0
  vmovapd YMMWORD PTR [rsp+5352], ymm14
  vmovapd YMMWORD PTR [rsp+5320], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+5352]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+5320]
  vmovapd ymm14, ymm0
  vmovapd YMMWORD PTR [rsp+5416], ymm15
  vmovapd YMMWORD PTR [rsp+5384], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+5416]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5384]
  vmovapd ymm15, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+5480], ymm6
  vmovapd YMMWORD PTR [rsp+5448], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+5480]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+5448]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+5544], ymm7
  vmovapd YMMWORD PTR [rsp+5512], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+5544]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5512]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+5608], ymm1
  vmovapd YMMWORD PTR [rsp+5576], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+5608]
  vsubpd ymm0, ymm0, YMMWORD PTR [rsp+5576]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+5672], ymm6
  vmovapd YMMWORD PTR [rsp+5640], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+5672]
  vmulpd ymm0, ymm0, YMMWORD PTR [rsp+5640]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  add QWORD PTR [rsp+6744], 1
.L29:
  cmp QWORD PTR [rsp+6744], 999
  jbe .L78
  vmovapd ymm7, YMMWORD PTR [rsp+136]
  vmovapd YMMWORD PTR [rsp+1128], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1096], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1128]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1096]
  vmovapd ymm2, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+104]
  vmovapd YMMWORD PTR [rsp+1192], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1160], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1192]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1160]
  vmovapd ymm3, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+72]
  vmovapd YMMWORD PTR [rsp+1256], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1224], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1256]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1224]
  vmovapd ymm4, ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+40]
  vmovapd YMMWORD PTR [rsp+1320], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1288], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1320]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1288]
  vmovapd ymm5, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+8]
  vmovapd YMMWORD PTR [rsp+1384], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1352], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1384]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1352]
  vmovapd ymm8, ymm0
  vmovapd ymm6, ymm13
  vmovapd YMMWORD PTR [rsp+1448], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1416], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1448]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1416]
  vmovapd ymm9, ymm0
  vmovapd ymm7, ymm14
  vmovapd YMMWORD PTR [rsp+1512], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1480], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1512]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1480]
  vmovapd ymm10, ymm0
  vmovapd ymm1, ymm15
  vmovapd YMMWORD PTR [rsp+1576], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1544], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1576]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1544]
  vmovapd ymm11, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+1640], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1608], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1640]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1608]
  vmovapd ymm12, ymm0
  vmovapd ymm7, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+1704], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1672], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1704]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1672]
  vmovapd ymm7, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+1768], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1736], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1768]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1736]
  vmovapd ymm1, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+1832], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+6696]
  vmovapd YMMWORD PTR [rsp+1800], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1832]
  vandpd ymm0, ymm0, YMMWORD PTR [rsp+1800]
  vmovapd ymm6, ymm0
  vmovapd YMMWORD PTR [rsp+1896], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+1864], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1896]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+1864]
  vmovapd YMMWORD PTR [rsp+136], ymm0
  vmovapd YMMWORD PTR [rsp+1960], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+1928], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+1960]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+1928]
  vmovapd YMMWORD PTR [rsp+104], ymm0
  vmovapd YMMWORD PTR [rsp+2024], ymm4
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+1992], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2024]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+1992]
  vmovapd YMMWORD PTR [rsp+72], ymm0
  vmovapd YMMWORD PTR [rsp+2088], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2056], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2088]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2056]
  vmovapd YMMWORD PTR [rsp+40], ymm0
  vmovapd YMMWORD PTR [rsp+2152], ymm8
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2120], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2152]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2120]
  vmovapd YMMWORD PTR [rsp+8], ymm0
  vmovapd YMMWORD PTR [rsp+2216], ymm9
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2184], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2216]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2184]
  vmovapd ymm13, ymm0
  vmovapd YMMWORD PTR [rsp+2280], ymm10
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2248], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2280]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2248]
  vmovapd ymm14, ymm0
  vmovapd YMMWORD PTR [rsp+2344], ymm11
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2312], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2344]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2312]
  vmovapd ymm15, ymm0
  vmovapd YMMWORD PTR [rsp+2408], ymm12
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2376], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2408]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2376]
  vmovapd YMMWORD PTR [rsp+264], ymm0
  vmovapd YMMWORD PTR [rsp+2472], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2440], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2472]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2440]
  vmovapd YMMWORD PTR [rsp+232], ymm0
  vmovapd YMMWORD PTR [rsp+2536], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2504], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2536]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2504]
  vmovapd YMMWORD PTR [rsp+200], ymm0
  vmovapd YMMWORD PTR [rsp+2600], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+6664]
  vmovapd YMMWORD PTR [rsp+2568], ymm0
  vmovapd ymm0, YMMWORD PTR [rsp+2600]
  vorpd ymm0, ymm0, YMMWORD PTR [rsp+2568]
  vmovapd YMMWORD PTR [rsp+168], ymm0
  add QWORD PTR [rsp+6752], 1
.L28:
  mov rax, QWORD PTR [rsp+6752]
  cmp rax, QWORD PTR [rsp+304]
  jb .L103
  vmovapd ymm7, YMMWORD PTR [rsp+136]
  vmovapd YMMWORD PTR [rsp+424], ymm7
  vmovapd ymm1, YMMWORD PTR [rsp+104]
  vmovapd YMMWORD PTR [rsp+392], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+424]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+392]
  vmovapd ymm2, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+72]
  vmovapd YMMWORD PTR [rsp+488], ymm6
  vmovapd ymm7, YMMWORD PTR [rsp+40]
  vmovapd YMMWORD PTR [rsp+456], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+488]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+456]
  vmovapd ymm3, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+8]
  vmovapd YMMWORD PTR [rsp+552], ymm1
  vmovapd ymm6, ymm13
  vmovapd YMMWORD PTR [rsp+520], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+552]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+520]
  vmovapd ymm4, ymm0
  vmovapd ymm7, ymm14
  vmovapd YMMWORD PTR [rsp+616], ymm7
  vmovapd ymm1, ymm15
  vmovapd YMMWORD PTR [rsp+584], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+616]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+584]
  vmovapd ymm5, ymm0
  vmovapd ymm6, YMMWORD PTR [rsp+264]
  vmovapd YMMWORD PTR [rsp+680], ymm6
  vmovapd ymm7, YMMWORD PTR [rsp+232]
  vmovapd YMMWORD PTR [rsp+648], ymm7
  vmovapd ymm0, YMMWORD PTR [rsp+680]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+648]
  vmovapd ymm7, ymm0
  vmovapd ymm1, YMMWORD PTR [rsp+200]
  vmovapd YMMWORD PTR [rsp+744], ymm1
  vmovapd ymm6, YMMWORD PTR [rsp+168]
  vmovapd YMMWORD PTR [rsp+712], ymm6
  vmovapd ymm0, YMMWORD PTR [rsp+744]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+712]
  vmovapd ymm1, ymm0
  vmovapd YMMWORD PTR [rsp+808], ymm2
  vmovapd YMMWORD PTR [rsp+776], ymm3
  vmovapd ymm0, YMMWORD PTR [rsp+808]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+776]
  vmovapd ymm6, ymm0
  vmovapd YMMWORD PTR [rsp+872], ymm4
  vmovapd YMMWORD PTR [rsp+840], ymm5
  vmovapd ymm0, YMMWORD PTR [rsp+872]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+840]
  vmovapd ymm2, ymm0
  vmovapd YMMWORD PTR [rsp+936], ymm7
  vmovapd YMMWORD PTR [rsp+904], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+936]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+904]
  vmovapd ymm1, ymm0
  vmovapd YMMWORD PTR [rsp+1000], ymm6
  vmovapd YMMWORD PTR [rsp+968], ymm2
  vmovapd ymm0, YMMWORD PTR [rsp+1000]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+968]
  vmovapd ymm7, ymm0
  vmovapd YMMWORD PTR [rsp+1064], ymm7
  vmovapd YMMWORD PTR [rsp+1032], ymm1
  vmovapd ymm0, YMMWORD PTR [rsp+1064]
  vaddpd ymm0, ymm0, YMMWORD PTR [rsp+1032]
  vmovapd ymm3, ymm0
  vxorpd xmm0, xmm0, xmm0
  vmovsd QWORD PTR [rsp+6656], xmm0
  vmovapd YMMWORD PTR [rsp+328], ymm3
  vmovsd xmm0, QWORD PTR [rsp+328]
  vmovsd xmm1, QWORD PTR [rsp+6656]
  vaddsd xmm0, xmm1, xmm0
  vmovsd QWORD PTR [rsp+6656], xmm0
  vmovsd xmm0, QWORD PTR [rsp+336]
  vmovsd xmm1, QWORD PTR [rsp+6656]
  vaddsd xmm0, xmm1, xmm0
  vmovsd QWORD PTR [rsp+6656], xmm0
  vmovsd xmm0, QWORD PTR [rsp+344]
  vmovsd xmm1, QWORD PTR [rsp+6656]
  vaddsd xmm0, xmm1, xmm0
  vmovsd QWORD PTR [rsp+6656], xmm0
  vmovsd xmm0, QWORD PTR [rsp+352]
  vmovsd xmm1, QWORD PTR [rsp+6656]
  vaddsd xmm0, xmm1, xmm0
  vmovsd QWORD PTR [rsp+6656], xmm0
  vmovsd xmm0, QWORD PTR [rsp+6656]
  leave
  ret
.czasf:
  .string "Time = %f\n"
.flopf:
  .string "FP Ops = %f\n"
.flopsf:
  .string "FLOPs = %f\n"
.sumaf:
  .string "sum = %f\n"
test_dp_mac_AVX:
  push rbp
  mov rbp, rsp
  sub rsp, 64
  mov QWORD PTR [rbp-56], rdi
  mov edi, 8
  call malloc
  mov QWORD PTR [rbp-8], rax
  call clock
  mov DWORD PTR [rbp-12], eax
  mov rax, QWORD PTR [rbp-56]
  vmovsd xmm1, QWORD PTR .liczba10[rip]
  vmovsd xmm0, QWORD PTR .liczba11[rip]
  mov rdi, rax
  call test
  vmovq rax, xmm0
  mov QWORD PTR [rbp-24], rax
  call clock
  mov DWORD PTR [rbp-28], eax
  mov rax, QWORD PTR [rbp-8]
  vmovsd xmm0, QWORD PTR [rbp-24]
  vmovsd QWORD PTR [rax], xmm0
  mov eax, DWORD PTR [rbp-28]
  sub eax, DWORD PTR [rbp-12]
  mov ecx, eax
  mov edx, 274877907
  mov eax, ecx
  imul edx
  sar edx, 6
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  vcvtsi2sd xmm0, xmm0, eax
  vmovsd QWORD PTR [rbp-40], xmm0
  mov rax, QWORD PTR [rbp-56]
  imul rax, rax, 192000
  mov QWORD PTR [rbp-48], rax
  vmovsd xmm0, QWORD PTR [rbp-40]
  mov edi, OFFSET FLAT:.czasf
  mov eax, 1
  call printf
  mov rax, QWORD PTR [rbp-48]
  mov rsi, rax
  mov edi, OFFSET FLAT:.flopf
  mov eax, 0
  call printf
  mov rax, QWORD PTR [rbp-48]
  test rax, rax
  js .L117
  vcvtsi2sd xmm0, xmm0, rax
  jmp .L118
.L117:
  mov rdx, rax
  shr rdx
  and eax, 1
  or rdx, rax
  vcvtsi2sd xmm0, xmm0, rdx
  vaddsd xmm0, xmm0, xmm0
.L118:
  vdivsd xmm0, xmm0, QWORD PTR [rbp-40]
  mov edi, OFFSET FLAT:.flopsf
  mov eax, 1
  call printf
  mov rax, QWORD PTR [rbp-8]
  vmovsd xmm0, QWORD PTR [rax]
  mov edi, OFFSET FLAT:.sumaf
  mov eax, 1
  call printf
  mov rax, QWORD PTR [rbp-8]
  mov rdi, rax
  call free
  nop
  leave
  ret
main:
  push rbp
  mov rbp, rsp
  mov edi, 10000000         ; Liczba iteracji
  call test_dp_mac_AVX
  mov eax, 0
  pop rbp
  ret
.liczba0:
  .long 0
  .long -2147483648
.liczba1:
  .long 3869767655
  .long 1071132817
.liczba2:
  .long 1221766940
  .long 1070533480
.liczba3:
  .long 1722805511
  .long 1074822671
.liczba4:
  .long 1719614413
  .long 1073127582
.liczba5:
  .long 3898100906
  .long 1073460858
.liczba6:
  .long 1167078172
  .long 1071806887
.liczba7:
  .long 1719614413
  .long 1072079006
.liczba8:
  .long 0
  .long 1072693248
.liczba10:
  .long 3435973837
  .long 1073794252
.liczba11:
  .long 2576980378
  .long 1072798105

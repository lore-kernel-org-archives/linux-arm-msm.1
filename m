Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792732124;
	b=HzDL9yZW2G16dLPwHikRBsbNsALoNiQT+bTEtbXnXv9hmv0MYLjXXaehDHQ4vnz3+xxA
	 zKHN4Kp51EABb/1mhiOkCjmb17xsy4IPmPqBWYGNGf2o32zQaZXKzkWowM03LgIHDLDMi
	 Nkjg1vOaICbVBdMOf91adHYD4fKTx/e3zahvwdNlimUE8Mhi3ZKVm0PNELDOUl1WvfCUe
	 R1KMFW3LP2a8MGfu+mahBulVa77YoAbZ9DwUnFP72a7tRLWpPqr3dqyEOWBqhxymnYbNV
	 LRk07Dy710oRxLxGGkZQfq7u+2jcP5LgJWx+Aw4d3OM8/f8k5tGbRRS5tgJZRqn/n9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792732124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To;
	bh=Q+v+zFfAqi4S5SXTBEngDuGmKawx+q7vf5Ba/6LgJhs=;
	b=XZo6wBK9FT3buEx1NbLfUBra3mY2DaJLYHV2lJKxFMURlI00KI9QuguwIS3DN1fpDY9u
	 J4UCPkzRYy8cYUFxmGDWoFNQdfmUg22NFDemRwH5gzZ7aqWwbNLmAKm8+O3TF4QvFVQti
	 ajy22g6XTvKuthFb1TRj7ivTwV2IT4R1mobmiJLMkmPNnmGeQeL35A94JYrWEDYIMt60R
	 /f/xPwPux/INyBLi2BSRF00cd8M7hifZ2r9QtBeB4PrVrUlBTPO2u+VY1D1nDmV6mUSER
	 FhtwAqJZXWmswWihRQvLqa8hx0O3DXcn5tjkF6lYtirpvpHpLPShKWx22I6CTAGv1Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=iLOgdk+y;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5C606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D5C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=iLOgdk+y
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B6539240101
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1792732116;
	bh=Q+v+zFfAqi4S5SXTBEngDuGmKawx+q7vf5Ba/6LgJhs=;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:From;
	b=iLOgdk+yjUiQ265aA9Fffh9J9x8KFSywWGTuVwQ7oLqS61WcUExdPFKM3IEKJmpvd
	 vtCuVrxbHw5rVO2Kn0VXYmJ/J7/RIoZ9ZOtsq7p6VPSpvwPTRibqUM0ZV4j3Kqu7PG
	 KpFICuy8/GiDiI37RNSU62mUTG6qgvVoDLmmb+MNWVLzk6q12ZEUW1cRUvOnLZDIJU
	 SqSFNG8qf65M+xFU6o4hyS31J66dV0t6LiI8ORa6S9tRRfpeApb56WNXhS3IeXAQoI
	 G4r02Z+7nCriT0B7i4wkTV61lzh9cuxl7PfLPK28EeUqMvi8FgSrSqwaZwEK7DlFra
	 3C81oO69puxww==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j9rdS5Svfz9rxB;
	Fri, 23 Oct 2026 07:08:28 +0200 (CEST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 05:08:31 +0000
Message-Id: <DMBYHSAP8KY7.K9L1DON3KDR4@posteo.net>
Cc: "akhilpo@oss.qualcomm.com" <akhilpo@oss.qualcomm.com>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Dmitry Baryshkov" <lumag@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "Sumit Garg" <sumit.garg@kernel.org>
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under
 Gunyah
From: "James Wilson" <james.wilson@posteo.net>
To: <rob.clark@oss.qualcomm.com>, "VENKAT YADLAPATI"
 <venkat.yadlapati@hotmail.com>
References: <TYCPR01MB11847FA80097F4B08C082DC859F9D2@TYCPR01MB11847.jpnprd01.prod.outlook.com> <CACSVV02xGrytmrUQmtskUu8-OXm4Cq-qbqYjkrxYOZLLsVb68A@mail.gmail.com>
In-Reply-To: <CACSVV02xGrytmrUQmtskUu8-OXm4Cq-qbqYjkrxYOZLLsVb68A@mail.gmail.com>

On Thu Oct 15, 2026 at 6:46 PM IST, Rob Clark wrote:
> + Sumit who would know more about the PAS stuff
>
> BR,
> -R
>
> On Wed, Oct 14, 2026 at 12:42=E2=80=AFPM VENKAT YADLAPATI
> <venkat.yadlapati@hotmail.com> wrote:
>>
>> Hi,
>>
>> I am bringing up mainline on a Motorola Signature (SM8845 "alor", a
>> Kaanapali derivative with an Adreno 829 / gen8_9_0, chip id 0x44030a00).
>> It is a retail, secure-boot phone running Gunyah, with the shipped
>> firmware (A171WVH.21-16-16). Display, UFS, USB and the ADSP work.
>>
>> For the GPU I added a gen8_9_0 entry modelled on the A840 one (2 slices,
>> 2432 KiB GMEM, gen80900 firmware). The SQE/GMU/AQE firmware loads and th=
e
>> GMU boots (v5.3.25), but loading the zap shader fails: the PAS init call
>> for PAS id 13 (0x42000201) returns a0 =3D 0xffcfffbb, i.e. -EINVAL. The =
zap
>> is the one shipped in the same vendor image (gen80900_zap.mbn).
>>
>> What I checked so far:
>>
>> - qcom_scm_pas_supported(13) returns true, and other PAS images load
>>   fine through the same path: the ADSP (PAS 36 + 1) boots.
>> - Moving the metadata buffer above 4 GiB, loading the zap after the ADSP=
,
>>   and skipping the CP SMMU aperture call change nothing. Passing an SHM
>>   bridge (tzmem) buffer gives a different error (0xffcffff6), so I assum=
e
>>   the hypervisor bridges the plain buffer itself and 0x...bb comes from =
TZ.
>> - On the same device, the Android 6.18 GKI kernel with KGSL loads the
>>   zap with the identical sequence: PAS init(13) -> mem_setup(13,
>>   0x9959a000) -> auth_and_reset(13). The only GPU related secure calls
>>   before it are qcom_scm_gpu_init_regs (mask 0xb) and a series of
>>   MP_ASSIGN calls handing KGSL's secure buffers and secure page tables t=
o
>>   VMID_CP_PIXEL. Assigning a page to CP_PIXEL before the zap load on
>>   mainline does not help.
>>
>> Is there a precondition in TZ for the GPU PAS on Gunyah based production
>> devices (for example a secure context bank on the GPU SMMU, or something
>> KGSL does at probe), or is the zap expected to work the same way as on
>> the Kaanapali QRD? Any hint on what 0xffcfffbb means would help too.
>>
>> A second, unrelated question about naming before I post the SoC patches:
>> SM8845 differs from SM8850 enough to need its own TLMM driver (205 GPIOs=
,
>> different pin functions and GPIO->PDC wakeup map), an extra PDC range, a
>> gpucc variant and its own GPU, so I describe it as a separate SoC on top
>> of kaanapali.dtsi (like purwa on hamoa). For now I used the downstream
>> codename "alor" (pinctrl-alor.c, qcom,alor-tlmm, qcom,alor-pdc,
>> qcom,alor-gpucc, alor.dtsi). Since kaanapali itself is not the
>> downstream name of SM8850, is there an upstream codename planned for
>> SM8845, or should I use "alor" (or plain sm8845)?
>>
>> I plan to post that series soon (TLMM driver and binding, PDC, gpucc
>> variant, SoC dtsi, and the A829 support once the zap issue is sorted
>> out), followed by the Motorola Signature board. If Qualcomm already has
>> SM8845 patches in the queue, please let me know so I don't duplicate the
>> work.

Hello Venkat,

I wanted to let you know, that I'm also working on SM8845 SoC bring up.
I have the SM8845 specific clock, pinctrl, interconnect drivers and much
of the dtsi ready.

No MDSS/DPU or GPU yet though, which you seem to have working.

Best,
James

>>
>> Thanks,
>> Venkat Yadlapati



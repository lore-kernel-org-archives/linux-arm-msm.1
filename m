Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847002;
	b=DS8H9qL8dt8+HBBZq0B46xdPtGpYUp6AJGAOfabRJzXpc/vAIYTPPRW47g2gOtqoxpIZ
	 /pVhEkpn2fuuaAy1x0VivO1voACXQ83odzsD3pgdesbPVDXsX4v9iEXfaGG1bF45kPf5I
	 KuVRNM9/iyvPGrqPWO7e5y27lc+UiOXBdoEkk8EFxSumUxAux31mdciKGu1VlVT6dBZaw
	 crrZYX6gen/d3PfjDFEmSoMDJQs7YfFmb/DFxvi1yETEKnc7chtxJzjBmBAYD/w4KK+Qr
	 vrZXoY7HeWnAH0x5gRXEHUXujCqrc1/8m7lLeCgH9SUQfp3QtqEZsyUPAY8aazGpHeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
	b=lR9zp5xOgtJ5wwshYvldh1bCw4CFL3gSkmSWrTEWK7m4OwKJfcgZmYo+y4c/TCUTDrLU
	 cLsEHhQ6dj0tP9SnXs4udxZqj/jJOR7EpZ+Nxzu5kJV0+AZz7fCS5mN5axO9l/tj2gXQ2
	 H1QIUdaOWPaIpopMFFdNVLWKFF7Ic0Pd0ezYwJV9DLReI0a67v5XzDYYojBoqPevPjPZM
	 +BTZYtniwBfbKq8KYUz5AaDeJO4Lxqbj/Ly/ffDthBMD6DGHWJVmqqDojYgnl26eX38Fo
	 5yrJhATroU/znGRGn7DTikUuIa/OysQxtBUNB6WZqtgH4RMgWEF+neS6XQK/I+xCmkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn8ar1Yi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE112606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE112606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn8ar1Yi
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so613196366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847000; cv=none;
        d=google.com; s=arc-20260327;
        b=kJV2YsFCLHxgUDo7ItLmwyGW31WTHbhsO1xHQolhaIDUaY2fu7jUU9T83iy4+Va63c
         TwIZtD9p6ZH9UqdWAn/gtWsBUQjaliY+W6Wmk+cBYuCJXCuQaHMhlMeI3x4lEmmOvvDf
         7p9URX4MOVa88cnKY57bYHLBNltEZd4Fr1+YKLXdoXr43L8slAXg/Uez7nlog7fo/Q4Y
         WEdyKa1imcXLyD/iNOSVW+pJ4uLVCLUD5Qcj7l3K2OvIZ2kBjL3VmekoPqzyvj2aPLji
         BKeyIjdyJZ0HWbGi+0noT5qAp35LdLCkiClss/by1hhNwAc7++iqyOXNPqijbqjzOo4m
         kVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        fh=kgA1RpL+29r4StKpzOvZC+KUViQDAc5SWtqi5+2pIbo=;
        b=NMaBsI23szkATZ306EMgx2fDDX74LP+rZ26Od/artShHIvuST3I3T+1gf5pb3HHhaC
         4sjoy2QwIjP66ZRzXNlmh5+e/N1YFgQ4uBGCObzQZ5robFz6ItJ+0zwt7o4o5Mgw+bVB
         jM0OGPZMx/JIROJLq6hTd81oXGoqh0w0ixGqh+eq3rrNDEN2oXbHICuqkey7xEf2XNOW
         qnGldK+dd/FwuAFplsIi1xD9SmghqqgDW7MaaTyU/GCkgIywspBhh9NfRe0BpwpHDOc9
         toTehDpo6v27Cpm/C2oNM2LbIFj24Cnnb7Jx6X08cl+s3Jw9lxH7jaD/TaqgMAR3saeI
         SRKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847000; x=1795451800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        b=Jn8ar1YivSQcH87J+OnEM75qtqq0sLVQnwHekt3WVBx/jd1dPNAPe/LHK0kwmmrF4x
         DPiB/59oC7Ew4qxMdr9hYYh+6NpwThWWc8VjMnG4WCTaWKcDd8DdUryIy3Qv+/OjsvFd
         eAhqm+hMkrnenGI3mbucI/i5AVVPeMYxhp/vSvoZJFAIIlsju80tzzwMpxo2rx8dTC7t
         S7nYU+ZqAgL9cjqI42QrRjZbE14UOEv86XTDWLKXbpUJEcpPMV1AYnm+boLpkZebpCmh
         uCoHXfU5pMPu3RCkVaLFIrzM2lohPTf27w1n2sPofvTx7VZ23HRMD/SFy9rPniHTctxJ
         QKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847000; x=1795451800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        b=g/poVHRg1C/Zxttf4O9UzWGA/t6b6y71/IUn4oD8LG5wbW+UYGNUh7ZW+AK0juM0VH
         ycp7z63iLmnwxWVkrcU4EBma+sELRQScH7j0j85nbCXzuw9GoC2VnZruRFh9qUr+kOuu
         TA9EqaL8w+MktvLEd6n28AHxDNZlMiePdb7mU+9LFvywKurwp+NEjg2KEDLbl5MU/yb9
         wRh0+dnCDA/cACjpHUufFgiYqVGQol/Mz7peCmLwHhlkrD+4nHp5gHLQwsI/5PAIertj
         5GMRsbnV6OKdDo10aTYE9MUiDnynxIsIUgtsuILZwlXQGObK7e1qfynJN4H7O3xPQd4x
         fPRw==
X-Forwarded-Encrypted: i=1; AL+hErE7ZklHiOIBk69IxexK0E1tozU1sJQQcWsyMvpHbp8lbb8poJEK6NrScjqKZVNRX5COPykLpf98IQiyqEr3@vger.kernel.org
X-Gm-Message-State: APuU4Z/dqfVhLOHfq8GtCq9IgJ8OFI5JSRV30DVEQ2b2Fldx8lT+iB6Y
	pmF71o0/Czm6Gw2FXjZAi8acZkBDPfoR7FCdZKwuOIpJ9ALvz4aSSR13CY6RjB5E44mNmNK3u13
	SOzrAwLJ8Z+Z93U4QK0XduvZy1BPtvpE=
X-Gm-Gg: AYBFou2rVwuMeIKje6p9nMBz2yFcGfYqPZPl5QNJvILAo4TsR2vAUHbTJrDqM7Ajz8e
	FnWFEGxkdE4W1jnPZkyQS3WdaVmj3tc9IGV4OBF4x69tf7yikK2HG5nctGmHBQRqdQcDoGQzDit
	dQYKUspZrBhddrlzJuO96t/ZI5TPIUezrpRg5JofaVniYppq2Kf8NNkSbAqeqDq4yJhUTuTqMiE
	FF/ZJY1C4tt6Rh2m71AsVHvZDX70dT07JREyMrCtLTWvShAesyG3HjVLPzOUlGIMnmT4YQ0dcCR
	7S3a8TAM98AV0TcRw3W58TEQ/sY+R+FbydCzft62d8NiCtX9ScnGVvTycB9v/gQ97wNxhvY0w6g
	c9A7RzngUdI/k2q4UzrNd26inZEHiPBBrwe9+0Q==
X-Received: by 2002:a17:907:8e08:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c50961104demr817704066b.7.1794846999932; Mon, 16 Nov 2026
 08:36:39 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>
 <DMTYT7CTC6JP.2UXJ6MWGKPX49@fairphone.com> <CAB63uaF3kB5AAW_FNXu93pyF4YS4XP3zzLtLt12r=XMK8E5kDA@mail.gmail.com>
In-Reply-To: <CAB63uaF3kB5AAW_FNXu93pyF4YS4XP3zzLtLt12r=XMK8E5kDA@mail.gmail.com>
From: yzddMr6 <yzddmr6@gmail.com>
Date: Tue, 17 Nov 2026 00:36:28 +0800
X-Gm-Features: AclHuK8R7d_cGEXXPrjH8PM8Odn5LsGhXmg_ElS1vdImCrIJeC5fTDG7nWnQUn8
Message-ID: <CAB63uaEVR494r2vj54vpvV379U6nHTxEM49xhu_uEygU4g0_1Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom Fix SM8750 settings
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Melody Olvera <melody.olvera@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending as plain text; the lists rejected the first copy as HTML.)

On Fri, Nov 13, 2026 at 10:01:27AM +0100, Konrad Dybcio wrote:
> Bring the settings in line with the with the recommendations (and also
> with the downstream kernel).

Thanks for doing this. With it applied, sm8750_data matches sun_data
in the downstream kernel [1] in every field of the upstream struct, for
all 32 slices; before, 8 of them differed.

Of these changes, only the ISLAND1 one has a known symptom, the reset
in system suspend described in my patch [2], which is why that one has
Cc: stable. Would you consider taking it as a separate patch, such as
mine, with this one on top? Then the fix can go to stable without the
changes to the camera, video decoder and CVP slices. If you prefer a
single patch, could you mention the reset in the commit message and
add Cc: stable@vger.kernel.org?

Nit: "with the" is doubled in the first line.

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm8750/blob/6028f4=
7faddaa27700f8dd3a1d83906ea8f27170/drivers/soc/qcom/llcc-qcom.c#L479
[2] https://lore.kernel.org/r/20261111-sm8750-llcc-island1-v1-1-64055702ca3=
f@gmail.com

Thanks,
yzddMr6


6 Mr <yzddmr6@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=A5=E5=91=
=A8=E4=BA=8C 00:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 13, 2026 at 10:01:27AM +0100, Konrad Dybcio wrote:
> > Bring the settings in line with the with the recommendations (and also
> > with the downstream kernel).
>
> Thanks for doing this. With it applied, sm8750_data matches sun_data
> in the downstream kernel [1] in every field of the upstream struct, for
> all 32 slices; before, 8 of them differed.
>
> Of these changes, only the ISLAND1 one has a known symptom, the reset
> in system suspend described in my patch [2], which is why that one has
> Cc: stable. Would you consider taking it as a separate patch, such as
> mine, with this one on top? Then the fix can go to stable without the
> changes to the camera, video decoder and CVP slices. If you prefer a
> single patch, could you mention the reset in the commit message and
> add Cc: stable@vger.kernel.org?
>
> Nit: "with the" is doubled in the first line.
>
> [1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm8750/blob/6028=
f47faddaa27700f8dd3a1d83906ea8f27170/drivers/soc/qcom/llcc-qcom.c#L479
> [2] https://lore.kernel.org/r/20261111-sm8750-llcc-island1-v1-1-64055702c=
a3f@gmail.com
>
> Thanks,
> yzddMr6
>
> Luca Weiss <luca.weiss@fairphone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=94 17:11=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi Konrad,
>>
>> Missing ":" after llcc-qcom in the subject?
>>
>> Regards
>> Luca
>>
>> On Fri Nov 13, 2026 at 10:01 AM CET, Konrad Dybcio wrote:
>> > Bring the settings in line with the with the recommendations (and also
>> > with the downstream kernel).
>> >
>> > Reported-by: yzddMr6 <yzddmr6@gmail.com>
>> > Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-isl=
and1-v1-1-64055702ca3f@gmail.com/
>> > Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
>> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> > ---
>> >  drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
>> >  1 file changed, 10 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom=
.c
>> > index d7a42a8040a16388a79c24e4d1f1e88de9c87ec0..df213548637351fdaeeb81=
b860f0ee2631f2062a 100644
>> > --- a/drivers/soc/qcom/llcc-qcom.c
>> > +++ b/drivers/soc/qcom/llcc-qcom.c
>> > @@ -3869,7 +3869,8 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .priority =3D 5,
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> > -             .vict_prio =3D true,
>> > +             .ovcap_en =3D true,
>> > +             .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_MODPE,
>> >               .slice_id =3D 29,
>> > @@ -3923,7 +3924,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .max_cap =3D 7936,
>> >               .priority =3D 7,
>> >               .fixed_size =3D true,
>> > -             .bonus_ways =3D 0x7fffffff,
>> > +             .res_ways =3D 0x7fffffff,
>> >       }, {
>> >               .usecase_id =3D LLCC_DISP_WB,
>> >               .slice_id =3D 23,
>> > @@ -3946,7 +3947,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .cache_mode =3D 2,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMOFE,
>> > @@ -3956,7 +3957,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMRTIP,
>> > @@ -3966,7 +3967,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMSRTIP,
>> > @@ -3976,17 +3977,17 @@ static const struct llcc_slice_config sm8750_d=
ata[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMRTRF,
>> >               .slice_id =3D 7,
>> >               .max_cap =3D 3584,
>> > -             .priority =3D 1,
>> > +             .priority =3D 3,
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMSRTRF,
>> > @@ -3996,7 +3997,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CPUSSMPAM,
>> >
>> > ---
>> > base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
>> > change-id: 20261113-topic-8750_llcc-bd228d96b455
>> >
>> > Best regards,
>>
>>

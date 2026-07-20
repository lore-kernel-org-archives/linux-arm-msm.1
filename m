Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BC2ECE91
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784588614; cv=pass; b=c+Kfk0UwifynuG7qGx5R8SPkxzisheupZFlhgU3QZISjtdSsxbN0dHdHp94OFp9U0TP9Wd+VUrEAqZhV1lDYoUFmKNHH2IkaXFqF45F8B1i6RelENFnOrXXEQpiTykllwMsg/KjKOuh4JI24wW2chzgtbx8hK+Ycg3ONp/xmrKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784588614; c=relaxed/simple;
	bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BixHApf0OfVa1gWuohMlS64HEUnpJQW0V7dZZlnvfYgGBiHxS6Q/7W5pRF44Gx1PPdpfgHfY/oFsgl3YXGI9s31lqAsUs0vTgw+C9L/2zwxtNSvk/hitumv5dBtzGkLjS2Ic8TVs6UId5YTc0ndG6Dg5XxxASEhHlIeuVu/roR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsC3NyNA; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsC3NyNA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so9307331a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784588612; cv=none;
        d=google.com; s=arc-20260327;
        b=iOI9W0XlCyXFA585/9uDc02RbkLqQWUIeBbjhbpjd1ky2XwLdPtr+mIkzzSOtNNCDr
         nzkt4FaoQQvAdwMT+nHeDB1sO8lhOI5maGhM6Lb+I5FOED0HGlGqnWt4cAKqX0ga2G8R
         D3/Onooj5rbOfEoPV9u5zXG6Yrw7Ywzm4KKQrghM6oe/T//8HpqvTNa220RFC/xieC3Y
         /vC3qRFIS32macYu6aI2HEzmHI6gBj/yRMExAEFSc8AMxdgZWnZSa+4efzKxMZnXFlYB
         2KU3H0sQ+g+SoudYDUZvU0z6ApGPmEi9zB7Qk/hZy0ef3GK9ZvOERkNhHbnzfG2WFeAV
         +0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        fh=CZITZE5fcwklWluXcLdKwOHqsjxgYoxeKaVtX7NmUaw=;
        b=T7gjlS74gGRUwz4xPdZDUza+bmIrxu8NsKdRXxng5nmUhXUeVxpmc9EDiVEwZJnvPx
         Nl4ckgvmXvMA1D6EgGiVzBRK4ZTUo22iiv46RuKO82Bj9ypRQtXR1uw1DVrKBG4JzSgC
         LHvXo1CMbpIoU4rKz6pfnl5AL9QSCPk6wR3lCt4g1yRPaAvypm+Eou6VOI5cN0iV9KVd
         EmIDXBY3/6/MmJ2qUy5/Os7NKQMaw21tycedO50PGXE/hGTCJGJnBDbSdzWzRUNrB1l+
         ypNAmcmepyNiYvc++ZIHJMQefxVXzH1jwaT6B5lORebYC/TGrWdhUBRJzqWnjzp5K63r
         koaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784588612; x=1785193412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        b=RsC3NyNAHrkenrVe05H8Uu5vAYPn3T1PeWL0ZmAMTDUxUtwnvYHQwF3bm+Q7GyC2X9
         iuUCbyOdujLdIs3/sAv8MwtaEUbkCiysW0tD+0GfrX8C376Ln1Pbf/tRnRc80qvhDZhp
         3CN+LHIVPJuKQOKtSBMy8Eim/9K9zSu8r+QNVjCTHBp6rhkeGdwK72MvMnFdR1izf1zy
         PgVwGPLgc8H2XuXcsV9zCZ2NhQWdSfsj+CKPXeeVHOOcTS5QO4hYZLLm16cPFz3g/hL1
         w54Ew8w2uKZEMe0lmaywWr8wwNY9Sn/unLzQRPMUL+6cf3efXB30n+8ozg3kKsiVjYbr
         55/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784588612; x=1785193412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        b=rKQsC7gzKTt6kJ4V9DSiZnZkL11Tq5WUnGe0OeYUxdVGTJrVSPwYK1kbZ+vvlP1mpH
         pJJ0BxTzLoQ1L3DjM8OJIFJL6Gqm0LccsyWsBUWGf+wyo0W1c+7mtHU70IYn66rEcNo3
         dH6vLvre6vUbPBUndgiaxPVovCTGFiDQ0wsK2jN0MOVfgR/QR9qvhjvdkCFWQ9pYQ8qX
         /OBi+PkIWXp7Y+zFde1bbw6ZaF81GrqjPzhyt1w6s2GOF+6wSv4r1r/qy9XPqwXuNU5D
         Ez+FMirTlcxf2qXBHElTB+3m94G3Lw/YksjRtQsLRZ0SUhDiusfJCLHJvE6CFcKVnSBX
         TR5w==
X-Forwarded-Encrypted: i=1; AHgh+RpnPJsi+PEhAjNT1IUqKroZc8snZxg88c6LJ10iCjmHjaXGKqdOKWqa8jBGTwsiV5M4QgLPzeLH8eZHlCBC@vger.kernel.org
X-Gm-Message-State: AOJu0YyKn89h5rjO2avSR1xU0lRE+CnIIJytGQ3VU4LUW5PDXBeBiOIh
	/R0rzo4nl5oPsir1vgFnR1w4gX7RDNiuimbsic2ZGGY+cnAR8mt8IENINBYqdDM3leafakyue9J
	hbSHOaC/tQU07W4FRK9GtbVDy6YImvn8=
X-Gm-Gg: AfdE7clJkeLjTTv65DtvAIcOOYOHd6enl0VbQe0jOXkKy6MRexVKafqJd+R3fZoAxzf
	GOz6PfG0HWu1qrKgsCNgYGNbKm1ixtVfBvY63P0Qv+IIE5uDZZqDrMo73GQOGgup8NSHYIzN7ZQ
	uPvgGxY3nRPf5g+bfGEkIcMqq4jiNTk8FaSSvJZv8MEzinv61IwrwoXftXSNecTnAMjmoVcdSNQ
	Ph53RdVGk+YBIasqRM5e50ONCuENqRrqgzBXsbP4x+sy9n0/wP6w7TlizA7OTBh2aDRSrzsJoJK
	S2OvGyZ9owLuLXuu
X-Received: by 2002:a05:6a20:ae2f:b0:3bf:b68f:4685 with SMTP id
 adf61e73a8af0-3c3ad7aa9efmr17821565637.23.1784588612247; Mon, 20 Jul 2026
 16:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org> <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org> <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org> <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com> <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
In-Reply-To: <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 03:03:19 +0400
X-Gm-Features: AUfX_myYObGduWyCHGIV6FVQ5MLiv0fXdxRQPEPq6L49a_kPbVxwLSt1w92yVic
Message-ID: <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, linux-media@vger.kernel.org, 
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That fits the data here well. Downstream yupik-vidc describes four
context banks for the video core:

non_secure_cb: iommus =3D <&apps_smmu 0x2180 0x0020>;
secure_bitstream_cb: iommus =3D <&apps_smmu 0x2181 0x0004>; (secure)
secure_pixel_cb: iommus =3D <&apps_smmu 0x2183 0x0000>; (secure)
secure_non_pixel_cb: iommus =3D <&apps_smmu 0x2184 0x0020>; (secure)

Mainline programs only the non-secure one (0x2180/0x20, which matches
what's in kodiak.dtsi). The three secure banks are TZ-managed downstream
and mainline never asks TZ to set them up =E2=80=94 there's simply no call =
for
it. If the encode engine emits transactions on those secure SIDs
regardless of session type (in line with the SID-selection-by-IOVA-window
behavior Vikash described for iris), an unconfigured secure SID on this
vendor TZ would explain the silent PSHOLD precisely =E2=80=94 and why decod=
e,
which stays on the non-secure SID, works fine.

For the record, the one TZ call mainline does make =E2=80=94
qcom_scm_mem_protect_video_var() =E2=80=94 returns 0 on this device (verifi=
ed
with instrumentation), so the CP ranges themselves are programmed
successfully; the secure CBs are just never requested.

Could you point me to the QCM2290 discussion/fix? I'm curious whether it
was worked around (and how, e.g. an additional scm call to configure the
secure banks), or whether it ended up as a hard limitation of that TZ.

---
Del'aRun

=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 02:01, Dmi=
try Baryshkov
<dmitry.baryshkov@oss.qualcomm.com>:
>
> On Tue, Jul 21, 2026 at 01:48:17AM +0400, Kirill Ermolitskiy wrote:
> > Re-verified with iris (CONFIG_VIDEO_QCOM_IRIS, venus disabled; ffmpeg
> > confirms 'iris_driver' on card 'Iris Encoder'), this time with all
> > current fixes in place =E2=80=94 the IOVA reservations and video_cc_xo_=
clk apply
> > regardless of driver since they live in DT/videocc. Identical result:
> > silent PSHOLD reset at the first encode frame.
> >
> > So that's now confirmed twice across both drivers, with and without the
> > accumulated fixes. Decode works fine on both; only encode execution is
> > fatal. Ready to test whatever you'd like to try next once you've had a
> > go on 8250.
>
> This sounds like the issue which was hit on the QCM2290 because of the
> lack of secure context support...
>
> --
> With best wishes
> Dmitry

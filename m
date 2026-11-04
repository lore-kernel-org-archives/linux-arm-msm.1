Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834401;
	b=D3LtoByKI7v267Gjd77XkCf6HMaZ29aSj9xoTKwI1F7+KbAq8K0xxWVtrIjiPXMIOihY
	 9Iyvu8EUT4/28QAkwOBjlAyuT6rN1qlY9+RiYYtM6n+KTqgQBXY+Kmy1ZlOUrjbd2Vgg0
	 nvT9pCAIMNeTRqzVqPx8wlCHXMNw/rgj9KOJ1ibSSlhTu4m0c2uNX8AzJJXnVtF5ajNsm
	 AJLXbr2cXmQggi4+yqzVBZ8S8tZuVZsuAAg2VO/QK93GxrgiQm++Dcz2gMr/akIUFE3pT
	 I1HxBs/v0Q0DC3tOMdnKel2R7TQmnZu5UjNlFrGmS4sQlO4/kCg040A1MCWCmzLMVDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834401;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
	b=Ge7JDlwsNBwzix0RGaALvQ58HXsrMwqQ/Eymss8LjfmS4jiUbVcRSLEP4eDS4juTAlSy
	 3AfkTjF5jkSRYkci6UYnWbrEDUsuJzWa7E/evSRrHbIGv+Lgf/NuSn5SFHQjFWtmBTxKC
	 YQPSwySlf06aQzxBU3vUiRuIMO5eI1M21XFXMN6Uli2lqM4mIeKDYTdl0qWsD8jb5Rq1r
	 tdpbEqjX6v3xRCfbR2e0fHGM9fxxeQ4dXSuoozXwZkBFh58DWprhewXPJxnJga6r+Hc98
	 Iz7frWxVETw2haLJiRgiG/NHh53ZvmL9mMweX5vuqm+kN72Bch7jPZj97HW5xGSeKlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24730606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 23:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24730606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so12075111fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834399; x=1794439199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
        b=el+irqsdULD+bzeRi8XzeAnteNJIIo4RkFudQPuhEh+wwbkiNMzYG5izuxjp583gDw
         7QdMF5SizcYgjUZpvmNUBiBKu78SoOPXRnweRehOw55ynrgmY3YlP/j0hsRWgjpURUXT
         AvFV7YoDu+n9YkQ02lc9yFOYHn1y9ElKD2pllmylREMcESDqD7m8/5BO/3cHOQU+A3xY
         wmjZiThhL159TO3hyIjSkM+u5VYDtPijVrUPeZdzIoaTGEKW//f1fRP67jdio9+ogmzX
         ipvE3Y58adrqIoBVBziCFxtPKED9YUqO3g9LGi2euItyCVLdqapMrs4bWar2W0ze9kro
         0egw==
X-Forwarded-Encrypted: i=1; AKwUvBxPAce99zVjFFpkC/1KOywUCdWQm2tGbKCgXXMh0zu3Gm3ATULJA0GIrk8S3yNcPCe/F3IB94YVwhK1VcyK@vger.kernel.org
X-Gm-Message-State: APuU4Z/9xdZW9Q85lulxqdJvC5v7e7iAVdFwloAkEVySxIeLy3EPjw3F
	+8tNmO4LCPcrf1/iZb5zlzvUtxq6Pg7F99APj/f4WdIiNxwUIDnIKW10MbzaZ7SY0LM=
X-Gm-Gg: AYBFou1qgBNcMvECfrnS/Dxzyp+Wq7za/o1I9QyaCGHIPWfPRqSkoD4Z2/PBxUCEa+O
	oYUya5nYpUIZMH2myjrK73Hip9jpkB0MpMlffm4KWcxqb54a03F8u+/DP9sFCAiKRfcuyblGX3t
	hg8VzKI6cSDMEvOtoN24BjMYw/r/7Nmc2W31JVx5P1vQSMsSY3djNaSiRdg6lPS/2NEhNYAqkhw
	/rP2ZJYIbGqBEmbdv9U4P6/jm1+w7SKWnp+rD4u6hGgCFgVHd0Hkw9koZktwZYcP4y8QcEp0ZqW
	hFP1jAfyezHfvatx/KdhlKINCvl/RN46PX1bTD4obf8hBxvQ/1CDrU3MxcJ6etq+T7zm0vxMWuG
	eXXCRgDT193t2VVscU1pLrHAQPn+JwY2EyYy6juaFcsLlVECmHJ40NIUWTciBjNLxe5Mg9FHuOa
	yrKV1aAtYuakfKwkeeidfaaxvknZsDdphrwYomd2jDEU7zm5WjKTE+3/C+H0DJ8vt8D2IfumLVo
	HI4LITbOjsrGVQbnJjtbOneVfeHIoc/GmhiilhOPMmmCEtq0p47B7W6X619OGdt0fA4XvZd71Yh
	qS03C9Fo8RuLfvET4aV185z6/DIi85HGIjVwE4rayluSa5Vhe355RGxHczbPnh6VKPE=
X-Received: by 2002:a2e:9fc2:0:b0:3ac:a2b0:ac56 with SMTP id 38308e7fff4ca-3acb7b7a992mr41833101fa.29.1793834399128;
        Wed, 04 Nov 2026 15:19:59 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6d45ecsm6853671fa.21.2026.11.04.15.19.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:19:58 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1012373e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:19:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy+jKNIBUUHQg+sneMQH9uQFxz9N0E4sCLqJN1KHUqxdQxNxRpxhR/I929E4BTLKfJAmG9OohEyOyZPbPnM@vger.kernel.org
X-Received: by 2002:a05:651c:31d2:b0:3ac:e4b6:b93d with SMTP id
 38308e7fff4ca-3ace4b6bad3mr1250481fa.8.1793833951678; Wed, 04 Nov 2026
 15:12:31 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
In-Reply-To: <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Wed, 4 Nov 2026 20:12:04 -0300
X-Gmail-Original-Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
X-Gm-Features: AclHuK9-uWrMe0XXfFl-zEd0pTQ8lUonEa8rXy8zxcLRw3JRTxzZbTIo1byB1YQ
Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: Val Packett <val@packett.cool>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Val,

Thanks for the review, and great timing on the SC8180X work.
> It should probably go higher in the sort order, before 8250?
Agreed. I=E2=80=99ve moved them for the next version.
> Interesting, why do these match 8280xp and not, say, 8250?

SM8150=E2=80=99s downstream DT describes the PHY as qcom,csiphy-v1.1, and t=
he
v1.1 2PH (D-PHY) lane sequence in cam_csiphy_1_1_hwreg.h matches the
2PH entries in lane_regs_sc8280xp offset-for-offset:
- 0x0004, 0x002C, 0x0034, 0x001C, 0x0014, 0x0028, 0x003C, 0x0000,
0x0008, 0x000C, 0x0010, 0x0038, 0x0060, 0x0064
- lane blocks at 0x0704, 0x0204, 0x0404, 0x0604
- with 0x0728 =3D 0x04, 0x0700 =3D 0x80, 0x070C =3D 0xA5, 0x0738 =3D 0x1F

The SM8250 lane_regs_sm8250 table is a different sequence (0x0030,
0x0900/0x0908, 0x0034 =3D 0x07, 0x0010 =3D 0x02, etc.), so it doesn=E2=80=
=99t fit
the v1.1 PHY. If SC8180X uses the same v1.1 CSIPHY, the SC8280XP lane
table should be the right starting point there too.

See https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-co=
ral-4.14-android13/drivers/media/platform/msm/ais/cam_sensor_module/cam_csi=
phy/include/cam_csiphy_1_1_hwreg.h


El mi=C3=A9, 4 nov 2026 a la(s) 6:19=E2=80=AFp.m., Val Packett (val@packett=
.cool) escribi=C3=B3:
>
> Hi,
>
> On 11/4/26 5:54 PM, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> > subsystem contains four CSIPHY, four CSID (two full and two lite), two
> > VFE and two VFE-Lite instances.
> >
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> Wow, what an unbelievable coincidence =E2=80=94 I just went looking for t=
his and
> found these patches on gitlab in order to test on the similar sc8180x,
> and half an hour later you've submitted it to the lists! :D
> >   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
> >   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
> >   drivers/media/platform/qcom/camss/camss.c          | 262 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss.h          |   1 +
> >   4 files changed, 267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index dac8d2ecf799..851decb0691e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -1141,6 +1141,7 @@ static bool csiphy_is_gen2(u32 version)
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> It should probably go higher in the sort order, before 8250?
> >               ret =3D true;
> >               break;
> >       }
> > @@ -1236,6 +1237,7 @@ static int csiphy_init(struct csiphy_device *csip=
hy)
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8250);
> >               break;
> >       case CAMSS_8280XP:
> > +     case CAMSS_8150:
> >               regs->lane_regs =3D &lane_regs_sc8280xp[0];
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sc8280xp);
> >               break;
> Interesting, why do these match 8280xp and not, say, 8250?
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 2680a9914765..dd28058e98a7 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> Sort order here too
> >               switch (sink_code) {
> >               case MEDIA_BUS_FMT_YUYV8_1X16:
> >               {
> > @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *v=
fe)
> >       case CAMSS_8280XP:
> >       case CAMSS_8300:
> >       case CAMSS_845:
> > +     case CAMSS_8150:
> >       case CAMSS_8550:
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> > [..]
>
>
> Thanks,
> ~val
>
>

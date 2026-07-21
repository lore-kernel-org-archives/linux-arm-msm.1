Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB324D8DA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646306; cv=pass; b=ZKclvOSPSM/aYRiigE6iAThTBpDilw2VhkAbvk2xYgRxSYWYywN6+Fp3mNkDboeXuKUVoi79vy0NT3BhJJ70URl4JmHevIggRLc1VZtwSadr0A0ek498XBXoWsMxkggrG+4HrbOcEMAPbX30hMob7UvJQiIm0+aRl38oqDfx8Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646306; c=relaxed/simple;
	bh=dOYdRLtajuKWeq7l0EZ1y1y7lhVrzrmKGXF1xfK4b9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbdoftZRjozT3pUHYrMnATOzatRpBnDB6N78Fy788RHWTFOHAPtY0DNOgL0EZz0whWwXU+lZL+jp9XZLbaqdpQqlu1bI4snBqyJzP1hXWtfrt9eZsW15yPGuPefk6Yl7vjQch8qTBj871SeMWJe4xNbdopfhQGKdeLg0KNpBKiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS6aIioT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejP8G6ot; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS6aIioT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejP8G6ot"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg4MS1958692
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YByahmNJG5MKZSzb3gPGLiRR
	hG+aYD8P8HIDb4kdTjY=; b=CS6aIioTR973cYCLaauCSIZlyfJI2S/TPTd0EGPW
	uIDAnPcIcRETTrXuIVm/T/75MlIOaJXEhbSNbRlv7YATib45jPIiv6n4hL/O33a7
	BZo6IoCc83VTGOOiDFppnbW6HX9jUQaY6GkPnIhdgPqRfIFCuSW3uRGAEnf8cjJa
	7ujnWiiU8PdyM/mk+E9PyfTphY1Q33Boz5PfQi3NOhsIrzJUUldRZguqQZzUKrWp
	n0JdVQxPmmNJhAId1j3uGpHUhEFrzaY4wii/LbIXgebHmdpE/mP2s4yYJFWaIlqz
	qror97C+O//TyHpAcCyJvuX+sAnVWU1BAd5uGuiQWPXkTw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvu3mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:05:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so20218378b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784646303; cv=none;
        d=google.com; s=arc-20260327;
        b=nmYcaiwspNG73o920BlhM/3pQSbXyipa0x0GwEQBHt0VlQDhKskdWVVJHZhUqVyERc
         PCTUlOmtukXAbxlHsTOvKms6ytsf43OC0qHQDhqvW4l04F0Qju4pqtZZTyTl+K+ZCV4c
         mfx3SwIis72IlaZXAnsZ9cqO27dzxxZo4bHHw+as7KKK4iS2hr2H5vklSHOK+UpZgIZW
         WNpeoCQuTUCfUDFNAZjbvL+wRin7LOFE8kEuef3FbX/j3Mf05r1Oeqxfc2DnUsBpFJ1b
         xv24FA6eh7YLH3SloCJ7gZsPBju8I2Ap6eAtkVB5f/MSQ8Iz+vzp1EFXwuRfxI0InNHT
         naoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        fh=2+/yICe1dAXaLRUBbE4UA2iIhTI5T5o+Vgw3nLMKcXs=;
        b=izCDHAJzqXrYAm8Ts3EQuLZtqDkdge9JKi8dd3Ngrb+6s73XR/F4ky5zfBS/e3Bf1s
         bwgx5gDo6v/6NfRSuyVWjHLN2ygQLtq1DcvBUOsFnHLhvHUxMGrfCnaF3PQGvEYmFa8Y
         Qt5ovnHhNsseR32BxpjXeNbid8Zl6YE6E09/opIDFV2/Ty0DZE/pOQYvp/OTyzb2L/Pj
         ct9aVqFDpHhds0z+ZO9isvCHc2xepLXGA175qFpBYYgqTmJ6TbE8ooBHD9PnH5K0BL+6
         oYeP0la+KVTpgIoK4pQx5TQu+Rw0RS8Z5dGgzZg1Lb/YlD1Jo1xG+gyUAOUQGFRuvlD5
         3MKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646303; x=1785251103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=ejP8G6ot9QWhPv4oil3W6hYFOdWkKj9pQzOO3dL68VfdvUPsyMkBjRX0B4YiL9jWsu
         L+xkktA0/HqXuoWuAgR5rwfqAgRb5UYmfdOh+znWt4Zb3YlKVOAAUOAALQftatXiNmI9
         CudqW62uldS7lv+u05wt1MO5dnEYr4fpL87DmLTQidya14e+oNKs9BRkAldZPHXLdpAh
         KiVor46SnbMGHoAwOZI+1rXyjRobFBi1DKPy0Y1i5XHqUlOiw5Un/wIHcERLH2K/Hp4+
         yffoDU6YtgC19KBjhzqqonpiSrnLvlRuzVm7FCWV70FLqug6DiaglRNXoC2AFaqshxpI
         R0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646303; x=1785251103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=Ha50a9nFziAg/LAewr2/sTwZ8guxG9SiB4/eDGzBA4Lj3AUHXiFz9IpRqxxacWf8uc
         BaHp6j694TeyVAg/im/+6V0vkHJeYXhr9jDFgqnl3Ohb2+ERrdv8JN7XmRlcDPMBqcf3
         E4Fs9b4hDAeSKNz50qvPBvAIuSl3AaK48FuuKshUL/gXsiJyBimtDjcm9IORzAuxm9z7
         c1kcjzLKwMejSQhJL3lmRngrjTbrwFVPwre18XEMeRczUiDf1ideXLlfuXWz5iyP0wB/
         vCEJV1sLikX+E+33lUw4JorRyw9YlL18lbpOcrtHovVSikLjjG7kC/ztsfVWChD/DRCn
         rieA==
X-Forwarded-Encrypted: i=1; AHgh+RrWJcc3KSGFsDUDe7APammicdYBe/I45kWdUXmDfdGdNPGGW69LQjA6FsEYqhRuNDs8QnKTYroPs5RxBp6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9W3DzHSpXYQzdtCCUiuga4opJcSZ0pLO6cjbCsoHb+hm4H2gi
	mcdxzbe2QC57rs5A/i4H7T64eLe+sCNpcLqYUa17Bs9iE5lHBaTdRf1xMSJRxPvz2mr42zL+Kbm
	xjr9Bm47euv0sul+NKUe4tnIJ2Zr7edwotY8wH30Tk7ckIXIcTS4HpuUPk3WvHkVGx8mqCXrexs
	ahaubbeb1dfP12uYPAl/UKV3Ig3I0gL2Jt8+yNQitywpE=
X-Gm-Gg: AR+sD10XqhDZe/3P42YkgL3tyzrKqqjcsK5E3/dbR97mLHrKANKJjOxzj9wQftvbxU6
	rgA0P/F8ye7C9wOZmyUNrto4zUvgPs0LbnpNwns8Pc+wSrDwNW8D0dZxkwj4NsjjpA8l2yQc4my
	heCXsOmBAQsoWOGFpZ+td4udbhAWg02985yeS5euKI9EOFld0awtOawDjnFYAFqbC9eHWQVGk=
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-84c292a0e86mr17652206b3a.3.1784646302810;
        Tue, 21 Jul 2026 08:05:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id
 d2e1a72fcca58-84c292a0e86mr17652128b3a.3.1784646302052; Tue, 21 Jul 2026
 08:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com> <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
In-Reply-To: <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 18:04:50 +0300
X-Gm-Features: AUfX_mwnWEBpQLukUwR7S931rfRJyPKDW_MoN2K5bzRez7pKe6ZY8ZSVeWlcMgU
Message-ID: <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: nTsajTbCPBJv19wEiIaVjLAVgrP088Or
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfX+uxzeTcUAmUi
 gLVIUdPpfN+N0Kghhx+YbiWUYp5YHtXyxJ9s7oldGnsym2vvS+F+OlaeYPNQ2um6IMsSR3GvrKu
 yJdhBd8WR3TpoetAR605iFgpZrnHpkE=
X-Proofpoint-GUID: nTsajTbCPBJv19wEiIaVjLAVgrP088Or
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f8a9f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=UDfdo8XgODCBNK5t2fMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfX9B+64HuD7jai
 DnIuEDTvFPFOgHhhV/t8Tw29h4VpLPcn5YSTRsmOBj67QayGy2LPM5QgEMy5ZxbEtous/aa7sga
 vHhfbhpMEFo7CgLShK6ZuESCXDL2KPQn+wPqBqM1LAsY/j1Coyk4krMqx8aIOqQVZqdfK7tbMKZ
 LH0nBhiwgbz+J+qyq0KbX018DtWsoPUEohFi7+vDG0UtDFN54h/cAnuVLngrfN0gtE8sVkEDEbM
 A2KLp89lOtczJkF23GYVlvZsZHRO5MrmeprMEKH02fvwo5+oAlImEhmjA5IaSGWgvQSnk0nfApY
 t/4fme/DNIoN3xQfX6SHo4jSUU70KzPSCVhWI1JqdkNox8eY+H50ASjnhvDu18tk617yPa33XaQ
 uC1q7Pq1O96Jx9L4tXeRx1KsRGNy8ABeayKmLYuBSdsmQyjrD9muruskwUIUmV01PMMfkMlHNVL
 G4NzpAjD5HouoGdZing==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210159

On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >
> > The raw formats supported by Iris were previously advertised
> > unconditionally, assuming UBWC support on all platforms. However, some
> > platforms do not support UBWC which results in incorrect format
> > capability exposure.
> >
> > Use the UBWC configuration provided by the platform to dynamically
> > filter raw formats at runtime. If UBWC is not supported, UBWC-based
> > formats are omitted from the advertised capability list, while linear
> > formats remain available.
> >
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
> >   drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
> >   2 files changed, 43 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> > index 4c8bc7aac135..9fee5f28097d 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >    */
> >
> > +#include <linux/soc/qcom/ubwc.h>
> >   #include <media/v4l2-event.h>
> >   #include <media/v4l2-mem2mem.h>
> >
> > @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
> >       V4L2_PIX_FMT_QC10C,
> >   };
> >
> > +static const u32 iris_vdec_formats_noubwc_cap[] = {
> > +     V4L2_PIX_FMT_NV12,
> > +     V4L2_PIX_FMT_P010,
> > +};
> > +
> >   static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >   {
> > +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
> >       unsigned int size, i;
> >       const u32 *fmt;
> >
> > @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >               size = inst->core->iris_platform_data->inst_iris_fmts_size;
> >               break;
> >       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > -             fmt = iris_vdec_formats_cap;
> > -             size = ARRAY_SIZE(iris_vdec_formats_cap);
> > +             if (ubwc->ubwc_enc_version) {
>
> Do you see a possibility that ubwc is enabled for a SOC while VPU
> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
> UBWC configuration, while VPU does not support UBWC. Not sure at this
> point if other blocks indeed support UBWC for qcom,qcm2290.

No, QCM2290 doesn't really support UBWC between the IP cores (as such
it has ubwc_enc_version = 0).
Currently the database defines a least common denominator for all IP
cores. If we ever get to a point where we want to define UBWC params
per the core, we will need to restructure the database.

-- 
With best wishes
Dmitry

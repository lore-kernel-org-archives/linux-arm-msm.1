Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E93542CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823260; cv=pass; b=Nt1qYquBFVzV68NnbLhmEylIVIkZhUiaFhJqaXhatUWdkOsXEsQxX/7gHX0WTD1Jl4QXE2fWHH/uxH9uPraHFbuA7Wrz8CPd/JRePPEQYpRI0J2SaOU1Kjlx7SvwibUSOVsGMZpABrM6198G5dmZnlwJcugMydetsW24wAzZ6zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823260; c=relaxed/simple;
	bh=G8t2aFRl5AMWi50Y/QX4sqca2qmYUkfkCXlvrA3GuDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR9S2jtyZ09f2uHggG3o10mVZfFtcjMlSIpTFyBCdEv+HalfMAj/MegPpGPZSa64ARUPU8SJJsRa6r06uG7vWfxnFzkDBTt/EziaMGwFPp43AriSRyoEKx+GTpXlLxlQ9MWS5GTAEAIR4gM6xsRGu55Vxp6W2pvG9yavXyfNZu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZTdbrzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2daT4Rs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZTdbrzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2daT4Rs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687KlnFn1292479
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 23:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=; b=UZ
	Tdbrzt+oEj3L4P1sex6z7RsHWfouNMFpj0q2giCKwZfZ5WCw9k9R2whHio8prHku
	gaWM7tbWB46sO+m2k7ZDddAPodDstUk2jjay73Fq94ZdpeezjLC9w/2npPTAtTzG
	EL0rmmVwN5rQGBYR0GXT1tiFpnwF/CYqdJr5zoBHkdcgjiJ06Sc5WNJubElxv2Te
	j7xFIYZd/C8nd0wPRG2lJdtLWTm38IRxU7LGn0D99qzc6HJkYQJUIZwRtpIVktAA
	8HuWYJwVAIOBuwAk6Yg8ux6/WgtLxY5F49/GfhhGVx6YLvBcLcvudbOgs13pSE9J
	ffU81UA7W1YqMR5XhJFw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg2w39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:20:55 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ead32f5c6aso3180453a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 16:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788823255; cv=none;
        d=google.com; s=arc-20260327;
        b=N0oiD37vPf2k5v3PfJEqg+HO3JXYaLqm59OP5iP2NzfAhZGHXwI5gP+hO6RZ3Phkml
         YrdWVZQIdbmadcnX+1dFPYVr1GDTRo54yxp2d2+j1Nia7hlL9KGJmLbQY6jimpHNLFzh
         a/2+vqsX2ArLU5n3UObFLBadrRKTlJ9aF8dD1UTMQPhYgg3r9rt2KdrMDlx8i5f6aehU
         fqcK9kNlyb0USgXyI7ZuoTXYnJY/reSIkY4DaH4wdmO5lJbel0uPrfHMiTvkQn0VQyPI
         4+0hPyFmCS+pErTV2N0s61w3gqeNH6UFt2pqJxQCXGq59npBBQNWag/P9FoibOJznJaY
         EpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        fh=pA4YCIoES2uODoncNw5z6oEchuUwGGevijpcor1c3Js=;
        b=gmZDaT5WyMGs2BUBpHsEcxsyFaUE029EO5e3sUJ+L4+QTFvxCT+L71D7BV7YiPnBAF
         0ba6j5gGVHhTLQbrWceBGJj8k+/ZgyM6NUVrjEHU5zsnCA2XSdgnFCLnO4FY2rcMH/AL
         uds9IRY3Tw+e7MrO4j+ujylIgZ0KFYihSaIe0Dw5HiThbyv+iT4VOWwFRedf1mhtg6+f
         XCJrjLuCRVt+5ECuwfuKRsXhd/7TtFXdEefQgpm1zzByZjlBUT5lw3oxfv3r8YMXNsAJ
         a1q5wbTEM4ZUm+x1w9RPpcdbfAXIaU5F286LV7TcImBd3skYyFtJGceykF3LU6jL3WdW
         3Scw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788823255; x=1789428055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        b=P2daT4RsjxkkE76vuqVh7/ERew32FuGBiqh3F5P7uAED1yuJRDifUSvSRhFq7n/4Ea
         yfdvdzzQ6FTTtZ/b5OELRquAnaPr4c3gRJLAdv0/D8kxJK/fH1UmpzwVeDTdY+oF5hyy
         qm8V/3R+msQzO2vJwm/4hPAGr+914aTaQlosT6ZBLFIVw5WQNJP6uuf8AKYKMvc4Eq9O
         E1VtuXzXG0ka+8TM0uMd3gCIWKgYcW9om4KOPE/cdKYB2aNJuF8pjIMdHZU5WjMq56VO
         Tpw01wd0Y2zk44+gtXnxMiy8xrVbXs5Cd9H28sXZwW4TkN/1LqcrIS5wcPSpLbHTrmAE
         Hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823255; x=1789428055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        b=Ll15RrchALTJAzygQosjHgZH/z7zwd0xAvrIJmU/jyGFSURBlRNewf7zZqnIRc6htx
         oSJlWS8QL8o2d4M5OgtglEgLTN5ipJcT9MiFEKUxmtrq/gQsnIYFsh9/AHmkmUyHnIbq
         2T9gjfw2ae19nwwVDnnp0+iQBAi1Kf58G/dTDyf/PaTFLhav8sN7ZEPTJiJ0W2GclkO2
         b7ySQo912Ggh0p25g4sUepWFt6L/KY6hwYEnO6cg8EgDvYGY4Jnv/mrSi9vGUWrObYQp
         uOkz2ak9CE9VhS3G9m5vgKy9XATGDG0E/qhTB4jLvQeB7Ocrq83FrzNTBKo7Z9nqeH/N
         JZeg==
X-Forwarded-Encrypted: i=1; AKwUvBxAb8sSPoqWXRe2jJACcMfyuG4mpp51uXs+uecBVHZq5YHhCvlivbsmQ7SLpMYjgTB92dFB1FQWGskJ0tb9@vger.kernel.org
X-Gm-Message-State: AFuF++kq5Dn7pH9PlHptWZVp6uUeA0JBEawzM5S/Su6BoORjCs9royix
	uYeSv6jt2eace3IGSvGYwbfku73xRjBSO7jz/5jGQEqcY5GBI/sJMHNiz09OlgQLlBw1AQEOnKB
	abTlsHdFjXzvEf3ugJ9TTsyX8CpIeB4JDX3uUqbcPAuYLyaQAJ3jCoboqGOkeXdxqqivHZWL0Ck
	+lY4UbS3k6RWmO2k57zfvChoxdJ1gchWl+0pBvxDB6zf4=
X-Gm-Gg: AYBFou03/RzS43ZWBlIGMAunxhdNd7IrE/MMyej5KK1m8+5uxeRV5TXkILlTaWZ6s8X
	HRXaKRxGvc+eR+QVZPM//G/0jzAhunWl8o77Y6hAqROo7c/fszW2Uucy3nvcZ6xOCrj6xTXtM2p
	YSbdJPDSswTkl+sngVKnNxijIl3G5UIiwW7MOFmRS3ie0ostZlpa0YVsmU
X-Received: by 2002:a05:6820:4b03:b0:6b1:d1cb:cd6 with SMTP id 006d021491bc7-6b6fcfd9588mr14080505eaf.23.1788823255169;
        Mon, 07 Sep 2026 16:20:55 -0700 (PDT)
X-Received: by 2002:a05:6820:4b03:b0:6b1:d1cb:cd6 with SMTP id
 006d021491bc7-6b6fcfd9588mr14080488eaf.23.1788823254758; Mon, 07 Sep 2026
 16:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com> <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
In-Reply-To: <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:20:43 -0700
X-Gm-Features: AcwNN1Vjgj-tYHtj6eTbg-Hki5u63lIX48kQkMC8BVBIy_zhePixhFmWvWpwWWw
Message-ID: <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI1NyBTYWx0ZWRfX9jGyXBfPCmyy
 62kdcmPj/uemgCuM0AZ4Q6n0MpokNfa3SUU3vMldEORhp5SEe9Fbpxs8uQinE5BsvRidu/1ugxi
 h1PqIU4AIpPOcyxPXg+cI2JTbtXce6UC961W1malUhSGNppxkSZho9nJu31aYoHT1stVmh7dh4C
 zvb7BJEfyBPuRO9UFVr53S9C0SmDb/RupgDST0H/VokoYz0EaEtvFiexX+MQWk26xkOfaMt7oTU
 TlWwlAlso3kKVCrS/t9tS8cJX6Rk0eNppaApBDHiu7KubrB2AJFR2rZUVUkX9jWjj/omafJ69CX
 RfCmChcO82tgI99U9uY8hiu4P8h7nAx2eP4wIumpOlC/fW3y/O2Vb0jeOv6yh5q58dMMY26PwSM
 pjKdk2Rewbrlm37PjdAfXJAYL8vZX6dW5FQn8/NYRInbim9Js3acbPTpwGxzM/m2P8R8Gps0qP2
 rs4B+EECY0HH+FbbYHQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9f46d7 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hd7ZCrGOQM2Qc8NPfv8A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: tX8TfP3p6VCv5Unt2mRlODDCe9l3veWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI1NyBTYWx0ZWRfX9uhyRaOi1MkP
 ILtSARK3oPrZOtr74rSQAXda5RxB+/6OYF7RCNlEvHGa6W1c/iaTU5dkVeoGwMnOfrogT3+as3I
 uMavlSykRR73s3N7SH9US8ayOKDjwhM=
X-Proofpoint-GUID: tX8TfP3p6VCv5Unt2mRlODDCe9l3veWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_06,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070257

On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > zero whenever the GPU is powered up again and the timestamp reported to
> > userspace jumps backwards. On an a702 six reads three seconds apart all
> > land in the 500..1200 tick range, stepping backwards twice, and on an
> > a530 the OpenCL device timer conformance test fails because
> > clGetDeviceAndHostTimer() returns an end time below the start time.
> >
> > Save the counter in the suspend path of the affected generations, while
> > the GPU is still powered, and add the accumulated ticks to the value
> > reported to userspace.
>
> This is useless because the entire point of clGetDeviceAndHostTimer()
> (and the similar thing in Vulkan) is to match what the GPU itself
> returns, and now you've broken that by adding an offset.

Just to clarify, the timestamp needs to match what UMD reads directly
from hw in various different ways (timestamp queries, shader_clock,
etc)..

If we can _restore_ the value (ie. write the hw reg) on resume, that
would be ok.. but it doesn't look possible.  Otherwise I guess we need
some scheme where an offset value is stored in memory somewhere, and
some coordination with userspace to add the offset in various
different paths.  But the kernel shouldn't be adding the offset to
what it returns to userspace itself.

BR,
-R

> Connor
>
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from z=
ero
> > whenever the GPU is powered up again and the timestamp userspace reads
> > jumps backwards.  Accumulate what the counter reached before each suspe=
nd
> > and add it to what is reported afterwards.
> >
> > Measured on an a530 and an a702; the GMU parts keep their own counter a=
live
> > and are left alone.
> > ---
> >  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >  5 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a4xx_gpu.c
> > index 6392126f48f2..7d9dd9460f5b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > @@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
> >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >         int ret;
> >
> > +       adreno_save_timestamp(gpu);
> > +
> >         ret =3D msm_gpu_pm_suspend(gpu);
> >         if (ret)
> >                 return ret;
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a5xx_gpu.c
> > index f1df2514c613..c5552f1085e0 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
> >                 gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x0000=
0000);
> >         }
> >
> > +       adreno_save_timestamp(gpu);
> > +
> >         ret =3D msm_gpu_pm_suspend(gpu);
> >         if (ret)
> >                 return ret;
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index f9de9329dee3..106cc2ac55ff 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
> >
> >         trace_msm_gpu_suspend(0);
> >
> > +       /* only the GMU-less parts come here, and their counter is in t=
he GPU */
> > +       adreno_save_timestamp(gpu);
> > +
> >         a6xx_llc_deactivate(a6xx_gpu);
> >
> >         msm_devfreq_suspend(gpu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 3370cd44382f..f83960b31901 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
> >         return vm;
> >  }
> >
> > +void adreno_save_timestamp(struct msm_gpu *gpu)
> > +{
> > +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +
> > +       adreno_gpu->timestamp_offset +=3D adreno_gpu->funcs->get_timest=
amp(gpu);
> > +}
> > +
> >  u64 adreno_private_vm_size(struct msm_gpu *gpu)
> >  {
> >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > @@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >         case MSM_PARAM_TIMESTAMP:
> >                 if (adreno_gpu->funcs->get_timestamp) {
> >                         pm_runtime_get_sync(&gpu->pdev->dev);
> > -                       *value =3D adreno_gpu->funcs->get_timestamp(gpu=
);
> > +                       *value =3D adreno_gpu->timestamp_offset +
> > +                                adreno_gpu->funcs->get_timestamp(gpu);
> >                         pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >
> >                         return 0;
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 114a40f79ef3..db080a6d515c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -207,6 +207,8 @@ struct adreno_gpu {
> >         uint16_t speedbin;
> >         const struct adreno_gpu_funcs *funcs;
> >
> > +       u64 timestamp_offset;
> > +
> >         struct completion fault_coredump_done;
> >
> >         /* interesting register offsets to dump: */
> > @@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu =
*gpu)
> >  /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI=
 */
> >  #define ADRENO_VM_START 0x100000000ULL
> >  u64 adreno_private_vm_size(struct msm_gpu *gpu);
> > +void adreno_save_timestamp(struct msm_gpu *gpu);
> >  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >                      uint32_t param, uint64_t *value, uint32_t *len);
> >  int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >
> > ---
> > base-commit: 140b13475302601368c0cf4e193e66126a49feb3
> > change-id: 20260828-b4-adreno-timestamp-f4c846391b97
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

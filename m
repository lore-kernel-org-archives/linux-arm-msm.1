Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912880;
	b=TFTdljqYVZRHp2Lirf8WjAxQxVfdUIfwlZMHvQ127c/xX7OHWVHh8Ha34duckPqcvam2
	 lAzbBc6dBNVBtDb5e8z9CIww3FYv4YF30BvSLlUhD7HCuZsdl1BLcik8YquLe9rWA+Utn
	 NTCEJqtOLZJAfK6O2wrmowCK8zf+ipDtmlawsqxrfMVzavmT7Fw0jnaq+JnlzcdkB0GpQ
	 YV7NSWViHffm4pXYeyhVD11JvLj6s02vn+YBNlf9T43Vu6GtQpAUTm1a/RgFxPngsISdZ
	 CL81SrWSpp/udSQBew8xtXKuAnYBupQgoDobWqas2Vsc/u/rqcH2g42wGuRPCAXsL2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
	b=jQkBW3NW1R5NVPPFQRjAAYZkGbtCePP12L4MAo95yJT38AV+Ulmt12nXkudAeqH0EBbA
	 voeiWri1L0YcGy1zaGLnlSGgsZkl7zqIwlChbf0sFG/DXtumq+6fsCseI4m0e3XsFdSKV
	 7Edc9i7CYOTdVqBFN/xgRvU69ufrbY+hZUq0TG8x6ykqKNZbr4nozLmKtjzKvXUMSw5zu
	 v2IpTg1SL3bMriJNPMCRTkzZmrm6uAyiUtS2wM3NXyPKHwtHxiPT9ubqouCmv9dk3atPN
	 b9V9w5TaQCjjJSMGV8Q5swaC8boE8ogeQbYVC7loZpD8NHL2oVrmaBfls3G7hXQUgmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F2606D80D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43F2606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6ZWk1935522
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=; b=ko
	QgpWjC/rgaCt0NHLrQfHNc2+Iz/JbxNh1STZty8f+unqZjTUU/JirMf+++xHmTwn
	YIAZrKLT7itaSsSGx+ulrNeD9GR0qMz2h37Ck+zV4OUg3wh00Mn2WSEsYHMCNcDd
	QqpsSySqlPm5HBaRQpCkyWbihCF2TeRDDGPY3C1W6Lkb3bDv/SiNI7SUwfvyultb
	GbG7PlaJWNLX3FFhR+pBy8UhvcDvG58NsxsaX0KIJrgPskdDOKMUeewLy9T4UlwI
	CMPkAPzsWNfscaE0LpzBsSo3MXr9IP04Bb4wLqiDJ0wLQLUQ/PkQF4uSF49g5qsH
	4MKFiotR99rvbtV2GVww==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbu40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:07:58 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-464fb819ac5so2383587fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912878; cv=none;
        d=google.com; s=arc-20260327;
        b=ilBJbt2aBGezEg4Zz1Gfp1sdc3S4D+zi7q/BDJwzjpf0QaiVWwEKd+rUl8A2TMO9IJ
         X+9vdikbAf8V7Nw82DAedVlX0jsah6d5fNP65Nt1VSPMJzPX78Xz54iA7RAZanvbitLm
         KNobHH3GQAdyLtzXJOaNQ8Sg9/NxghZK+UJymr+l5gyscNqIJFur96e9dfVQ36Njh+Ch
         nVfj3XH224LOOjHTkiDqKs9HnQOzTx3709pOgHGqP6aacuwDY15sM8LRW/q10BUpBV+M
         Wt/e+59ogeTCuXoIHt0S3emqjjMWC21kF1YAwnhUwUR7kuFwN9xibKznETl9E+shxEVA
         Q/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        fh=GPwqYXfDQn/0WTwpIdBUrcc02lVHswQBwtJDqTAxKzQ=;
        b=i1nFUQwcKH/pu/QeZ4AaFtjIPFvp8UiSQyEu6uLtZzhs78cc21ErzsNq5idp2+c8yn
         quMX5Bs816eU4wFBAplQkwaRd83ox7uvC3ncW6Urfua7C31X4JF7O9YxxyL4ZOOXgYuh
         PCMMZ72q23nj8ajjARpOGwa40SQ/5MkpH+8pubaupAiu7EPagvdLF+cuuz8zQDaf/MYW
         0xxtVx/ojyt3VKbSh+9rQExhlLGt1BOxOZeEMeKh/K72z/9Wv3WOaAZtp6MJu6xOZoNf
         r2ZXsvTW4rLf6durhlcH4lPNnsinzeWAA7bUxP3oJvDQKgOnVscNhlCeVh4xWffv4WKW
         oLBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912878; x=1794517678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=Xh8l0zQ6C/xZbWgnXvb+3G/sy1IhfcE9UXe48qhHSuQk99fNy2Ueg8wIurqpJ/pQr1
         YAgM/dtLe5p16fA6mpAQrBTytMe5WLmXR9i47duHnVJxFF84Oytn49z+CMmAtCkxm68r
         5q7pCtN8lUv9wo0HQS/fSD9UrifX+fyX9PfCRsrIdsQzKlf+4QBIidZSwfPSpzWJw+m3
         iOCntmvvt2i8/xtvq2da2su848AK0q0RCV6Q0LelKnt6VGkyq/Fu2Bd1HZkc62rIfNYQ
         vFX5iQSIJTIBJiR//MQGAWCmhP48kGtXPq4G2KZxcO7SweyJYGEhLKyWS+xgoSSokgWR
         Y7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912878; x=1794517678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=Kxtl2L0Jor8QVhmQyoJ/Q1vtaTlTGW48/hvqdCG0GiaEXe4kmDDYqi2BGjtZ53bzri
         O0CYeM+s55oGDuqSoVjpyc4lkWDaAqXKsZ5pjY+Of7tch3YmW0pDAR6WKBL9SuGdFu4a
         kYvWaez6RuTVHvDSGuCRq4wwtf+1KTZ+5ZQCmEQJn9VSeoLQHrPYeqr6uBoAwWsyP6+g
         wkABh+4s9WLj5/TpziTJ7tTTpI0wkOqVkCpcHjzOzbagF0mi0EFkW5X+Mj5I7PKHN892
         ULH9DhEt+5jLv4kZz0V9yi3SGJhCacRuwZrKDWFhy8Dh+LPfCD6MO4nnZTpUo+bkef/G
         rPfA==
X-Forwarded-Encrypted: i=1; AKwUvBy6VODMl9/5gBiaH/nlvo+JLWXSkf23hTSERkxUTVdevMYZFfK0VSu4pSs0K1Zr3YpmxsLBQuyS7RMiSbMq@vger.kernel.org
X-Gm-Message-State: APuU4Z9HYUV+DKoHQxl3OGcxw3hj4/yKF7ZWn1K7Xk0Q839vyI+/vV82
	wiFdqzu9a5b6eqgHEHxV74pACRHSp6kftIloCeRJXCMdlZJQxTFrXleoUUr6MllSAnEPqXqFHwr
	DwLdhBcmU3+wn9HrdstFi6EaGjMR0IM3kIz3X0vd15J++2tts8VAXDiPRxlHcHhD/xFO/Ko5tmu
	Wu85moqg7GxO+Hr7eksRvpHSn+uWA1VOa2Z/uGezY6268=
X-Gm-Gg: AYBFou1S+dJFSRoqy3grYhqYEau4S1g7VWJaOyxOCpBioX3v6mQPc3LRjfxC4s/aiag
	8hUsINd2OCZgodtPC7y00SfcqQKrTmNdOouGWRVikWPr/on7Zn7+VBGKnv/i/S9EiGPOAxu4qK5
	AjtZAvFUN8hItchNBK1z1s1slLPPTp8ceBzZMW7cjwERo4apXa00bDWW1R9uDo84cjrrbY5BroL
	EjaadPUhuDU0PK0FmOfRw==
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id 586e51a60fabf-4ad98bedbd9mr282004fac.49.1793912877639;
        Thu, 05 Nov 2026 13:07:57 -0800 (PST)
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id
 586e51a60fabf-4ad98bedbd9mr281983fac.49.1793912877179; Thu, 05 Nov 2026
 13:07:57 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
In-Reply-To: <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:45 -0800
X-Gm-Features: AclHuK_l2F4brRz8zEFJVBH6hAHGfTJx_ef7xI7quruekmosYIZayahgz2bCT68
Message-ID: <CACSVV013piWuVo87SuAGK+j9i+rj4cHGiOTX9kznE4ROJup0Hw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecf02e cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=w63Y8P8m0PzJOg8PKjMA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: U_gsaoIEGqZZk2MMou6wFXFma1nf4gz5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXx35jpAuQ2uOh
 NPrKGOmETvQivC8HhErzo8Jf9DFGP6PpVDMjqggkZbIrZUkF7mrm8Ikj2QvGIWeDaOLIw5BQigH
 lFIl6BRlAVMTykHMUNswNKICk1umqgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXwXnzTAVyZ8HC
 BW2nQVrMzMyJmeGzjdZHe6QFZWeSHmyewulDOvZjF6NiZJ4/CjGRJU2tUmhhICizi6ebR0+scbk
 ZAi8OwacFgVrZco6kA3LOFPMQthMa65m4MsvSSjkUbePaBpulonrgsM0OK2Im72GKzgz+SRTHCy
 2lrC6QTMiSkUHSf+WWUfPLeJR/hJR6pZu+RfAj3SkMKQs2u0eHqc4/eYV7RQKENXLtbyTFriCJD
 dc3Wy+lcfo7sxZVbZ99+3JNr35ZwplX/z1ON6AFWYpXH7ti3xxsTl6SCVFY5X+d0JGzWFDzTeS0
 tA79hrvpv588cG6nGg8lFeCjq17DE7TmT7pV6Vx/lZK92ucB34iOiV+Z2Dh0VFrWOjyFPrIa+2C
 vOA4UYVI/gQXfYLN47q6veYzBpdqTMT6JfMBBV5GVheuBaxr7zzqrbWd9Xor6bQAYnvQEAnKSGD
 I9xDR67JTiejnKAA6cQ==
X-Proofpoint-ORIG-GUID: U_gsaoIEGqZZk2MMou6wFXFma1nf4gz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050084

On Thu, Nov 5, 2026 at 12:30=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mercredi 04 novembre 2026 =C3=A0 14:11 -0800, Rob Clark a =C3=A9crit :
> > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@coll=
abora.com> wrote:
> > >
> > > Nice, very happy to see the series!
> > >
> > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > The comment describing the QC10C buffer layout calls it a compresse=
d
> > > > P010. It is not:
> > >
> > > If I'm not mistaken the display engine / the DRM side (including Mesa=
)
> > > describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire t=
hat
> > > up everywhere etc. OTOH if we want to keep the DRM side as is, then t=
he
> > > comment should reflect that, IMO.
> >
> > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > as distinct formats, both with and without UBWC.  I'm not sure if the
> > same is true on video side but P010+UBWC was never exposed, or if it
> > truely only supports linear P010 and UBWC TP10.
>
> Xilinx ZynMP is all matching TP10 (they had GEY and YUV semi-planar varia=
nts),
> but they never upstreamed it, hence why we don't have it in V4L2. Just fy=
i, we
> named it creatively NV12_10LE32 in GStreamer, but careful, I cannot guara=
nty the
> padding in on the same side.
>
> Though, how do we deal with backward compat here?

On the qc side, it seems like apparently what the display advertises
as P010+UBWC is actually TP10+UBWC.  I'm willing to call that a bug
and just fix it.  On the GPU side there is an MR[1] to add P010 for
vk.  For gl, I think linear P010 should already be handled via shader
lowering.  I'd like to add TP10, although there doesn't seem to be
(yet) a vk format for this.  (And I'd like to stay away from hacks
pretending TP10+UBWC is P010+UBWC at the API.)  For now I think we
could workaround the lack of a vk format by using DRM_FORMAT_TP10.
The main use-case to start would be dma-buf import, so that seems like
it would be enough for now.

On the v4l2 side, I'm not sure.  But it is also not clear to me if the
viddec hw (iris) supports all four combinations of P010/TP10 vs
linear/UBWC.  I guess there is already some fourcc translation needed
between v4l2 and drm, so maybe it is ok to stick with QC10C on the
v4l2 side?

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45721

> >
> > BR,
> > -R
> >
> > > Best regards,
> > >
> > > Robert
> > >
> > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/8195
> > >
> > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > 10-bit samples in each 32-bit word, which is what the stride comput=
ed
> > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drive=
rs/media/platform/qcom/iris/iris_buffer.c
> > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct ir=
is_inst *inst)
> > > >
> > > >   /*
> > > >    * QC10C:
> > > > - * UBWC-compressed format for P010.
> > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packe=
d in 32 bits.
> > > >    * Contains 4 planes in the following order -
> > > >    * (A) Y_Meta_Plane
> > > >    * (B) Y_UBWC_Plane
> > > >

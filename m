Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792594272;
	b=ydvyZ5wOghvjxks76Qfv7QRpA23fOTrg9e6kNLLmfiyr6apKt3wySHWJA5KWnTPnVMue
	 kXG0P4MEaUHOoMmTJgQt9dnDe72VetoQsZjr7U/NLevXljGxuzY6Si3OhlkAo8MOAgy1U
	 y0gJpRfa0fghFSwPPP9fblnBpQCsLW/6SOJenen3b4edQ6JWJO9XAYqmnqJdJ7uv4abfP
	 tt4rwoQsWBF7/se9bgXN5mZkttkSktvWHkAiB+ZmijqJTB3bo5ZRCLnMviKP9NpnyTFLH
	 aNPMfyj85JidlguqNVU7tPK+CL73YIVowazR8Q1TN8RpCRjaPw0dzp8DdvX6e1CkSlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
	b=Og4ynLT7aS0mk00oujJ/Hgm5CiaSCO26to2qdMyQxgf8t1Eski013sPq68ckTTUEOPoH
	 jGQT/8RSTjWvAxEy+Yyt7EAbK1+S0nHYBaNsafb9h570Rlqma7tEHWWEgfMlWjHXXnM1a
	 Lll9ScbMVxrMAcI7L1pN7/6PtQyjqdTZL1yY9tGXMa/vAMmCE3q903GHF4Wlo136GG0X6
	 JqWwM/fAUQ70L9xPiz1O5nQ4GlBt8qY35QbPzCAheIrswIvNbj1cDyfMrqnQhnJ1w80+L
	 DurNlrhfwjHtVaKXX7fbw3iAKBC1l++fuWRX2Qagrk5pwJq5UF/FIjpaPCjPZoKrN+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdAfWAAx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oy/jMqUw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C539D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdAfWAAx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oy/jMqUw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFPKP309928
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=; b=Od
	AfWAAxGtG6LOeHQ2KO538LPP0mZuIUNVNfnGBrB6gzHMJLRmNNyvSk/+WWJytfb7
	KnolhRZf88/aNE6u03wyIDQ+U3X1kV1dRc80M4DiLttfCB2KyN/agwO4Bci+kPJ4
	P8VA4c8aaJmbDA4NlFlF8j6kPwNwDBZocH0MNRWnHHzHOUbFvagn1A2sjgEF9Bxq
	MH8doGnDWhOHT/ltI6eKRb0O2LCteAUDHLrD13vt2kiMAO3Cl4OJDJjV6+UdSARs
	aD0eXd+ndv9DvV9z8Ivigc5DKauI5wtuOTJG0Nke8LN6+HAoSk41Rkr+HD0t3mhB
	S2u2HYqB2UTd+bO3w9vw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0mg6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:51:10 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451d80641efso1107661fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792594270; cv=none;
        d=google.com; s=arc-20260327;
        b=siIkrIMkkUdmSsZrnLu5eD16ay0KD1ogYUtQ9iTQnM0ML2n3lLGiZeCtG/8fnvjj6g
         SAq706wmpXsNA51Q1Z9SvdZ7M9XbD2EshjDdsaFhtrp5Cd9vXmdfiaqdT07xKA77nchF
         99LmvMCEy/Gd93eAs5jM5p3E9/Sqm00Yp55ZSL7hceY4ToHNXIE2o8+z+Ej4fUg9qzpB
         2rwuzHOe/Y0yOuQeIxg+7TbIbmuHaWjxQs5GspKezOsSBhLSLxLDhhMLKVeITqfvgyjC
         hSHyPu6ytpjvCnfo+S8MQCLxcGt4Pe8PIVvxl5qfUHEXm95ceYcFGHboKYFstZOsN6vk
         euFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        fh=u1JaZNcfsjQcztTu3iOiyqERhZ4Ul2p6uaFukGKY7fU=;
        b=NM/vJUVrEX1ubLisdujfE6vGNaoDQYoO154txxIM4GRaVWPziWYexoGVCpAO6M1Uke
         bsTCHEyH1SglmuT9hlvt12DudMRSj+h78PBuuz4anEB3IHGCBKTBY/KAFUs6mVDsXTzX
         Mr2jrCvgDInqP0yn24gn8ZX1hQp/n7TSXae8zMz3uamceuBJueFLfwCd7WgjqVxqn5nn
         21IcDZyXKStRRNUIMOUPj+id80PzFZ0XGwky7sGxsC4WSvBPQ2UngxEbfbZAdHAkdOu8
         SGNKBmzxOmFWPn2BtnkjtyV+YIBJjV6MzQ64rz+edEy/9vbc/mRTMok3FKFCp/3LZErW
         N5ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792594270; x=1793199070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        b=Oy/jMqUwlUJvrxYI1whh1d9hZ4e/nTPlj1WnJfVT0+Vn59KY6WS8zeaENyXyylNRB2
         oJzGRi+H2rX2L6gu41BFaNI4lZ//2eEOEx0Sdg6smrclQSxLF7zi/dkgQ0gC4rawZKaI
         hDdUrxsYbOAeC67m2gHXet6ksqyvgKgeVXHfjMqN7esGd8SUfarZP8JNjbOzzeumI5aZ
         oFHL6YXn3VeMWoz5OfJbRoGt0wp9sYnnhonC1FqBwvt6Ejq5m0Zr6MWMtd0vv0CvaqXj
         7xy7m/TF/vz2VG/KBGBEJS9aWwp+Gf9LNxi7K5q/Dc1rsCjMp66FzKjVYR9Xr2QhvJhF
         koqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594270; x=1793199070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        b=h/P4KyOhYuscDDS5EWMsMGJXrWyZmiO9tCFrUcYV/VYPrLNahcDG6OmUwr6hkeNC8W
         Am22ra7ZTtiQ+yJpPP6mHdfEi3EieqBBDaki9mc5EsCuB8rRFfWkjfjDEKX08A0UtRW+
         2vppaHDaP7Q9bGKt7ebXoMiP6sCLamSH0NX2X0oJldV613+dksNFCGotdzeC2HBgkdMZ
         +1+9xmVgwJa80V4fEa6ivz737Ls9vO7Yf50AqwJW6w8c8f90P+pZYYIJu7yCSGwkpErm
         ImWZb6oGOzwPCc209aLabNzUB34ixVhlgD21uOGlRFlRdXEZz4TvtZFcsVmUkS7bNB3T
         /fbA==
X-Forwarded-Encrypted: i=1; AKwUvBzu0Rc9iThTvenXHMKGlrqFz5hzABvbGqp7d/3U5tGMuCdkw3WtrUMru1eWTRogl/rv0XyqhZo49E+zTJSY@vger.kernel.org
X-Gm-Message-State: AFq9FYLBMCQ6YaEOPQappd/3JB3crX7aPbjGepw/dOesO7AMA1HjKUFl
	2K6xyTl5rultUiHP3LvS16nA80SXf+YjP5cx0nHUZlH2Z9phTRXzhzwIdsybpGq2ypTqby0uYvX
	/ZANvFJ8EI7e7qBHd4s4TcWHQxjSaTM1vBJAqmnm3omjg8gHpNVyZvVcaIjrU51CeOiA1yQHXoI
	rcQlY6IG3ImlNBWQh00p7BP3fY7e4kBMSri+vGq0+AdgY=
X-Gm-Gg: AYBFou1HMsH31ke8GZUgZJ68/vfjLnnspV/OJJI4pS0/EQzb++qK15R4V6FYYwpfBmp
	bADQq5KbO8XE5mn3cbaI99KWA009IhFdoa3Nwt8DFpQBMyIjsF7kjpuKsTJnalj5X5d96GLoXHX
	HQa3ZaUuHZJJV/O4g4p68ASfSaDJfhU07LzuWT+7tnZkmZ9DTi16F+aP84xQ==
X-Received: by 2002:a05:6870:4e88:b0:494:b8f4:9a22 with SMTP id 586e51a60fabf-4a7dc1f1813mr1321146fac.28.1792594270136;
        Wed, 21 Oct 2026 07:51:10 -0700 (PDT)
X-Received: by 2002:a05:6870:4e88:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4a7dc1f1813mr1321121fac.28.1792594269645; Wed, 21 Oct 2026
 07:51:09 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-7-robin.clark@oss.qualcomm.com> <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
In-Reply-To: <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 07:50:58 -0700
X-Gm-Features: AclHuK_273K7JWxAwm9ju6BwL2RphOQ69uYzozmpnUfx_cbgda8C-aejWgJFIyU
Message-ID: <CACSVV01Kd10wFrPKaG2GgcFoTuCXT6imthSUbbtBZ--zQszxtQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX1yLqy8TC0iwz
 E2+URHfSz6hs7ElOqcdyJHaPvC/28dXp5CIYU+TXa9XnFLIjktpGrqBcioKNaGQUzIiduFUd3uY
 bgc7vUNP8+xpRjR5fyKcInDYdc/uTvKViFq0egOC0JS9JnQgUI/DfFbLMCM+5trjd5upMyJQibF
 p6RHdvo53YtzIrkVMMkRq/BTAt4FO+tf3NjMESj2QdP7mk7H/8oQJQ3oGspHIusKv02+Z1/rvX5
 10Ou4ArOJ8JQt88qqcRqQ1jnMYbLxG4uAXZmYhGWyJNffLYQ7KhtZEVjgCJJXvHItU+hmTSAUDA
 ngKlWNylcQhIo/zD78cf5QtEIjblax+aWj6mc4MKz72jG7mnpHoFRfF4R5vGrd5V9u8YL7/dqB+
 EyWZdnJ4SI1UDAAiV2c1TUKqATPhPJx+rIhYV6wDYhyH0IN4TMs+dF2I/yXoy1SGe7qXLwMYKdU
 qm353KX4+YNpcgvcbtw==
X-Proofpoint-ORIG-GUID: PorzImVYFKK3sXoLJar0-iRqUoYZAcxC
X-Proofpoint-GUID: PorzImVYFKK3sXoLJar0-iRqUoYZAcxC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX9x9Wo3ylPtEU
 ssGF4KoFipJAixXU6QggGboQSxQcF8+0h3E0vkcCRWQWbPgGeX+cvr4SN6Mt59vvHuhvuj/dS5c
 xgk8GlZN8rpDRBos4iF+2ouHBoXHeQo=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8d15f cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=A5R5xhKYohY9jtTwzVoA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210059

On Wed, Oct 21, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 10:46 PM, Rob Clark wrote:
> > Don't let the length bleed into b31.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.h
> > index d60cbfaa0d8e..5e1f35c83d63 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
> >   */
> >  #define A6XX_PROTECT_NORDWR(_reg, _len) \
> >       ((1 << 31) | \
> > -     (((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> > +     (((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>
> Time for FIELD_PREP()?

We have generated builders, ie. A6XX_CP_PROTECT_REG_BASE_ADDR()/etc..
which would be better but they don't play nicely with tables..

BR,
-R

> Konrad
>
> >
> >  /*
> >   * Same as above, but allow reads over the range. For areas of mixed u=
se (such
> > @@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
> >   * single register
> >   */
> >  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> > -     ((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> > +     ((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
> >
> >  extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
> >  extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;

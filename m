Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792598753;
	b=X69oFqZ3rI6WL2sUbbQ6MeZ/35bc+kfikvvGiO9eLavO8UARbV5szGUlkiGY6YqoK4F2
	 XMUpcsfqSr2O9wPhGw4mDnLmx+mfLJyjUEiJvIu6DNDqEEMU65hXf5bb8XW8G2Fz4X2iX
	 OY0YfIYQRDDx/3itHICDzOdXJAF2UBd9xhVyCgJ2VMVOZIAEttyFSHgYxlTkxeA6eS5Cz
	 aT6sA0XWMxv9cmiryFbgkUwhIbOtx0VaKfpRj6JSMy7phU094c92tGaViNy/bqixhns1z
	 E2ftCrp2mCY3iZSCLq0w1VjRJWDJpzC+iY0FaheC3PXf+wk41GyWmE/+u7EXdUyTNbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
	b=4VsZANOdhibuSFTw4lreUQacBxkKXs0QKldIbxoz3LLG0wQxXSjIHzdfgZGXNNV8viO0
	 tiraFsqZujowzLpYDT3lG8pdzNmevluftmO5JPoBt0L/0aXyRzMA+DcMSR53lwzxqv16K
	 B+4EzMy0xj+eMMSH/8BgL9ZGRT5FnZUXneTEGm3ktkKZamFtOY50w0vEtpM4oP8I8wU2C
	 iE+p7Nu/1lnXSkhnf4DCygL8b6f2Zev5wBUrU64r5sQ577/MHP5Ehwtr+/s21zlwcjQA/
	 68RXNY/8zsKEzAU2r+mqRtNFjAJ7QY6b5npB1Mc4pXWaZwoea6YsZUfdn72ygqLrpQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF+iY6NP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwRwIPlr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E0606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF+iY6NP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwRwIPlr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUHrJ684400
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=; b=QF
	+iY6NPtVXDmkFg2c754dCaLi9wBZJ64tabbPIqvCYM2hw7K6TXqh18264ncOM+vE
	zZGvgHNo+edigL6gc/1wD+g+/n35dC4k4EYCl5iEhXncVUXlZFb3+r7wY0mOuQsq
	d865b3iiJsccMFLqflj4kW8MU2bEC/3n5eDnHKh0clPtJzpaL2h4a060IXOC0iAZ
	wwn0spZv94Qv/mPqTvnnf9+e5t5g6nENhuGu6jxtnaakUdCgK/nrNpGP9iY+1Lyj
	kI9Idp3Hk+WiT+IzrQ20sygP+zOn+0fwJvLDb3McMzB8iFo4mIhAmicUmrKyTqo7
	iicxtwYBIZTQAjToK0NQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrr5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:05:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso827634fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792598744; cv=none;
        d=google.com; s=arc-20260327;
        b=UOlA/TlZN0UbnPmPmU5tg7DFv/tyTSlpISZKr7mqYUf2kATHqWkIOSQuluUWUs8vlt
         mcxih4ITjWhdA5BLFwBYVs4KkMgDZ9AqG1ieuBkrwJV3vXwxx4slkKYyJLURIwj3hEw9
         Ey8dfCvvWEL9StehHV93p3QsrtEmE7h8/9sQshDNfzCxAAseItznJjJ3yVNniNSx/uI8
         9tIFtbR+cPeS1mqLdpzl9dS5eGGjxtzgcei4UZLb2pmH4ErX4hi2aBqLaptNdjDqSeB3
         dmM+4/g3a/QWVGJ/0VQ7FWopvz1IV6iTO20C7teXqEercVK1+Q3GoR+YjCunxoe04GTM
         f0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        fh=k/vNPWHEYB4EKaf+s2E00vvT3znbT1OSk9kj6gukEXs=;
        b=SpP9pNLTVwUjqsBVr5TUNn711O/1cYGgD4SnXpR/JDvRZMBrMJeWb/puMw77bZsPxB
         CY0pscwMZ5NpgtDW+ECRGx6jBrAO2erBtlHCTmP7JlIxvtArWw68YHfM6hlLs7uBgG0C
         OBDMF1CDXqzuMq7HgxpI1n3Kfn5rttsjH9OzH31D4XtmWOjmTKx/u1xDm3igIAZUMmJL
         m9GjUsVk0e9T78niFvsp0/9eLtRCjlKmwaHzFLqmwrskYEazWpBOCJx4XQekpx1pKtzS
         /qdi8n1i5njZ8oloas7GaY8v1SD1wlqSsxtQU+ePWNHuI76+sNR9Butj3G1xMsPKIW3O
         rlgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598744; x=1793203544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        b=XwRwIPlrOAISpWAc83KA1uIREgPLn2I1ZocVUTbQrE+Z6AkxOrx3oDuvVwJ9BH6amS
         D39dPiYy9Tp8wB9b5i/RY50u8K+LUcjBRzqIJIV/VQBWK3yF79uDJiuQTzS5EakD6Xwo
         /n7DbfUugliMNVaAk1r8FE3mcQ035S0iLbEX6jrdonw3Gnw4sVBA55+DHLCO4GQBYD6X
         ycG6qWj7coP4RWsxHaZwhTLA/zonTVvZwxe+J+1e8rJhnyIJ0flY2f9oHtq4WaugvPJq
         rY9KV03k09Tm4fg0SBFRHCpabneiVMLFg8abaYt9hlbvzxsZfnWZ7Q2o7obsHo9cQwiW
         gAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598744; x=1793203544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGhrLTjEVfeSljGkSaGNfONmhTnpvkCre2s3TB8eGiY=;
        b=ot1jtr4PQfp5FNDprfI2dOcBjT8TRa729teCsNogi6TjBBEIbgZAwxDIs66KWpa/Mr
         Mv47EtxtBp08yJDQYxRg84IA3cPztD3+Rk38T1NxiGzQXF72GtXGJf74v7zsJ+QyLHt3
         E8lv/KJqkyCq1NzvaQeHxdfaC3cQU2nQC4Q/K/qKKmY508FJ45QcZjNXcMvy2fCjSL/j
         DVXi8f3RTNAVMAYdz2HpuFbvGS0IG93kNhIqNeFDk/Mcdx8aXLRaqzPwYHBaQ1dhItqU
         EzJeFqX1C0Ui/4U3ZrlI5r7VIso/I8XPiKo+CLdxDCy5RmvBkpqya6882bQIfKN+bMCP
         C7rw==
X-Forwarded-Encrypted: i=1; AKwUvBw4iWfWk4sxUrzJHex/xekAo6C5eQo9mOcBicBHVKSv7S2/KgCX3EKgNL5Aa9gbzLrfRb2ye0qcow8xP11d@vger.kernel.org
X-Gm-Message-State: AFq9FYKb7CLJo6tGzIBnH+STQ8/Sn7C7cy8Uwz6Qo3esILzRMC4ohHIh
	tLuijc1cq9yhM9I64xU+OqQA2y4a56LTnO5k/uZLmPePGanbgJM3e9aWY8Ad+HorAAmF+KhRFks
	iNfF3mFpHGhY9MYVybZ5ZpmBFCGDH0ddj3JOXB0X8JXY1wDiKlME/sGDAbPCS1/p6deLfEEuuVq
	Lxc7JXxPMU741CRRkkAQlb7Y4tcuMuRQ06lt5pnfPvB7hgDuRQc4Bdvg==
X-Gm-Gg: AYBFou39WUm0ZQOtkATZxoYKNbhYUmNaM6Kh455wGDZMYhaoILCiWRkY/AOwVb+TMxf
	ld0UFduBco5Miy2lpDsvqTLZL4rChV5m7nE2g3Zj5O+hIwrwL91eXYAn1ROkmGC8E2qnCseEb6z
	Um0swtOGoqnnGULRzYc84lnyxeXlANi7xBhJZHrsT+FdqhHKcWXwPOkLzQgw==
X-Received: by 2002:a05:6870:7d15:b0:47d:b8a7:40f5 with SMTP id 586e51a60fabf-4a7dc2035ffmr1350662fac.22.1792598743637;
        Wed, 21 Oct 2026 09:05:43 -0700 (PDT)
X-Received: by 2002:a05:6870:7d15:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a7dc2035ffmr1350633fac.22.1792598743215; Wed, 21 Oct 2026
 09:05:43 -0700 (PDT)
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
 <20261020204728.28844-10-robin.clark@oss.qualcomm.com> <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
In-Reply-To: <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:05:32 -0700
X-Gm-Features: AclHuK_bRz_aEIm5tFG7vlDWVRVzspcPQvhEeeXHkuLP65uLy6f3eGGa47m5FX0
Message-ID: <CACSVV03b9vRO6fqH4ERhpAWT_=F8dKfP-MmqCD2cT_=Gk47=vw@mail.gmail.com>
Subject: Re: [PATCH 09/12] drm/msm/a8xx: devcoredump state capture support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AiLHgh6iDnjKP1z1xXCWQjZ7Rl_Xd7a8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXzuax4VTZZoKI
 7nxIibLTOtZTfft5XVmSiM9aGpIcnt0im5XB1O3ujbrBGDkfpl9P73ZLvcPq376p6KcxcFvLKue
 7lVwy0+NOOwfWPQKROCEyrL62Z2iGX0=
X-Proofpoint-GUID: AiLHgh6iDnjKP1z1xXCWQjZ7Rl_Xd7a8
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8e2d8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Exdpg9e_d2Mu9UHmcJoA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX2avjnxJufVyg
 1Op88rmKdkBBfftTkWU/WAs+TwWNYCLTfydg8rBfmPar1BfmzroB8dteumvKnAHAXnmrlHumnj2
 0WFbPYs/fi+6IdpEKG+NXsgDLyHxe/BYrfmNxc/kYq9tTEX9nolFVN01ssOvixjRS0X9Gk9AdKX
 InvOQxIkgvnUDIeSdHLib0LRIBJlkHjQELLXkpekQL8XQXb8gKGfnW1u1XsHiLU99qbEG7E32wM
 d3NvWpu3Bvyb1yMDEpWtHPFbi02yaR32Mo2rb0M9DVA1EYEXZwSvW44Ao4Y68R3DD1kVgKRcHYe
 HnMAEpGH1kH6zCI3aidUrDTF7TUMYv4u/i5GwWjg4yueCLR0BvC+BeNQaiBL5rbGRk9JIngMNl6
 sXBjepbGN9Wj40bobOHplCWb6TJuEIP7Uz/ZBYsNP+6i6QtIwgyc/tfw1CktLzj1DptPxAS0fQe
 zK1eZwi5kuxrdkEOkvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064

On Wed, Oct 21, 2026 at 1:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 10:46 PM, Rob Clark wrote:
> > This attempts to make it easier to compare to kgsl, the downstream
> > driver, to make it easier to spot bugs or missing things.  Such as
> > re-using function names, etc.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > +             .show =3D a8xx_show,
> > +#endif
> >               .gpu_busy =3D a8xx_gpu_busy,
> >               .gpu_get_freq =3D a6xx_gmu_get_freq,
> >               .gpu_set_freq =3D a6xx_gpu_set_freq,
> > +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > +             .gpu_state_get =3D a8xx_gpu_state_get,
> > +             .gpu_state_put =3D a8xx_gpu_state_put,
> > +#endif
>
> It's odd to have 2 identical compile bounds side by side,
> I'd just group them
>
> [...]
>
>
> > +static void gen8_cx_dbgc_debugbus_select(struct msm_gpu *gpu, u32 bloc=
k_id, u32 index)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(index) |
> > +             A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block_id);
> > +
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
> > +     gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
> > +
> > +     /* Wait 1 us to make sure the data is flowing */
> > +     udelay(1);
>
> Should that be a readback instead?

I'll update to a better comment from a (different?) version of kgsl:

/*
* There needs to be a delay of 1 us to ensure enough time for correct
* data is funneled into the trace buffer
*/

Hard to say, but sounds like the delay is about more than making sure
the AHB write lands.  Same goes for other delays and barriers.  I
guess downstream snapshot is well tested during bringup, so it should
be safe to align with what it does.

BR,
-R

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793151266;
	b=oNO1gG9nw/raFU4SuuTmOf2OFXYPIR9YjYf4FAfghW9E1t+kp7ZDZwj9VSRUvgDSUkeC
	 ah16Z3qDd+mNvubYisXdtThfYTUMwS9csV3py5n71LGe9VEyIr8yCnpOO/vS0kGLo4W4O
	 Y2ppNAdWSnrX372ZLQe4pNtPUsODu2Rv8b7SBSbXAYIT/1R69wsc8peg6TbKFEZ8NyBS1
	 Fqb0NE/XYSm5LPtPorrJWw7H21oKSEApOEmcXYMp9ghRxT8pe23Usx8T5EZUtzWSyxZhb
	 wpoYb5H5aulJhOw0bUHCqK3w8OEfNmE2VeJedmqh/lyeZ4POxVZD8k25t45H2+U5vnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
	b=CmGB0acfzmgOoOm3D+swV2qEoI4wCUdCGbTn1ToGcQpx4Eb/jtv059R5Nolo2PRcQSKw
	 hu54CnZmynW1a7QylpxaY+773FoonmZHaowGY5UlkxRyxTxvDiYemF/53ss+10RO4lGSp
	 SrGfm+YAOsDbZO0TygjSlQPj7Qpmg3ypPv+85nYGUEFZrGEbE0VXaPgN8WFN/rFZNha/Z
	 ebftmI/rduakfuUnx2T6MNfVmkvQ44WcaJB4w5NnN5ozIto+L5FGupt03xbETVVAZNsc6
	 iavm2ljRkqu/8DTcFMDG5rF68Oc4ZDqR/e7xNpqo+bYSzW9+TBid4E2G3nCnokIvesQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjV8pOXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwHlc+ns;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3C606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjV8pOXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwHlc+ns
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j9GT2277137
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=; b=Uj
	V8pOXWAffqIp3CZMAyVWrXgVWRu0450pcGDimX5I66AOeUSNFIHx7xxmuRJXCBmt
	RLx+uNacyaY3hO9woAutTYamvzDszL5AOA74yQ1MpQWDSsamVX+lGSqNpk2X842i
	GDS4xWPGcDVu/Rq63IAd8U25Zdcq7BoscrJrRx+RuWvi+cX2w6SwllxXTXrQ33yq
	3iIyo0yN3CTG/i7+XRlVDUYEDxHb3gG/B/Ty85OJ33+Vh89dI4SNtl4RcIOZP/U+
	EnuV+pAsCVpuie25Q/Qf7DOFhhAmwyCi137KSJqNfN4uPS58zcDkm/UoSmDeqwBH
	Ob/iuIlDMIgBOFZt4fnQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy711x5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6df538053fcso644088eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793151264; cv=none;
        d=google.com; s=arc-20260327;
        b=ha1zI+odu4W0CimCpsl/PfkXYa3LjKxx6inYIbzzkRzwsVAqmVm7A1Qw/md7We8Cbi
         AC142Jz0oVZ19I/tzO0U4/qwhJZ9Rd29V3868FYQjZ5mpFiiUgYB9YLdkNTR0YsbgVOH
         bcO2/BzKgDW6IjsBv/KeYkbtg1W1etb88COJaCPsnFERb+9YMVHxzJonql5FllC7tpIa
         7PuaSt5M0c2/Y5MQ5sdRDn5tjEYPO9b6TolCmylpzZUPjBllytHiB+VWtTBzZsvMg/OG
         7Qy5vYNE0cBX1i0I+Wxf4rDLOoYKFLHbDtaOpASkReYEdD/vHjMUxhWFLI0t/L0pc32O
         1dFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        fh=RDO3ZWOeeZPMqKtFmN+MZeyzoLpDisFzE980hI67hi4=;
        b=hRv8L5dMu11Hcz9OUWBJ9kANq7HSZNQsHj8RmQfax4M66/m0m/87PVKLYTZFlb/W20
         uy4KfOVRVTnbstmcYILL7soa7jlHYTusNmqbrR9hd+q1YiYJOGK/jSRabyu95e3STIpP
         5jLEABo0XNH+9aXdwXcl/UXPhAn+BMnj/I4q9jZXtTJ90okU7R9Jr8c1HUDCMI+IMQfx
         9TM60YlAfCQ7AHRESHl2Q4qszYHG0UvMFH1/5og2jbzMKb0FkTr7W9rJBwCi5IYYBw7g
         GldvIDvx4SLYX8wKPyvWTZcc3iHIUVjTYJEuKqU10XiWcHK8d5idbeOFJIa4KO4PTq9g
         xLeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793151264; x=1793756064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        b=EwHlc+nsNnp+HpEs/2Gh5QPCWfeevsejgWhi33GO4s5XD6+ep5iI6C94uYiK05UTJP
         TsTmiau7yk3+j/wKTuGof2VOodjmfIJyR4PJPOaGVY02Qno/kkNhPdwi5KFTbCC5NmV9
         TsIEsRuXqgMljL5XMdG49FsTXq6j3h52AOOF4mK73ObKcYPSKH34kLGUPzYNXzpd6pQY
         YeWT6VfebngQS5u0/dUGxHPyGUMCErOxIedLFXiXhTqciLaAiCu2baWrFj4gCiflROfG
         ERNvVwdqyLrGeNYqEx1YO4CWpi//zhqoOClArSVGChyKG7pRyMac93m3dHGLTv1QXkPy
         oBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151264; x=1793756064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        b=DxtvEmqf2lfQ82E+ahKLOzUG3keAnZUqb4DcZrO1eoDnwtWvIqERw2kaWFbZfgUYK0
         P3l2dbMDaWaKtnjFzAM+MVTd6w/XeZjLp45j3QzshYxgrkBz4CyrLkSPEiAtuCuVDnep
         IVUDPiFGBI3YOx5YWzuKLD0G+GcK8HqblHSAiDNpYSt5uGpSu+tILevuSUlCRFLsh3Ii
         xCBkvIuecHzR0ZO0/L2R5o+xdMNrQ5yQdikwHsbqLZfYCUDupx0hwJUd7ReRbb5X9d8Z
         6TW5jwsBigSV/lMIQwVfDB/AbzASVh+GNfnwqDnKIvzNpDwrkaKhk6XIzr0yg86QM3fN
         wx2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQtxJ5yEi/qyIPv1tbiOXJ0fDubdC2kXU3Vvkq3qaKw1Ow8i8gku8E1Emf2DiCjN6K4/248oDdronjhE02@vger.kernel.org
X-Gm-Message-State: AFq9FYLkn0ccG/Q6PslAPQlPO7mdD6DLJ+RS2GthP2CxBZCWpsZ1vTSX
	7xOmLOw0AhRk6OyEBb9FhnSgJwALWx8J2R5tB7JHbxFmVKNSMy2wlz4RjIyT9Wfn3kG71Jrmkgl
	eXjQUWw6mLrfCbkVWucQsP1Kod1F2XLBz0eI799h/TOrFS51eoN03XPnnGGE6vE1kEK3aoJt0W0
	mFmIV07c/oDrv+Cq0jkc65JNvmlN0EUS+ITJcJYQXKfGg=
X-Gm-Gg: AYBFou2DXfrjbMR7SSpOnTiNw6vrvWaadP1qVyxMaQA7af3TE4UzKbgZKXi3KcOFoHW
	qKOnCDPhSHEzfCAiAcK0CMUon6TD8mXbsSHjcalTDtxHefjhBljaIDqY7hE+qYsdqfe/Cz6GLAu
	OW93iJL5NdpNJDnC2nm4MYhTqRPCSVzEA3EwUt8+eUbHuemAZ0e/jcZRq9Yw==
X-Received: by 2002:a05:6820:1693:b0:6d8:9568:840a with SMTP id 006d021491bc7-713ee188879mr490985eaf.46.1793151264326;
        Tue, 27 Oct 2026 18:34:24 -0700 (PDT)
X-Received: by 2002:a05:6820:1693:b0:6d8:9568:840a with SMTP id
 006d021491bc7-713ee188879mr490977eaf.46.1793151263851; Tue, 27 Oct 2026
 18:34:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
 <20261027230452.130031-6-robin.clark@oss.qualcomm.com> <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
In-Reply-To: <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:34:12 -0700
X-Gm-Features: AclHuK81DT8Al8nkBjxOqnV-fm8QFvrgKVznMTWgvFE3fwVLYN4R8IQKMbENEUE
Message-ID: <CACSVV00rXU=UxbDMCiomUKZDZOcGg0viVnnJ68J8fg8rRFXdHg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNSBTYWx0ZWRfXxdRUl7zpFQo2
 8WCreZIJMYohM9PPlMX2Iy6lY38ova67v3XmUoF56E5Ti2AudYLUTmwOi2gTmBYxXUUbn3bu+If
 FWhMvPLYiDGazk+Pgpuz8H9dAMlpdKJK4X9Tm0UAVPn8WgUSGOl6/3VV9Q2qRgbHRmalHcdwizS
 32QCgIZxuj+oncxjlj1mXkRF93/OL2S5S3S1NCeWZvbPp8h9xfD+dBxXlpD6auV7jdHy64n1w5F
 R6K7/IyYe4prjOi4H0Um2SN6XRNs7bQaxYpw60abFsJUtWAOWVrKKrsP5aZeiTdmTocdt2Ay27R
 LhtkwcGiQXpwOVpxRhxQ0y81QA1F9ayQkuH2h9KTmou5FAhvJTVgF06cAyx/ys3c5eXfesrnh1j
 e4C/JCkULa8CTDMYQH2A8LOCgZkaYPz79ImDvXckWNENgY4HbVPoiFpQ8GHJGRWBZ9W0QR5b9vI
 uh2S3b5n051PfnRRTlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNSBTYWx0ZWRfX2Pv8K0kmTJfk
 /gTSfN9b/wU+TlDTiX0IkJzvl1FI9mh8bnpwUJweMcSevY25N1xSpXLmRrp3l++GcqypXQjRvOc
 KQpNugu72r5ivfQJ5HL9hlr0R175cdU=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae15121 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qffPo4UZxZtRrYcd1KIA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 7cGvVBV1oJDh1BiBfid30OwTYAKyrxFS
X-Proofpoint-ORIG-GUID: 7cGvVBV1oJDh1BiBfid30OwTYAKyrxFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280005

On Tue, Oct 27, 2026 at 6:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Oct 27, 2026 at 04:04:48PM -0700, Rob Clark wrote:
> > Now that we have everything unified in one path, switch over to using
> > dma addresses for setting up the mapping.  This avoids issues with
> > CONFIG_DMABUF_DEBUG stripping the pages from the sgt.
> >
> > Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SF=
A14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=3Dy
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> This commit seems to break GPU on db410c (which uses qcom_iommu).
>
> [  104.954564] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  104.954932] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> [  105.958559] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  109.082571] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  109.082670] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> [  110.086572] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  111.098576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  111.098674] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> c[  112.102576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for
> GPU to idle!

If that came down to this patch (and not the earlier msm_iommu.c
bits), then I'd look to the hint in the cover letter:

This all depends on being dma_map_direct() for the dma_map_sgtable()
to work.  This should be the case on modern things that use arm-smmu.
It's less clear when it comes to older pre-arm-smmu hw.  It's possible
that this series causes those things to catch fire.  If so, look to
commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to select
direct mapping") for inspiration.


BR,
-R

> >
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index 479e5450a4dc..c2950d32c507 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, str=
uct sg_table *sgt, size_t off
> >       u64 addr =3D iova;
> >       unsigned int i;
> >
> > -     for_each_sgtable_sg (sgt, sg, i) {
> > -             size_t size =3D sg->length;
> > -             phys_addr_t phys =3D sg_phys(sg);
> > +     for_each_sgtable_dma_sg (sgt, sg, i) {
> > +             size_t size =3D sg_dma_len(sg);
> > +             phys_addr_t phys =3D sg_dma_address(sg);
> >
> >               if (!len)
> >                       break;
> > --
> > 2.56.0
> >
>
> --
> With best wishes
> Dmitry

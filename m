Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309291;
	b=ujEu9OS06Ron3oU45fAU9Td/Lsl0aeh/Gh+gQWp90n4yK1MhkxRGulB58VhsiC97HmCQ
	 YfDtAiQfiHl4PLpGZ/NObN0u+xZZdLPPUz8u213DofmMOK1MwWX0zJ6oyQK6QOo8GhMhn
	 qtJsjIwK/7p8ObEl0fzkX2HlvVcZr/CHpoFzsCIjY2aX7La1GAr2qzN74T93Q3PjDYcyk
	 +3BFaP5tggM8aeU7n/m77flusmYNxuYhYxR02zyP6al/Mnhf56IkKrTOBO065kqW9lsiQ
	 IYfe0cE62Ty2hLLzWO2ehvwdHHTtKVYhi0W6cN50TMqC/xoCvXPP1Lcrzqv47HtiKDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
	b=YmlbxCuo2IudTNeVyQqYqBp1kkwCIxXNTkyS2o2So5KFiktI65NcGl5UlN3fEmQ/h4Eh
	 gL30havRTNjmPvk++/HgZv1gel9Sy84bDTvx6PJ5qCrTrM4OS9lOglPH8NzfpNgbqkNQa
	 2lds9nQOqaDvKGz58LmghKYEGGD9M76gNnRqI+Y/AUZmQSxbfMVCfRtosCam4xC5SrMKg
	 k117d6lqeOVquJYZ2uc8XnD4ZqRx+5jYoLqhvKNPkDAn3bsuw3wGpuykwZyKbEOI3mJCY
	 kfeybp0jP6OtHYpV8Mk5ws1YbDNg+yuU/x/T1I4egpt2dfpH44qv2UWrobcTbuxXYAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+sRwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gs+MXgSH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AD606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+sRwM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gs+MXgSH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk1bu3718143
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=; b=eL
	H+sRwMds8lIU2pRZSxje2mH8cXy0k4lHgYt3eZYj2eMmHJaYgsJv1sSF56vS/4+N
	5SvNbWZ9qeQlJoCjEOrL2IvjP9tahZ6XSkXabnIP6IHKWDozYfXlMqdS0tu/F46Y
	R9/1i+ZQU9pDqvBmP9ifunmk+yvDxKp9F2h5e3QDcuVP/8LNAFEop6iC0T06H057
	ED/+uch14f41WXZLF+F+d1Mo1zZcUd9+A8woQmeIJ0YZMHP+xHOmA5kcGS3Fyh4d
	PgK1hgh5IVKS+W/Vxf6Z6cuPop3I88u6BpJvM793eztZvI9Jvwldc4cefYsquaao
	8oHchG6IaAGfe2WphqJw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b37jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:28:09 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45ecb9dd589so43362fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309289; cv=none;
        d=google.com; s=arc-20260327;
        b=ftI2JQbKhQ/Myva4tgrLi6u6Tl/ya8nEgEopox1B0w76eP3c+KuwcDpmjR9tH/52Zc
         uUOiwtx4h7Cd3K8QxcMvciG5Qseonrqhk1z7ypW0TqvihrhnIaAwEp+8m2MPI4INMEch
         QcijUmz1wOG0IMqSCls1AmoayDtBl3HIirxe/3M3npZCA+mRvqrI+E/9gKo+dwXocDsg
         Uh/bhg48GW5FlJVvuX5Ro8u6Gt9QmmAYbPUlnHdrR+kD/lUcjy1G6hyerCMWfBPt6Gyj
         coSP/bK9N7V/+osEZyNNDoXRV2QT3QZcA9RpTFqBpF968bKYtvW8M1c0H+vsoqSyRcjo
         awKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        fh=khoMliQI4PUA3W14P1xJJnSNM5nQbgtp2w81rpSfGPw=;
        b=Y91hMFmHGa2VZk8tkAmT7c5HgDRzGPti06gN6oCvIIKhGXFueH4oiSwvr0C+xFn7r2
         DZNu9V99oqxpIXCaDkwxgrogIGIyP6i9ruRpdSzgUjZ2lU+AJsbMtYRljJpjyLoZJD4e
         wqXuITj3SX3ponBkymopphd5zEHkKWUWcRS2GD4h5jQ3h4o8CRa4IfaueaTEZ6f0711p
         6RSk2IRJjlgJvXuD1CKSeDfQHZr5ejxkF5oNBI/Cb6UdyNUiiHwgC7uW3QhgNPK+HsN0
         2FBY633zpiNxozNLtTlJ7IAJCQgFWedSPgUeblPkXg9ao5US3BPh5DIQbLb3tcHxrIrK
         WFxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309289; x=1793914089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        b=Gs+MXgSHCld692dSyGYFLZf04y4Y3twhUU7p4kXKrDAmOmuqkGoJtFW57EHFraSHmj
         +0o//5RbgS1jqguIOp31ZlIBIiB3uMLULvQ1wmEMeHRnmLU/bui5/fSTboVDN1pY7bAq
         XlyHx/R51mezbPcZz9QhcbZ0DqBWwB5ObE9PI2eYtS4t/NZHA6YnCU1xQ0vRCauId2+x
         QD673eYQ0fLlvybedWanUobFb+/2ogtJ5iN7RjMs5IYHUG5jBI8VQJQ8lf7PGf869Rym
         GqifkNWANAQ3NVxS1BR/+Z8OzgytGEZxmtTFtTmCdReIip+vyZ5mS2AF930XTgODeKsB
         rPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309289; x=1793914089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        b=gdydiljvLPGWkGSlo1G25kaW9T074dxVNFfkeoUUC1vZNTxtw5nxWQZz0yFEQfV0u8
         puDs8+99VbjGyZPkZCjgg0OHhuogXOXId0tlbjtKb9dxxrLxEEtWhTDo/3mUV/7fvswS
         mjZX94FMhR4iBbXXOkwXsgUyL3O3RO82VMpLefS8KktDgTxgd0wThTEqlmFJqHwTZ7uh
         VH4mOHtEGnfzvejd2vo2N1EHGe/CoCYWpCGGzjukJ7VQ6witc1T5qYVWarscZrwQZ/6y
         B+Tg6niMTWxG2KBkeQx66ctY4hx+VUCnlD/u37x4XfLUVD53RBqM++/h9WNFKzNLkPLN
         PjvA==
X-Forwarded-Encrypted: i=1; AKwUvBxbPHvwaeeBkNKXE9xGIo1JhnoLgjSzwW0aeolGhQ2xHeXsCzcN+nrMJpoqvY4pfQCipXowRWznIIfRy/jp@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1v6SHM6ru30y5QJkNcThUWVLp4ZnRkX37JfBbcMWGvmgFtP0
	tAk1WznH9ITcBIpGG3Uiuv8aMANzFMIHGv6eJvsTlIV1EWNk90bIjer2Qe46Y60FcSZZuCRxb5y
	ZNy4cyQxxwmnGYyIY2f9E/EPEt1fDK7Y5SCz39h/a0mt8OJFaFOY3LMrCzYuHt2KL6Q3u86qwd2
	ju/UzFnKdqLuZv8redq7Wwq3rs/vMtPlgjVvtdlwAldyE=
X-Gm-Gg: AYBFou0kujXw3C9Yr0gyYH/J9TAV4M9he9IClgUZw3oxzgx4+k88QsCITUuJGu1YJSM
	PWzJ39KGPZ8qigV0Ux15YUSLZ23+eDfs3H+hfX7u2MB1dbciJnc8XRVH1qAVN+tPgeU6xiF/jRK
	Z5ZQvLh0iMJSeT7Zpw1h96ni945SCVQduqizkS9RJr0cL6/kTGHsZIRGL1DQ==
X-Received: by 2002:a05:6870:b2ea:b0:475:e0a7:9f2f with SMTP id 586e51a60fabf-4a9076b1101mr271986fac.29.1793309288695;
        Thu, 29 Oct 2026 14:28:08 -0700 (PDT)
X-Received: by 2002:a05:6870:b2ea:b0:475:e0a7:9f2f with SMTP id
 586e51a60fabf-4a9076b1101mr271973fac.29.1793309288126; Thu, 29 Oct 2026
 14:28:08 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 14:27:57 -0700
X-Gm-Features: AclHuK-TjUdlKoZnZG8f-CId0p1yRIAAyh4tUi1yT-oyXKhj7rxF2iO9qh7KDlc
Message-ID: <CACSVV03_=bZxh7KuQx7qx+2fZDDKv67Yn3dVu1biBG1s=J9+KQ@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX3KP4gap46d5e
 5zLRMCsZAyrBsqbRdUJCff+g/64kJqQykK7xZoXwJwR+p0jNZ37E7/lueAicDoVTYuU5i5e1muS
 tY8DIhYMjrKFKCX9jbEjzLByD7Day5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX3O7X6vfQ2Q7Z
 VIgOxuECiCcYrUU5ZT6Bnrpht1zkSGvPve2HfTYoaWMg2rt2zpJHWwkeXpUn5lWu97bmJUJIq76
 2puEvanM0XNDGZgP3gCncj1b665XAGPR3/sqJMWVuiqGeR85MjJLiLTQeZPYpJx4E060PxlZTKb
 bQ8ZOcArrAWQ/U3rZT8PzTTMfS8wD7rd3WA6RJbNaUsQQXi7Xml7swiLKMWNBzocfPOENiaD9iA
 /fUfwFf37Z8/bitGHDLg9NdewB1smrf3cg6O/3Sv0XwZvqB2LCDDC43/CBY0HH4j90AuS99hwYI
 nclH7pIbqbB6KRJqdWdfZ3sTT6RYXLdwHaGFCS32oBWJFsblvFmQo2Vcwc5VBuxdZkPOVGZoPfJ
 tnRtCY8euDMQA4Uq0xbIFTXNBrfsZqAvIZwoVEVeSZl746/niunzjtZHb3DAYkK762ynoJfwNau
 BXW1OJb55ubbRPl4zug==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3ba69 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qffPo4UZxZtRrYcd1KIA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: uPRo_IYnRyDbj3gYBrYTM08jztJ2RE-x
X-Proofpoint-ORIG-GUID: uPRo_IYnRyDbj3gYBrYTM08jztJ2RE-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

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

In theory, this should help for qcom_iommu and msm_iommu, but untested:

https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qualcom=
m.com/

Not sure if there would be further issues on devices with bootloader
splash?  It would probably be ok for DSI cmd mode panels which aren't
actively TX'ing to panel, but otherwise idk.

BR,
-R

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

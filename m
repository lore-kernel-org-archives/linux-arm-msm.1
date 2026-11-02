Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793656523;
	b=wdxOLPr0A3IcrHLfzzPdCul1BuADPvwlsvJeqlW6hyIuZdJdw4UST2LTVtESnuWAyeyG
	 pJJjQRp8xyNIC0defCvigACgekh0mFK9PJqZ41XlwhcJ0d+q4ggXJsYJ8Eytv0FBwfdQO
	 aw/bAKjwiOTcTJnrieYKqRB5tg9IpEmSysuyG3WmXsENVRED7j9ExkDQEn5tVoAth6Ozc
	 nnfycqulSrsEdt4OoRZuvhAZDto84KaYLzF0/xJ0bQdQHq85nCc3LsQucJnau+IE48FNp
	 Wu1OdO8NncGG9HF0gc7dOjPKNSvwsZMRCetrvXwQhOgRXSPTE9EnzMkZHkk0xhoUPiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
	b=UQnM52u/Sdv8FjWzatgnSds8zKMDr7RTVyYcijLHMBzpGbe5Bk7n70ONwSdrLIyhYzEJ
	 BNbG5S7mBRst6WDLh4RfUj9lotxde+c26CNWohgrIXD7PkKP4ih6dcxG1ynyqvu80iqUB
	 M6JObxHKxNadMcIkRl/13maxOok5yEGEsNAkmYQc0NgOd/myf1oPX//r5g87V5PrqNXYw
	 UPeRezaHpAYCv4Nv0tmogb5FALtPPKpDLb/9cc1WFR5TjYZTCm/fADVOQHodqkDkQqTth
	 IMiSZZxfiO/7ef3t1mqlMYJeXNfjjk85cymYLYPqcUbVxGQgM3kPLt1EvvyS3Jt+x4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iFG/gbXs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESNrdGCb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137EE606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 21:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137EE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFG/gbXs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESNrdGCb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6An7688567
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 21:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=; b=iF
	G/gbXs4vywdlb2op5UKUfoQVuQsH8yMcM9nEoSU6ycicr6Tah6+SmKgoKWHlbd5c
	oTe3KdUw4yG0ztUBVCgrAngbcIGFF6dazGHGsIcZLU2Ur/6b2wydddoe3UU6DPnt
	nse1dREVyXhQNTDl5/f347gV472rkITi5/j5XHCFKsQgnRb/4vQmBxmaxxgAc7rH
	9EOE4ryF2jMbmKYvd4RlT9xN1HlwEv3aYWTUUnaFe5B0ow+dL+P/+TasTU8y5ZHM
	O9pC6IsO4/ehOz90Mx9k3mdCbu4GLgZg+xHD7RqLlWfL4Yrezi677hHnTjqI2F30
	UjmuutvQTnPWekcwOxJA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfebcn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 21:55:22 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4566537e644so3975067fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656521; cv=none;
        d=google.com; s=arc-20260327;
        b=APXxBH73jINDrBx1DA8v9stNtnl+hXkYrxLT6ExGD0xXdtdkvCOuyvXZPoZWat/UwX
         YpcoY5SNHMSmzFP5M1/s7wIdxc94U/ds4WfFJosjLdRaPLA9nH1TJbO2Wtb1oAG50dU8
         bPPFx9G0pTMDL2xDx68JyjOmwhSnCdqvusyNnanJjIhhK2lC9bf/TKdcnxvfa3loYgPs
         beMJ/BVjlyCSD/fIy3uDyokHAEi9EsyNsuV+Jm5PX/jDhyo8XvmqOKj6MT/mRhT4ZNP7
         yUQbrrFtFQf4qA8Kd4zOVk+w5aNjWbfphC5avyijZf7F3eqaKnmVIVesnSv+qFGkOeUg
         670A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        fh=mYcVOGJh8xkuqAEMzgDnZcDElWbiSutD1LxO05LJ+Qg=;
        b=hc6Ymr9Ks+Apo0laknNhym5F8CGENxkEHDgVlbKkj3/34Zj1WKfKBdDLofczUW3Yba
         rX2p9FLAuhZeg+Zf8s3I6iDGSM3SymVCX8EWZ+eRe2SndVgSV9Fm/X/F0qXMLm25gP3s
         lpZwi5zuX6YQx6EXM9+e/x2Gz6hT5t6RHUzqxaJ9W6lNRJ7tHffqWoKA1s68ChTtAQPN
         VRZZ2mAjn5IuVY1F1BBVrfNsT7SkaI+PbmtepoyVqD5E/C9Hea+jUOMCQ61TywaU1zL4
         dZ4SORfgEaJIkeTNOqSiTje6yQAFr7xnFbovYkLVFpWTLUQH451byTIUKgcUd/22cGr5
         Z+8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793656521; x=1794261321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=ESNrdGCb8ll+1W2LRzh5w3vfFfz3etGH+jtiIhw5+uME7/bHjrs1wsMSeE51Xd99Sb
         C1K328gz99LSyZjarVuL6cAcuufyRe+jrbKKQt+dqrx3b+Rbq8Qh/+KWAccXEv/hHn8s
         TtsWwenr7zGKIqsYxxyAnKHpoZfR1DRG5jiwsqQC5vdlmSoeAre+uB/c917L8bxbvz5y
         9badTSF9gYKAnj8qS1EDxDJ/jQbI5NV7v8nL7FN1gI5zxgCc7avB+dD6fB+9VyE5XcmP
         C00JZT47AmUeitZP8wJCTyuJNkTgGQ0Cl4pEbqMmDWClQH/72e9NELY2GV/AHjtvbQaB
         2ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656521; x=1794261321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=t9idDI6OAmJmYzzoLn4Z+XrWGebTul6JJ0RnA2JYB5Eae4Cs993h3WUICSEl9DU2lC
         ZfXy7vDr/o+XVQYDiARBVWs0ACoSQ9aKP/tRXBkVQxDN19B+/BJxJwdOKfXmlTaaXdvo
         V5DFX0MOheUWZ8Wlnzj+2PFgAuH7GyBxm0sHzLMZACSjaG8yrX0AWbcZ8pqf3jWie3g4
         8/NMWBnFXyYSUqy2MEYvZ65GgXvhjwpf8YqJWDWInherd+m4354UT7Zd5MaNnR92mjYj
         ia/aBE070OMu+E+zOmNivcGlovUkv59ksJkUj0kKc20nFnLpM27lIKG5j2L0+9n75/Qr
         NSwA==
X-Forwarded-Encrypted: i=1; AKwUvBw/HNEwhA/aqay7X7DzuAY7Vc7IQkOGrbzRpmRObP/DGcqMjEu9+FmBwbnpGblKJ1EjyC7ttssOVux0q4TU@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bxv1secVH3ItIW7BWJtVZenevk3roPGNH5vUA0hKOMcGb+UcB
	Nk4d1bjX62k9RACvdmY0Nky6MqHnyOD4e2ldjElLsX9sw1h2IUGmJRSm3T+eUO4yflZo+JXn4Ep
	o2+J11+DA6HskDf8TEqeAkPCb4DGVXOV1zUCi4EB1VgqX8rGLh0ndPuFtje4xuWEBqSiPYxwDuh
	hGDol7omkmPU9xZf3o8vRzSAtzYN5MS0btv6kezjm2sY0=
X-Gm-Gg: AYBFou0pncTV0GXP+wPL5PL/D+5X/76T9DGFuWF2hJeIRmc2jSGwea/s0CM15BAa9nI
	/n/lipirlnvUC1DbfVpeHoEyAoSS74FSyTtA4pJFy7IE1/PihysMSdg5gOsWK3EZXgL/+S9RWl4
	0dhNR/lF7C2ywp0Bb47Dyapm8fJoG+xadOAfDH6urO+KmYyqBJpdT43PxfUQ==
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id 586e51a60fabf-4a9077d5bbfmr7236434fac.46.1793656521139;
        Mon, 02 Nov 2026 13:55:21 -0800 (PST)
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id
 586e51a60fabf-4a9077d5bbfmr7236414fac.46.1793656520482; Mon, 02 Nov 2026
 13:55:20 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com> <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
In-Reply-To: <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:55:07 -0800
X-Gm-Features: AclHuK8vUilw2z840EWu19Aj2IsPjbqVTCvonIaFNq6IovHlRAiOrSo_eV_NVk4
Message-ID: <CACSVV03=CiMQX4sPp8EkL-p0+nyU6JGc8G0HXhyMK29Cw99CXA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae906ca cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=HdZ-pd3ExLc5KhsI-vcA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX6R5hQguXSSLy
 hsJhzQ3Q0n1g3popqSkj/opT2vDEBYlTP1oEhkWGqy+kDzvTkM+Yle/TgzrJC8ZK3TZ08nW1zes
 J+sRMz/MJYqrQ23Wcd8PcAyQhftae5LG4Yn8WMfLZjL0+QGBko+LwmY39a6lMFHj6HwaAajCuRr
 J27xlKEANPkAYUGz5DMWYcPQwIHEaBFidvO5woI/S/3+PRMZMNq/POGTRQsNTQ5hOa7sHXyJe2t
 v7KvZ4sRG9jrYe83Bru9ouSVxfiE5TpHJE5DxLCGi4eozQUEKVkGFweE4JMq8rYz2m2aZrilF1+
 Soz+0mpG/RXiTOTK8HEPyPfHtKNxvuvjOOOS1Yal8YScjnDZ6AtnP4ff5QMJrh29swCJYqbB70r
 UC/7qyXJTnp//2+uOFbhTdPs+9nrH3crVEPbQlCDaMFj7ry1ntTzoVHemlXMGMkW1qcXJtoayun
 XVL5gYism65jgOiwVeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX+hlD1PYhR5EA
 Lr/3b+7QafCANWFMb9zd5geEzZHaRdHduPq2tLAWB+fPfeSOl1aVZOV8abLLP+VhFC2mJKbfR3C
 8XMqQexAlSUtpNuURZPSHi7NrHttqJo=
X-Proofpoint-ORIG-GUID: kCkhzBKNLM-w1k1fwZ1wf3r8-9S60HrA
X-Proofpoint-GUID: kCkhzBKNLM-w1k1fwZ1wf3r8-9S60HrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

On Mon, Nov 2, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Oct 31, 2026 at 08:33:06AM -0700, Rob Clark wrote:
> > On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Rob's drm/msm series [1] writes the addresses dma_map_sgtable() retur=
ns
> > > for the DRM device into the GPU and display page tables, so they have=
 to
> > > be physical addresses, i.e. the device must not use iommu-dma. On DPU
> > > platforms that holds, the DRM device has no iommus of its own. On MDP=
5
> > > platforms it is the MDP5 device, which ends up with iommu-dma: the GP=
U
> > > then fails to start on db410c and sda660 and resets db820c. The last
> > > two patches give it an identity default domain in qcom_iommu and
> > > arm-smmu-qcom.
> > >
> > > The first patch fixes qcom_iommu's flush_iotlb_all, which never
> > > invalidated the TLB. Nothing relies on it today, but the series above
> > > does, hence no Fixes tag.
> > >
> > > The patches are independent of [1] and a no-op for the current drm/ms=
m,
> > > but have to land before it. Tested on top of [1] on db410c, db820c an=
d
> > > IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> > > control.
> >
> > Thanks, this should mostly supersede my untested series[1], but I
> > think msm_iommu.c still needs the same treatment?  Hopefully just the
> > def_domain_type() part?
>
> The msm_iommu.c needed more fixes. I will refresh my old series and
> include fixes necessary for the dmabuf debug to work.

I guess if iommu/msm needs other fixes in the first place, that
shouldn't hold up the dmabuf-debug series

BR,
-R

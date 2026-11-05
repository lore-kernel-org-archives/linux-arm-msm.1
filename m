Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891522;
	b=Q9XjDJcFZU2cqcPfq3wJhdWLcOKS0biL/cmCZno1jeOP9Ub07s+0l5u7bseBE7qjUEsp
	 LLC/XoTO8Cms9XelK+jINUFgpyiSYMAhs5TdddUiLdJLdllNgn5aJ+A03IttS/R4CvT1F
	 g8Z5R9eu1DjAlXyrQk40TktkVat+n/2Vz7xVSYOquU8i9/i0YkJi4nt84v+NAzpNabYlZ
	 0Nq0Yvo1rZ+66Tf9g2VXMf7RuYnmVmjtShR2L035h7LK93pvMT1OCLyAuUj/sMmst1ExJ
	 dAObBhKo+nvAS2a7dkOFfPxZKOQHWpKPjkac/7dOIIPvR4nEfQY0z3D9YSPgXKscmqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
	b=0cYc0AIfcySPFvskFWRiDpyEt2umYtHIDAOukdZubTLKPGX2N0DRB1+e7/75XBZMY8P8
	 qSzXuUnkZzu4rNau7ePc2QY4AFK1Ln+Yy83OswU4jTQnOcDkbNKZ/ZmATo1qHnWdHKjQw
	 RLRQmm8Pa85EFwLSWT8IapDiINmiI3VgXzd0bQQFWLjhUqfPvtQELuwqqJvbto3dGYs/L
	 DCRtilwzoFOKsrLB0e8d7KiAhwy79f2cTdGNgy7W5gyectdLagCYlJe4a13U/I9lWlaOT
	 bymXhT29rNa9+0D8QaFb6dULDnz8jERoxeNbzLhx0PRkx43geDsnUW5e6qOf0UBgcdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QjCI04V/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uqrun6Ix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E55606D806
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E55606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjCI04V/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uqrun6Ix
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQV2L1657306
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 15:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=; b=QjCI04V/kzMoCcbD
	nekpPVtwFjBdQ8hWq0FVWTb484XTF9yuHiaAljr4ep+hJeBVMXvndSz5iJKXpUGp
	iVzHuFmxS6SDeYx+HWPcxC4pTQpda1yhcKtzGXnpgRtxl0fJIPVxQGe9YVrKj8OY
	BQzvGgHzkiahBTxj9QltoX2/ghoV1QPB9PhoGkF+yivJR/5iTy20Nu1yI3DjAA5/
	S0tfGhtqMRNBzrycN8SL+aXDAp2hvFy0n236eH1fmfhl+mnaDs85Ofo/kQRHWkOY
	xuZB5Uor3dr/KUvYZLzV7JvLfFimGepBJxfUeXQJFTEnsexUC8/sCXKO4I+9DYkS
	PR2SUQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9cux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:12:01 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-567ac848d83so2059911b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891520; cv=none;
        d=google.com; s=arc-20260327;
        b=AoVsne6zXwKABAosS3Itt5/nhkFAKJadvb5YQBy8hl2BmNydIbrUM3Dj9tdFVNGi2w
         fMnLG4r+etSbqMUxI/TnK/B1nyfqfCZCmMZ9u2PXHHMWrcHzyZewNTntPfcGghac1PJS
         Y/izGRF+kfi3XCItwaVUEAmwYO40KJsyvAdWvbrk56gFHPenW5XFTgi+NZX2Hl514YnC
         TOa91H6JeMC1fJak6chCc/TL7NtkJFK6ETOvUzkBmTRfYeAS0YysjiaNuAP4ksA64oca
         4kQZF4AEcPVoodToHulL1XZvQ/bEU0CTQXFl6S4ruYPbqTfHB6k9HP73QH8ik1rQkOtO
         zsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        fh=GB7HtIY5KyzSzdxS73vUlwFbfq3Q1SaPW2sAjWzuJbo=;
        b=CC8tT8V8CNCDHDV7Unb1/Xtuaig6NtHW1m4Ipx6EmkXK2oDf8P6yn2qd3eFm0L6zAa
         ZjHlsVwYTzwm7a3fJi+6ySE7DVMeO/m6GXdmCLAO7j/8RiY0RP2rIFqcXzreBTeDCwkw
         Atjma+120XNUcJJfRe2YQZaSKim1TQG7bxLAPFjFTqc64U8QJEa/wRYkAnauf8Sa7+W1
         lkazOxuY1jwGqNbJmQKqBxuQVSR3c4ajmIqCmyEJBrS99V805vLDYbt095vwoPCgte0L
         7SUgblSHeJaSZEwpJZQHq72nvkeWvUGzP+1/oEBpwCCmYXIdCTue2XxC0pukXfIKmYUT
         jicw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793891520; x=1794496320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=Uqrun6IxhC8z82jKCS7j24xYh56LGmKUVLXynD92LSti3DFa6+gGmxY8xv1FiYapyf
         aEA1amQuEgrwJR/S/8yBpiva4oG70lnaT2QML/kbAcxMhRYzpqDLyvfEbJf69UtzBWl8
         ub9Cd8kkVccsQpPgDTkH64+sXNRCfyfJZy3La9x3wEzq9RY7OepdNE1D96Wqij+aoBgK
         C764rwdNPM46gln/DxznxBFNozVm8YFMcgQOrotb1uF6goMjxw5POBVKpsSkWXyuJHB9
         yA7izqCkDI5VeE8fAUgu45/mLFQc8ym6iZSSaEj/07/FnC808FJlIeKU9I+euz92kkge
         6VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891520; x=1794496320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=qQbuiwRmCWyREP2JS73/0eMXpPDNFHXaqdz4khTY26ZOwZCtmFMGS5H3yVEZxJkDQg
         L7BnXThRX9EpMZtzL2WHusufr+XH2EXKPIRm+7vcQ9ezpy1etC1u+bdHkXJb8iqRltrk
         WM1qaOeujV23z5lxH6C6HFM/Kp3on87eEJTbhvXG8K2S+iHC7VnJplsfuazB4cXbkzZT
         Mlz+Rfp5Gh2YBW+9tUOIjpn/vyG6XxG0ZZ1JhR+SmjPHWM5EpgS80QsNErE9dvEKZFnx
         yIzoI6ylzehiLk51pJoyT+HcWE+Ot9khMOkiJW1DjVAwX7MmeHaFKX98swprdSTts9uj
         q+Dg==
X-Forwarded-Encrypted: i=1; AKwUvByUdeehCXOdTV8t/kDZUkhsGGJezKFezbo9+wd6BtcRF8T8a6VvsqS7Lznu9mjrWRlDtcqWbkTa4QGmS9/x@vger.kernel.org
X-Gm-Message-State: APuU4Z8aAs/CULZes5VlckvAU63v72cCArnSWrWJ1sZr35SCftFy1ax0
	Olk0ZFjF+LnxKldDJIP50tV+1R9np2hSDAQOBnfFoabqsna1Z5cl4uCbuWPZJdRe3Fu78yzGKPC
	0TOsmiEFIzdHPG4TiARD8zio+wKNABdp1VH8V+ER6vxRQ6TZXSO5Y2xHSBLTUZcP0GrIneY0FHE
	EgWanAEjN2XsiB7RtFhIXJEnXFfJRd1Vf2GKS+XoUYOWM=
X-Gm-Gg: AYBFou1KEUARTTtsN7cOQRDspsztobHTfotIng+CmQozIBxuPtd0RQUzOT1vECBdJR1
	+cC1sNpqg5Mjifp8QYio31+Jtb7ojL1CbLUAkxsUe7x4WLfgyxbsZQ1M0q9xtvBtOJ6Fc5dP5Iz
	orGTRAHaifn03QkHO4ZFqF23szM9r3/XE80v+DmI62lv70qCzAg778kSYYoywkIgk/Dv1DjhVtB
	yVsElgqg8wyZdRMgcg/+OlRqJ/7hUrBIwvtYd52qpL7Vie6VxXIgsDATGtu3twxgJCcu4x5ZXY=
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id 5614622812f47-5640dddbb38mr15160689b6e.43.1793891520426;
        Thu, 05 Nov 2026 07:12:00 -0800 (PST)
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id
 5614622812f47-5640dddbb38mr15160662b6e.43.1793891519949; Thu, 05 Nov 2026
 07:11:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
In-Reply-To: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:11:48 +0100
X-Gm-Features: AclHuK88d_-DIiFJPT3VE6CsjWU_UolOKHe_xA6uaq4HpdexcKU8842YSMzPGiI
Message-ID: <CAFEp6-3yTi8tnoO_W_2pZZds03qL1TMVX2S3H2xbU=LALtgy5A@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Use contiguous DMA buffers
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Siriani <allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX/lQKfEABx7DC
 ggxUjr5lIs324vTwZG+HIz1TGYpi/hAtZqaNpSjI9Vb4JoCCHKgHOQrNR4nS3dbsyb0I3Olw2DQ
 wwU3WTCn/w+QwHYIlNh0g3sRcCAxeLbfjrqPuAIk3qlIG0w1b9/ZkShqBDnETLWBFi1vVx3hgRw
 3/QLxwjeDT6aB5Jb1iw9+OLMdtw1BHIRnPIR/PXnLctEvSrCt8wszY3/pLWjyHt/lE0yxFW7izC
 Z1LU0HKueHy5jEz41i+gWHwgzYt5IOrcSAuHZY4mkP9IwbAwnWEncpOeZWeai2462oQEph3wS+4
 JdxP/a5nj93qp01pUmYAJkXtAkmhfXjXmp8Si+LiECjbymAM3/OqaSqGNv5Wpg0oivFl+NPXm5b
 MIc5qS1rwNq9QitNOGW+V6GGEBkyC6CfrASRa4kS32HGMVrQO5W8+mu5tAswodi1s8PfVbr8M1E
 RETKGNVLvyj2t/ZaqAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX0ZTmTA5Yai5x
 DfxCufdEEF73ojJWu+epxUrLkcoDYE5ZfokfIAhsq9iKzdTOdlMcTYOtO5oqxUISQAtSM6pvAGk
 BPMCEV8fdKC6bTLRH7yoYToScTpMKPQ=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec9cc1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i_ZfCgqcnrk0lUYW26IA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: d2aWJXkzHM2bB80G2gPz2wIBEfIyntYO
X-Proofpoint-GUID: d2aWJXkzHM2bB80G2gPz2wIBEfIyntYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050060

On Thu, Nov 5, 2026 at 4:08=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> The VFE write masters are programmed with a single base address per
> plane and then write the whole plane from there. video_buf_init() took
> that address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole plane is mapped
> as one contiguous range in the device address space.
>
> Neither the driver nor the hardware can handle a plane split across
> several DMA segments, so scatter-gather buffers were never really
> supported here. The issue stayed dormant because vb2_dma_sg gives no
> IOVA contiguity guarantee but still tries hard to keep the number of
> segments low, and with an IOMMU dma_map_sgtable() usually maps the
> whole table into a single IOVA range. The mapping therefore almost
> always came back contiguous in the device address space, so reading
> only the first entry happened to work.
>
> Where that does not hold, the write master runs past the first segment
> and writes the rest of the frame into memory belonging to someone else.
>
> This recently surfaced as patch proposals enforcing contiguity in
> camss itself, walking the scatterlist to verify that the DMA segments
> follow each other, which amounts to re-implementing what the dma-contig
> framework already provides.
>
> Use vb2_dma_contig instead. It guarantees that each plane is mapped as
> a single contiguous range in the device address space, one IOVA range
> when an IOMMU is present, physically contiguous memory when there is
> none.
>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video devi=
ce nodes")
> Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
> Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompe=
ia.edu.br/

Feel free to review either this version or the one Allan plans to
send. The main goal here is to provide additional context and
rationale for the requested change, rather than to get ahead of
another revision of the patch.

Regards,
Loic

> ---
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig       |  2 +-
>  drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c51=
75294eeb40fe1c1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
>         depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> -       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_DMA_CONTIG
>         select V4L2_FWNODE
>         select GENERIC_PHY
>         imply PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1=
c40ae6b2de6dc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -13,7 +13,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>
>  #include "camss-video.h"
>  #include "camss.h"
> @@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>                                                    vb);
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
> -       struct sg_table *sgt;
>         unsigned int i;
>
> -       for (i =3D 0; i < format->num_planes; i++) {
> -               sgt =3D vb2_dma_sg_plane_desc(vb, i);
> -               if (!sgt)
> -                       return -EFAULT;
> -
> -               buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> -       }
> +       for (i =3D 0; i < format->num_planes; i++)
> +               buffer->addr[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
>                         format->pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> @@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, str=
uct v4l2_device *v4l2_dev,
>
>         q =3D &video->vb2_q;
>         q->drv_priv =3D video;
> -       q->mem_ops =3D &vb2_dma_sg_memops;
> +       q->mem_ops =3D &vb2_dma_contig_memops;
>         q->ops =3D &msm_video_vb2_q_ops;
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->io_modes =3D VB2_DMABUF | VB2_MMAP | VB2_READ;
>
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-camss-fix-dma-c32288664dd2
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>

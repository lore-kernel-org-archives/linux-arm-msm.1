Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278881;
	b=rIKHKVPlzAYKTSLv5RfbkawNIzvx1vuE+KDoJEwJ5pdwoyYxzUU+Xp9m7vKMyh+YzUfK
	 EWRdLbApAy0iCL0X8ZZmA2Po2o5mqPSZEgw8lIQBrN9JnKcW61SpZMX30d+ZUfgB1mOpu
	 7XPRkmG8ERJtZ3ZQlpXM7VbUq94hECQQMVf1Ms8C+Fh7IMV2OSJvJTdtQuyUEA4LDS+w8
	 K0v2yPRZEYS/UCwsOewjU5fP/NG74uiDpeS3lC5XAK4GW/p3ROAPa/EbG9geC20WcaJnB
	 Yw8/BSO06Z4fon9lB/0iR03OgbrTUobnNYKq9TkN53VGuLXKMtm/tCjuPAsqeA5r58Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
	b=EHvSZIFUZo7FgO4xYQ5gwsiOlrstXD3XD1AkYTctYo6BNM0n5Ej9meA6Z8lzOx9LtQhG
	 cAkuEFfiKhVdNzmcVhgTv2gFYWd9ml3hX/8zSfXBfUUfdHehPRe/C/ckPyU7mqVgIGRZV
	 n4g7OKNMzERBSsoamI/7C3K+q/8BzsY5HhIJUGKCkGKOhs/236qXzUNXNi7YjZL0ppKDV
	 /ICXZ18sIDjM9dUDEt+kxdmnzBkU2wbkReoETKhf6AozuVL66XWyUoEd2Yn/rAliHcG/U
	 qkP7dbJk8ErOWIdvFvoMZ0W6WJbDz4nFKbE26CAhQmglQKyq0I3x9TkPll+cZgMJCAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnHMbIXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D472606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D472606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnHMbIXN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdxOg067948
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=; b=ns1FYDU279IfpQgI
	5Xn4h2MdKmuH+/u47439F3pYrN9ZIfaGfINpAuaShNOCWkF4Bc0lRzVXnUlIyHYL
	E2xPmefscZQNq2QupAGPPTw1/XQDMLZQgN00sIkzhP6/cEbKOwFoYwCYCTIwcNfL
	17hidvGCkZFvFOWUF7ZkuhXzVLNW4x3g84gAJIyArxWiz0czk4S4WucifBOn3qZU
	65SZY7arYllhpmon8p1Fh90/PzWxPNUv1QyG/nRo/DRCgbzNFf76+88UV5G6JNPc
	+eYi3U4KNCe+BOtxD+8+jCxgjp8OHbrpwVkpsNbyidoqq0TYmRJgO1GEB0r/WMBQ
	h+bOFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso475880085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278880; cv=none;
        d=google.com; s=arc-20260327;
        b=RJIXXpKGZc5HX0NqKvKYlWaD9pOVV/uC5gkdj+jZdi3QvZnXRv7Er+mlwOKWNPjNmJ
         uJ/UlLOa3SUWXNUdYhUXwuDhcFwtwodOVpNSRImDwfIkb4fBNgEwMu5sJeKE/aS9UP6i
         CEkLAVZZxbAVMpB0imWKqX/YdisI10RDfhqaKsYiwtnMRs64kFwjauctqP6gQHF36rkS
         C1e/7h6GzYaCxLmgyutFTsuskeYDLUh34oMkETSj7JQE0l+KkcL7q889b1FeIKVkfNBs
         7bvkCIoHaUXmhlUwvY4UGh4nMg/dPskVF6l2tTWFjrna8gm7iYaGC18I828gaAXADYEY
         F0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        fh=me5et8LnWXPXN7udDorRrpORMIMDq0lpitcw1vHugjw=;
        b=c6+IFp2ocgwwfICxFtbAB+lnDx9Jf0c4TBVbdrXvz9nSYO6Sm/a3g+QZ2/3DiabU3x
         1j6aG5iL4AZIbeJrVbHL3LqwAdUz/DAcKlfV/B9Jz/daFKzprhgrQQmMm8wKThAqVPMA
         sC+TfGqA32dcGBRZ41DdfBnkVsoECQzmT/ZUb4rWqSwL3wOI4Vy4zSwMx2QVjxC9esuZ
         VK9+CXbcbO4xSBY1mHD2t3b877IjNXvsB2uVMn3kr+XoeqBIj83wPAmYOLPXs9swUSAg
         Uo4egFlL+gEb3d8k/yC4qZeIkOWqmo7Km6pwZdmM7dge2t4xEjCP7stIJpGZk6GnnoZG
         YjlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793278880; x=1793883680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=JnHMbIXN/f0KD8mBtIBXQwUVOIvtU45tSlnHC4zEIqN3fU182XFZYAYOESFv7HLOH4
         /GVAJGpgjiVH6+tmj81P2GgZHwqF846iSv1uqfsvOwxnhsg4J9vO6cYKiu0rv/FFDwBW
         M+4pFDGzLEQJpgJ2aPSKD6r3j2DG5nAhm0pNGmTzvIg5iV30ohiF+DH3A20hF55XvLGW
         9CjmQS2KWyOYZW68zjCvtOYpStXYoLgP2SBHh6yxKmSiJu6sFw3cX4oHEZzVw//3zTLk
         nufa11BERYCbgzzdGPRd0HOzl6Xf2JANlLLUC+RpOu0Zgm9Y/dhkZFV6LItidQ2KUOQp
         h6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278880; x=1793883680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=0ifQROagEmX0+3ui4B3VzlCJRSL2TUm4KQYTuGzTIgcQwX5tpf0okt+5OTpbyAfVMh
         WWs32NBWb8kGB85ptJTwN2vSt2WXY8KJA7e+GRIO+q0TKlR6IxSJaaWhfLUKhA8Pn2Gb
         xcaEZ5pM0VVeEwVHCMadbjlUvh2+4ZrYph2/ys5KNhMkcCbBT2+BKVY5GSZJsshnaxze
         Rb2RvP7dajSHMZxee2bfQdOpQVZ1CQl/OWwxA+xzcPQj3jCPuk+mAIEpXlkFHOolsyzN
         vbqWUxIHjJKZYEU064x7DbBAEhzHtQFRgD3JQUqzVwZWRkS1iWXF6XJ9pI6kcqBIHrEs
         B+9w==
X-Forwarded-Encrypted: i=1; AKwUvBy4yTmbtep/bCwzEE/tdO2YrzsMYJJs9H1NYTdS6Jd0fe0J8toJZzfCugw2J+cqAfnKfVFAWv+zbDyZ4XG7@vger.kernel.org
X-Gm-Message-State: AFq9FYIy2swHM7hQ4SZ6CbqYUs2pFVFOBwqFwL3rcXZRZ4KPVSLwO34d
	ZW0MMqM2Nf2L51LGi5uTB07/ls78mfm+HJITIyZ7j5zcDnnrQPx1PSoNNZqDs8ViD7eQRmvdT4H
	jUjucPgVM5mQtQQ1Y+bKX1oQeTPk8aYEeVzn15F+5z7vc22o8liiQaZfwQFedWuG9N7DOAOmyCC
	UALVLklJcU3cZJylbzE/rKGIWbEgLAO5z6TuLfDvsTQ0o=
X-Gm-Gg: AYBFou1UO6cKC52JMLqAoINGQY30SO0Ny+ATZqV5sKDIsSGdpI1cG7ZLfsFyaeIxV3W
	IxbXy1VrZ9HTQwJh+lk8EipEVsl3vZsoDEYFxaI/Qzs6Mt2+5Nqt8GMx8OIOHyBnckTZ/EyFJh6
	9Ce+frin38SGXfiJnzFj1Izsr6olFMiOJKmsNMG5q+WHlHpQg8Fpol3iHGffIZEa/5CLtAcBXSF
	Y4bckb76VPA2cE9ku5acyOh4VH27DsKepL5/YUM/XgVCuAEhgMynLQMHp0W5w==
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94408a8c3b1mr790980185a.32.1793278879036;
        Thu, 29 Oct 2026 06:01:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id
 af79cd13be357-94408a8c3b1mr790970785a.32.1793278878266; Thu, 29 Oct 2026
 06:01:18 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:01:07 +0100
X-Gm-Features: AclHuK9HHjKdAV_87O7vafl7ryiBF0S_hg2q2SY-cNvI08xHiOvoE__qojfybps
Message-ID: <CAFEp6-0sLQfiNP8e+3+ZEXnjPG4GzJSPtiyEGfG2tXt-DuptGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: camss: video: check that a buffer is DMA
 contiguous and add a prepare hook
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bBMy9NR8Bh4d8dvI33LwZ35j7b33OPhZ
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae343a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=5jp7TkJpA6SZ9Z3lt2IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfX0E3D9zooigtu
 rQQbigJptzG6eGPtJIyyRhsJvGuFdPsMh3PHBaf/x4HviYe0OLg52sNbQL8lS5kA80LmV+wSRc3
 TzSKG/4fi9EJgt6vbjQ8gBayGXH/fsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfXzkI7NX8YzH8K
 zEqqvwpczFSx+MUU/ElnMTE7x5aJO64/+1qWIC3SkCvlF/fzFJfGoEw8y0hX0KOr6xO6nuRtVtj
 MEBPbzEPYs3PBuyS71JGv/7/tm1PKH0rR4MH9NjLIFENIO+iW3DjCJ92sbu9IPC2PpIZ7avIGR1
 eWQWBZea8RSFRoPFg6Rl3HS9CObumOgBJGCCXJjMquHGZQ81tZc/sae5eEYuVt7HP9KfD4IwqVL
 cdUptWXJh0LKWCHBhBIzHrB+VPiwFstZzm721B5Tv0gs282gBetvaiRu/Q+YhJHG7k+h14t9pZo
 lt9jeiIkFPRXWGJdixTEHw2m9GVaMAexa1K5mZInrwg3s6l0pNxooZEk6btA8soD9NxW3gIDowh
 CvAVy+xAAQm39Jg0ND0XLK3zHHrJaxNIZHy3Q5zXHVFZUyEYX6e9+FbizagvVcixF4odledsA9G
 IgqOLZhCgAVijH/PX6w==
X-Proofpoint-ORIG-GUID: bBMy9NR8Bh4d8dvI33LwZ35j7b33OPhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290050

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> The write master of the newer VFE generations can only be programmed with
> a buffer whose payload is physically contiguous, because the frame
> increment registers describe one linear address range.  Check that the DM=
A
> mapping of every plane is contiguous for at least sizeimage bytes and
> reject the buffer otherwise, instead of silently writing past the end of
> the first scatterlist entry.

Have you tested the non-contiguous case? It=E2=80=99s a bit surprising to m=
e,
since the device-visible IOVA is still contiguous.

Perhaps this is related to frame subsampling, in which case the frame
buffers themselves would need to remain contiguous to take advantage
of the hardware frame-increment mechanism. But even then, the relevant
address space from the hardware's perspective should still be the
IOVA.

Regards,
Loic

>
> Also let the SoC code add its own alignment requirements to a queued
> buffer through a new prepare_buffer() video operation, which runs after
> the generic checks.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c    | 18 +++++++++++++++++-
>  .../media/platform/qcom/camss/camss-video.h    |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..027cf024f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -155,7 +155,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
>         struct sg_table *sgt;
> -       unsigned int i;
> +       struct scatterlist *sg;
> +       dma_addr_t end;
> +       unsigned int i, j;
> +       size_t contiguous;
>
>         for (i =3D 0; i < format->num_planes; i++) {
>                 sgt =3D vb2_dma_sg_plane_desc(vb, i);
> @@ -163,6 +166,16 @@ static int video_buf_init(struct vb2_buffer *vb)
>                         return -EFAULT;
>
>                 buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> +               end =3D buffer->addr[i];
> +               contiguous =3D 0;
> +               for_each_sgtable_dma_sg(sgt, sg, j) {
> +                       if (sg_dma_address(sg) !=3D end)
> +                               break;
> +                       contiguous +=3D sg_dma_len(sg);
> +                       end +=3D sg_dma_len(sg);
> +               }
> +               if (contiguous < format->plane_fmt[i].sizeimage)
> +                       return -EINVAL;
>         }
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> @@ -193,6 +206,9 @@ static int video_buf_prepare(struct vb2_buffer *vb)
>
>         vbuf->field =3D V4L2_FIELD_NONE;
>
> +       if (video->ops->prepare_buffer)
> +               return video->ops->prepare_buffer(video, vb);
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/me=
dia/platform/qcom/camss/camss-video.h
> index d3e56e240a..af046ecb7f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -28,6 +28,7 @@ struct camss_buffer {
>  struct camss_video;
>
>  struct camss_video_ops {
> +       int (*prepare_buffer)(struct camss_video *vid, struct vb2_buffer =
*vb);
>         int (*queue_buffer)(struct camss_video *vid, struct camss_buffer =
*buf);
>         int (*flush_buffers)(struct camss_video *vid,
>                              enum vb2_buffer_state state);
>

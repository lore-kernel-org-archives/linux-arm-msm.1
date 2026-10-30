Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793341462;
	b=1s09wO647FrfVkRnY/D9sFXWFhKc6T+wvDyh1yCEO+nvA/xnou3bhUspQdDGiVHhG/Zz
	 Zu9fjK0ha1B0SwYACvdORUbCm2E0J0PrzwNsKIZhNWZ9Bq6vOAZHNlLq4M/N16sYlUrNu
	 8B8xg66cNZtsEdcDt75xOrk3Rb6w7xs8nmB5rsDFk1Q/nIyQRAtJMx+7b/xeh3IIH1opr
	 gQW05dtNjVPDApAF2fSRlzdQcQnMSUA4LKk1eJFbYdJKKHK/tebFMZiqbeS13SonB1nMF
	 j0vASBo/1eU7313QFPOldsOewBryf/88keubybDe6ETMmuqWhh8/Tl7az9XQyvQ+GWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
	b=H0jPj/9XvrB8Jo1TO4IYlBEWKSqj9Y0MDrrLuIRTvG3ZdB7g6e49i68I7pyke0B/rURm
	 NcHoTo/ge+nHNg6Z99gkWgsvZMrDA+lZyn82lvG3EAUWi0LyE3vkLxqvXc8qlBoWKI9p/
	 TOZezoPbHXNsbenJXpypH7SG7enoDb57mvCLQd8Fo5JCy4i8MpjCSrsh/yCG+FD8ZsmkL
	 zX2H/nb3oHIL2qPxsAxmUD1vxLl9vR35N/dXDVHq94NPrFFExeBiQwlUyWB6Y9a/bJcHJ
	 ImJH9QGltm4v5FDOpeOcM/umgZqt72IPc2XBsjINaiNrfNasUFqg845xRlsi4GvyrFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FB606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52FB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FC9q2337133
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=; b=LuEHxYBgHQHc1NIO
	uuv5vmt2LgqZyRzjPVO9Q+0/Dt/10NaSUl5x6VpJD+N35waWAPSjPe6Qyt2o2ja5
	n+ZibBlzR4T+xRy+hEJeGWnpAyZTr+VX1uKe5TF5daTHWG+LDZOcCdEOZjQ6dp1k
	GryHYUwiYvDwf7Gs3lf/jWorIonIk0YoFQScQ+7w6p+OewSqPluAfOUE38xKZBlA
	2hhulziHffw6tDC5BJjvruIMBvXjC7Mq7snx+5t2okiLEDtW5e+pPC2EwIPKJoB/
	MTqSkXW7dzzopkA4J1KBM+2WCnH7D+kLH6BpGaRbJ7GOK16Cm0Np2h/tvXJdEyfl
	oIMubQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhhb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994567a44so628562d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341460; cv=none;
        d=google.com; s=arc-20260327;
        b=KW1+vMkM4MuecoNVyqKCTzpP9uLYrKd0oRaaQA2Zj+fhuC+Xhg3an8qIVQff7GXifN
         RbU0CC36Ca7mwyiV1yLERAto0+IVypnIjTAr8UBoIwLQ666/PqZVGz4PfdAleSP/qjw9
         kvGm0V4Q3Y+9Mpvn22EOdtfbYcxD5v8v6neRwu7f7MwWOJq3oMtvOJMtDCGTi0xv2Xjh
         u5+tiLmZOU+okk0H681ZxxRu6T+iMtwuenel9A1CWSj/nPhWnGR81Mk7+UCJZYyQ18yC
         AD9z2FsEtAA0qhnEf3hXDa46rwKPemcEq3b4bhPuWJe8tmXsCMmlm9NN3UII5UNkn2xp
         6jLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        fh=UhE1/pMn2mT0h6SjNjdlltoshqmCwJknSBa3C0s19iE=;
        b=EcvMtUiHcx2i2MPUUJ/5PRBO+CYlpQkqYWB8nUc2mDpF/t+7LNbHfUp/ik/xht2+1C
         6sxPCiQI0zb6sEDDVABLk02fPnZs7vD9EJOmvxrXo6Dyvx9ywDiD7SI6IXJ+uxfjfrOn
         JOupVTKRsGlI+IfrRaW8Yiju8h1YjbuS2SxstOejDX/TcOCggQJqXnE8Tj+2w/KGfK0Z
         JkRFAH2ZHmqFSBnAag946uueQTLIbgH/4SOS/U2fpuhppM5f3MeYGrXC6aj1n6GyM4GK
         8/cncUT3aVzOIarTLz8LU/I60WswDqIwjqqF2OZRV6lKzMicKHfQ8ziRMRljNhBSAFKw
         hjNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341460; x=1793946260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=ZAbj+QKG7qF73GtYJQbKX6MGckqODOF5BfpqXC3yCY39XkHjx3MYULx2WtflowgwvW
         WpxczLViriSg/iWx91D0PQeftcVSWXuCdA7LVu6GLQjNJjNK41kXNzaIYFzPRquKAzam
         zwvo0+d9uyE+Tz/Xegwxju7ZtvuzShIqx9top3TPJS1Grs0/AzPWZSK38Ivt1vN8PjOa
         ai9/s9X6JDnihcfxftLGadjmwoOCaX2B8BBiIbIwdx4C0z/ih7g/NnyvK/L8k8HHtQAB
         QmZXvEnnU25jmji9LlFGbhM79v00E13bKcEwoEIMkOxXH+ySrkWCidhd75Ys3noBdP9s
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341460; x=1793946260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=Am+BOJMtQLzrWo7myNBgn140VpPpqqlRD7QJvMsQtsz2Hhd9qwDUGzOnFdTO3eMkAr
         AfBhxMqsZQOh5TDCB4VK6TYAENQJ+R/bL/fAhQtStN3uJO1CEh9tLnF4fX3wOMSDG355
         94E2QUihtk3UxsFY8mPFpvX/6M6iL+WDfdFDhQ9CgRkPlpJ8jwJb8qnWidgBNWUcvS59
         BRx61ewU838cQcvwebjSmllWr1ZJYFbfzQ/XxtWlvSGSAjpU8q/snDTBK3RN45yLWbT/
         c76XtrCM2+2ksyI0cVUud508ajH8MFXRUR9F6ya0G5bbPvDdyi8hpwREl0ddF2NVULlK
         CFlg==
X-Forwarded-Encrypted: i=1; AKwUvByXFZIGibVe4vPIWAK8GTgQSd9BTjiUmE1dtZk7cHIVVFSeyBG2OO7iSWfB7AEJvHsMGi90MYm103PbXb6F@vger.kernel.org
X-Gm-Message-State: AFq9FYKDQdic19u7XB/pVOs67cBbfgEMWOw3d+QZDXgJE56Q2MZVyKL6
	5RAE4j++KVbW/LV7wHMz4SX82or6A3frwvZQ0+VD4AJVeKQfM/pfIo0dEXpYKI5OU4cw2/fn5m7
	AdEqrHiu/5o5SyrqDVFNgq0O4Qp24muE9s/8zZQNz46busJG+RCzGN9zHPBVwdpQbAqaYjeuV+D
	UXx+5+I7YGApqtBrL7AAq6FhqLRCdJj2awMDbpIrW46EQ=
X-Gm-Gg: AYBFou2YOpubGOL8KnaW3IRePz70azlD34Vu7bK792LaIbAslQ3Ti8O+YZEsXyfEuc8
	wY8mCNtmZdvZH0bSgDgqTECSUT6TxGyY0HYo9l6g29wNUhL684dXAV0IqNZgHwSh+8i1rv8do6I
	MtvhiKZ16J2PV2KOwp0c/v1NL5xw8slwbh48xXaHsKbKwDA6IZu2J60ktRnQ==
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id 956f58d0204a3-67ba4fb3d99mr747480d50.34.1793341459861;
        Thu, 29 Oct 2026 23:24:19 -0700 (PDT)
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id
 956f58d0204a3-67ba4fb3d99mr747471d50.34.1793341459389; Thu, 29 Oct 2026
 23:24:19 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:54:08 +0530
X-Gm-Features: AclHuK-1O9kBYPNB-LqEIyi8GfpH3kBHDVYJZq_uPVEaaNQf57NjdphrRbcepus
Message-ID: <CAGptzHMSY-fZh+0eOqvU9kX3hyUh5HOH91O9RX40=az5YLWqyQ@mail.gmail.com>
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4OLrZIxjgmBjl2ajIR_kCGhNkqQevbuG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX2ALBfdtb83Sy
 hOBucYSCoptiL4i6N54WKRpUOzKzDQfLD8jpH1xEQaFfet2K+hBQVDbpPaPE2m47twqIySB8d0G
 QDPMPRs6jJP0rOV/6oxrXZifM4LYaJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX8LGCC2AaPdze
 Fr9UOOxnZs+7FhqawbL+Y4M4KkUX/B2Va6H3U2lJui4BmEQVYZI91+lDr4jkpb8geB6YYlIxPxa
 1kMdxA3yjxtiCRaBG7diiPRmcfNz2C5WFhezEuaKhcL0QXtWuXFk75zfGvzZBEkJKnT2zLVdqNG
 FsGsFTa2VXy1BAkOLxahzV3wKhbpVhm4lugOzhR5uvMkgT52B42M8aIdqgD9yg1Epg265RQq9NS
 BKhILmk2iOpshAnqbx9B/2FIo7HzrqZq3x4uH4vZvLFPvuyNFSvCKVqVps+j+M0P18KdZA3XmL9
 HwdtXV0XyG+XAMmEjXzgegiQCcZRUXkbmdthBIj9M1iGnDytrwvXf0H42fZqsuGgVoq7FDVA0G/
 A727KwAmn2m6wHEjcBZYjUh+NrhEbRvXFCjkhxTta1tYgTuQ+tmjrBCBMX1f2//Q+F8AG6l7SIj
 Tfs4wVcGdcq/iwSKP5g==
X-Proofpoint-ORIG-GUID: 4OLrZIxjgmBjl2ajIR_kCGhNkqQevbuG
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae43814 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vt5zk3HvMIXgJkxpxWcA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
>
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This appli=
es
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v8:
>  - Commit rephrased a bit.
>  - Make the commit aware of all present backends(scm and tee).
>  - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-muke=
sh.ojha@oss.qualcomm.com/
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>
> Changes in v6:
>    - Other patches from the series is merged.
>    - Removed dependency on below series by adding keep_mdt_buf
>      into qcom_scm_pas_context structure as well.
>      https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kern=
el.org/
>    - Addressed minor comment on the documentationi.
>     - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868=
271-7-mukesh.ojha@oss.qualcomm.com/
>
>
>
>  drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
>  drivers/firmware/qcom/qcom_scm.c       |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  4 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qco=
m_pas.c
> index 24485dd0fa10..93d78a5c1201 100644
> --- a/drivers/firmware/qcom/qcom_pas.c
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
>   *
>   * Return: 0 on success.
>   *
> - * Upon successful return, the PAS metadata context (@ctx) will be used =
to
> - * track the metadata allocation, this needs to be released by invoking
> + * If @ctx requests metadata retention, the PAS metadata context will tr=
ack
> + * the allocation, which needs to be released by invoking
>   * qcom_pas_metadata_release() by the caller.
>   */
>  int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>                         struct qcom_pas_context *ctx)
>  {
> +       int ret;
> +
>         if (!ops_ptr)
>                 return -ENODEV;
>
> -       return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, =
ctx);
> +       ret =3D ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size,=
 ctx);
> +       if (!ret && ctx && !ctx->keep_mdt_buf)
> +               qcom_pas_metadata_release(ctx);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_pas_init_image);
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index df20773dd754..dc57c87870cf 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev=
, u32 pas_id,
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
>         if (ret < 0 || !ctx) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 879c465c4a7a..ae93f693358c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->pas_ctx))
>                 return PTR_ERR(pas->pas_ctx);
>
> +       pas->pas_ctx->keep_mdt_buf =3D true;
>         if (!pas->dtb_pas_id)
>                 return 0;
>
> @@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->dtb_pas_ctx))
>                 return PTR_ERR(pas->dtb_pas_ctx);
>
> +       pas->dtb_pas_ctx->keep_mdt_buf =3D true;
> +
>         return 0;
>  }
>
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmw=
are/qcom/qcom_pas.h
> index fb2ec3be6a16..1d132e89536e 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -22,6 +22,7 @@ struct qcom_pas_context {
>         dma_addr_t phys;
>         ssize_t size;
>         bool use_tzmem;
> +       bool keep_mdt_buf;
>  };
>
>  static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ct=
x)
> --
> 2.55.0
>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F024D6C31
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061200; cv=pass; b=oh5TREiVQWLpVY7rOtqty4y0ydKH3ooiFWr5lZHhHUwH2B3zBNhRD4yGT+OkFPmX/4pItf93zKBrPbdt4q2XpyZevWqfcbHP3RjWLW4l8/bXqkP804tm5F5tOfp7TaSZh8sod0POj7L8wq+GVqeEuB7qa+uvMnVW0rTFlE66MOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061200; c=relaxed/simple;
	bh=j+A0Ms+9qRKBqkCceSavfxiFmZ1PrjaMnHMAUYBtlEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gahwEuvb7oVBT03FKNA8ZCr9i6RjQZ44NnVFiLpERYttwmVZdc3422tZ85HGRoyY4G2Y0DbsELWTA18sja8j/oOQAOWcdp27HcW2Tv0p0gPmg187jx7jhGzgpc14YKeq1F2vd5GzkayQolX+Kyb8UDq3LpnECDUcWa7iVp1nEg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5RXaH9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToUmctaJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5RXaH9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToUmctaJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M72EfW1978557
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=; b=U5RXaH9duZX/w3Vm
	8dFrpKjYJnbM1wV24nKvWsykbt3UcnbvsNoFPTcmkVeGnj5x6rOZlUkq8fYcbeAw
	xHngJv6BMG9BIIFZt5FSv4UPDrw5cs94He98YLZM/FoqQlBJVZZdKEJgyMkvUs2w
	/ozNwweL+dN+LufLXpJD8dFeFhPxlXWM+BfvKzYzGxlU+hTtZWHDCkVYj9hUMIrF
	KP8MbnQnPX4RREkGfR/CiEaU+EJYDS2e090zweJ6xNZFUIbxZdi5/8F7YQhxvbGS
	c38H9pB0o2XI0PeSwChhbOmVeF0XwmjMpOjBQX36/oCTCbJM5/gD/hG45fHgwpvi
	90aJ1Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hj6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:13:16 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-892af0d1bcbso17024747b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790061195; cv=none;
        d=google.com; s=arc-20260327;
        b=Tu0z+iR/FTwhodMx2/RzDAAEFMaK8KN0bQshqdMoCgKtYi/d+JE52M/1vLfFm74FUN
         bmVOsQIEtRSAGwEl3DcFTqnjptpz5Izyrf04jYno5YsBIHbONvSBVf7k3tuMjVqHY7RN
         dcc/xWSO2qzN6ttEXbGV1NPOFrLuc28PVS9sx1AP+ejDqXu04O0yFHKJskwyVzesrXOl
         DpIFKAK2jB4EkECaPmh6307Kh2UgC4IDrTRi4sbd9cflyvBpaM7V3uNAUz3KrWgE4zP5
         K0ENh9dCzYqpB3RdxifFSsnT8jHxluDBwVEgC/AAlE5bd9R020/PD8A586dgEUdzxiLu
         ra1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        fh=m0IMBct3CZbT9O1wSJFdm9cXEK+RwUwTmQSa1jsXN7o=;
        b=c1P+ycjt+o0/c91pzpG94BaJPosswcK32VW87/1cJ0F+Z185naARd9VL1YnsI0VcUX
         pfTskjgCH3PqdfoU+vhu8+aVZ2dmP5qcSFAT7KSV5oObDHK6N7OXDHBDqNCvLdr8X2EJ
         clEZazPrtvffFLws+mNa3ZGqza/Jp8gZCiZXU99bbDpAO+KzBQJQvTDVjIJyaqpiT8mk
         rhc7h6ae7lWEUvbgv4o79I6QTCS7hio/4H2gIaFr7PXXKeCrtNjebBhiqWM9xI4yjrIx
         xugjTmv/G6qA/wYX7dT2nAt+7lpZXR80+4C8NNa3QVKrHEYR3IyyL5o0ppo77IqnJK16
         iZig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790061195; x=1790665995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=ToUmctaJ7zETvBGycvW1XG+/V6s+9ppNzEcDqz0kRGiMyqC9MRnMq8PrYGzObZhDeu
         I3fKQXEw2kpqAuA8B3eXoKbx+IvfGdcngm29mfPL5x/m4d2dgIyQWp8LcPgioct5XHyN
         LOOqRCbSGTNTAU0fCUWrLWjyZPnFQSN0RGyTdRoC2t4JnC/KdbO66xvBGQuZ+nOK5Cu6
         HSkKaM4skc40iMmANn5MTcnNi17PGnw+0NoBdV5PCCIYKqi7yP74WnUXjps/WV6TIzZa
         36aSiCfuirGXvqi1WP16qCVAUkHDSPgbgetfT44qsU2gzrGM46eSorjihgGAmIcCL7Jf
         LUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061195; x=1790665995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=nNfrC6zoB+kKrF24thM0c1Y4A+zq729GvVTCXBjFueWu8+unZz/ylVmvS5A0fsRoHc
         Xw8xXy0IH9e5PZ74EMvn6W/hKHCcWZoq2B9myPwlxMML6xyNAlkF/Z3NFUchGN7g5cBw
         dK2FXrcNeZWph8SBN8eW0u25AG1weuHwDT2WjGU1P6pJsMD0d1pLQy9tvFy9+WzIh/mJ
         TfXVeIaAycTAcNjXQBiFiRkiUsmW9q+kNQuFHSWCz0pnvVyYZJbq78VcUaJd6QbW2wUK
         1ArQcJFBNBsSUp7yxRgIAYkS4trcwAMXz/0SO2eVUIC5v2cBkdFCseIx4LZDR1Ziil3U
         eg/Q==
X-Forwarded-Encrypted: i=1; AKwUvByk2I4VhiEWrJRLzt2DOyQozGwaS+Da7lRI9jX1JOSKSJiIIoqvcYeoTxlOlI5aqbrT8+4+L5M9++TdAzsq@vger.kernel.org
X-Gm-Message-State: AFuF++mY2ESRRH2fWI7kvvAe+gojBFMa59pHQdVOzpGkxstWAwCdwU61
	g5ip71nXYcGIYbSptHmx6T2KZ/GuMc/8gtXPCiRDE3yak/FKozUKvs4rVTxUJVWvMJSh4Bnt/ML
	Jl2AtGf6mMttFJze+LP14t/M2NI0x27H8I7ceMYJGEvZi/kYeAsTIFx9NrGux8TDx196srpfPV5
	IpKJCBIEEbFQCnexPZMt6iYC1CogBabi4xXFQelI8QZ28=
X-Gm-Gg: AYBFou1ShKSD+9g7m09bmXPk7aY6jTNC9z1h93hJC6EjMkLSxq19mZSALPIACcy0Wcp
	sH9ifqyzpbegW4qkTlkc/ZypDdHpXooY/K1BHk2PxtbcbYLouEj8g7wOWoaIwvK4RnbLEpt6q5X
	gxpnPGMgCEk5gREqxkjnK9jxONnzSO6a0NV2Xs4DKcLGoUyeagqVf/jKIeQg==
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id 00721157ae682-8973266f5f2mr24275417b3.4.1790061194792;
        Tue, 22 Sep 2026 00:13:14 -0700 (PDT)
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id
 00721157ae682-8973266f5f2mr24275397b3.4.1790061194276; Tue, 22 Sep 2026
 00:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:43:02 +0530
X-Gm-Features: AcwNN1WZYyoAGxPuzJzO4nofpNWXk2TMHZ4rOAz-NDcRfVNFjwdYEEym-pXugIM
Message-ID: <CAGptzHOtm=k9Yo+u0+uY+ZfHcoahOEVyvvp9BN0W1jGLFbhSiA@mail.gmail.com>
Subject: Re: [PATCH v7] firmware: qcom: scm: introduce keep_mdt_buf flag in
 PAS context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZAMT_EB_DCvCUkqSEnRV7JHjMNszGY6M
X-Proofpoint-GUID: ZAMT_EB_DCvCUkqSEnRV7JHjMNszGY6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfX1PYpEJ98uhrq
 9vYr7Xwr13JEkT2EsTWpFiSOylLywnkc//o9Cq0sWyDceshed6/W6q1Dmd3dvQYxo2I+gM0ClXt
 5+zBtxDnMODqqiNO0slqg9C6ihmNYdu21g3AWujjCZ092z3BWbRurg1cP1PIjdzM3udC5Iuv5LK
 ybNbCnwbC0Pltml+ND2qHubklLTGqEfpQ/QqzI/ZIwXWQ+tN7mILnzOngkXnGK3piTMiYRYdY8K
 amoePj4C8gj2MqUHnZM7engr7J05qbQqJWLDz9wu9NSErfj+tMmzi2aqftRgdxBqp3lPtspY/GA
 VKvUfDGUUWmhpQnKgJVOcJ9Q47qc+K5ted7Yy2HQ60Lw8lXvtUdNifX4SNpQNpTABRSrUW/y1zJ
 whYgUST8GE3nwn1P08H2e7xhDnr0Xo4eq3gOpWRU9lJalobZ+rilt+HOPt3J4JyOqMsPirB14bE
 pMwcx5kHSf6IzJGVVDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfX2D0qOzEiPvlY
 k167MNaB/izL7uG4/yI4wwEDkZG+U9y7mNmtu6WUsWQeW0nxmtvMtk5oXJlimVAHfQxEsLQ0Y15
 M/CmTPFyFoMNECDXQlr46PQAXbwmWaI=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab22a8c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2ZNwESTbfqjtqxM2Y3AA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220101

Hi Mukesh,

On Sun, Sep 20, 2026 at 1:19=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error=E2=80=91 prone and incorrect.
>
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>

Please update the commit message to use qcom_pas_context instead.
Also, why don't we handle this case in the generic PAS wrapper since
it sounds like it would affect OP-TEE backend too?

-Sumit

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
>  drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 28411a76d1bf..81bb38401d54 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct de=
vice *dev,
>         mdata_phys =3D qcom_tzmem_to_phys(mdata_buf);
>
>         ret =3D __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &=
res);
> -       if (ret < 0)
> +       if (ret < 0 || !ctx->keep_mdt_buf)
>                 qcom_tzmem_free(mdata_buf);
>         else
>                 ctx->ptr =3D mdata_buf;
> @@ -664,9 +664,13 @@ static int qcom_scm_pas_init_image(struct device *de=
v, u32 pas_id,
>         memcpy(mdata_buf, metadata, size);
>
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> -       if (ret < 0 || !ctx) {
> +
> +       /*
> +        * free the metadata on error or if client didn't request us to k=
eep it.
> +        */
> +       if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 96a2436b777d..40cd0f101a67 100644
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

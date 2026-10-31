Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460514;
	b=mOTXL6nhz0mlZiGqsMTtP1GVAh78tfESISFVYu/6HildGiqAJgdArhDt3XW60Be3z08S
	 09CwlrLoki1cWJDchLv2LUBKI+u+gi24jFno9JRi1is7lpMwgkCtA/JuuZ7UU1yUTQ82o
	 uAxZoK9bYQsQFeFYqGBgfjIR/yi7WDgu8fhJoLs5OVJZpD1lnqF8TQUF5VlyqLaJ8bQrj
	 Lf07xJZqpQjTEhoJ+AjcozO0FOSXle8OH3IxqXXv5CiQAOhPgPFJLqD9xC2zR4tkc859B
	 BhkKSXs+njcvtA06p8CbI0al3rSsKSO7DVwEZF3zDNLbfQ32moVnI/D97yDy1AHb3Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
	b=1L0TqtTpAZt8ijb5qKefaxuUT47KZ2YObzN5qUjcNMOp0iQR4B6v2WgcVQkK4UVkStHd
	 EAoCuV+Plk1IMNSg8zeryerQ4qThjb1VuxEqh2TDbIKuxK/Yg9ut73BT8C7yLBuiQdJBy
	 G4N8hCCZ+KwHVOFsseSk1ATpU/kq3mh8Q9JzDWbTWOE4Vmt/RvaYjSdV5/P+Eonnej1wG
	 WWxFMOdgFgxdfDAdRzjj7P+y1O4ip5y/whn6dQRMcSHiiTkdXk4GJ3l9FsKH0fbvCFpv7
	 lMjJFLnIMttYBfQTYJ3UkEQpqzYPy+8I1xwNAFcmLIGtdhUNqz8ke4xbsqvGN6ke49A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZLNe5kD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azSBqzNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04C606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F04C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZLNe5kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azSBqzNm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD010f2202930
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=; b=XZ
	LNe5kDRdCTsgzIsQk5zfpO5sEiFbxO2CNTuFoTP5VJyXH+UhBnzsk/MNA39YdJ1W
	QWDX8I5aZ8fw3NeZvo5gYtySWiHmi/mp7rqFFMtfL0WC5IIzT21BwzompCqdxGzW
	bPk6UZtW5PCoFs4ThsuKIrPwSOxyZesizOuxU49DEVM4M/mEtXR0t2jlUnH4s8BW
	5ZfJowD+Tbo4WHJyxAZG2cFJH5ZsIjgRRKK5w94RL2VF0yaX8Q2C8YpbGWgeT1WR
	uVGY65/XjDF9At0kG9kt54DU2kBU90fSzqf2X4iBFy9YF/A3VbG1BIk1NtNcdio3
	abjjvJbQ/pqbgXP0F7xA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkhrqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-702f2edafaaso2288824eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460512; cv=none;
        d=google.com; s=arc-20260327;
        b=S68bsqVv+l/qEsXeTFZSDC62s3ie6syymL8X9sGHr6OVtz6xDI8sU2FBakUydYWkiU
         1OhH7hw6xi3JXchyA9apdHDay5wxqJidVhAMVWrBICNNJPcMpoau6ZsXgESy5orSgvj+
         Z/lA6WLFizvExueG+WmagDFmJcUaiiv7yjrFJiNJg2+EtqI7KY+jwvZCFMflvqEU/52E
         UGUqFJVoy1QyLALii3EFCPH879UzaPgIkUlEBBsWIvQto9dd6mj9PzSsmUkfTQR7Xhc/
         bmTQBv8I7nmMDqzejCSEEcMlGzsUUYIb7LQaYhgYycAkxq3vFlDMqpJzjJSIm50nXpE2
         Ocew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        fh=fUvKAagRMLRbe683s9HFz72yaC3fqW4D8O5czMf/k1s=;
        b=cK/NBHRRdeS2PDiIkHFU16O2q9EN8aNPXruCuDL8dKMMRbr2Q/GKto3vSlgDBkxANP
         D7SOIu1op2nxnqXmZUKXDjhbnmXSI7j6gVLX+VNnjzps4WVmvqJFsB71FDfxK5wQ5Wyx
         qvVgfGfxwrXxWv+KRyBnbpFX2cYm62zjBjbFx+ElwPx8hGRqYPBRcjWBzy+etiACPgNH
         13pTtx8WJnnCqEV/YvK3S+h+vrK1hCk1ozme6BybBXEuLxTzMjDbpfjiv7XNvzo2TLft
         sTN/GsNNnw8ssYf7a1+cFBxjBnPg2PgZpRTb/pM0lvCg0UhXsaRFtW7y32gSZUt0GExs
         3nZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460512; x=1794065312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=azSBqzNmpY1n7I119xAFY7GtU0a8fOPOyMwHLkRHs4l4nnxw8i/wW80tX+VzWkAQe+
         OGpShbZhKqZSeR49uhWwlJaxKNd4UWrOj22LujDcgmV18N+3quKDPOCTv64SUWL8QOQj
         9Wre5RWpIoU8VB/ndRhvfI482SEsoakwjmvV5yVZkk7L0a02IqwqDTTJ0KebBIRHwlm/
         ezrI5Vx1NhLqS1cs6ts0Fnsrtm4WHwpvZWXS3nMEMcRKNrfUGJzr9VFMwALgxKw0hQw3
         kXC/Z4LZ5pbzIiIIUSTftRaRLAMj4vYT9rtJqqLLKp2bJ3nNiUH9YEDJfn0Fdmilq/jx
         gr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460512; x=1794065312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=dQcVtggxrWMth6MWe0LAhLhMqUo7s1mghj3sQxpL4zumnWVeU19MiIpJu1C/mjLxQU
         0Q3/RKFAZMz374IUI1b38zbewGqA4UH8XnvPZhohhFM4KTYvwfFtK2hGGWQwKUHzo1mQ
         EsHX2MPnmobj44yJJpjyqwPHtJGzqsjxMhdifXXeBrVMhkTi/u78mkMKt5PU4dZJ082S
         iEAIFQeIsiDjfvwyk4qYcCefWFMDoLL3EYkAcDlhqqhYXoWaWwQMybCYzmVdddMnOZXq
         1lJ4eLA4tV9tj7PbEyQbXOK5Qbb6oBtvTfQV5YHZjTpPKuW7k4lCvr/QJm6xg9wtZhCF
         SyDA==
X-Forwarded-Encrypted: i=1; AKwUvBywHnzdzRwHKe+nJwWvIgQw7Kjj1nbWeMq3P1sgH/HPOmjBIvHkJsBuUyQh75U6G5+qArTRjeSWQ9mcWPOr@vger.kernel.org
X-Gm-Message-State: AFq9FYKvqKIrrNqkWE5c4B1pRCxeBvCruBCFjDboEqo3BkEaMQ0MVR2J
	wWLUCQCnFYVZJh/BWGhfOYtJwLKe3T/5GOkXvmMYXYtznqVLxm9BrklFPHZMnJ2Jgcsn3yfjxOm
	EtQHMwobkvdaCqHuzkMvi+yc2rLoIIevf8bhxSJvaMB3g9zH2QRARp0b6tIlgRQAtfZ/XGLpFpb
	3vcbzHY6N9jEQPY/QCHxJH1F+PlnqEQ5QFD8KbqpTfWbs=
X-Gm-Gg: AYBFou1m9BfLlCnoEReTXpt1et5HMgAihBzHWP9x/bkrzeI1Sox+jguvwjuD6qwpzpA
	n6QNbSlbVBy3ObheY8vGwmB9VCtYW8u3z/8pUE9uP3aEbNEOi9kw9IXnbBa+vM1nC7nnpwSteOY
	x9ACucQvHQ9W+y9Z92lEFe/sBVrQDINKDqp1ECx44V7fkJlfh/aX/k7krM9g==
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id 006d021491bc7-714f241202cmr2221787eaf.22.1793460511676;
        Sat, 31 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id
 006d021491bc7-714f241202cmr2221784eaf.22.1793460511233; Sat, 31 Oct 2026
 08:28:31 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:20 -0700
X-Gm-Features: AclHuK9eauWalhgtTBC2J8Fwe5Mi3Jn1yWHBYz9zSLaNIZfyReKOdimAawUMQ1k
Message-ID: <CACSVV033K2=PUfZPHfZnUq7ACmU0wz8iw7Mev6YOWJ7s+h7iPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8HnriKnKDz-QLxCugCJh8dTxLk6Z6o-G
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae60920 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Yhi7VFIheabn5aZjDpkA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX6yQofFjvXlFH
 RBlb5Z8svQo2ezGS5zAdDVGLMtXk68giCs2PqZhlonqIVrGy5gLlAc/lkbkhJJUR8ub3mSB3Wv4
 oeOx0EuUlZ4hAf4yyF/+ZVHrQ23HNpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX4wiPCHs45c02
 PvvzPXOcO7x5LpmOZeM3RBpkJ+HuIpsJjWKn8HsvFEoGjjFC95Z0f1FqxdRJaa45olDadg80Z5J
 yfOnZpviFAgpBHOszHxMDDAt0ZziknquLOVIt0z0JO4EtshFvz+l0iOfqOPYmUygkR9mDcXFwDL
 t9jw5zq8kuCcuMUF/NsVbcotSjzhLZ4I3GsBu/8IzQRiXmhCnA3Q6F6PiLEMuTDdR/SSdWFBIyW
 VyI6dGu63Ijjy0CXa1bR7/ti9pHpsZ9Zv+9gRUnJKuML8DFAaEd1uw/lxaBQHkB99HchVlBnq7w
 a5ss79FUUJNX9UMvEZnQBwlqCU8iU39MsDEKLVz6SB0hxuBA7VdB86mX93mPzNWZ81K2OvTUZaZ
 5l/IQ5lm7db55R4muJYnb2HaPmOf5LIk5coU3sm4pNLy8swgqm7C0NgaV5dXkY0HAxB+dxX+dCP
 C2E1VwYoY9CXhlPjbWQ==
X-Proofpoint-ORIG-GUID: 8HnriKnKDz-QLxCugCJh8dTxLk6Z6o-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
>
> Use identity default domains for these devices, as arm-smmu-qcom does.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 54130c32056a..4a9c4cf63724 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -22,6 +22,7 @@
>  #include <linux/init.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> @@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, e=
num iommu_cap cap)
>         }
>  }
>
> +static const struct of_device_id qcom_iommu_client_of_match[] =3D {
> +       { .compatible =3D "qcom,adreno" },
> +       { .compatible =3D "qcom,mdp5" },
> +       { }
> +};
> +
> +static int qcom_iommu_def_domain_type(struct device *dev)
> +{
> +       return of_match_device(qcom_iommu_client_of_match, dev) ?
> +               IOMMU_DOMAIN_IDENTITY : 0;
> +}
> +
>  static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
>  {
>         struct qcom_iommu_dev *qcom_iommu =3D dev_iommu_priv_get(dev);
> @@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops =3D {
>         .capable        =3D qcom_iommu_capable,
>         .domain_alloc_paging =3D qcom_iommu_domain_alloc_paging,
>         .probe_device   =3D qcom_iommu_probe_device,
> +       .def_domain_type =3D qcom_iommu_def_domain_type,
>         .device_group   =3D generic_device_group,
>         .of_xlate       =3D qcom_iommu_of_xlate,
>         .default_domain_ops =3D &(const struct iommu_domain_ops) {
>
> --
> 2.47.3
>

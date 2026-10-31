Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460547;
	b=YPNvR7QeB5ApK3qPf1ixb6Z7LMTgq9w/E6Sfa+bQeFWChjfkQ/mgreJcK7Y3CXrWYBdt
	 q3Lhsmk4R3qwt00Z4xCi5H0zouDv/fYRq8uqJJSp3TWBrIkmkgtDa6YoPSDR+jPs9HliM
	 h//vSBc4/qIzpMMJWEHXOv0bH01rtacXG/bHJBW8mcEzSYoR6493Z1isYB/9IhqZyO+5A
	 rDik9rg6qbGT9BWtGdgKGC24KEamr4oz4Y0Xh1yTzV8tZbKg9+uNK6IM3fSw4yOBU1KKJ
	 AESz9YrjYWCM0Qm8zzDB7Ka9q9AGLQyJ1YRTBdvrw+uNPTwrtZTvkRLs60pdVk8+vRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
	b=uKu4FbNKPgDWwnvWsbleFp70fsmHD3b5/2glyaKxVz/NdQgaLi5l1x5hpCI8WSDhDDiO
	 9ZSExrZXOgFwgOkqzov8fdJZ72g5BU3BZ1jk9NpqUjQcohRL4l4IIAc7YbiOJLQe6aCzP
	 TBjm+VymYZqiRHETiZY4DNsYkaiIkMhGvyr7S8O6np40a3nZluvpUCPMRKqAj3USpjJt+
	 WXE9bo+YULu0W5AI27gc4dDIi288TD0l0cxsMLzlByuYJyJZFgvvRrlUm6cvNFQ9ERJIx
	 bV+YSO/lVVbGUzE7NMv6UTc35Si4/ee3FgW3gd9r2s9U9KbmTXrnHkegkem4gjYZZGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPzPh+nf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiGbZsmw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56893606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56893606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPzPh+nf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiGbZsmw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxwPt1629997
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=; b=LP
	zPh+nfIzFd9fvW+meizE5UlI/0/gV0oPrlbstmsUtnFxGsxSoN27y+3U/Rat0TUq
	2RDrhPMbxk5+kF/bb1GWKDQo9eJ7EslmLQSFOYlBId/QwEchdAwYlIfybEOnEDvR
	1hRu8c6RXGz6QtnG+rFkhj0cbrrfRM68Ewfn9/SBKkt5jEGjsjmDnQSfIP9rL4By
	RGPafwQ4PMyiYUhc21eNPBFMuirKVTbDznmuTyNVubAt1YCSlZjsfVlrkbjyltrp
	NhO++ptbdQLQmy+3zpBKRZ2KYw+rBfIAndeAqgDTGB0YRVxuM4+9Dbk9TVpokYbR
	CQTOzgD8I62VCMLVHh3w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eh9ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:29:06 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a72bcd6599so1526999fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460546; cv=none;
        d=google.com; s=arc-20260327;
        b=dbCbAZOkKfLgzWpPxPBRJQNP88YZcd23oH9lumww82GZUg1/tx8hNH6SR/Zjl4qS3c
         OQpZOTMXo0BhVHrD9vneAA1HKvTNh+2C26jLn3ERV/cSzEy/O7X0zh32FoZxwN7LK+jE
         RYaf66KtW4xkT2gKSwOfy/yvfNs640LCTqNbvqrAtXFVNksQDGRhHpCkOeDdxmIa9xr5
         JjhsWYcNBWd3B3riBhj8JvK5PdziQ//qi52hyCeJp/Tlcv1M1qBKXc8DujPXbp9DleiB
         PVeYmVTTKJvsdXwCQ/iKawSChzWlPDiZu0d7r37z7w/hguefuRCeXKTdFo+1Vpw+PiGf
         Oa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        fh=pNwS6ePgQ4/e6wVDcfQKmrC80JeO1+OEZpBNTuS7eME=;
        b=Wd8DthT8odIoCcciVsdxvQbJOazb9ORIfPQNllzSKMs0MCeE8LiTsCwCjEpeerrxHW
         xex2ViIUS9HJmEfFw2lecgmAzO9ubldsnNroQUwMSYG0qQPI1TOgiCu/s1Ko6rpVVZts
         Q6FyAhq/QN99UO1eaaLbOS2Tg/YR2w/EJ7OssyIJJ1ADDg4OoF/9YyO5BCXQb2Oqye9o
         CKT0V1e6kGvXuJvRmv/v2Vbt/3Rk0p5dGt0hGaqO9NOnR2RO5QcW3hIHEJDL/j1AgxO4
         Ax3aqq6lmQZkJjJ8FcF38tozBCcyF1vR2H+S9/SOaD9fHnnhIbuLr9V+EfM5Xd2D7L1l
         /WpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460546; x=1794065346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=MiGbZsmw+csw7TMI6kyPwo/8tckkP/NTqbf/yye25FYvTTi/CJ2dsCBwEFj9sBCQxs
         a+UBgIbB5iaQROYKSqNEUHjFOqG2cLmyHKOuc1cpMYvObxOvkzFRgwCkgafXDHeCv7v8
         ciCkBknIN8PewCsM7XC7tueEYmJ6Bi9ZMDA9YMAskjZXIhheXMeJ1GUf02V4l6ZjxqIz
         325E+dZ7O17RDtzN5Co8HC/rnbcRyY61gl6Z2ktXlXVMsRMeE7XkkGjfgzBHmfGDZ3Qb
         gjcf47XbmrwNZvfjix+fTkfBq1e4L2NJm8xH96XaMQoDe4RNq60LGG/aMcbS1PdY4JmG
         4Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460546; x=1794065346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=RiIzBP6EU9xvwzoWUethKKMXvx9AEWqJn/HF7KNbQBoe+3L3+6EuPS/Ax+7QfdC0Jd
         pxMLZ03oMqtjCY9eYbwaniLDRB5MnG5wsmKllOaQgV1ZPgOdQd/bxqkHjAkfaLYDOovB
         cM0mu9IGm16fUnf3m4W7CPMLrGx1vFrNj0LnzXo5rYCSZUrMQ7lmHCcUjz7YH8iVeJ7J
         C3IpcPrxPp2JvgV9SV1FXBztb92HSXuiMIjrMarv4PLpSmsFerK+B03IR7ER4mV6/jNR
         JQvt0W7uHZxr6foSZObSFbCx/zAcaUw5K+WJWz2GnwxGrzeCRGEwz2UqbTJ4hwXJUlcl
         q8Ww==
X-Forwarded-Encrypted: i=1; AKwUvByz0bZRf9ni4i5I/zSe12uY48bjHWDq7CBf44WCjDflRMddDogvv0GG4nj8+vJJxPIvTHFZXyLwUDQW+o0d@vger.kernel.org
X-Gm-Message-State: AFq9FYJyvDLbM70tz45ZBRdZIPsASXEmg251D5lT2KxiFI/ckUoRGcYd
	rgCvePo1E5ckJa4YQX4EjCkjzme3jeZlDN2fNoZpkuNJ0Xkk1PA3HJV28ucsWEzqX/Eq04o91IC
	iwde0oVpSFzsKwwcHnDotjCcQeCMZuGC0sGMoR5k1Yy5qAdEnq2s7c+cX3QLBp/Z2XYua/sm/Qs
	bzg81fogaMmeI4Hccvr1v2o0Bdi0HkRJZYhcXVGJxkabnMoPMtuKVZ3Q==
X-Gm-Gg: AYBFou2hxTgzN93rqGVuJFGUGlgR0C7tWuDP2hvRgP9RYUseaVDNUjqONcybdWBWkX/
	zqR1R2wA9gOxLl4oZoHYxLI9+HfBr2s2WoCXRk9wZOLceVHazmlvY1fOJFl5R4anbDwC04cst/b
	UHqEgsGjetD7qwgyf8BG+3MobhZIzRKKMFeAN1lMIddVznzWj5GB4jXfDm3w==
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a9076f83e1mr3424969fac.30.1793460545545;
        Sat, 31 Oct 2026 08:29:05 -0700 (PDT)
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id
 586e51a60fabf-4a9076f83e1mr3424958fac.30.1793460545051; Sat, 31 Oct 2026
 08:29:05 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:54 -0700
X-Gm-Features: AclHuK8hrKHo1tqy_PdKqenLScVW9LO6f-Uam7iC-EUaQnDV6_oiAmGdMYjg4CA
Message-ID: <CACSVV00vH_tpQpDY9WX04FWe0Wf00t6ytKHwYB453Et5RP6AAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXwmPKvCqDQZ3k
 MYgsCfuTPgiE5YM2uFZPrJq7buksnl9SA26wWL7+6eqNqW2eISriDB+5qQA4v0wWKUHz3S90mEL
 6GKSoNR59ELF+XcVfCsEJu8Eq+HO3/aHPcfYstLtL5o7GplIkWmkc0XxVUsoq0MT365sEH3qJIZ
 tspjnle+pBSo4DMOv07L0ERu1f/q0T2f+v/YDFmDZAQR6bLF34O+Ujwq44aRr3DRpZD/R2xedkH
 jbFWdRZP24W7DBviSPdvApDf8kTi5JqxrwZRf8+G5vTzkvfGLWv6tCkPoweJ+h+ElQ6NnML7FkM
 ARC5lWnIrnlxUeH/NMcLtfdnOVPXknWp/xInXy2PcfM+mY90m0ZDO/dycDstPBp9xJgiA63izo3
 Lj66MYo9sxskvqPwPXFvelJpcPz1J1Df/XUTXWCh2LyNadmnsTPS+zcGhZt4H19s2ajQuIKpMzM
 gNOJKzymB/7tbwtjo/Q==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae60942 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=sUSyc032qo6c7neFus4A:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: WiYCIb-oEWxWCZYhDN9u7fWMrUC5LYcD
X-Proofpoint-GUID: WiYCIb-oEWxWCZYhDN9u7fWMrUC5LYcD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXw7OFAJMI2Kao
 QMOvBnbvQtSBH6aW4P/JfY0TXH2ZH3uP8JIMfU8fL6iWRjhU35X793WZE1lPk07BpeXNQbtWIFG
 0JxYfHFSyjuJCiwzJlZHCjVt4rgPmgQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
>
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 795e8ec7e8fa..addba9074217 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
>         { .compatible =3D "qcom,adreno-gmu" },
>         { .compatible =3D "qcom,glymur-mdss" },
>         { .compatible =3D "qcom,mdp4" },
> +       { .compatible =3D "qcom,mdp5" },
>         { .compatible =3D "qcom,mdss" },
>         { .compatible =3D "qcom,qcm2290-mdss" },
>         { .compatible =3D "qcom,sar2130p-mdss" },
> @@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_im=
pl =3D {
>  #endif
>  };
>
> +static const struct arm_smmu_impl msm8996_smmu_impl =3D {
> +       .def_domain_type =3D qcom_smmu_def_domain_type,
> +};
> +
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
>         .init_context =3D qcom_adreno_smmu_init_context,
>         .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> @@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_=
cfg =3D {
>   * there are not enough context banks.
>   */
>  static const struct qcom_smmu_match_data msm8996_smmu_data =3D {
> -       .impl =3D NULL,
> +       .impl =3D &msm8996_smmu_impl,
>         .adreno_impl =3D &qcom_adreno_smmu_v2_impl,
>  };
>
>
> --
> 2.47.3
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198617;
	b=Obg395tLHntLPvodq3qbOk1q+/JVnlTddzXj+ODtKndrevMAim2RTjZG6Jsd9ae7UXat
	 TBh/KSQG+Q4IimmOtIfiNCXXiD69NgAyGE8npkvhrQjbK17Jhezu0wUcoeM0aDhi4z+TP
	 8t1NAwCV/WLjXLtWv6WODVJa5pRXetT5Izu/ICQhiKOyvLwDmj3+k6zetYFKpyKWQD6wQ
	 /GRNndxShyRm6WWNSp1J1qgnJnzSgnbYOIhx4dEHm/skxtRNG8zM/3Qn7fdMCBE1EnmyJ
	 DNZOuIsQdeWwUUDKoGSrmt86swJJkH2DVOaBLw1KrHGqxutPrIoQdFDj6vuszzRfofA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
	b=FLWe8c9huS/2pfRM/Ukr7L22kfpdhM/uj3cgzTLvmqxp5i+gpTbYM6ukSHlDs47SMrbG
	 zt2UokVUFCKzOclwhIjgZzSreMf4ziIirNIoPyxkdtmoWPG92fTThl7sOQBZyLafW6kcN
	 VR6RjU78/7c9N/U7bYtAUZ5U0XcdbeRHyAxNcCU4VY6cbKOwxMnSwmy6LR+G7scZWjU6C
	 6jbebV0kZY6/ErO7br3CHdqrEIlwBynpDEFAHYPd03TtQ4MEFA5eK4JT8OI9+uK8DT8/u
	 YOLC2eFF0zsq5MxxWEXkNxSoTmckcDtFbukiDG+SmrwlUZJ6PRYPEOMbjWe6uHX+Duw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3DA606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F3DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3s6137883
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=; b=FpczSe1PtrDQZeMF
	xAcDEWutCYtpKyczMPByF5MOKSZUV3PuS5n+siKPN+V5sXJCpt0P98t5cpnrk+zR
	mOxHXZPp5eHLMelOwCWzai4r9W+jwX7vbl6kHe5//sq996xcgxyZo1Agqdi1gmkX
	hXRuGFqV7KWCAdVazORIDlv0onlm8L49506IDfJHhzulBpRd1ETmFY9942Log2b2
	3fdkj6gCDL74FBpwtj9+yIOgUy4vriUtjZhdZXywkeJffAVEgrcbIRSg8tc2tJ76
	VkzOwDdghTlU3+28wjC8hgyNAu5IEsNv4yROZ3dnHYtLPtXSuOUPljakbOXc/hyZ
	gCuFnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92y84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:43:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso121953685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198615; cv=none;
        d=google.com; s=arc-20260327;
        b=EOTeaWuxpTrP9wiLLZ3dkTBD+0wSWAprYYGW/Am6R+gr/mQ0trAub3e1zd4w9hPWnB
         rz29GUXPaRA/OHNfeYFLxTVZOVQe5TXlGP0pAeq292fAzOsf3hKevbH7Ua2w3NEtevlp
         ayhcePDRxuE5ffw5q/DX/nvzewCpTfdJqTem6p+crgeg8xkq4GKmGMjU18iV0DqzFA7g
         iKjAS20z8wxHVWBSg3D4pd8CpmwSiwGzHonU2HgUz4+R1J+R34MTmiCyTs9k+wgY3/RW
         dnIAHEMlmc29ZE6mDU0MOHcKXwQLKyFSfvSDuaDYhcN3v4IazP8TAfrUp8kiW2gVk1DS
         bR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        fh=Vk5ud1kfIoEazLmd7RkSYiyMKAZv/2564aztmZaCBlY=;
        b=mkzBujqodnQkXXTDu/l8WmayDkm3mdar4jhA8nF1G6uvVdwwp0YZko0GRjF/CB5K/a
         nHz7+U/gXAC50xRjkU3ktYph8OgfgccmlSHL2kStl4Qdvntv51jDffT3zlWJiiTvWlSM
         3KHBPQibmuFEWOqaGv0HVjpL+s/Noe0O+4L8+bNACgQWmAXnJZCeGDsGyhspn8vl3c9R
         ywsdedn43vigvy9vEm8myd7wHFYdTPKLlmOmm39dr4EgwrVeozXLBp8N7RweBrk4Nt3F
         P3mKmaKVza2TclBcxLntHdh7FufgfdWM/NcVGueV1qsxkoRe4eDMpYHX1DTuuAAlTZPX
         6Snw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198615; x=1793803415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=CCIit2tlHHsKedLvbjwfgWe1PgWJBseAnpREr+Li5MYk95ff3nkaaCugJjgiGZd4Ie
         V7FV9qsh36QeglwVVCGQaRYi+jH7/kYEIxIwuZ1w7uy25uIWaQ2/fItwap529vsZcgCq
         IVBiNBQtew7LThYYqD8hjQOWunlVyCWiZ6CfYMFxo5Ge28dAStW7TjxS4yQNvd405yEu
         llbT1I8I/o5yh0QLZ1EQT5uDiKED9koEEfVasG8M2HMF/GkDTZkcRZneef/ht1+C4UZz
         JACqLeRKGGmbMyq0Or8Zhy27baYNJwYduvXgERtST/AFr4djiEv7LUjt/VRBeCSh32lX
         scZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198615; x=1793803415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=P4ZV3vu5tE+NTTgJScUEtqCYWNpS+COibAdJUI8fW1Us1hvlMd6Lsij6RQbokBePXx
         w+vpLVraB6xxoqjCAtHNMQK2jA/B3RxYEIl5+eMrrKEaEN0TSHuKwHZlfJREcXXAulFe
         ZKKkaFtzVIAOP/H20u0vWxEKImNHS2tZWtKfczLMBLviwHfUdHoGV/NwNWt/b8NKnMzF
         +2NDKB9fCcmd1/gWz+GIy+Re5vAGxuKgN0iEb42WP4M2GuGzICVi3T3RzQJdnnX+cwOB
         c2wD0Rdvl6aodk01KF9+cBib6I8RJR6SmyOEXraQU4TK52ltxInIRGP2QIOO8ui7F2U5
         EonA==
X-Forwarded-Encrypted: i=1; AKwUvBwalszA4r6f7ZdG4fIpq+S9pg4+dIWY7oK3rGQOc24OMdnOBDQfuyweMQjmzxeDnVWpqmCpyHTjEGuUZHGb@vger.kernel.org
X-Gm-Message-State: AFq9FYInukH1VBFW9wuUACx3MzR6b94HAgqP0zAPdKj6GLGDg8msEXBo
	euHWHB8cbw6EbonY9Lh9sTK6OajxkSFvmg+PNxzE/wX1AS6rFtv6imrw3+yd5+I0l24LEE3M2UG
	hAAxqPV5Q5whCD/Bz4lMt3PLEhLKQguNSWGfhN+yvj52NocS39Rs3fVLxORlIFXqYWYX5HpQGkh
	nst8jjlK3wKq88JMYQIeMTRKYOfGjgNUS5EnfSi+XRuSM=
X-Gm-Gg: AYBFou2lSAedhYa+L7QZ+8ICbrape4i23++x3uRRjkb6uPaH69K9SDrgtzakrG2WQct
	BTSSo3G2USimwBfyKo7yrE2UjRey52e2/OTS9cl+8/uNwLWwDEa64wi9Kq9W9D3K+X9MnkGKqUu
	+u1jxMJHu3vxPpPS+njDmrRFl99ne3ZpMNBdcJs3K8zUg4aP0ZNgCD2Edaul2MkDukOTbuh/z90
	wY0Lg9fQAaIUUZ19KkMZotwv8UkYdDIuEfaEQDSqKTPc9OGwlP1zE8yj5Qe2KJ1oLw/JDOqHiw=
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id af79cd13be357-94408c992a0mr358636585a.41.1793198614657;
        Wed, 28 Oct 2026 07:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id
 af79cd13be357-94408c992a0mr358630485a.41.1793198614157; Wed, 28 Oct 2026
 07:43:34 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
In-Reply-To: <20261026224957.1115370-4-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:43:22 +0100
X-Gm-Features: AclHuK_taK_aMlFswRYK0_FTG2aOOebWlCbuvM81f6qI_UtBtqUvnrbidwtdTZI
Message-ID: <CAFEp6-3kDzxU3=37b0KEwGoN-e0or2KzS2RO=h-a3S4ZOdDSgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae20a17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h-S-3Q9jTzTep4s1cPEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX6QdJjBsKB4I3
 TyUkMF15y1ecqthHkraI8eqzDnHpLuWkVbAEMfS/A6gYIX5/ZbEd0l9NPMGi6HVJkKzdpJE2BPZ
 glCc5948S8EcgTR3AadzcggoQFZCDaI=
X-Proofpoint-GUID: pQKqr3XREmIr6OFqpqy21CfQUmXzPh77
X-Proofpoint-ORIG-GUID: pQKqr3XREmIr6OFqpqy21CfQUmXzPh77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX5rEakMZ0/lX2
 6nTKujBs/03oclDvUimK8Vf6JP7Q5z/qXlyDta9zzXJpzgivN1iogZ6j7YE2X6cqZFsl0aLhuKx
 kU6cHRVFZb1ZYujXwW+W+ZpeGXEHUsADdDuG0yXKJi9zQiX9fUYkRmJ1lW0ymyisEWldnepJzlY
 JAChCigwibDaKLsl2MLef8GPnOp0f+tx5/qouP+u5VsrifIGPA++fmFPUMeiSr5CLo1rHSJ0SIm
 91WI4wyS+OPlGUw5/ROg7cEM5SPR6XlV7SaKCUhR/ME8ITBcvRWr2o/LRSbfxCRoKioY/fnvW6U
 44yaOr7eHliBXvCwHIj9ZDHMqY4+EV1k0BCV5HZy3TTDq+sQo55M8jVf57LJxdIlxVRr3cfXyRT
 yxrnLdb5BWQaaXksFsxGI6hNSlsSLRV8wisAw2bVqcs+ZSB3QqVRzHTFWJRBG3O72NuFdEdYWYa
 lnEQO1+IeYFROCICIFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Mon, Oct 26, 2026 at 11:50=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
>  drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..8ecd514451d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *cams=
s,
>         return ret;
>  }
>
> +/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs =
*/
> +static const struct csiphy_subdev_resources csiphy_res_phy =3D {
> +       .formats =3D &csiphy_formats_sdm845,
> +};
> +
>  /*
>   * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
>   * @camss: CAMSS structure
> @@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss=
,
>   */
>  int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>  {
> -       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       const struct camss_subdev_resources *res =3D camss->res->csiphy_r=
es;
>         struct csiphy_device *csiphy =3D &camss->csiphy[port];
>         struct device *dev =3D camss->dev;
>         struct device_node *ep, *remote;
> @@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 p=
ort)
>         }
>
>         csiphy->camss =3D camss;
> -       csiphy->id =3D res->csiphy.id;
> -       csiphy->res =3D &res->csiphy;
> +       if (res) {
> +               csiphy->id =3D res[port].csiphy.id;
> +               csiphy->res =3D &res[port].csiphy;
> +       } else {
> +               csiphy->id =3D port;
> +               csiphy->res =3D &csiphy_res_phy;
> +       }
>
>         snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..b0d60e70e4bb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *=
camss)
>         struct device_node *remote;
>         struct device_node *ep;
>
> -       camss->legacy_phy =3D true;
> +       /* Legacy CSIPHY description implies the provided CSIPHY resource=
s */
> +       camss->legacy_phy =3D !!camss->res->csiphy_res;
> +       if (!camss->legacy_phy)
> +               goto done;
>
>         /* Find first remote-endpoint and determine if its a PHY */
>         for_each_endpoint_of_node(camss->dev->of_node, ep) {
> @@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *c=
amss)
>                 break;
>         }
>
> +done:
>         dev_dbg(camss->dev, "legacy phy mode %s\n",
>                 camss->legacy_phy ? "true" : "false");
>  }
> @@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *cams=
s)
>
>                 if (ret < 0) {
>                         dev_err(camss->dev, "csiphy %d init fail\n",
> -                               res->csiphy_res[i].csiphy.id);
> +                               res->csiphy_res ? res->csiphy_res[i].csip=
hy.id : i);
>                         return ret;
>                 }
>         }
> --
> 2.51.0
>

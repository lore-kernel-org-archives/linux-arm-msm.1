Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6A2DC798
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024286; cv=pass; b=IhNsmiinWQtQDqHu6fkFie+rl33Eyaa80979wZaELN8TXgbDqXptzdAAqFgr2cObvrziUJRHcH9bhvuu4pHpViP/sFQcFq0i+DJgZ3mRJp0Nh1HNmGhOfJN2HrA8fAyGTaWw3vV2z4USIhYiftWfUHPaPISXanvn2KMzkotz9rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024286; c=relaxed/simple;
	bh=IE7I7VDhYo0gcnWqMTBTWczlzaHH4n4GnuvfYzS9las=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkkSqswO1Q83TIahVMjiIqHQjGi7KupcuGcoiTBFTX6ljMLUZXtglMhw1Ik6he4mEh9XWGo0IRs6bL5HICPZC9r2FeeD5EqNYGUP6MRBk+m13q/6USHjm8HAKg4QIQ2Kj4nPYSKcPU0k6Oi3AA5mpcltxKaRv5ajaSJKIfsJxws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMU0vD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T381WuJo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMU0vD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T381WuJo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5HA4K320446
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=; b=NMU0vD9QYCqz7Kaq
	sfKMCQHP1p550Gj1xDn13LdJvw/Vt59oX0tgJqTJFXK/VMHc0Lkvsxb/LZEqXAom
	bB2PyuTQZlndRdMXVUj+7GczFRRqhQDb3ixRv1UlCws3NS9ufy+BXV0MzUlvdYzt
	Ylx8OBwRBZ2wBm2uv08w+kVE6pjWkbZeStGDSLGsJU8vpTJBFX2bY3a4Kzf9z9Gd
	byeu8Jv9dEoow04yKl3CzEh+jPpblbvFd5XRXlWZCGqi+qrPiinXR9FiozheUE3D
	GONvETAIDnZi2grvDNIveRzFj5py27OeB8sTPmazllaUlVf791LVKROlazdBIVTa
	w7wxzw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2jmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:11:23 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c9f68dcbso129798527b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024283; cv=none;
        d=google.com; s=arc-20260327;
        b=pXskH/uS8b85YGMOnNNqiolfZnvBCzCpXgTynvAYi/Qi8hNha6KEIwHKKyZkxFYHMJ
         QZy0me7Y6fymkIg7pKk3OCv9xaAhPiBTHZDAbCojH4Kmx3LQdCscWcugQdkdC/VPQM6U
         UNQF7rpBiDfOpQ8rJTCIR9Ed13x27xppkrIwCsHtVGjx9yGlYT8kTvv1KYIrGJ50xPN5
         htl9qx/+2owq170na8nA1mON/TRM6k6iUYxGoYvqkz/GvdouJR/1gIMVZq3c3QrSRzRd
         3NzpaM9apE1v2y7R/5+uvueg5ua/w0ppoo0+F2IEi2MAnvtZgeH0TSu21LBYyzN6UEFu
         G/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        fh=BqHHydSGMkoxHcF6LW2u801BZt7NppGrHPx/xtqvNIA=;
        b=gG5A+3AuoRnSEZr4xWy6EXHv5xyErCkCwiurhW1P6W7rurqU2rB6H7BhjeXAuvM9X/
         Iad7SjBGyqxDeN4Vjp/yI8ht2aR0HZEIVB/9uOjOQvoV9k1l+mYdiN6VGSR7NBv9EE2q
         07RqB+pRQ2dDtts/Yy+hAL8OpikMJCnX4vu68kslAA/Co4noNJxGnjl+624BGumrLjaQ
         xHvi3q7JgBneQolHvwOmW9rttTdFTZ6Rrybtu42QOMT22wxwjlItCOp7XF1CeGzrzl7v
         mh1/oXDKzhFEEbewV/l9fQYx+BKenFvMOj1kllgonERRREf8oNlwqu+GRFz+1jLGvr7h
         GcBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789024283; x=1789629083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=T381WuJoc7WERUnFOAXhojgSNlIBLAG4WMk6Lbg6vbCuRTcGYWfE2s1JicxcIuaWl4
         06wMmdRiD60ZjJKIqevGq13SIec01C5soHSbL8FcfSIm0FQqI6bnfsr/lLLK85h6hXUD
         TWljsKigIKFk6i/GLFsQTR9SibXtLpoIAxdqEWX1IW1AdW3c02qrYyjNH91XR6K3oSmI
         CFbkc7BSOvkkt5+53dLmAE9z744dXeQkAjLcfOQ4myljufZv/rwaBaIuWCdgX0PP15fD
         rTUvHGeNUKDDDuZyqH35q2M8KJ9hbKLYl2Qw15EFYzFGQz9J+qhIvWPsIb3ICWf2cbUD
         9Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024283; x=1789629083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=q91hskrhoRLeBVp6DEGf7H79vl3AJ9HESDhajmwk9uz4L6w7NmMFRvoeTbdywCovpW
         /+NhJTlTRL7ZkTaF+5MxzGQHHHpNBHrLoMzLf9e+xFsI6srBbsxo+bMkxVzBvtATYVFe
         rgfE3ya7XkWgmhPTsLQieiQ6vyaPfHGuc05K2arp6cASzKpcPCuKpNGL8PQDfU5KTbQ4
         6968mPCyK7f5R56Sh0HKfd8B4vZN+C9QeG5ImgNfoItTe0JFGwU7JOwj4zg1KM0JqOpj
         3eKC92KNd9ukr+dLlYRmovkYxEk/a41/WVjqogx2Ry/5IYq1fl+TncOjMKfKcLeTsQ1H
         nMzA==
X-Forwarded-Encrypted: i=1; AKwUvBzhy8vj6RsQUofrpWLq41bTXd72gmK9lpyjyn6Y3A1ycbOC0oHzcN9UCQ/QkkE5DE0hHSWpyHb65pq2wkd8@vger.kernel.org
X-Gm-Message-State: AFuF++mtkxl8XL6CdotbWIdHOOkskUjt2F0YZmhQ1M2EvXbYU8YBdYml
	fiHx2fwGJYx5Jo5TDcqcGecRSdq1/+iRNXnO/p8fF8yei/aEGgqv1rOdWxvvJCuCZ+EZBCz4hiq
	jRPn/dIoyCg9OPoUaGG4rKoiDf5KgiKrHFAhiHHK1OGAxgMMTIt/MCHKX8L392kxVPp6E87prR1
	lX49u4Qv+i3G9dxq+X7RLi/hbGoxYyqX2kmlLwSfw9dEU=
X-Gm-Gg: AYBFou3tT72DIKxXqMXDtGXWK8KZVQKByL9aHs7DgCRzBnm9r6lhZMaaqdxi7QrFXaM
	AaI3HJtQ7kMuanfjbdC1Y/pVp0L3NB2xFMDRz2cUQ7X/dSQK5P9toHR8SeA+mLmaseAQ2osyoER
	IfNLqtIjkZbVKVA9LpIyGVTa7Wm5pKjvmOoBk0SIrT8VxUjwrO9xtRQtqznQ==
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-66fb58f831emr13555596d50.2.1789024283205;
        Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id
 956f58d0204a3-66fb58f831emr13555588d50.2.1789024282836; Thu, 10 Sep 2026
 00:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com> <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:41:11 +0530
X-Gm-Features: AcwNN1UuJZypSHdyHXzQ4_kU6RGI9Uveem3lDvNPyuz26jeLuRfYKMB_4uImEoo
Message-ID: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa2581b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=jaA2rcG_eHD-4mjPCPoA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX5o1gSHQ7FrMT
 qpHHJtr3AMyqQLk7WZ2Z7yjm2NZPCAZRqZHWBxpj/QmGJK1IjaZrQE+LQWxJj3fgmL4N7gwL6NN
 314l4eovp3uV9/5+1yAhh9JCcZ5pGVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX2wQYb+idZuop
 jHM+wRSnDC+YhN7/MvIrryATBkviSYGgNzTQPCI/fHTvXbLEtEH6qhb7Pn/UusnBGFKBQnMPgcd
 drvkxV8BisgnbStEgOPrdrfxMC0pv0kV4NKbPVem9bXZ9izMGMOEuW6IL5bbrXsuHBw+ALxGIax
 DsWngZzJorHfp2C7Ct0l+47+iL1ynutto7hOvvOjFdREye0iYauZYq6LcyyrS/nWC0s1LlKQ+8d
 imKq2HeuhI3XimCP8IhP91gfZBbJoyiw4H6qGiHlaGoHZekxPRGv9vNqxlJA0pwZ9Ai7pl75WTf
 Nhhr6hwcsA7mbY5HgbmY5WpYQMQWaHw5dzikVWN9wjR/UmBjwBlXCGiqTMTYIXBksFEG7lESjAS
 /HlxJdZnU9IFUnT2OTMiRm03GVm7x+tU7hC702ELF9M54V0YopqdkCqGsUzT1/+EjF2L2SNPjPq
 Z6U7nBtjlxCXht2oUDg==
X-Proofpoint-GUID: ZHGGRevy6Cax8MOgW9hq28ZVCxsIoP6L
X-Proofpoint-ORIG-GUID: ZHGGRevy6Cax8MOgW9hq28ZVCxsIoP6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100077

Hey Folks,

On Mon, Jul 13, 2026 at 9:38=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
>
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> Linux running at EL2. Describe the firmware streams for each
> remote processor in an EL2 overlay.
>
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> devices to produce a -el2.dtb alongside the standard dtb. Modem and
> media subsystems are not yet supported due to missing dependencies.
> The GPU zap shader is disabled. In EL2 mode the kernel owns the
> hardware watchdog, so it is enabled here. The wifi-firmware child
> node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> node itself is left untouched so that platforms without WiFi are
> unaffected by the overlay.
>
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi
>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>

Any updates on this patch if this can be picked up for the next merge windo=
w?

-Sumit

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c857bd7991b..22076579a50f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs     :=3D purwa-iot-evk.dtb x1=
-el2.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D purwa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-fairphone-fp5.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp.dtb
> +qcm6490-idp-el2-dtbs :=3D qcm6490-idp.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-particle-tachyon.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs404-evb-1000.dtb
> @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs :=3D qcs615-ride.dtb talos-el2=
.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs :=3D qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-el2.dtb
>
>  qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-r=
b3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs64=
90-rb3gen2-industrial-mezzanine.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
.dtb
> +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-indus=
trial-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine.dtb
> +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-vision-me=
zzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine-el2=
.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-minipc-g1iot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-rubikpi3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs8300-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..8daf7f02fd75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +       status =3D "disabled";
> +};
> +
> +&remoteproc_adsp {
> +       iommus =3D <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +       iommus =3D <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +       status =3D "disabled";
> +};
> +
> +&venus {
> +       status =3D "disabled";
> +};
> +
> +&watchdog {
> +       status =3D "okay";
> +};
> +
> +&wifi {
> +       wifi-firmware {
> +               iommus =3D <&apps_smmu 0x1c02 0x1>;
> +       };
> +};
> --
> 2.53.0
>

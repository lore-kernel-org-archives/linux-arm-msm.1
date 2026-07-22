Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7503473C61
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719566; cv=none; b=IzH6DljRBx/kNai/disMBzkkvkAYr67LGvkd6BFnD+uIiYu26reTpGsSFDvTZ3BIoTDm2/Vn6WMvnmj0vEDJ1a2HPC1nisNyQ2FeZnpxcKh8q+zxTvRqJAFxNdDrOt4xP2BJHB1jwG6AQCw+bCgCv6zqpxRE1Q8lwDHONpfS43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719566; c=relaxed/simple;
	bh=3sKii6cz5beoLpCzSNChnkLlkM/gVt7OCUCSSnghbog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVdht142HfpSTsO44bIsh6NgQX+f+Skl82RvaBhOce+6YbNEVDyU4FxXi+vMnT1YqE+1SzdmT9VpgZln5TpiZt4mbNvMa3W20wBOq59Uyrkzdtxu4NQZM6x/2EmklDmcTK0X3ns/6LD/UgqQDuV5LAoIX8Yr2g9wn3xp9M0UORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOtS7G0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3PRBaS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOtS7G0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3PRBaS0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKsS237633
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rt86BCYIuYzX/mu0QffxPwBR
	J6JJWBu/4GWFdmipzIo=; b=bOtS7G0dWCKzq3eVWbTAIUQjHYLOhMqToKTar6Ng
	FVgC+aEpc/oBMtOtNfN42xpolJ76QbIEnjcBTY52s3YkgHOHJaLy27vr8oethpOF
	1X8vG7emOuhx+R9SVLLc9DJKm1+fAH0BlnRFz4bkyUr3t0PRoAHuPEuWcFa1yU60
	4tbZRv1rXyBqLpjANk56Jk5uhu6DNW/zOWaLrpc7Fej+iUuC8K/P5itwTiKZC7Va
	jxZheWvWkmGiBSnqewk6OnNQKcuDBdSCDm65h8j+xicW4AqGggUaXVnatNRwrIDR
	ktyPCg7bj866IudK/Y7w8jl/EzMASwukj9qseqwMmENcvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1ugn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:26:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so198336011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719560; x=1785324360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rt86BCYIuYzX/mu0QffxPwBRJ6JJWBu/4GWFdmipzIo=;
        b=h3PRBaS06X1xsmPI0eiJFRn4OZOOVIXDIdvYpeqCQPY+PFS/iZoo/UrshY/6iF4EOs
         XTcTSKiDHiILCRVLQfKMw6blKmyiUHQ+ZQpAOIofWvnywR8mnSTPz5Y1DqOdKQjXcXxf
         ZfMxjjuXScEwKzNciBwlf1EAU5QEuvvUPQ1j3ucIc0OSRd+jLsc1MHXvo6/Osrhh5Q5C
         QUwx///sfsj3q9iJ3/MhzrW/jwu0OHXdt4wF/KX/rYeoiZyygZRJ9iUi2qlUE+C82VJQ
         phsRR0eHULD3FdHpVdhdaXvn8WRfF7TIrNjIpjHKNb63+sbB+HGUPiFUv9fFxE95sK1U
         kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719560; x=1785324360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt86BCYIuYzX/mu0QffxPwBRJ6JJWBu/4GWFdmipzIo=;
        b=pbnS9N2W2Xm5FRAwsHM1k6AskNL+sCpnU8vxRy+ngyTakLpk90Gkd4yS1tiEReUWnb
         LdUKtOijRxReZo7byV3FE1/j/wrrkOic5ojNp44t9vXqC0RcToAuEDPyF+OE9sVPnEYP
         g+nlRgi5Exkv7CHQvUDJJIIdsDkACHW0pKvdRkJu9InN2CJquvCaW2zu8O9OWpc5r/Cd
         isLo/Ycj8KqNR7tn7to5etleNsQw56US8Q5tylNmi2cTdh+07jJEwQ0s2zURo2rHpxYt
         4slWuHDHmnFB07DVQdL8a+1RpHAk0Vumt4Ibsoaf10wsJEUoTwzHfqUUQpCVcdixVTs0
         qPwA==
X-Forwarded-Encrypted: i=1; AHgh+RocQbi3zU4gyI4CfuR9MsSKPIAqKKmNH3xdeDOhsALZf5SZcXC8ZQz0tNHdUbFWsT8xoIfhE4j4GlinD0Un@vger.kernel.org
X-Gm-Message-State: AOJu0YxJk8UY+waTs+yV8FelcGLxp5yTaScRqfAyVokjx9SMumlnu6mo
	pbiHap4A09JOh1wFhM/lo1JdZtnX4E5x667sBXf9WScIV5UXfChFrmynlyAGY9IM46SI/hXlJPt
	kJcZiWoEBepskuaxPT5dfGNL40JpnZjdmSfPAZbAeJrvieIIN5hMW9s0UPZDAugul+h2W
X-Gm-Gg: AR+sD130AaDvIHxxVQibmTKLgYBW8lMJXwEctxiegCuHsTC14TpfAbE5iT5iFLXmKSv
	vM7cEP2jh87ohZmT4QtKHYgq4zRI74jnJNWlB309w/36Ba6grBzWYdrXisUy6ncwfHHYJYoM0HQ
	+8uMiF3BU7grOdqCbB+E5kL2Hhm7/v92MnJzhUPtTWs5t8UhE+LuFzSvYm9IYnb9oLpzzCagOvv
	T+yeu5oXshUFb9TLaFSDWS+4iU4gRn2ow7Pk2am9tx7hDKM8LD9ujOQBabmGIrm7r7zze7uiA6W
	spA/HHC7jmnJV8bXhBm94dWvGPQwKZjzWWyUoN9US9NT/0CchYCYoDa7esWjDdSfKiXv+lTFYFz
	g7Utn479LNmaTUtg=
X-Received: by 2002:a05:622a:94:b0:517:c6b1:bffa with SMTP id d75a77b69052e-5213f66b3a8mr215906701cf.48.1784719559555;
        Wed, 22 Jul 2026 04:25:59 -0700 (PDT)
X-Received: by 2002:a05:622a:94:b0:517:c6b1:bffa with SMTP id d75a77b69052e-5213f66b3a8mr215906291cf.48.1784719558875;
        Wed, 22 Jul 2026 04:25:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85a2573csm5078766f8f.0.2026.07.22.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:25:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:25:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16
 (UX3607OA)
Message-ID: <36sqh2y22cc454wdpdfxzgek6h2ahhrszbfepf4jyqrgr2u3xp@d6lwvojpcdxv>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a8c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s0AnzQxE4kFPvzPjDjsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xSzbFfZfAFMOSwRb9ecx8eVJnJPt-Mk3
X-Proofpoint-ORIG-GUID: xSzbFfZfAFMOSwRb9ecx8eVJnJPt-Mk3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMCBTYWx0ZWRfX+SY4DCsCrUmj
 oY4weA/KXNKFFIjz+rS8mWVLw10ExgS+Xi08EmFJL2IDUy4ix8d7I6MnY/Yg6fwMZdhkTsbwenk
 brWGRZxBFbbJCE3Lv33Sz3NfpWwE1JM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMCBTYWx0ZWRfXzsNlUNppgHC9
 oYZGUCWrwDXUE7836J6t12A3TmuGMf2DiMrHt5Mdrzyns+Fm4tWOvVT7MzmPtK6iPKxqVQyRBHf
 2Pe3qgQD1/1Sno4a/2FW4T4sgVrshFpOVRuFEIlDnJ4ZZCx1Z6d0knonJ0XUa1bpgtH36i1Xbf8
 mK2ta6HfdAA8g4xMuh/B9Pw8ImyLHlgs8a3rxBaow5O0JS2Mry8VrA54q5EEbvN4bUTMTUHmoGf
 URrTZWk/sy0dOY+MNM4GvMqAxLd85/UBRDdNnBoR25jrNT8RMhbPEUDTbCowx0N17Prd65oOko9
 FEXOrtZ+UVHiZ1Ofh/Xnc71uW8ezrMx5YhJLnrMnNI84xEyOXsqRZuC7p6eBRzVAT7hORwnstzS
 pk/smtOiVya6H8LIbYqDJqdOeqvZd6V0jADxDBJ9CT0+yojr91TfdijcNKEd67WDbA79XUhoQ+K
 6TVojx5kzyUm4/6I/kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220110

On 26-07-21 19:11:27, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> Currently working:
> - Audio playback (4 speakers)
> - GPU, Display
> - HDMI port
> - Keyboard, touchpad, lid switch
> - Privacy LEDs (camera-use, camera-block, mic-mute)
> - Charging, Type-C, Type-A port
> - Onboard SD Card slot (RTS5329)
> - Wi-Fi, Bluetooth (QCC2072)
> - Touchscreen should work on the SKUs that have it, but it remains
>   untested due to lack of access to such a device
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1271 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
>  4 files changed, 1274 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..1c86e7e98f55 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> new file mode 100644
> index 000000000000..be1a217c5bee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -0,0 +1,1271 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"
> +#include "pmh0101.dtsi"
> +#include "pmh0110-glymur.dtsi"
> +#include "pmh0104-glymur.dtsi"
> +#include "pmk8850.dtsi"
> +#include "smb2370.dtsi"
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/delete-node/ &pmh0104_l_e1;
> +/delete-node/ &pmh0104_l1_thermal;
> +/delete-node/ &pmh0110_h_e0;
> +/delete-node/ &pmh0110_h0_thermal;
> +

[...]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/ASUSTeK/UX3607OA/qcadsp8480.mbn",
> +			"qcom/glymur/ASUSTeK/UX3607OA/adsp_dtbs.elf";
> +
> +

Nit: Drop the extra blank line above.

> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/ASUSTeK/UX3607OA/qccdsp8480.mbn",
> +			"qcom/glymur/ASUSTeK/UX3607OA/cdsp_dtbs.elf";
> +
> +

Ditto.

> +	status = "okay";
> +};


Otherwise, it looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

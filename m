Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64053D8122
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653574; cv=none; b=ttxeA+JU5ZLuv/6gxsU1K6jFnzwf0EbWAJ8eK/zxjhFTnv4mAsUtHsv6c3rcYpDihGAGUETd1CzM1xJsZDQ7PcAs2SOCb25KZfcxriEFmhaR/85wmeFg2GJ7y5HAoSTsEBK4nNGxFLBFpuh4KtKzv1KCVcSEjvzwQXrrOwxugpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653574; c=relaxed/simple;
	bh=TLrQLyBDeu4TkDgR6U9H4djC+5ODg9AsqEk1jHD+P0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeNY5TsoDgL5UFdwImT3IgX5D7CNUjJLOpfhL1zGBdeypLxzMeR0tJnrnYj18q34mzcGz/bmZeyfAYwI2nh+Oa2jpWdoZrGKIKhEUh7mHl44ubPAcmQINT2M0t9pdEgL3PZqULCfRPHp376953mo2TCjMsiBBgkBjT4++3oU0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYEWoHj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu1H0YeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYEWoHj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu1H0YeI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88PJY1359467
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=; b=hYEWoHj+n50AKkXG
	y5cbuW/H2tRnvpWlGI3eU7rs3depvU5fxD6tDh/3rV7rmzL94EcjtnqnzgzKga2/
	evInrZvou+7KmZYT7V65j6cjag/Bebkr7UDGnk9BwA57QgwU5yCdJutEeEaW3r+V
	XqDr7qgs14mCJgMDj7Njvxq07UqoqNI4K6GVyGATZFJvF4R6E+qrHCAHT7mzYyw6
	thLk1l+apj5TSSTsz8/1/i5OiSYnsKEw2lRMDoUkM5K6Fqw0ZMQdcSuIBKhRq2fq
	81yhdH3YI1dgVOIYPOsoxF/GpuSJnPwrsAIRPcoh9AHND3FbbDvW+yGvq1uD4EyC
	kq12WA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy3gg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:26:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so16808331cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653571; x=1788258371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=;
        b=Xu1H0YeIibrmQGbzu7Uw+KHECKnpisVrSDM4PAKQqQ55eo1OHOCqZ8aKoiAGtZ76lN
         kJLzq+BcWBUXxo5KO3+fI1vzOng/zWAZc8JjXiHOxaw9wa4qcXjeHE6tsyh+fyh5JUfV
         /Yjwe+hV+gzplukGlrD+HD3FB7uxPmQAhrJEGKaOE2ryDdoYyKjYrNwyzTYh86udWmeT
         v9QZ+NpP9CRXDO31nBtTNoTz8elB844nKUdyU4gYTWVoARCvSP6Q0IN3awOkqn1Y5pEI
         uU6E9aBhp4Znr4yy+hfOXapigev1QkaLqMin83AJd07PbOWTwtjRerlv3axPE/HQKSQB
         KWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653571; x=1788258371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=;
        b=nLc7ivPU0e32wh4BPrEdogI7iKWBFF29fA7tXolTWgTnF1kWx7LXssoljleAhv479f
         JCl69BCnnkRhHyLASuOGPO2dRWGI131X1hUxePrp8hIEHQLvD+UWAlL90p8w99D0CM3T
         04+VW1N5MBpFtDfkPHNLOceUEr31X75h3doJi9VITZr+TifeSjwQlXweXt7ARkErgzVa
         96KvdF717StvxLytj8K75A/glLYBkexf2WEHaXQLZkpXjJSbHPX9hJji2mnpgmiKvlNB
         m+p7ZACWRHnRQpgOIlyN0oDs9o+CPzcj0svsXdXl5du6+RbzU0YTKqhuFLsymbzhmGbv
         l1oQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMG6V4szWxkmDJ/cmCdq2d+Bb3Z4qOAGG2eBJIGw+0r5TNY7JMvm4TbopNgfYkj02I16IIzBp4ebRrnHcs@vger.kernel.org
X-Gm-Message-State: AFuF++kxGekZg83KFg+2dMwfKNEE3Av7Rg79WEFxS5Ukf+UmEi6tpC/G
	J2M+ulw7AYxj2OUqXxzNkB2/dfabxhL0EUOKkWCNOUzt/BgKYJ1k7nwCabv97nvAXiI1AJwAsjk
	dwOxWa1CIU9+c4UJ8WNiIwODscDXY0Rr+FFXxjCb7I3S3PLKGNFMXp0s3JD2ipf03P6DW
X-Gm-Gg: AR+sD106kp62L7Drjwa0S8U8TafVzBRio4zpmnBE8MVXu81D7IUv1+NF/arx+6eePTa
	34haOAvUL57isC+Hn4yJLGnBzcy/46IxbwePcyHCtX5OjEk1swOJT5Qw580oBSoFIng01pZdgqj
	KNacEcqHEBgIBqAR0/IFOTb2oE8Fzpv+aN1KZ7G06czLT2R7BUBfp3SekcKaHFmb3c1ag01GTEW
	ZoXuHxSEmG1GL7lTYChN0qS9tRoLtjxnVHkr/3cnN1oAncO2AhUAVRkAm8a09fTBWfN3hFyUFvP
	gR3hiPzZL0HaJECW3nzTd5kORrGIXjJTDx5S+bFixqoxXHwnuzn8qXYs28X7YX4/NUjaOkosuEY
	HmDLq+n6Lqc+JaenN6/EV60Er
X-Received: by 2002:a05:622a:1650:b0:51c:2324:666 with SMTP id d75a77b69052e-52e30eb4f3cmr36567851cf.3.1787653570625;
        Tue, 25 Aug 2026 03:26:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:2324:666 with SMTP id d75a77b69052e-52e30eb4f3cmr36567631cf.3.1787653570213;
        Tue, 25 Aug 2026 03:26:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm1623442566b.37.2026.08.25.03.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:26:09 -0700 (PDT)
Message-ID: <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX0KqBU9s6spg2
 PWrMzAbeRrC/dk8RHrXkQIvMSqlqd39T9UTMJZbHPzY10G9iRwMPJpwdvgx+OKdJh8gWw+lniow
 AwvqYdTsgHFx5LAyo9/OxqwXFRbz7KXojVh8dVViYc68b3s60+4cx87oZ++PyHVs0iWvvuPdhJe
 qCSm5UfYOSD+pXD/llFubim4tIeaiuFmcbLvNjshA29+ra3AyzXJk5ErhBpE+64Q37nDcp1eGw0
 lV766W7GzZ8LmLUHvFkXpyXugqLMaq2L/ft+IXlCv8YDCdRaL3z2SbMuKudS4/cRbWGd/rgEEhF
 EmDJtkQQRpPuk5xrVoy3KMxKAyFueRFg4bPfz8G+6bwTCl4HXZYOlvvbfCUWrGThP7skQ5GO00p
 lGiuh8MsnmepCK1cTfZajDGQ1UQEABzJ4WdrMABQVNnUQPATnW049yhkk2TqXmLh7GFDzn/ehgn
 I//go7WnxeESTgfr1iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX2Yxt1UQXHIeL
 mWb6bRpKUKgjCVk3c/wIUZ8biPxyj9GDgwuCFOO4bEkMhhS/qcx7mYUEtWApHPnrp7tUPz7W93E
 ZEoLUIfv3yJi6nd4CU1WmuHEPavxYFo=
X-Proofpoint-ORIG-GUID: PXlvgrZ77u_KoWOXi7Vc9MMuqKsnl8Y0
X-Proofpoint-GUID: PXlvgrZ77u_KoWOXi7Vc9MMuqKsnl8Y0
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d6dc3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=M23K-3MuEBAvA7N4Jn0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++++++++++
>  2 files changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 09b3c5b2d9dab..582805e89f4cb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-nova.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> new file mode 100644
> index 0000000000000..2422be63f0f13
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "qcs8550-ayntec-common.dtsi"
> +
> +&{/} {
> +	model = "Retroid Pocket Nova";
> +	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";

Do these actually have any common lineage with the AYNTEC devices, the
common DT for which you include above?

Konrad

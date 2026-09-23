Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170B5383E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174651; cv=none; b=UJzpzuKbMR0jezXekWZ2UdSDtNiKKPZ2qhSrQT+GXAqBGxgLQCl4zu8QWH56MGwM6RdkoepV/BiDTiH9fFI3D8j/4Owyym0e//Yf8e7tf/EcFTxD+tkJLi09Oz73vTDJqpnGWRBSkUsuVqZmWPbVz2ZkmGg/pETVREqw7KHjZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174651; c=relaxed/simple;
	bh=T0AABt33CYW34VQbpJtUXdCWr7yi6lEHm/bFAU4TMOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWFzNb6jizjEKXPR0epq4LlTrsCaTG1brCGIMojPRb7rOKZjdwgztpcg4i3zQEHk0otkCIgsx8lqofIB1OqJNC1++NflYCe1E1AXZ96hHarD+YrMVycTzqAN+3V9CIPOjOS3+vPwdhkBkEi2QViGn78WNiMQ9PUxilyrKTTCUxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igjeEXj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd73gZlT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igjeEXj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd73gZlT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKwPs2056502
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=; b=igjeEXj0rpJeR6bO
	Z/+mUdpOYJ2wtX9mdo1x+FasmFa7THP9mj9mHXLrRoXMj8uphYIYu4R22RmW8BdD
	Xdeosr+ppFZe5pfcWd5jo7lowwD5p2RK3w6Nd23FC3QrA2u3TyTgpyi6j8L5qUFd
	TXKQ+ZXAlTJT8jGI0NRqhoggQynOQAH84Eatf3uydRh4pjQtB1G/73Wysx6De5e/
	16SDr7n9Jwk/feBp24WJIF9pJLfziAdUNl419GVV0z4lzNpaN0VqYB18xEF26Q1v
	PF5WBtYjzB/HlpX3p0C0SUjONDkKHf2szp2x+LNp53DJxBHRFSPxx/xAWRJ9JLrV
	Rv6usg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0cg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78f4d6af128so314013137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174648; x=1790779448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=Yd73gZlTcH2chtnaTiwJHBSQbanrdekSTUFu+pZI986tgIngQUHVUWqa2ugoGIWpx8
         vUasFxvc6kkbTznWwxkgNQvidHm3VhjXmi+eXHwqnutyXOoL8oJiBtkrxIb+af1Hbjdx
         STIqRSCo9p08HefO+B8+b6CpOXJGUABb+njxnVaDULqW72e9U+c9zT42wxlSxQahL/EZ
         vAfC6UMGeUYp49KkW2fdFaX0bAufAuJ00uz7dR9yShLHPa7rRrI0x8fQjRsKHR2syUrT
         +e/QSpKhd2OcbcRMy9XLafMcHK7sl2GYt78TJCflJ4n65VOColNuF3BB/cFhmS61dczW
         4H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174648; x=1790779448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=iXp8k2e1/GutBbgEncRd5dzY+qZRT8RTSr21a2l288PKLzvsYPM5mfCpTw6zfXxrVu
         v5vMSHsNzmEt3RYpwGya0j0zEn1/ige8hfKbgwqTc2uJzYXmqAoa9NgPX3NPBM7Cm450
         i5RA1gVk22XMmhqmOfTuV0X+i0juU2ivCykQM7LBlD97yPJdpvejW4MsK+/PjP9YG3Tw
         a2oMXtNo6dTI3MVMcodmS2GBphES4v8BdOHy65jTJE66nJXZ8GhY3EyLlH4FqEoYU8kz
         J/jONcIaUAHWz92eiyZOsx4HGHR7grPThD+MOSA8JROkpK6Eppxb6/XXjG0RKI6Yhn7T
         9xkw==
X-Forwarded-Encrypted: i=1; AKwUvBy5A9lW3sx/jhIVG6CK2bOdAXW3Jr2TnSRojO++iZKKPVOIv8szay9SOBl4xU9OYDBuoeqj8cPOpyBd7JBx@vger.kernel.org
X-Gm-Message-State: AFuF++keqrTlpBqOXiSUbxRifvrKLVTFkumCT8YUwZIkmK4CYeVziVdx
	aJkWe+8IRQTH2z6lnTCXxq/XyPzTo7ITbSWskoL421ZCjWUVobAuX/rju9N6nd1KY76AJVUNpPU
	bMH1kVjRZ/SQW7ZS+bMSNL1Si7ccMitU6IX82ZSiSvy+iCJwxOB8zcNxbisojxBx9XDDVSr9r80
	QG
X-Gm-Gg: AYBFou3GO3cb32InSxvEstT4RuFU3voKyquYW2jWRCGGK2Fvox1qKBkyapqocWp1OfM
	1iXBQFpe2tlmx1HEdqjZekFlphFgBfe8eHNhRdcoWJXn+yFg2m7JIn6TytakygImeYtbqJLPjkg
	GOdqd5IuFJcO1pwelecryoCAwL31S+17YNSpHKHvVxLGi/E94S8d9ZVOlcXQsR2ch6pS2swDFzr
	2DgbrHpySxakFEknb66MSSrGR/OngBJYnBcJUwNND+5pxw4yHFH4xtHitMD8LicWs4OiMpE60lQ
	Nv+995OcIgkdhM1rmEoUE/tUmukTBqqYepV5mJb0jy4SOEadLYjZslx17YIqtzWpiPAp0s6oT1H
	fl935DWG4MHCOvzyHJeAR7zPJwhDgBQ6fl3elgG+0k1oSUtToGkxR9b548sibmg==
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175739137.23.1790174648095;
        Wed, 23 Sep 2026 07:44:08 -0700 (PDT)
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175702137.23.1790174647570;
        Wed, 23 Sep 2026 07:44:07 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486461sm7314339f8f.8.2026.09.23.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:44:06 -0700 (PDT)
Message-ID: <e39fbe69-e539-4268-b9f2-4f25a2d51ce3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add Qualcomm SPEL powercap driver
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX8NYSXnIj40NE
 GlB1vnJNhVktpYNOFVNk4X4o3iKxKICLQluYTb0X7iZt1M3RMRQuLJth+llgxoaSoK/5UFfRoRX
 KdbgtbXOPJXRwpCRE1xEHlSpvOIx/sbfqpHreETmOnjpYf1QpKz+NnFY7cGQ915WWV4NbrS20MV
 m1xEbp+9v9YzkkhyFnPrtWHDZxD+4DhrHOu7GnD6bnvhThA86vfVOBKPgzMvi1V2s6eynCs3yUp
 +rTlsH6CS6Tn4mAXE4f7Cv6x4bjzip3MtANsicroQy1VPow/H4adHOJgjQ2JQqBGBLKJF0wvCFe
 0Ex5vcgYI2rEsQjExrt3IuZajud0YDhhXxAW/62arbBKSmTs4C+eoDBUPq98ddk47y3cVRbE3ZX
 vtM6lKUa7VbxnFVi31zlyrqOrMDmXIf+UxfdtXQz5wgfFhZpT+CjjnUfQ1C9k+PGHiZhzwfr/Yv
 ORSAI17jVBKC54aFcUg==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3e5b9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6G08FbKcmm3nPJiwURwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: jHkya0fs303eiFvfV57YHJ7KDMht7s6P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX0p9GucG0Qk+v
 wfQNsAppYROgXS3wVjKJMkBky0ihDvidoH1wT3qt8oK4GS+du1EzFRpe9X3VsHxwr+SIeP9g4xB
 HMyVOWqSvcZaH6HtblO6SDcNPUTpiIE=
X-Proofpoint-ORIG-GUID: jHkya0fs303eiFvfV57YHJ7KDMht7s6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058


Hi Rafael,

More qcom powercap drivers will come in the future. After discussing 
internally we agreed I can maintain them, if you are ok with that.

I'm wondering if it would make sense to create a qcom directory under 
powercap in order to group those drivers under the same maintainer 
umbrella (and perhaps do the same grouping for other drivers?)


On 7/2/26 19:22, Manaf Meethalavalappu Pallikunhi wrote:
> This patch series introduces support for Qualcomm's SPEL (SoC Power
> and Electrical Limits) hardware, which provides power monitoring and
> limiting capabilities for various power domains in Qualcomm SoCs.
> 
> The SPEL hardware enables:
> - Real-time energy consumption monitoring across multiple power domains
> - Hardware-enforced power limits with configurable time windows
> - Support for up to 4 power limits (PL1-PL4) per domain
> - Hierarchical power domain organization (SYS -> SOC -> subsystems)
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through standard sysfs interfaces. This allows userspace
> applications and thermal management daemons to monitor energy consumption
> and configure power limits for optimal power/performance balance.
> 
> This series introduces a new power/limits directory for power limit
> controller bindings. The power-limit-controller.yaml schema is added to
> MAINTAINERS under "QUALCOMM SPEL POWERCAP DRIVER" in patch 2/X alongside
> the SPEL device specific binding, as this is its primary use case.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Created common power-limit-controller schema under power/limits and described
>    power-limit-controller device common capabilities.(Krzysztof)
> - Created SoC-specific qcom,glymur-spel.yaml file instead of generic one and updated
>    description and commit.(Krzysztof)
> - Used FIELD_MODIFY() macro at different places.(Konrad)
> - Updated glymur specific domain info table.(Konrad)
> - Updated all for-loops iterator declaration to C99 style.(Konrad)
> - Fixed use-after-free bugs.(Sashiko)
> - Corrected time_unit documention to reflect the logic.(Sashiko)
> - Link to v2: https://lore.kernel.org/r/20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com
> 
> Changes in v2:
> - Fixed DT issues: corrected unit-address mismatch and made compatible
>    platform-specific.(Konrad/Krzysztof)
> - Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
> - Converted hex values to lowercase and simplified array definitions.(Konrad)
> - used devm_platform_ioremap_resource_byname().(Konrad)
> - Refactored data structures: merged domain data into spel_domain_info
>    and removed hardcoded limits using ARRAY_SIZE().(Daniel)
> - Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
>    handling (preserving reserved bits + firmware notify).(Sashiko)
> - Resolved use-after-free, replaced allocation strategy, and
>    added proper cleanup in .release().(Sashiko)
> - Updated time window calculation logic.
> - Removed cyclic dependency, improved validation logic, and aligned
>    naming consistency.(Daniel)
> - Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com
> 
> ---
> Manaf Meethalavalappu Pallikunhi (4):
>        dt-bindings: power: Add common power limit controller schema
>        dt-bindings: power: limits: Describe Qualcomm SPEL hardware
>        powercap: qcom: Add SPEL powercap driver
>        arm64: dts: qcom: glymur: Enable SPEL powercap driver
> 
>   .../power/limits/power-limit-controller.yaml       |  34 +
>   .../bindings/power/limits/qcom,glymur-spel.yaml    |  61 ++
>   MAINTAINERS                                        |   8 +
>   arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
>   drivers/powercap/Kconfig                           |  13 +
>   drivers/powercap/Makefile                          |   1 +
>   drivers/powercap/qcom_spel.c                       | 803 +++++++++++++++++++++
>   7 files changed, 930 insertions(+)
> ---
> base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
> change-id: 20260702-qcom_spel_driver_upstream-909d37c8d8e8
> 
> Best regards,


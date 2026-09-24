Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106E37F010
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240271; cv=none; b=k7ShR8XAikhnyMcF3iDQ5E/BFJ+yOsZAZUQwmXteWJLJX8ca8UU0aRVX9uNTGu3XeNF5Qu4oOq5OOrEt5qwrZf4QMcZJ6ge/6pXMryz8kl4xJglt1FK1i/Q8q0lnNzN3P8nKxNVgrkyXaFhQxw+zxDi2BsWrrt+/BdhVk3yQSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240271; c=relaxed/simple;
	bh=LJz/KSOTCABZaiHylirxp5rJ3jxqoQE1ue/EegVJEtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0tG/z+At/mMkrb2unOXxvbl/+xoz7y8Hy39AMdIsq8aTq/Dqp+e9j2KsodFhQLFMm/CoEE+eN7AZyhsZ0nEtcNSViXGXy3eqxTCzZJAAEDRVl8SuAYit/tCZv4Mf7kIFyoOf1+BirQ9tHGId3i9ajjYmiUM3nLh5inokdAh97w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWdary7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBZ7LMIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWdary7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBZ7LMIq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e8GK772424
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=; b=QWdary7AFiW95HBM
	qsNou5w1t3pT6mfaQKbHAdKUa47KIAXvIK7yj28hGwmfY50vn/ApknHdDBu9Wcad
	frAIbKCzxzm19FEQqs/yHYGARS+M12+A3vKLMpfsjGwpy2V85F5X8ETJ5z2njjRY
	NOLPCd8XDN+gn1hBwOHr3qUKCIk/6bUmfzIoGKNyx0DjAN7UzEC6XT256wLI1FB0
	OptREbqjzqM4prpcTJkZv7VPpdzV/NLa6tlraNB0D5CU5p0kcQGIoxQwVNCIVmMM
	PfdnNqYJMFWctXck5ynxxOn/3Q9gos2RPAKQjVHPFbtf8yWIDeHg73YfByKuHAu2
	A1WrdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr909ybf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:57:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2444921eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240268; x=1790845068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=;
        b=bBZ7LMIqJyy4AF30CMSJdgTJyYl+35iSFhVmBRJgFR5TqyvproeAV0sG6WH7GJ3VCt
         wn0f5ea6Kp/nDR4ege30oVlkZYGJhkARG5YQVsnK9qniCrdqqQ5K9uYdOSIAIXrEAuUQ
         Ge++IkjbWU1HhEMB5OlteuWQjiOd+BnVeB+garnRCh4RtNsN6XS0yXzNBGDsSRIWl8RO
         d+ay/tFZKjWFJk30Y3nL+iejivR38rwGnXLw/8i1UR8YR+CUjXh+Kq0FP0ny/SH5Ig6K
         PVQ2PM2MSznrepz0JuqLKJfcPlenXov6bPfTrnl5EwOXilK3XjXt9fFE51yGpDGiZV8O
         Yphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240268; x=1790845068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcSrAyO5BfFEwnWITZtIYQDs54bU0FOaZ7vt2Uej5n8=;
        b=k9WMXOrt9JMk0evVCZjuONhDRjLXjFTb2pn490GqySPQJo1qo+Jx9YBfy7l0t/HjMu
         nc1ym4JmFV0/8aNGgNnXFE4tNYRK5eItLefSBf1owB4uGe9wVJZ9RJhjwQXE4A4ru/UM
         lZXCDm/JuoDlr199nugp+ENl/6+Aif3D4r0l7C+9vPfWZIlJZH5JTbjQY9Q9ve+kepMD
         0i8J20IEs53KtIsiQwvruD8z7avBywjeY+LMe6hvWfnB8OqIrCREjxfDOXX2NP2zUVmJ
         HoBGq4AsxopfxFYNYHiQD7jgUjrO47YuQYQhqrMBPwfg7RlrNzmwOcvu3tuI3Y8RX+Lw
         qbHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjKhqFirfIT6IsGSU5Dpwq1ado0WDVxXdijEeeK1Jup0KPpojbIUcY3BczX/9zV71KtyQ1ZOSR485A2DiK@vger.kernel.org
X-Gm-Message-State: AFuF++m9uh4vIGt80qB8D02rjE4D9VbFHtvxXZuY8DhUYwr94E4vl0fM
	IM9+0PSGF61y1NPJBKWMfKVu2Y8PVyPrM9nEvmR8f4JloXHsHoHaEd6oba9Wf15QSxms4M6Rl0F
	iQuTW/23tt8PUayrre2MIGhnlyUEv5wCandVl9IY3VQsAffFPRwzZ/jo/mn5MxDjjf16p
X-Gm-Gg: AYBFou0opEPUWjvKidcEIAU/5c0T6bU9FYxUsONF0ahLkUj9cDya7eXiEYqpDsw/Udw
	0K1EgZGwlAZPZC5JPn1jK+tSowyCC5a2cg6qACcMk4xU5if9AqpuG7Ut+CqHWYPeYSVgVusVw9v
	oJlgmPcQLMX0EjCvGmDx78l25wQ+1PKBTrwS2cefPxm9LvsmKMCEa/IejbkmtqaLNI0JCZehfSx
	SxlupCjDecIV2HaxzSPgL4g6BovTjGTfBN99VrgiudcDLvtPGa+4ToBTcPH9sxiQY9GBymk+VXY
	avA5eW4XflBQbc6GymS5EVOqw/hEzhhwozGIs5eehyxnC+UHIXkQZMoPqoqKnYiLKcldhp8E4DC
	Y3CIU02BvdmbL+9EJzu8KcqSz2j0=
X-Received: by 2002:a05:7300:d0ad:b0:340:7202:d7fc with SMTP id 5a478bee46e88-3407202e868mr739332eec.17.1790240267362;
        Thu, 24 Sep 2026 01:57:47 -0700 (PDT)
X-Received: by 2002:a05:7300:d0ad:b0:340:7202:d7fc with SMTP id 5a478bee46e88-3407202e868mr739303eec.17.1790240266727;
        Thu, 24 Sep 2026 01:57:46 -0700 (PDT)
Received: from [10.217.217.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm12993532eec.4.2026.09.24.01.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:57:46 -0700 (PDT)
Message-ID: <da745b17-ff28-4276-803d-3241d69290df@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
 <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX6E5lWwLCQiXm
 tMpaR2KbjUGuUwtdrXEhhRlZIyJCw3MAwl4u++P/FygNE9D4PBJ6/OWg5vbfvC2KWU0Vf+5iC+l
 cfWJONdQAr8UnAeVfBHvPuGOZ9QNNMk=
X-Proofpoint-GUID: rUGQMbeEUfJzxws9AWkFvH738acL6L_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX8o3iB40nxxqc
 NkFwP8ahbdIqMqGDNpivQESXxjhMiWnLB5jOHsfGEr+6kIVnotEbvGmJy9ydYHQ0Eo1kgl8R6yl
 vk6zZF7ZxR2g0b5kXK5sfk5PKwj7q76jJB4nedGvp/OaON0lOeIZ2RzE4RsNizSTtjq1W+wzpVw
 WNw83dl+ZvwLmPMg6F5G/v6gI9aoOA7rFsU0w9faaxLxnrRqqhPpawQ8k7FIeyZQOdEUugvzAHw
 itUOlPRahsMupuuJRmmIKZzGhBicw/l9YMT9VTLSH75ZlSA/i4ATnjUtizTUo9Gy/MC4rmG7PAT
 z8N5ZWb3qKYrJusL0oTqrq0teJQyBc4XwTOifK+17GbgGkSX8yaOGVI8pLGyFVAogoN2/U021H9
 6EM10WdBnu874nPCorJIlF7ki9jGmgXxgCdsfsZbKzrvU8ha2sgiP5/TLigNCvNBD4ya06H8nH6
 LB/KrfXvjdPCdjKVVYA==
X-Proofpoint-ORIG-GUID: rUGQMbeEUfJzxws9AWkFvH738acL6L_X
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4e60c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UHbYQJEj8knhjxSQlJwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037



On 9/24/2026 2:26 PM, Shawn Guo wrote:
> On Thu, Sep 24, 2026 at 12:51:32AM +0530, Taniya Das wrote:
>> Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
>> Clock Controller.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>>  2 files changed, 95 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e3553e0eecd5027155b4dca5c0596e3140641aa9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DPRX Clock & Reset Controller on Nord
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |

No, if we drop, we need to drop the header inclusion as well.

> 
> We agreed to drop " |", didn't we?
> 
>> +  Qualcomm dprx clock control module provides the clocks, and resets
>> +  domains on Nord.
> 
> You fixed it partially by dropping "power" but keeping "domains".
> 
> Shawn
> 
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,nord-dprxcc0
>> +      - qcom,nord-dprxcc1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock source
>> +      - description: DPRX CFG AHB clock from NWGCC
>> +      - description: Sleep clock source
>> +
>> +  power-domains:
>> +    description:
>> +      MMCX power domain.
>> +    maxItems: 1
>> +
>> +  required-opps:
>> +    description:
>> +      MMCX performance point.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - required-opps
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    clock-controller@a940000 {
>> +      compatible = "qcom,nord-dprxcc0";
>> +      reg = <0x0a940000 0xc000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
>> +               <&sleep_clk>;
>> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +      required-opps = <&rpmhpd_opp_low_svs>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +
>> +/* DPRX_CC clocks */
>> +#define DPRX_CC_AHB_CLK					0
>> +#define DPRX_CC_AUD_CLK					1
>> +#define DPRX_CC_AUDIO_CLK_SRC				2
>> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
>> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
>> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
>> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
>> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
>> +#define DPRX_CC_MDP_MEM_CLK				8
>> +#define DPRX_CC_MMCX_XO_CLK				9
>> +#define DPRX_CC_PLL0					10
>> +#define DPRX_CC_PLL1					11
>> +#define DPRX_CC_VID_MEM_CLK				12
>> +
>> +/* DPRX_CC resets */
>> +#define DPRX_CC_DPRX_BLK_BCR				0
>> +
>> +#endif
>>
>> -- 
>> 2.34.1
>>

-- 
Thanks,
Taniya Das


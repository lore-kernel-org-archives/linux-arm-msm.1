Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340383AAF44
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623773; cv=none; b=lyqDoaDDsebTcdG9BjY+2xc6KVtOHRo9lbBtTSA+nkqsAymcf94lVkJE/p1O+gUIRUkZsWpWpI8WqEQvnLHyy7t1DQtssFWpTfu/KTHzRUtqO+I/pdsCuizqipfAHzUr+o+jYbn/lwEcc9hjaPqhIfW49LYuOYOhH2XZBb4Cg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623773; c=relaxed/simple;
	bh=qglo1qgSqvpKcfXUwbHrKpztUmqRkGBYvY7E1ws0TUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd5xmqa6HO/phlt9vFUjfxj/rspRRWq5Izhul6UltZ46MXgRivgfNvQWQ1DoJ5N+HuzIsUdx1U68n6FcYaXFyyd9ZD4aGKw6ie1+G9pAM3H+tgaj+Rr1e2j+ezfUObLUSxDSHHtL+HoJWj8sn3zZ7gcN0HLFZLIBJx+vwZIMQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcKf4THM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy3Tleze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcKf4THM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy3Tleze"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1c4h73559742
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=; b=hcKf4THMRAh/vmJp
	BubSj/LyppmFhIkPNTS2wErU1g/5Gghmmau6DFxcsRpUN7AjOgn2remCMZ7XXhS4
	5r40cva5vmvuMtGQvUmnccAAHKgfHf2LgKXnP02J3JxR6sad7hK/jWJMJwgkx3nN
	7cyEuEedo67hpT7UckiTX35NydDQ+ut+5jA4ZJ5vqpbwfmHyxFxQQ2Vgqk/ZJvRv
	8vvzW6MIHIH3fG+PHLJvVmnso1m8V2jIyidtv8Kz3dZKDTEyLWRutSLu4MJle0Et
	KweAGkFLF3a+z+PJjpR+T3NAA6OIcdX2oHxQ0jlF8Y4e4S0oueuu+uuLKmZL/jVS
	6nRd2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hakbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8538a72b430so612907b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623768; x=1790228568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=Wy3TlezeVsC4kFilPbO8xt/f/kkNmc5Rlxmp2OarNLkS3AruSIG4a+hGZGwZhreM2e
         e6kt1CXuYHugLAw7jQclyK1pvhuz4nZRdL2n/1epCSLaW836Gy6ATgBD8p6swWfaz/hc
         8f5OELcG8/uxzhwfhRtJ9Yob6stV42oE52UMr3rMyROncRYoxtGzmDcaqAH47W554fNR
         ZBGyEoX7IWHu4+OnhE5NtTXVS69ZMVbO+mZMXP0ZYjsbICIITH8JjJMKaRqHDVvMxuTu
         xHewrinZFrsoqhp6SYW1XXrlsk+rnZWtA1q85FxMziyWsN7b/LHV2zS12fEfvdpDOIax
         mkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623768; x=1790228568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=RfSwrRdlJPLgy/v1UY6F95lALEF8dd/tkR3uLyY5RygdcKWGYwOUsGnQM45DuqBal9
         qG52vmM8lCqtmQoceFuGQivTcdsocmIjrCw4KaTXKGA50GnFnQGvQwty/8s5vXGwe1lm
         oO2BE7wLgOiT1jRKmD1GMDAwYE6sTJJlH7Fx8dy7RzjgbitozGNwEu+Y7TzqpyXoePHm
         nJ7oJCQKTC6oE4qtoMhM8XFgJw56i1TwAkxs+AVOGNCJu3/vJcyUAfb7XwpGdONfH6+C
         tnsBjU2qYAr3FvGS76vxsHXc9O+moPo2deUCymPrOSS+TD2LtV3cGDEWhp4XTlqImmkb
         mO1A==
X-Forwarded-Encrypted: i=1; AKwUvBwUGXASbx1BDtsk2gt75GECLkK3W58srsz5jkkZx10E1gMNQxMZ/jazdty08LgSninM6UlwnSgwWgBV+Ejc@vger.kernel.org
X-Gm-Message-State: AFuF++leCsbVmeFLNG3MuGGuOdwLdLUuuURxP4/uAAyylT4WkhWE/Mmk
	XKDZfM0luPbptsSF0BD4yiij9e/V8m4UmUvGPrDgkGTvGCPPUNPjXp51itQ5OeUQFbeUEPj6dnJ
	K61mOPPV8O1l8qT5u1vyzfQrFkmReEF23dNl1SxkpgE8syjy/RSY5wmKS2mAw/7LTJ/jy
X-Gm-Gg: AYBFou0/imp8S039+Zb7o1OV64NyJApPJH5Vv0aLNiQo6vAqg+v69zFn6EHV0ycm6ZA
	+5pu6CcAYiOrNZQGIO2Q2Awm4eEFD1Q4iXCsTnyWZu7DoAXwIaVmH1h2moOIUjvxsP8+z7znVFI
	vAXi6hMMMcSQKgbKfE6k1XP4+D4RnDFPIWBFON8BHxDR1ADZODMBrPqEcr4R97yAlDlCOpWFid4
	U9STymCyVSzvU3macwdc6wSqX/oIA7iB5cdznwaEUrOyXAoOpCBPNXeHAo3w2EeTgzIBTf6k22Y
	xHhbgLHZQzCr9V3bm4rw6pyCqIt5cICSeJwrtZyB58tQn+uxZuK1ZqFYk7YXwu5sTFlobiqj4vS
	aD7LCr+sqSIZTy6LUD1h/sY3x1H6p
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101557637.17.1789623768388;
        Wed, 16 Sep 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101484637.17.1789623767817;
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af4f0bsm14466679eec.24.2026.09.16.22.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Message-ID: <7d2611bb-532f-4553-9d16-66c4b9c495c9@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:12:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
 <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfX69nG8vxlR2NO
 8PWja7+ccmawjfm9zlPeaS8b5+XX+UG63vgno0WrlzfgX6NhYVzleQcxuTAyD8cA6T7qP86WNUG
 miMLWESRZEPjRv9gcmUX/tuO6g9iPB8KO9DksnFwGWTFwL3oWB9pQZbDI5WS7BshFrVA17MWdBr
 pZJ8c1KebZIgsfHLJSEQ1rIa35u3jHMS7dtkZVBzKDndrx06YnCBHO7L3rsLE1sX7W0NHk9THtB
 qwR48fhMwk/cRgKsJAeqY5TdByOmOlOZ3rS64SvKiW6rNe7CoKfs/UtNVtATqQxK0GcDU2Os8Qy
 liZc6MPHQIgnE7dnCwZv7L/OJT7g+tdNW3o5zXVuLnRW3l5gmujv+yRdrO1gQR5mi3DRCL9YKHl
 yOUIyIkIB5yLL3fjV+izAPDsksE+D5FSIbaZuK8Zp2AWN1WrjI58KbLonk/gJ3oNaVF0ArkjsU9
 tMo+stVfow2CoZyKBgA==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab7dd9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=T1TI9GLrlG5TBy_zXBgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ZshsogdxABBcXmIOx_afNcfs5LS5OKa9
X-Proofpoint-ORIG-GUID: ZshsogdxABBcXmIOx_afNcfs5LS5OKa9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfX1QE7dD42aY5Y
 6cNdE9Z2xyRbjaAH3AYTHwjCVqkYU4JJa6mNyEzelQZ+Bvw6kp8EFuXOyWE75DkalueOW8qzJb3
 5l1STX47If6N6fv4zNQ1cOus6TAJ11Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170073


On 9/17/2026 7:06 AM, Shawn Guo wrote:
> On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the binding for the display subsystem (MDSS) found on the Qualcomm
>> Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
>> controllers.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> new file mode 100644
>> index 000000000000..0b0cacdca9db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Nord display subsystem (MDSS)
>> +
>> +maintainers:
>> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> +
>> +description:
>> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
>> +  (display processing unit), and display interface controllers (DP only, no DSI).
>> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,nord-mdss
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB
>> +      - description: Display hf AXI
>> +      - description: Display core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
> The DTS in downstream repository doesn't seem to agree. There is two
> items for iommus.

I checked the Nord IPCAT. the resulted SID is same for both the SID 
(i.e.  0x03e0) in downstream repository.

I think we should update the downstream DT and use a single SID entry.

>> +
>> +  interconnects:
>> +    items:
>> +      - description: Interconnect path from mdp0 port to the data bus
>> +      - description: Interconnect path from CPU to the reg bus
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: cpu-cfg
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dpu
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp-phy
>> +
>> +required:
>> +  - compatible
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,dispcc-nord.h>
> Please run dt_binding_check against mainline kernel where the header is
> actually qcom,nord-dispcc.h.

Ack, I will update according to mainline kernel.

Thanks,

Nabige

>
> Shawn
>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    display-subsystem@ae00000 {
>> +        compatible = "qcom,nord-mdss";
>> +        reg = <0x0ae00000 0x1000>;
>> +        reg-names = "mdss";
>> +        power-domains = <&dispcc_gdsc>;
>> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
>> +        clock-names = "iface", "bus", "core";
>> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        iommus = <&apps_smmu 0x800 0x420>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +    };
>>
>> -- 
>> 2.34.1
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy

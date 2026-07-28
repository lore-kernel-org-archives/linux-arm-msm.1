Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC603F412C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232182; cv=none; b=X0c5fDxj+KC0o/kTDS+/BRMv7lTQo2WgZMYkUGEa4jihbKCQrasTCZJbVkvx9cXvPLl8N65d8V4h/hs/0UCekFot2u4IJ00Z0ZuT3VnrriR6iYHws3PY1f4N4ryPAiuYmqThG7+HtBEkunEdCoff3E0F8CwqDBtIl4LQ3jEOQx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232182; c=relaxed/simple;
	bh=zsUahTb+vGjhQ2MpksjrpqSAVc80M+iMVOhvE/GUfCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMRNDy/mBWQAtEBBxYjciPteR7je0hMDPBX6EMM8tStFkM6FzU8tuQMvVP6ArO+MMDPqppmuNX8kUI5UbCz28fzhcibfRx4+wHLzMVooMPGGD5NnlUQKpBhq1jNCepP5joVxyj+A39QsyPeEV7hrqgtfZtQOAzi/9MWFXtq8rBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyWSRWRX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POzjddmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyWSRWRX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POzjddmq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82IL82128961
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnNxddvXqolmzwIJGRMsJXuHuq2D8U5mK3D6Ufij7Ps=; b=UyWSRWRXiIvUpW0c
	Gsnz4UHFPgSZyZ8U8977GHMRin10GzIeQ8yCjA1yGJW2cOpwKy6YYcIywdI/hNFY
	g027/Om5OeAJtuTIrFn3nLqjvjqI4j5B/E0vFzSZn3FqINOGy1iiR2krBgGe3jc1
	1qHR5BLQO+qbQCtnEKNMG2/cl7YRp9obngotmVDe2COaIdQjqUZzgr+Iw0bjUPOu
	cnybMe/u2WjE1kjG8SYb66/aseeruY83xSwqe3fxV4TkUXC+tRYgnb1pdgTx9jCY
	3w9KE9tF0t9Kb1bCtuO67hBAR1eDT+1NrTZ5HalOfIdSN1iKbUBEcDF6LfESzJbc
	0fs1vw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bja5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:49:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so43576001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232179; x=1785836979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnNxddvXqolmzwIJGRMsJXuHuq2D8U5mK3D6Ufij7Ps=;
        b=POzjddmqiaFjWH4Q51elLCTxY4CIFqj2bwsElXg8RY2Go8QUw8IFAVAwl7WPLpZFOn
         km3TfN5yLletY2pq3xwpSixQE6UY4MUCvo5wK9/XYO0inbpsDrUtcOBCOs3ZE/gYeB91
         QJhnsMR7weHAuzvubQXdp1+v5aAUT1EvHlaRuRqfOAlcN32XID+rY/8F4uT5PbjvEZ9y
         kCUwHiN/4K2KtYv1KS7jhx3CpPEIp0/pgw/Es44RD1/BO8YxzGXZbyaQ/+Zhm3F6FdpY
         ++cJDuNd/tZF53F0DbC6UVeAwokoGc5WtLkkmqQ88No4pg9+paWhCmpcA5wrKbT/kx8H
         nxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232179; x=1785836979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnNxddvXqolmzwIJGRMsJXuHuq2D8U5mK3D6Ufij7Ps=;
        b=WyOaQrS56qJrISw4VBEaLUQjojz/9ytK7WePtkv2ybYaUiS4yrVWyHsPOOymDjvTqr
         LLg9mBwsWpBF/dlyo8zK98T8He+1zMcObYRelUBmRjbKlGHGXamq6tmsZJZpvuyrMNvZ
         T9eNIlbLPY5aX8kdJs96IfhohGoHk96AKenHrMAZsSuxt+amd8PfhEOndR3uZ519LJHz
         wfDRxatcIsEhspN0jgxcnSWv2CDV7M2oRP+mTNDh+Z3jrB9tr1fewrRLJFX4fe/zLwHX
         nUHRcb9U4T2UiH0niJhlm+zDn3rr+KUAW5uj7DyFjPfM069yWQrZt/I5Vd/GCP85qR2z
         JHrA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa/1JrT2qmOvekjZwn1VJJJRFXlvO+ZumC7MJb65M3LVpySXgazbF1s2St75uDEf8v46US8NLRyUdg9QYv@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVLRzT9XJY8/gvqZEWBuPvlf9+I5Rbmq5C1LTIo/hbvyRqBhP
	pTIIy/EMh5q5iGfyos/B9rif1cJ0toBrw4YMCcmAXFy9u/UToeB0JNYmftfSyNz9tan0uYnMKRl
	P7pC44svvPGoYqPhE9gr5PqtQJuYG1jOWesKBeytsr5QJ38P0m3eCQOQkB8FypOlXE8Ha
X-Gm-Gg: AR+sD10w2A0jysm1/rdiJDMpsLPkb+jr80a7qhsYIhhsE2gMkUlVd9yqAr9mg4Rr724
	puKRz3eGAtfOi0Gm4YXBoStxyRzl1ai3fK/wB1aV1Gf4wT7BGckPA4ACPeBb9hCxdSFm2dhv2xN
	cmliY5AfvbDsP+fY/ztM98+k4rL2HCb6Jgw759JKy325GDoAuwbnvcxEvzUfUvc6Uk/4NNyguFX
	FtiSZRyVjbs4wb1Pd6zZC3iMyJ8mOLUQLTIHsyLvs2gBy/u37s3Q1KUOvvbQf3I3U5KhpASd5m3
	hUNcEAgI5Oe1AjGrrr/Akuhji64SBoEyGZ6yJNTfW3qpchXvM16DVsuykbBF/bbdW2H59SzYIjx
	NAy8LHGh50jKjDnqJ6HxvGELHBzAOgtG0
X-Received: by 2002:a05:622a:130f:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-529d71033b8mr12995941cf.45.1785232179191;
        Tue, 28 Jul 2026 02:49:39 -0700 (PDT)
X-Received: by 2002:a05:622a:130f:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-529d71033b8mr12995711cf.45.1785232178709;
        Tue, 28 Jul 2026 02:49:38 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13c96sm733948866b.62.2026.07.28.02.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:49:37 -0700 (PDT)
Message-ID: <85391d86-f82d-43de-81df-8cf3696f188f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:49:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-0mjXJhk+n29COc19zUgC-a_ZRT=9Kt9DBaexYcff1Vjg@mail.gmail.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0mjXJhk+n29COc19zUgC-a_ZRT=9Kt9DBaexYcff1Vjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NSBTYWx0ZWRfX9h38emjHyAOE
 CI5EZu2tc/ZY7ZhHpXJpxzM2bMIwVBQpctwbLYPav7xp1qEW680iygEpdHuGx5d9DOf2xitTqDQ
 JT4QQgWStaFm7jBO7SjxPQehX2EEt5vTM5JlFBN7U5osMmbS0p1xeuRM2pWAtBfeZsTtPDimVJi
 tyag2NwBs539tJhuGoK8Odhl4Q8P0zOC7ut3QXlEcvW6Cgz61feObBpVMc6crvDRrBlBVxjs69S
 5C97gY7iBc63ZP4kGmNGB/0jxbaAV3JMW71ZfGgnWs1+ujcny2AmVp6u0tEK5cLa27PVwTNgO/3
 ZCy+9M0vej7kP7ffHWCmDxpPgsKOW6BMlS+YbizwcjKtYOF8/YgnGZSbk8CbDZHbd28LbnSwPpB
 lFdODzKChbgvx4JRS5lk0/Mq1zdijNQlMQgVR4LsdrN9TLKIIaM3kpa6oDoa6mD6ne4AmYqKcme
 SxYBVgjVU4wtYa9Glxw==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687b33 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2iqQDksCm9cAjr31UZcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: EjeCaXJRWEoiAaSQ4XlsJm3yJYfmd6Hc
X-Proofpoint-GUID: EjeCaXJRWEoiAaSQ4XlsJm3yJYfmd6Hc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NSBTYWx0ZWRfXyE91s6kE6egd
 coO53aosga20xX3LsfUHsLVvic4aU8X54FnxUwTDKmKYAmUcpIvyTWL84QbQPgee8RHhOAjGR/1
 naLWyyXGtmAtMSkNdvrG12JqC2iq8D8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280085

On 7/28/2026 12:18 PM, Loic Poulain wrote:
> On Tue, Jul 28, 2026 at 10:25 AM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
>>   1 file changed, 154 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> new file mode 100644
>> index 000000000000..6aa2613bbf3b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> @@ -0,0 +1,154 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm JPEG Encoder
>> +
>> +maintainers:
>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> +  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>> +  The encoder is a standalone hardware IP within the camera subsystem that
>> +  performs JPEG compression in memory-to-memory fashion.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-jpeg-enc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 6
>> +
>> +  clock-names:
>> +    items:
>> +      - const: hf_axi
>> +      - const: sf_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cnoc_axi
>> +      - const: jpeg
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 3
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: hf-mnoc
>> +      - const: sf-mnoc
>> +
>> +  iommus:
>> +    description:
>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
>> +      for the JPEG core engine on SM8250.
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - power-domains
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    jpeg-encoder@ac53000 {
>> +        compatible = "qcom,sm8250-jpeg-enc";
>> +        reg = <0x0ac53000 0x1000>;
>> +
>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&camcc TITAN_TOP_GDSC>;
>> +
>> +        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_JPEG_CLK>;
>> +        clock-names = "hf_axi",
>> +                      "sf_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cnoc_axi",
>> +                      "jpeg";
>> +
>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> 
> Do you really need both SF and HF? HF is usually for the real-time
> hardware macros (capture).
>   (same questions for axi clocks).
> 
> 
You are correct. Looking at the JPEG-to-CAMNOC integration diagram
in the Titan JPEG HPG (Figure 3-2-2), JPEG_ENC and JPEG_DMA are
wired to the SF priority arbiter and exit through QNS_CAMNOC_1 and
QNS_CAMNOC_2 under CAMNOC_SF_QXCLK. The HF ports (QNS_CAMNOC_3,
QNS_CAMNOC_4 under CAMNOC_HF_QXCLK) are for the IFE real-time
capture path.

I will validate on hardware and if functionality is confirmed I will
remove hf-mnoc and GCC_CAMERA_HF_AXI_CLK / hf_axi in v6.

Regards,
Atanas

>> +        interconnect-names = "cpu-cfg",
>> +                             "hf-mnoc",
>> +                             "sf-mnoc";
>> +
>> +        iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +        operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +        jpeg_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-100000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <100000000>;
>> +                required-opps = <&rpmhpd_opp_min_svs>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <200000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-400000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <400000000>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-480000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <480000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-600000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <600000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> --
>> 2.34.1
>>


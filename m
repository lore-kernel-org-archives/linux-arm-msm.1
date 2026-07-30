Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FEA43F4BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428662; cv=none; b=bVBnENarETHm2le4vy7zA7pU4bKOoOlFeYfX+kzeY1tQxKBU9oPWYgmka+6tieN6We6pcTdhXLHwC9MWRlr8y0jX5FI2yn1BippjFO3VkMcPjesqe3UwlkyRyhbWIu6gHBd0PgbervKr2nP/T167JJe7ygG2jkFJQpiS0kwwhFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428662; c=relaxed/simple;
	bh=dpip2/uZoDOcCop3JdAiXJzYey+lcsTRIz8edNKu49Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXGxM9gDrOLo63hKe/HLr+nsc8Xyo893CEUj7kIg/5eFf5rC+tDdVbwBBBKuBybTKo2hGX2ZiICAn4MU47b7czcpu+hzqVDoXP0PZ1T3r7ylXS/poI3eiqttXc6UKbHeA5GzUFhrVU9s9kJM7tlD8SI2X1dC85u7kTqw3tBpQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7KEltL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYisReZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7KEltL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYisReZ8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQpZW1087253
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=; b=e7KEltL+uC+/AjrB
	xTZlZXCWW6nwUxKS3KLnpD4l4GiT9n3tO0aPJh9Zq1u/Q7C6cViQJuXDZt4wAp7C
	fmJk2KjCl7LxS/JbzepYAT83VDNC0Iprl3af5qxnPeEz/RxtYlCU/+F2XI4jvq8K
	Ftns0dQNmZjolIa1NkIm0VnlZG8rhhuZPMAV1oVHdKG+p5KzMOSPAnWeHC/ABZXt
	Kdul2FcYz0h6RYeVMsiD1P+DxmQ6TKDWwRAV7gC3LahNu/18gFrFCCryZBCWSG+C
	FzRjkIdejV7y2PGxYgJA6TMyHt9IDxEnVU/SUPqW0I+iSdcYuKwEexQ492SQ34Oq
	hRGMlg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38j0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:24:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so27119481cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785428658; x=1786033458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=;
        b=VYisReZ8ns1T6S762pmABItGfgjGpyta7E+MnNW1Ep0b/Md9CNZowHifMB8Mu59i+d
         PAjL+U4FICSbHmqz1HVVMBNT2sSx6E2FSg7S6A04Au2vwHsBxN0mZ6nwQUUbOkGwI3JV
         QReR4qa4HKCqc8NvY9as+vN5Qmq5+EDnk7C+KTHYE6hYue1XOc2jEteb/DjSoovvH8+m
         umIVEAiMVUYQfKvn+aofaMvpfLNwk6NENwq6zTw4mpKJIGrhAvw00e0TZX0T2e29PLFO
         wLepSR7DNLdHtscyd3BjE7JJ3e5qpIYeV3VosNqqGR9CyqoDR4AVsGj+k8SdHNuLYn9v
         BWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428658; x=1786033458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=;
        b=ZU+UDdqV7CNTeivlYk6ilNHOFCuK5JzJcmPmG5oYBJQjQCaRHIq0Ge73vw7x7lcmdc
         l6AybxdyXSLEWo4v6xWVjHPRVtx3fJjTnm7hGicbz8ZRdp5KPp/wWd7NuHb7sfxagH0H
         tM4i/NyumagkQvUZslCzchM0qXTIfg9NwxEJh0UajAF0jX8r3F2wX6luncwmkVk9o8YW
         sd9OX+MCvw5OnvPrBlKhgn9xoWRLs6nYZ9tDcscvfHoHs361NNRk/fjyj6ZnfhoCk8L0
         hnUM0dmu4LupCwKmAGPE+NwcHx2+qo2Mj5EXHDvr2rtPAsc+6aT282c1IYl2M8MZkARf
         LXiw==
X-Forwarded-Encrypted: i=1; AHgh+Row9F/IsSYM3/GuqKSLY82RwhwhkecwTBd0f5uJO727ZeTVpq16WaSvVLV7N7nsAUhQR1tss854eGTQzn+d@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbT+s5SVRrXp1TAzw5lEGiaTturkfIZhNKbrYL0T8FfHvj9z5
	Hzq7OX37uONcQsuJvxRTz3rqh2Vovty4zOVSkSTjuC6H0oAp6mdoMfEJIkU09bx381piGYnZVxs
	9q+yYFhRgQ0N6JFSu0cHtMeIZuv5kAiGVriegEMa5IF4cGJFBFZUIrYlPUnBx/62TQB6S6IA2lI
	ikzCg=
X-Gm-Gg: AR+sD11iubEOfJDyMwjq3i5ejh2GxhLqOKn8qCYWf4sXI2WhaYNOvb7Zs9T7BmpU3yr
	djaI2aKvrQgZlY/vou4pcLYWdwqj69H7Ul84lEr6vnFu7ayU6kLSpzWmbh7pvXi37Aicqo1spdG
	m3pOh+i98VLB3gqmWYYD7B2MwDXQkrNRCRGscDCTY5RZUtB4onargSxptiQymvEc1T0MtFFyfkv
	KHfGGyzP4Ef4p4os3tudki7IsfzMluCh1j7QdsMXNPMmAfmBxoai0pGur7fqUW9wbZwnBISFZZe
	GmIxQxD0vRrUfW7NvHYNi3A0gNUHu2keieSF4ZILEgemvqexRFawyUH8epMbeuTmdLe2NA0xN92
	pwcgfF9DPQrB5Be+HWscbrcR2nw3823Oq
X-Received: by 2002:a05:622a:64f:b0:51c:af4a:9d50 with SMTP id d75a77b69052e-52b3869c11bmr37699651cf.68.1785428657549;
        Thu, 30 Jul 2026 09:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:64f:b0:51c:af4a:9d50 with SMTP id d75a77b69052e-52b3869c11bmr37699151cf.68.1785428656848;
        Thu, 30 Jul 2026 09:24:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3a2914sm840072a12.27.2026.07.30.09.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:24:16 -0700 (PDT)
Message-ID: <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:24:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b7ab2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2iqQDksCm9cAjr31UZcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: mD30ABKDM4S6-yCFhVwT9YVEgGrp2iEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX0by1tvLlZFDN
 ozOAtZd/CrtemXSmM/j22vZiblHW+K0XOlWnKnJ8ScByJzFmOkMhS63ttIp0K7/cXE+e7BblpTe
 VDPTKKB7YBY7abJpFcs1jbauDRrcK2Wu+UP7MSgG00hs+3nDfm/ENYd4vzhR6lJDlSayOTR7Adh
 n+ttd+YlAIf1O8fcDQwfReCkXi687CBOnaAizsSlA8Fmh6nGVXP3J7/PzbNo1gWpnXCtaqet6hf
 fc2Y7do2+T6mjARE3GqlsEI75O8ZJX9SRws5Mq/3BZIRN8A9JOvsu4l6+apm0il+0jDv+PSfu4V
 5SHAyyQ/DSQgxWS2E4RwRAS/ZxhjRUJZ4V/WhGNWyJqnMqv4vbNaCjKedshn7sHnfhHV5ayT8+s
 o4/uzNxdrIMPDV1v0L4xEPEnZatETKb6AKe6Sf8tNGLwK8n3ldm2WA7vS2qzdkPN15oJGRGSY0c
 OLRGpfMZQ+5PlTV4Ryg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX+kb8nQVsO30H
 KRHPjOV9aW8GVgy+ltZ9bGAAqA8wCdMAlVKkGoTxGA3LOiGQBd81kcg1qGS2vLVVx7ahuKc+tr1
 vYdVpuGLb7r7+P9x8W5rzutK0y0kMxs=
X-Proofpoint-ORIG-GUID: mD30ABKDM4S6-yCFhVwT9YVEgGrp2iEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300123

On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
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
>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> new file mode 100644
>> index 000000000000..70f573100573
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> @@ -0,0 +1,156 @@
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
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sf_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cnoc_axi
>> +      - const: jpeg
>> +
>> +  power-domains:
>> +    maxItems: 3
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: titan_top
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
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
>> +  - power-domain-names
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
>> +        power-domains = <&camcc TITAN_TOP_GDSC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "titan_top", "mmcx", "mx";
>> +
>> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_JPEG_CLK>;
>> +        clock-names = "sf_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cnoc_axi",
>> +                      "jpeg";
> 
> What are the pin input names for these clocks on the JPEG side? Can we
> use a better name?
> 

In my opinion, there is no such thing as a better name; the only 
important thing is that it matches the HW documentation. As can be seen 
from the clock names in the FW shown above. So, could you be more 
specific about which names you would like to see used here?

Regards,
Atanas

>> +
>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>> +        interconnect-names = "cpu-cfg",
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
> 
> So, you've identified the issue earlier. The shared clocks need to be
> scaled, taking all users in account. Please come up with the solution
> too.
> 
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
> 


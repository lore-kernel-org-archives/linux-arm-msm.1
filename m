Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413570;
	b=VLOA6OhQGmgIF48L4ht40WUjD6B31lXbZzGFFGI2HENVqjIm3OamOAvd/rlBeKS4fwYw
	 7UZaEDdP1rs6QoY3M9t/lfRGFjmjoRXCzTSsp2VzMTZGXUolMWHuq2Y9etYI+R4UoOgMo
	 yln+HYWSTM42gLsRbzif0ZbMeamkBackuy46AE+SfBjMl/spSIMhd2si1vmsNJMe6FyOy
	 Lv8rrE5d9sCmn9/nO57rm68p4M8fNH8ABCGVTxXSMhk9ODQEDJoweCR/2cg9yLEdN1ZnZ
	 AUaB60r9TFTAX9qKK16uxldU0MbzCEjkiVVt/COPoNSVpMVDZyVKQWhYBRrubO5RTLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
	b=P+jJevZKV/aFH7dC2rB6JNUVwUA1V4X26QUhhyHsPfQ/PHGAhkRO0ydyu1AWd9sJ/RO5
	 X/Hp7ekz8M2ilr6gjqR8eJt23Qteu7GVhDSqxLXSd9UD15fMlhEzjP28Y4VAhH/oXP+nr
	 xlxeVm3+V5oBXScPXHdyJlXyjzUKy7LaBpEz+MWhMfT1hjGa1vgN+mJiuBkdK6sHQJSgm
	 MEjuRBvqQ6/yHdrMYshoxZoHue/Oiu1LQjm46q0cJSgz2WK2JFxaiTQ9PjhZfRXCwjq+X
	 ujlpDft7I3KyjiuLPZfTcksyM2N18wirZ6UzKb7xfVcIq5AvEqQpuGCSr3zU8BlADcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YoIom/1Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvbPXOFx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2A9606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoIom/1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvbPXOFx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50uco1332791
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=; b=YoIom/1Z1MBYmvzp
	3BMsq0z1iLk1XkSMylQB8BJDr8W/SHfvjDeinB3Sa+RcIPuK1dlfmsgvwKezUOsr
	LTkFy5XBtTgJLXFD9364c5JKNR5/T/HHVxGbgegXPON37xTPOp4H6hBwgTYp+oHA
	h58C2HFLUnRNkL+vfam3HrfO2AFPIr3X56cCzXnuRdRhdFxq021EXFFggV7DX+kS
	TugRHt1MNeOTi5UZUl7YJUPoVJeFs1M/kgIown3oQrsT+sGsgV0mfLOq4SKJ9SRM
	Gk/JRNtKrc3N7e9FIQV2ZtBduvB2XV/oAlSGmBVXk13FNUle+89JvOtYYxx1Q6CY
	R22osg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu5cd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:59:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso2193473b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413568; x=1796018368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=QvbPXOFxAEB9JQstgf4nr3VdFe2oh35GivdUDTuYLvx1o6s1JRz9fGdTnHkBcE1K/v
         dvmQRE+GLAgGHcOE35pNYBplkzl/lBnXc/UBQ8Tn6dLYSJ380eM+zqWvhsnK0TWInPGF
         VvvenPt0VXQpCzjvJCwBMVE0AfINK0Y24i0RgvyxW4s4/YCsUVgBxVcvvlp727yF8er7
         +6/cjmaFgdu/X+MpULWZU/3d+LeM/OBtg41AV74QafmgU1hT+EI04Vt1mU0L2V31em+n
         YbR1mY95XBqZW7EHUGQNUdLFvJIaphssOvro2m8nCeLK4yIxaP3fsLnWg4GSvjEmib0s
         fA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413568; x=1796018368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=zmy0uKkGWypnc8Wx/wokDBt5rIbSxYk2T+C0p643DH35gr+fBD8jssDI9I/ssJ8M/1
         Bz+sgipWsca1rt3F+u9oJz3Cn903d3SJMFNkk/o18u2C2kKlg+fsiHdC+7+uYAnNcHnN
         q6Y2FCZPAFo+XNkyONvUcCxgvOVpC/vANYMNEb8HbsgdiowaR7FpGi9HMCkQ/F3vp+My
         DpTPLI/4fTIYQzveLbRJ9snbiudcNyaGMJqzyKgxcXgzX69qMLtlIOLctx7AWnJcK3N6
         EojyU300AxEIcNUV+cpC0ZC9mcQ98tkbxE3Wj40aWMQeeVF/bKX1HPYLLrT1EksBqJVW
         6/5w==
X-Gm-Message-State: APuU4Z9IeWgbGrvx8TemQzmo2LzyS2UzT2lje1ppZkFhjmg+7L6x8unl
	34MAtF+njOhJ6yw4nfbJqCSt0VoWkdrvwsyLi+3pi0ls5B4tHn79Ce0A2UoSfiiGuJP5cI+fzNw
	jEYMhWgnCJtWJvx+7LCPLuxA5i0y1lwAkyNMkOrleWVRi8bCfVxFNbKL2PNt4yJbT+RF0
X-Gm-Gg: AZFdTZcq70VyOuPrjxz90M4RzQQyeeKS4dWz6I/5Wr08DFzIGyr+st1FfX4Y/ISNJrr
	Fz1N8zyxpuJjPzoRkZyIUgCDyPucEWU6QXPgVwXp3cOFtLsOFvP6QNO66itERdriOCd5ZXkh4iD
	mmMRD2IMtvBIrvgck/mkUTVBgEzdMgZ+K5p/VyQ1NwbnXMM2a9HmDj2DFY1BQwCDb+RUViSsMnT
	a5V6zGxjodsu8hO8d3qKkJqqP0fpBdP/lftsXUs6vZ6gy6qMo+8IpvyBI3Mx54K1ywnajLsr7td
	2nWPIYREtutBoDRe1/iaOpD0AK9vgpz9OhgybFyPSwBZgLb54FYlQveRcUDxC6YEFerK343fdUe
	8VNfAiWv0bJsTzc+ketatl9nOBmJp/NSN5V8yCGo97L9lRy62qr3HdS2wbJN5bEPE72byKg==
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183785ad.22.1795413567490;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183525ad.22.1795413567022;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46286895ad.64.2026.11.22.21.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:59:26 -0800 (PST)
Message-ID: <81dbfe3f-c88f-4fcf-a460-ba3376d736e9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:59:18 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
 <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Oi2ONbFCkHjEvKAn56u-S00CvxhA3sLo
X-Proofpoint-ORIG-GUID: Oi2ONbFCkHjEvKAn56u-S00CvxhA3sLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX/4PiZs6zPRNn
 il01KiDbx3OaHYSLFbyvj6SMH5Eyrp11yrwzcJeg1bC4TR1f+FPAMtMlLFaWJF4i3NYO+M2JxB3
 I8ObWzelteFB/5T6cU8MsaRY3Q7f9uiCpQd7PMEacjV9GjbYIg+mXnQEpnoPXqjiMBRIBi/J/CN
 1wEGqr5uE+g8tL4SAp9B0E7h0wH8R7Wru0Qo8mYRPUEukMIKZ9IXe7W3E6zpqkFwx2sIo7VCu4r
 NaIdbf7+U74Pjdl9stEPQwB4gZ5BxgKBy79rfK8DjT36QNaM+ZVh2h5OCHLdkoPU6Z1YTQVJOYU
 Dr7rMq0nyS1Su8PsnA/n+CmuRkCwCzzw9Ye30NughxVaRVI0eGV79k7vjVUogF7NGR/e4iJKTgF
 1APSZ1XAs4zthULQctm/r+tY2kzC5km4+YXWiIxh4FqktkdA0gdzO5boCisVdo5bGHlIyc+6KLg
 yqI5hGKCO7M6xKLy4dg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03d640 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=uD7aXjGElm0TJE3nPE0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2F097bQ6xLhp
 Dcrlvj7ZUj3XScwdFovQW8ka7fbuvuC1iFjp1LDynzEwld7JvgXvmd5RomnWK0JFkr1cp9wJwME
 WR2lX7vNXm1wegL5iASmBaSwTbZDKFg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/19/2026 10:00 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
>> node used by CoreSight debug and trace blocks that are owned by the
>> Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
>> runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
>> carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
>> firmware to control those blocks.
>>
>> The provider is a Qualcomm platform/QMI service node, not a CoreSight
>> graph device. It exposes the qcom,qdcp compatible along with
>> per-connection QMI service/instance identifiers; the QMI service
>> version is the only optional identifier, defaulting to 1.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> new file mode 100644
>> index 000000000000..ee0a66b12dde
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Debug Control Protocol (QDCP) provider
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  QDCP is a QMI-based firmware provider used to control CoreSight trace
>> +  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
>> +  than the application processor (AP). CoreSight-facing consumers look up
>> +  the provider through a "qcom,qdcp" phandle, naming a specific
>> +  "connection-N" child node rather than the top-level provider node, and
>> +  issue typed firmware requests instead of programming registers directly.
>> +
>> +  This node does not represent a CoreSight graph device. It is a platform
>> +  driver that establishes the QMI connections used by consumer drivers such
>> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
>> +
>> +  QECP exposes more than one independent QMI service (for example, a
>> +  separate service used by remote ETM/diag sources). Each QMI connection is
>> +  described as a child node of the "qcom,qdcp" node rather than as a
>> +  property of the node itself, so a single provider device can establish
>> +  more than one connection. A node without any "connection-N" child is valid
>> +  but provides nothing for consumers to reference.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdcp
> 
> Standard comment - compatibles are not supposed to be generic. That's
> why you have entire commit msg to explain any oddities or deviations
> from common rules.
> 
> 
> No resources here, so this does not look like separate device.

Thanks for the comments. I agree that we should introduce a 
device-specific compatible string with the corresponding match data. The 
instance, service ID, and version are resources specific to each device.

Thanks,
Jie

> 
>> +
>> +patternProperties:
>> +  "^connection-[0-9]+$":
>> +    type: object
>> +    description:
>> +      A single QMI connection established by the QDCP provider. Consumers
>> +      reference this child node directly via their "qcom,qdcp" phandle, not
>> +      the top-level provider node.
>> +
>> +    properties:
>> +      qcom,service-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI service identifier for this connection.
>> +
>> +      qcom,version:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 1
>> +        description:
>> +          QMI service version for this connection.
>> +
>> +      qcom,instance-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI instance identifier for this connection.
>> +
> 
> Please don't describe firmware contents as random integers in DT.
> 
> 
> Best regards,
> Krzysztof


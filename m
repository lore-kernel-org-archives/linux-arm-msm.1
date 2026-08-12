Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E547143A
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558904; cv=none; b=ELwUq6YXq/7t78SmKLHxHz60kNZUCS8gNw1fiJB+UTLY6CO/3mU3Qq+UdbTSrQVAvXQDNPB/iaPe5yAKy/TTx9F02rJTV+WApYdo01UAxtCBPJDpsLvKOBrBKURGV7N+0nmZvjffCxqv9oXojFL0jPmOpUhPUEgRuVTlzcKSnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558904; c=relaxed/simple;
	bh=iI9esAdOdZlw1uReZnabVvg5nHlPrIbNW3n2cPWAZXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwVTUzcrqXz7FeZWEoBJzyE7ofqjlwscnNdpduezC/kz/hRxfyvhtGOI+YzM7rakEXCztdcRlBbf9VnuKTm/Gp3FrAWv8ke4t1cEYxcSTyLKdbgan1dIl8EDEbD3GldFiTgCNR7zjBlJ3FDsNqJchKwFJi+cyt5hO0dKstE2hQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of6jBEj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc77VqAo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of6jBEj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc77VqAo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8fHd051360
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=; b=of6jBEj/9M//BZJv
	iVVG9dOOSLGlZULaKtZu0wDId03BF9r/zDUQDjPU0yacJeWSr4m1MjxBpf0zgvHU
	s1ixF4rQaJ5thA/ZczSKcH7qXXLK74I+Qb4QHMtH3T9uDVNGbjsGyc0CJExdvQWz
	KVFDunHCFva+URsqsOAUQCJYHQxjzoNxwvqH/7uBzynDWZyUG6K3DtQfMO7hUjpi
	ENn7ZevD6ZZYrFFT4pCSS5ve9Y+xQxQTYNx4PzJ/BmNjdXLtjncCEGKiJPPrwgKd
	79PYfb5pihBzA/VsJVHoSx80+OZDDl+vtgPtJe208Bdem0VyvBCyU1MyqTB3J/BC
	pVNXlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d2fe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:21:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so20338825ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558901; x=1787163701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=;
        b=Rc77VqAorG8Na0nuVZvXE/K8IpAUNtH2xCod4xoiVaGdtO+epRri2GVlZK22V/L/vK
         2g20v/9xuccMOuyeQyZzGRNelppinr7Fo9aCw7rkzZh0kFtqjeS8ZMfbI3GF7lKqs2cK
         B+IkrGyk3NCSBX30ESy9xLmeBArJz1SpYJrnJtDEvALy0ao4e8Dxbqwyt5GUeBcqKxJN
         lASnG6fA9CPsZbDDlTusZip8uaEOq/4z8t7yUmpgSiV26ouG0UK/gfEpjvy0utL1riP6
         uxQldGSwRYZQrRINpbYU2PQWt6+netLMXrEoCyfmsXMMMKmKU6oxB7MSdl5T9HNKF3IV
         6igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558901; x=1787163701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LND2pBW8ZOPxUjxOrCRIPueAW7jiZZxzW3Hs+XmLEY=;
        b=djCBCgYcBOgzBsxS36va7tVhqj5s+4UREFG/h4ADByNszZoj+KlLbaH7ws2AqCcWB2
         8gAcsnOHHDfTYRPs2HH1SrpJQ3PLjZOo1LIFlb3LcwQCywW7axGihMJw+5uyetqISHkM
         XjGZAfWX/i8MdEOdum+6/pJ7U3TRkB3usXWXgN0+QAggkUyk6P6PSpTDRfmwSwYAy5/j
         FLpBddvGz30VlW79s8iDjSao5Idza+ywCE0M+yZsX5YT554OdOqMjdRvCkXFY4QEp8aM
         VD/O59SPmzfSEk2bdpDnTRio1R1o7CDyKXFRZTT/+2TiBknrFQ8HP6JI9++yacUdjW7b
         9eVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpwq2P20lVJadm2KK7BEl/lFlic0E2OqdYZH881iemKchoIJbIYTNIUQo8sItuIr45ec1AuUpqWmNzcR3w@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvEJXWu78uhniVGOO2/a+lyB3ZgPS5zfcd3C5VKUHIggpnknE
	zGvjHyl74M0yS5lBYk7knl/mKkBQlP4tH51vrtPSGdqKw8fcOZQRvQnCdC2Kr6lu8ScGToAq7N2
	cfuZEs4OJjrlE+Jepdd5mB1W+G/9RJ19oX86xFleg6DWmPPGiIxrdDpUEWbnaYRiP6Bj+
X-Gm-Gg: AR+sD12fAsIOMn/8N9kLsTWin2MnfKUhj70rvVIR1MkNHjf5nA3+PLrxa06ouXrdygL
	HZw3yPXquEMIdSWMptmlVp/URlBV3mqNM+L7wj+sci8c5gjzhRVmI/CrpWuGIdSjjVKcOqywU18
	NcBsogkQ2pSI86+Xxhcl5AYrIJNSOJlYWNiduJ5I88jCD/35kld1fbrRWc5btrHkdsVwRs4yVIO
	YbLDbQFOeICFNFCxLfDS2RvC4fVbqHx1wKgKZORfc7fsOqIi4UYI07EQ0wrtNC9yFGDhm9d9jQu
	eWM3Y8T53AC5Xx4uKGYOEbnwLHxs5vcwnvLt3lxsd/wfdQgdacKylfcAkzlcg6RTDnSCDpXUcm1
	JjpL6YjRRJhY64FeSJk8FFOUsMalZXxaF0g==
X-Received: by 2002:a17:903:40d1:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d34556662bmr88759425ad.14.1786558900418;
        Wed, 12 Aug 2026 11:21:40 -0700 (PDT)
X-Received: by 2002:a17:903:40d1:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d34556662bmr88758575ad.14.1786558899929;
        Wed, 12 Aug 2026 11:21:39 -0700 (PDT)
Received: from [192.168.1.15] ([106.222.235.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c24a371sm537155ad.28.2026.08.12.11.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 11:21:39 -0700 (PDT)
Message-ID: <f52bbc62-9e6a-4e8b-a3f5-500ea26a18a4@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:51:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
 <20260802-i2c-qcom-slave-v2-1-27653118fa75@oss.qualcomm.com>
 <20260804-airborne-impala-of-proficiency-a9a8d9@quoll>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260804-airborne-impala-of-proficiency-a9a8d9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RsrZAjdBfc-4jeUIUAN5i7fYfZbRN1ca
X-Proofpoint-GUID: RsrZAjdBfc-4jeUIUAN5i7fYfZbRN1ca
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7cb9b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=NH2SoAXOXKK5768fTBPIkg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=RP_QtRrjLn2U0etmI9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX1xt7yoNYK7SO
 YTW7t9iP4Caz1mnC9/3fppzioIj7XySsf8t+DPQXrYnY0KlWpTCQLF6nv7BvqY12SDD8odK+rhG
 eUjez9CTzMZKa6Ma34/EBcxbAnXoBkmJVu2/heKKYTzc69oKwT8/cWp12q3WAxTjnkTbAffh61g
 fyar04b3qutVy/Wa8E/MWO4a2B2T/0FnSt73FdAqdWpZ8VWM4CDImwgAiTzHut/uLIvNn6ptXqx
 t1oe7kRASJ3EVBC+ENz1+tXyARgs5bFWu/mYZn+xpLaIEf95HSR7gby630wM1X1Tras4nWCU1hN
 z7X8eIDHkbqJAwzVk7aorvlb/MpE0Bk5A4hA/Y3hCth4Rn5H1YS/Fy9bKhs1ei3qJeZpmxqdO08
 JfgWKJ9cA9LjyikMOybpjyZNHRSn+q9MJN7rEq76N3m6fyFNgTH0abTpyiJ1rE1v4pR2Z/FVqYu
 TUVXN+uMoVwwC2IZBEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX/bZ6ShyztgVe
 fjzYb11aYE99dx4BF5iJxe1b2R913PBfkVrAlkQgMMR871KulFrT/nvzXaPBHAPJp1lfQz5/Azw
 kX7NOwCOyEHKGM74pxnWjj3bmgCVOLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147



On 8/4/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 02, 2026 at 06:43:30PM +0530, Viken Dadhaniya wrote:
>> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
>> controller that operates exclusively in target mode. It is a distinct
>> IP from the Qualcomm I2C master controllers (GENI, QUP) with a
>> different register interface, so it requires its own binding.
>>
>> Document the MMIO region, interrupt, XO and AHB clocks, interconnect
>> path, and optional pinctrl states for the controller.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/i2c/qcom,i2c-target.yaml   | 84 ++++++++++++++++++++++
> 
> Filename must match compatible.

Sure, will update it.

> 
>>  1 file changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
>> new file mode 100644
>> index 000000000000..1e34e874cc4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-target.yaml
>> @@ -0,0 +1,84 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-target.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm I2C Target Controller
>> +
>> +maintainers:
>> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> +  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> +
>> +description:
>> +  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
>> +  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
>> +  for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qdu1000-i2c-target
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO reference clock
>> +      - description: AHB bus clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: ahb
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    const: i2c
> 
> Pretty useless name, drop the interconnect-names.

Sure. will remove it.

> 
>> +
>> +  pinctrl-0: true
>> +  pinctrl-1: true
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - interconnects
>> +  - interconnect-names
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> 
> This wasn't here before. Is this a controller or a target? Now I am
> confused.

It is a target. Wrong ref, will remove it.
> 
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
>> +
>> +    i2c@88ca000 {
>> +        compatible = "qcom,qdu1000-i2c-target";
>> +        reg = <0x88ca000 0x64>;
>> +        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
>> +        clock-names = "xo", "ahb";
>> +        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> 
> How is this valid?
> 
> What sort of children the target has? What does it do with these
> children?

This controller is an I2C target only — it has no DT children. Will
remove those lines.

> 
>> +        interconnect-names = "i2c";
>> +        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


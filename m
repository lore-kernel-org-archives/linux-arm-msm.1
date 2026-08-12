Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50271317145
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514122; cv=none; b=cYYUGKLYZ3boh2JJ2tUU5biRjV32yvf42GbPDNIdXlN+McaJ1SG8KLj9KonL3VsP91+qw0pdbwOyJG7H1orRmAeVdQL/Bs8lIfT8X1hjlMbtnBmIZ9LSKcY3ZLWzl+H0kQWKcToApdyC8ab4a+w/FJOI1o+iwtN/r4vjKWgTdFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514122; c=relaxed/simple;
	bh=/5PSXkTlCtEcdLS2MJPju2mwFtJKGge3sQVRXpvDiiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjfcQT0CIFozT/N6C0FVXvLwBjlImsitJhXNEIJy8+CeUBtoyu8ZmpIdyPo2riF70DFuMvdgl0nGDxm9TVDrMWlf9iO4LJonxN5BrQU8wO+B5FK+IRp+kV2FqvWPgzNpctKIABBR5eyuYqD3Yjd73zkLDVVASgdXNsF14JC1ByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlOOlowC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw5lsXOk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlOOlowC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw5lsXOk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C5iTgB3464163
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kj5Fm3PrD2xHmK1fpjPQgyYteo7rmv7BUDtCA9Zvfic=; b=MlOOlowCzQ6Sgu2U
	jRWY2jlD/Z76Hf14T5g7XzheFm5cSdCIf4xCYRFAF9d8B6VQWazhxQeA/HgokyKf
	bUubgagLZe39OdCojqUBjLiigzc4NUB+CcfkpwJekYZDsxtN1yiDbMqaewtLz4mk
	/4fk4W4lo0ziF+PexVOoPhXkp1fdg/B4ccij/RKf4GSbvST3KEMDfbVvDiM+bayI
	6ELgY7xsGLak7gChHAHWmTGQWzFPdFWgbYV+ORDa4RH+GNGI9TEQUj8NyG7h+/td
	qPMvk5Wv+B284qZENPros14Qoq+ZCVKrNCBIhK+6luRxFYNITsNDYFiXzb2UptSA
	id2/Ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5j9du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:55:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-392cf18db8eso869319a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786514120; x=1787118920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj5Fm3PrD2xHmK1fpjPQgyYteo7rmv7BUDtCA9Zvfic=;
        b=Tw5lsXOkIk/Xe6Yxsv/9NWdcsT8XXIpM715pj2OV5lpEK/P+vJTOVI/syIiVr/lsDp
         ErBKchnJ6p6u7dxBr9uHFqCOZpRsyxxg1XTSXOJldlt2icBotVVU4NjUY50ExWBY9z1r
         ET/xi+QGWylJh+5nHVRyx0xLL80SSthNa3q3ALMj31RwzuBk5dpVPFS4kZ0N04wEEs7J
         T84bPzniIug8TakGrYAa6PIwKPINUrmN2UTLqf4oxB2vuO5F562T2JaglJPpgglpYCxh
         jn2xwg54ZiSEOab5idgVOK+u7uIsJoEPYrAegb7/NRyGgcyTe6MYaoTBagiwEum0J15w
         T2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786514120; x=1787118920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj5Fm3PrD2xHmK1fpjPQgyYteo7rmv7BUDtCA9Zvfic=;
        b=rXc9X9Bt6YxmKfFC8gHOPVnfdXaVGBmtzZrB7ceBAMnfUGNTQ43JSxmoNBI6NSMpbC
         bBtvGNoiYCirPZhvOAJWlcjoJJfPSDNaYCgeLuaUIQnxrvLg0xtPkl8QmQ3dOo0BR0eA
         +Jk1Radilc7aQAP/lE2xPoqBgaxftctTfmj/ZhSDqf1r3nf+6t4AwZvm1tjw8zF9D72A
         V3+9KVfQr/aWxHbzGzTnJS82reitXIQrPYDI0G2fSSO40gQwV3hjohhklXWqs+S/KeP7
         GY+CC6Or5vVJk+dRCK3JnwYAQ7Qz2E58t/VV/J2r8zpSTZQdnZhK9uprxdbtJxCNIq6g
         6KGw==
X-Forwarded-Encrypted: i=1; AHgh+RrePJwtI7vLX6peMAUYdaca5zaE/qZho1eN3S6qYTvRGNPquCHiSEtC9Nne2Bo5qiGIeRBGg/rCqHU0jmsa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5i2shEcnVuFf+2Otp9dieMI2cKp/epknt6z1DPo3C3R02KUZQ
	c7hjCJuU3QkcsvqvOWw9uja4fkoyaTnk00QAkIRaF2K6C0IT+16cNt6I8ylWBu0i13uNitecbOS
	YOtVc9bI8HmJNi9miFH5oVLGSTJfkZ874/RMacsAcVJrXreca1NOhIXYarykobvncTkZB
X-Gm-Gg: AR+sD114BcTEh5Agj2ART5aDQi25V0kQ+GTVWWiiegkJsAKGz+k4AVjvxTWY8cqbo81
	bTjpm1NsWyN+eiyxbQXCv4ExuqkLCMDyGm2r3T5lj0pzCTU0nnFZzHLviDmxQT/ujFmK9cOwZlT
	UpBdN0o+i1SUJlfnbXLDH1PPBMXdWIPRbzRmUY7aorA5mmKUXKjAscXg4XE7RFCRH7jMcmWBZN0
	/xJj5Wh834AuTQ16mo2hjBg6CiE1/P6uSx6vNt6il4cvdTaG401wlN8/xeulFlK9GL2pC9eUX5o
	kHKUHhVujGO73X+/w00J3ML1gxt65j824q7BugwtYynZ2jqUQcX9iNhhf59fhuxmhNTFDd+vIQO
	+DhhS4nFhNZwxOkH52fXSfXzw3UNZ1ngPdg==
X-Received: by 2002:a17:90b:2d87:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-393013c41e8mr2796244a91.1.1786514119835;
        Tue, 11 Aug 2026 22:55:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-393013c41e8mr2796180a91.1.1786514119289;
        Tue, 11 Aug 2026 22:55:19 -0700 (PDT)
Received: from [10.218.18.194] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8cffe2csm2208168a91.10.2026.08.11.22.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 22:55:18 -0700 (PDT)
Message-ID: <7a17da3d-c838-4877-8a62-5551dbdaa9e5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:25:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
 <hf6szamduxopeuvkjkxxteqauirsgfq36pih7go2wf25o4zmv4@vhmhe3gyzgo5>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <hf6szamduxopeuvkjkxxteqauirsgfq36pih7go2wf25o4zmv4@vhmhe3gyzgo5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0NCBTYWx0ZWRfX0ASfCETS1+p8
 PaunJz81GwSMU2F2c18vQ+Sp9IVVLTPtuHvsSuOC5Xctt4vxIH0T4mO3shGAKrlFB06h18F06H0
 xFkPn6k3F9cQZab1VEowoDeCvtpR9kA=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c0ac8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=LRpbSB15B1xe3DutT7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Se5oP1rDt8OFn3_9Ca4M5-r3vHLuNYQ5
X-Proofpoint-ORIG-GUID: Se5oP1rDt8OFn3_9Ca4M5-r3vHLuNYQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0NCBTYWx0ZWRfXzeH0xfCbfjU/
 F44NFefw/SHfYvIW1fgB0YYZTJH2r9m4JhGjqBmB5duc5xCnQNDMqUdHgW24BLrr7L02izaHLcK
 DaJLeaiA3w39HS7rX3lBlnlorShfFmv13xiJIFj02GgIZeQT7hKXgtU+rwstsYDxDefl1ZnceZb
 KUtmzobcalY7NTfoC41EBUCkaICjrywHLYN8fVBlLCblEOUqp99WnyUzkF6V3VZa3gNslCPhUqA
 A7CNjztLm+eT3ssmbxQLhXtkHAl0171YDVxsrSBzwQTvYg3YGYBiWRwJu/70X2cJHe1S+TcES1e
 jq0BWREHAal/dhfUCpTN+ntUKkvoAWF0vwZ7dHm9TbfTPCvmwG5vbCtnEIRFfJ87q03YeITIogj
 gHdcaPeHjzIOausnaHX7kY3+wti1glqRbkrU1PBICkfY4NqEP9egRjd1/tAbSse0/3Gj5qsxxxH
 3FGKL/w554D9VBo0kAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120044


On 7/7/2026 11:31 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 12:32:44AM +0530, Sushrut Shree Trivedi wrote:
>> Add a dedicated schema for the PCIe controller found on the Shikra
>> platform.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>>   1 file changed, 211 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
>> new file mode 100644
>> index 000000000000..f9d1dba9dd2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
>> @@ -0,0 +1,211 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/qcom,shikra-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Shikra PCI Express Root Complex
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> +
>> +description:
>> +  Qualcomm Shikra SoC (and compatible) PCIe root complex controller is based on
> s/PCIe root complex controller/PCIe Root Complex
ACK
>
>> +  the Synopsys DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,shikra-pcie
>> +
>> +  reg:
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  reg-names:
>> +    minItems: 5
>> +    items:
>> +      - const: parf # Qualcomm specific registers
>> +      - const: dbi # DesignWare PCIe registers
>> +      - const: elbi # External local bus interface registers
>> +      - const: atu # ATU address space
>> +      - const: config # PCIe configuration space
>> +      - const: mhi # MHI registers
> MHI is not optional.
ACK
>
>> +
>> +  clocks:
>> +    minItems: 7
>> +    maxItems: 9
>> +
>> +  clock-names:
>> +    minItems: 7
>> +    items:
>> +      - const: aux # Auxiliary clock
>> +      - const: cfg # Configuration clock
>> +      - const: bus_master # Master AXI clock
>> +      - const: bus_slave # Slave AXI clock
>> +      - const: slave_q2a # Slave Q2A clock
>> +      - const: ddrss_memnoc_pcie # PCIe SF MEMNOC clock
>> +      - const: tile # PCIe tile SYS NoC clock
>> +      - const: qmip_pcie_ahb # QMIP PCIe AHB clock
> Why optional clocks?
ACK
>
>> +
>> +  interrupts:
>> +    minItems: 8
>> +    maxItems: 9
>> +
>> +  interrupt-names:
>> +    minItems: 8
>> +    items:
>> +      - const: msi0
>> +      - const: msi1
>> +      - const: msi2
>> +      - const: msi3
>> +      - const: msi4
>> +      - const: msi5
>> +      - const: msi6
>> +      - const: msi7
>> +      - const: global
> Same here, why global interrupt is optional?
ACK
>
>> +
>> +  resets:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    minItems: 1
>> +    items:
>> +      - const: pci # PCIe core reset
>> +      - const: link_down # PCIe link down reset
> Same here.
ACK
>
>> +
>> +required:
>> +  - power-domains
>> +  - resets
>> +  - reset-names
>> +
>> +allOf:
>> +  - $ref: qcom,pcie-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>> +    #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
> What are these includes for?
ACK. Will be fixed in v2.
>
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
> Get rid of 'soc' node.
If we remove soc node, dt-schema uses address-cells = <1>,
size-cells  = <1> for dt-binding check and throws errors.

Do you suggest ignoring those errors ?
>
>> +        pcie@45e8000 {
>> +          device_type = "pci";
>> +          compatible = "qcom,shikra-pcie";
>> +          reg = <0x0 0x045e8000 0x0 0x3000>,
>> +                <0x0 0x60000000 0x0 0xf1d>,
>> +                <0x0 0x60000f20 0x0 0xa8>,
>> +                <0x0 0x60001000 0x0 0x1000>,
>> +                <0x0 0x60100000 0x0 0x100000>,
>> +                <0x0 0x045eb000 0x0 0x1000>;
>> +          reg-names = "parf",
>> +                      "dbi",
>> +                      "elbi",
>> +                      "atu",
>> +                      "config",
>> +                      "mhi";
>> +          #address-cells = <3>;
>> +          #size-cells = <2>;
>> +          ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
>> +                   <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
>> +                   <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
>> +          bus-range = <0x00 0xff>;
>> +
>> +          linux,pci-domain = <0>;
>> +          num-lanes = <1>;
>> +
>> +          interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                       <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
>> +          interrupt-names = "msi0",
>> +                            "msi1",
>> +                            "msi2",
>> +                            "msi3",
>> +                            "msi4",
>> +                            "msi5",
>> +                            "msi6",
>> +                            "msi7",
>> +                            "global";
>> +
>> +          interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
>> +                          <0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
>> +                          <0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
>> +                          <0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
>> +          interrupt-map-mask = <0 0 0 0x7>;
>> +          #interrupt-cells = <1>;
>> +
>> +          clocks = <&gcc GCC_PCIE_AUX_CLK>,
>> +                   <&gcc GCC_PCIE_CFG_AHB_CLK>,
>> +                   <&gcc GCC_PCIE_MSTR_AXI_CLK>,
>> +                   <&gcc GCC_PCIE_SLV_AXI_CLK>,
>> +                   <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
>> +                   <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
>> +                   <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
>> +                   <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
>> +          clock-names = "aux",
>> +                        "cfg",
>> +                        "bus_master",
>> +                        "bus_slave",
>> +                        "slave_q2a",
>> +                        "ddrss_memnoc_pcie",
>> +                        "tile",
>> +                        "qmip_pcie_ahb";
>> +
>> +          assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
>> +          assigned-clock-rates = <19200000>;
>> +
>> +          interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
>> +                          &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>> +                          <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
>> +                          &config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
>> +
>> +          interconnect-names = "pcie-mem",
>> +                               "cpu-pcie";
>> +
>> +          iommu-map = <0x0 &apps_smmu 0x800 0x1>,
>> +                      <0x100 &apps_smmu 0x801 0x1>;
>> +
>> +          resets = <&gcc GCC_PCIE_BCR>;
>> +          reset-names = "pci";
>> +
>> +          power-domains = <&gcc GCC_PCIE_GDSC>;
>> +
>> +          max-link-speed = <2>;
> You don't need 'max-link-speed' unless you want to limit the link speed.
This is needed since Shikra controller supports Gen3 but the PHY
is only capable of Gen2. Without limiting the speed, link-up fails.
>
>> +
>> +          operating-points-v2 = <&pcie_opp_table>;
>> +
>> +          status = "disabled";
>> +
> No, you should not disable the example.
ACK
>
>> +          pcie_opp_table: opp-table {
>> +                  compatible = "operating-points-v2";
>> +
>> +                  /* GEN 1 x1 */
>> +                  opp-2500000 {
>> +                          opp-hz = /bits/ 64 <2500000>;
>> +                          required-opps = <&rpmpd_opp_nom>;
> Are you sure that the power domain need to be in NOM for 2.5 GT/s?
Confirmed from HW team, both Gen1 and Gen2 can work in
Low SVS corner. Will be fixed in v2.
>
>> +                          opp-peak-kBps = <250000 1>;
>> +                          opp-level = <1>;
>> +                  };
>> +
>> +                  /* GEN 2 x1 */
>> +                  opp-5000000 {
>> +                          opp-hz = /bits/ 64 <5000000>;
>> +                          required-opps = <&rpmpd_opp_nom>;
> Same here.
ACK
>
>> +                          opp-peak-kBps = <500000 1>;
>> +                          opp-level = <2>;
>> +                  };
>> +          };
> Odd indent.
ACK
>
> - Mani
>

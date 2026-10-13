Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52599511E7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898810; cv=none; b=GIwDNAgWDToVxZw3sa/k82yONMooOeJqzSxP7u6rNieNBj6n55UpmQWInkWj8h8ii+il3fxchRiVN7qA9fR3xoUf3pTNpfbA6K0uI03YnpX3tY/WLzTdYdk1S6lQIzZnDwDMeSZ+SXDJiWWvfqRHjsAM3GT9Qc+WzTAo97Sg9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898810; c=relaxed/simple;
	bh=5n1C5kdCuZiIv1NyJcV5joLpU2VBYIV+zY32x332UOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWnM3pJI48XfeG2ilogohgb30QJx7k73LDVJp9woTIVJ03fwUKwbzoHHXviN1CJPWRJO2dmQLlhUbaJSCx0nNHnM/8+AJsTgjqL0YcsFoUP03PwvShrPPa31/WOuYACJSrNwAOxYpgOT4qLcgLV6J3DsjN0L3sKjP9FMgKSjBJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH3L5tMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d35sJuWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH3L5tMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d35sJuWp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBXH6A3208501
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=; b=UH3L5tMkItOQlQNK
	1c1i3vhcfEs6JQ/w/TPdLOauCQFF51bYMKjt89FepPEHwq0VctK/OYHPN20/xVlP
	ko7TN6kZ8+LESyfd6aCSi8JSB1j8xAALBJtYzno8koFYS7GNsSdFxLrYm97++L8r
	nGZ7U9k17/4UwhhPbQLS+jxYwHr+zQpxfaa7HUfueYYXMEIFk7YDRuuqUF0Hj/J8
	f6DQ6i0XKmIfmdP9sL9oVQhkxmtn3TK9LTHFBPKi6Bf5UJeGm9bvECUTDQGHkdz0
	ZytmSohAOwCtAKwyhGcag7Q+sIckJLyixGPRXIseeHOjRtZ7MEUDZuyLuZBSXo0T
	DBH5BQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjhr0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0a4f77582so22671177b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898808; x=1792503608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=d35sJuWprkv5jFWEjZmD8DTa30mQJwWYVzTCn2Ptg+gtf7nb4QwLhD20jGsi5bkUQX
         snJC4+++vwhfNGTSd7mZroty5jWZYPSzokSYXcUOvZLSnMmf3Pm1WIHq7OENR84M8FRf
         jMBRWEETLhnXmSzldB+nszofaTIRQrWFdaQX6/+LB8HY3HmckSA9YT8wnEkaYQ4pKzyg
         V0NkXB+3d0hyaUnimkxknSa4gwVAmFOFkMymUnTEc6Hz+NRYhPIJxdiHgtPDfOINREZ+
         WADukH7NJvtUuheeP7y8ZkaIZ1twYHDVjmxY36ZbiuDozWGvcRhehnDY7bDxHKZsdEUN
         LMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898808; x=1792503608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=TqsC/VS0rCQlc2kjVnt6z9iPXuPZkEGqTF6RTpuDcIWn3z+gLHGYYFXNORfsqZkVkK
         eOY0PPQTwqd4opnnm2WnMAUS3Hf6yKyZzKTeuSRveiN3GGW9ouRteqgy73t6Y9STx5HQ
         6SCccrKR0uqOtl4q54fxLPQTWAmXRB4+qrIcghhEq8Lf0Qf5DAujskjCKRdxH6BcOvUX
         hOQ6OLEmwxuwIzSNKX8G7GHFwkPKPfS3CSSOTzin5VDcytRE4yIh1KKNlDTJNsZSMXsg
         DmTkUNY4/hgDdr3o8U9H53TjaoX8vgI3+aBIoNrnl5ZaSWU5SDlooIlC2Ltnb3O/PQeU
         797A==
X-Forwarded-Encrypted: i=1; AKwUvBzS1LV+y/bzmfn2G3bb87a0Gr54p2d2IRuSYOMUy3/PaKVGelJ20VldkuFkA3D1QOHeRYPAg+qncJyyqm+g@vger.kernel.org
X-Gm-Message-State: AFq9FYI8XJ/VoLDWOdEVhk+BIcaOSdMjufrrcjHUgOawocv8pm1bdvm6
	FetQrBnCS1ZvZ8uoDyZz6sHX1ZNSqND76b6rZM01y6cMYeDg8RBN3hgWTFULW3YsQjWjAmI6Hyk
	0Y6lqY+lFvcxJw8jHRVIUtOOdw7gEm/BvWsif6z62o9YUwr8VCfq8oRemjLOyWihrwk6j
X-Gm-Gg: AYBFou0fT88R/Izs65YW9FLw/xus/ufSuL4g5Od5IWycvtwmXIOyhATEuykxFNOOkGt
	iEa25S8dl1E7wWFr+6mDX4tCBERhkVVuT7/LgNagWQjSmNsk11zl1KcMiFOxBby5pQlhgJ+qGd9
	7MXs1xAfeB3zm1sTgIs8blk5yUdR7Bp6rGMIAboLG0R6LnwBQ2moMxiIXcbQaU8vkcrw5ahwESh
	85OI11LnHsJJRjcY8bM5ZNsmcCr/JwbkHMswWNuAexa8qznI7bCwDuvRPtVKb76sOOU+PsNaGA9
	J8MY2PyR6PJdYjEjdQ4/9ZajX5jXslFpDETUdM8t716RX08wdj2pCb2WpidKn3zDJZMnRKNGRX5
	opiuG+a6v0y4x9suEqzcDXhU+G5wHVw==
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15866017b3.14.1791898807286;
        Tue, 13 Oct 2026 06:40:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15865827b3.14.1791898806727;
        Tue, 13 Oct 2026 06:40:06 -0700 (PDT)
Received: from [10.217.218.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1c8612sm46658947b3.15.2026.10.13.06.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:39:39 -0700 (PDT)
Message-ID: <19dca84c-68b0-48de-addc-399c406fb152@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 19:09:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com, sriram.dash@oss.qualcomm.com,
        jack.pham@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        shazad.hussain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
 <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>
 <20261013-light-significant-markhor-c30eea@quoll>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20261013-light-significant-markhor-c30eea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BJf6-McRPfuIogeoG4Wu7B55hYtqL9My
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXyj81+wOfI+i/
 QTftPyCgV4Dc1hdH2w9QZ33W71/S6b+LPhEmWhzs/GWy90FvLigOaNbgNQHet+kNYivabO2Vo/L
 tOtZ9LJNqhpLMF55D9VlCQGHvqdNuVkzYSxwqB8XH2pTQW1aC4JKFxw+JBrAckNdfJCMvo/3eO/
 jtfEyOH8MRzjJvZOe0i4pp4IMVXVc4z0/DM75156G/lUbMgQnmEAiWG7OQGGJfoIW4TuGi3+vLV
 z5MZ+eqj6CLplNAlA9Sowa7uO0KbxKwip59ZBs3mKFaFMsOb5cnskryEJZtFQZsTferyBeJYzE9
 DqqbFt2d5NEnhbzFgWHVRH5lH347RSb7JMoACqgk9xsNSuwnoCZmkgy46/foUCZ18hOe+LY/U45
 K6LDtcrWkg+fvYTPjKYSIWkCZXvLg+41VCRfusaKgvejSioo64ZKIGjp1FxYmFC/z4piZ7icAqa
 3VqUR/mg52yq+dzAIyw==
X-Proofpoint-ORIG-GUID: BJf6-McRPfuIogeoG4Wu7B55hYtqL9My
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace34b8 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zkeY3IreNFxg1TzoVDwA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX5ghc91IjWt3z
 7LrtXoPor+gGduzHSg7pWQcARA6tRtQrdmkNxGXSaOFDfqYUqBWK8sFS8iCpnIFOvmb8CmmmLs1
 U/SnQl1d2uPEY2Sc3G/rr1sL8Obaf10=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130054

On 13-10-2026 12:50 pm, Krzysztof Kozlowski wrote:
> On Sat, Oct 10, 2026 at 11:02:42AM +0530, Faisal Hassan wrote:
>> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
>> interconnects, resets, regulators and GDSC are abstracted and managed
>> collectively by firmware.
>>
>> Add a new binding file for firmware-managed USB controllers where
>> access to these resources is exposed as two power domains:
>> - Power domain: Controls power supply (GDSC) to the USB controller
>> - Bus domain: Controls clocks and interconnects for data transfer
>>
>> The binding makes power-domains and power-domain-names properties mandatory
>> for firmware-managed platforms, while excluding the clocks property since
>> clocks are managed through the power domains.
>>
>> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> new file mode 100644
>> index 000000000000..87f426fdbd70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
>> +
>> +maintainers:
>> +  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> +  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> +
>> +description:
>> +  USB controller on Qualcomm SA8255P automotive SoC where platform resources
>> +  such as clocks, interconnects, resets, regulators and the GDSC are
>> +  abstracted and managed collectively by firmware through SCMI (System
>> +  Control and Management Interface).
>> +
>> +  Access to these firmware-managed resources is exposed as two power
>> +  domains, one gating the power supply (GDSC) to the controller, and one
>> +  gating the clocks and interconnects used for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8255p-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  interrupt-names:
>> +    minItems: 5
>> +    items:
>> +      - const: dwc_usb3
>> +      - const: pwr_event
>> +      - const: hs_phy_irq
>> +      - const: dp_hs_phy_irq
>> +      - const: dm_hs_phy_irq
>> +      - const: ss_phy_irq
> 
> That's still unexpectedly flexible.
> 

Ok, I'll drop minItems so the list is fixed at 6 entries:

   interrupts:
     maxItems: 6

   interrupt-names:
     items:
       - const: dwc_usb3
       - const: pwr_event
       - const: hs_phy_irq
       - const: dp_hs_phy_irq
       - const: dm_hs_phy_irq
       - const: ss_phy_irq

>> +
>> +  power-domains:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: bus
> 
> I don't see how did this improve. I asked to use existing bindings as
> reference, so why aren't these power and perf? You wrote that bus
> controls clocks and interconnect, so is this something different than
> perf domain is doing for sa8255?
> 

The sa8255 "perf" domains (e.g. GENI) are SCMI performance-protocol
domains with OPP levels. USB "bus" is a plain SCMI power domain with no
levels, only on/off, so "perf" would be misleading. I'd like to keep
"bus", and will drop the redundant minItems.

>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> 
> phys should be afixed, constrained.
> 
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 2
> 
> This as well.
> 

Sure, will modify as below.

   phys:
     maxItems: 2

   phy-names:
     items:
       - const: usb2-phy
       - const: usb3-phy

>> +
>> +  dma-coherent: true
>> +
>> +  # Firmware-managed platforms do not use direct clock/interconnect control
>> +  clocks: false
>> +  clock-names: false
>> +  interconnects: false
>> +  interconnect-names: false
> 
> Drop all four above. Not sure why do you need them.
> 

Sure.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
> 
> I guess phys and phy-names as well.
> 

Sure, will add both.

>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
> 
> Best regards,
> Krzysztof

Let me know if these changes look OK, and I'll send v4 with them.

Thanks,
Faisal

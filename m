Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57367361667
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 20:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368548; cv=none; b=q+N0oDBhAio+nMtXJSvw5nEwJ3umhBIFjhDyNTcG0qvm7qUTWN8/VzuTP6VszFO1nMR1pRtqF2ulzHYuVP1oM28pwNNvsTR9/pkQ0wkGrjWKlqzQSOh+fz1sMF164wF8vqtT9mb0Zup6bb4OmTsMZW05PtwmS1aEiP6jH9PuTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368548; c=relaxed/simple;
	bh=JSLtS992gzEGa7aY5efNv4vm87rHU61wMC1Pm4bVtYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0i0TmhT3Jph1Yq2YfMne8oB7n4Sb+I2VtzAc3IBj09BhKUDmlEOp1XneVkKfM0REGAZpEcvbaehqG22/pBI1K0eD/kgLHZKngGeSmy3hisCyZEsT/BxQ1kKCmWLdFnqY3MiAe4VNHEWPqncYv9x7KjqD9xdPkyzOCnIJDg5Wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGfDl3Bm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NADl1V6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGfDl3Bm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NADl1V6y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PInuV13014944
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 20:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=; b=QGfDl3BmFP6eS54p
	VdvF6CjQXuQ6nYZOAfMU6xfFfMPTZVSTYW1YJ5JgLqZH75KtmnCQOt9lOLVE/j3E
	5gJdAqeA14u1Azw+7KSArq/UO2map/B1Z6nvXTgfWtQU9CxeAO+QzZQMqpQXkxGV
	t5pEdnuyYyyX2hwRzFYBd+EqRMRp9asqnu0zk1J3tEfnnF7wF3H5oqo3CfSvqIT5
	JNBHfbgqo3lXuc4fBCDOXrUoQZ2WvL0GU8Q/MXo46yUMrPtkJWkkLwpHkpLaPaO2
	3swkjvvcY4j7PyG74TeVfLr58Zdj1se8tlhbtuaHTTyfSnzOiseT/7y+p6rtlvvb
	ToxmFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk16y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 20:35:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342b66c0b06so282005eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790368546; x=1790973346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=;
        b=NADl1V6yfG20dUM44scP+8CcHKdmyERbVvyZ5jkg344Du4EGPhv9q3tZvVuYWWBhQ+
         b6nsNcPTKKnwGZ+cL5GOsWxobygHG3UcUI5mZW0UOl2AceNa3QMdqjJFU1blMh0sT2sF
         BkSOjuqobxmCAPmasNa4jzfbToS6FzuqeS1y+5sZy0XHZ2F8AotvBCpIyUQNOH/dGDwt
         nyl+Udw9CmUQRPvMSX00wHn6u7oW6LlxDhvcsI0/+iwB9zFUnn5n7JU74Y7kqdKfOq6p
         4XzHEGM5f39eiHV2R1lEpebnNrgAlH4OpDGjrJC4A19eeIClu251SO+PkXoXkagFikmM
         4DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368546; x=1790973346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=;
        b=hBki8G9TMS3hnc71/qNwydJSv432rTpfDTN/Fv8u+a+C2eTvJnu16+rd8s6lKVzZKX
         3xh6S9NqLuQHmIl2ekUgyiFOkK8K+jM1JfWOgRTGH/59lrGEedEUvojnMnq1AJAvVXs/
         yaIA6uIibWP8Xt8k1OvkGIsdrF7ZK7wkFjSgSdeWZqKxXqB+fjZVI3tUh8KBYeRW3tH6
         +uzs5jwDlAK1Dj+AqwMCU64t/ZUCul3EcvZRxTUyfe9LmM7j+1HM+aQBszf42h1Df5Kq
         VkRgMLzG84SM8Zu5D93Q5tIpVKFIxO7bb6VvZ5ezeeFG6RudFsqjx+twOxQxuXmAaS/L
         QJKg==
X-Gm-Message-State: AFuF++k8aWxeXx99hCthPz3bwEtIJ4PKNPwqEag/iFsAqlvyOMp/wI3y
	3GP5umd0KRTFR0Qpma+G5uNtwXPPALdZoAM4U3pwL8Wf6l8fx8/n0ASWNrpO5EY9LRoaeV6BgBX
	gYOovU0Xt6J5yjPqfrVBbSSDIyNdYvP5hhgqnMO9gaXAt2ORTdwA0eE0oSs0aqOQ6O1yr
X-Gm-Gg: AYBFou16hIK0fzaQ784IaRT05WCmcfNbzzWSAqKhcfa/PNgDLaAn3NwANVrgY57lWQ9
	8EQyGxEN1EzOvB0naRokEOqANxzFdwfOcAug1CnjbLJGGj02sa5+fJiczVShyzrOnd0CWgaZQ9d
	9QBXYRZc3qqJm5/M3SB2IutmElk6RV9h97UjPX7ysgqEXAmYMiC14V0hxxGLap9BPZn1xKOtWCa
	CJ78LJCKF2SERHInLNaH5vlyTO8JfmIWJGh4xpLB92LCBRCUiIqAmmEpb2ph5nXldEkH5uhtAuK
	tcd8e0ec72VBsW1lWK9cuv7Moq5MKhlf80TO+yZOuYG5bpoePuFzfvS37aF1gKyw4leQx+L0/6v
	firMO7HHDSSPmy8+HrdGNrlJC
X-Received: by 2002:a05:7301:7183:b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-34270ab91a3mr949106eec.10.1790368545265;
        Fri, 25 Sep 2026 13:35:45 -0700 (PDT)
X-Received: by 2002:a05:7301:7183:b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-34270ab91a3mr949065eec.10.1790368544367;
        Fri, 25 Sep 2026 13:35:44 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341451457d0sm8858485eec.21.2026.09.25.13.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:35:43 -0700 (PDT)
Message-ID: <680e632b-c919-4c25-8f25-a6bd9550ba6c@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 02:05:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: display/msm: Document A850 GPU and GMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-10-0c3c79a1a470@oss.qualcomm.com>
 <6c8aa567-6ad9-4aed-a7ec-5d2cb6979384@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6c8aa567-6ad9-4aed-a7ec-5d2cb6979384@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k-OZUmDn5ELnr7lk4QrS2-031w0e8iak
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MiBTYWx0ZWRfXwGsvWw0OoiWh
 lBaohRALVSeRG0NDwEWJGUNawqMgm0/UPCWycmEyQ7675SJtQas3hX0uuFL5bHd6zJC3ETCNSDa
 uiqgTK3BxauD+7OZXLy3gHAmUto6LzM=
X-Proofpoint-ORIG-GUID: k-OZUmDn5ELnr7lk4QrS2-031w0e8iak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MiBTYWx0ZWRfXw3Z3ASrEuR07
 xdsHuN7jemm3en5oenBs+glI9MHRZGQfAogjYFvVCCtDVmxBbLwOeltNCSMsMW48mcbm6yucdbO
 307hwIZpje0xrerj9trvmSZnRWnkXPJHpIB07lDF1WGjaYjgh0Pxkrkm8N6hv5GLvy4zLk7zoJl
 h+6UJwDfr4MxkDc17Qla/aBhLRUUh/6iNUz3d/DYO5H9Q20jFS2EHbyksplOrEU49hdogN+UBCH
 D79FPdnbPjQ53feO0u5X1qjesPty7oB4t3j9ekt8KFHK7NtkKyGY/gamQhu/x8v0/C4o8Sj/Klx
 3Lxo3HbaOcyjK838+6JhvRPcYhVm+qazkjV8HPAet8vC/v8+FLG3AA33W9CTqIi8RSf0uG9Y8Bi
 QCoqiN0acFRo4QLc+uvzRcPPtA2c8P75h56BLp830jBrtuQx80TRdnRkCPHBIpa+fCHkMF8+bA8
 MlEvk6KL2ODuFx/ccGw==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab6db22 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SG-BlJrJjKrpKyBIS-0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250082



On 9/23/2026 6:30 PM, Krzysztof Kozlowski wrote:
> On 23/09/2026 12:25, Akhil P Oommen wrote:
>> Adreno A850 GPU found in Hawi SoC belongs to the A8x family and is
>> the successor to A840. Like A840, its clocks are described in the GMU
>> node and it has the following power related updates:
>>   1. GMU is now powered via a dedicated GDSC connected to MxG rail
>>   2. An additional power rail called Bx
> 
> I don't see the updated related to (2) above

This rail is voted and managed by the GMU HW directly. I will update the commit
text there to make it more clear.
> 
>>
>> Describe this GPU/GMU along with the new compatible strings.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 44 ++++++++++++++++++++++
>>  .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 9e459f12ce3f..875fd1242528 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -55,14 +55,18 @@ properties:
>>        - const: gmu
>>  
>>    power-domains:
>> +    minItems: 2
>>      items:
>>        - description: CX power domain
>>        - description: GX power domain
>> +      - description: GMU MX power domain
>>  
>>    power-domain-names:
>> +    minItems: 2
>>      items:
>>        - const: cx
>>        - const: gx
>> +      - const: gmu_mx
> 
> Your commit msg said mxg. Or mx, because this is GMU, so saying that
> it's power domain is GMU is redundant.

This is a GDSC that sits between GMU and the MxG rail. On a second
thought, I think we can call it just 'mxg'.
> 
>>  
>>    iommus:
>>      maxItems: 1
>> @@ -359,6 +363,46 @@ allOf:
>>              - const: memnoc
>>              - const: hub
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-gmu-850.1
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Core GMU registers
>> +        reg-names:
>> +          items:
>> +            - const: gmu
>> +        clocks:
>> +          items:
>> +            - description: GMU clock
>> +            - description: GPU CX clock
>> +            - description: GPU MEMNOC clock
>> +            - description: GPU AHB clock
>> +            - description: GPU MXG AHB clock
>> +            - description: GMU HUB clock
>> +        clock-names:
>> +          items:
>> +            - const: gmu
>> +            - const: cxo
>> +            - const: memnoc
>> +            - const: ahb
> 
> Keep existing order. ahb is first.

Ack.

> 
>> +            - const: mxg_ahb
>> +            - const: hub
>> +        power-domains:
> 
> Just minItems

Ack

> 
>> +          items:
>> +            - description: CX power domain
>> +            - description: GX power domain
>> +            - description: GMU MX power domain
>> +        power-domain-names:
> 
> minItems
> 
> But OTOH you need to restrict power domains for every other variant

Okay. For every other entries here, will add the following:

power-domains:
  minItems: 2
  maxItems: 2

power-domain-names:
  items:
    - const: cx
    - const: gx

-Akhil

>> +          items:
>> +            - const: cx
>> +            - const: gx
>> +            - const: gmu_mx
>> +
>>    - if:
> Best regards,
> Krzysztof


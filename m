Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216723C09E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650346; cv=none; b=XfBfWYJF1gYDC/FVuZahDWB9cVX5m4R4RojMDfo1Br1ngHff3nw3X9Mrb32T/UDzgv3FewKJITvd958w4do8UdvwJssepXO3ZBVkQRzIwhd9P+iWu4V6ax+FvgTLyy/aRvF/zFAJdcSrYtCE0Zggu9gfYi6F3AzYV1TE/sCGpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650346; c=relaxed/simple;
	bh=Huy42Y0tm9PPznLW3sAAsQFXhfns6BsJrA4WTApQt9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPT8J5TN8Ez/8GaBkSN4EEk8uko8Qo1dE9y2+I/Vbz4LJu6MwOpnNrZ3ob7kKNtUw2a9eMu7kLhkkt/UmEf61AfAy/shS7cVpquRf3QRHnYGdzo32St6QsjKKZYgHsDRuxMgiULQeIQB+osOdtjxqZdO0vtM8O/mDYUldbEW7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPMDDnkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSlyBaMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPMDDnkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSlyBaMg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZV5c2410426
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=; b=HPMDDnklUAUtsmv4
	6CwlBbJLv9wZnAS8k+Z2rF9OtYRQEGkLGFgB/FSoTY1OiqjI/J3uuQF+oV/YiOUO
	+BbI5j+K7g5pu5cwS/1FtSqNouXOKl8fWwk/2g76Hlfes+Kjlng4ynuoXIsKoova
	mnevW4akSNddPK3cVDZDviJcBbk8i1MNGjOzPqu9WK0CpVgFKu7VE3wsZ8/X6N1Y
	1gj0oxi/HveERGAVPc3+hcDN69UJ1YXbxelrUx3/5JoiK9STxmedVWVTYpz5dYYU
	eBhhjXNehj2LihRorDyDTPhZw0fS3nNheOJZoUGbLtjni4rdj9Rl32/OnT55jVVo
	ng6HUQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gy5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so1429708a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650334; x=1790255134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=;
        b=XSlyBaMg/sCyEDiFxpapHsdhuypzHDm7MhRYaefXFHnFmkaBid8501uvVUtVocO1eM
         iKQywpzSRNXZKaQu8jvNlq3u/4vkNdiOFzvpI8iO0nyCox3axdBTxxbLMGsD6hblNqMc
         OJ+z9xvgtekGqhBHAZpQc0Gm9yvU4ylhwpbhEepMYp3IGX/4up/weaobkeJAOY1B7f8T
         NNL2fX6AcEgWR97mXu/8AB4Lm3t7eOmiosp0AT6C8h66Whti+8Cl+NlxIsNF89AvnEWM
         DDQOfLdE4/5iz3nyIUp3Q26rd9mp4SNsz4EhCktsqtiuFHDc5q6Sx6lno3sokw1HP27i
         JO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650334; x=1790255134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=;
        b=HMBOegK485MVXM248Jdd8JZjvaTTvBhW6FGYHxHl/EY3PiXNe48lzAK2ANhBtuG4UX
         DPOhDkS0Ue1X96d5SMRWL/8h70b3V4LYE6/pfy3cpc+yFJpw/CvDxgvqQHljYobRpks0
         qaIC8DzRvdTMa32ABWdSXQP3K1Tc+ztZs6U6ah8ppWtesZ7/0UAvTL4yOSvvL8fxy90e
         Bab/jXaZjW3Bu2tBXqM0mOZ7/WSeNpij4V/6bQqvxC5fy+X4Q46a8rmK/muIY5pViT/Z
         YPc1JeVxjn0Ubf0OWzXzlaIfEi+9tOITgXcdMC7XACabnekTC6WZ2hFEeWa+oZuhFvH3
         2UcA==
X-Forwarded-Encrypted: i=1; AKwUvByE8YF/M2mfzjyQWdUa1Pth7PNNzfr585ki9wMTMDat9kHwnk6YMU0PIG6MCd6hsp7ztQeI0d7WRCI1dBkM@vger.kernel.org
X-Gm-Message-State: AFuF++loGleCEAc5oRyOMMt/bKKD0aMnbbZfT3l0exFheBNNnIExZrcs
	p6RXayvGJVYDVNYbFkxP1nBMBC9mSCZea5VZxSm6EcF3L3jTUiYpb1J96se6968q4DYtKnuBUq2
	p+DjM1N/itoFdEeQalhk1lkEAbEtbzzEyWrWleMjEw42ZnVAAElOC5bzePZHyA/d6jht8
X-Gm-Gg: AYBFou3CeD8LzJhk2Jyn3QKswGPXz0aT8w226SMuNg0xy0Uf91XBroWnapqmFZw/kTl
	9qtWbwmfcxQlG1AMQLL0jqYoCiyHcwBpA8A7wyjtfYhButGpSGbvcytCgtFucgrnOs29Kyj0zkz
	BYABrEH8C0AqA/8k0nBNGYT0a+opWrW159KlnvpNZEiFOS8dz0HbQXkruUkUgErjmncLReg/IL7
	RGWN3Rv/xsqP7ksxWIRv6RUjK+WvV0wvhQJpfOUtaa3Q4eFFFc7RdBM4XOwTFydH+WGmcGMxy9e
	VoL/wkHxXFiOYPYqNm4gQBvGJwS/aAs2jb8a2mCDbw/mm+d6Vi55jXAx33mn72UdnjttHMuAT5T
	oCKQ2cHnDHmA3dvr4CHi9DG2YI7ATx5BaRHA=
X-Received: by 2002:a17:90a:d446:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39e35daaa88mr4304166a91.3.1789650333888;
        Thu, 17 Sep 2026 06:05:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39e35daaa88mr4304119a91.3.1789650333016;
        Thu, 17 Sep 2026 06:05:33 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39b057dasm1103153a91.1.2026.09.17.06.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:05:32 -0700 (PDT)
Message-ID: <1e30cea7-7bea-4ea6-b111-177adbac02a3@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
 <apmKZl-KaCDg1qmg@baldur>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <apmKZl-KaCDg1qmg@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V3IdUI8Th8rhwY2ofm_kTB_bwg-mXk3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX8A89UYb1jhem
 JEEmMx8RHnkyVaN+1E+W+hLtYByE2He/sb/bXCsP4cLqaGr1yRCPvdHXJtwQjtDQ5ZQXpIlf/S0
 KoT7i86fxzV0zed1HRgtMEC/vFhREJPz0cc06YqPIDdieag/a37FZ2GhgSVmHZ1Za3j6lZOa1l4
 b1ePOahmtgiwQTbZs5VVZ3DDb5LNz0ypfz/ewUz7wonZXfYUJPx+rBxmihLOOL5wiF7d5AuTOBy
 IJWHG4gEVepr2PvskxnPJzMcNC0vSDyDdAmjwmvXqeZda/75p8FBLjVRTlNf/SL0L/nwN7TJ5go
 TAmV693evZPQXebmpMyxMFuWWhZtxDEZdD+ILgrzL2qfaVoRNMl+0CJN/czz+SA4i5V78AnWzyb
 6UNBiHynsZO+2OaFO9XHLpdBGlDXZl4vxjYG1ws2WTbn5377GRt6/qQbIfYMHm8xr4aj5V5mxLY
 3EZ2gRyKlHPUFruQOSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX9+J8RlZ7Blnp
 uj4fqBdFJxvnoUqg9NgHaVO+Kwz/vxpiFKdg6uhWQVTpPfxnbKbqW4s84kHiRaA3eWIQEGDIb7Y
 r5EHRLMzV4jCSzK2TWjVIQzSPV5ILLY=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabe59e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RT33ezYSesx8GuUvZXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: V3IdUI8Th8rhwY2ofm_kTB_bwg-mXk3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170184


On 9/3/2026 8:26 PM, Bjorn Andersson wrote:
> On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>
>> Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Retain Nirmesh's authorship.
Nirmesh has helped with validation and internal review. I will rework 
the trailer chain in v2 to better reflect the actual contributions.
>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..ff7775dcb954 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1056,6 +1056,13 @@ properties:
>>             - const: qcom,qcs615
>>             - const: qcom,sm6150
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,talos-lyra-evk
>> +          - const: qcom,talos-lyra-evk-som
> I don't think there's value in claiming compatibility with the som, just
> add qcom,talos-lyra-evk to the node above.
Acked, I Will remove compatibility with SoM and that will address 
Krzysztof’s naming concern as well.
>
> Regards,
> Bjorn
>
>> +          - const: qcom,qcs615
>> +          - const: qcom,sm6150
>> +
>>         - items:
>>             - enum:
>>                 - sony,pdx213
>>
>> -- 
>> 2.34.1
>>

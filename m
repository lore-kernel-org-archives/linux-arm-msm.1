Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210572;
	b=hS+KwveBekQ8/Ms/G70UA6IRCypf2BMUTzDruNmrgYjId4FoiVQqDRIFVyARyhGr5LIO
	 I+DzzLrSaYfNNRTuBamY3E06Px2e7f04o4tj5/tQ89rEwilEoCJQBD8yMCgPZZyt0jl2E
	 g+af4bUpnwJ5YlcUb3+tyKtwY4MhSFSlrHJZewjFLPcVcHa4XyXahFuTwq9CoClddsWHU
	 ziNbLkIY1NwKG46nVuBecdp6RPuCjEtJmT+A16vbNwpOmAtfZJqitarb9A11V8UFHRrtU
	 2Z02XTpKEsn8xm6cWNH25uhA/+Rh29BQBn2GVqvT9gda8wouafMRKxUlSmWGDzHM/1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
	b=L7VqRmka2I2zvGfzhOQfDewRtc5dRBBKRRnbs5Dfb+AOrVHVFaIjDnoxpWUc0oe/LRcG
	 M6afjP9I0/3uMzCiPbZYrzG55Jv/8i9QBG8dmWWLqHYDXyQohvJJ+vtSe37CV5mobcOdf
	 jKRDP1IYaZI5uws2IEi0iHKTeAk3dE+kYpOLQ5OYz2arrQdq7CIhkAPy7Ym+/EZNUYpZm
	 9W/O8buRDSdxThWMDpB+kTP6+VP+3ZFkah6rgDnVaLWkNeZGD53jErOToR3haWyIWoRAI
	 q6zRN7sGGF7BM+rNWg8NdMz+owSa2CE8Ar8bhu+ndHkAmM1oKpQTTfKJlTHd1HTzy+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PVd/TSEC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9LSvBa0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757EF606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 07:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 757EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVd/TSEC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9LSvBa0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ARFM2007713
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 07:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=; b=PVd/TSECefMO65S2
	2dQwe6AfFV1D3yxIAIvTeQEn9ecvrgb4Ew8IJluoZySBvMuX9pgYBQzW99Gb8wq7
	XTxdGKAQNBl0CVp6lbkhAak4JKDcUVfet+Ocu/chEndTwDbKzahMhgSVOLGs3o3m
	o0iu5wpPtwDIcySUTbBO7dMzFcUxXk5bx5wZjGDcU7RCZULSOd5EBJflmFRh4wsB
	YmCujcXMJFCjsBji00JO3jz2ePEgSuA/gDhvioTwKEubLDK6QbM6n4crc1XxLAaX
	1lZNeBPNxspl0hFQG/eq3UGmDErmHRQzLFsFsgaGnhgmjLu4Q8IBewCdiFj1XVTI
	jq/dNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k54jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:49:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so687743a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210570; x=1794815370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=P9LSvBa0JSBWS/gs9L11ryvgUSs1+SkD7D1BkgmVA6Roq4QRkHV+5nG0RzkEl3XFP8
         NrriSIxoVNQCF3cc9/3sEiNnDhyoFEpwo7zw7W6RXcKMuyXwG7xbquFaIrvA7idzf4TI
         i5YVtwDF7JhmzD+0p5t2p9rdLzXPvMb+FDnGNGz9K/4+NP9XIiK+C5qvQxXNliKEugPN
         3PDTbyoxnwgNQSxULM/BQGF8iy7bVYXJuZTDjjTIdoGe/RjYnaGd0v0nxkwUss2FT+Qq
         D2EFOViUfAlQJTsTstcS6zimy5Z7naJJKm4BIBU1rnRuqLQFPv7SFCxQLvDqW/pTKLB4
         R9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210570; x=1794815370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=ujuiARFvzIU8QQWwV93JSahtP+da0CZ8Q3W/yp+jfqDMGMaRUOedGSe0Fo49jGjCc/
         GyKfBL5k5zAo2NahP+o7oA/qSsS2mAXFiW6PMpG0J+GMmtIiS3a9PWOp/4GkS7AT84LW
         Llm5otA5DZw0BGH9p+3rp3Koh3Q4OYuOP4OrrVTv95St8aPk5lNssfoKB9H/sQj9XhYs
         FhHgr7LM0ZTSdNnKmsi+j1Rr5pCHSjWP6mp9CAUG8F3EBIglTDqJ9VR21HepOiAKnLe/
         KZND7AyWt9a8huO/vxCCgRDS3F5joGKPKAXvAfJaMYYS6TDbZNc4+VqPGFgsPWLyMatP
         iD8g==
X-Forwarded-Encrypted: i=1; AL+hErHWfVNVGQwMDdIsKtnOJkUuX52tm4Oq9HLXeLm+e9Sfs39kAGJa3E7TjgvkNMt0BG6pFXE87r4ObL0PQ4Bi@vger.kernel.org
X-Gm-Message-State: APuU4Z/GSPt7LcxXzzuD9UUzryKvueUyql4CZ1a94hzGGIVsGpFy66HW
	LMl4/tjvbr3NxUmfoSAzq/kkASaeJlZKNsfrmGpIn+tH0URgeRkRqXTKdIm7vwzgMV8qHDjpqiX
	DMKM6WwdUxLEZG6qhVKf3s7ZvyhEHFFaO6fm1YDPeAREYCTw7dizgCftBp/XkXsGLcmps
X-Gm-Gg: AYBFou30iw+wFZYtwt+fucSz7O1H5fHhQAXiA/2NalPoo5oi069xFI225CKTCUCNEsj
	2utAvyJ9BPkoYGdpHhPqBehrJdtLY+T/72gk0T8eGRgf7B5XsYRWPwsJ1HQVE4XgbMKcjUFAO1M
	gf1Tz5gmNuB1NtcDz0yiykIWWN62wz7D8qTm+sGXzg+grYsgcP65onIwzoJ7Bvdg72frnG1qwSi
	rVq/jvl1KaXlZ4/nncDcEKrcezlr38k6CttVgTeelZrLmp5PNOBQ4MAPS7l8M0Zkv5vHhsAbdyl
	OPRG823uukRDl9WsCIm3W1m6Cd4PkcPIZHW/6Q1jriByvToPrhLlzRpSd7BooU0jtFd67sioOY+
	sQmWQGcqx32uG+T52Bf+qNbUDMH9vgo0FCvI9RllZqdcEw3DYSefko3Gw7PUcgqND/wBRjbK5oV
	4=
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197724a91.56.1794210570492;
        Sun, 08 Nov 2026 23:49:30 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197697a91.56.1794210569988;
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12797095fsm5758248a91.16.2026.11.08.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Message-ID: <13c25823-0adf-4ad9-83dc-24ebcba39ca9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:49:20 +0800
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>
 <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfXw8QiNzfBeeET
 liGVWXhIC9COe1USJC3boHo9MdXueQmYDdfvRdUtaTnPraZLw/ECawRatzpbeflWMJx/DcqEGc4
 qxmVcNG11tjk6D65+Ic132iJlMz3YZsLN81VJ5uwrV6VIifvqPWYzXE+51Li0mQaseEE5uxaVmU
 24Vwse9KvUyDK+6V+KjD29S8nzuDuQkyw/u1Jr70ziFF+ZZ+xJ4s3CRn1VCGFleEWV+kunxOBlB
 n78hurwPG4Q2WOyXM8F/JAefvHEMIRUZ0Ty6P4QZJJDN6FQKdoT6LtK1zmHmkbQJ7tRuxPVq7Di
 I+hQAyAi/WDeIKlk3OBWUpkAi2UOmapgwulAfZLNqn+f966zgt7JwvJQGfoOIvl4vqBJX2VxamA
 M9cTyhppurOGNFt7+3PqBol2TpHP1PCiM4WOnSd2QnkouNUNmTPPZawqw3WoLUeA9hdLxHGuFZz
 AbGkRHAKIN+V0I1XCCg==
X-Proofpoint-ORIG-GUID: nIgpfsL_U0E28P5O2tUDiErFzTnn8V1l
X-Proofpoint-GUID: nIgpfsL_U0E28P5O2tUDiErFzTnn8V1l
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af17b0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=msBFRUBLE_5BgBVHHWUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfX3lJFzrAXy/Wu
 czUqol9gdU0hz9D03R7dcyvYYehlnyKmRkljlTdNqdstN75u42YzjkFkWJsVg/ngG4R/RDGzX2Y
 VJcKhfweUchS85lp0T440gngR4trXVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090030



On 10/26/2026 4:09 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 04:13:11PM +0800, Yongxing Mou wrote:
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93..7f8e52d52078 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -61,6 +61,32 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
> 
> here should be contains:
> 
Got it, thanks.>> +          const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          items:
>> +            - const: core
>> +            - const: int2
> 
> Drop power domain names or move it to the top. Here you only provide
> constraints, not define new properties.
> 
Got it, will move the items definition to the top-level properties block.
>> +
>> +      required:
>> +        - power-domain-names
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>> +        power-domain-names: false
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.43.0
>>


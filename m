Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467613;
	b=clJnOd2LyAHUht+ccR7trfYdVVj3ujdwq2Fe0c0J1n79L5GABz+lbh81YiA1ZxvgO4JS
	 BD2LR6kfk8a1X1mVnObG9ioEuJjteccXq5Q8tCQtuljuMuK0neu8EbEuHB1b4Xip8D4TD
	 8fIZt2QA8piJVVNAxj/As34dHM+u8ZLAb94Qh2sKIfTEYVC2NzhjDzQYvlwe3EzECsq0x
	 Q8KQ51KBh/fyygbUMkFAyAl3b0jGy4OduNe+3m9Sdj6Dwgo12ibQ6hcaljd3N7C7rtFuf
	 iHPRR/NjXLO1G3YvAxGMUH8fKUktK9DKmBziffQgkWceU8iinN1flRUMKgy+q8jSchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
	b=lWAZK6GTr6IsKIp12sOC0uNsnsr4lbc9BrdyHnZnwtBzd2G0yOoEFe2F0sYiagyNYRxo
	 n3+v+dxZGdYuf4zNvwmACEZ88rC2vmd/PEIeVDlyX/KhD6DdkvI/6Jml4rWRRRvrb3z0K
	 j4xEfZhSPQauMpr9WplPeZ7SXubPfXRYlABkeaRTqg4jRl7VmuEvT1cYtoZVIRlQbMyV+
	 +SFKfUcmVGuoauc2ZNRM3YnleQ2tJ4vLh6p6CfM+xI5hUVurHojsgrssTRMRBz+OfvQ62
	 3lew5Z2IoxKCi/iSqaxqJfcAnnS0H3i3Ek9B1IjbAxMKKDbPjpWRXt2Rgo9FfxNYyTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jazGjcAO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctrctzE0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B5606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jazGjcAO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctrctzE0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUMe4092542
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=; b=jazGjcAOqRmdO8Xh
	O790Fya1/sTIHC4jP8JVwGjzkiO67C4LEP9GHm4C8LmkZl5qFKxcy4DvEe/9pGf3
	q62ANSz+htC+FoKAeeGodPMELa/nHOGthJBeo05X5EnZjPSIcwjBUMt64r6Y9rAn
	Bhv5L9PRyd8l9YPHW87DfmnL3HcKCoHBsOVQkqr259uARPHCrdpcCKyVX2/thdJb
	+di3Ot+f2SQ/5T9xEHlEW+1t6MYFcFgyhhskoKcorjcf5n5UjqvJvwfvDl5vedFs
	MZacteqZnRl8BMQln3DcrWkM8azyJLZdxy65Ecr12gMUPqo/df01eFseTwulpsA5
	gWKxYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hp01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:13:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so6933072a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794467612; x=1795072412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
        b=ctrctzE0QhR3gm/nk5INZAfLscEyUd6gToy5F4n3Wr7LB622wKDpi2McWrtiDCB1wY
         r2VSUeLXzh+B/bEhFbAYe1he7ehpcu1RlJ0Jnv+CKDNn0g8NBoiT1jOmJXNDegihpNAA
         +o0ZhkO8uu8uA6DXvruANMdmsJzrjuHrvAIhxT92G9byyQWnstkjwtaVBYsEmeXVeoDH
         Z3MS7Nj66BT8esNlCQX47ECpMtGxeLwi3CA14mjriYn8poG/JMMDD6FOJ9QUJqiEnl6p
         iShTBPOHRzCPBe9dZNghM6ugvJEfLHumBvEdEe9Lu1hyD4C9VvK0dC4VIZViVroRqS19
         PkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467612; x=1795072412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nxCH1icZ5d38W7PQLiQh/Z+YfmZLqkO+OjM8UBgv8Q=;
        b=1qpJuvo4RqXzwYE1YmL6uQrzoZIyf1k1SIIqAJA38FFS0rZejVViZtMA9TwrkpRRfa
         nSQHLZCmWkuj6QzVh8i7mTdiciaUoKQHuwCeRrJoHSbIyvxrPjfrtqfkueiou7J72muZ
         sic63/lXB1vUsbcTcKO5r/ZCAAfRxf9O8hlXcJSrUyeaPOM5vBUxyuP3ITc20QScPRKQ
         0g900M2o79Ig5Db6B+E/ow3TB92yaf/s7lB3QsLanUJsAWQcROolR2ifFwvgEcjbaxLo
         66V1cL8WhhvfzAkRe7FJ0nc/ss5kQBqB03mqxdYL4Asj1bjj8nZanCvUzlht8D84BUYT
         wsbQ==
X-Forwarded-Encrypted: i=1; AL+hErFLyWOQGXTVGz0MBNe+p3B/IbFzOdQtsXerysqEuGSw3Uw9jBz9bfg21/KDxsMP4DTSkBdj8H34eEkElqMF@vger.kernel.org
X-Gm-Message-State: APuU4Z/P7PezFklj4AsLF2DYNIxNE+q+ZK88nQGDPhOzf76jjYITPEmf
	IfeF5IJ6oaon7RYenPNAgFgocltODzySrUGjZLSjs/LebpO8uhh8oTTraafsoiOhbLX/xLIqR2K
	67z+0QoP/BK10TUBYR1Eop6tgMGH+pRJADWMfqgfhcCj/MLsD6lxXZUjCTdFMg78cII6s
X-Gm-Gg: AYBFou0Q2jHRJqYjzKMAKG0/voIwISK4u1Eau5Q/Kt9XdNiSVoOZhV18jLZ4L5SlV83
	q87u8CrpSWCTUyNbRtbQ/MLfHmpdZCr4upmTF4pkicHACaGqe3IUtViSVn2TjDpsIQ6v3U8Bg/b
	WhsoXH1sC6sclmrpUhWrwP91HmHMKh1GonwcTz9U0ZeaT6hv/0SztQgfuHy3ilfEEDjEqC7ZV4z
	ud94mBcoTOqja6FnbqNMItR1h2F91xHnJXfzfGp9NY1E8qP0AVA3r1dnKH/krYRi8cFGNGptDQK
	ioAY85ivIKFeMgWhDna+cftqzZUXwjaGe0skmeiWE83yPW2jcXzi6m8I1nd+TGPNgOv0AIuaT/D
	8sdeSqqUCHmgY1p9VZwX93hM52Gp6R3nOg4tWZlP7Fkl2vnEQdQrJsAZYpXI3Acl7cXhlQylbcL
	5S
X-Received: by 2002:a17:90b:4ecc:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b182eec2f2mr4479559a91.36.1794467611908;
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
X-Received: by 2002:a17:90b:4ecc:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b182eec2f2mr4479529a91.36.1794467611476;
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm3143116a91.11.2026.11.11.23.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:13:31 -0800 (PST)
Message-ID: <01f33d97-ce2f-4cf9-8672-63effc90fbe5@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:13:21 +0800
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
Subject: Re: [PATCH v5 1/3] dt-bindings: display: msm: Add INT2 GDSC to
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-1-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOCBTYWx0ZWRfX885RNBr30fSh
 nGobM/A/o5MyoDwk2dijNrVuwkItNp1VGqZaYKk5gCsO8FZE/odgLUAncoT6+U4Tp3DVW1ZAKYZ
 7drsoHlfV0zK5tSYJlzBcReDw1BUTBA=
X-Proofpoint-GUID: 2LDifiynFlRyGPUlIWOhTbNaEHtYFIyl
X-Proofpoint-ORIG-GUID: 2LDifiynFlRyGPUlIWOhTbNaEHtYFIyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOCBTYWx0ZWRfX4Bs3oBDX1NLL
 SbzM7NZjFQE1zcqw+awLGQ7/5et3p8U85AVgEWEMytqnpiZHnbOzBtMGH9UTW6OAYU4SNPVhcqq
 CwvqnJt0bgy+IFK6+9JOrXMOmYfQv3MgExdXJ7Yrn3xZvHbX4vztT9EVwRjX2oSR8EJB2JHDDX2
 yhe7zG6sSPM0YNUXFCwxZYLH0hzOg3nAwiHcDujIq6Jj0g6J51Zn9P++faSC/ugoQ+mNd1cHxr3
 FP/U5UHkYHu8toHX3F7MHJGrYiKaLV1jDMJEGH1JVYTnya08zgpAGSc4f4euoFPbYOwtJuQ32jZ
 hZRSKfShm6vXT3pa1TOsXA65w1k77PI2UIuTFZmbdVk5GUb80JqGSaScFkOUiGqOoGXARoefAKc
 BJgjQ+MPl7L5OqzFOpaioqi8S8oqKt0exma28/17hY/3iPSwc1zsC96hpQFuuGoc0/uO8bNbYkE
 4IsdaqGD8KNrNVopWGg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5671c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=MxPvbxFPEjud-wvEnLgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120028



On 11/9/2026 8:25 PM, Krzysztof Kozlowski wrote:
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
> Droo required
> 
Got it. Will drop it.
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          minItems: 2
> How did you resolve my previous comment?
> 
Will drop in next version.
 >> +        power-domain-names:
 >> +          minItems: 2
I moved the items: list to the top level in v5. Only the minItems: was 
left, which is pointless anyway since items: already fixes the length, 
so it's gone in v6.

>> +
>> +      required:
>> +        - power-domain-names
> Why adding this?
items: only checks the value if the property is present, it doesn't make 
it mandatory. The driver looks the domains up by name, so a Kaanapali DT
without the names would pass the schema but fail to probe.

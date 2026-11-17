Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927821;
	b=fvsYVx+MJGJaNLS/eu08YwI/dSZSD43Gb3vfEf3fAHq6IlH+L5g+jzJ6n8UbvK9N3qxN
	 q8S17xvw/njkbImF1C6FC2M8v/6Ce8Ln3ZyuCGzXlzMjFg2jhrE24+aC2fHo6a23QiCUM
	 zbUnNC7Cj2KLQX91nIRXqTc4swYP33weG68IGzUGnjDTPooS8CS4GIdbIfetccLQ63DdU
	 EtQC/cjX3dTs4X7UQBIlqUquvgI9Jz/YS8K7mrLnhkpAGPfKRHAUEWC3ezRL+X30JTnFn
	 GNyB9ikyIMjLbe8VKU5MA+yohpP71h2bNqDASioIOjY/GK9Oxm5hN4HAjAOUq1EQjEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
	b=2RUp1JsmmIr1uceyg8v+9LPqpepTQFIkTYqGEV3nLvxrYI96v/wJ/cJa2CBQOP1s1gPI
	 ITGnIOwD2pAmqQOOXk9+A72q2lGpj+ZaL3BfymEcOuICGYqrSCfubsg9NlgvVzbTuLzrj
	 CgJT/F4W1pUo2J+XIPKuGQMuFYNjFL0ULvBRfPyYTRZWOE0ogxZKocHLm0lWE21Yyx2Dl
	 sAO4BxVo/YFf0jTPoUfBS9xdBu8XrKqXjUldCBOJWRxFVQfBkBpwu3Nn20dF3aDNoedQq
	 gqpsObzEmus9xOPaeieR0C1YC9oIOf1Hb3GjhnwvD+GfxGaWNsONlXVp3pKUwcrGbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjYLqhvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZ7wEJSt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A7606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560A7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjYLqhvo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZ7wEJSt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0lEX1457338
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=; b=IjYLqhvoDTx9eYks
	sIT5oTYw2E5MkagUa+mevANfzpfmGN54T0YhBs+ckHnPfL3vRHD4/lR2Oq+faCym
	TFlCK0Tol6wN+jll4NzC3tSrIjdSks89yw2MMTpasHQanE9zCgqpwew0ISI3VEj7
	heW9VdDAu+IzE6fNLNa3lG2txvlouUdVxDKlSfbBETkzGECWQ0+i664otnL2RFI+
	hZqlPRN7LTZn+k6Z8MQKClujYwgXm6BzxyHxUYQTLPBU7YaYg7BxuPGtbWsc7WuQ
	4VBCEAZ1Lpc952f1YLSaMkayrqmaaAt2mzBu1vtWBcV8R4Y0JcS8WxF+VuQaXOXm
	TK1G0Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc8135s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:03:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso178029e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794927818; x=1795532618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
        b=iZ7wEJStucinL6uy2ztEuKeeUwyHRaZlGCIXOV39fKUo8SnOdn7JWB/Vg6pEa41QIZ
         PtntL9K2UBg4+yjnC9VkpLn065IaqBHR4vxI/HwKTxs1nw8X3vWxHiUXJbRWuyoU0Y4i
         I9MUwg/KjCaeMqKijxq8Rhl0Yh0Yv5px71QUO4Xo7hkLXw3TWbkKydo64aNWuGB6sxrX
         KEMTLRICKFa/TKGsdImux1kw1xs9YNliBBxxbHjw+G3/hRXS5mG67l7vK2woiFpeRTnU
         A69IIGO+dp4uYcshzYT9TGORFXTowYDDX7JvUvV0GYTq7nZ/nuRLXlXxNFAAHb1jl9t6
         /dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927818; x=1795532618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
        b=XkL1Mx1snyCqtoZQ77xYTEMRWo3V6m8o5ejOWJ3P80gVoxgiHowxpQOnoc9HB0VAXo
         daEW8C29seomUqTLT3RnTBMJCQEOOc+khiGufnsT39V3c8/FrpoYUawMmEeo1Wne2Hhb
         qnGUGe7UT6MOmhRgUUnB5C5vlyAJXWUJY1o2bqmL2q4XGdCQ05CN3HmtSkEBg6JL8XuC
         xJ6n1r6VuccATGK24tDg74ZS7YYKNVdp/fYJxIzhTPCcCRIX1MhaytOeZ9puTXOIvihr
         467q31dx04bXcggt5OsLcP9uFdx5GJMfk5z5h3XsW+IU0QALQ3ofxdagc8+94rJOfY0j
         +edw==
X-Forwarded-Encrypted: i=1; AL+hErFOzhN0Iocspa0Ol015L2jXuEEbCOLUUZlKIKV3JmQ0a/jpvwclMds9rUaoCUOzvCUxgrwdRhlqCBFh7vUN@vger.kernel.org
X-Gm-Message-State: APuU4Z+ImDwHtwpsKmsZ6UgaBKppUIz0xpN9CU1Uju+02sV+ABb9Mcne
	2/mc532gVB2zwZehvp5QKP6dmpqH/25OT4gCXdXFINWunZkpiU7d4ujPXnHi2jrRDubW34pF1eQ
	91X5ZyYXNNltcT/BWGFse3D4q4PbPzeASn2elhS8jv6d/+TbXKU+XdWdyhsl46uhxwpfxwji9Jh
	XTRRPx/g==
X-Gm-Gg: AYBFou3ZZoaxSJq0MIz7GMibktNwumBOWHLarw1MOa51nWH8YdOEYk9cTKgM2x9j3rO
	D+XET5TghmTmGGkr9bn7AZdAWn0s4hM9tdtowTlxF6nCnvRbLsew1sCXYkxhxC033hmqRLTVMfV
	GGOWGnbh6Ezc5EfLe1s7OBu2WuF2d87rzvR0xX+sq2gkc6tW/ODUek6LksS8/smeW95ASf2Cor9
	m1KBDeJghPh5+5gsW6RG7nqGdkCI1ajGcCkyLReXmTHNENpj5kDDH+/tBJZXK854ryL3hrAYv1L
	hasuDdoR/62sWGOJgVOo3HAqyNRG4MYif+1DMXjs+Fai1lr/9Gvde5/Np59LuX7NYmaVsy7rbR0
	CXM+gH01px2BkoMn9l1lDHPqgHYDAlUPRJzl+XrkCFu/gH51+rq7vieW7XljdXNOEKV2DHKdTI0
	a670U=
X-Received: by 2002:a05:6122:3b1a:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee344e8201mr6488205e0c.0.1794927817994;
        Tue, 17 Nov 2026 07:03:37 -0800 (PST)
X-Received: by 2002:a05:6122:3b1a:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee344e8201mr6488100e0c.0.1794927817243;
        Tue, 17 Nov 2026 07:03:37 -0800 (PST)
Received: from [172.20.97.52] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad96096sm37231895e9.9.2026.11.17.07.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:03:36 -0800 (PST)
Message-ID: <c0b63f73-6491-4da9-b550-f5ad3d276415@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:03:34 +0100
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
Subject: Re: [PATCH 0/3] Fix up AON clamps on qmp-combo-phy
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <179477514161.135135.15496134606156270634.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179477514161.135135.15496134606156270634.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc6ccb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=R_VssaL8g6-HNQvAZl0A:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfX6QwAoJXrdauh
 i5yc/okuN5hwtm6ttUR6l6fP/7lI2brHmAMpxaBB23fUyfOGZ6Z4HJ8cffHZlq5t9sQQFb8f8Bu
 ToPPzZYk56/UznJObfgxgGh4la2vAyY=
X-Proofpoint-GUID: iJwspIluNJKWXuSAO9dwuqiZp3a7fevK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfX6keu6QgRwniL
 vk4RNwvxkObhkWAuHdLSDSMICbzCEF6AlrZULzXUdLDSbqv3QASCM9A93+P9T865idl0/fux8PB
 o28IT2JszlgwwSGh7YD1R8ZXzDxm2eQqQbtkUHGH3O2CtF+sDOX3wArdRF9RJsMqYsLkqOel5vG
 eLTjyhoKeWLV+9brR9p4ORCZacv5c1GW1FrlpTc6BbAd7SaRdfMCy9N/m0Owh24iSUdLdXM7x0C
 s313mAYStSf21Cxxt+xmyOFqSEq0/xXJJ+hZuHD/xLnEprxtOUnYT5vONBOJttLnoosQOwU+A52
 ruweXRIsjcS8cWojC623gXW9EBKrsW4nmDNoKf6u5826SBb2KnEs4MMRJm0Xo7kcaZvUZf16Da/
 AGomfxTgFVGuRgf3k7GzJHCdIHJKk7QHPpZpJi6gVrvfu+5QCRp4Q1l3u/solPPqSc1qZJ1ndYt
 tq1MhJi9Rd9VI9qJIcw==
X-Proofpoint-ORIG-GUID: iJwspIluNJKWXuSAO9dwuqiZp3a7fevK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170059



On 15-Nov-26 21:39, Manivannan Sadhasivam wrote:
> On 2026-11-02 14:59 +0100, Konrad Dybcio wrote:
>> Various platforms have apparently not had the AON clamp writes end up
>> at the desired registers. This fixes that up, based on the robot's
>> findings.
>>
>> Depends on (reviewed and ready to be picked up):
>> https://lore.kernel.org/linux-arm-msm/20261023123512.1912-1-26rote@gmail.com/
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> No Fixes tag for any of these patches? Anyhow

I concluded that with the amount of churn in this driver it'd
take an unreasonable amount of time to pinpoint it exactly

Konrad

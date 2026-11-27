Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772507;
	b=wsIG8qyLkH7oVsNBWBMhH99Xte9yr0mOK5S6oZOzhQJILyNUFjbwrBBetxfxciNXc1gG
	 6h33LKhVloTL9fwbgesj3dgOTmTRRnGzN07Ud9EOoTeZf0FzTnj6dGKoeg8fTdW0HV9QY
	 GnRrQgy/SWKEd2jS57kLlr2yIJTDJPhVhAtnMSC+lBG1zrz4IhwcP52OJLm8L1jbFtDQP
	 KwtsETChGeTUZ0bEAaOX2J3sGqbm3KgY1ZgQgQqAoLhV78GiKYlDzWo5t76kqkFc9PQ+N
	 XYjtlc4pSZzRgHiMvdOiKKQx4XZwdpeJI3d3oRPBVgki9PzyrjbRbIuDxybK+ADNXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
	b=ydAqJdj2Ilt4vAzukV7yreOdzMc1r4GeaKP4a6cmqZEV3c4CsUo5RTiP/LruOe2o8she
	 JbCJcttwhrkxIwHLQs036HVSVM4Mfu7qX/alf9VndVQrtZftlaALYReUNyzNEDIVKAugL
	 MPN+o81q/8YHcTrwoYTB/u1SCNf3Xi3HJ2PmOJxj4lvvAhapLq9wO2/Z/xf/7WYqG+RLj
	 0U/4U8oanrhu6TswqXs5keOx9Y2P2qdrT3k1q0nAigwXm4+TOyMo1Uy5v/TTac/tXRZr+
	 oJPQ+mSrrKZOsGkE8XruFMiOEqkmPqH1oTWZTv9VaBq8wNDZgpRPoGnp5Ziy9UdDLsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCnFkHjX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q4Fn7/uJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E4606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCnFkHjX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4Fn7/uJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQST1779918
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=; b=dCnFkHjXGMW1WSJj
	6x9Ev+pT3MdNSVSG3jPToyK4zAQ0mYGXQkLKZ9BAIcA3ziA/HxLQOaVk74Qpm/Ih
	5hrgRuvPRSymCcjwxDg9L3lxZC6FvjXMx+HSs5jVUNRr78j7QArNaYlMeTHc9qsL
	pIOdJHSS0sCT62ehzJGDBRqpyWJccPvzK0o4HF9atHCaV3RAaXbESbJbRFSi0yQ6
	K0UKeEAm02VV/0/D7BarU5GEWbI1sVKITje1/IP0Avku3T1wSCbshthvveyBPrHm
	uBE2RHwEQcH28gsAozcx0uVfWC3rejEaCwKPwHNfCTH2Sm3Ppi5Znd+yfTRSsgke
	aibhOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgy65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so6319528a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772506; x=1796377306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
        b=Q4Fn7/uJTwxybbCIMlZq2Z0bq7mYWmyNFKCX36vvrckvTEQgmYa+YNAhVpawy+85rc
         hEPiZc8cDMQyj0Q3NPNMyU4PKo1lNTp76ZkzhpVzHC/DxXnAUYnEaVDSfM3luyv0/47Q
         a1EmwirVbsoTJpLr7enPb4xtTP7gdTqAQwJeg++fmnSeE2y2j3mKCY+ENewbZsbJ28rS
         /jyy2zSDpyZ8z+aEihas799sO/egbbLV/v0n4HIcxEV9KHsYJxlRIWToQiEfwekkurDI
         Wbin6PTTp4wLKSOdMXX7gkyJ6pvzMndXtldZ4Jd7lruTXZFbyAiQdVtFNNcZ1pI+KbPq
         Qcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772506; x=1796377306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdqSCJ/NcYPtxF3w3antuKaSQ1Vhmfw1KhJOl9INpIk=;
        b=mZL88ZVdpoyXQ24B473dLvZKj00nbJ2GR1sNwVTT+BMFVQsYC6gw1NdQ/FuBdRGUMn
         pDEN/WHt1+O4laKAx5NbaQO9/j/XrL8Fz3X3+nKC1uDh4Bw5lFcbKbNwJRA1gwUSjTNn
         VKjm01sQIu/2cRsvM/889IrDMlHMXeLJ8AQJZSrwFd9Zr4HlAO5+1lqDOSfaMIdYRSC0
         Y+At/cJmXZ+18u0Ke9aN6Pu7JF3JBiIW/w4bZqBr1Ix9hJ8ZAnHu3GuqfVRfVq8QNuAZ
         GLunzJa/ZoIW7mJN3jPHXwVv2qF7cojJ6WvrXAuZz0dUyuN6uWJYwVJWIu1FlSkyoLZ9
         +ICA==
X-Forwarded-Encrypted: i=1; AL+hErHd1PsJFWJzYzc/a3x1Gf9L/tthdM1tBO/QDgZ3VlIG15Qos7d4vm3r/sF5s6wE7v3PVbecYn0Ew7WdIIMw@vger.kernel.org
X-Gm-Message-State: APuU4Z8LL737oRHxyUEJYCplkTmsYnFD1RTB8lJmheK7gn/AQvba0ocO
	PpRMABoNkNtGfkr8QEmkvmSirXGVJ9AZpkFFDm4LLhr06EQB0M0lV/lSQiqr69860/+T7H7OdDu
	szyFsAdduR7NmGG7BpI+BNxvoIZf8VfeIxQ7HARg9bbLIVX9G8/ZXUPxWk5TxoqowpVcE
X-Gm-Gg: AZFdTZdhBy1DgfSnIPKUIgWMR5w9FGEZWjkiyO5gFEXKRw0plJeCB5kMERXwikXQMvv
	d84o4KbyLSXKgpdqTgFXvPNixKVVfqqrQ+cQWmKGKsCb9vavuYfxYnX6hBSWykIcWtwECRbIFpC
	uNyddnKfMOE20rZxbGLR1W9AhjSVuDRp4FHIBrMfz9YChm0RsJL0u+Z6QmM891no9KcOCGykIyL
	kN1aeUdVcpTbLRqS6DQNdVMC3eaZjziknmtUZIzyBj3Un9jMkFAuf0UcfeaTkyZWsaSOaAEcMZM
	G4MJY8xv65e3FoMDVd0MHqzLtvsQjozJvEZ8rc/krnkr5bVXZcBDyf87hUl+sLnj6BwgqsvyK7Z
	S626lQ4vGoyB/smNsbILwE7gl/kPFb58GDRF4ElLxrgUMAeVXK6Iw+hmlULhBNuWYm3sKQt6BL2
	FwUOcUEhpsQuoPakfjTpRH8fOwnIIAuj4Sw/JCx316NeCApaHfTithyb2zw+Pl2n7JSrjd8Fepg
	dcY
X-Received: by 2002:a17:90b:57ef:b0:3b5:a3:4425 with SMTP id 98e67ed59e1d1-3b500a34698mr6475828a91.42.1795772505844;
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
X-Received: by 2002:a17:90b:57ef:b0:3b5:a3:4425 with SMTP id 98e67ed59e1d1-3b500a34698mr6475798a91.42.1795772505385;
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm40254986a91.5.2026.11.27.01.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:41:45 -0800 (PST)
Message-ID: <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:11:39 +0530
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
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
        sibi.sankar@oss.qualcomm.com, robh@kernel.org,
        quic_srichara@quicinc.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20261127092834.731-1-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261127092834.731-1-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX9oQFeOv5eH5r
 mU1615VDsvUDWDhpjlpGaWaRZnwbSVUZV7vN4rco1/GLxQAeQEgLCU9XhtAkIEc/Pw91Cd4YTxn
 d2ro77lNVkfXcMVYRVp+j218gRM1Cko=
X-Proofpoint-ORIG-GUID: GI2-uu_QVj-y1OxaEOA4AT5pC9ej8-6B
X-Proofpoint-GUID: GI2-uu_QVj-y1OxaEOA4AT5pC9ej8-6B
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09505a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=aSOuLjqlkGThcsStIF8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXyL+C+2T0N+5i
 Qz03tq7jH8mDFj1y2bi6vj8OQSg2HU+qUmZY4WklnB5lY+EBJOgXbDjhzvFE2D+zno3cAH7ZYzV
 9f9ABOrAK5v/dLryuHlJlQ0HBJsaAh4AbBQ9Z8ChAgX8SfgfyGxNvIyCSw44utQVf/SSMItBb6t
 5UbnOuecG5WS09XBD36DY+xiXk7IeXZqmBlFb3XvfkVBVl0PmGt/4DMvXX6e/5dyv8mY7pOX/Ud
 B4fzjHO5nbA2frh9GYEusztm+CL/UqtLHUuuYn1G3BjCZHy9E8UEhYhSsM7oK+FoKq6ehkxQgLw
 Uj7w8rpKppEoL5eKNy9aFELmMfL5Tev/Mmyr0tLWXNsoXuzpCm7RYKhyD1zxdK74BQCKONUNCFP
 DR+YwP8tHUkNePCy156mAn9Hoxnn76PVwXbPJDgtu4tGpYcYxR2eohE6oLd+eR+JJCnaLSLdiVB
 JcqCh22qbYCcbkP/98Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/27/2026 2:58 PM, Atul Akella wrote:
> On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
>> The da_to_va() callbacks compute the offset into the carveout as an int
>> from a u64 device address. An address such as mem_reloc + 0x100000010
>> truncates to 0x10, passes the bounds check and gets mapped to the wrong
>> place. The check "offset + len > mem_size" can also overflow.
>>
>> Use a u64 offset, reject addresses below the carveout base and compare
>> without risking overflow. Apply the same change to the pas, adsp, wcss
>> and wcnss drivers, which all share this pattern.
> 
> Hi Gopikrishna,
> 
> This overlaps with a series I sent on Nov 7 covering the same four
> drivers and the same root cause (int offset truncating the u64
> da base subtraction):
> 
> https://lore.kernel.org/linux-remoteproc/20261106184312.100-1-atul.akella@gmail.com/
> 
> Mine's still awaiting review, so happy to defer or let the maintainers
> pick whichever they'd rather carry forward. Wanted to flag the overlap
> before there's duplicate review effort on both sides.
> 

Hi Atul,

Thanks for pointing that out, I missed your series. Yours came first and
covers the same four drivers with the same change, so please go ahead
with it. I'm dropping this patch and will review yours instead.

Thanks,
Gopikrishna

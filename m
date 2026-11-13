Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560485;
	b=JMxT3o6MkVYRMeYSx1rdRQLXLsAH+Ih6r1LNuyxJ5vcjcMPd9RXY4KlhAyyykdOY1Nnj
	 KpKgKpb+q/kaDMhn+XKZg/YTTE8ocBNFmnqLYu5tpv9qeJyCX135MauEzO/OrCei4UBcn
	 7lii7A5WiRWIOYtW/LuPKhLQDoZnbdwBOjnCV2tjxwZlacQpLihDVJ16+Q8maKOb3g802
	 eFKQaZRKdb8Jkif9950QQEpG30crYHy/Kl+vEbgz+3vVdvuyvEEBElIlNCLKynuvmoIoS
	 SNzBFzZpXej+uHdlRKUytewYq8v3/f5bIPrKoyUKy8lyY9xlM+IvS7xUSq5ihWOr+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
	b=cNPWecpkNjtTgTmx8flkNWw8ioUiQ6LdBXVP2JgeT705N68XscTOzDSXZkh0R5LvA170
	 l61nH3WvqEYGQ/Wo+2oTRbSXTvIG1MFRVfa2KngIiAW7kShGzYHFqMgPLrslha7zUNWgT
	 3Rk0su63ZqnTLiscDViUt5qd7/Jxwje1TjxYfmFAvuYIEBnQVVpNY2bbeWVXFt1FLJgFQ
	 ulvnZxwXi0NNAFERK46/cBmacno8u5ryrtdo29sb5M9SCJuu3e/f444DIyStfMhYfI5VM
	 S5oJr30fwAwekvTL9SiYWd9vgxAWGXnnIhAuEMCoSxIjWcsVyIv3NkKPyrC3nGRZlBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjRxx2zz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJiH9B8R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C76606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjRxx2zz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJiH9B8R
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9o42182020
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=; b=GjRxx2zzEQLexuuo
	Z9nToIwO8/DYKT36+GMWBDteintULDGewNe8IqEmlsMehvxaZwIGxzHn1iuajpND
	9xKiws+LJqijJIUeve2odwNZmpfMiDp78qcd8DrI3Hxqn4+h52qBzqQg9SYvQMS/
	Dd2Ea4uaYoNtshrfTiwZnoKn0w1GWEiWL5xRZJRqyWsutn+R5NwJMkbLv3axYGov
	wkoRvhBzKhwjfzo1jXmNvKRgWUsHhdPMh/5Xw7B1T0rQQKqtQPxqpuq0xbQ7esH8
	SUAXadoHIJyWXNXYOwiK2X79TuH8f+xStWHQv6t8oJfaiqjRvr3ykALzpCcArEkg
	rFWFVw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rm9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:01:24 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9909853d264so11665241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560484; x=1795165284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
        b=RJiH9B8R2CmXW4PICI1xoEE2Jh9N7K+7SGJfVNkS5R9D1pEgbYkyBgpS01RKHeYx84
         gu04OUUAyDGlmuXnGggAczpkCGguRNAxmdx77qf6BmypNy5dIbrsdawT+35ftvjS8BJY
         uUkecyJ3Y5kGj7/TpCSG6waU6X8sbNfxYB1Tzkshi5TqJ/94hd+tfbtqmTd4HtHwOT8i
         h0ycY5Pps+Rdz46U/k2Q1XDQwLJU3fvdEkNSdPl+qPNwjsSHZSvMDkfJXnoOqKc11c6u
         N4xSdY0oTzxEeVthDqgCm4q16ossmwgSMrOPvOO5hDfbBASYmfCbxKQXTRdFnfMvIazY
         DEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560484; x=1795165284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
        b=mcNNy4+szEoAJVjmu8yJaEGIlwHB4gguP/lDvUKoabBoTQD/RPWfKFYsx6RDsPkdfA
         EbyEj0y7m2ef8he2Db6prUYNFG+sPWbGuvsjyqbdFPhRBWE3Vzx1g5CQGG41J6Yo6pHI
         mctwGu/gij++qQK+dHWyJVh1Ed5/C5oQiVntOCgr3ix5XcVcV/eEKdEREU7LK2dS4cKg
         XF2U3ZTVzav7rWTjRcAhYcocTHKR7VI03xhMLJGS4q0C+qzkLdMW1wuvRKo+dP7+uEeI
         dmN0JbmMkKt/SjXJ39MEgfiX7rZpUASxI+1ezsUhfwTK1OPidd1nvpDUn4mCPWU0we+G
         LLAw==
X-Forwarded-Encrypted: i=1; AL+hErFWZQe7ABCuelfsN8NYXT4xLaCQnySb/TBbR2e4C4ja9HpCRC2lbaA0NLU2JyCSKiCDdiyA7ulUTGmEA1NN@vger.kernel.org
X-Gm-Message-State: APuU4Z82bNpONQ2wTghPt/NWeesQ52MfL6a6P48N/NfdB9iEiuD+vTJn
	op5SWB1bDCPN3SvAdnBUvc93GDbBPJE9EC/0Bymd0X5uJaNLxaAQEmVpRBvmjIH0gWmqNMYmmbX
	HOx4JLM4yWph+5DfqaW1s5tNGMvMhO+TB4s5mde/VneBien+IdnRCs5/eimNedWiyp8uF
X-Gm-Gg: AYBFou1KOFQOWe7I3I2bpZ2Br5BEzS52qbOBpeZspym9vbldO9DwEki0V/sLk2EfOgn
	hJfJUfzUY/1hZfS5FWaRKxfJBn86K3SU7fb72qUxwEASR4MpTMiwqcVql97gZNzFGu+ZclG2sXh
	u5vQ6j6nlZburpy9k2Pi5WpwykORgQNaPFnyDBFMNFzpcbBBRiuRyMaT12A5PrvUW/JMl24ct6D
	Y+OTtQ4j+g2ETCS1OTBJQphmRjr3eZrYVIe4KK97vItuyqvjkrGlr6dZpW7+KC6UJ+dwdxiZ4OY
	QZWAm8Ot9+QRaGWYTcglH5tmXp9ROpMZy2c/ixzTtRh2y+9Pdfx/3Mkd6IpC+tUYJnTADnsr63r
	9pWBBOVP12LfjdYDA2AE/tcIohd4sH+J5TWdghc8MkutIfe2jHve6yCqj1vLG+tXKC3GU9vI=
X-Received: by 2002:a05:6102:834d:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d64d120edfmr536444137.0.1794560483707;
        Fri, 13 Nov 2026 01:01:23 -0800 (PST)
X-Received: by 2002:a05:6102:834d:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d64d120edfmr536426137.0.1794560483235;
        Fri, 13 Nov 2026 01:01:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5606sm698390a12.2.2026.11.13.01.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:01:22 -0800 (PST)
Message-ID: <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:01:19 +0100
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
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
To: yzddmr6@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX9twDLwzZRKGN
 LDoRdUxEgMHTwCGOMXmppIhci+Apya519f5cOzkBqiOtQ6meBt/BjxXmp5JWTuxYcWG0ETml85R
 ydoHlbwd2ZD7pVMgKfC+Mv3Xk8PqarvzQvQY2K00Ks2Q+urhJQNA0/yUBuzHWWw0ZdjxD4rhbd2
 6XdYjWSSeO24A2QXk6jkE1CejFE4lzKzFalsCePoz40/oXYmIOjpZ8hgLhZIESzzO0HvBhbwap2
 86+tJtAEOa5kN01B1KlkI8a/KuIa9LHofjbVnqU/wq4HEuo8sQORx1nOfAiJ6Kc6Lx0FnzSUvhl
 LipiFjhmARNj36PneAeuIWUn9y4vAWqNbUnoi7cv21ygAwtzmrK5KJZ9atzQ9JDT96BnT1HDRtq
 E57eMpHyeEYEdVANwiAiA5NW4vpBk2Io+LZUbGrkNZyfT8wBCI+MiIgnsKrgFdCT2lCgaATDvyH
 Hq3ZIF31bfOi3UzK1RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX+R8ZM3PDG9Vz
 oOtLXRSYystLMYCGqlEbjX2SbxSqiz5QaVzZADKvrgvfcEnfm/8EGFyvClCiRhfAPwKGLCsY2NV
 BwBJlVWz92Vk10JdkLA9v8Kf5jRfdEs=
X-Proofpoint-GUID: u4ZDbzdr285bUEk-Iqhs0Sa_jOKHEpYO
X-Proofpoint-ORIG-GUID: u4ZDbzdr285bUEk-Iqhs0Sa_jOKHEpYO
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6d1e4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=th7kVB1SI1JMAOI46x0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

On 11/11/26 8:21 AM, yzddMr6 via B4 Relay wrote:
> From: yzddMr6 <yzddmr6@gmail.com>
> 
> The SM8750 table gives the island slice (LLCC_ISLAND1, SCID 12) its way
> mask 0x7fffffff as bonus ways and reserves none. Bonus ways are only
> allocated when no other slice has reserved them, while reserved ways
> belong to the slice alone. The first posting of the SM8750 support [1]
> had these ways reserved, as the downstream table shipped for this SoC
> still has them (res_ways = 0x7fffffff, no bonus ways). They became bonus
> ways when v2 converted the table to designated initializers, and v3,
> which refreshed the table, kept them.

Turns out there's way more things wrong with this table. I'll send
a patch.

Konrad

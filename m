Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659719;
	b=nr5p8zgoa0MWxFZBof7jyO5MnO8rwleDUVXnM07RZkA+Bw8Ft0HEeZDA2/QmLw6bowJJ
	 ZHCKPQj+Kx5FQMeuvrJB866hpXO7sJz45vwKcS8CSP/v3tTmEAedZWFdY2xgIcGhV30O3
	 x4mpJTfbHghQXHK6MKAwEvVL8waTkCRMEiDno6gaZOmoFOZvDyEWBQN9Mgtf+MGEf9FwK
	 ynrGKXCtOgIVIEqkVLv0Bm3iV62gWsC9O+FMtbwo+Pt6aX/aJMP/zqI4n5dLPGaSnjfk7
	 5b2MejoFRUHz9PKTQr7/MJ4eCkSi39n1hfket9Qcn03gKPoSMRQ4p8y0NAMKni7op1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
	b=MGXk70YMSoNri2SrJf1SUNB0mbikJaS1E3NwBYQcB5T/HTKBqaZCe25HmygbqKY92Ih3
	 OEt2QtoVS0Zzr4dbJnwwynM90iHbC5GinP7pXGy0Ix5jLOubcwp+/GQ6Xb7ScEu+yzBNO
	 AxFmyELTFgE8tD7XTHYYLWBUUP24Fq9WwW2YjhgAUHg5m7GkdVVzC7y21eMfd8albDXCj
	 ygwtIaEskdluf+PGR3VSi0GPI+1dyQKn+VUprG+nMGi64hRytm33/NigAh5RcJL4wpk1E
	 vDoS4GdTsrnAmbli0qiiCguC188p9rR55PbzkpvggKgLFNZe0sBID6U20eizlUKf/3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFEB606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705R41995922
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=; b=HMPoQa2guFdKcKJ2
	G8GejBQwAZfoxwjD6s+wDvWlEfmNChBNdsPgLiuINwK0Wm4CJsw2J6NCpLBrF4H3
	XXHfLsVJE+tYVq/P6iUmb2Qat9w7VzhIQ6hcfX472BSG1JJ/BLa+BglC/NHOS7+u
	O1APBbyb9DhHGCfilCdjyzc5s8SFX/FrcXbPKBK2k6inoeoYglLc/mfaF4Ac+EmJ
	R9YUGCjvL2/ZTjlKxVRVQlkAuiTdiI/L6EC4X7V9p4vTbhIOPp1COojbYdOPqIbj
	zuk+Nb97SgbKOEVNmqLkVT4NBH4kcw6dtADDSgUjs2JSwgPGMt7q3oEqVAHuNy2h
	6c1UNg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsj50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9906ce36960so23092241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659716; x=1793264516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=LEjBTUs4gSLMnZVa7pKvd0iDicVuN4kXD2/hXkx5YUYWPL7yhjkXTZ3fdFu6GdUKCm
         xh0L/MC2RIYobQ4ehnwBWxgMdWgpfu0H1NS663dotUnpfkeB4tYvbgxCX1JEuOK/8FvM
         JrQaqnI1DdnVK3C+Mjfw1onHsH51MyazQuezxcOA63OZ0DedzhQd/j8W0ivR7L4wA0DO
         wr15OYnx5ZSq3a8D9+x2UwSgLJ2fl7WZP0jP4EmiQYSuI/gZ2sKMir34sP9+nhuTd7b7
         Jt1FIAG4PNidBdYrh6mtNs+D3LqBSLdIR9QHuFf0R3NFlRwWqQ7WQ8I0ydEWol9KUqI+
         V/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659716; x=1793264516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=pYWeeOqLI2W0PblYv7lDwO4O2wN5SjE+Y5GzzuicHDd/bmJ61d1/7iD0DPpT3p6g75
         qPN+bziZlzLxatumilHjmCXRjl5qVaiZfS9p/agEARnnfIhhCK1zW06k7/985G6U6+D+
         Jtpjl1hKaZ0PJLcRBK2R+Y1S/lRWYG0Lc15oQJjHZLqwv5jvnL55Xq7fELcXi+ICwI8o
         WfI47eNU3ab5OCVnI94IG+s2Tm5UVKK9GxUFUquwRKpC6ektz5C7V4G2Tx3J0lU35egI
         qRBTqAXngbgBI0SwccsuALVuyiFH1dJX0cYNgYKnYULVS62hJvKuqTomFkw9WscegI7J
         Q6NA==
X-Forwarded-Encrypted: i=1; AKwUvBzpJtUU9Jm2MGHP34+cflpnge/zlSqA0LUNTjtZvTXZMgy92kBw0HNfHKZRuR8FNocAj4zObr6OF1lPJStt@vger.kernel.org
X-Gm-Message-State: AFq9FYLWm6U0Azzu35eIh9WzFRIf0EBuN6v1QSuTKACD02CveUnER1Jp
	Na04GTMQBS50bJI7y9jcs//JxGr2/Osv+iV5nyEyI9CAL0gjugUdIRKRf4N9rF0mzlhp0qwrioF
	zD/19VqWt+WNbqxnCfegD3awZU8GWWy05LrzrAC/dXyo5rT6cs7m5YAwa8BBV9Qeq7GRSIyRLUq
	MG
X-Gm-Gg: AYBFou2JvoOSIDo/Y8hW2PFB82nbZGLdlIrfW1ZWl2bgaMptppiFfubJ3pGjoMm19b7
	EQ/7TtKlot4tYYkFKTwxtKub4VYe5/GfCTiaZWuMMy6SjXsn/1oe1aZhICKwObIMwDyZBeGI32j
	inCpX1WyjWs46xWzOovSvr0H8JuqJlopqNdamSwtYFb9cw8EbQyRLWcg6Tov0AwlR13KFuZ4jol
	/DX4pDTiaAfD+GLoPlsqBddgu0R+6FpiyVc3Kq2S+vQ1KNZhD4vG2DfBg9K0ZTrHPfG4D2qAWY6
	CXYApNDi2XQnGSL3NPPc/GnZz1Kz96exLywLW1WWttTUCkoJoUVLI3fiXwwyiC7eQC7nuUV2mXu
	77M6Wh7qtmhYgC2qT4jJj5A==
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620653137.3.1792659716406;
        Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620635137.3.1792659715973;
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm82124366b.31.2026.10.22.02.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Message-ID: <8750ffa0-33bc-48c3-b136-fd3aa4d75743@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:51 +0200
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
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oYvKK84U3kvo5kE4I9zIp5y5lxwntBbY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX10eCPv9Hg4+y
 iDM2DWqueh7bQyCpvSNMMRZl3KSA5rlZP3lhhxxqpbQft6mca0TohLMblv6PviwvGDfruLXhj1K
 AMjcAZfIbC8p2OPKrifVAScQkD17F5Y=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d105 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fK-bvxQjctYCA93nC4kA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: oYvKK84U3kvo5kE4I9zIp5y5lxwntBbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX2MkieuJijRkr
 1TzJYdEAToTScHAOBy032e8XV70hVlfMIbvj1vU+Xc1VV2OHjTwrNMMpPG+uER5iQDVQ3GJ6dpJ
 5AFQSHoKxDSspQJvJgETFDL82l2IGGWhHsHWJiibWOfiZugLYsQ9zrufqlmDJ6iM+Y9MKtTE/fF
 CAETAWmxE+HRWyXIymK1vMe1r4xwesm7oSCi46vCTahZ4N8F2KlddhpOqqQylfgmng8gTVjq7P0
 Ps085Rl/8STQpZUbvJdGZtalhAD0KWSntE/UU+wEYHPOzGIBJ+je3UR6ygNe3/MeDE53H5d6omU
 WTtpwHh2k/gArx+9dfkLFgjkeNp+mf7YGtd79m9QnvaSbEWkdqO8TmVtPVcIAwTufKdvsir5xCs
 xn7lSCU+U2R1BugGAAtY2RAw0oHcTqt+nWBbkQPs/NcUrYsb7mUI5QSw2R4YwNMBhMe+RnTmaXM
 9yKLvkgxMFiQegkM+AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/1/26 5:17 PM, Vikash Garodia wrote:
> Add iris video codec to kaanapali SoC, which comes with significantly
> different powering up sequence than previous iris generation, thus
> different clocks, power domains and resets.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

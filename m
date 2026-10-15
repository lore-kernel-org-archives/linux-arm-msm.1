Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5BC47668B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059718; cv=none; b=uHquIDrla4E24AxwQ7NyKUeRv/iUiqOqzIPr4SyGRJqmTiDo/YLMi4Hsfje8tNTyqKFKM2PefF1pCzGxq0ZL41+QIrjKpb487U8JJtq6LS4c0Yf4S3eNHiALwlImJs8qlHHdw4xizOVRUHIR8jr6Dzyj247R7fmjSoiEo6zDr/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059718; c=relaxed/simple;
	bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUNNCkAzyXR52i8CJrFZuu2UR87gooRUuSBkeuLDIvssEYKH6qddCCPnZ+L0tjxExDk4plGU8itMjpj1po0mrN0cUJ1SsYVEBNdA89RIIUnfaWKz9o2FvaOI7GPbOAN2R1mMRpEeOSaR7mNegHCVQLHe7UyAAfdalMZ9lboW+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhGGS4IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJJAPrXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhGGS4IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJJAPrXY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jekn1955612
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=; b=dhGGS4IVacD7U72p
	Y/hTqljAPCqOuYlH9vi5eG5d9VrMGeoSOqpvyyJjufi8kmd+VGUv348y5BioRvmU
	guIxAdcdkOPCK7F3E2WjrbGKOEAvw9lWTnKL3Lupe1+sZT4Im+Jd+bbGzMy29RGt
	iJhUbWKyXq7V7i9Vs0bvQU0l5odM2JyUqNqo0JQ42qYsFMkx8ZH6eFS2F+Qj2La+
	iRJ51i/iqX8E/4eXTVIyHqGEvYuDVfMbH1pj49fERNYjd/4lj8XCd10fnxvGYAfK
	oPKej//88tw2br+RLal7CWqdVt96z4sz94bWmYD+mC5pNK4K+QBgurr8JPo87Tcs
	QAFoYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdetbu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so17329546d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059715; x=1792664515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=AJJAPrXY0nrW6kox+JMev9iqyzycMjmjCDDTnjLQHpxYn9sGjSaFwpgAw1OmpDn8NJ
         K7Dt25PJUyJAx+v/ly2Gv+8jqDNa/IICgpPJFurwi3z3w4cnxJ3NKX83dO2lRBCJmrz1
         OdSljBQ9Hzrwys39ee9vxOxDlgOa/eK1uVeQkZPVbkMqRixI09Ly6lCCGCVx5RRKQbpM
         w9pkmShQgQiq1eL3LP7SmA7dwcf4MIDY95b2T859bwfMurMFPkz7THET3ltBIJsxvu47
         TOZREWPkNYnBys0Mx5XI0PwoEowa/oAyWPLBBpnlJuFHiR1SUyp0AlGc4tASna47pRlv
         b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059715; x=1792664515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=B99gK6vF7EdLsWSjpocpORFltsQ5q/I7zOvaVkr4cjnAdFNHjLc3gdRBnV+RlLebl3
         tdHjyEEcRC2/fM9hpgMprS08kwUP7cxUlUkFengSBKXCUB2YLUmTcY0zIYuOCn+x6mdB
         m2c1nzo34zZjXKxn+0QYSbSsWHKIGfYQgVvV7jaonUCo6ixN4zcr8m43O2qihRgaXJLp
         SRCaU4YWGQUKiMfwL60Q52z20JFpCi69VWrZl0agZ8EUwMXTW7Jn7jyUO/o+AN45pTbh
         9svWreqA4s8+RAwpfnTQOS53f38T6auMwRfe1qQxvwA5hSvALW9SF8awfuFU50aJEQ4i
         3aHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZz21dxOqoAGagQX9R3raPfleuHeDMskPLsnSz7NrYhVYCR7vQDnQmbWtdepnK2K4gq3d95PZdOM5BhU9S@vger.kernel.org
X-Gm-Message-State: AFq9FYKgloX9bvy+Jp27pfPsuMZS0uYMX1YmafYplgQ0UBJj+wiyAYTp
	z80RPhwQf19uOOuV5e2is6CgP70cl7YxcOyFaRcsSJ5fUHq1/59P+hpW1LSCU5MGC6sNwzd3MM3
	LfHQN2q/1155DC5fol9bToGaCu93oJL4pYrrqcxsKUh3VAo9ULUswYzq28ki1vGShXiKc
X-Gm-Gg: AYBFou1ii+nWtEKLqTvRXoGp72irQZGTYM0/ETqE4CMI4zM1OUYmXj35q1g2jMAMl2v
	9GqphRdH83KKGOZ7eSLN9AC8gy5O9DtHxhHpMQ4tQdIQBqgB1Mdcq8eGoq6L+ufon/XSidFwV1m
	ZOQ0j5SMPNyklws8fvsMREHaZ+9XhqU0+STdcsAFbOKImIsWUJrp2j20V2mLR3MoFbkyN/82CC+
	Z/RiOU5VbJ9SXDmhU7r6cri5/N1atnX/pYrSGIs0S+8AEta5UqjePK814JU5J4miwDkWbo1AwFg
	kSF8KuR0SVl5VbajSmFOfm/PR1LMVAizR5bBW3eTf062huk+29pZU+qURvAiyRO6/LaU7J8J2py
	KCk58XaqfJmF30G8oMAdv6g==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652786885a.1.1792059715123;
        Thu, 15 Oct 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652781785a.1.1792059714411;
        Thu, 15 Oct 2026 03:21:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm106620466b.23.2026.10.15.03.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:51 -0700 (PDT)
Message-ID: <b30fe2b2-4d8a-42d7-adbe-a15cd1bdbf4e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:21:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a943 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zRfI0CciDlWsnbyvqtb5eXF2qZq1MlOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX1YZcIyc8x/o8
 o032N6QH21Lw6TACJk5D4hT/1ebVjLGQ1yxiYj37DqmMfUgjX8FTgeBDYpXh7SvgcMgfeLGaMM7
 RpPlsPBbfsFGKgcBA+5IsF9PhjrUbUy/a8AS9H7fvR7TPUfEJTLalBpebKlni7y0+Vyz696xKJ3
 Z5XgPH7oUkPCxVQJHBsFLhe13S3qv7UdP8FmzNTRWVMDZ3qV65NxGDxPUvV/a5zggvrBEfWWRSo
 zD+gjhzEck53uXo1zhiqIf79iSPxlZUkcX7YGpEG2fQdLzWrZTtGOpkd357TSU4/0v4bClKJU+z
 aR1I14kh/a4azsV64UnOJfPKKZUoCwglVJGuaTqkxv2NJOupJpUUA5NLuDF6tjsQte6ZtH/CuDO
 ueStMt8yE8cyI/i4oE+HvAXtlWP2c2g0DLE/QN7gbWDtY3oIAF+p3HdDbzwpGV6tjdDNX1swWhe
 BxNzWLeKKuB3YjRaRbw==
X-Proofpoint-GUID: zRfI0CciDlWsnbyvqtb5eXF2qZq1MlOL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3NpCnDiNwRcS
 Lok9MsP6V6gFa2rEeOoNxtRiIlzEoL4NLATL1Utud97+5d0EpYIxkhFpdqnHNdxE2mOfFEydI0s
 7jhzVbZHED0uoLChh97jMd3HkJIr+24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.

It's not always-on, it's active-only ("whenever APSS is up" for us)

Konrad

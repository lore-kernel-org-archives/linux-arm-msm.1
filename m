Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B654A6CF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061505; cv=none; b=IClmAmgLPUiZSFcMsqrWrLxxGD5jBj+bcFVDuQaXv4V8b2Tg4YjUUwvdM+GKncgBYceundyYaT1orspEk47LD5tg4EWJdMnN/CTvqvlf6nXAVPIQY1GCTCGeXWJR3RPPRiOI8oImPnnbfbCx8nV1XGCt8LBrEpkNui3nXB7+xoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061505; c=relaxed/simple;
	bh=OMY/Xe60UBY968wgbz/CYZ1bEgUa1Cb2nvJ9EExZqTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfLorCRTj6osWyluZYue8qA1sFscF/ZqMFL8iPqH551tCu2LZ2K5q28/22cN60/k7vfmuWXvVbs5iwUPoLYpWr3Cq+4LJWDupHo9xr2nyXcVJyECSVsfUZZhiM5S7/drFkxA9rAUMKszk+EpfdOSUOsBU6fN0yg3So9hB37gFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gI7OFKrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J79c/P/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gI7OFKrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J79c/P/z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPpBC4100538
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=; b=gI7OFKrkjd41uoc6
	9jwMd++P7C7VOXdaEdLtliukD+2R7T+efvjS68Ia0LuzhTvKIEEuJEuxUlr3bOkK
	aoX5nEf8qwjY5h5yVMwsLjeBWvpICct2Nyplo6xsYtZu11SuxCWLOhqubl6SsjbC
	KPw577Rld5Yo0XrnC5asiEcsrS/DsJOyPNAeHmDDXVOSbH5Xg8Ezc0RYzoiA+0f5
	2q63U0dbv1VnMx/Ktxe6NED6XG3UYVRsaYsnpaV7A5cv4S0bqFgZG3D1rWZrRzTq
	Iavd3JwEsdDiuwvxg2x1Qwpk88tI66musnLfisOgZLGrBVXa1fTFjnEfHrvKhgKB
	2ichkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r82yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5351b6bd8adso13322031cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061497; x=1792666297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=J79c/P/zSkC2DtTh0ZJBZ01esKbWQGsUgWFDHfWzuFDOJqYMw2Nb4Unywq5lwdQI9L
         PgSWDNjLmzDDJkiBl8XHh5ntyyA+w/21yf8Jb33x88RoiC9FzQJRrdL4aq1P+JK53K05
         ZVrMFR9OXntGypCkMlUdJgdnIvUxagvRMOIg8Ewj/qwG4qsIs0D6FaJw+h+XKRRYpG7Y
         lVwgBBiCT7LLdOkzNxE7aEdhhb/2ROxob7zHfe8j18tFjRMdZuH12oIDma1n97NVUYyD
         4tWHocp77mfSUHzO17jI5E+IJfzk2BJeKZLHut28vcxIF6omWLdXpH10PnJqlerb1kDA
         TjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061497; x=1792666297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=x9rz+Jlk2akU7jaQuiPbRW4YQHlDCDwAr6fWty6G94fjB07MWzWANYZ9qbfVhbZ1ZU
         qaO7MUnGOpKzcOyl7qZf61UPBF3fNcKkvtkrbpLg11gTtdjqCETg00YMPCUyvA7Jh4CJ
         n4D9M9KQVk3U6JiOLGxEayZyK1csyqEkDX4bwDGH44uberoVD2vVGTZCyAYNU5qOiFZa
         7dKY5Z+G6+kN0unzp7EcGlCsjyYDdDU1j/4rGTCeHZa+nlKcg07Ycgn/fwJQgJmW0vSH
         /nuplXkVkeUAoSr6oWoSoXSfxiHljkA3Clp5ZoppQE1gwaO4NW5TDn8Vb97lm6ZxR3Hg
         Da5w==
X-Forwarded-Encrypted: i=1; AKwUvBwbwnNUV33AHYMi70Zu7IaF2ochyC+Mw/S5zasYfpSIidON0xBo7HlSQf36ro7Bc5w6E79qfrlCI+110LG7@vger.kernel.org
X-Gm-Message-State: AFq9FYLM7vl7U656Bm4uDhhRnemVoUyQsvBxQp5DDi+pNT598b8CLcJh
	pYgjxSTcTioXclK9fshc2EYqnsjPK8qawiMxD+EtR8OfnkStHLMFMuctHLfkAfLvP8dzhwh1p+F
	sufhk5Y+anwe/re7huRAYOZ8t8TX1lZlRlTsBIi+qgiODY3o6ZaFyEJSYMiSNjv2RJsS0
X-Gm-Gg: AYBFou0q+7v02vauDn/9GiWHpvDtfycEgEk9GXN1UzolC1fmfHsAFORY8MF6hG7UEpD
	8NRp9nDAynJr50TlhLCC+5drQwvm3MmN2lt6YqyYHZbjnaKuotDlAKtMY7qCsOr/mO6kDtgp5UO
	4sVBW0pov9Ok1hHwttOL1EY8cjZD+Fg+2woisv11aWBQlgu00/baTYC8qYUuDGx/dnT1UZgr/ip
	HV0jCk9TV/y3XvQwja9TDNcPzz8Tg1uGOpDHk5jKDzqRjYGVOj2FmJ93U3Eh6FYXPYLfdR8dFei
	zDlI5fANsrCOCiBMDumzH4bzl42z9nEBheoNumbsUo4TuvyLBA31xt8VurvSsED4lR0SS+1FIyQ
	vodJ/N9aBUEBKiSoLujeZrg==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642744785a.3.1792061496663;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642741585a.3.1792061496206;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9640488sm108759866b.25.2026.10.15.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:51:34 -0700 (PDT)
Message-ID: <512837f3-597a-413f-a8de-612e26c8c78c@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm6350-lena: Enable wifi
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5yILbXBonhyE
 2xOa0qOPAAVxSufwQdJ/B69HsXUfe//SNSSXnMeyfVsLNdZG5fUS9/w3Rr8hkb5IXTrPCOrowQB
 v/gTmZ/jLAsUyMhiwtBddIfQfEzZ99Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXySVMq4qG1cfi
 OQldJLGGI4CTyDaj5GF9fskrfSzsaXK4YWw5mrd9PSFKF/TNVGvE6JzPlMhXUMKZpddDeJvlzD/
 EKN3C8C5v4V+OOLnY2sCNxJhnvtYHzem9wt4V1seROXrhPvY0KOTGZv11LpJL6OSHBoVUdgcWbC
 uyaWzm06FUFq8qGJhStr+nlxpK8hPvJHt+QmiROTTZp+8nal+5CaS1EZ6abW00xbjSgVMoDK9Vf
 hmTUelkae6xGF+6opaPy82BTYzUid6cVo+2F3H8AW4o50Uw0Oz74aDv8CxEurRe2PfW3Kbs3UhE
 spqfgRYm4mSItzQRJFi1JRkPuHhmwkN9fE2L+DN3uqL84Tj+u2QeUTFKKlAAe+KCXfZ7NZwf5ID
 BzI/Oa2aA/71Cl4Awbkm7mwF0d/lgg3P0yRpvjoHqv9pqjABAVAZIrO900DcqkpGfpwegZ9SRoa
 veMzswnr0+iQ1hBJauA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b039 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=If3Kxn03tZdP4ytwtUoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: ut81ZBVjNtGD3wbcyT5ZmoCa5-p3UOXm
X-Proofpoint-ORIG-GUID: ut81ZBVjNtGD3wbcyT5ZmoCa5-p3UOXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure regulators and enable it for the Xperia 10 III
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

It would be nice to have some more details (chip id, etc.)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2D40F743
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376507; cv=none; b=rxK8oHYfw/Vxyc52UnvTsN8BsIjoFFPsMisDAUOYCDkFatHJv+n48M9BDRLHcsFlgRaYYtuMtuX2PzDV6dx6FQqxuOvIwdBb0y9G5NLqxYnr3gR4A3QvRZl1yXcxGQYxNnS1AvsZDQ26e9j5TIw9EcLJG7whB74ePHBXJC8Qyxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376507; c=relaxed/simple;
	bh=SSZZuAbiA/bGCxdScGctQGz1SoqPI7ykdWK0HpLAE9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ov7YpIbuXbviiM3NQPA4nGgCK6a8V9+6cw2f9OKcM9oy1Awgkw4m+Vl+nS0ZXy95pmCMnSqpHo2zJbu/a3HGkY1rRiIXlTPsJInadjYRrB2YCNtdls2SO3rF3nfKWHvReDz5D+LzkS22N54m9Ap5uvpoY92nhOy2ser3XZ/jtBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+Hk2hdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSCoRmx4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+Hk2hdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSCoRmx4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E801HF3490272
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=; b=X+Hk2hdV9zVs2YKl
	HWsXYz54XPR6gXnU2Wr5lV5VUTP0iDCXSoc8LETBMtoIxa/ItD/nzC7d6AVOarg8
	eER3DaBb22iz74Teu5Nd5F3P/qhSo9cj9GJftGileLqzkHoeOxQsJQwc/jZ7OPQE
	quY1LrApkdMNCD7LfXYbGmj9h7EwqtalZV6gpuI+epaRrKbadv7mXStrahj7aUg1
	zwtJEM5y/d+II0gSAqRtD8f1LLYYKx242ay/d5Yfk16YaIdk1qBAUfFuS60XyjDe
	z1HRscQxR4sk6pc6Sl7/rOF1JtebBy3ZPLwBlSRu7l7rGT7f5OeCEhYCxC160qrn
	EV3FsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f06q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:01:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so7998756d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376500; x=1789981300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=cSCoRmx4CXDIrhiwIGdOjk2Yyxeww9Lj/IRS6zYIOt6pzpWQ2DLMOm8+0NkEr4ul8p
         rTyAV77Nrc3IdsoBiZrKJImhdtH1wLIJ2uLvrFSxeRy1M+pWx20tg+qIuiNGwZKEsyTv
         7bUXfltPm152N5GqMbV1pO3D8okfXQ5GbkWWGxHvSHVfrMBAO9pUARHR/Mc9aSibQUHz
         uSoXwLnf5DBc+ZFXWTrzL9tHQDB7G+qg+ps5QeNxrnbFX4a7LX8QOTuMeNBltwMIef2x
         vA1/btaN+K3H8VPwvYOVwGdBoxYSI80Z8fpYk0SH0qQauTstLzC2nhY8onh7UJSU3tNW
         XW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376500; x=1789981300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=XNkStWXyl0KDIjVAmT1Ovt9fiaouy1nzPYpmxp8MuminGqj1Igk8hl+DMYQF8g/pjl
         rfz4U3EMGAfv3vXK2h6LpugBBEl50ikfSWBjmHGwSLG0kxAjs555zbSdJVZkHrxHkZO3
         JetQecdFtSP9sGgD0nDJeJwCuGdtcs4146539njAAGCIyZMt8QzWNRRKZ60pWbKvbtvK
         V2N39nMZpKA8BxdOQnV7uqf7c+j8cAeFOyBl5YMPayR2N5uJY7/FR9slocIdmtvRzfas
         53SVDIfrzYJuyfBE0LrVefC7ZoKmEbLy3D7LWPS2/M444wuWzAld3LHHPgU9EhBWlfva
         ZkQA==
X-Forwarded-Encrypted: i=1; AKwUvBzDfkTYd8yyAIaj5XDiiYTFygWr7pJHSkUqhKWN6ZXhKLn1XA9b65AAL2AHxFm46WOaAfyav3JfZPcWSoSk@vger.kernel.org
X-Gm-Message-State: AFuF++kd20sMsMb0qTuSr9i5KXBsOdr++Gls7dauI+aJY7inJr57xLnV
	mXkRlpeZV7LC1xAPVyBgeNe2ZNevVqyRbAwj91lp8gdwM64Psf83eT2XiaVNC+CFNgPq5HQhpkd
	gih1yATIXL2FpI45XpKVlDKLHuek9sHGMKlPQswHhopm1xRlBqh7HXD+cUEviVJIKrxV1
X-Gm-Gg: AYBFou1FmwbCIzjEq6uraTw35Ax6gXh7Wrdck7qb8BLn38CZnJOMCjxx6Thhjz/PAEQ
	mKRfdmVf4enPXc0Ul4fM3nKRUu8l0rKcZ57u1jTO1wG7GrrJ1DGyrIbXvQzVc59YM4/83/x/j4V
	mjCq/yZBlbsDah0V0f1gN2AreNgHZ2sp0nqebogt1G67s8Fdi1aXddhQ0W1z7GF1Y97UrLHeLZQ
	c4BfB66bBUXnHJG0YFiQ/XbE6bOe76HA70EPR3HFtmVOroY7U3+DmCIxyrsYbDTkV4H2UguyiHI
	tCs65OhxPY0hGe/vO+RtWBNrU8aPVN3/Sw6jl1jou4lduGKsZeoDYG1cJD1KCpAEAtqowSQUY57
	PrbhTM5vt+707t3f/9DP3pA==
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19261526d6.4.1789376499604;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19260906d6.4.1789376499064;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614b29bsm390322166b.62.2026.09.14.02.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:01:38 -0700 (PDT)
Message-ID: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GygKT8QFtMf8EVHVzHWCDNn3h9mjhEsw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX9T1wdSRXOyop
 iZNRGVC+SderQT2Y4BwllSu5gLSHyElE5XOHafBdsseuGvBHR3/XiSkFqWGsG20VBTrnVEQJKlU
 7JbqurFSGtfzZb4p0zu8IRHGUdEK+oo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX58xqW6TZDjQo
 0K5vte74ZWK52l1pLjNj2PgzvLTkz3lg/EyoJMCLdYpg3qKgHeLlwPutug66jMQbNZXqlDlsGIY
 4mYLER+DXaQRnKRmoyRg2dxCiJXXVTbCtdUIMzDvuzkIsq572xGY5ZiaSbwDmS/34blF5mkrJBp
 YZo5cWjWTuDvRLqJQGlKsblTrGd8MATzBb7VGFW6wBneOlsxiGBHXjbQ4SmLgSPGR7t6i3YnbSU
 aBxDOxAGMwSHvqnsYd0ANy/PmHmid6sa7teomoG2skpgtxdDybhpJZYsvzscfsyvxZH0IVYUfc9
 7aISfUeYrPfXKVnVCWIjOBT8gHxtzgkWYSJJCTAgZUEXdRqLd7UojHlmdq6QSNHWKHtFibYxFKd
 YApFCCHQg51MRTcCNmr6GmkVjoWg9/ZywKDjSy3bOOF9P+a8eq6LyiSMm/4UZe0td7ilkaLPqDn
 yUR0VLP2BCZma/Bt2Ig==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7b7f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=v5UkR_fZS6cbfkSa_YAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: GygKT8QFtMf8EVHVzHWCDNn3h9mjhEsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord RRD board. Add a soundcard node using the
> qcom,nord-ride-sndcard compatible with two DAI links:
> 
>   - PCM1681 playback over Tertiary MI2S RX
>   - ADAU1979 capture over Tertiary MI2S TX
> 
> Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> other nord board variants.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus, so add that too and hog its dac_enable and
> click-pop-mute-n outputs, both of which have to be asserted before the
> DAC produces sound.

Sounds like something a driver should ensure?

Konrad

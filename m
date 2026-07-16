Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2513CDBD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194968; cv=none; b=QC8Gnb8m0AwhC1AXbrlh3QVvjPMAOAgaptDg+wooS5qv+PNPUgqWKpstV6a5GbJYBZE6MYrqvE4cbTfNd0SOza2iAADzw8g5ofno2M9LDo3EAJNzS80JMs/wxESvPk6a0H6bYCuh97eVClQiFPeVaCDHWLWUsY40RgLAOkk6ejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194968; c=relaxed/simple;
	bh=5HkbT5VTjQEbCphRnfj+qtVR3I6tfp3ysrSh9PXdd8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIWIKM4Z39pW02PHd3D66Af8GgOu4AONvM0qlOii93pTqmBtGp66XQXFSoz5aaPH+jJdSaQJkEr5bmncrathufHWrzuThYBfffFynzj83rzzi29yZmvhhTs35OJHsQJmjyG7cFatMaM4tH8RGmo5gNKW+7G9ER4n5xZBmSv71mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaDXCFgl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bi5rqSQX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaDXCFgl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bi5rqSQX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9MjlU2187973
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzsM35EiZJ/yzPPIs0XjKw5tRsijyewrzXg6CrcCnPo=; b=HaDXCFglMZs0ti8S
	pzu3gBUeeawMCDZsYTLiTxpDkYKE9KNf+CRRt9U1jbC8Fb/hQYixA8KGO7puSrsS
	7ljMkbD2umyqmI97nEHvFoMZZ4wdLNRNQ0DtSqg/lZWVq8TYBp0FweIWkAmeCSNC
	tjLLDpCvEKHKaCfNFRSlStd/xTDo0kfdu9B+TGGSCq1/tNXthCMFKlIziL22xBHs
	quYjWGBaIyx9hqWsE6lJq+2lAv8P86Y81cojjd1XLeG2U0XqOUBDtgZ6PuXOeRpD
	b766iclZDEZkSd6cjegBOWvS/Pv+AIbD7X41mO+NV+elMXqkA6iyNGXDTWXDqvar
	C9OlzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv02v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:42:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4ecd1ae4so106213485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784194965; x=1784799765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzsM35EiZJ/yzPPIs0XjKw5tRsijyewrzXg6CrcCnPo=;
        b=bi5rqSQXKy1zt/i0HCqX8BhJC88RyM+jubVRVk3y9bfGbSCpW7sX1Lx0p13UDcmA14
         68NFGhVpon45+z00KrVFrkF+HQl1bZEoTTGAW0B9/ery0oGpodLlvs8H2pjIGwQhF/WV
         A3s/G4BL6+hWRIrn4eaLWoT4L/YToWo+AvRp6rXjOPzULRsah8C6r05kKfnTBBTUGoPN
         QLWfONJfgUk4C0zUI5Xu/+LmRuKQoDhGJd3tEuubD6+vATHOJl5krNTYdES9Ba/XegLJ
         IrtgX8ziCSLgHQ0X2NFCUHIQ2lcvF8yYIbr9LqdO5LVbiZc0cHxhIL80Y6hAnr5BUaRE
         DaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194965; x=1784799765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzsM35EiZJ/yzPPIs0XjKw5tRsijyewrzXg6CrcCnPo=;
        b=aWd2EUL1+kuakBmCJKjpr5m7HwLU7Raj5CbRpJN6ic9OXMCoGRytlHRuNXcQixiOdh
         3433D/mcAJXrxgwPK4yYpresYW69bGtESiFAL9urfx8B12PfpTXXt4qvRYD/4+5i8CmB
         tp4jkN2GfXgXqGtALKRmGLCDJAbfwpE8FWhzOwvUcUchErEA0g4zzTQzXA0wIknEcFdo
         1YQ+i8/bSM+hq6LrI1h4qp5jJ1VJmHL5EMSogicTGYKNCyjcJO+cbYmrij9ogate6TR9
         UOXzJJFiZHj0jvlJFWFwJ82TBV9Bri1eYWWpruVPj/Zj9l2X2o2P34KGo9cJMRbsLKSu
         vrNg==
X-Forwarded-Encrypted: i=1; AHgh+RolSNvZF38pysUYy37fqYKMBVKRmeOJWvod8jtwxe46Mgrq5GRxeGnntPK0JOExlmbh2jGdI2W0ZMe5A+W1@vger.kernel.org
X-Gm-Message-State: AOJu0YzbII/exuCb+UckFrXtxOleDkBQvS2m4kYsY9lLHFLbM4tyoqPt
	doJouFqRtKfMgxlU7JK1y8D3nxIDv3vvgt3Ai02X+qVyYGLq1Opa2Z493klWkTyRNFk8E9IFQwm
	V+T4O/9aPnwy3IkSaLZPfcgYci3KQJCDeJSVKmMthlYz4VOMYPBTzdhE6IR/19R0x9eFq
X-Gm-Gg: AfdE7ckDP/5NvJW0ITbV9s/uWWXX/3jGjjFu6pTrP6mGTRcpw0FKWK9RSJz+JZ3SX+S
	BdKfc7Mei6ZIcTGLH7JjovqneRIltb6pbaX8gM4TonbLPLrHEvlpnED7WpPVnfjUJ/bJ3lf/rnF
	HUYT3F+LYYpRitH7HUHwrZaqKGRx9cc+w0eUNX8WxWNJrpcNLku6s0DrjIV3S+1cbm26FwIH6a5
	7f2mdYGKdSdzVl26/q9ui7jNkeF8ZEWMZix0BpRNziCYuJu76aJdH/77TCtxDetujE0pbcoHtK6
	efkLXQJXneI3Wac50ZFa6f6UaKbs/QYmc2SvuFKCxXeAKIajO2J25DD76at89YnVyK0xdUuXJf4
	i3qr6PHje/Gv/K5MDZLMo/wk2
X-Received: by 2002:a05:620a:318f:b0:92e:705f:1626 with SMTP id af79cd13be357-92ef2c65077mr1810282585a.6.1784194965170;
        Thu, 16 Jul 2026 02:42:45 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:92e:705f:1626 with SMTP id af79cd13be357-92ef2c65077mr1810281085a.6.1784194964806;
        Thu, 16 Jul 2026 02:42:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264basm176210666b.7.2026.07.16.02.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:42:44 -0700 (PDT)
Message-ID: <6caf8ca0-8be5-4935-9766-10d21c71ac37@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/msm: Fix dangling list entry on probe failure
To: Weimin Xiong <xiongwm2026@163.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260716013229.91014-1-xiongwm2026@163.com>
 <20260716085313.207069-1-xiongwm2026@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716085313.207069-1-xiongwm2026@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5OSBTYWx0ZWRfX7oh32xaDi84D
 mWLIlOIBid4hKj+dLOiOcOGypr/oKBktn5sqy95JlvWJTwMTLQZlLnV1m3uSUeeaHAdNxi8HUob
 POY81bG+RDtVoSkI/L30uUwgJVm8pKHBttgJ4VWMWeceIDKTmteC2voQJfm4UPJ+sULJKlUojq1
 YI0eqJBDH20lMGaNeoSwRf5WNyp2HljOAByr5QBfL8LDCB8v49/7buiQ1nzOmeA9GHoUtfZyogO
 Tb2Y49iy0NsJkVygRfGBVRUOZi28Xyb2/Qdx/Gtv0KXybheqyTQpzgxnfogbACOjsEhXYu4xcxM
 S6s4M0r4LDjV4kZEC+0QFWVEyY6ooHDJP2rb5ePfKQf4DvOEVQsd0C+GZD7plR5T0p50eGanpH+
 lXnducoytSudQoQ2BL2bfXUdtBKgKuK5JRzdLWMA0cK4Y6ZQcNfUCQ1mDacitMd3e2E7KI+pS5N
 y0YFGF62uj8cfJLopUQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58a795 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=n3OY92c7DukLRWByAxYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BhBEMt9wK76hOaDQK2SkXq7FPMbDnR5-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5OSBTYWx0ZWRfX70+g7Wk27ubp
 AIL69FUx7DsQQiMC2UiMlXJtVGg7cu/H3Vi7Dvnl5MNz8Iq7KXP3dV+Hp7fNsGHj6V1UBxepE/F
 PwmYk9OyCZdFHlpc2R1GtcBjdMuz7m0=
X-Proofpoint-ORIG-GUID: BhBEMt9wK76hOaDQK2SkXq7FPMbDnR5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160099

On 7/16/26 10:53 AM, Weimin Xiong wrote:
> Move the list_add() call to the end of msm_iommu_probe() instead of
> adding cleanup paths, which avoids the dangling list entry problem
> entirely (suggested by Mukesh Ojha).
> 
> This approach simplifies the code by ensuring the iommu device is
> never added to the global list until after all potential failure
> points have passed.
> 
> Changes in v3:
> - Move list_add() to the end instead of adding cleanup labels
>   (suggested by Mukesh Ojha)

I think this approach introduces a race condition, because e.g.
iommu_ops->of_xlate() depends on the item being present in this list

Konrad

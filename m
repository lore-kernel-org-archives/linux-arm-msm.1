Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797648;
	b=fRhemw4l65espEKduhmWITE9znCfMxpNqzIKx3iEGx1LYkAa6Ol4PKcri5ck0Porcti4
	 r0fmOEqkhrXFXgdELHFseg+kifddktxUo0Pt72aEyHYxiqRtL0ysWiskIFcyQ1DrWRD6Z
	 UJA7UvPmIZy/Z7DEuLkVXSsaTcH7ZhvaJzGHbZ4yGdeonAng1CSjVlX2h+xSHPzhN1XJu
	 u7oAt1JHxxd02e2pHOII/GkxqC31bV4CgEby9y2di2qqO67x0ZGXf/G3rpb4Eg/ihaFCB
	 NtETA9juo6QqhiSok2KNSsDpHaOyTSkrLBShpeoJ57BnvJ5CssBwmQ2q4Ykb0+3wY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
	b=XVb8VXfU+E0dejjBcjxzA5qMDFPsEAxd1NG2FhtOZ+StYglIIJpmjPFaPWcSlvKx+8Fr
	 2+9PIvO+xFpstTJZwSG/CQuwNpU9EZ/J5JfPDVgG/CqcjhpmNhXki8qSDOnZFAykK53Nm
	 pBnqmdXjanBKjxr8TXIzTjIFklCuv0xOPQRJ7/aQFGhdg9PebRnpQep0VsyeiYP93MKbz
	 uUQYJtsOSEtcGIn85ryKL2JmT0mp7Wo9jBoFCzPJm0GrRPXLlF8wBC5bV6KJ2gss0IlUs
	 kmElgPbSGOZyk/S8KUnO9DxklVwGzCg8a8pBkk3eGPOTd1hS9v31wA5EVTwJAGO9pTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cb+bGGQV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4oIqoSM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6C60A2601
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D6C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cb+bGGQV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4oIqoSM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvCRq3983329
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=; b=cb+bGGQVjydzF9Lx
	J56AKDjoIYpS22BocoL9bhKBFDX36DHAxkwH5YB6vPzYFzSOIb8F0NU5kdciBr/f
	0SBywl+ZZUczmwWqNyqNxc30oixN1PtxbXUH+8i4Vqm2muZQVi7wJ/6j+kwIb1DQ
	mLTUvH7qxCiaqwza5PevPSPsvwtvQhyPhiwq/cxpNa4Yv/l6esLVF/oJRCUKpT2E
	ckNBVhsLqqp+2i5i6LcZtlUr9/sdC2ZV874U8JIkb8BAhOEhkb+a3AsLwjEBwB0j
	tmQg1ooMKyc/cUoBQ/f6BDEABgbWxpWo8+GvAvaHYNKATK8Hho8DI0jMAQImhBN2
	nHPevg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1d0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3567735eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797646; x=1793402446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
        b=j4oIqoSMPXVP5YMbr9ydcBNENwx3ioJbVZmxmyCK6/dVnlo1N8mCpVQb3+P/H9Ku1i
         n386I1edb+55MMWX3Pez3DUaua8PmRTmx3YCULOBYf9PD3oTQYIZJDsbgsK5myl8fpdg
         IiJ/OlpcruzntYCVpsTMjI0vEaI2+gaBkv1rNKwJvIa5mQ0d2iD7uDXrRXiLVjx8Ja04
         6nZvwhHe0JdPlJ7oW5yy7tHwXTlog4hfQvIQKjEfvGTMSNt6L/bx6GM4InzY+g4J6t9k
         FMzuJQPkWZujjt4WSAqK9ejGn3EtyYdrYiwNpzoZOldBGCuHel7MfS1k/9zXqzysuZ9D
         hYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797646; x=1793402446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
        b=EaeksFOANqoYoQtDWEn/NJ+55Pj9Dqwz92WL9I1slJSQFh4VRsgGzec2GNiXFw7+aq
         CKgWkDhiW6wl7Rr1z64OTdYr5B3Pk/QMnISljxdoR9/jtEakU3SiRLaU/tSt6YbbI5Vz
         LcRYKF2XfZCOWxiSlzPeo7Ixv6T8eHG6L4/yA46aybW5HMSH9ZJUp+Yt1f7cLP5KRDVt
         RDLLZTSpLkmciPl9E9luEQEnJu0JQotgm1lW3VE0qRzUZWsQslrj0FNMRG2Cp8KMSQP9
         wLNvDSiFI2apwJdsZsAF3NMV/i6ztw4fmdORf5qW/0Kljf8Wu08qSnJeoKlMUhGmlge2
         BMhg==
X-Gm-Message-State: AFq9FYIR8VXbHOylop0UQfoKm4G9jyZRFdzOrJFWEpmSWjPhlRGDWU4C
	OuPFbV+i1WQjSS+97iwjwK7t26me0eMZFElziZSdfYLCi6Xk0wUmoC+yqEpgInc0FaNx+vDz/B5
	rHDKk56rZtyQsIm29MCwuaB2g2H8OTbgxGkn+yOn9Mc/0mVAvtucqyWWFSaTRetdQ1fvJ
X-Gm-Gg: AYBFou2v7njMdSSJR0DqbUG44pzKxM9ZScQ17jFMklpsgEpO64krtjOJJokUnAKo+vm
	U+S/b/kDNgVeMgPRmorjtz2wLzUNFCC6on/bpxyHU8ekpZePAv3lTsyyanQTC4rAY8yHHHLMjBg
	a09AkzTjLQhBVX7mITY7Q0tzEojkxXICMVviu/oG+Zkf9NauRPsjkGyUL1lJHvHIjkGX4D0JYPd
	ZNC/5OOZjrqhJcTckIvMjKbU5Myk7UlwK/RNAHFP1lBOcR7PP2OPnyOWtANu2MZjpufEJvpzkKT
	hKuHQpTIVrgAGci9SsWAXhEb6oZqkqOuEhdXGU25ISQxBZ5O4LWSnhVGz1WlOikBYWmxhFPGTWg
	5ztImZUK5y+wY0T6aPKizY5HGpGm22Bo8OdhcHC7nOtQpyv3SwpoSRw5n
X-Received: by 2002:a05:7301:1530:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-369e84e94a7mr941196eec.25.1792797646015;
        Fri, 23 Oct 2026 16:20:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1530:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-369e84e94a7mr941160eec.25.1792797645424;
        Fri, 23 Oct 2026 16:20:45 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8dbaa42sm1633083eec.21.2026.10.23.16.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:20:44 -0700 (PDT)
Message-ID: <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:20:42 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
 <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX+qBtB12bKpiG
 JfquJDHGtRrTuDymeTF8rZtJx0nDrYP2+DWpu3vrDbJPaLG0dNFKfrgd9WHNnMbE1QmRfPKf7ny
 YI8+DrJELKk4K/VJrRz0x1FbIfOl6ZxOl6MLZKprwnTjHEvJOyTzaRuUk3Re83t84AyolKkdcyI
 +cdSFibDoYo/K7KWvasW8zJXmmuUMpO3Jp+egHSFSqgooOelxjCpF3eCyYUO+ZvS1xg0OgWZOZK
 k5qjj9GYuyal4nlwffX1Z8JcnQGflJHRIMUnfE1zCjyHWxtFPbJwQJte84ynQQ3Xg/KA4pTqIU1
 rTRtD7OmLkgUs6gUgocczuM0mrPnhGMs6Os0RoL1wNcIhr0q0K3Eoo6saDvBGybNLLt6iSNU9Bi
 tOjAzJ+xfQyYqtulDdTop+e8UxzLKIL3nlpD12lcWIaOav+zQSqHPOescZoU5bVEEMhTyQsxSYE
 qV4lfTL1oAP9E2ScvTQ==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbebcf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=0dgAZyHGDfjHxxwXnN0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX+fwABUwRVGso
 M9A/HGJsdSRu7kP4ClBTe4Sw78mCI1Tkiu5ZN8j40KFSj4zQy7Rwm5m/+U8jnIT2O/Z86o8vGxw
 WKRwnj27/yA05cbBXrfNN6WNidsMoN4=
X-Proofpoint-ORIG-GUID: Xf8A8rskstXeigBHxa5DSQxKhFlMJ6Li
X-Proofpoint-GUID: Xf8A8rskstXeigBHxa5DSQxKhFlMJ6Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

On 10/22/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>>> +    if (!cfg || !lanes)
>>>> +        return -EINVAL;
>>> Lanes must be a multiple of three to be valid, at least for your three
>>> submissions to be logically consistent, this statement must be so.
>>>
>> I will update the name of lanes to data_lanes in
>> phy_configure_opts_mipi_cphy struct.
>> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
>> data lanes only.
> 
> Sorry the only thing weirder than arguing with other people on the
> internet is arguing with yourself.
> 
> I argued myself down from this.
> 
> =>
> 
> One CPHY lane is 3 three wires. So data-lanes = <1> means three wire
> that only the PHY driver understands.
> 
> We communicate in lanes not in pads. There is no meaningful way to
> specify pads in DT - only lanes.
> 
> Which means lanes - I think we should follow what struct phy_mipi_dphy
> already models for us:
> 
> /**
>  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>  *
>  * This structure is used to represent the configuration state of a
>  * MIPI D-PHY phy.
>  */
> struct phy_configure_opts_mipi_dphy {
> 
>         /**
>          * @lanes:
>          *
>          * Number of active, consecutive, data lanes, starting from
>          * lane 0, used for the transmissions.
>          */
>         unsigned char           lanes;
> };
> 
> For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode
> lane == "three pads on the SoC", there's no need to deviate from that.
> 
Ack. We will keep it as lanes.
> The CSID needs to know the symbol rate - so that it can vote on the
> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
> need to know that ? It does not, symbol_rate is not required in this
> struct no more than it is in DPHY.
> 
Yes agree. I was thinking the same. We would not need the symbol_rate in
the struct.

> Sample principle.
> 
> So _really_ thinking about this I suggest
> 
> - Following the DPHY example
> - Including all of the CPHY specific timings
>   The ones you posted, plus the few I found missing
>   Any other relevant CPHY timings we may have missed
> - Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
>   IMO we should use defines not hard-coded constants for the
>   specification of the timings here, unlike the DPHY code
> 
These comments will be addressed in the next version.

> ---
> bod


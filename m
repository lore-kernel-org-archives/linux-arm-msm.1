Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717598;
	b=k6ddrmKr9TnwZrzcgaQdv+ZJIiuU5vhGAhfYG6DTASdaRoDP4oVCfmjD3ssHN4e3YdDZ
	 jf2wA+3mnZ4cOssfgUEYAoSIcQZSS+scYS7WM0Eyf19BgevOZ0DBiW/YNJw/Wu0EZ2Uos
	 rrqxylw47Tb8JM/ZM5hjnwUMBUe8i+JHKEDUq5uB6QbERbf2IdmeQY0yMaypqNa4TkCWa
	 JkYWcOIOJTZONS3nUk7R9zxXemkhQldAOPLQTJ1eGCMFgxnTABhr+MVujhiRt22mvoNJ3
	 Dk8ov4GEwAh+F/VVXv/s8lVTzibHQYq1SDCLPIllg+g2WR66LGKfTYbndlJKB5tmhBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
	b=m4g7EBFIHO3d9UIB0/rzMvNHoVZ5G5jgKlsG6jAZ7dLxSf6wdvzkdsBeiudwj53W54J3
	 KZkzc6xI7FWrmkTDsBLc+2tvlxRsKDAu3hj9/t8pq6BkmZcAC1ucyMj71s6CIzR9+siCb
	 DXyVmdaOdwoIOcmkP8YVGs3nXfjoIQVPtvpI/p3jHKOidR443PCSrNdykVnRmHAC3HcDI
	 fs7RhSzUUIUuLlRvr7MtfQlG+d/r1ub50w81/MdaRjD+7JQSSwz75+pOTxrD+eqs/2uhn
	 0SxDHv/dYqrqTETlcKYx1Xfv/UYz5D1ajIiliRfw34fy+/ooEHlDLJaesO3RP1dMK9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CDE606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CDE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMFCtK1996973
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=; b=bnIxPimDxayqnUXh
	GL1+VNL7lausi4gGZLDFEgRk7OH66jnQllF24jrKXDHFdt7eCoXO/rVsl+kJO/Ya
	plgnq1OPZR7X7XjK2fHrOGhdqM/q2Ic3PdnmcRsWRW7v9fj1rpQi/A/P9oNgt8WS
	UAdeOLy1239U69RmscIvZx/0LEQYDONepK0OTNmVGE3fA1ZbejHM3FOmOZxbmycd
	zs3l7SNqrrVf7wyWVsuT6Wb2CrT63tUupeEEZkyhzvAVjwE5hbIU7BWdzjUybgnO
	77wB9wLBFkW3xYOUs2CBgWjorzITB4cD1uynoUVMNX+u7muNYerXM/pcM4eFbXA4
	Li74sg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmr97x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so960838eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792717597; x=1793322397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=E002nKI4G7M6QqefEkRec+t2NOXaCXOBuFspxuQo3yxLyJVEti7+GfIZSvwaB088wn
         hA3+TY1K8HyPMQEUvGa/5EeoWqJkD4/iMNkGNrYdAfxtncHL8Kj5ffL10t+D2QU3q5P2
         /vVXGRU4CmZV955fjc7ogz9C0+I4m4DfkPtCMy52FtYeXjJ9coK4FPxQ4oRxVmJvNID5
         gXVUcCxzDcYmp0r6AetlA78SHnfxif3o1wCqOgqgXYP8RwSk6CuTcwrFU1nRHz/5iJ66
         QF+jj5yBY7wAnxbXVMKvF3EnnCSXKU+NyG4cVlDzxGtABj7kQ4Goa5rvFrb7mN55dOfr
         UdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792717597; x=1793322397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=ZMlMKQyr8dq3d9xV70mKJBFA8V80z0BhyGq2Vy5M1ilYLk6vxDJALRYQluruNyBBcQ
         doMj+NX93IwG+R/9hQSmDCHWnYmPOHr5gAgeKnHlzqAezcHP/Hm2OK7kCyiSTE+sDUd1
         mRj5JtTBDtyCQmK3HQ1xb/xvHxy7nsK40XkyxSOZROmI2nx8P6ZrGkJR5rCgaocJmGYK
         4yj+27z6qcw4PBZONYSFTRLNUxMn01Wmu+JgMjqcM32zT5ZeqzZDxDmck8msgV/BvLyb
         nGmy50OiYXjsfz9sSXABpd4GDl2VbU5tU1Loa1azClqIiZB9LiXE3ddBnTVqMY9e/tb+
         MSMw==
X-Gm-Message-State: AFq9FYK1N1sAybQCFqYcQ7B064HvpBKCuhWUdA2p1s5zE9e9Q1d+BTbZ
	4YArvgsKJuCYCsFZjBUHSeYvak/Ja0n2UjSwrbW6XJo96ydLCHK+X6DJO5WZhIRSJJ71dzfUmK9
	FBDF54i8Syi6Rx84V1Ub9D3OSoJSR2z+7E9coRg1OIWiCE5nnX1HiJ36Onr3LLrO8iCo2
X-Gm-Gg: AYBFou1GSJuvdivNdX20/rgfDXwLRMvxEfYHXkzuSqn9590+xOcEAfHJCl+CZkK2drl
	nh1qzRc2r6UIBwYbinG3y5NnXG2I3edEx4ARMffvSvmLfUTsdjE91K9oQPmg81VJzD7QUQ1wr0Y
	vEaSD2kOo8kwjy8l026P3FJxKBMfcV91x8w8mjxyuMRNPWUGtXbYTEtYoEMZKwC6JKefpTRhrOL
	QQa4c3wOPtaze0s9z/8EELjzn4kqkvu9ApEzuq/BTfY2UMm+zmU7TyHNFh6M4jE66FnHtC3tRuL
	jUDEDUfBCPPj0mq8XdjSxTvm7Yu8YaZff8dVoZi5uw7C7GO95diuG8yDF7nXIYNDWLZI4bHy8FA
	e7eiAr/P+bEAn8c/6Kc3bwi3jeBDfX5wxc0D+jzI6bTpOuArExkk76LzV
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043939c88.25.1792717596465;
        Thu, 22 Oct 2026 18:06:36 -0700 (PDT)
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043913c88.25.1792717595831;
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1877551c88.14.2026.10.22.18.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Message-ID: <7a593e23-3f35-443d-9ae7-2ebc031d41c7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:06:34 -0700
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
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
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
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
 <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1of2PaulUa8KaNhLCnoh9XjccmDBKJ9K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX4DVda1wMoiAe
 RnFS1JW/6wmVuH9KM7Jh2mYx20St51h/gVJJxuCgfD3Pz1Y3bccnZTshFPmphYXnHlt4TDNhN1X
 7zLelpzGlBmb/aZD3GAvifSMAfIRuaA=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adab31d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VgxvMbUO6sPQWDWUjzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX9vsut1kPj9SV
 NftNTZjfti5pWy4jOiU0u8X4ILQuecdRSkPwYuCPo2zbgUBhT0o2F0O0mNFMHq0zd0Rg6RXMw2D
 KjZYVIfi2tWfpIxNrqzc9GLrrXwstZwKnlxEtg+n3DmJOvhCubynocaL5sb5TmS2y7M9HaU8vQU
 yYoXHdYKr52rnZuX/IsYFcxv830lw7gNGRTIFlYg0KxO52xM512mqSdLrxtVkQQOG6kxKGO1wnz
 87QJ2Fsgrw31YsWzfbEzBfZjmoyT0R5x8Z4qpsFVKv/kYvURbVfUf10Lqd9o5itUlPbDJnBtDXL
 4eXncOL1+7kWghj4uYIiXCeCH07wBL1AZCfGbD1s2cP+t7KjiYrXa4TVsyn5vUwAVxJO/RWtqxX
 ln5hQcCm94EeJIN+4dwm1TPhaed4GH9n7OIxlTUJkNIfK8PEBlsrujk44bcTD5eDLrgaVinhPSS
 dQxBJkVA4aZbFBVk+qQ==
X-Proofpoint-ORIG-GUID: 1of2PaulUa8KaNhLCnoh9XjccmDBKJ9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230004

Thanks Bryan,

I align with your thought process. We don't need
- lane_positions
- lane_polarities

I will add symbol_rate and fill in the data appropriately.

Best Regards,
Anusha

On 10/19/2026 4:24 AM, Bryan O'Donoghue wrote:
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>> +    unsigned int        lanes;
>>>
>>> This statement and how you go about using the data aren't consistent.
>>
>> Re-reading this.
>>
>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>> is a multiple of trios - always three - does it imply that the first
>> three entries in data-lanes == the first trio ?
>>
>> Presumably.
>>
>> That would work too.
>>
>> data-lanes = <4 5 6 1 2 3>;
>>
>> =>
>>
>> trios = 2
>>
>> =>
>>
>> data_lanes[4, 5, 6, 1, 2, 3];
>>
>> trio[0]:lanes == [4, 5, 6];
>> trio[1]:lanes == [1, 2, 3];
>>
>> Probably "trios" instead of "lanes" makes more sense here and the driver
>> just always validates that count(data_lanes) % 3 is always false.
>>
>> ---
>> bod
> 
> I'm going to argue with myself.
> 
> data-lanes = <1>
> 
> =>
> 
> lanes = 1; // not trios no need to introduce a new term
> 
> =>
> 
> three pads on the Soc
> 
> =>
> 
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
> 
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
> 
> =>
> 
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
> 
> Remove:
> 
> - lane_positions
> - lane_polarities
> 
> Since at least for this series, they won't be needed.
> 
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
> 
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
> 
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
> 
> Perhaps drop unless/until someone can show a need for them.
> 
> Excellent bod, agree with you now.
> 
> ---
> bod



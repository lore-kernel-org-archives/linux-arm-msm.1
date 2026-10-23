Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715970;
	b=ellkeY/rmAGaqlMbJjq1y8Ud/nPU8wQscZR66vS+byIQAEFgBkZHA04k0rbLxmc7TYPk
	 Gn4oB9MCkP6HLTyQmo8OCTqGD2d6du4AVP4FwNJqFm7dNNDOMnmB/hFL05V1bPGBK6n3j
	 6piKspRoex1wTAus2VI0z0frVBDUC+TxbTsPvNklmIUg7+aPScFwqd5nF8RmuhzNCaSJK
	 lSXOGAbO5ICFxVIb5xqnci3nYZHZISi6H9T5Tsz04+qiKJtT8eSgPLyKIli9PJbt3KNlU
	 y3rX4dH5iudUnVx3pzd/TCYeildVRJ88rG4RvYKYJ8jdApX9k4KfVteW9eafP+AUZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
	b=CcOZK4znjLdx1UGaeFcIv3VSWxRDmz9UsITwyovVt/Gwh3qFkbDDuG4rJQWQV4Sk6H13
	 lpbD7f7FElhjerFsQ2hBW6utCvhGLT5sdXsDif+WRMaaOQNRsBcx3XFoWe144OlPSKazS
	 Jd6FKLR+s0LUR69arybUAmtjNwEzcPKCGo0RCKooxIDtTcg+4zONHnTABsSk3Xjklc5MY
	 ACMZ1ZjSNAj9f5BJemeQt2du5+M0jcni9gxbDDjPJBzEwdmWRcn1LQskiYGuJTR9ohzrh
	 QbLPZQdDvYcJs6R08TAMllOvRwOph+ZAGeYHzOWpjdjhnwYJ+NJg594ECnsciEmHXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mpT76HSW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNUyCMFC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE60606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mpT76HSW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNUyCMFC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMF3Yn394076
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=; b=mpT76HSWOTccoYwd
	cWDIYcLt612dCn+7YSprQ1P6L6p9IKEURGiENAPpAV7QxXyapgu1EZmZPPVhYvN6
	2PKQIkNe0I9xsfTOnhPP+DFyCvo8Avct+uFzL3nuYxaFn/EvGtrhoT9PA2xn9cJ/
	8zatABrIFqQCZqVb22TVssyXpauAP44+nh9TqBc4+tPYCdMsoL97upYC30PEE9h8
	Ne5hLDe4B+DHLTspxK6GQVEV315onVUNE5OdkgPaEGhHHRUImZySB69ZcpDPuCQn
	GN9IESREjDyOP+oVyMw5Bn5oWs1Wx04BsBsMua5AzGzttME0y28G2vz5pr3y1fYf
	RMK5ug==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmts5hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:39:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso1066196eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792715958; x=1793320758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
        b=jNUyCMFCK0Cr58JWnDOYJl4CZquc8AVfkFAd8GEyKzethHc4FvbqofEjjoM5XcBAS2
         yTrMFZTRHCg3qcb1BUxLrtoC4cZ+OHUnVUMfLOe1a95AOV7MmmTcNdZhOo5RgyzOBWHY
         e1MV+67OLL8SjCxUGXPjkbO0EyalHmDTNlhmWL8g5T1Pi8xmKwYldcSN0a3CnzzvYGbG
         qNp4HTOWGoavXEwTM+uT9QfOdoC1+9/eAfLUTyDmDXmxj3GnSoMBUcu0iVPwH0Z9Ws+t
         Qmnw3Sr+U9jhcG6bLdq9wnJrn3pERvLLuz6TOdEcyFL+QXxoy7FvS5n4BNH18iiUsgKZ
         bliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715958; x=1793320758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
        b=FujQhl6MpBlsTt2CXQrym8sk/CsseZHoX6b2KezeScqiW1VcuaxvrLk7unJVDOIGVx
         pwxQqZPiPsCelAdYRdUg2Z7rUhseZKSvySItrxyNvIY27jlMihS2OCPKOBuSckGnVPZN
         B5684aSYduhooDsb8gKOb36jI4N3O9nfTBc2zYgNoyAvu+Xa/8z8iyingl3d3JK77gYy
         Hiv4ffAyxOp2BoK3LJUiqPVC6czJkh2p5IYFc2FsanyX/MfJYDQNsUtCA6Hdy6AK+rd8
         PHX1TKCdF64Yysys3cuVEaR73R4CKm3Iwd3SfS5twEn4Oja7nK8Bn7vtS+Y2qfq0XAuD
         KI7g==
X-Forwarded-Encrypted: i=1; AKwUvBxVHV5PcDS386BjIhBCqr2iultvst4GEEfaCoGneP4lhJ79zqtRs6gDI90JCIwk8CrUIqmIS7RyQ5JSPZg+@vger.kernel.org
X-Gm-Message-State: AFq9FYLP+8OGsHsIb4SyVr33BNouD4LOFgT5va/u+KHG/sY/uWFesqBp
	PTOKlMR3krMcHAVpKT6ItBfdOUup4x2UM+UWVKWV7AL1M+mITiw87bMJ8Dtol1OfnaYBmU5g4nC
	Qfj8tDsnLb/N4GwwIYMK8RuvogBqItsn0tetSuePDOuwMZxTEsY1R9CgK3QgWEuk2PvWy
X-Gm-Gg: AYBFou1U3k/xU9v7bsyEwH7a1tAxJ+9zK93Oo6JdT4rooopoAhCbT3EsjaTwUO+kFCf
	PJWhfefqO97ePC/749XihOkwA3MrmrGts1+OXxNjm/rw73szBC9NGjKXZPS4fCSDYssF1p+Om8V
	VeUVj1zIdPIUm1tm5xfNuENdGfOYd/QJ1R87hoYWDFO4wEQ1d669o9k8b0DzWizCIx46t7ZX9WY
	LWuaC1g3/4UQfoPIXlN0Ih9PnSdY6aZI0lSsC1wafFE9f38zZjLFM9J4MdIs+6ebXH6yv8QWqV4
	FFxUOOaCSQpXgiZW/TZnK9PESIhr+ahvI0py1BgmTHDdMwVfqIWUiNy/Q1Jd8b0YqbSkGFnWi73
	q0GaXZ7bqAkDn2WHtV+taZlCDYXOe4q5s4bvqTutl1XSs9aiPLdCUdsu4vQ==
X-Received: by 2002:a05:7300:8810:b0:367:174d:c8d4 with SMTP id 5a478bee46e88-369d971f2camr945854eec.7.1792715958044;
        Thu, 22 Oct 2026 17:39:18 -0700 (PDT)
X-Received: by 2002:a05:7300:8810:b0:367:174d:c8d4 with SMTP id 5a478bee46e88-369d971f2camr945827eec.7.1792715957498;
        Thu, 22 Oct 2026 17:39:17 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9dac9casm1449378eec.15.2026.10.22.17.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:39:17 -0700 (PDT)
Message-ID: <cf9fa6f4-757d-4163-bdcf-7416b9c999bf@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:39:14 -0700
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gjorgji.rosikopulos@oss.qualcomm.com, jigarkumar.zala@oss.qualcomm.com,
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
 <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adaacb6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=rkvrVZJLu5XtR-8f-ggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -DR4zOW8072o4v2iaCwQNB9UDQWniHUU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX8EKpNZkzYn9d
 OhI5PFt8FfCRhIzCYEly3ra65xb673++5VCiaHp/Mv3Vo7rV3ifWCpHxMqExr1wwND8ZS4kDigW
 Nkq1ond39WrvM2pDdpcr1t/9x1E0MmZczOf3TkS6ClMGLVbBcNH3chnKxSjdtO/cQvSEXsvV1Qv
 AZtHgbSTzRJYQYGUnKRgDtMjVDXO7SjJPwG6q11JJh25vVHBwBnj1i4S/TqQB15L5eQPTk4XXyP
 SXYXGO/0lZ6x1qJ5wLi1ObuWNjWKfVLkOeUuhlup4n9L5YzALzpMpGACkR21ZdUXM1o+rhFT4ze
 FMwU33thaVR2qARTugMoY2tLN/Z+a6GPWDLVstYHG1gwn2x+D6U0OVn4CbhjV6EVVi+wiS1zBjG
 C4TotUq9wx1YyjvTS/YwAppgs3GGwpMFOcgYWNHIpfUp4AmuI1qtIzkRGoQbr9OYWWyq8cyOjam
 JV2IFHD6XltYemWVGhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX6YIX+84zw3UF
 FMvSdN1AN18JqumqN3TIKVE1lDLq2WOI579QlFu9ceJryXK3ejE4Fo9hF1/kbLCXKCkInVkXQxj
 oRe3mwvlbSqsU8JuT/DjWVIFv6UQs/c=
X-Proofpoint-ORIG-GUID: -DR4zOW8072o4v2iaCwQNB9UDQWniHUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230001

On 10/19/2026 7:15 AM, Loic Poulain wrote:
> On Mon, Oct 19, 2026 at 1:24 PM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>>> +    unsigned int        lanes;
>>>>
>>>> This statement and how you go about using the data aren't consistent.
>>>
>>> Re-reading this.
>>>
>>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>>> is a multiple of trios - always three - does it imply that the first
>>> three entries in data-lanes == the first trio ?
>>>
>>> Presumably.
>>>
>>> That would work too.
>>>
>>> data-lanes = <4 5 6 1 2 3>;
>>>
>>> =>
>>>
>>> trios = 2
>>>
>>> =>
>>>
>>> data_lanes[4, 5, 6, 1, 2, 3];
>>>
>>> trio[0]:lanes == [4, 5, 6];
>>> trio[1]:lanes == [1, 2, 3];
>>>
>>> Probably "trios" instead of "lanes" makes more sense here and the driver
>>> just always validates that count(data_lanes) % 3 is always false.
>>>
>>> ---
>>> bod
>>
>> I'm going to argue with myself.
>>
>> data-lanes = <1>
>>
>> =>
>>
>> lanes = 1; // not trios no need to introduce a new term
> 
> I earlier recommended using "trios" in the other C-PHY series to be
> more accurate and emphasize the distinction from D-PHY's (two-wire
> lanes), and because it is the terminology commonly used in the C-PHY
> specification. That said, I'm fine with either term, but yes, we
> should be consistent and avoid mixing "lanes" and "trios" within the
> same structure.
> 
Completely agree. I will be using data_lanes to clear ambiguity.>>
>> =>
>>
>> three pads on the Soc
>>
>> =>
>>
>> The question is - is data_lanes required for the CPHY opts struct ? For
>> the qcom CAMSS case the answer ~ always no - we will be attaching a
>> sensor and will read-back the positions from that endpoint.
>>
>> It is conceivable that other systems may want to pass data-lanes down to
>> the driver because they won't have a media-graph but, I'd say we should
>> arbitrate that then - leave it up to someone who needs the fields to add
>> them.
>>
>> =>
>>
>> lanes // the CSID and PHY should agree
>> symbol_rate // so both the CSID and phy agree on symbols per second
>>
>> Remove:
>>
>> - lane_positions
>> - lane_polarities
>>
>> Since at least for this series, they won't be needed.
>>
>> The CSID still needs to know the number of lanes and how many symbols so
>> that it can calculate bandwidth so .... lets just include the data we
>> know we need.
>>
>> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
>> lane_polarities.
>>
>> I've no objection to the low-level timing variables myself but OTOH we
>> don't require them at this point in time.
>>
>> Perhaps drop unless/until someone can show a need for them.
>>
>> Excellent bod, agree with you now.
>>
>> ---
>> bod


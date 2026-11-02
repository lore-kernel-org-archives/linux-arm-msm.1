Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623623;
	b=2JeWAEMKljS27B7OU3TFr0a+UfHTSczDne/7fFk5sE0W4nt7ngRYbALZTdb2TFCoS8fo
	 JYt4A/AHATcHEUJxjSa0UFQaK+F6LLLNf1RkWC9hyUhigIxaX+J+njYUb2+6svd+azu+v
	 AgFI2ZJI188soda8CIrPrYqzk3Bbl4aPYtDyL2hzDy3AprZs+lq4/f3ykeIhLhemPbOOC
	 3tBUOMU/h7uIG93mM6Fs2G23C6DYEU486hYjNTmlLnjq/4+v+siaTYdgB+afjHvWjKvwJ
	 rEAMt07dL8EdDath4H5y/rgt4JftF6GQEoYYYUwOliuX5blwDXqmQotNCCDu0E3+qzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
	b=JGpZdHhkH/3egTRHFPG75VjRhfIMimJnpxHzbAX2VDT8yZQaQ/cT05svwKB2pbRHQrCl
	 jGabWGA4dj8guchODfaVlYMwdBltLpA+lAWB8l7IorrWp8EDNZOAVPj1wzuq12edMz/mk
	 uswtKQ9UJjNMpfnK68wvaEztBgFZGVyDBw6T1fN7JI2rgSy3Dsg0ar0Tq2p0JXdS8YTFP
	 YQaQW/mHLM4EwOn98Hus4tov01xqVyQ3YKN9XtRzt7ZJFTqRXAqmMZzs3OtR3hFNCAPlL
	 MroMWc/8Y6hZsXWhvQoihWaWw+6t9SAeif6NIjp0qcFx7Im4VbKxMmjxpRZ6n4xfm3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C41606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xoh3402433
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=; b=cnzmRqkZOtbkKeM/
	GYWcgwpVIqDdqsQp88AO8H61KrXRo08UJjICqFbhm/trFV+hgXGHkRWyeg/heM/u
	5omLInZrkBB7YGGnHVC48MmnlTtGUzI8UeRIqhtsrKuPd558WuUGOhumnXPN68Fu
	4YhF4kRjnpLKlPtHcHquSkGOdRppWlXXYrV/v7+rVGU3JF/d7avydvADMAqQlCJd
	siR7Nn4Z3Hj0odovVhMHC7qlBESugrHOkLF3XFVCjaSL/1b60reim3mKXWoQio8A
	N2IPEv/OI6Za9y7cvY1xiOki9zXqopPJeQhAgghsryaEsFlDusOq/BmIg+6Z6zTd
	DWFJcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe94yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso7953091cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623621; x=1794228421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=ao0AYPIHgnPm801+52YtfreEZc8KcuKBrXdt8ArBI8AE0CoGPAkdKmMeqDs1nFkFyo
         XY2YtxiA5ByshLNWOkV3lKNVb+2x/s2S3svtZuT4G8dVLFtxIX5lQSibBrtPYGYqxbbh
         BDR0yO5gpwu6MbR+gN73f3VolaKUXdS1MLdBiMo6JOfvikQ6JC5+5L42lkKXr+zpcInz
         IVpJZDFXw1JzKypXZRuNEymcfNF1oI7QNot2+IN9cEmvoQvHAgwuUPQFPJAgc7WtnJ/v
         OCed/DNyIWu7AI/As0Q6aJbHz/ZMA1wSvuCD0v2opmvrCLoEQP9EjNV2CIcKUX/zLmqs
         exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623621; x=1794228421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=hvV53/NryLNIzGiMGAlR9gH4gBTDR1jLEhYwJxM0BbY+/bEscMVzvWCVtEF9TZSlF5
         CB34MHu4ze/loa2oHHQ4NCEXu5BmFHB7Tmy5p9rCfPJrOsxb75IBXEKH2+JGVBg6RRCx
         rpdfK5w63EFa59ZyqtZQXHw5xFGlbqAfOIfGoVpb8mgLvDLAQ5lo2JwavYDeOSB7Oiqa
         gIXnb55GY9hC8vKD+pSkMtghCbS8Wo/Qv79WHsCSdkPuHdBZgPZViCY+fgrNSiJEIjo9
         VeNQ24j3U/m+DAsmh+5BRVlOu6Lqrc4RyoFV/R7tGn2C9z6tqgf3KsndPHpaWyrg4iSN
         jutg==
X-Forwarded-Encrypted: i=1; AKwUvBzNYf+jMSrRSaNwpvKf2qtnVmxBDGtFhbCZuHudWRCOrmw8nQ/DBJTkQzUqbT5IU/ZfMxGsS9VpmNfaxrvP@vger.kernel.org
X-Gm-Message-State: AFq9FYKGuqNQBCpnhAmJbQkP4cH7miAahcRPCUjkY5IOf5v2aIkf6Vd5
	pr9eRaQnLFGaRP34+EFs/dx1Mjq0X3ADfTJ0tZiVLfri+vIKf8HTdvHZy97e8itQzvXoUywRnGx
	rgNeBewqR0BaZKVMz3unIkbin9Gxwko6R1TcAzZ8qd/E68o6Z2Swuxn7LHmmFDFnNlcDv
X-Gm-Gg: AYBFou3GbHIRVNkUFPI0HSMmp74sHrUhw4f7TsLrxRwIo1E/NSCUGLRGnm+vzS2x/pR
	QCQao4/fxbwhQ7MyLvo+cT6znofOpToQ5+cUQmp5/wHvG0FWb35nlJYzJWXFM2xKOOy2Lotzrgv
	8iEOFqcGfdRgPGHOk/Cu1qp0a72WXjg+1Y5DA+CnSTt78/EHrVK0lxTnH+BnU9Cs72cf+fvJP62
	bZ6AFQAEJ0fp1m3O3RrSzN+9m535+G6cuBLtC2c09vjNMzgbV9DCgjQKrx0VNWaoQlaoSUfMuwP
	JjDTuB1rr031pn+ldJHk9JlEVnb4GW5ou+wgh9wDv80Jn1okOE/CdpDwhvpXlQj5p9yX683K8LO
	1R/ZCl+92nQZzXM/F15dnDS3lnwPv2UVLVWtow9RTx6oOIWLoQmvTo4aN47zDaI6YlFNw+YM=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632534885a.1.1793623620875;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632529985a.1.1793623620444;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3452213a12.26.2026.11.02.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:46:59 -0800 (PST)
Message-ID: <30265695-c3a7-4440-a0ff-7fd80fc721e3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:46:55 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88645 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqUuZ-GaD-BuahIUHWQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX6MfJCy4aMt9J
 cH9aqRpE9hrKIJybcjuQxQevhCNsN5marvm3p/amHUM1V866BnZuxLx1hBZ/TRrBu3D80gJh8x1
 /hTed2xCJ4KAN8V3vPSz3mQDGYWmp4VyLrYMERxg8CGojrHT688bHGS0YOkj9ojxjam7tKrfLs8
 eSyZoe/WytHA5QGTxdCU4QZc5ukkF4WaNbflBJEorBdAfHgDzqSHf4fyvAyx7b0YducETeDXOgo
 tanxYWTLdjGC69xolSl0aFY/cRG0IrcDpVC9p8WkMb0UbYWPChyRilR32LfoQ+6OWwyOpcQnUle
 rcpw0Wp78obviQUAft7DfVUirtGeOpeCjxr8fIcBmIvaInD3smlRlrHV3LqwCfZYbNmyDji620N
 LujBCgO5uT1R0yuROvEIMpQc/zMtTtSDP2CGpWpSKTAAEfrpyjJyrvAzuwuH9TJxFZtQiLDQutH
 AReOZVGBVGp4inbn59g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX864+VUW3ziEz
 tjaA/aPg9s8AyOfMOV0wu6rTiLegkY3Puq0t2c2JB4CDJ2ish0sxVo/Qz88Id3othiAqvTiPIPr
 E0QWbvrPehXoUC9LAJ60wCUISYlHXhE=
X-Proofpoint-ORIG-GUID: QR_vr4YRmp_BH_BA3mhASLjOCbqanw7s
X-Proofpoint-GUID: QR_vr4YRmp_BH_BA3mhASLjOCbqanw7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 3:41 PM, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

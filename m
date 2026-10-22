Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658919;
	b=D+Mcvrujs7sGIUCBsqXkuXjJU6QDy26JxEDe91H5eyNOgbqWBq4a9Zzq6OZZSGOnZSLx
	 tdSrxRu0Ldujvqaap5dNmVsK8UMUjEn56rgCkN/0ddtI33jUXTTyvLUEw3/fJRAe0wGD1
	 dLK3cGIZyj8gpxJw7HyolSRVjTj194dn21cvi8/O0Q/uD3PUHMwXuyhOK+mHXfWRmV3H+
	 MZePOjx7WlB//4g2ZcvF1/joi9N6zkmOUVGhgMWWer7BUnriXvZd7XCvHvbgBF0tIZXRk
	 KOBtsIYrgAIxxgin7EMhl7jjRyntZoshJljnGSzIoS2CAIFSJS3b06m/mrs/7Y0WN+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
	b=ROcMmfUnDHCt7lvGXVFI7340ji26Uu+RskO/fGx/PIAWxYfPbSBduz1BFaAUZnDmexqX
	 0Zk7s1Z0QIIQ8Jhbhlgn21rwjBynLswTwgytvsBdoTRQFghwhZEcl1kAM4RVP9DGlwZOu
	 Sk4sBVNXWFWwWTCltlBdWFGA0BGeO+xkK8IIUAnGxYRLkU370HKOGcq+Kaz21XBJboVns
	 b/xn6fskh+UwFCLfZuT558aM6CuWSXF4rauBPsh5DsvYI5lwF3+z+HO2PT6yEjT6nN+KM
	 zZ3/ZdLnlfVBdbchLHZYaPD+qhjGwL4xc4wr3hBx81ymWXy2RsgJOBkNBHUT0sTkDVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p6/nqHTy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/8wCf3b";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81178606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81178606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/nqHTy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/8wCf3b
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8QJaN3216570
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=; b=p6/nqHTyTSge8Dta
	ZRaXq8pxp3zcrMGT5X0QOnFUwKpm3biAb35EU1p4K9nnD8ZZ05tHDk+wPVtawE8N
	/raXYwJZ/fes3xVKZBitY+i+WgbQ1+zyBL3dbYKX59sj7J9ahCFuHW8pvOnWPR5Q
	9E1LEts4dL3ueW1dOWSs3vgDUm5k3s/0k+F+5XPfsWgqyE7Pc5JYzNHnMrP6hcI5
	5ldG/ndh5SGr05Ov6cpVe9f/GuZYnenDcR51EO0UBsy+QylwachadI4KFXQhSnwd
	6by8V6HYYjCLyC1EWivrhp1E0TDUqn9bQz25EnpI1XRWEDEwC9SY25M8UmrwshHA
	mE83iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asfng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so46107885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658912; x=1793263712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=Z/8wCf3bwruwQec6NVDnaT39u1qyAY3MybAijFbmGRMsJXfMKcP1uvtKyIs6EiPJOi
         D7Rd0U4T8A7nWlnshR/A0wAizoy7hwI9v5PXPGhqykqusB9iDdQNFKQ+MNiC9lWnXCqn
         6sZWERDEPsBMhyBX6EbwVcNbrUkILC/5gsyVWw9PGAyVdRjarhcdTRnk+Sp293yVpJze
         Hpjaa+MUbfmCGjTYlYDpN5GLH61gF1esBFL+mTbLFvz6iRrFSi2l5ff1DdWn4gJ/qJMf
         YeNdIOFjIU1B0QSRSLZCcVXP3GkrLNVzWTEYhhehfV6uodjvXU9gUduJDvei4LhL2D9c
         SYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658912; x=1793263712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=QBarmaBQnXlMpG3Jv2A2RujVXmx7wcQrnIIBZ50Kdg9QD9CZbt7GYAfD1MZtY0oDId
         9wHHvYRwyrXeVN9WRxhUOFh93dL4nM4BxTDPkuQOiTVMxslM5F10gi9AyrxBWmjIe9Zz
         pWXxVO3rso80cQMvKOAD+5FjncCkGM0XJbvs8vQ/Gr6BSL2LFof4PUq7YCKzRbJwS+E/
         7eIdMPAOBLb40ng5OTaEAOB5arMy4Lr0ix1RdXl4xngrZFAF8OpscEDG0NPX9T+lzNbR
         hfRzc26M8Am6s8Hq7GDIMtNOQjmlklB5rV7/FhlqZfO3MewiJr0H73xVgRcJZxA0wLDR
         N2tg==
X-Gm-Message-State: AFq9FYKKL31WhIjaR5g8fYr86Fol5tfkygRD30R8A7b+xLEzFruI6gh3
	mqjChuOOLHwwXIU3iec/PPnK072CCv0ZyHepWgLslelDaVsV9cPx2+p170o+Q6rF9amDT1cAlCL
	UnDyI7/KSR6MNacz3cAlusD9+AVfWiXVR+XIoWVSC+cnQmKEd85T30+mb5ZKsmDT1b5Jn
X-Gm-Gg: AYBFou0lMiJehHiiNJdTAW/FzITef3Av4NWFE8DF/rLdCExONWBv397HYJ0wDR+zQKU
	J3d8iOWMoCDnJAX1BJYgyCMCfb9GpRh+8dDf6gNT9l2JfTyvd/YnmzL5ruyBHTrNklzYA5bi+YL
	79W0Ry3OCFg5XPMV+v7RmTHKCxWz+f7DjoMi+g3egcCp3hgQCgxOEiQM2LiG0UWLX6FPMtsrg3Q
	6eV5n/EM/Bwyv0tyb0nmQvJU8i7uvgV0fmW9iUT97yVXyvZui5WCap5d96d43KGsBIXKkyOX77R
	8LFfDLxEYKfK8nukshKsedYEYr/9GY/eQ13PuqxKnxe0s+JswWl96C/bA0qYrAUwQkMck1bB1Vv
	mLDJ9dhWasGMfmT4Oaesn3Q==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006940185a.6.1792658911835;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006937785a.6.1792658911385;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1ef356sm83697866b.9.2026.10.22.01.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:48:30 -0700 (PDT)
Message-ID: <b27add9e-9398-422e-b7c8-de11afebca4d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:48:27 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
 <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX6Gr98kBsezH1
 KEAS8yQCt7CffYYpgVsvutj41mqvFL8EJQooMiZUTrUm2+18fHUmCHzzsf7oQkgnXJXnEW7kfPu
 0Fw7hezHXAXqw06htJB0aPJ0orQgerAlq7l/y3nppdKcJRJWccRAAViqe10GK5nQJ4EY95zzJhH
 +2matgwSaSGssBWyHT7QWII7IEvYvd5aYj7It/aFkgMsAB7dMft3cllYLhlOb/U4phWAD4pOLWN
 n9eycOgWPqFqEXlgxLfVPBeYVPM+O5SbnaIWk217E7ljvO8KoUymANHhzJcyJVcGCaqtXS3eeYU
 TlsteBNEKb4yiFsbMQSvIzheIyoWD0DR3qJCBlKAF7QC+MJVJwy3+dWcqLr0lfPBhjHsGb52tgQ
 bXgk0isnBVoe8OiS3eR1EY4PTN+D7o51rJ+uT84tcOdo9bixw4NvK0MYhhLop7AYXP4Jq3+PEkJ
 FCQNWrlZSBhlq/om6PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX7lKWT6ISsb9I
 dq5gAe2FOTyyqcTtYkFx1QQq7PeI4GvewlKvAHd7QNbExWRvcO9Wo9llhp/T7yVl54BXIug2ob8
 ZIsUG+SuUWp92WBhSaUmIH/7E7ZkUjk=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9cde0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=XdfhtzbLNWwZdSUk0-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -7nOoCO15Dg0-6sX0oTJaIDbeUuNN0V7
X-Proofpoint-ORIG-GUID: -7nOoCO15Dg0-6sX0oTJaIDbeUuNN0V7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220034

On 10/21/26 7:16 AM, Vishnu Santhosh wrote:
> 
> On 15-10-2026 02:52 pm, Konrad Dybcio wrote:
>> On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
>>> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
>>> to provide modem data channels on Shikra.
>>>
>>> Reserve a 256 KiB restricted DMA pool and reference it from both the
>>> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
>>> can grant the modem access to the complete pool before requesting the DMA
>>> channels.
>> [...]
>>
>>> +    smsm {
>>> +        compatible = "qcom,smsm";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        mboxes = <0>, <&apcs_glb 13>;
>> Why is there a "null" reference?
> 
> Each mboxes entry is the outgoing doorbell for the SMSM host with the
> same index. Index 0 is the apps processor itself (apps@0), which has no
> doorbell, so <0> keeps the modem doorbell at index 1. msm8916.dtsi uses
> the same layout.

Got it, thanks

Konrad

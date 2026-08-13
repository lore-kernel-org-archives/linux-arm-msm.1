Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31133D8901
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599869; cv=none; b=ssfARwfRFCw90bYrqmhnvFJn8NExixseOOBCy/miWPuPiWezcv1WqqFh12ifABIx6z5WiCqhY4JCOWLQmF+UBA63ESaJXU4yPlY4hgF2TK56xnYmuu9Yk0uhHofbbVjuV2mhfKKqD3zu1elQCmvJCl0OCwdffItZcXFC6Wuf3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599869; c=relaxed/simple;
	bh=g6oJg/Wix5fascMvaALiT0Zn7yvaBsHIpgvDAU+lOaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuLIu6gOLFMERm95qq+nuNrjDBwlqGfetPWa5A2c5y1LLDUj6rVxkYygoIzsECIiNoSWpoipr+Yzr4wa9SE5xiqlpbQaDVvqlUKWzjhX2fG1kwbB6pLF7570y00fkDvKfqxywpOuR0PKCDyTiJTh1RE1RUXlc98SsOchm3zb7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=em/HfRHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXHRylJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="em/HfRHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXHRylJY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g8gT1530189
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=; b=em/HfRHYYzOUT71/
	mII2sG+G+jMJV+B4nPQV+6/aOIUMpPlnAkhbi1EHZ94zHAb2caWQcyuGVwIfoxgA
	siNeM7F1Lzx04L3NFNnxaoZ5O7VnmUgefZu+Tz+3CpvblpMxnW7Fl6W5L5pdqPeH
	NASzGtyCvris5nBvSh5/lLBzTwHr3Kprb/ASZFgyZxIqEcct8dwjgIm/lqBFL08B
	DTVOyN3k/Q2nAa0PGVOUW+dEqdlpAIqnY7eVPnaRiUNqYA142q12qVs12pzh2sVy
	Ok9t8EKiA7iE40U4zldGBcwvVrG8mqc8j6wV6HqpVasflzjEpdY5jjJvwUnhegB/
	sl8/xg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hrteq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:44:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso6226285ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786599866; x=1787204666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=;
        b=gXHRylJYFzhm97ZF4Y07ynsxYzB4iySFCfbSfqtXKgJI9aREjtQwhFScg9R9E+Jlvy
         vMLkMwVwOjYx9lkaiOSTUuHLKvUo+/+oFgeMl1XIu7tp0YtC2NpvPuHiV2PMXZTzMrRn
         JqS7qNKs60+lQwsgQx2K5RU41kWiqP5IwZ306weAH3CMHSPfEikCEGyecSrv2+CUZHu/
         PImMQc9XJ5C6T/O6lC7Y3ocwa0dGjXjRcfq7xJFC5hhwSLhvqxoqe65hlhp1M7IJkNti
         j2BlZRQ2vza3D6w9uBeNWJSD6KXs6wONMjyGmc4Ax8ZoE0/Ux+5tA2dQYslu6nywDFu0
         3ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599866; x=1787204666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cj98xFQ+WF1yTj5Go1S0ghUi9J/j7bnJYnZpCsgWlbQ=;
        b=U+ktdM3gd24inGP1aq9TmlhAv8CdgdzV3yo5BmDmwZQYrJTZZ1EIo1ba27h9lPq2iM
         wmH4l/SQSFzpwpS6XwwtUVKOWdQwkhNewbvyZ8WvmXTfSxZmyTjL3i1JTcjunjnS5akK
         WHg6DvAPCe3X1FUQYhFcE5niXNaTZr6EqFre81xAdMcatfsKJR1KU/04yRijVKj2cfix
         SKNGvMo/LWc066iIQOyfY3SS2rAlo7Lgwj7je7ppr8y2eydL/RuB//SiIG8weN6TM8nY
         EBRo5QfMp7LTqnf0F1kHz2SLLhyIrzIu8oUrDL+Q65Jt60CwfKo5ouxPKGwFOiLIN1Zx
         TDWw==
X-Forwarded-Encrypted: i=1; AHgh+RodOU+sHF7ok/iYoi3cKPSr/fRbsIxtCDdeX8cFno8cPhJlZ9MlD+ABE2naiqJ224Ody0dh0giHi9OMseMO@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVL8kL6N/fx8b9lx/UZ/dFxEkUq9BdSBL2uJclwt366odtS6n
	RCsOlrUhi6fBAiz32A9eWz/uxz/iJ7ixiwWirJoQxTlI8LnPxai0nUE/hTnvZbd1eFIFhs4XlCu
	Tn9K0Ik2qujElTI8NbHvxXfSNbKlo/qDDuVGt1o1OBl1DMFX/vjs8daeS4rhtojloc+lZ
X-Gm-Gg: AR+sD12r5X+cGJOnrFa/c0/5oM2d+ODj7fof1c2Y9RTL02G0VdImKxUe6SRWmQjtfIO
	747EyqlWdl9bI7SwN/4QYuM6I4ZkiRTps9eVi4/js5a2dbTqr/dFopuj2u9y9z8+WVT4R9p6ptI
	P/0Z0UgUDRflcAJ3D3y53oG8ggT1h5HYz0Jy54f3D5JJ2Xhyd9BKrxeHeRDpyDhuh/G7K5FkyNg
	NrORvU/y66Y92tSgRSwx5Tzf4qRTTlw9jPVsWl3Sc2ZYNZqZxtvP+1p5hoSEVw02rReB1c8LUML
	SttebtOtjm5maGpr6aWLJlFpDdCzIf+1ffZLZAOOwODQw2joxe3k7azbLyz35JTcm768+MvKkn+
	N8Ig6zawQyICEPHEkdu1LMmyLBs6FuL3iXIfK1V21TYvamHwfKWvGNaOuErapNUmO4GyvIfMW35
	40IzTdaZbLZLtFDmyb8EYXa6AiSA==
X-Received: by 2002:a17:902:e5c9:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2d37ebc4a76mr36501835ad.20.1786599865993;
        Wed, 12 Aug 2026 22:44:25 -0700 (PDT)
X-Received: by 2002:a17:902:e5c9:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2d37ebc4a76mr36501315ad.20.1786599865289;
        Wed, 12 Aug 2026 22:44:25 -0700 (PDT)
Received: from [10.79.117.11] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c48042fsm4358025ad.55.2026.08.12.22.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 22:44:24 -0700 (PDT)
Message-ID: <c9460884-b09b-4227-9f81-8774259f984c@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 11:14:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers
 dma-coherent
To: Greg Ociepka <greg@ferrisoft.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812154014.123315-1-greg@ferrisoft.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7d59bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=i1Pha25J8sJlEzR877YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfX0wH6NZQxbLwX
 YDy2jccLE5qz5wtcdkM+BktPbtTjNdoDj2qUiOxf/zFBLyDqpC9I3c1HaMsuClFAYvWVdP+llkX
 2GXX5xDMpVK08RDVqgwoeiag6xyiNsq5VQ+xbgCeWf8S28VPO+nAzYoAuKET03o9OeD0q369fro
 xN1VgeYvNjVc3SyF38ycfiOLJnQN2Se3wEjkyVh1en9S6fOqOu6snxblvKWE++BgV4HHA891N+G
 6u1JQTyTlB5oEdDknivEiMMZweLmKqbEuO4pAAsC1xK6r0OQBDnS7CnZfx9wCOSbZb6MpCo8bzl
 0VZqgZO2qVirZGwsZDNnnLU9N6JUI0zzYeNpGgmXloeKNFNZZo7RP5SisNrkeox0J+IkNXWGaab
 mlm2SpsjycnBuQRn1hpr6CLWUgW5CRXrzbFpeaQRA5fNFX2B/8pt3HTK0WoHoIBqu+2fGccfL9Q
 EnnWtV0nusJYGWZFxpw==
X-Proofpoint-GUID: NkGAJeNQ4KIc_pUH-bfHua3cCjfieOti
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfXx3VBNKiGgo22
 1EFl61lXszYpqWWcFumx3KHdtYfcAufkQS3Fr1wfzbfNcBcAXA2CoyjWp/+k1xbfEY+nOrI3SG3
 BTynm/outjnHCD+r8vTxHNW/yi4qxag=
X-Proofpoint-ORIG-GUID: NkGAJeNQ4KIc_pUH-bfHua3cCjfieOti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130037



On 8/12/2026 9:10 PM, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> Follow-up to the clock/power/bandwidth votes patch [2], kept separate
> so the already-reviewed patch stands as is.
> 
> Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
> their devices as before and a 64 MiB write plus two O_DIRECT
> read-backs over USB mass storage produce identical checksums.
> 
> [1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
> [2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> Assisted-by: Claude:fable-5
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

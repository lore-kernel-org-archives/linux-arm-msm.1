Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2923546C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725814; cv=none; b=UWBjj/ABzgH39Ic3RD2X3buiST/OAga6tZda4aAMsGTG5nx3jK7RfEorGGBo5xUt4WteAHmqdq04MvnKzCvHR+3fuLilVHz2c0i9OYjfmnResRWzbUivG6B5YcIV6KU+4JlgYI6k6AWqZ9qNuhv25IOPonASB4TW4+qxINlkvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725814; c=relaxed/simple;
	bh=7MJ5UPF4tQvjhvsGryXA/aiYizT4ABPo0f4jp6C/AQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QisS7YNFmYhiIlETl5gEwaccyKHLwVlfXbw5fjsF8hGH6mhBO0IbGCCAmuQ7le61+L3PX5H4A//yTp9ERojZ447H+doHR7XV28AITeoxs012uVivRGTGboVOHzlvQRLDINde/l7rs8dMN3sfiZIzV7G4bJ5wtk2R9FQrjiHBkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+STcdU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLvTUizn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+STcdU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLvTUizn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1sIj791844
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SH+iOr9VuSSMvrjo/satf2ls
	w9FO1OXQdxI/1IIL5Oc=; b=S+STcdU79qwv0OfY3d5ZM8TO33o4S2OAgCI+6txU
	Ak8kbJxiMW61QI553UlPAQd6Gsi5L1+5m7c04Z7KmxPsMz4jTzGXjrD7yTnyYsK7
	hsMOk+NY9N9g5Q/2zlb9vXFs6Z/GFJChcAfwxFrH/YziFnH1KxopwsIeuZwzYxul
	HWkN/NrlB621W3Gq/yH9STjWs3bpAO2flFlWjjmPE+FlMycLgaOfoPHeKtogNxgt
	2bbJOKGInWxg+J0BbK/+HNO2obgUUEn0XaulcXeP3554dkMPkOfKvbc+xmK/8BPB
	XepngVE1l81cDpJSKVjIDbuvDZYmsZOsD87hPEJE+Mzzbw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn28nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:10:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e806f474so3230865137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725811; x=1785330611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SH+iOr9VuSSMvrjo/satf2lsw9FO1OXQdxI/1IIL5Oc=;
        b=NLvTUiznGjPVkwNHEqKKzoOVecugCDqm6kRfGo2nr/T9J7Yvacx2Xme38NhL6kLi2L
         Uyk2G4iAWxoLQ8b5O2/YzmK7KgQ3owkz4KiLq1wwu18SDMquqUmwx2z2AL6ChBzGH1Vf
         dw5BikNrWawfRBF2pJ/1VD7GCHKgeicEfr/B0Ebt6/NMtvvQbRw8NyCrj45ZVPXPuCFZ
         EZSURF+DC7i3AKegZeUpzCVPGInduZwX5RWYFtAGwQnWAoXcUTBP62eedg5luUuj9sgf
         rg5Zg9nrzNFfK/L7lyvO097PF3nHVrF764B9Xq5iyH9S4EQXAHzNjVI0K4YNiLZmifB8
         vilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725811; x=1785330611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SH+iOr9VuSSMvrjo/satf2lsw9FO1OXQdxI/1IIL5Oc=;
        b=bjVsSUmH4JW0f/Aj5icNzxWwrHVJg9AJ4bfNPWv8EpNiOwyODvE6o6KdtTftdh2b5X
         79j6NgA/JrryzQ4U5TMf1ztzj0W6ld5kJejKX5QTdIHkVgEL8gzMayOcLCym0MfxYdCe
         DdReBPvM4CUWNai73JUWhAACzXhS2q6jnDyyaAQiO7jxGFIh7OpRq8ILWzNL+kHcpu1O
         KyitPKAhb9wy5MK45nha4XT0/EUE+pH7cFcU/ACCUVMC6WR2nd7NuoWDcRYwM6ebS+lx
         kqABwSA+iZ42Vfxx1k9CtWzE2C8TZg24xhtxonrL5+OeMGlN5XEU80hbd73X7nzdd/rD
         knGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh4kWNnnPIXrLDhiZuzuYSYUBR4N4JsRLUTweaJCLkjT3Hqq6MM4tqFM5H8N+RW9KvRhNuQYQbXMmTClME@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJAbXfZ1+2/IwFb2/wZQHqCdxSixyiIZdnGz0vmy7/K6iplhq
	XRHIb00bt7YSIuqHYN7S7ECZi+ndzXc57k61ilJUpm/OP/CpAxPMOjCpV+wJEJ/5BU6GLx4Ltlm
	BB5s+aJ1t/r4b9hptXxndDiokE3CLs8KAPbxuu4Dsk45IC8zfnisDfIGPnFI29/AC15JM
X-Gm-Gg: AR+sD13eCgjEhk0+DT4Ho7M3hjGtguZ/LDo+HpeGTMamzYmlwW9OnaNbtlnEtcszxTS
	hW8v9Zvjd7rW7uNElo9D78X0xwz9e1NQ5lagjSPH/itbZXJmNBgAXtO+wYvHS5eL9W+253692ir
	OIwMelJhQL6v1ChuhntAtv41iY11mGk6FZ1rGiVujJ23DTYk5+VYKMNANQsnQH93PWho8dQeCKl
	Fjbj4h2mEKdsBD9rUmcgkFLctOt7veIRl4W/4281Y3CKcx0qJgkOYURInaepnKn3xJSxR5kyFfn
	Lo/Wzh2A9CCjsE33D6nELvnzBaZXOTttMYSzP3JMA0r/4xIvD5/HPOjnGqDZ22qTmpGu4SjZfdw
	w2BgUOWWt5/L6D0olSCYJyAbzu4n29G4GudiOt6ijmBcVafehf1VSlyw9unq9VaVZon5+FVg4h9
	XsBaUFOR7sOd81gg==
X-Received: by 2002:a05:6102:418f:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-7475374cd1dmr7128420137.26.1784725810655;
        Wed, 22 Jul 2026 06:10:10 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-7475374cd1dmr7128398137.26.1784725810192;
        Wed, 22 Jul 2026 06:10:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm4249741fa.41.2026.07.22.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:10:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:10:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <sypbfhwfovwwwg4hx6loyqocq5h56vg3v37iklvj5h4bdxnov7@hgtrnd2byond>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
 <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
 <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c133 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fGCyMEVNY4hdu2JpfHgA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: _V2yYtSnprZhrlPm-xc8mQkIi6Ahq_9v
X-Proofpoint-ORIG-GUID: _V2yYtSnprZhrlPm-xc8mQkIi6Ahq_9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX1hZHMvB07eHL
 8w9sJeMvqOiGH9VhwX6bzT84Oz/IEDmrxgLcLcATFYU3ME5gpk7Bd2jEZEtaK62YoDNDMORnCfS
 +jgh1DHkkZafqoDVHAA0N08yZCCDIPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX/bHTiHd6wQqi
 BN7iSTxYrCx/k4qLC2N2cC2+xZMsUlbS6DhkkAaDyb+NdYeGC6A+Jkdz7bOmqsLgkojkCqbCzZK
 9cetvROIyLUQFoNXH0mNi1BK98SregVTOg8/U7K0WW007hzr0ewJQkxDDABMT9+cQ3WriBsG2RE
 bnCLZSz1ldIt5+0KJtsAnt7MqL3ivXb1WjF9JAcDGMfhMK1AyxMc5CL96mLjRiJT8dwGb7049Ax
 mnmsfUiby9fqUBksLiMliVvN4nvytVdpnYlCwRxSOkNW0VuLpX66S7LTtH/aklxa26LwBp32/eZ
 bR5T607neICPfLSLMLZiGCGSILP4ViUg0952xpCXMu2bvWu5dB+Mr2wvy5GiCXppGm69XVRwPXU
 G50VRp7d7JdaGE4zFb4hbTISp9YKxzrf2KKwUShiYG1FHbXMl8Pqw881gjy/ynlyMzmJfua9Xn2
 m/PUOjlbga66MxlU/TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220128

On Wed, Jul 22, 2026 at 02:01:27PM +0300, Abel Vesa wrote:
> On 26-07-22 01:30:27, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 11:25:48AM +0300, Abel Vesa wrote:
> > > Describe the CDSP remoteproc along with the related SMP2P.
> > 
> > Why is there no glink-edge / FastRPC? They might be not yet supported,
> > but please mention it in the commit message. GLINK should probably work.
> 
> I'll include the glink-edge in this patch.
> 
> The FastPRC was sent separately, later, because it wasn't tested in time
> to be sent together. Mentioned here:
> https://lore.kernel.org/all/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com/
> 
> I don't think commit message should talk about future work though.


I would not 100% agree here. It simplifies work of the reviewers. If I
see a DSP w/o glink or FastRPC, I need to think why it is not present.
Is it something which doesn't have GLINK support? Or are there any other
issues? While stating that abc will be done later saves us from those
questions.

For me it's similar to the USB support. It's not infrequent to get only
host or only peripheral supported in the first patch. But the commit
message needs to specify if it's a hardware limitation, a software
limiation or something which wasn't done yet.

-- 
With best wishes
Dmitry

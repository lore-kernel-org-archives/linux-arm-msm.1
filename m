Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098961;
	b=C5IVZ3ohrzGn1mKemEf+BhKZeyPhySDz7y6zJhqYIU4SRAOD9azIpVCnwmn1cXTWjRIm
	 BTvD7wPuIJW/BWlPVssE6wOQI1NdlPhRIiX01hytlk1fqIxrb7LK4Im1AXS5jYWmg8F/Y
	 JKpMmgEKBK+VIJzu1l5+9REtlHv09uTxt19uuyY/9gTqc79dTlNw4j54NBwSteKX8r77A
	 qyov2FOYWgXI7JTuAnrGKDRf2+5BXJov1uE3XrV9cu/8rcp1C5qhiOQQMhxyNJmvlAW6j
	 KoCqC3ZbPE9ejXvy4GzZQPalKqNKXE/+0NJxWJAoOKU+TJy6nNKwld1awdTjrVM2Wgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
	b=fR101W8/l1E4o6PPgSJgkq18pVDNs6G5OqtK9h4SJW+SIATEWdemeZHbJsZ32S/7SfDy
	 Pzn6HAawetnA4rqIeIvuANU8UFn1LGiRTcHe52bWBk91JRvpitGyRoNXxMhI0539ZA4WA
	 J68Sfx7neDpW3slPw23jMkZN8M/4/gvmLUZXRF+tbJ6GMbDZSojKiRP/CO1syK5cdp5Cp
	 pgszVBJ4fc1S+f50oGp92iB1sWVkiY6mtG0dDZfSGa2ry7V5O43XX4JE1FvZDP7G/hHjA
	 1SXU3OcARO/9Xhj4es7kB40XkXyZT7pFg/jnXymWUwHe8gAZCiR6bhdVqPatQXC7ChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HU5qGGV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1AmlUYp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C01606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C01606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HU5qGGV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1AmlUYp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv2M1921719
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=; b=HU5qGGV5wqWI+V1U
	yH99kQc1m2007GWWvoH/qh/bTeS14xUUJCWmIjkN3RLZbgUqaD9bWSKK2UGuH+an
	uoY6q/MRYulFHAFZJwg0ggPdZhurMKJSU54vVDKwUmWQFJkAEBrBujM+8SShVPqd
	D8QhQzS0xTiuA+WZh1+zZu4tsDJTWXHM1sduJG2/qJI3Aq7sNZHEiBP9HIcKuwIE
	k8VI6XCm6mXKMaY+r1qVJY64yfAiJxW1MfbdDBx63M/mtFsG7XPrGjdceTn5j8ZV
	lJp4BT/c8SntO1VlEwe0po1GTQJZ5MUMZRMqrm4HFsjbTTC/svZowsyF6Gb3x8OF
	w9pNyQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68hcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:02:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99082f450bfso3997977241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098959; x=1793703759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
        b=W1AmlUYp0g2bgcYMqPgS5SEXd1dmTuXma91PaIu08sTo+b6qNPkwSsAalYxPGS3YpE
         nAvXl9RUHeAozOnG+uAoVTARuZ/0+M6i9jKx/97G8eoxCROdp4KKGzoTriyBtySReiEQ
         ltBF1GR2dWPEirzth2bd5og0ly7NPGPF7AXfxzLBtyeuiu37vWjefnt0HIziuqzfnFjo
         MT5fdRPiUKSgImU1O6evxwfPkCGnkuOJ18znTW3/zNWWAWlrG53ENK9I0c20Z7p5eZEp
         w2UJhnY9H+ai/PZ6/cp1K4zHrscTZaL98l7hpJHMvV9WjcgNIt11GVEVRtIF1Re8djPY
         2SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098959; x=1793703759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
        b=Zo/cdSses3hLdAaKzBuehYRnH5vb2Jwm65kC8LJJpUIeQkLyt0zV7+08MlVHF8tyVq
         ZByzxNroqyxEsBuWvXRmCHyqpWWnmen7zyDXU9YKvDm0fuLfJw9c115/VX8iqXrSeYRp
         dD9/lvM/TYkI8vFMnttkDeX+So1fncqfw6PmqpW9wkg8fznjTuX0zzUQEvqja8g5wTwJ
         VVPiWwUKBwIHjJAd8D2wiEMLa1FZMQGr85qbvQq8REJi9K/e7IWurnj43kmg3R1Mc5yH
         fT/7mUN+3aI0bT1OO7pM1V4HwA7GWFqdBLL93ZpjOz1Bqo6hsAuJD4Qu7NK92YVXSdJA
         HxTA==
X-Forwarded-Encrypted: i=1; AKwUvBxa9rsNfPmPiKm7H89CJmqhSzc0UgYaldLY+vN94MWMgrU1xdjWgD9bhtMqIr17A+0XYD2x863AFqX3cdjJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJMQlhRl+fYvms9r293Kz+0RHLOo8d45WfaGI837MyCT/G9JRr/
	EjM0zAp/euYAv7IT6BuDRdpTjvJEriJ+90k+uqEGOyicAIgPWOmTW7iO1IV+V9jLlhRGfTlJ5BA
	ct5SDKLjOMNq0K2hLrdsPLNomezQ0Y3TcgWJkgWtsTaIYu0xoXPSNlwepQM9UE/rljkaz
X-Gm-Gg: AYBFou0517+vB13jLR4HKSPxG57NiiOMFLos44HfCJtI6hMUFomIIAD18NZ6Gtv6BNF
	5xKAOTiSnKZe/kLoSqOqnD0EpRxDrUt1jOrp9svfT+uqEjnisrJxcb+eY0fnVYCbGECSj2TauLQ
	e0Oyz9mbi9vdN+IrNVd9wjltrOB55qCJVig5mPhSVnOUEa6MYdmlUUQnREOQAby5lIQ1ft5TEl5
	PbmBjJnqwfiNk2Tv3G9H25tP5MRA6eC07Si8T8VSAuPFghucGodgGJV5ZQwJmNtTE6ifB0FxUvz
	ZG4Mc/gndqa/xNKITDPqin4A+j9XDpkgggddhM6Zww7Mgzmc/qW2ELKvCCihg9iPJyhSjHrmFeL
	g98BFTrlfGqVW9at3
X-Received: by 2002:a05:6102:a4f:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7ce5ca0cac9mr3759085137.1.1793098958802;
        Tue, 27 Oct 2026 04:02:38 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7ce5ca0cac9mr3759013137.1.1793098957565;
        Tue, 27 Oct 2026 04:02:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm201832465e9.1.2026.10.27.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:02:36 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:02:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?=C3=84ngsblomsterskymningen_Zefir_M=C3=A5nskens=C3=A5kerh?=
	=?utf-8?B?w7ZqZGVu?= Zetterstrand <angsblommansken@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Use semantic names for BCM bandwidth
 fields
Message-ID: <lkt2ryacjrculzbnwwg2fazue2ylocq62uknhwpzomqevfz4cf@y5gok3esfvpq>
References: <20261027095736.94878-1-angsblommansken@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027095736.94878-1-angsblommansken@gmail.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae084cf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SDxAmmnRaevP0qTVZYgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 6V2Jl0evdCpQBvD8vyQbNTJODqYfCbP5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX3Tpa9Oy8DSFA
 3IaRYon+bBGtykhhbRK3iXD7VegybGsqCR2Bbr8LyHyTCXHu/PAoI7iCPFcRmPpBINwlXwFlxJ8
 u3KEKjsmPrZrNqhmNY0aBRlGaDqxWsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX0mAU0Txysu9Y
 rQDw9DTDOwZxvso6opyGGQdWCRH9MOv8sqxJwPEAl21ON0T+C5rjijKeFP3DpJbgWJJUxfLGkW0
 jZnEigvmxK9S9NjoL1P8hkvQaa0UzuLtUYqJS8edvCESv/pl7EHsN/iCoVdFrwCJmeCh3hNaje2
 zoZio1rdUUw0GyAPpFJNVb1UXnj3rbtafb+5tCPkwt76f/jeFxnBwPWtJEc9etKSsmtigJrFD7W
 dGPyPkZctmDZl01+meW2zNL9hoOHZ8Ml1VGlmQilNNU0WB4/DNfl/xD2//3a29ahfmK45MH5Sq8
 QogXsQMOtE38FLIjWL6S0fbuzxSFu3/oCm3/fZ65hkY3mP842YKj94DGE/54TzIv4lIItBqnJjj
 Ezj4lZqOT1+/FA0IwgCEbZc9D8BC0UedTpdd9/ZARAir7tSNaX/25jUgwlBX+HvT2uhZ9tl5yq7
 RN4FHkqv21/xJtbwh1g==
X-Proofpoint-ORIG-GUID: 6V2Jl0evdCpQBvD8vyQbNTJODqYfCbP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 26-10-27 12:57:36, Ängsblomsterskymningen Zefir Månskensåkerhöjden Zetterstrand wrote:
> Rename qcom_icc_bcm members vote_x, vote_y, and vote_scale to avg_bw, peak_bw, and bw_scale, respectively.
> 
> vote_x and vote_y are legacy names inherited from the low-level BCM vote encoding. They describe X and Y rather than the actual values, which represent average and peak bandwidth. At the command encoding level, X and Y make sense. In the data structure, they make readers remember an implementation detail that the code can name directly.
> 
> These names also match struct icc_node in <linux/interconnect.h>, which already uses avg_bw and peak_bw for the same bandwidth dimensions. Keeping the same terminology across the core API and the Qualcomm provider is preferable to maintaining a second naming scheme for the same concepts.
> 
> Sure, we could keep the vote_ prefix and use vote_avg_bw and vote_peak_bw. Both names would be valid. But qcom_icc_bcm already provides the voting context, so what exactly would that extra prefix explain? We would essentially say "vote" twice without making either bandwidth component any clearer.
> 
> Rename vote_scale to bw_scale as well.
> 
> Keep vote_x and vote_y unchanged in the TCS command interface, where they describe the hardware-level encoding rather than the BCM data structure.
> 

This is not a properly formatted commit message.

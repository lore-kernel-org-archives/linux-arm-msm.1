Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812F4CE693
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405989; cv=none; b=o1xqxmMbuHgYK1LfhIDGnLT83xVVetbEnKWRKdbBPbWhNkP2SJFBlPRPVeZLTmnM1Bu0Y7FBAuO+1xte3XyJrxbo/msDDaZLfSiTxR5hJVP4kG8VExrbT3t7OBn3KxB57LMpil2mkSxWiQJlerrdLxYYgkuQjl1IVAgIUgIDdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405989; c=relaxed/simple;
	bh=IgAFxojJlv8Yh7B3vkbS5J+bpRrVZTSGNCU5qQt9mN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6Scu7TpsvXH5A4hG6PI0Ki9ru7HmQTloGR/MFa/406kbavF9LIYuO6dD1qKbIx2KRkqGjrATOmXx7zpMqteLoyzNfAby0YRHj1PheCfs7ghJTKTwv0AQY3y8iWGVi93umBTMxkg8DPDfbIa86kZQru8QLMf+rd88pmYalcglzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV27/6qI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpSf6JI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV27/6qI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpSf6JI2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7vS2236099
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hc3ydRd9A9oXzi5TCAAQjVkY
	HHdVa8gETxavOGXNQlU=; b=oV27/6qIcoWpWHMxg6uVdYukNJUy11hWIycDSb1Z
	nSwrM1L1mg/A/ithp86g8uD0PaU8tJ5xY0mXRHCmWAJPLj0dXSMcvEEUEXc47YG7
	Uw1BkD6CxhQl2jy2NeRDnPDtxDuQvMbsgXAR7QQdi92E1Ipz9iku/GGp9Hp1L67y
	vIIrUXbSU9vUN9CwUxy88KfgkHAukDDTHsU0hjgMuDCkgy5oQfEOoxneAlraQ8BD
	xmjiFm9XrhUyb7xDWDZiTAYn87K+7Au3nCBEpGhTkvV+9FfLY5+gnTfheXNdflkK
	1a8B6w/G5B/hJumDDXFEamZpRowa5qv1kr2a/8D4vl9qKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8n9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so494988785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405986; x=1793010786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hc3ydRd9A9oXzi5TCAAQjVkYHHdVa8gETxavOGXNQlU=;
        b=RpSf6JI2J9YAWBFz50okplV5aEl2vzqXB6UyTfytjJ0JlEt8HE+rnEcNHDe/+4hIVZ
         FKpwKAdw4ju1Yk+hmG57FnwbHVAbj0mtkDxQFc8gl1B3e7+4ryVoh/W9H/UHzJlvnTPU
         IRoZFCfE/JHCLyJDYRZKt3vPI7l5/xR9uu44ro/nhAF8ZOGWQ7qYHoC3YuXJ/IV3awKD
         WsInG+enMN5G+bTH8wVXRC7UG9KI//pai00lB18ya3TY3gu2Sw3BH3q3WQThGcPPfSpu
         YRgck38F4IM/k3gx7manqzxjQKePig+shGD98EOeBY/LKn0innAw6suoKLYlt1xyVgJc
         BdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405986; x=1793010786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hc3ydRd9A9oXzi5TCAAQjVkYHHdVa8gETxavOGXNQlU=;
        b=nu/3m1rocb0aaWi+MOwinvedoqVU5D4Y/D20KAp3cFQa0MTX3lnWq2wTFwET3uCCwc
         r5EAqkWemVRfVSQm091W2IxqFHNHRQdlM3zbX5ai9FedAfcaypexDnntQ2Ix+KqbWPNK
         vnLfDKu4G0urUy7ZZwLpw8ZRKLelcRoVelpC01cI/epMd0OE7+0HdpH1kstLdwKX3Zzr
         YFdeut5H9XHFoVVXjZsUrdl69+HN+sjRBTNrT779p4beTWER251mqFwsO7dbgzJiXcSH
         hc9ermhGcWxsIL7xmxwFjygQMyoWypec2s9zE9TnUS85R4MdneAgSaXvq21DegceMnZU
         C5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwneQAWrKGoBPUpoF7ztD3kkEr0DNRLNChHt6hgh2mx8nMvDBwm1lh1ubaBcds3hSiVn0UIKT42P5xnMSZm@vger.kernel.org
X-Gm-Message-State: AFq9FYKryvoRGwNajDsHnq3KIR4JB5seXq3oL1o4QthuUw82XIluoAJZ
	ZOy6f3YNZv6br8zRPtU86QeKcvfzKT/e7IN83YzsmDBtiFvpDgtkHyDDXGvmQ9LTeAO1HVgsSsU
	oMnwDh5GaI7ffHjYFahjRGLynsU9oSaa7QSBQsoutLDj8uKzzX3lL5gLrJ2HHN1a6oGqE
X-Gm-Gg: AYBFou35UjLiHPLqmrZw4VhX/bu0NBReE4Bj1uB13e99B8d91bbZdMGCSviI+37F6qn
	j+gJGLVH16z9qKB72T9aBgS0nXEX8gSkidZLYqRKNXE1iVI9L7PS68IV37el6Nbr7Lie+6faDyQ
	DLEAIrIgxVwgE05xI1xyBGNriFSvwbuyxPptQZW88khk6T3lTNvAJOopcMavQ0GTNJQEVs3h5fe
	QWMKJhZ7pEpMVhT1AtLlgv4k3zeUuYWyQmd1aoWZdJPPOVzlHTLUlAtcXN2N4QswxpMcOePb8jx
	BzkW1eBfyeKQc61jWxp4Ol8YkgOr8udyhItdmlz3l3m75RL6q8MHli52Si62+vQSgJ2kUjCmJ44
	P5l7lVEo90rzSNiIw
X-Received: by 2002:a05:620a:25c6:b0:939:b057:daf2 with SMTP id af79cd13be357-93f29d66b4bmr1170730785a.45.1792405985473;
        Mon, 19 Oct 2026 03:33:05 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:939:b057:daf2 with SMTP id af79cd13be357-93f29d66b4bmr1170726185a.45.1792405984870;
        Mon, 19 Oct 2026 03:33:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm188570305e9.0.2026.10.19.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:33:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:33:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Haipeng Lin <jimmie.lin@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for
 eDP HPD
Message-ID: <4bjltrneapg47b2bzs4tr5nhilocsotgfptsfojvn7oxoq6ypd@cmhqx6xgrh6k>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
X-Proofpoint-ORIG-GUID: wMQBsWn6-2ZLCJieiUcFNQBhNa_pvPhn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXzqQUPw4H7eZ/
 L4loneKozYRAQeVly3QO5GFxihZPaYRCjzbfMGHSmhtMG24uhOq3WiaU682ZQR9W67wJdde3w6l
 L3GYByWDPUzS+a5nxbFlFKYbz8xhmNM=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5f1e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wIhZVfkV9TNV1Twh65YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wMQBsWn6-2ZLCJieiUcFNQBhNa_pvPhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX4n6FLniInJTC
 y56buG0hSqMV/kWovLXpgSXNqHlHQ59TObIKg2DEcgBrC7fZejXoVa69nTMnuCu7QD3l4BogO88
 P6gQifgt075NVmBH+WTqQuRu6vJMiPTHZRH8y6rTg8SL16vl4wmQ8ia0iRIV6bguUgECaEfjecf
 xLfs2gjcU8SgwwqK16heT7WuUISeRTnwi9jYqiFiex6RBAn19no+Ur0m9g2ZMD6peprIDgc1twW
 9EQg135KeC6pC4yPRgVdd/0iWIGbnhTHSiqfAhVsVZJaCZHYGbFQEvq61P2BLY0q34UpA30d1oF
 SPA9tQ+QoUPpCZ+neQtLeMxIqoHxX1R64iL14D/gN1hvDAfBujfuBEugIGrPdPdmiGFnM5tkrMy
 TzsvSJQ9rtm4L2faFD14BJS4NFswRUFUFw19j6447Qdc9CfF2vF+/JTs0vnoSLUyTY5RUxE2BLI
 LvE2TCeWfKs6Maaj4BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-17 18:52:25, Dale Whinham wrote:
> The Windows ACPI muxes gpio119 to edp0_hot for both panels. Describe
> it rather than relying on UEFI.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

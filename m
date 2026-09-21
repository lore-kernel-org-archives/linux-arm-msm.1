Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC621493D29
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992067; cv=none; b=qQaEHOo5qZeAsM1SYv+vhWiYpPTvvgW9bUxpqbPeoE88QTWebvY+7yljYSU8NgdZmvYxRGE3udHCcjlbFfpMMbQmjem6/KrZ58FFSXZgvQ+B2lqytUejQJ0tKNnBmP6iW9iC2eQ/qZ0SDvrEvk/dffWsBSopGBL3SFJKrVsl3XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992067; c=relaxed/simple;
	bh=xJYmpMkdOypN7Sj/n2yeRBJRaKDrZu1gaBC/xhMqLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkGSs6dP1EaQlkP/uZPXR4M8DjUgtHkuB5800qOk5LJsbSCP/SnUxPEXbWGQr/ThB3tO6ZoE9spVtYD0qcoIYWyYvHqjMiEKBJF2gr9tCcspXMSZHuiKv7fOsBdEqaQW+UO/4lsN+KhC3gWO8Iijd7DKHBMD+StHcuB2cslO1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm8eWGDr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENLTbdcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm8eWGDr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENLTbdcG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0Ub1563477
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WexGBER5d9uASCyOQRs0xONS
	Wi6CvrW7lSCk7SoMFoM=; b=Mm8eWGDrXAz/5Yap6kZWHCr5gxSUsrfrn5x9THLd
	UzuW5g1/WwNetvQ1yQzJJVrR7mPFt603Vmoo+KcNMqq1YimWb/7CEjDhvYSBIFO1
	FmKg6duF8mCLcCpmmsXb3xH+VPzwGqdMKJRe7YJ3PpGJUP0KoRLu2vVOea4qpPJh
	ZIGI6Ml75kN2dwemHjZscrRJ5FitfkmXtbtJ61Th0MW7MS8e6bGdlYi0lit4uVVA
	6nVLtzQtgqCUoWNt2wGlTmCiufffMM07ACKhCz/1RG5e3iDlZXNtuM45M6vSgfHg
	RbEi47seoqH0Ub41gyQm6qi6s75ORAFg9pJQlgi3i5tG5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw15gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a6d5cc851so343233137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992063; x=1790596863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=ENLTbdcGhonsAyKvL8pKbVV/S3M2bAtjCj8ysg1x7VO/Cagz5Kj6E/Px6W/PecB56z
         Wg5juPQFV4C0U03jArTP08jEsx2IxF/F5ppXR0rF8YTmqitPrz1Jr2SMrWDupMm7sp4b
         OMO/rgs5FzzFezivZSp5an11F77A/p3EldLMcejNk47dMZUCorrqdjYz7LP4HKisL4wQ
         Sy+P6yvRe9eAqYPsVEv1pGGN8q3pyNjQwYF/okk7duxW1UW38tYqxsfMbkmvMWGcwh3P
         j4NdZ6OyiRW1AcMWfuqIsZsCyHfATYc027Mc6MdLScFHD3AdsLaMp6C63730EJ1FA038
         8hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992063; x=1790596863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=dMiJgkyhXda9rrT+0YE4IQkNaO3QsFSDIASA42ujuX5X8NsSwBCOowJJDlsHB5yLNc
         KGZPPv2ubtO4vNIzjBUtIoL/HAG7v7tBAPpfXdhjbiuy2QeuLfLS7XoLkwYbxQdUAnGO
         nILdDplmrTEkbj5HggDkLBc4FWszxaNjxKTp9AJrCoLgy1jrRrpCnq3uMXnU8Kw7/4oG
         jEoJoJLQXgFoRCqsypXRAXETLxyxUHqOG613+Neo3N6hwRgcJrpmWEE95bHfzwV4qxaE
         bPt8R+0nGgpmW3mdl05rdt/pDloVOGpmhDZaky4NAZCiAH0+3dIfWmkYIAzxukuoxmgV
         VqQA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Tb1rk45NBitFvY3LioXxYPNF67/qEeoTmLpqOcYsPoLbnUphDbISn1ORm0IQgLGEXuFfQMj7WQXJBWUa@vger.kernel.org
X-Gm-Message-State: AFuF++lRLxZn30LwqNNHNuWNPpykpv7/zysWnfJhzuGdEJEZAt5nXloC
	acvve9UQTlte9gOAZy+3PDcPxSPGha2xg84PK/ZSXPjKa2mAeh7eEohXwCk6f0WzBlTZtIF7Vzz
	83cVgWkl5gKe4qjevQpivGOJh1ku5f2MH8pS8K5CnqGmH2ta5h21XThD38wXXT8R0lvOu1T+TPp
	PP
X-Gm-Gg: AYBFou09dsTvIXFKOdybA0ABv/NSZBic804Vm29E95mosNqPC57aasw2C+gWjyXZ1Sk
	wwW/CH6P7T2BCZNcorOAV6LtKXch81gugQa0SRrWdT+o2o0C96rWkQaopZlaiTMrLiYSpNqSPId
	PHWGtJ6LCIcvUTB4w55i8n7pSKa9tcptmEyeMJs29VjFK0WG732brAq2reW9TvKgBsBVWNbdWdG
	/OyGhRoKpd3whWRXSOYBGiT16Hp8OmHr/DoJhOATqGCY2iIMHokQpZLpN69UPfPEMLIJrOwO5JV
	MbHbDleOisXoJ4qWjJCYfPgitqhnt/ttSVJokkCmco7WGgveiIMScYWSxrIf1A+E1Td7lCo1ZyZ
	amXGg1U1Acetl/wQ=
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760507137.26.1789992063354;
        Mon, 21 Sep 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760444137.26.1789992062795;
        Mon, 21 Sep 2026 05:01:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm294306075e9.3.2026.09.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:01:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Message-ID: <dqlby3gbrub5x6rdwd655wu437xonhlxhvrhxaojupi4wzvbff@3vgdyj7sxmw2>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
 <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXzVA0+wOdjIhN
 Z0YBKBDUNlw330MaHHmS0eE0MdYAFUDYOX4AvorV50Es8vIlydq0abt4eFwToi2DGnOvyQTVjhu
 SYfEGBUW1KbX9AvH5hzVg5y/KtTYgnFYLQJnYcVFVyd0FzMEUw2chfnye0TMdzlq1WI5iBkZzuG
 M93lLtibTCdFgUhjnIa2Gd1j+flDIPzF20D46U8nITNxihCLbU+A21BiBB7Rd3hGG4vXHFC8QTa
 YU9x9Oomg+Qgx1C8HCIAlcopAH8tBbRfQPXrY9Q5ykepg4ND8rGfHQGOAjbgti6WkgBorxF4N1P
 FFlMdqfajvipikVvvUInWiTJg4G+0363DvpkMPkYyvMFHEtmQfnLdrl2BE4Gct/nNCB/+XDJMAO
 nTe84A/M1c6CN+pzqf961LYBneIeF6DD1l9fyPv46pNCHbd69VM7wcUBddNZ8G25886AFeSCTMf
 OQNTLmwb2fK1cdEKdnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX9neL+OnnvuT3
 6ujwhfzQ2RxLoQzD0LY7rnekdmvK0TdN8C6ZikOkZrlMDW5dauX//4gFgQmzNsmW9BZzl+Ysv4g
 hkvzqIbXhVrw/fmyEv7DW5dqSmcYLck=
X-Proofpoint-ORIG-GUID: r4YaZrxN4gcYzI_wc07C_30nfRC4LhOM
X-Proofpoint-GUID: r4YaZrxN4gcYzI_wc07C_30nfRC4LhOM
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11c80 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HVTXq6jCC7j2OmNmFLcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-18 09:29:54, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

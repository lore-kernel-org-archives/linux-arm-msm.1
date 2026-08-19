Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A448F828
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158126; cv=none; b=mnKmxdB7PWKOdgbfEo/VARF/O6OJIHiQDkne6pfn6A84puQ26LwdJvC5hr4ZVTnXDukMp3Cl61MLMaY/qx/AKfiVGgF3yZ4fcv4BR/dS2QtniThiDn3ZVtckl+2PV1Y3U3v6hbEV5m26XUl4rmQdj6H0GSvoORfb5iJIcHVoUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158126; c=relaxed/simple;
	bh=+wl9ZfJu4Qv4Y5Od1Ohoq1FSlbsXhwbYbTC/IR/Lqgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2Gcy+zNyK+zaf4C5ikguzp+nAAFeguH9+Csmhv1DN+MannB7wOS1+KOJslcFeo7/t/UCLLp9taymwTw/ZkYGiEW0ZbkF11ZPXC/ak30/nIdL7ixwYEQqNBs5ACA35oJNWCVwTX4g9nnhCdkrg/ZUa2NRNRBky/g+ZNwewtGa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dua8MOAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY45TXAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dua8MOAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY45TXAH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbS4A067635
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=; b=Dua8MOAY9avt6DTo
	iOcUWBcY2PX/aEEBi2LyAlT0KqTPyO8I+k5lx2xbsRLFPpfUTDg4fv8Hoo0hz7/z
	XpicQNPEasqrtBrC6mS5R2BF/XKpEkqc/5XWWsoka0m2cPvUzXZLNy3h6Mfvbiux
	/EZvxaMmvirfpGXONxob1z8ftJPAHc6SPw1zGU8kZyeLUr3E04seeCHc11WYRosx
	yOolmXFFV81wRM45cr4l79UbQHySxRNXlxkaOWmEjQcCdphjllOhVqVP7oElSK4l
	dD1X9qmgSL0Wrz3NIrC4HkSSc+GGKRgr/gxSYUc7Vy9rh1g3Lny1XGyHpSWto4N5
	NLQIcg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d0sxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so55994137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158123; x=1787762923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=;
        b=NY45TXAHedCbIMKCY0ZJDW+MiFgYXtRpbr7jj1DliYNocGiPkT/6ks/1t6OC7Oo9Gv
         AHroBYxO0N0fUQWBD0dezuoTlEDojwiYpjlS+qQYEUHrbGGWAr1oRle+3iG29XhZAtjx
         YaraE139dml6URnRCv8238KsqDjNAtgl0Bnx7SPKCJA+05q8CJOqOAoF++Eb6SrlXAZ3
         mjy9RFdueK8BXb1yz8OrIPUuDpbd1bJlZcEVKNS7GjZtNyVjF6vh7cql2/F/+VPETs7K
         dE2qCYx5aUCn9lVeVIbWIhgV/f9CRREI2rA3S10f7pYjyEPKovc6jldwEN7M5awTebRd
         XIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158123; x=1787762923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwfSfejAIjhfU8K4aBY2QKiy32iG254nMeOwu5VErbI=;
        b=gmd65e8v4pIcYr9jyNAEQk+5CvW18U6+DPZQP4JPC94/2UIWHW8LFMWGwryh9AT8sD
         tf3i/x66ZvSyz55gQ8UrY5/9fI5tOVnc2abkCGw66ydn+qq8+dz72CQ03XtQeeZ/aLB5
         XEswDlSEyLaggBsHw14qQUaFowPfP3mtaUySQ9O/TbFommrddpwZvIhGDf5usUYEk680
         8z2t0/U2UQSXu5DH545iYk5Sgao7TPeEE8rlfhviaQ0n1m3sJRXrFdSTUXyeTjkkGXo/
         KyxwvG7r9+sQuqIwQQynx+IyydjsoUKg/gff0stQqJhKFFSrRYviQvJZgaHSIiSndzXS
         X4Og==
X-Gm-Message-State: AOJu0Yzwd678o2TU7vP6Uls8YRfAq3/ECkDG+k0U+yvOjelsGKW/9Ynn
	bVpehFWwCEDBya6mir7cFL1IPbE7WCPLElFBX1c5mR+Q9R9sj0sRxtcYVcLd+hY12gjLYGf/hDw
	lMaz9bJjFHK9Nt1qypXymfi2xBQx7zzzPO6D9RuiIyofEeNm7YvutyN8rf/GaXbVAR73q
X-Gm-Gg: AR+sD12ck6wJucx3Xfc2ztSkHjZ7MEJ8E/kQOW5NmG9Bc7HpuVWnE7AIR0NKCNakmhU
	pM0fMWCB/5V4m6AcNd175vtqpR/1DLzBaQ8sYVKhwpvCWfjAdaGEOcBxJeTtm/M0BUyDQxJSPFC
	8O2JuI3nmEO/HQxKQ64daj0eVJeppVHVgelDqMdVTeEcjvp+QyQZCKqIxrRPv0xAUvHuD/EP801
	SUEJPpOIyx+4cmN4QbihK3lRbB2gBwBn02voPChKj1u9qWeVGuBvlsehUgK8F1RXmcDxmi33OE/
	zY96lSnkXPq0DktYK41nrHTzHCUTuKJEF98vL+FmiSMC8qQup8tx/DK11H0p+UsA+mj00hBFXMU
	vZbkxftnfJ5ONDChX4WlVf9j9
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591423137.0.1787158123463;
        Wed, 19 Aug 2026 09:48:43 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591403137.0.1787158123083;
        Wed, 19 Aug 2026 09:48:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:42 -0700 (PDT)
Message-ID: <266ea420-0c08-4642-ba74-44b0886e9112@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX+5fBt34sZyxw
 CiAETRuwO0FEiIKnxGNiqSr24/xDmLkDyVJBPYV2v25Th7JNyXL0+jJZO2L1qVVSkwgwtYNte7W
 1h56nSe7ZJS3dSDcLXI+VKlRchiydznagUiu5gxXL/lCvdbNiQUDMWyxTAfyhxVOBdaRb4SPIrR
 Vy78CzWmWchKcqNauetBbzinpgMN6ElpFYdztH245KfvubUQn0Wy3Wg3Bl9lWWZyAllVnCD1Jjs
 iRdCsCCHxUEADiNFERPZZRdJuFeuyPvBoU0ADLnTx6mrkdYciZTJH/FObXJapOAOywKJCeGXhW/
 W4p2yB3oi2CNaXi45ICwzDDWUzT5fMPKap+KACNqNztXDMSvzb7kpREkuTi1/IdAsyQDazBEJsg
 6hgYNdLBDFIAZDXtQjest9gxLBo1kQrkCUEXe0zVTY2QAXX/UcaHXV7nq83XTUNtyUoO/Vjn5Qa
 0Ux5W0ZbhgYWmd0cmLg==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85de6c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 29C5QhRwlvk4TjzlfsLYBJ99nV_mCgzk
X-Proofpoint-GUID: 29C5QhRwlvk4TjzlfsLYBJ99nV_mCgzk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX/Mwg2VHXDjj4
 glaulPgSu6qCGi4e2SCGFIyU9V5qhNxnwnCHsPcWt8k3lHNhFb+2dvNsaK9tYIQmmmx6QDqoVlt
 5SzBMjogb+eYP74bEQeLW4Mu+FyZzaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:52 PM, Abel Vesa wrote:
> The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E448C8A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158099; cv=none; b=kF4ymCkaiWQS/MUi/MXRvaKkVhIw3DBgnev3s+Xde1D1MDubDjgzZZJTYMZLyzpsEThsgKQuYZQQ5XLE/mexhOT3tOBIiRtgjyGFgHvKVOK9wo9qvAm40BkdlowpYV8G7SIcyBd9Xzk8UlE8FCLkip9/Gkc4i1f9bDU//bKBE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158099; c=relaxed/simple;
	bh=BLvf00UtNzx1Q8OgLRxZNA9yulqs3sNezxSotsJsrhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpWLLadW8Tw7ZTsetsB0ib+zGCwEz/AVGxALiBIAKrW+vLnbJveoKij/epIUBVoYyirJZkU/jSd6FFci8WBqHhSrotRuw7aYi9UBOtznvoWNs5a6dvkBSGlpDYVlKOoal9x74Cqw2XmVxnaygG/r/utnEZ7nLFmo6rdQCK0nKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKfW7CGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LK9riPWa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfW7CGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LK9riPWa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1Blk3869659
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=; b=DKfW7CGpTlpH01Mz
	tzUVLVr92fMFbLyAoRYztIhzUn1D9bMmU2pdiCtG9mlAtmshakEUfQNbLT9MlHDz
	f08I0QqCKzWpOhZERJhbJIwJxN45h52AUYytlkD94243bh50rpmN/qMug4K3MBRI
	GJvB55ToNJl25xhAaqEciyLW+3SkkVhJY0ok+gUHJbjPlWnIn4qwOvtVEQy1Pyqf
	0fU5SehtYU+TsLrVQDl7e1a5nfgLaUzKQ7r5/e7Bi4438N10w0qg94crVxsqB3zB
	nO7SQK125pSbaF2wsQjhjtyzazdnP4ZcbzO6JX8EhTC6P0aX45AdR+xt5akEi95h
	+kT2xQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervgkw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-977cee1909eso9954241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158094; x=1787762894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=LK9riPWaNcZ+Tj7wR81iHRcNS7PsJf4aAVhUOqDtfhFeB21my5zb0lYDxN91LMAZHt
         AeLCZ81LlHT7JJ2iOjiJqMwkmtAG4XWaOLyglaySD438EWIN++vOSTD+b3j0EbKEx0h6
         d4fIFbSMI+ettXxMBq45R9AgThK4hIz9k+rTfP4KRWI/6QOqhGXYJOVLdcbrFbpksVF9
         lhDBHFz9lgaAGr1nqfRmL32ifLqGfRPbpW6Gh7YBNe7k2yoyn+0ve22RwOJbEJ7GIG8s
         zxMOc5+E6LGTsWKoxFWzo+AFbMLg9uk/XR/F+XDd7CVWT1JwFdU+VD47JDJpgV+ceDiH
         Vz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158094; x=1787762894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=HlDFPFb7a02sBt5G0A3/Iw+KlbG4m5I43+qp2ODnV0VRzCHugkjRTQSdq6nLdJ3tY1
         ehUXkoxeHjW6SZGSrFNMrNEifY5JrvrWo2Pwsyynf1ImRKMZBzxUhFxQm7a8nCMnbuW7
         A2N/5/nUv34JCnYBDMUWtiVMeqEg0VTC1K/mk6hSLqkI7h+dBu0X3kJBLHjkgJgTS8wO
         Xp1LzMxphvEXdYSvfJCV7YY4J/liEqxcJSXCzEt1wcQ/0X0LE1TxJ1WKrEzDxhSi/5da
         rjZw8EeuJCgjiyufq+L3KlAYl+NAflC6GJeD9WpOrv/1gna2qgcFe2v7AC1Pp4vTRbYm
         RW9Q==
X-Gm-Message-State: AOJu0Yz+2Yxo4fRcDPml6H8CkIBQ0mwmfLy8HgrfjQzp628mfH3QsX8H
	6ovpyeFgR7im5BTRXfutqg6jkJcJfDBQMmle0ZbgsMi5k0WnuVzBhV1hBn7g3kaUwTTvCXKMWL+
	ixobsLG4juji52M5FgnPb1FGgNBpfXEesB2mANK5y4KIh6EgiS9oACXCtUikRbdNiPClS
X-Gm-Gg: AR+sD10z3glb2QNh+QzBGWsOiTwk0wdutgfDTh56ubK1BvAJaiBfVyq/7zj5zrRRC6e
	3gPmxnysyNXt3MV82V4ErSxE5BxOaNIdXZmaOGhFZzsvmpINYh3qxfK4SHZit+8aCgYNsfrSYnF
	CWs1GHru5uCh3blWsOAeEbb7hZDy754RqtJ+Lsjs5lcmmBq8ihqOFKw1AWYBw2dnBcept3qmnrp
	LGQGq3rDqfKRCNC/SpMOexQnpfQ6NX2COIlqBCY/GCi6MsDaq+zxbIwYpDFNhZYzRAVvD0jWzYL
	T+5Pfu+cdi5wOBD4CrTAsM/d0RAgj9twWb7OzYKUBBdRU691gdLU7re4qIHH+KFta24pOnB5Jnt
	mRI+du2ufdlFieTkiAVSTcA/S
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859236137.2.1787158094432;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859227137.2.1787158094040;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:13 -0700 (PDT)
Message-ID: <34c4fcfd-d436-45fc-91fa-db3d4d030c62@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
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
 <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jQA7joRZvSil2t6nV8CCql6R_pCN-VaQ
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85de4f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXygRScwjMcAg8
 bTjNyg8yuttNWf1duM9drFlyvUvgBBBe+9Y1mO+6VW0tajsv3jOfRrAsRxzKQZvQhUdaIuExF1V
 LolvBUdy1JHt988JXgswQBDEHu0S5Nu3m5QbaZk36Gb4yjzjcbMaGckDtswjsE2L7AAbCexcY0P
 F64f/txuYWdbDsk3wF98z5sqxGDINi1sFJ8zlYcX3GJiNenFAKZLJ3aJhRawjrE++Vs+RIvDr3B
 GGWBbTy6GeXJMV+5EdBskcBgndZlfvYD+4t/+2hKrOTW9MFTieiHjXYmLXRZHx2fX78LEIUQbkP
 WEotHGTvyJ9HrVavD8XJ6pNeZkPzIIsAaM4giy3tHauLGCFx0Tk+mUSYvQvP7Ws74dNywik4SCf
 aGkWU/hcWnr1+Eg2CgWSiaQwhw0dks5u6gz8DY3nufOnA9DvjRfC7VJToa28FYNl5oMKOUyrejC
 rvqT4UrQV8N3T1tM8Pw==
X-Proofpoint-ORIG-GUID: jQA7joRZvSil2t6nV8CCql6R_pCN-VaQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX04jDhSvIOBN+
 z+WXL9xIh9NqBOBlDorUFGjoe9LeUYrNlM0OEWZjLCM5k1K8pqyHdpiViGhHwmIX5qsUbsySYg8
 P64MwMOYxZBFpwh2fAjOENBeJ4EAG8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
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

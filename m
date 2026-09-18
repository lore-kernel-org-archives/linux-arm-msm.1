Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5053FA5E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724504; cv=none; b=nnU1cFZec266nI9UO9wmACVmP+MmRpu2svIloYenf2eowYC1sI/NT1Ug9upHIFWQmRdqo9/zqmUl/mV4xd7bc8DRJD2ObAZqQwBIs9VC8G4quCLqXl5Ups9djk+C0+xGSwQI6w8m57rabmoIZbPHK8YOlQr4tk0V50pQ9nRrGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724504; c=relaxed/simple;
	bh=QRuWpKdj+A9a58ifXorfA3tOqpuNbcgssSmdt8TBLTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSwJzDQ+CMiU5GwrvFqWrX+fR9uxSKSrR25WhLHpp2WqYDE4dQ2j5ct9hwzTOZif3ChBhj/MY82UuswVt0sBTjV9GJvv+BU2tdowupKDcyPNvjQeR6hEsydf80DPxue9ZSEcRelwJgLR2FjrjEVfInKjnORcpy8VStdbnuUazGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcGL2ww2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNzNItC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcGL2ww2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNzNItC+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dQLj860366
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaXtCHcTBs8wKKNo/oX3nvA4YSe21cvTYZiLadvDqMo=; b=jcGL2ww2hXcbZqGd
	FWVQV3mfI7uz8PtS02bsWCNspWo1qUZO9vcT3JNethRuVo7qv5bPcJN9EqBFTLjo
	rwjav4k9RyakiEeIWJSsMcZxqt2UCSE89lWUjkUSKkWArXWHvryG5UEKGj+/Tdzp
	0o/Q0fSxDbD73S8FNWfwfe2755x0fcV2OvCrMclA6KTnl3kpl9wvgH25hoYxP113
	VlqcJQhKe490eTxcsD/AtpYRdyASB8FSzxG4JMoSixXPWJ3ye154U7xztXki25XL
	zuDR0MAsKcPkni9hjl3W3CQjnNn9v6Kpn2g5s2thySb6Rl/l3JkkMB8Rkp6v/lHP
	nWpRDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv831x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:41:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so14379385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789724501; x=1790329301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaXtCHcTBs8wKKNo/oX3nvA4YSe21cvTYZiLadvDqMo=;
        b=YNzNItC+XKoGInNdxHrp2LEw57k1As/OZd6euO7fFwk//7A7q9OJaFep9kauBKujjj
         LDfwxcVbID+c5bWmE3CoOsJffypoiKl4o7uGmbziq1Et75ittcppgHBqlW6S0ZybPxMQ
         IKT3b5XYzzawAYxu17Tyy1NCZ3YBvMekVEq5nmasB2O7OcpGXKw5fAXAozU3ub0qywYT
         6hi+ET03oSUT+p7XCpKEMyZArXQCuQEEo6Ez4ATcPlae+BUQd9m99RWnpcAl0wXyIBGo
         X6KBcsgHfFOYdjNDtope/Rulv0uOfxM/bzXycxmDcnK5HuPNIbhj6lssb3+NGbzR3Iex
         pKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724501; x=1790329301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaXtCHcTBs8wKKNo/oX3nvA4YSe21cvTYZiLadvDqMo=;
        b=AhGobtJTVLKMWsMF8XKnqNy/Xl87DGPNYwSZowzSK17WIF2hQwD15csVzGZRQazgXD
         MtCGYtIZoAXrbW9Gocsb6jTrkv4MQSGYSNVJxVpSQX+5bA2pktjsJYOVtgO84B0z0Ppc
         FIABInSu/ICNP+s7Pc/5BPABfBA5nOOydboppHH1Sd8JPqj2vBxeluxnYs2htxEpg5un
         0IFg/FUpMdMgMZ8KxJWU46srlTqnM0thUDx0V6uY6wONXwZUYCMOlhqBeU+qliFtb8l6
         juQzWABSXu4rW3mGUilG942KCNsC9DWyyEXFBqhAxS6IbFzJgjL9//MPZRBK7wmd5FHL
         obvQ==
X-Gm-Message-State: AFuF++kERYFU7B36S+k0WuTbViXHPsDYQnpjFGl69cD/BleA5hp0ih8o
	Y3PF3qjBT29fDChYCAb26WVnsjHQw1ZTDr9lS55UhsUIBqcoF637T0/IETFLWnqJjO163v5z361
	FgeJcAHGnilE9QcUlEzpPDAhBPUp/WbgELHIiaLoXZh71Iwk9nBUby60XHqLgbfHYkx9o
X-Gm-Gg: AYBFou0Onsbg2r6KwOcbRAxDliO6+z7W2isVI5lW1RZqZKyKe1L6aD9B/B8VOIeKefn
	GWAs6s0RN8LHuR6jz17xUjQRN7n6hdiJ5yAc1oVTk1d4LcdzJ1SDvkQHvUVSPU8uPfbrM+gvCL9
	TT2/zsPTA/73LNAGnG4IJFWE94mw/6RYKX3+j1e7+8tQGujoxnDOxSdu4+brJeRb7UOTMXYBbLI
	CsptAj8Vsg+DNzEhQa2S+eR76dTInT31WywXrWIsKkbDrCJ3lB3wpOmPar6VjyB5wNvmf0tHPB7
	t1e2sOt4mpn5vDFzNRhQEIzjIV75dnYNhW/m0y1RSO2lUsQYFNBS7QMATs8M7jRcJIo+5dIkhcQ
	BORLfyETxwoTAGjiIceLe/Q==
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr172814785a.4.1789724500758;
        Fri, 18 Sep 2026 02:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr172812585a.4.1789724500320;
        Fri, 18 Sep 2026 02:41:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f32358sm607866a12.6.2026.09.18.02.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:41:39 -0700 (PDT)
Message-ID: <32f226a1-c0a7-4b8c-b938-7089eab2870d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:41:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/48] clk: qcom: Use common probe data for always-on
 clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfXyegKGdMW6vwu
 9/HLoaWrHA2RgNtDpJKhnmxwC/TdfaCVfNl6ndKjstZxdiki4RZ9rB4PsYj+77AbJ0F7KleOcz9
 aUZx3EOqhlKMr1Cahmhif/y7wFv1R3I=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0755 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1nZzI5l9QWMK2WJSCrYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfXw+ekGe7uAmmB
 cXKZNZYSZuImhZwRJ9tgB2+CndMlv9Oma3mX+G9kjRRjoeNEJ7Vxeru0AECIlSQmO8lVXT2KD+k
 LfrG61SC4bDUJRSy922EFtiJHzJNLnWxWKZ9EIRv40gK8e8hQ7v38+3cfQdfVu7Gvvk9d5rEM4y
 dNjPpABUZ8WlfFHke42f2B2ORZ6kvz/ERGgapvSYrUBzdS5vMmFRistLinG6G3sKMrhGh9Hgu1D
 y3eemgvB9e7UBuJVoTh2WSVdBtgo5+QFYQvt/oRmidhC6YK0w3TM4rTI9TZkkeU6mGnWhJ1HgZU
 lNk8jRbbtiw8QzL4LACoynEE1Y4A425XvkFgLfRaE2lN70bMR0rKuBDq6QvVgsT/zqQKF48GoCA
 oPFxWBTGwnjw479d3lbHesOkghONWjBoUVZ7TDeUIfDL6rlF+obXzlCiKq8Yildt3/QKpNhC1Jk
 WbqWh7RQaafgp1cmEQA==
X-Proofpoint-ORIG-GUID: 14zBNV4z3TMh-uOADetfrAMmP93_Wnys
X-Proofpoint-GUID: 14zBNV4z3TMh-uOADetfrAMmP93_Wnys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180134

On 9/16/26 12:28 PM, Abel Vesa wrote:
> Many Qualcomm clock controller drivers still enable always-on branches
> with individual qcom_branch_set_clk_en() calls in their probe functions.
> The common probe code already supports describing these register offsets
> through the clk_cbcrs and num_clk_cbcrs fields of qcom_cc_driver_data.
> 
> Convert the remaining users of these direct calls to per-controller
> critical_cbcrs arrays. This centralizes branch enable handling in the
> common probe path and makes the always-on register lists easier to review
> alongside the other controller data.
> 
> For GCC drivers, also describe DFS RCGs through the common driver data and
> move auxiliary register programming into clk_regs_configure callbacks
> where appropriate. Drivers whose initialization is fully covered by the
> common path can then use qcom_cc_probe() directly. Keep device-specific
> setup in the remaining probe functions, including the separate CBCR lists
> needed by the SA8775P/QCS8300 camera and SM8350/SC8280XP video variants.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

I left a couple comments as replies, but let's have them be additive
touch-ups on top of this so as not to resend 48 patches

for this series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

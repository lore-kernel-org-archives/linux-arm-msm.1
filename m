Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666869;
	b=XKZ301OESyGQLvJznBCc76H5R4ElJABmF6Dw1g9hke2z1++i4c8j9mYLZfOHH2sKKNf2
	 K4cX4/41YktMuT7+Am9jjGogzEb5mSULxKIp6NoJx2t4eXYERE+0UxwYhddWTEj7PS91D
	 A1FE+MrTLR4Dhu/kI6wmyKSPEgXI4Zlw34KqARmPO+Yx0NfCqLkqzlyN7wAJxPogUELLp
	 wrHxAwyvXPEDn7LXoShJMEA/czOYWo5GlRS7nN5OzyAb4LYH8YbMNZtcZoCZ5j/EKGfz4
	 5w0O3aAyw8+8JUVipjeeYZ8rctnQs3cDkTDQOx+1LDPV3UQ9JPL4UEUtYFOoAidCSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
	b=ZZQcAl7KJk2BTYoIwxphbpFysQIdXnrfeBcHaVr+Yx0seLFUJiI8rmVpFVBxd1qCraXr
	 vJY6uGlxc5E/5+NsU5Pxs8Ygyp4X2cKMb1EmWi4Ae13dx49/yOtaLr1Dvbh9D4qXOpyHt
	 4TW/XMPb8/W8D6SFrhkKqAECLAKTW6/XMoHdNsrJ9J+g8k9o5gonsD6Qk1se2hCc8oy87
	 egu6nxbDQOwTN1j/RytmjQDTtpXSiCIOE18SmaLJcWshaLbarWcSPQsEFFP3XpLfwrO3/
	 HjZt27DYWsaLpxezk8AduGp9LAn7ew0xmvidOWSEXF9c/O4g1Sfw/s6tDAQJrqTT7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpccgJ0v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RbwVg3gT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0C606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpccgJ0v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RbwVg3gT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xm7h317701
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=; b=jpccgJ0vpxCIvwCM
	XM35IV5CaI8D05EHICrRy18OjaGD2huINdKBjKun8XNEFDq3v2Eqf8G+Dsbtflsb
	07GxFv6bpfgLvJk0XIdh2jGDluJPO3ULpilqke/aIs33NFhLM8MR/5+2MUcdx6/O
	zrC2+5pr6B+s8IIQtRLJ9TNedsth+ZiRVWvk1a8rZOwn2mTzk8ZfbLi9FM6OC/Me
	l/Eizp5S7hn0FyMs8+GJtOA6aoUtpBLz0FGD0aP1Zjq0QAF3JCJdIPTG53UGMQ61
	HzgTAi71jGvE1v2gBjLwY1jkCyotFgFkVJ6nlTfuL/jGvzcqkw8veX2uqkjj1o/B
	3OyMLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajejk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:01:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338bd59032so2694721cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666867; x=1793271667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
        b=RbwVg3gT5Q/00vwjbyHKtQPpa4tAAvU0i0Kuly5VtJZuF5063DHyB87R0CqxVWvPmL
         hs8ADuszabBT49tTk6sv9KODGRin5nF9VDmiAMSFCRD1ChUWACDqeN5gmfHFrmxerixL
         GAnPy0f5Dcm74CgiyGc/CFlQHTMNVlK0fuHvMeFe3nso3dXPGEa8bOM9wnSPKnXE8lNt
         LuP1dsRdVpVoa4Z9JTrc7vcvz3rKSdiKqsGM1DxdQXDfouFHp+Cf3xV3gm4L2BAvcoU9
         k1dY59EHJoUvJBuA+xrOg01CWoBxaBUjrE+9ZopJ1Mbj3bOYrFvnNCQMsbRwzBUrtJ7w
         17JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666867; x=1793271667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
        b=TWJuBl6RoAwrOTB6ZugabWrcvhN9mYj/yutVZMrYr/wJvvi3mKL+88Ht+M2fgHDGNZ
         q+q1zf4iY+/rjKDZ2mD7WVp9yi9U8HwBfWuu9tDtxCFTCWdl14pgSu0nm76IgsbstYbS
         soXGHhLC2+prS4QdPv1Iys9OzeQyvu5BtPVwtjA94FSiysu5dOzU+t9MDf/0Gl1iBuVM
         UvGB7XAzzW69kqm05+08XKHgK0ihaFLU1ynR5ARBNxbbmx/WE10E2p+KIfwYh2IYlcD6
         UWT9VxWtshiFrLxvPGwRgkxjarqB7zym0O6ebZDRrTCwt29IxW/QY9vD9NP80Tr2IzBD
         Ensg==
X-Gm-Message-State: AFq9FYK3JiTS8kjhK5dje9KFFL8gmsco4rB/r6oIGPgwXBs1gFt/Ajkb
	t0enIrfs3ETWDt4YZD47a820xbsGNOThKRydIf8uekayjSFCuukH5/Evr3kSwAsKt5f1f9Hq1Ox
	y6H8ZHbVsctXQqZL3sp0B7y0BC155OimgtmU/UxxfCljG3rReuJ08FCYQA6GiJBlbraea
X-Gm-Gg: AYBFou2B6diBw7lZRvMBtE6tomFP2NzZX4jR9ijZgOyPYfO6TgF9QJWyOkGSeFHeYnX
	W9OHy7l30fyJ598jz0pOW4mOsgec6LZRQ0EJQXytQQ+7pXBfXx8qM+rjqA7N+JHV4/s/u096c/4
	28w+dZi9QHpPzsfAkq7y4UNP9iHqxNNc3nNk6fTCVh+TCWgZR2p4eqhvpdttgvSFfV3NzO0S93P
	tM/ZyRhcmYbeG/X8gMz0w0iVHFLxXXbfDQOw8yBp+Ykv9A+TxZFeOPv+SjugGIrJl1gq7a1EE7o
	dgTHayJaVNsGfkH2suztrf5kQ8oj9GYxMkNveCybNaTRAYrbdYC3VmlIJBu9iZm+4gWD2xFSF3o
	FzNYvK2PmAJlJjrI7RPBxVw==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr1002785285a.6.1792666865027;
        Thu, 22 Oct 2026 04:01:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr1002777085a.6.1792666864371;
        Thu, 22 Oct 2026 04:01:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b416ab05fcsm1203634a12.18.2026.10.22.04.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:01:03 -0700 (PDT)
Message-ID: <79efa2e9-e94d-4cb2-a260-ead51da3efb6@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:01:00 +0200
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
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXyDn/q8KI8hwq
 Um8TVszdU63v9LzEgEnKUuHv8ZlwRZPQF9trQuWCO6Ni+KcZCGgnRKEYbv4yh3lEzQroOZ1RsSD
 5GYKnMOYV35jKisTXOujYMeWBjSKy85X0K6E2ZJKg/7A+20sR+RebGWEkl8j2DIy3hKe5AqDO5E
 HTUtuXPrFiK1IQJG5qXbjEYTpUZ+Z1xOhP0ONIdHb9Ne/dBzg6d/KtzeA+wApycOukshZ3zslkB
 RJ7vF5dawMsnCiYAUUoiPgszLFh2C8UPm/tPAFCJ5yIT755XROCZI+Qr8+Wc2ILdmBxby/Jf7D+
 w2szvTv3zZ33/OD6FidjSDeJMDjw8+f1VTofHoj+Zm5PL90sF20Ud4v1G1GAaSqYR/+re6PvQEF
 Lz1y4pd/VFYosrP3LMK9yO6RLZnhWxzOXjsRbr8onb/oX+FoUdi8MDnCqvlpIlc72d9TKgaq7in
 c+j8dRYrMZQr92c1tFg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9ecf3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cuVGQRL4-KZBxk5-JMUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: H7pviQuEmQFifoxwCzq72_cIGEgbZO4b
X-Proofpoint-GUID: H7pviQuEmQFifoxwCzq72_cIGEgbZO4b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX4/WgMRZKQ15x
 OCcmfugn4Wn0PfH9dVdRZyuiFwOL3cUm9yDN+FZDEoAvsAYc89HnoAEorgfIKl63jVw1ikAL4Fm
 5m06mQZk3jY/G0OBjtnATkorV9AuL6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
> mode reversal based on Type-C orientation. Add a configuration flag to
> ignore reverse orientation during DP mode setup and enable it for Glymur,
> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
> fix mode value (0x5c).
> 
> Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

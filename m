Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475796;
	b=vMv/NRXGhmkz4ypbpu+azIMcT+qgjpfF05RUgmScO4yMeNQCcqYN5RbcDE/QB3V9M7RG
	 OLW0nmI0ie+RsGNvOMQdtKC6uZOPh6f+C8MB6I1JV0uWPBe2ajZxq6KsVzvfJGoc1r4DI
	 hwDlgZnkTWC6wxi9JpUdltQKjbDS8Q3LNESA/5LevENBGrhZ2zL8Sqoyw2MplvjRgGg4b
	 dtVCmAmEOQO663QaD56KFdBdbyO2SiveaFy9Hl+3iI5dOE0tUVSG52SnUzaBVP3NUFWmB
	 YY9iu+0WYU6p6fZCZcnTQpp2wym6LkvqNrwXBbfCw72gs+ezvI5h0NkZTwKq+j6YcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
	b=WmN1Iqq48yBe8LU3oxuVpPOheZ+4WkcuFIhD+hrNk0OaGftMzrI80XacoSJYhrBIH48N
	 CXSJXwdriIds55Sb8AvNeCTzwdQT67YayesRIIAF7hNXzTnIQD/fo0sstX0NI2wHmT1qA
	 pZsfRyKemQJIt8uagZbYuurQO6z41QijBLI5bCNEZUhceF7BS6tKxpnqrqrbNR+6tZ3jX
	 8TlBzqRFSRFplrXi/EKjOB1fq6WFC+ZY2aCEShhMBln1T/1pSSeg8JXbKmWIiFCMXdynP
	 6Z2Z0IMT3hKLPFeKd8gbL7id1LIfCguMUPZ22kBNQCG0KnMJDlY9ImnVYd0RZlFJpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NH2C92lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idtFaPE8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED7606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AED7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NH2C92lf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idtFaPE8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t6Fg1210952
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=; b=NH2C92lfNBImskll
	dH8DLgqQz+uzNdtBusatZnbj7Dxq4Db2XPobHPJ/55ElXzrrWERceZeQO/haf48A
	s2C7YEQxgPlxV49BmJgvtDCyWv7P8dUABvvHJG0UpAxStF3gpwWdbRWxkfyZFZNP
	927cDFIQPLZ/Y6EHRpXPPDQQTsbq3mSjSajCdrFrI5aM9VRZjjrMTjFhyNOp0DML
	QwYSi728zZrNMmFX5KlXJR5lqFYIFEJWKszZWV9gdbmW9kTsoqAb/QyzMe6X2L1t
	5jeMUhUrOjpR6sNsgvwkjWFJgwsrSvHBEz67RkB0zIbCZxBw0CqlrUT91XVV9q/V
	v9xJeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p12ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:56:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso93613785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792475794; x=1793080594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
        b=idtFaPE81gs9yS0K3as7afF4h/xVzaEc7EgerOSMiMeQwWzWvT7P19UldWbK6X6KU7
         PR+ol9nZeAxe6jXUT49ndmK6ydpshiLyJgF22DXicOhWKEKCqOKPK/OTikYwvvOR2HH6
         93YytH098p8cKYLLbHNNKeZ5yo5NwqbQu6XitAElTOXX6CfIZYKpN1hZS0Tnf3FQfij0
         W95LkKevIDBhREgG+wKs0UblqC1BWKAa5nQa5wLIrzBB4IjhcQdwqnMJb3s6QjlwVXM3
         EDj5zQ9VWLqjwp7kwwxO4mY0++T2NCoIt25x72w3lTPE7rAkq7jL+HhMQYTuvfgnfKna
         4mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475794; x=1793080594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
        b=xnLyUWdkhf2TPdHUh0oAwikUpydv20ETOXNH+6v2LXH5bNXuJuUa5aW65PY9txnFhv
         5jAbBcuZVgDuJ1jzkTdbEOh7b/SVRpZwe8ElH2BRFIEP6+nZ3SQYjJ7ntYx6S0TlkjC/
         1ODkC0yUyov3EiY4ui7h7k4I6WeJNquyY3a4wmtv3XkKl/qUozEVJJVSy2I/y8kbMaic
         ob0qNMv/HzvMPtRVhwxtTz524tJZ6ZQj/gMvnnMYHapKRYWwJXu1yCNAsrNHhigy6Fgc
         7bMtTF6AVPYwpnybrB/X6LDYe7Vpq4sBegt1GDUhPvs8qsG9wmedIOBjsjf27dThUOIP
         HAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxypcjkFxflQRhDrFiMPrjx2H8PlL05hyc2dYaE11qTV7R1KjKM4c9jZvAfaMgC4sKPOl7bV0YisVPJh+MP@vger.kernel.org
X-Gm-Message-State: AFq9FYLp3HLFjgm1vtSZNNRQp/pQ7RjV6sTnWdhuD1cFjFfBG7+dFPLj
	EA6hJcE2sUIErxA2JUZyNDz8V+JvEufnUBemgb7jEAcH1UpyedP2FqgU71svNf+GvKhaJWvX8Wy
	ygRu9jLRQJSGG4TsNV69uJ6sv7scYDsY5Z5aD1R/1X/0qqbnl3uWUHhvTRepb/o4jEbIt
X-Gm-Gg: AYBFou2xjUkM9VjRW8gwARV+OfBPTjhRsf3QKone0Mi8hQYzLF9EN27dHGEU+QLQsOc
	68QL6JTRAP3uFjJ60k40XOYYJztRgpZAsrytBkn0XRXufLqIXC2utnQWcOfBRvlpx7dMB2siXWh
	6GrAKfX36sxNZV033auqPaiXXkgml+S2J8Ndl0OPdE50blhi2zXd3m5tZZYHqOOit47Ze0C1A85
	m8RyheiW6e4QC3lqa2foVJCdHPO2A1lbq2hCVyn2dAy27/O0LWQLrU5XoesmtZWlvFfRrPXcx3w
	ltCcxnl44J0xhLKFjWvO3p6vimt7ZPnseYsXVOCKpOktxiG7IAPGt0toqAv4gw1EcuANzwWkjYh
	b39YlZKDytH2I63gkg9Xw3A==
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1969052185a.3.1792475794584;
        Mon, 19 Oct 2026 22:56:34 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1969051485a.3.1792475794158;
        Mon, 19 Oct 2026 22:56:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3f05d3b7esm118056a12.35.2026.10.19.22.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 22:56:32 -0700 (PDT)
Message-ID: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:56:30 +0200
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
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across
 system suspend
To: =?UTF-8?Q?Ram=C3=B3n_Jes=C3=BAs_Miranda_Hern=C3=A1ndez?=
 <ramonjesusmiranda@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <73ab680a-ad47-4270-a7e9-48df70e86fed@oss.qualcomm.com>
 <CAP08=V3QB+pq0jd3UcAqzUhffv9D1fLO2UJjEKk6hURFRFfrmQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAP08=V3QB+pq0jd3UcAqzUhffv9D1fLO2UJjEKk6hURFRFfrmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lucEofTDY3fxGXPdcAKWbaKMRbMgbgKf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfXxoMGlQwH3H+r
 yn4e3xVjIGR23va7XXaGaiOs4TQ/kL/2S3tubd6hMHAUYc4m7e3rFu9ShFQpYkXWgtQSq9mMK2J
 Zkn3fZ5RJztCR7mDGzZfQqhv7432sDk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX7T34olYl5/Hf
 Nv0Y91ZbRlZXCkKzpWuELjqLnOz5v0tl7eSt2eIIG+BnWtFIcLiOovmmxRACEsUtNbcI7LgOWgZ
 A16yaLmaSaXCOjoGy7f672GEKWQ82HRnE4pnu9VC8tmHhMj2bIzFirhAXrjt8uVSf85qmETopR9
 +eBEujsk9PbKKosr5KtE6+brN0Rg3IiOqKZIVqKYal+rt6cxQe/rQRZooZvCW/S04wpv4Ckw5eE
 hyC0VCAOYD+ALZKBDwAg5GqtYTV1qPWrBx5vrf4ejnlKCBWbexEadZ3Bnu3nrMu5O5EbGUJWk9u
 bECSn7G1aJmOl1uRrSQkrdRn35MDXHy5ZugnIxBbkUjJIRHeag52aj/zZBOQOACPonePfmBCLxf
 yii5JL5uGiC7J+GuvgrDo541rcb9vT82tuk8epCH4Z1hEuwElThIs56n+rpqj4zbDs8NXh4bqGu
 +ZSGkA4UAYFAJYFXB4g==
X-Proofpoint-GUID: lucEofTDY3fxGXPdcAKWbaKMRbMgbgKf
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad70293 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=phjmEUDewNKgeIt9zHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200023

On 10/19/26 5:48 PM, Ramón Jesús Miranda Hernández wrote:
> Hi Konrad,
> 
> Thanks for asking. I have now run the negative test on X1E80100 (Surface
> Pro 11): kernel 7.2.8-arch1-10 with the icc-bwmon PM ops removed (patch
> 0002 reverted), then s2idle.
> 
> - Duration: 10308 s (2 h 52 min), suspended 14:23 to 17:15 local.
> - Residency from qcom_stats: CXSD 100 %, AOSD 99.8 % (S0ix), DDR 100 %.
> - With the patch, earlier runs of 849 s and 880 s: S0ix 99.7 % and 99.9 %.
> - No CDSP crash (sleep_statsi) during this boot.
> 
> This contradicts the claim in my commit message that the qcom_stats "ddr"
> counter never advances without the patch. In this configuration it does
> advance, so reverting the PM ops alone does not break DDR collapse on this
> platform. It is one sample, and the runs differ in duration and conditions,
> so it is not a controlled comparison. I have not yet read the bwmon votes
> from the interconnect debugfs before suspend; I can add that if you want it.

No, this is conclusive enough that we can drop this patch.

Konrad

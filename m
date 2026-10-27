Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098717;
	b=gkl0nNBnDHr9kAOg3ro4RKsleEGWMZH5cEYhgNSHIA5dBzdxPW7XVce6sy2wIWRe4wbQ
	 YDH/2Uex+FmeTOZyTNZID+tVseyL9NiLtvJiNmaFECt2J2k5A745uCNq14s+WaLyUk5zS
	 p+uJnnxh8ahIRn0YnXzRfzisVAAAVQ2wl7JtrZ6rMb8r59MoPu0lsRO74HCULIQPgvaTK
	 cnYNyV5z6wI4cIlYqLJHa0yqD8na+B5c/i331xAeYJmrIzYjFVEuxFgyHCNclZSSgnoZu
	 sR5QwYBk+L3An6auoRUALJwEDbQcB/SFnmozKT3FtqEb6jWFDQb8IosbIbUw8jgjfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
	b=c+AnPdKdDHaKZW/kCvjnWMioK7guieA09rz5izG2ex8gKnYzMoRwDNTrR5+VEJwFwV1R
	 WQNQrSpKErB+8p3oUSixj+KcXFHl7V1Gx5bB8S2R4Q5wZl/oXSPB0B0FviljRZgNqOwhH
	 0/p1ruoGSzlY2oQw/nCVsVcsXmD+an4pHDy7DoAKCGdhL05tLnVl9x7iPVf6+lR/wv+Po
	 OeuMLtxYcsBHyBpPml7PKeYIGm8m3I+2MK01lDf7gIU7v+lFaY7VZV7fG6Om722xaTFxd
	 6zpGLkBBC34ehqIujFSumTd8pOgYOOAgL/2NGF9u9KyO1z10J7fHBHjB64LusLPveFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oJZoJ0/9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxZ+9AU0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57B606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A57B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJZoJ0/9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxZ+9AU0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7A5432894
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=; b=oJZoJ0/9L2pXvJCh
	+AVIw8DAlppSxDwqHmA+ztXhBrZicpi90xg0i4uVbavLGD4TxqfW4/8pnYY3uoLE
	5TP82RxR+ZdichJeAgtBHVgVVdPwmXGyAS/pnUYqaomZ6IifePzOnCZbZRUg3XNe
	BCmBU8fy1eqcFAxQJiHEF+L7WNzkD8Zlht1A5g4QCt7LAG8rnuk9D3ZttRD3x/hT
	uafdrht6QPuzHefl4I+tYtfovrcJ7XuYWfnNwZpjQk1s5jC+SXeh1f36cnBCBO+I
	LWTS6Uu1Od1RU+YjJTHo6AxspH1gZJxt+EyxXgUGQ+7YzUlFsgQDzuO4yoROlBo1
	p8fCng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ke1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so15744341cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098716; x=1793703516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=YxZ+9AU0VWUhUTxy5+MWk6jSwVJhXN5gU84lM+ID1BdggY5/RIoS48VhcRSsn6nOmw
         R9BGS7M361GlVeqC1Na+Ij85G1zmi+7gFfd9jk0Qd7ByfFAadk8rrxgP6qXMrj0CpMQu
         L8BKXrNXin36EpO65ne+d+Qbc3LyuPeJ+GroEa8uHQxt+dsetoIMOhU4QGLT19r/B1rl
         b/ZzjyjROy74Vl1/ELEtleM5XW4aO3RiY5dRUrwjdtxWkjrj8vFkbOkIVDTh7Nw64iv3
         hP1Nm3fYeuAPS4z57pcwPHJtGEHWUi4CM4tfZ97Rut4AOTiZOuDjZwlnO2p5o5ZCtdZ8
         MC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098716; x=1793703516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=WCsn0h9CRC8uVL75oCHxc9w8YiBqe9E7+XuoXeQAX+IYYvTvCj06FaJzAGCQrbHiZH
         QI1cNVrtdTky4DjxPcRJ5LXKYhLvRuRsPkHFALTkZ0D9IfN+puGYVz5aXJJWuc5Xtju8
         U2jW/MeAmohaG7M1UTlCxYbDsAVH3nXo6hQ6EksgO2Nhc9eO0XxxBgH07SADHXPWWKKd
         0vC91Q2CTOltBtgvHwFdjqTf2HRoi7DisosH+IqVqHNpfZZE++77RPfuNX/pfJFmSghN
         rlGnLacBq4Tv7oiKqLEKarY7Ho1qkYQJkwCNbx4JoCt/NIwlh8Ka9LF/T6n6PW7ER9mW
         cl2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx/HJMHiz0pvNY9DqmY49NqyHmTjvY75uE1JWaUSTyvPUauSiA8WRvmKL/liPdzQ6U3aNnbgXM6zP58Ez0@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/+o+5KzyJVbJzejScF9OYHkekQD0dJSOi6rwkukZk7fJ9NtOw
	DRKlK6zG9SzrWSY6sbNzZHQWJAKGJooCiboFUWdPpZBv2+QBteWb9XXvurPlT+MYAiosuXGEpI4
	KwyBzPsj6mRok9tVW10Z2acmyuBgDMGMcU8RM7UbKTTwtb1QvHEB6+MyaYLywBTT29X4ZU6r9AS
	on
X-Gm-Gg: AYBFou0L6zJzObdhQMKS37cFMZm6wZZpdpNbFPINNoQpqSMhWmQqH0nqRL/I/pRUQaC
	hmW+XzqpDyB/neA4dl8dI3INVuNwhH9cPhe+c7amtZBW8pQMt8SkFmVdTFv2AJdaA3orexwaoOH
	eIg3GWLrnh2MZtEOeHdpI6qQJ+qxSGMSqYWiAeUnbu4nT5enEua9pC4dbQx6zABr6axY3mCPyWk
	RfkT3B5YmQqrL+3sLFGwMOI2j4hDZuP8Y332JwzRlC7uoNplt+rCn6Ya5rSZZkq/cpkcPXS2nxf
	8Skr9x4EEi2227coe7EIVwwrvaUPQ4Kl6otECkqHSfxINJwEgCKDMGdAGArzv96+L4bp/eUms4+
	rUVxGAc6DjkQcM5TQi1Xn4Q==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148681cf.0.1793098715605;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148481cf.0.1793098715166;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm438661566b.73.2026.10.27.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:58:34 -0700 (PDT)
Message-ID: <a0f82960-be24-4d57-b12a-b6f5078ac64d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:58:31 +0100
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
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX81WpLV1IbO8r
 +N7ysQ/Yzp0N5ZqWgct52BQCzsXeS0/A83DRZpVTdQFaJAD4MAZ3R8BVh7WGmpmplYOKSnVWxj5
 I1KWWgX0YU7mlT+tn6eRqlNYxEbiL10=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae083dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tfqOdNywceuasvfARf4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: x0rG9edSSMm8J83u748KR9xiRhWIXwxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX54fwqZQgzxF4
 zipr2FwThWOrywy+jTrAMSqc5g4w1OCsLxzHKpVi4VDTfzLq2V0D29JWt2CHk/hpzN99idxKeX5
 38V+dxjtRegrXyt+xoUtKbD0L0DqO/OXl0NWwA2+Q2RBhWFB8tlYPX0/wKjR4t5n2w9S0K7fdck
 yzVKFYN69AS5VhzPJDmSV9SkJFYo8V/fUhJJgfwZIKMS2JUO8BCX5Qv/WBfTOmhxlSC5sO8KY5W
 VflmcXN1inWE7TTGG42qcUC8Ti+kZ4UvbKSIuDLQpSoNgKF/U5fuWiohCGfUBmzuVLJQAh3sZz4
 CGf+XVp5Hm/wx5APrepNdILIkmb29p+L0wP5+9RnpriMld6CylmObssTf1leO2/sIgoCjm7cTIX
 5gTClooA8lBjQeh7Dcw84Sl+G5QwaVQ9umE0DzGe58WSaWuVuXz5rhwsaCM0Lt8fDsRj8eGO2uI
 pELrNnjaJjTyTEEgKHg==
X-Proofpoint-GUID: x0rG9edSSMm8J83u748KR9xiRhWIXwxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483694;
	b=EBCRA4cbtZQ09zTLkBjlEA4NNbsOYXf7+udk448eexzSOe/jAvG9cWTxb4pywaWOM2hb
	 xTK0McGOlIHilHsuk+28tyPlAsyXU27kLzwTP0oVQJczLMSZcefdKtsMRuFEJg+0B2s4k
	 QWDo6P1TEjhkK8kzzCQ0cBGszyRq9J5vYfuRm/a0n1jWBKtbrt2jZYj917OQLFbNkoh0m
	 4iheRPLn7olR6uLyb70aaOKRIakZ0bLpUr1VtTfkJl7i7OMcf4Y2+PFYE3k22LhScnyMJ
	 O8LhNIVAgSKqkYO5guI8bx7gnjk+yyOh0EiQXTx8+DbDbRonUrpAnmV9k6iegm6t2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
	b=HS4JjTOEnau6bQAHShBfOsO6SHEw7LWEJJmHHO6s4aYvUewn3/s+4Wg9WE57H1dvTJ09
	 Lr/ch8CnYoaBC8p5gVXLjFPWEbM8fhzrdMXTnqwhlrjUWjZYpsvuUxnvz4fG7xSf+UDEq
	 g0cBwySOGWoyuAIIzBWw4iIMxVUpn9wZWsoNmHXDpd45Sbh669FG3hidr1R3J3N4V2j1O
	 OXwlDeUWf/PInMioC4apwFf/LFuXOD/nB/Cs3TpuXAWYSbVMLBbFczfBlpAJtkJA+g8B5
	 4ffxdvcO1c87d3NEAI24L3nTJK63eRsT2UXjf2jkdgZzs0f+ErXbizFtuoKIW/WgAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVyf69WA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3E606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A3E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVyf69WA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tDRG620133
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=; b=aerPNKxw7wfJFNAV
	P3+wHI8AApAAaTn2kvTr+XjMwXuoiqR/q7BSsxWyH14IzW6s+TMKZ3r36sGdqYmC
	8cYgSiGmhDjgzrmbJ0zViuG1KO6mWlEI8uesD1ljK5CQZ6JqaW1PvrLWbyXsErGy
	GMkYwxlINToMyV44lO3TuhtgCBPZ4pcsiT225fh5ID+idm4J0NRtWRtO9oBcU8Fr
	8GgXSBQihHC55w+aSZIhd1BywnacLPnBX2vuCasZ+6zR83EzqTlzrLKemx0cLhGG
	r9TRXUCETf95XI0AgdQIGeoYbDqmlCFbkVhW5Zc4lKIwHwe88FrEsq4zzkSJ8SFn
	q/21oQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsg3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:08:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso56689485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483692; x=1793088492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=DVyf69WAXT6J9OrgSh0AJ9MlReVNR+nuEpwCh8UQKBbOuZ0c7MbdXa11ssK19AahZD
         /QqsW5L/zG4jOPnBHEXpW2GYL/EY/AGthH32iwkAqiG20NCFu/KIg5EkAClvTZQ5UGxt
         81mlU7Hrb36RuD4So/vyR3KDVhSBIUPBhrBSPPBC+7uvufNkRTApB/kUjLfrtrfG6eJu
         q92DeVpuKu4UH0i5hVoR4MZ8QwJpiSjALXKh06yYioPttEe7wX54C9HTqFCU4i8Pxpj2
         52sl/3pohVinEkWtlStcDY7ofcegsNsZHtsqsriHFfE6wX8aVoscrrV5tN2N8rsNFOBV
         6xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483692; x=1793088492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=A7RvdsAghIUuOWkxYwfqOi/fXRRe1DxBNaCAqt12JM0QQwMMYKoRdCUxlgwxt/VJAQ
         xgsSfERtqnauSN3MNM8m+B/un3UE5BtZsMXudKtX9e16rLH+MagdWeYViie5OtBJmc8a
         7ucWqz7etMRXT/qS1jgF1EZCG1MxyNuwkAbxU8BxnqGmYR+VIHQuLlyNT4GxVLxXcvje
         I8awFx7ect5JfpaYN0S6J1kUf6y1FrXUEdSt3GKMX5K2qXTZJZGwLoZQoXpc7mM/DQf4
         KSmiMr9huqcP3MY0S6hiVqfCIXwAekgqwJ9yPEgH+f/i+Nj8ZwpqNM55HomJCnnYOAt5
         xMXw==
X-Gm-Message-State: AFq9FYJQXk57uM9KuAEWDpuXLbnOgVF/GCuGNDkBjlbbRUIFWG07kPRg
	nQlby7IVnZtSPF0XGXNTKUVW6pjr1spWnDV6cAPlQjIEUczMrgZjJeEyohqRCj54ZZImokUW71a
	VzuY+Q57KGeN/fF2u1kU1+2Ox6VyQrEN+nXeVsfGOoLrbMYM74h5+0xNxP3iSHmsaO21j
X-Gm-Gg: AYBFou0eErPHcKQaIk8OTPvTBK1JAHuhIvdSU/qrNfGWHHTY3CeB456xENh7obqt/Nn
	i1OtC+Nx3OEYY/zYs6QPF6j75odayabQzAos/1ghc/doxEKBbyYu6T2gmi9vd3R4osYA0ez6gXd
	XX+C7wS6DWA2QQD4oBnr4if4I/amToie5W7f/SoaTca985zdSISgFQYXZ6ZPIbNKrWZuv1R4On8
	iw0XPIIBAVmuRyXLRovcZCbb2/3tNCt6ZLVs3SrR7DI1uuOfOefAYN9QAWq2cavV2N5R+L3pW1N
	K2UF6V4AdDHu+NYz/2WBHJnag0mAQDFaVoK/j+1nJiUhBf3/hMRcjPj1REbgrjqhwIXFpcZn/F/
	CA2XjsJZQnEUd3MSrfeR3PQ==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910508285a.0.1792483692492;
        Tue, 20 Oct 2026 01:08:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910498485a.0.1792483690600;
        Tue, 20 Oct 2026 01:08:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3af8e926fsm3811663a12.0.2026.10.20.01.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:08:08 -0700 (PDT)
Message-ID: <639549d7-9e63-41d1-961d-edf38f6e5e76@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:08:05 +0200
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
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: add
 notification led
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX3epAeh1Buj8p
 KhITHpzLGbnMebgPKOnYvFItj67tyX4fNS3dTCCgR0buJ/xks1vjWBKo0OXAOkWoR5mcyza6vrn
 ycO9Tk5MSDl1sp38dsetPYd5xoV9scs=
X-Proofpoint-GUID: bdZ0ohJGKH8iQNWirzsrWPJu3WsjpS04
X-Proofpoint-ORIG-GUID: bdZ0ohJGKH8iQNWirzsrWPJu3WsjpS04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX5oiS4K3FHWaN
 qdTUSsUNQ8jW16SiZrr/BtH9FsC8JGDsZWU2uWg6umWhntangR+a1L3OdhLC7l7K77cQId4VNPU
 hlivPd8eEeUSA11Lrp1xjaltIYxyCMCJ3fmFGYUKwfDWPzsqyVZxznfCkvHtBXnuKetv4aAp3E9
 4Leo9Npb382ecLmkiZQxHJC+e7LZFNWc/ztX6ipwUChcSrEapvVbo/ufY0sIV6BkyuVOSpPJ6wo
 37NegfWR2HM/4s3obLEhMCWET4ntnrIPOAAxK4wXOw/eO372zyJWicJz5T8oUKvyYGcfcb7qgsg
 yE47eT0ehej0+G7R2AHQTSlk478OyCDKZmSy7n2jfZTIr1cp438kgFTa+jHNJlr6edWChwm8ofA
 3wx1MhkW6l+bbCnwmMAnc9xudTRUxAJo2mwy86EYFDTo6xCIqNM+OBxEi+EyqoJlyuS0+bMYHCA
 +jWCwgSIXvQcKXVG8VQ==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7216d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=C96mxyFFfAi5t3y68eUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Add the aw2013 led-controller node for controlling the notification LED.

But it's already present!

[...]

> +&blsp1_i2c2 {
> +	aw2013: led-controller@45 {
> +		compatible = "awinic,aw2013";
> +		reg = <0x45>;
> +		vcc-supply = <&pm8937_l10>;
> +		vio-supply = <&pm8937_l5>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "disabled";
> +	};

This feels a little sloppy. Either disabling it where necessary
(presumably a small subset) or moving the definition to the places
that use it (if *that* is a smaller subset) sounds cleaner

Konrad

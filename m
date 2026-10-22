Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659674;
	b=XPVQzFI/R7woMbOkE8ZzOsmxt51U1D09BMyO4fzOCHzU8fqBI05ByA8d9Q+XYIZjZhsa
	 htFfS9ufp1xVfU5ZH2z7MFKYTDudyfwqlpbhLgs6INfLFmGSjAWXkvUdIkR8FPddaX0rh
	 dYviB0Hxz/7IGIJWBle9i0tu0NmuI0cdzoek+4l+F2Smh8Dkxgl6WRIMrEI9qFusQFyxN
	 +Xd/jZcr1dfvADa/MPHrdPLCZv+IC/He3kj9mZ3E1lrgDzcZPRNGGu5rHHJhKjlG+mDtp
	 7UszywO8pS7SEfx6VFWkpfiQdpo7/dVvVHsClT4Uuv9imS6R9OiJy0Km7O45Hg6uq0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
	b=3TVZy95o7rzIVQPqIgsftXUKj1p8OBpnryXZa8NjL1FLXNT5rZBUCyIbrV4xh4nGj/Lf
	 n6layEsR/JxwIf1Nxfs69hFEWRaGL0HTr5mtPjllfntW3mNu04M8M+2h/fDSABCUKfv/u
	 1LkH2mMAbn4WnXWGh/lr3ktYiIwV9OH2ZYaC4G/dqpbnH0TEOzUlw9CxoXFFUdzy5aYfi
	 i9dW17Of8u64m7L/ldnrQignQ8JYPcs4vqsZ9gBWedg+UGVEPqim5TsD4dM7/iy86aEFo
	 hcd6CGwmUymZNR1/Vig/LLnWv+x7Z+W8cPNNwtSBmg6lYIja7RnYN3+GdMHLe2Q2oCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15283606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15283606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Ln1o3194744
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=; b=A4GcoDsQ3s1tLMOD
	93C9vquARc5OZFaKq6iSUo39AkrKSiLRQJl0ASUrpurgKJT2EXSCdBcxmc7bfgo5
	hgWrzVI9CK0P8ShQdwpezUPELk7RoqBpxpLdMEAEZZJHDmsUeV/693eIrvLOWZdD
	pyNbAdgrHeNRVqV3FTTn3DK9NtiRBi8pW2QryzxJjGKJF7KIeMjQQndxon4edAJE
	fk+dRl9VMn6XgAEfkYaFiUvgcs79+wdpBkM+HzCSqbyhkLfjIrA0Pl121T+ZN7pp
	HRwzH7FWIK0VJHojiy73L0ie33Un9mKRH6c7YPV81rmbbVeD539OvuJQAfa1Odp3
	nQCs9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq06f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43712285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659672; x=1793264472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=I01lsz4S6k1C/fgiDZ6qSLL39pagh7fCsa5rxqlwyEeQq3EAA+JznN1DDduVNp+OzB
         0J0Sr2OfJL8wNo7P1YdjB/I4bax8FeSQRxY8oU98/Gct0LTSaxN5PQXcZNm+DsRZzmyD
         tm/tEIEdOqFrCObLjhJoFGzgXDHka88OUBXbbZYG1xIgJErKi6gVjnZIcCLVtsTb9eXl
         WRsZ4DcWBMJUqpQXCbxsBI5cpevkZuhCbTFLEhHbV7MVzz6qBfSTegYJyXfessEJhGdJ
         YDfJiHetQhIEX6TKgmlZURdH2e/MP14HAIGBUfFfY6d4zGbfy/rsdrheOB9Onr2AsURv
         Jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659672; x=1793264472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=JOgbBh5Wjrx5wI9M4p4e696209h/IiXqxIe9+MWXL56QDnzK2hs97/jCg2UhHvUDAx
         LdsPmAKvsaDI8IIZ8MSCeML6NfV10wuQhr2mgHSo3Zk8dJND4nFVnSAj7BM1Mw9PAfQG
         C/lu96VSbBiHjLOwgrtwbKIxFDstdfIzIcykt6Y2STEk+Y1PRdH3QDFm1rB5qiSAbcE5
         gEeZO6Li4UijLY3bE2MAPK+q6TBWcgf9FHkcfIyHBcK5wni+bYDAlZGz0RBfQH64dqip
         jYSJlc3BT/eFubikcBu4jpeGU0y6KmWH7xNZE4JLGC1ma2aw68V+SI3ol5IRFcPrltBr
         YZAw==
X-Forwarded-Encrypted: i=1; AKwUvBxcL0zOnLfjJj2ondRO249f3kB36FJrydeARe4pqD/zx9RfKn3jveAxS0TVzpeBBj9l+qA78ru3O1Nt0bIZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLEK5291JAhYsDubIeNkfNLJnFqqUt7Q3+QnVbrD9ihuzAQOZ2i
	pbTASEF1YZ/IkCSksFi54fUkgH/YKr7Bl3mSryQAkaK8aiP2PnB742rItI7GkzaPJ2bFhb0UhEw
	eH75s0yEPSqDhidwCbWF5fcTLpgxv0Bpq52OaGfNAVspXjAGAWSArTOEwD1zkxhvE6KUT
X-Gm-Gg: AYBFou3NNalGXVFR2RDXcr782JZh3/g1o2Gtqrwghs0lHfYs8D8HSezxCNazfVNWMWI
	2p5bw+p/0Dke/rr8WI/CgvwpMIdMnm1DXCdMkniEw3pPAxZAcMHo+qevz5if0L3u+nq9Uso19Og
	8mbc5h8DzI2IvniLt1WB7z1ojf2nvFUr+w118s2HI+cVv58Wd3HKVdbwpI2OkHho1rG2tRRgVBi
	O+Nx7J7V/jAsikytW60FQF/thrJQgpWeqlnAViwLuXeQoudRRrnZebDwaCO0vwvH+Of4wZLg798
	LlF7B6y5SmseMcDlbICo0vvl7m3tGGufmjx7W6uDAjmTgzZ4BT+S/bSfj2UWbJ8rvJvsJoO/iqT
	FrpWzZOk3nF1oYkx3lHInHw==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984417985a.2.1792659672287;
        Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984409085a.2.1792659671687;
        Thu, 22 Oct 2026 02:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcebsm83458666b.30.2026.10.22.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:10 -0700 (PDT)
Message-ID: <6da23245-ce68-4b61-8eba-323102a5b9fa@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:07 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VHTkCG9rTyXvZScIm3S4aF9quFqC-iDT
X-Proofpoint-ORIG-GUID: VHTkCG9rTyXvZScIm3S4aF9quFqC-iDT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX8JIm+qGA8zFP
 BNXZouOnsCrLlGJ3JSXxdMmBYrKsFBfjW6wUDwG6V/Tm8Jz1ijm/akPOh55GL6EKrt3YmIkrv92
 quNmBDHTIsz0IieZFmhhvFASQhIchk8=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d0d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1qrlJkut239GXpouHx0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXxyGlkHXeViy3
 8y2nyt6kHOQydz0qtR4rdsNFauLZMmAUP/Ag+Lmt9gOBTlMca9I4OnxxMae9FiNubcdk6v7l7n1
 ZG9uV5lZp52OrveQGIDflqv9InncLlEYb7nvAzeT9PbaZ0e+kZ/qig7mTsp+TnQg/J31dry38Hz
 UCEIKWO2tij1RLS/lNO0ayOz918byBhH2Dbd3j3haTeQLMtjv6UoXOvGipQ1h8EKc2+joD1dyMV
 dvIXwc2mN9ww6LNx1xKNwTqXWX8RMaLCD/w2WPCia6mO5F35rJRdBRnexQDm+5uIvE/GzKou4Ur
 tteA9U8+4unxtv7pFaLOeBVRQ1oD12aMON9Io2q2z5wfWHwHnA3IaPP7wL2fu7bKB3dpeFdiSQh
 xwdek/cnT9kH5szGLqff3mhKJmxafBGaNUdg6DQcWXyIiJyMgjlo82fKdIFkWITMIIsPAMm8PCA
 6RA3QknvP8IHvG2cItg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

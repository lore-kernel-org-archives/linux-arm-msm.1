Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208212;
	b=f1AlRkVJfsX1f9VMargaeNEwOveVOCk76l6+OY61ZSrh1DVcpRJsEeTmofHwqjXaiXOl
	 ARuZi+JbnBTmab5m0oKjdX+V+BKTn/X4iO95whjhJ2tEsJTDoi144bplBN5Qu5ZkDQyJ4
	 HX9J8d7Bx4wieyXpTCW++EiJSEEQZOPc/L1SY/AiEV6C+ew66EviC3ooySCrQuYrWhhsf
	 8DIBJW05mNQ0i1Ty0RJZzFyh9XvWhm5K0Jx6srLb1M2Id1KIr8w+p5ynqfA0G8ppKfcyI
	 UuixM8aCGb0eHG32MZ9pvDAlUo0+AnkXhpnX6ylaBiO3mzwlkJUCkXPqyLtX8PvyLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
	b=y2Az2qgiMYxM4sjKLv9B5OwbvTNPpfvg7jd7uqtNvgSAGSYPkvoIxtUX7vNgf9gtsTsw
	 868JBhPU5+llLkY215lN6lDDVesd8mak2hCa/W2P+9gU/F2ckw7aHanhQD2v3ptbpfHsX
	 hvRy68dC+6qbRU0CirxXBxiexHfm4UVcU8p2UqajYu6D3yawyd5p08AWFJEzgf0lX3PE/
	 ff2TnWzFDJ/JDut2JgZ2ZNI/rQNOwRpMC1FIngo8OT/ltejTzgQ8P5B7AgK7kXu8Tkt3u
	 ruYsu4wGs4Gf+qEvUXijMVfOpV/F4mFq8CD4X2zidNmmRR4c137ccniOFKWep3zLBTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D04606D804
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 07:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D04606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AYa0066308
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 07:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=; b=ejBy6W1kN3yns1U2
	17zJeRDHK4VWzF15HXswJ5WLq+++LvoYsgJZz45PV2ySKkNzW12sgxZAdZkZb7vk
	FiGzT9m0wxaQw9Yq6Vpn9THhsAaZnBxkS43MFA2hqsbW+n0Ri+ojzPQOKDILzzhP
	474tX/AZztr6UGYNcFnmuKFK/hKBn6XV/CqLMgZgG2oswRkw0zlchhrxZFKPIihv
	PBaqkzVUQSjJe/Q3D6cTwrRC88OPOytzqKbeg+rBWJ06mDMm+RhxxLjh27/7nhOF
	+X5GK5luwYrkpBaGAeLNZYtrXvOJvFUbOIa+/Hpfj4J2Ayio0ZtAWA81JI/zZuN4
	ML5Tyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxd8b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:10:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso765088eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794208210; x=1794813010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=gGIcPeD4+YT3mxAvVzH1WR+UR1gtJZuBkSGwlwYkIn1tZWNt4bC0+wZz3bh7znik4T
         chdgs/bvEkwBPwZU0aXP6DhDSYXIB5L0sCot7XcJCLmmMLimhMV5vxU6c8h9xcZ8xX4M
         Ne4n1BAr7oQ/zJQ1GEo2hX81UhyLaPUpTlUo7HHuXOG2rz197sDc62kSymZYA0NarDf8
         qspTrBIMl50tbJ3U7cPvm4lWhb/JRMCn1DvWw9evQAzLWX4D1HnuHLOUxNasdvOrDZYg
         sQ8znDHAghb2Up2ktRT6wzti+puqNXXo2VrIm1KD3KPifVvsDW6j4dNhVzgTR31vQgQS
         /72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208210; x=1794813010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=QIEy5TGqCAkzcNLtzSoxP6vZLKESDPib/LdSZYAM1tcjhfQXEyQ3rLWNtngnapEfZ3
         qd14X84l7otIj1y8470LSUDJ+56lTCMIZDXj2OPezbwFNbXIFEw3fGA2CNeQWTsf1yZC
         qjFlV4uzI/iMtTRs8wUisRTLXdlA2ho2lNI94AXa+9+Vc6mneAZ8lghM3S76fLFwhTJA
         OVqvicYm3r5Y4m+xL1EYjUsUIuRCYAbmH5+8LJDyHpyr5PAtD9fR1GzYjz7lwHvDXU2+
         4J3aUQ/oQSlen8VSxTe9Ezk3TvYdrVR5QescFZeIh7C1maN9KrMGDGIHgLOCv3lxy5RB
         W2cQ==
X-Forwarded-Encrypted: i=1; AL+hErH8qLQ0k1CvrT1eFdhFEPiK8KE0+t0Opj2U0QXO/7Aoox8oP+uBTsjEwUcQFBgLRA6mrVn25KpDcBTTUnKM@vger.kernel.org
X-Gm-Message-State: APuU4Z/d+oGZgoQnLlZhRG+vJg9WGHar3LAutuf4Tynqy7KcMXjUPHNx
	lXoeHtdJv4HISAG/7Zwk3XeKGDfSanK2opPt9ZfmHuRU+NT63P/rIQNNS0iDFZoUAP6DnLl7Ldf
	v3UWaw9b2fYC3N3s648VlJI16SS93N4jG66i3qxeXG1NAH6tGt3pKfbOwF7goTjTt68Qn
X-Gm-Gg: AYBFou00luvYyyIsTM95IQFPhshr8lKdSCKSZZrXOxvAJr0PfiX6Fai+1EelNErQ1Ur
	4GcXi7VtSb7NyEjcbB0CAaV8egI0IgTqOyclX9NEmJzfG6BovTxypOoWSkq568g83hioFYtG/AU
	Kuxp9KqEE9S5vfm0+MJsEp6q4c9IjpXRBAZzudUHDo3PYDwmpeO+UVtt40Xq9eWetGAp4i8Obp+
	iUjpYoPxRw3SEgHSsiMQfgCkqeTr59aQP1sEBLjC0N7APgofi9JaRrAjDsttXbP43VzdOHyPXxv
	MWAzASVv3JuEzSuP1ub10rbqjAnYWgHP6ZGK7BFCtXaUV1PDp1KX+iAGTdSR/kNN1ruoqDE4bbB
	vCa3YZIbCLubMWVlVd+P7EqO0owlwmJkhDG+APZTxC5QZjdq+vFKXGjbbUHp6HzALSNSxH5LFcu
	YrwQ==
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10704009eec.4.1794208209590;
        Sun, 08 Nov 2026 23:10:09 -0800 (PST)
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703958eec.4.1794208208772;
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm11423638eec.20.2026.11.08.23.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Message-ID: <20300428-94fb-4ae1-8096-e6851f5483a1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:40:02 +0530
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
Subject: Re: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9GtBBcfJDMqgH6HfwXE2Y9wasvaUxgC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX+QgYX33+zmS0
 45u+okpzhRX3s7q3WNG2CPvuGoqtd9J4fNprXvYWZxInM2fEtOuBP3DlxxLjVsYFuPf7CvStv7C
 HW74B6EPJpcVeBP0i7iQeUGMnvbWJYJbpaYwLPnSrMMgtc9XzvdP35doEVxAoqqPJKauiDfYnDY
 c+QAIZAk/eIPjPLbo6pN5PJYqHEo8Vxp4XjAiOf4U/oja9IGtifczHWxrlaCW1tVBg3IsjOMEvj
 7Q+bpurk73eYSSFgqFnW3XB4AMaFqnLXxYAz2ygQq1gqkVnjfnk6zib1MDSS26ii0uTrPbXlKUj
 kcMsnQlouvI2UnUT+3k9dEvo/LdfeKhvQ6QayoeR9XMpuxDT6ZifkLkbdS5kLck1a53aFsKPY/R
 qx0rfKJ80VdJa11NoI2Wxo3AaSFA5kaLSRAgtK+hAyyfTnSUKnk0p5/cwIKVg1ope7X6Pa76pot
 F3bUxkvCar0P4MQnjrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX7NrVTGVyDQ2Y
 5rYg5ynLeyeMGfwG/Yd5O/v0EAGUxTThoYFdo7t1vUd1+aX+ZV+uwzY4CVqUnvs6a3F4tCT6Vpy
 lMcnESByAYgwFBXuIpQyP47sugw+4Hc=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af171d2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=r2-LxIRbSL4R5ck5jzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9GtBBcfJDMqgH6HfwXE2Y9wasvaUxgC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090028



On 11/8/2026 8:48 PM, Mark Brown wrote:
>> This series adds QSPI support to the Qualcomm GENI SPI driver using
>> GPI DMA. It supports single, dual and quad SDR transfers in controller
>> mode.
> 
> This doesn't apply against current code, please check and resend.
Hi Mark,
Thanks for pointing this out. The series was based on a slightly older 
linux-next snapshot. I’ll rebase it onto the current SPI for next 
branch, check for any missing dependencies, and resend the series as v2.

Thanks,
JyothiKumar>
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20261021-qspi_upstream_series-850249e432f5
> 
> That's a random -next commit...
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601334;
	b=NFeHWUImBkfav0ntFTM8bVp7olay6hRiXiuQTzB57/GcdusRR2f5AfS4eW2XDAHFGaJb
	 ouCnmz3TMz9j1TSi0MTlhE03u3jhiBDST2rl7d4CrYLXmuLLS2ijwQL0fQAqInht3mH5A
	 izBOTVRnpcFkoiFYe9CObuJMBlu0uhFtwz07f2lx8nH50fDvVPUjYp1K5iNH92nx8Z1y7
	 lqEZR40vh8Q7MrnXeoeKVTgNgxLMY5B1HFG2pgB+8/wbf2H3wa00FIzaMOm/BQuyP03Hk
	 cGCaaTQoqhX1dJmLkl114Hl4/VuCJhIpa7X8bVaGhZq4Wr2Q0u92rWT+BC8w4CbLd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
	b=RRKc3NSoBGZDFu1lWoqJkzGkpL7gtvuuEmsY/8RBNqrwUotxehTZTqS5h6+YWT7foull
	 jVHCwfYJhEdXAgmLPUuth/n0layYFCGms5MsGiJ3QfF3CDMrru6GemYGrzlrAPUOLDHK7
	 h1DI4xKffhIlPQKh9S0K0et0LD8gTfknk8kxv0YzyFT4UucSwLizLGh/IlOP/DiwXn8i7
	 A70b6OHdZ0WTdkNeWMvejiEz7u7IEKCANd0wgt1hkGewVA9imPESxYIHNGPvpltS/Jz+4
	 fWA+fmix2vFa6ssK80Fch5xPfYKz4uTf643v/7/AngS07s+9gktdZXLQ1FFZO3yFdOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF477606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF477606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QnrnNWlW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEey4Gzh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mrF33644047
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=; b=QnrnNWlWhHnupilf
	OCjw8Db2iEHVxnhXqK+UQbGt+FscGxJMWXm49viFDvklzFkquTgNIHQYR/hniIj0
	aNqHINAan7Ipu7luju+b5oSeh7iugs9CqoZ3rHSwgd769VlGPDJ7OQXwX3JXDEqL
	RXxMZvGaRNTBonZb8xbDOyaVYVysKUZBoTtt5TYg6d7qLBk6/YS2YEEceTjO8029
	eVzX20ZA53mierDKMDTf5VsG1F/j26tJ9rNPVY3Th9gjetN0LTofl/o6hWO72HQm
	SxaqH1oKKTq2Z9FtxDqhef0wZCSNz7QAPxWKervOc+lyqwIItkK6u/t1JuixXzSn
	ttpvyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2a9mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533962f6bc9so11858151cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601332; x=1796206132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=PEey4Gzhuymafp0uZJvcyRKsYjCvjeRUZAJ+BBZxSiF5H11E0zWd8H2krelTIdn7OS
         I43bsofAUMki+IH7Z8/3UCamrtWKrkREK37+b5wJG8T463jaIzXWDDzuIb6QNZILUyVs
         gBJ6DD2B5D4izEn9tCTJ8KKzRpKwbzqCHJTAotuaRjA6HFCOLFZ5opdjhcM4ZBzg3Rb4
         T6xR/4N8MYgH4a5rfwGhjKFEtHDoWvxOV5SOvFBEUW4sNtgOtgX1FSZi+keRQbAZ+5m9
         sMHT5ZdYsy/6IxzVScYFVBtvWJ3SlCRwMqyIVmuG8S2xfr/rZuKpHvgrWWKweJhGdK+8
         Orfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601332; x=1796206132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp6vADU/yM8NDboyiV7Ep4k2hL9dQro074+dlKU7H6g=;
        b=d2hJloNE2ceUutNe3ILi1q8UdNVlkcrZN2s0LewZ3kAwXDpuXntA6uD8qLPDnPcQzu
         5puzZz3TShkcYGqtIMz1w2ijaPMKUhJnjsNN8t01l2VysXWow9+4uq3A6rz0DF8kojYt
         V7HQGxtl3eWYGyYmHoJTh05ufsWLC6pgGygsPo9B1JyV5N2MZfu/+DzZ5WET9W0LE1lP
         X9edjgcgbNiQHJShAsofI9t2TE12XCyYgRqWnQkzw0MP5SNz6IbUV4LQ1exUzeYhb/aP
         EcMbadzTI51FuoZxAQgug11cc8A8ccT2Tq3nLtmL58fqTFISisx5zC6k0qiConxr4Nv9
         rr+w==
X-Gm-Message-State: APuU4Z+y+3IKLFBO69AFv/Ldkkwxn9EFBfb484e3l8rV3Y35O7fKvOfC
	m+gi8OxiyuSMG2AJeMP241fDAnR9c9yQH5T125e3zme19lTli7p3+XJTYs7nPSOpicDLvbg37kg
	9OpwBshxhE/oMH1p9Ds8b2vhTKYqOK2NZFlOuxhFCORXP4Pr/DDHTZnauSHd0YlGZf/Ey
X-Gm-Gg: AZFdTZezOt9BC/vDl+2twVhOwL36ndYXUASDmDC4zNf5bNtS/ee02s7HxTRGY8QLh7w
	IYEvU4aSft46QIEDSB9M2LdYKrCL5YJrwhQiuAM3t6VLlrv2VTMdEfqjbFaLqdYu3zDtGbYrh/D
	wxkTXdTbrBDAUrtvMOFKQ2VHFQN1FdD9tmXayLVy2DiPZBWFgjMSmr3jj2a+njkH5CeLf2MshLO
	GBo1wYldZ9r3XQMa9uxWsV1WaIHm6PZuGLi7MZhzjcM6V3ZPe9gu9Vso1nc8Tm4u2fArJHb5Fv5
	urZx1Y3VWC3FyqSNA/6YDr+7eNu3IDwXvQKFYPm36E7jWUdBfDZlC6mYUqu9eQ0iURwU+fveY6F
	gD9AErwvZeaevQIQbnp6Z9BvES2i/IkrfalvdrxCgBLF95oFav3IlKMU6R1Cz7BSdAju1JDQ=
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522891cf.5.1795601332156;
        Wed, 25 Nov 2026 02:08:52 -0800 (PST)
X-Received: by 2002:ac8:7488:0:b0:54f:7ca7:1292 with SMTP id d75a77b69052e-55d76aba659mr331522561cf.5.1795601331660;
        Wed, 25 Nov 2026 02:08:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm604969866b.43.2026.11.25.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:08:50 -0800 (PST)
Message-ID: <929364c0-9c21-48d2-88a2-caf02e2fb15b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:08:48 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b3b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QM-UIIi6bNSMVGtDbtgA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: v-SiRG5kr2wEwh-d_LDg5-joT30ClojF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/z2SCbNIXfDF
 jOF0/Jxo76kDfMks27TDmjKldcMOLW2u/oMibej+LCxD78ZglQNOcUPFnbbiA2ZWB0qYQ3eZAeD
 tS7jnYodesMNFBqRb5A/a1y2mbAuvei4fmcDI8WocqRtN3siZbuYSABb5QqXU2eixoCLaNe3NvU
 SLs8OjiRa28E1hM63l60zkCybrkj0fifFTKx85VXQhsHZqkB0Ddc2HvVNbffux1gkUp5H/lcriI
 wCGjAvU5i2uLVzuGeg4F8qmJradVKVVuMhswVRygWmDO7Tx1t138ABr9tgxBISD/r3yD7u7ZWXC
 FSRUzOMeUBIzEVE8FW/KUioaN5603e4jJ8GuZMA+dBHiZNj8sbwSmP9bRKib+2ATqTJMu4Or75Q
 gUZkGF6TcCBe423sTxb4F1lBTJVlVrjWpvGAp/LKaM23qg5YE2hkQxSlCHe//KELfeMlTYzNGGH
 J2bnSDYBQI8htltBerQ==
X-Proofpoint-ORIG-GUID: v-SiRG5kr2wEwh-d_LDg5-joT30ClojF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX4d9FcRbHZiIv
 HFwCy3qWAFAhXhhXQHMa680CHwbKtI14SkdnbRbGpM1yrj345qe+aN56zhtFheGR1L5DBP0zIwY
 qK4TKYfGo/DAuH8UA2PEsOWuC7ArlGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

On 11/18/26 10:46 AM, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

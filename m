Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081931;
	b=pwegerwbPL8Kr9g3mXjZ81TrMJ8As64AEc40fD820vHlXO0gp46Lm/c2IPfmcUYRQEOf
	 e+kXdDd/OYUqlr/rdNXp4QN1mnYi9Rnp86fgsmREdlU+OtI/OMsufnSg03VMjiBRThnf9
	 MjNsoqspHFkyRaJR+RcBdXlOrHTETlwTXWJWmuEDHW4K4yEmgAodKnz/Ds2w5dw5NAifK
	 dsvsCSLbeLJ02spt3Pm94A7mS6ajQn5k3EBdz0oq8vwqg+MaEc180bPzWQz5zxHoXhems
	 +enm6ef7cFjCsCRwchCOjdyHU+zN6h1S1gkUNgfwI7HuWYZ/C2wPk/tvbxX7En00K0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
	b=e1ncwrFQfBYKVOQHGjLszO/kyrv/KAEg/ZFWKc+oaF0x8xUhAh9izkkvNp95Ttv/Xb7G
	 U3n4cma0rBIbI704e4J5FlDuwz4Z9gunNpFBYl8TAE0UywD83JE4ROsRevfCNhrv+qPC+
	 /f59wkW9I/n7T2kqqo15wQcs0BIcxir88ay9PUUl2HgdusHFfah/XsPrLTi6kLmuK18uY
	 uBsP13J6b4g1UshrzUNsI8r/ADjlOeDuHhw01mnNiTkKs/LJKpw/zlfEXgXAxsl8nUDnU
	 /xXklkvqCFTP4P+/SKnBh5Ql9tOvrQE24e4yYHi7TpQfGKaEgythll/5UbGCjO0qjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/1//x+S";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB5606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EB5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/1//x+S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wGHJ1534889
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=; b=VFyt1hB+9wQlMz+p
	hOTNWkff0nFqw6MVRCUzaZSOS4DLhAAoiXOhIsfPwE+F2FUyHE2/owOWSnfbZGwV
	AKtSLHpusLYDsD58Sq87Ajl8DyiWAKANA0U1Iyx+7EW9HKaWcOsUWZkWUpPyIjyb
	Lv9X/WVn4kE81U3rso7Bp4K3aEgM4iKOl5z9ZtIuyZ4fWGC/bRt65P79YzuVFQ0B
	knCPijvz8QYkZSt6BQDaTXKDXWUr7DxKK45ixEREdap8n5auGnI97+eh6+oYhhHg
	fxM9wftRjPUPJU6wjUWyZnYy0F9UUH6rO9YPnCaFJ17dCeIiXvmB4HVRDi1NMiNC
	4LO9tg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpccjjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:52:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde02b50dd6so521549a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081929; x=1795686729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=M/1//x+SX1LSinI/YBU/2HjQonY8ab9IMrHpR1/skqyGFYLRjbWy29ejKAoKoXUZ15
         GD/xY/nibitxhsBlXTBZnZxV65Of8KshUkKsqooWS4Jd9rizphTyXuodi+AlsXJax5W+
         fdxPtyc4eDYp/Bxy83qSF5ZQrJTiCkiif1OT+vsQWfcbacVDfV6Bida6qymifL4eJAqm
         heQ+RC6EvvMcoY3MSHRiRYlnpER2ThHiUppBSZxe/UyhA88/pjaTuI3d9rU7fNJnzpmM
         kZ90rx6l8lPs4KykbVd8wWB81aAi1aIud5N83iCPKbeWQXA0wECPuq+58CEaQEKHQbBj
         /5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081929; x=1795686729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=j92g4XFBMfI1mrP9su4Nd8yje9JYylIkKqAHS7bKB1Ru05BQVZGNl49kC0iJuAyqWx
         V2xyz2nX+MGJjxY4+98vyrqYVabWG+yMUbdTy9d4q8Jt3GbDIxZmMbGYUKF3DplFIHFp
         IpkoHi5ctOUcuvdwZaTKPkA1VYU9FvGo+KZd0IzCki7sra4taP/+ALjzjdZomY6CcJ6Z
         kWOARqaEOGww2Sqn9EO3rt+zEoQO7KHUkE5F/rMbTz1DYTi5VbNKRXse6XqneyTSLOZi
         jcnDutURJDlFinH/SDfoAmULr1ruw/hy7GqJqmNRAlFiT45QwKsHcGK47r4K1pjEkOs0
         KmRg==
X-Forwarded-Encrypted: i=1; AL+hErHaDAYYN+i31HCIlX5EFLJesEcdMtc8VppMtsV1l9bNvgWHyn2w02y5MspFZfMD21GOcHkzGSn8B0iKIuaK@vger.kernel.org
X-Gm-Message-State: APuU4Z+GB3g0aSb+PJsYnXlTUfjdmKJcGZF75jJwTMQapngiPzpT2nkG
	n9gAGA1RQctifhfxy9Kzja0sA3B1IY2vV7eI/qaX/sjxMsuqjox+dolx9P0ifv2NG0nmeLEOtzW
	F0FPGpaOoWbwn0cYHYXv53XHLAIwkXuxiWDB8WOcVBQxZfa8g4GeiXdp2/z5jN4Z/5DCs
X-Gm-Gg: AZFdTZf5mPykEvbxf1+Dqjze752chCMHDmBFjdtq6biifRS7xrZDC6kpEg9XjG60Bvw
	5QDS1fUDfft5oFyMWKVdLBViJhPJvIZd1ieSkXLxtMjGEMbEPcrb5+RSyI7ZIjRK7r25+RyodjU
	SOdCNAXba8xJvaLeRxg5wtM4gts7IaHdW8+XWU7ddJVOhOQvllKSwRDxbRabxnFlwRBDsNph2Qu
	bU5BmR8oiWk0mEvSbhXlr7r/dc32Jc94POl14VtiuNiClSwNBOgDYT+kWlJsYHXkl6PhQRtgpFg
	b0kDYJDh2glJaFJ8yvAjDGWX/F7Xj/70DkTYksz1iVL/gqqaUunR5ssgvduXvqNA9jloa7zXTwS
	IzbDn2MIG9EHwodaUKJc3kusz0AuHs816vttBtrs482mWunhxLAVrwjHLlQLUhU+7jL8NzbcVzB
	Vd96qaRKY=
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365150a91.33.1795081928900;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365128a91.33.1795081928418;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
Received: from [10.219.49.219] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4028310c5sm1189430a91.3.2026.11.19.01.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:52:07 -0800 (PST)
Message-ID: <813a113d-f4fa-44e1-9616-c01dc5577365@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:22:02 +0530
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
Subject: Re: [PATCH v6 v6 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
 <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afec6c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4tHaGl9kwi2XGHUKs7MA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfXw20h/fRRwf5u
 qhqdhraXH5uonank+J2Dt+XYuvAkm8xBpHZABXG5rpVsFYtG1zNjHt+2suaN48WHQrBuG2F9GO0
 NhmGEz+a29KhYGJQOAOczehayqKx/rDQWql7uMbztPYh4zjh2jc9aqtRUggSYyXZKASoxI605+C
 pXP1PL5NJY5ia4MoB5DI3sjfgSuXUWNgDkymZAzmB6TzG3g88cCEuXC48dRL3aFoRqxNWfsAXzr
 93wQFPUsdZQMIfAPHH0zCuREKXmRcTEDmzr4acfNcJKtRpsoEEgmDQSejiEC0xTBjgrF9Pqd5AY
 6WjGMyVXu//SkgLlA9ueF0TPl/+TBwbiCsF/ygZ/0PCFAuAAlo3VoD3KeHRN+AVhfjPcQcWBW4W
 uW3Ll2CGCLWYcOjyyKBlWhQh1Dulb+G8cMl1C6Mwckxwh++KvgIDozf0pAFdpyZ3Fop0tJEUsgv
 mnUkiX5vBT0dvwpvrsw==
X-Proofpoint-ORIG-GUID: i1Gs7ty9qHsbW92vv5aTmS1zgCoY-bsO
X-Proofpoint-GUID: i1Gs7ty9qHsbW92vv5aTmS1zgCoY-bsO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfX5cLEJoYisDCi
 wmbA25qD0Wm+jf6EMj+QMnVhzpUoUCnRQitLcImXkdUmR98uVqz+Vw9mtqBxpg89swyaBtXLCLc
 GQLD3ruuGWj9Ufl1MhOKMmp/sdeZnkQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190039


On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Hawi integrates the Bolero v4.0 TX macro. This version extends the
>> existing TX macro register layout with CFG2 port-select registers,
>> per-path CFG2 registers and an ADPT control block.
>> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_TX_ADPT_CTRL_EN_MASK	GENMASK(7, 0)
> This is also 8 bits wide.
Thanks for the comments Mark,
Right, the enable field covers the entire 8-bit register. Since we clear 
the whole register here, I'll switch this to a direct write and drop the 
mask.

>
>> +	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
>> +
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),
>> +	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
>> +	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
>> +	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
>> +	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},
> These muxes look weird, the different settings don't seem to change
> anything?

The mux options select different values in the CFG1/CFG2 registers, so 
each selection does change the hardware configuration. They all use the 
same |TX SWR_INPUT|route because the input path itself is shared; only the WSA/port 
selection within that path changes. Thanks, Prasad


>

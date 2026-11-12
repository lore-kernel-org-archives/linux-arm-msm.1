Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478633;
	b=nGKGYa6ePtUJlQURC4J/fpJKEsHhWCimVTMPG4JK4U8sPo57/nwPmQ//uGCHhdRILhTF
	 xZmTkDNy1iGi8vhwc4KGsjK1TpW+nTRs4XyLugZdwP3zwES3o4cliHuA9R/EfZMY0DXGm
	 +KssqAKJLCx2b13U/Mg1wpJNy7aVXGb7zP5FzO51LGIDHRyXvqd6FfDV5/TcjizJli4jR
	 3ln+ow2R3JWTBTG5AGIzol7t3heCdpJDVWXsUzm47edj9R+fcWBWoZyajKnpA8CqZ/s/5
	 yUnfnxHsy0dBHAN7qmCy8PZS4aHXKkMhFhlQfSkWeZw5nPSnqAUPOwtLEdleyuGEC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
	b=l4Ij8WlGOMcv3lwqtM9p2jDIBy4r5xEa64+dnr+2ESCBeOdT7e1tGMvvlaOYIj4V2zHV
	 Pn+Zkt3aKHxmd1rN7MDYAxVk9plpSmEYvj7hjrxIcNCoGd3hG+K8v6BzHVWlqRka/S0Lh
	 C+nynX3F+Etcjhyg3TeqEYsCUvBPpNcjyOj+jgCyohQiFeqpnIvo0pBLT+6pBnEgBA0fj
	 k/0Tho+XK7lEFyk9zbG0qCgDpx1u/ii0wgYEYJJ7YHjAe6unAiD/T4JDfqEHPTLtFpr5I
	 X8RLxUg9ptXq91hHwzFrRBmv9mFKYhwWwk4FboSJ3JDTipK50L5eefaFSr1v+ppI0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31044606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31044606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuoMsK2Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIrkshPR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4mAQb3893540
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=; b=cuoMsK2QqykoR7R8
	6L6tovW/5kKcFiHKGoeF/zGkyc8yiHjBN4zxhG4lpfwmKTADmeBJvLjlqn1wFgby
	ZW16DLzStFBzK2hKfmp2wSNLRqP7NaJsBqfAyuvGrHAUxETa40i9k14uqW5CjYI9
	olfKmp2PI/uFMst+d60L3WFsLg1jd6TEDRDp5/mRLVEHLUjsN699RDodqIdL5t2x
	ZFIQG2mpSfxZBWgy3ztyKZx59frt8xLY33sxbYoQpWHMCmukv6774EI5UcDW15Qi
	teAz9b67TsiEG/x3SFzN4IsvGQwf6ihLdMdPhN584sV+A77TUr0x9DOsyM4Ja8D0
	IjrM6Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1486-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:17:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso2304089a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478631; x=1795083431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=EIrkshPRJ0LvFGP09mc0HHQhVrKtCz7tk5/lmiOVPLNmAiQbX253VFKcqPQ8NxAB2W
         viMnfF7O15QmTrU10z7cPhfXLJ1+ao23R/o3mLYFaCc5Qwy7jCOFoyOYndFjUcKPbcjE
         2SeueLm1OAbiytwuDHgwKCKN4z748CF4mjR3PSzeOQoDDZv27GG4Lzzpr2c4IpqoWpZ5
         9aLriK1IWkk45S9tlm9uZ9f15mUCcLN5Rc7025KGNb16A1QDYjB7mbGAaVHbNqWcmsvQ
         F65R5Q85+aFUW+9AsTCV0u+heMyO48BRWQ+z2RIDxGXUOid5RWPKAT6Gf4XILiUljqpn
         Gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478631; x=1795083431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOYBXWmF+5Om2jGVN1fvtknI+pWWBq/4Rhqhhv9zj+o=;
        b=dO8/xD3y39nAFbbYYIFqSL3kyfQtx6d8V1nlr/1jGRMJWI/58klXP/QIn1866sysYn
         s5gf/NqoPH758Uw9YIhb3puhjcJfxQqzqxn3BgIiVfiRtyDVupV7cxftHh8v5BvOGxHb
         pRHoWJ8RJA47Th89bH7Qlr/u1pLZjcB40TIcoMyFu6bH+tl4C95OAE0I3e6jOOmr/LqQ
         mMkcxQ2aynkfmfLUuYn7dypF5pUmDycuPLehz4NtSB1PqUN8UAW0FU2qD/uNXHZJB63J
         mZKTYAcscvgwzvfDCiRSYxx1D6/lsqcBECIqW49m/6Tqwj0eFgnjsyb247rRxcws17+L
         u+ww==
X-Forwarded-Encrypted: i=1; AL+hErEFQwx59Mur0VUlFdr1jp4ZpCthv8mwsHlcrGzexsI2kH+cmZ+fEO+oKkuVl3JAZjtvdppWyixI4raAz/q0@vger.kernel.org
X-Gm-Message-State: APuU4Z/cH4kLwBz3q7mc2FN8hMr2L4Tmo3qtxc+QtPmDYPNEJIv3KDr1
	9HUR0/IPyf55MvVu+QDVBA7H6koKdxTw8xxxaXbiv19KO9n2DZfYZF8PMyR/DjWqpgQgPjQAg8Q
	DBwh7Sm025VNrU3WneVY9oIF6lCwNlXRtubYmZxH9iHFz6OxWzzgVwM18lQYlaSGyQAo8
X-Gm-Gg: AYBFou0Te0sQHXJjOeQEGmAiFvvh9wliHnYljZ+zq2e6V6TUrYVryik0ZZyYvMuNviW
	oSwpBvPurh1PcV4OHFSUdfpp0wqv7slL2NCyAgbZ4pLP3hXVMDEM8LO4lnslMPSLFpmjQXtew+s
	SZoupvnLIGBqlcrFS1Le4Wrzq7QEzr9VemcSis2y+ucsQ8TSjtyycUndsoUsoGJtnvYBtfI00Hi
	vQEadR7OztifT0gVU74Nh2VspMmYAyfPomfj1fAJzSJmJ0wZY9e9Uc7G8OP+wcssQtpd2HR0ra0
	zSQxx3uBWohzRtGUFrF7m8z1rfvjPyBn4oy18+EKP0qLFuVSItNpHkzx+HTa8FE4CwrLWElB6m0
	x07PN3rbF73LBotSBYtsX0vCJFzxKa50sDrhXzm3B28HKWiXv/WLD7aTqjZrtuUsFnwLfAiy/Ep
	rtW1d1BZjBf40=
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440794a91.6.1794478631420;
        Thu, 12 Nov 2026 02:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr4440782a91.6.1794478630919;
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm4026476a91.7.2026.11.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:17:10 -0800 (PST)
Message-ID: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:47:05 +0530
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
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <179436005594.790675.8837636459182556844.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g9hi88Ugs_3Nt5auaFWZeiBFbRJS49y0
X-Proofpoint-GUID: g9hi88Ugs_3Nt5auaFWZeiBFbRJS49y0
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af59228 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ea197RGUULTvqYrq9asA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXyq0JH6S7KnaD
 5inJBHbQ6N+M+1vgcQd3/YgL+fE1ABb7+b6Fsi3QAHgeOzpDZZkXDWOx6+ukjCvolQndloYDh4l
 eMEwaa8vlSdrsSbArReJ9vLNHznsaOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX0BCcoBirVwOc
 N0FjsSnN14fdM4JKlk0vMREaHwjcAzr0mIJSQki4MtrBSNRnQbfsUUGmmSIXrUp1b6t+nQ2GjWD
 fZ7knt9Vh1bBaI5fIArOKhRrA56U1s9r641TUCfFcMxiML/NY3X5+cl/5XyJoTyfe7JIuLUT8bi
 LQykfPng1EO1x9SQxwrlMqDoekD/LiTxawM6J4zvI9MhlKY5DXNoCedn41bh/LgtIci9n7ixwag
 8S/cks2GouJb1zybV+sypXUUEhbpiw+K5dzUMozSHTKkmkydtcbRVOuOhiFP+z5QVE9ze8tJ1p8
 3BplR3RlmNkk6hguckDzIV5VFQtuC27m8/4Axb0grDmsiSiFVKP//i6pReQP8TON03rr6qnFvPU
 9TQnMc8xlvToz+1jkCIi3Z96Kse1pXbfuLsVFCvlRdAJuQVjQSCqP+oWO0L4kUT99dOWJ70B4Pp
 Bn5hH80XIgXPVNSyxew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040



On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.1 implementation.
> 
>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
>> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
> 
> Is the enable mask really 8 bits wide?
> 

Good catch Mark, it's actually 6 bits. will current in next version.


>> +static const struct reg_default va_4_1_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>> +	/* VA core */
>> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
> 
> Are we missing defaults for the mux registers?

I missed in this version. will fix in next revision

Best Regards,
Rafi.

> 


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA031E0E14
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520208; cv=none; b=QF7pTNuJDUHQSHFFY4Z/fPn0pnmJDtHM45/JWa6eLeR/jh0NctN/srd6wJbtmLQ4IaV5phab7SCb+AU22A/tIbBYSN8WjVAQTPhIG3uLPM9K0ONoyuRFYM74jYMJuuQzcaztTqO91bWEcKHkPWjdPmTn5s5drXW1tv666InWaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520208; c=relaxed/simple;
	bh=Hn67GR+gO5Esig7XtQGNEiHvrdUGoUdeHXneZMlfYRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kv/L82rHYpKZOSrvI4OzOdVGdozHShs4fa2K0S+HcYbbWon2R/cAZCJ5Y2v4j3kUHQhZBg2TRco8vj1grnP9bug9X5Uvo2BFvbh4JK4yqhqOERgm+BpUd7j3exsRpru3BWkTwLNAq8GalvVtF4gHHeFtdJWcY2Z17244qNtb05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUT6U5LF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5aj7xxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUT6U5LF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5aj7xxI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62Zhh2948765
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=; b=DUT6U5LF+ORWHPgL
	7A5td5L/EjOH8p5NfbokYu8RsMKY33NfTAxUJ2dQtUiQS2PYGYMFtcwLFGQ0RhAW
	2s/AE0vc+NDkEPsKAfG7qWeyazG9/FoFvPWQJVznO85jF2K1nQQ7AS3XMz77sghP
	YKKRZVoh+BdtBdGfTfBp0MDAlueYM59rI2IKupHHwqrZBh5w0y+TillzsXrqa5l1
	9kh8YY5CZ/3sqcHD7KDtcCXuj1zL3AFBVkwpo/HkctruQhvQFfgTKR8TicTp1sWL
	FzZ9vua5JnOpHLzgo/7Dc/ms+JMC3+77Uml+D3cFHfrbfgk6FltE5+RT/HeoWhwQ
	JDJXbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2rqvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:36:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso503501a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786520205; x=1787125005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=V5aj7xxIGb24dsIzjhBnFqzUfp2Kb9WEFqp7aaZfnDP2SyrIHFxtY8+50hqg7QrwkA
         jEaMQXBq+j0YaY1m/0XpsQCyKhvMxKJyHvpr5mg1P09N2Tmok70RKtqbQu7ltlo6D9ib
         TQZjFt4p5cJTzpG21K2FztoYyHeAG+ld1ejuc/l2ZbDIOmKEmDv4E4ra0eFoIjfzLHqK
         POJOkJQ16lfdVnYdVd1GOPX3fy9GtXjuI2xOUHTohUSb/ethHCPrAOfw5tloMVGsWZRx
         jHxOQzknr0B5TemGz+2og8cE5F9dpDXX9aoJE28dXYLl5lxfA9w91RYwx8DlirS/kiOi
         A4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520205; x=1787125005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=RF0R146brpCTYFdMqNDffRkNvWb0T39nL5wtb0iRvm2tHEpYHV16v8R4xC9rky4iq9
         +z4UVF+R0AikxxeG9/+NTZOR9GELXIMJ4qIW/rytOOvlKqRePjb8igZDKyr3sVV4og4g
         e37Nx7dBjnaTFepuT8iMCVi64tRWY4WprYUEI65J/JgFOxag8rKw5pF4rlmJi3TDw4ys
         eRDanxX+yLCGiHXu7lBfKn7K8budrtgdOOYPgS1/xVdwqks4Uj2ZqHRJB4ugZ9n4dlyX
         s1gw9DnRvapGew0xdsdJnAHJpFxy5hdxx7aY7ja1XesHMyrpcNwYZYpbwLgzObXaYflw
         nSxA==
X-Forwarded-Encrypted: i=1; AHgh+RrnE5EyMQgAqQ3CNFFv9WGrTIlgnjBw0YeoE/IcQHu1on3nGJOef0u1KvdNS4wH5Wa84ppC5LcC8EXuOMfD@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwygfH1EpGLoyUMDvBwX58SI252eQ2SD7VYoXzl1x0/f+LYuM
	fDSk2KW4gzmN4+FCqurcZKtT6T+R/BhI6sRIS+GKrG7Q7c1Huoncp4249aUSQo/eyIdrfInKDT2
	w6EWAJoYVef5dZvuxexdaMLy7tILhdszjiBGxnkL9Fdwa5qbYefMhUqvNHo1vaZGuboaP
X-Gm-Gg: AR+sD11+Lz+Y7qk8vgb3bVcb1gy/hSk7VVvrmTYsVN2kJY2I/zLZfprIy8HkBsrp0eB
	dHm7cwjqSeijfb2hIUNssftL/Xb6uvzqq3VsbfRKQU92UDN7MmmuUX9byEuE31E8bk5rnXYmsvu
	4hZDdk+hPLJt7yPcKlpVMaokCxG327uaWfXb/3Cgpe92lduXtIb9OtCdVhFRoy2xs947MQR0Fg+
	cvwfGsPO+Nc697Il4C84BgsjJRJbaqNIht5cJZXTevyZB6ai/bRW+mZuZ/2mrI75JWLgAG0p7cL
	tWK8taZyjE6bqsNJt1n2hIa1D0Xj+Yt0EOchsWGjMT64AvvL8NkBozl6A8GJcqufH199cnObeHC
	N0WzJJay8CzXifZ7/OiT95dNnCdwXP8BnKA==
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3195028a91.10.1786520204570;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3194989a91.10.1786520204012;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f9675e32sm829428a91.0.2026.08.12.00.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:36:43 -0700 (PDT)
Message-ID: <2c036793-23b3-48d4-834f-9daf8000b2d5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 13:06:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c228d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5NPrCMJg8ZPYdfYl8phs-WzkQaS7UN3I
X-Proofpoint-GUID: 5NPrCMJg8ZPYdfYl8phs-WzkQaS7UN3I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfX2ZmZenwiBg8H
 FUttqlN/6r/Tr7NVxQI+73vJcflPhcVPaaluaEvHfJhAF1M5v6l7GD1AvCsFkeFBt5irW8f/An3
 ZSgYq/mmSa1O6b4ZEoupgFNdBK+Fcaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfX1Hk+4G41FJDc
 eEye2OlZ+pN7u7PHWsEVz0Ni7fSBV/v9e7b1dFaYD+No1W4CcYDzZhDVYyezLo7fKOSFh4GPSz+
 NHnyU1mMYKJfe0n0ajrLf/p6V5BeyuLUqTQCtX7AeQX7mxs2mDR/tqL9ra253+/Exrh7/lqG7N6
 7HEVavwrW6tonsTZoBAffiJfvUAOXklyV3LEWDNqaow3oCaOdKQbi8FDUYIGOnPG0fxTOrE9Req
 m889no+GPTaN7zANY0oYc/AYYmGvV/0iQNMAS0ZXpiGit6GypOsdPolOb9tsEhkbM7TEcS1M2oc
 /FKlfjYqKDRv0iv8RiHYlb2OmbT8JpspsRKWM234rNh+n08mra1a+i9RafxGb60tkc/PT5MdkNr
 3LiHBh7YQvmf9ptL/tzM+hAl+IetsUClLtSS89ONJVW1DKFOuhwmv7BZla0Ktt0gdzTBLFWkT3G
 DVqby8lOYOh0SzmHaaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120060



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via
> geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
> computing a source clock and divider combination for a protocol
> requested frequency, unlike the Linux clock managed path which derives
> this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
> applies the matched source clock frequency with dev_pm_opp_set_rate().
> 
> Change this by treating the OPP table exposed on the perf domain
> device as representing the actual SE HW supported source clock
> frequencies, the same role clk_perf_tbl plays for the Linux clock
> managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
> iterating over this OPP table in geni_se_domain_attach(), so that
> protocol drivers on the firmware managed (SA8255P) path can also use
> geni_se_clk_freq_match() to pick the closest supported source clock
> frequency and calculate the required divider, and apply it with
> dev_pm_opp_set_rate() the same way as it is done for the Linux clock
> managed path, instead of relying on a direct frequency/baudrate-to-
> perf-level mapping.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

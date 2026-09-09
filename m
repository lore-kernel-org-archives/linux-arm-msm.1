Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48B559C98
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958709; cv=none; b=fYIyU4SioSDtInd61nWhwDEktYIVFKX8l33WF6Gmnv4oI4Sso0YjV5clUvoDw401DsCvF4Awwvss1LZj/qaDIaap7WTAxyAgv/LjAxiTOAAWra+R219ZFJR1Pn4JprRnc2jQA5aY9TIxuBA2En0Zf/y7V0cnYWIA/eknOjeO9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958709; c=relaxed/simple;
	bh=drlZOgaf/s4JnYJ/P33EvkbPmT2Fg9i5bejMLDDy4H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxTYzLI/sdKG8d8vF+3zWIMlpQvNT3YT2ZQU4WPP/Cn9Q+W+6kz3Fh93IM0C0YlCdfGM41pXDzmrc0D0DB3/ecwp1GOpRJs6gcuUw9NIXFVz+ocHtRM7ERnu7GQ/rgZC4Np8EBsiQqx7iHFz7w9MPlUjNmXbksGO81uv8b5Kv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVRpu5kP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLMCLZRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVRpu5kP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLMCLZRa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU15c1723028
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=; b=NVRpu5kP/GQrgANS
	MankYWxrO5ByDETSlEWyipdTPz7tMTY2YEaNWNCmSrk2PbgltVvZOJeDpZHN2FKL
	/GXi6oIZCWm+rqQlMnIAQeRKYVNdYrLrNNS+WqvYUx3JHAURgO5aFTLyyPU2ur/H
	Mmst+n9IC8Dm/QbcJ8XA3gZ+ptJUmI2UA2CGDEjxVGE4ylmO8nUflVK35wPi39EP
	GowUlHmRnt4WcTJ3zTv5uElMxySs8qsBEziH+13Rwsgcd/idfASHCuUBZpYN4m6M
	HYVRjMoPEh2SaWF2qPE3p9FiJJpgjI0cP9jOmuxNb88+ULoHSEgBX34vK8tRSbOw
	Mm3Xvw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrmep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:58:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so191494137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958705; x=1789563505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=;
        b=KLMCLZRaSpredxLrqBHqmi307Fvo/I37CBXZAJydCr8nuYid9QDbCxH4ELkhKG37yd
         rmUuKBuz2D9vB4u/HcytSEUJBasCaoABSaLSdAMrazrgHovmme9lPbXyH1TGXMKkdIiG
         0w8A4RkbW5vZlL5gZScM28WCmF27norfYA3l6YbqRzOzfpfDtTWE2VsA8LqhQ6XJrbay
         gtIucelB1Xg2UrIsKEx5QSTXde/nsCLgzY0y4eCagfMn4RcI//fZU6yHJ3g7A2PLBhlv
         j9smpzn7QvHHTN94GaDpMZjD8+EaPAyo5pxjNVmM3/PK2GLTURfjINK3TmQc95Idb/Sx
         UBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958705; x=1789563505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=;
        b=r1PaSE/R32JKqqifvWZId7sLS1z8/QA8SF7D8tU2qSetrjS60AjV61+RDFutV/R6ci
         6KpCbwiBTmJZtpQHwGwQ74dDvn7rETPZkouRJqQ88/1voCjELHg07Cps++L1hc0FhYSE
         FpL7tPw/gWzuck4DNYXkiEWuCSj7Eh6p6NnZhElwukWeL1/lY8+pJBewwAXrHVEX+Ktj
         ZiWrohrdWLMgd6dFmxboutgcHuf9ZkScyod9EQo4lC0ira6U98fyz7Dq9eOYiRrPaRUy
         p4CrJUFteeZdMpZ8E8uXnk6PhTXrDMtwpv9eamTbUP0NxFxNT41e9qNZbvOIWEX6lzYg
         Ua0A==
X-Forwarded-Encrypted: i=1; AKwUvByeEY9Zitx/trCIcgLv9/sS/HI+SQ1gpJAz756Bq2NRSqw0KS6Z55f0dTt/xFhHOkPd7LhELhpzfE1JTrre@vger.kernel.org
X-Gm-Message-State: AFuF++nyeDLO2o6Mttyrzy5oSBg4f8MpeUN/Kw5vvdS6WBYr0is2yrw/
	dff6rMaK2XqRWyydgtPYp4H5QKebsbGionpg0pVqPZeuHHEhRwGMwW09J6YndSDqxOpgCD++i8M
	c+/yNeOa26hkuw3wxrP7JcSCR47JbpWpOAOADyJMl6KA9xw788VgQ2OyvdkDAUkBsiRPO
X-Gm-Gg: AYBFou1GzpnnjQafkHJRKENMpoO8C/Yh941abwpH56jEK2gc5yxyAc0Pha/+9nz/HQR
	ubb6KjzfktSCj6v5H0dDZzUJk87Hu2p9ckr66qGkUZzhUJGElEjONgR1yUDP+W1zZUfMEdFyMvF
	ACJm3nrIBfsqXD8q0Uk3DaJhICgw4/y6Th5kXMdV9kZj/A0o7HZmw3f8LmIpYsuu1sN6d1wTk66
	r9AV+KRjxx+5XSo3UkL3AfCbltFda8PQpwhKDfKxlaaBlxhXpHl9nFiHyArVflUZWogw4DLZQeZ
	oF2ybZ93UnD1EvoIcPYuibq7BXBFp2/XRhnpBJ2jbkSXYDE1urGppXqzhTWQ6g7QdKsFhyKU4Nk
	sHd+4ySilHGjoHiFZ+kGwL+MFAriqm+1m9jAt5tJdcQ==
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr13384649137.0.1788958704734;
        Wed, 09 Sep 2026 05:58:24 -0700 (PDT)
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr13384606137.0.1788958704184;
        Wed, 09 Sep 2026 05:58:24 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm43058540f8f.3.2026.09.09.05.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:58:23 -0700 (PDT)
Message-ID: <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:58:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
 <20260827-adept-traditional-earwig-e2c8c6@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260827-adept-traditional-earwig-e2c8c6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k6KD1_FP-lFjaE6BBgtSD8Vshx_xsS7G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX6ThhgqVjOEE/
 ZNggsv0bu1b+VpArFXg1Ux/x+gDC1mCRRoC6XXcjq0HX4ILAz/U8f2+FbSHM+3Ma3PRiKkxugFK
 9hOd3Z7MpGDm+U4silm65SVrknmr8JI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX44MChsmsYjt8
 DEZPitFTbRqf4Wk12zVMFFPWYY74csY/gwwhjyj4dO0yXSw4saM3L2vRRPixfJhuT+m4mAFFeS9
 rN0jgrjLY8H4hZSbJYbuQcX1lMwDvvDm5ZUhtaYFgKj8aZph4hf2DlSsBAfa7dt12QYtLaIA/dY
 kz4D2XTltv6R5oLCIs5vDq7R+hrsGtphHjq2OVOtGezYnRp+68IZPtqcuBSEoAI9l9SYf5yc5pd
 QpPkY0dbHpD+GDRZH5VKcubA3A896GshxvD06/+OquCHaWnsmK7rdflxAQSuNP9PBkNEPG3kYVu
 lrA/DgA35qgVW7qc3dIr3mV5evKvcezVHLws9gdT8wqXqYftFxieIKlO/H7nAYOGie7l12cDQaY
 ohBRaRfcLev+jxcwaamZJBH3DqrBd8XQ3I8tXPYCl31LZC4wSWf/JGEx76UGKww9CYv71kG0clu
 B4Vc/5We1G1hTz++C6Q==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa157f1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H0k3xGeVXtyUzq8jG-sA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k6KD1_FP-lFjaE6BBgtSD8Vshx_xsS7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090145

Hi Krzysztof,

Thanks for the review.

On 8/27/2026 12:25 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 19, 2026 at 12:32:10PM +0300, Atanas Filipov wrote:
>> Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
>> camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
>> calls from each consumer cause a last-writer-wins race.
>>
>> Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
>> icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
>> set() callback converts the result to clk_set_rate(). Consumers
>> encode the required frequency as peak_bw in kBps.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---

<snip>

>> +static int qcom_camnoc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
>> +{
>> +	*avg = 0;
>> +	*peak = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_camnoc_set(struct icc_node *src, struct icc_node *dst)
>> +{
>> +	struct qcom_camnoc_icc_provider *cp =
>> +		to_camnoc_provider(src->provider);
>> +	unsigned long rate;
>> +
>> +	/*
>> +	 * peak_bw is the aggregated max across all consumers (kBps).
>> +	 * Consumers encode the required clock frequency directly as kBps,
>> +	 * so the conversion is simply: rate_hz = peak_bw * 1000.
>> +	 * A vote of 0 means no requirement; leave the clock at its minimum.
>> +	 */
>> +	rate = icc_units_to_bps(dst->peak_bw);
>> +
>> +	return clk_set_rate(cp->clk, rate);
> 
> This driver does nothing to the ICC hardware, no votes. It only
> translates kbps to Hz. This is not the purpose of ICC drivers.
> 
> Looks heavily incomplete.

Maybe those series should be marked as RFC. The basic idea is to manage clocks as interconnect providers,
similar to this change: https://lore.kernel.org/all/20230512001334.2983048-3-dmitry.baryshkov@linaro.org/

There is requirement to maintain higher clock rate on source clocks and some place to aggregate them.
One example is camnoc axi clock which is used by jpeg, camss, ope and maybe other drivers.
The interconnect has already functionality inplace to maintain higher
bw per request which can be used for maintaining higher clock frequency from requested drivers.

One option is to use already available icc-clk provider, but we have to add many icc providers
instead one provider with many ports.
If you have an idea or other way of maintaining higher clock freq we can explore that as well.

Thanks,
~Gjorgji

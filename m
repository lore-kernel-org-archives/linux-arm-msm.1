Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D94CA765
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448475; cv=none; b=l5fxYCJjzH1WBv8LnRKOkIpQAmssMPe0rMk7BALD9M9Drv4KamWorPS6OmliA/+v0xL6L2+1CtkzF/v5bu370uUO9Yb0xVVh/pUUpt2fRJWjQtmWYjUM25xaooCGpSF4F5lJNN3mJOlDa6upAWmc60VmsCMAtArYwxOwQcLZAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448475; c=relaxed/simple;
	bh=AiYQDdr1GA2GGgxtoSCbSmmY5cDjwiV95VNMSZnOgqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukVlfisvmw5T+PhHGJUrMpCXFHxV3t74aY7VKqqIDBQCwDj7mjLrU7lkS2B2ezNWxYRk28CNoynOGIXp+MZy1MZHYPt7Mvz/uKaMANVKaOlxWkovqe9kAZHBFdK8RMN7rQxzpv7WDTcQsZH2Na4ZHAffKIJNqHm+c/mMc85TaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLybQAxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwDacICr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLybQAxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwDacICr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAQr71040620
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=; b=hLybQAxwHn+9hFwL
	fBStui1wKAaJMVUD6eb41AZTw02LAlzRN7xihyBI9X0HCwGRDS0PCWp5Ikuu85CK
	te2MVy3HFFaMRf81PRamfHht6gAs38VGRMVwP9/7lZICVAS6GCNgX2u7gRCbZORR
	2YkBM6zXMnWRAtGYswNuzzJhrf5Vo/nuaTSfhlxs5ANXBehb7HeBhdUh1m37ognf
	7/4AiH2a/aIoVgKLJbwvBe6qNQwmO9xfYTJlB5TNvCTNFAk2VrGTmGsD4qZ1bUij
	eEPORVT5CKagGKvlhIp9kcAwvotHq5RzYzyXFe018oxaCBJzskIuNJS5/DiUSew1
	UHLHlg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4jgu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:14:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4605185a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448471; x=1789053271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=;
        b=bwDacICrtKVadZR++rd/YFsPcWXv8O27Xr9LUgAu0fG3EXC+7ywE8hYxbi7Tqx0tJH
         4SRXJS7TBTxqgA53osfFs8TIhVN0ks/oUmsUpJoHWZ9ZkttRyOk3PrFpzUVE4onaCKos
         RWn78hdzIRLsRiq/A8oF89HF1aAsmt35mtgKFeab6Wa4NrvLjr5Z0kkU+rObj4mnE4SA
         lZQgZV1TzBnaKOQMfQh22Mh1iP9B7mC3ANfCXojVtYGKVt+xKTbR57v9S19GcsPwey4P
         VQXwXGC7pjwCguxm2+anLhKpyO2Nle0/LCSj8yCbtIncGy1hgNktLydkY499sMrmJWiL
         UJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448471; x=1789053271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=;
        b=ssCZ4NNNHheTiNY0ELQZYdRDdpwcHP1WMVsuf4BUIBbF5bSCAHgndpGyCgPLSplHpz
         BK4o5H2vDFPu4QKpUI6nZzxo4SntnVZMDC3k0nkl6XFhfto+obsigGx2hhQKd9lKmTe1
         sz2Y1SxI3580lJAi1N8KOk8cNHDXGHimlweepX6mGL9HwA1nHPHaVF4OMM10dibJSW+B
         uveuS3bHBPGkQouz5LsWN4VZ3qedVaHp1wpHHMvv8+IsMZJn9AxqjNI5/kCQSIolfiRR
         Gi+xlqOzI0wvO7+Ht8Egga0cK7AT+LHf9sfTWLsp+/wb+GTDGarc9yv6elqgdieE8XKP
         qucw==
X-Gm-Message-State: AFuF++m/dE6ddKq3UVhIxCFVcxsId+g3a5M8gGGWQ3atzYv+73EQLx36
	+7/XiQui6i0SHxQEt2O2Ajy/rdyx/BVlMkgarspz4+2CsGpV9PQsTl7DYpA0WJGM9PYS7BBn3KR
	KKXckhcnysHDgKe+eDeEQXP3qYte1ObtuMySj/FBDJZ/TOE4J7LKoxfSL8a4WBZAlxuEF
X-Gm-Gg: AYBFou0xATr1XGEoHyLVbiBKC3ZYV+xnnnKS31GGAOuIwnNU0d28u76kV6eaDzKdC/B
	0IvC/XE3z8uCeV/uk9Q6ZIhc795wlJuKN4k5EEvqDSkmWSeTt8KF2LyYh9TRCUmbFhE6ka9Bee7
	qBRI4rNSFO/krHtGo3rpDvwp4ysJj6g339aUlfgqhW3KdyTajNvx1qLkwj/6TagUQlKg0mGvF1m
	ycH4zIRvH1zOdmeGTnY4REuZH9gxu9PRPfUh4DmYz2genBrzwCaVfPfnAGXXjkuqzVrRjm63cMO
	A1EQgiRLa83o51NXS2DaORxWGz/ri0y4Ht+/z/Kg/ZigXjuamSoVJb/xm1q9U0wseQImFXl8rcn
	Dl0umu2ervP8unP/pua08MqmzDapMaxoOo/cU8YN/gnEbIVRzpBliyIo1V5bOmd4=
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr18587603a91.12.1788448471202;
        Thu, 03 Sep 2026 08:14:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr18587536a91.12.1788448470695;
        Thu, 03 Sep 2026 08:14:30 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm5864497a91.8.2026.09.03.08.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:14:30 -0700 (PDT)
Message-ID: <7325c6a9-8e8d-48e0-b01a-68a287e7af5d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:14:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
 <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a998ed8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OvnJboicBg_-wI3pKI4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wVuXWeNDAq8UNQ2OSD2TaBpq3MhhYKhk
X-Proofpoint-ORIG-GUID: wVuXWeNDAq8UNQ2OSD2TaBpq3MhhYKhk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfX1AltgAE1tGWd
 AybwiYkShdZXkZPkWbKEnrY1PStDuVfoZMwvwWILz7kGnxyy4lk9PLpfjC5xYCcE+LMvD3C0VkL
 pVGt3iyLWgPxhvL9Gar7/U2gsil7tPg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfXzGTX27oheF0q
 wLC6+5JSK0cpeZiHyHN+8g/j+obEiB1Pb2ZykvagiL4urvFMq5MeGvFmc29AN3UmoLaCNHR5Xmj
 iUh9+ZGQvzMPwxDIOBE/EmYOcpjKpIZQG9AKA4bDVRwhT8ltPQCsue7YXdBSDrtXY9HtjCyzs9+
 dCYWAviLWQisjRQ8VXDkRbBj7bUgW8Htb+PMACOGbiSAHuTPhfu9Pwfw17qIi7OyiT7Vdkm4bDc
 r9YnN4X1fLF7STvycGwXkRqcX5bPmWjdB/fHM6aKBYe86kDDSLQdJEEox1xLN0YDIfK2Xntg46L
 BhsJTm727jN+x0yVE0HShCVouihusdyYjhWyo9dTqJn3fhaW6vHvA6KrCuGLPLJ4OiqlitDla+Z
 XAbjcVaGDpt61lUKGEHaGWlE9bS4AVGLyuxT1CLCXEhQgyeDy28iu9EruDirs2hpkSQfqHja/Hp
 H+SmwZ2W1oJI5+8TBQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030132



On 9/3/2026 7:56 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
>> rate / 2); it is then further divided by a configurable 6-bit divider.
>>
>> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
>> helper, built as a plain struct clk_regmap_div instance instead of
>> hand-rolling recalc_rate/set_rate. The helper takes the register field
>> mask and clock name as parameters so that the upcoming PPE clock, which
>> shares the same register with a different field, can reuse it.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
>> +						      struct regmap *regmap,
>> +						      struct clk_hw *parent_hw,
>> +						      const char *name,
>> +						      u32 field_mask)
> 
> Since we're doing clk_regmap now, you can just use the clk/qcom/common.c
> infrastructure instead of NIH-ing it..
> 
> Konrad

Thanks for taking a look. To clarify, this helper is already built on
struct clk_regmap_div from clk-regmap-divider.h, using .ops =
&clk_regmap_div_ops; it does not implement its own recalc_rate or
set_rate operations.

The wrapper only derives the shift and width from field_mask and calls
devm_clk_register_regmap(). Since the NSS and PPE clocks use different
fields within the same register, this avoids duplicating the
registration boilerplate.


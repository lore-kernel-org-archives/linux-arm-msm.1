Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FF4756C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401059; cv=none; b=kFa5Mh9Ri1CdaE5MCMTx6tRCKN5gOQbE0bJdu3nN29M/PCcSWNkeiRcG3QwV36kQwMNnRPosW1lLMW5/jVvyGnTAZ9UlrPUsgxNvuitoNWkCph9DDp5hKy+j+H/ZaYFY/39bGj8IDo/pbko0oANefK/KEE14/x0DBw7Q7XDw+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401059; c=relaxed/simple;
	bh=gcdwFaJgb3bl745WlPsLEYzIlu37uAqRXUzhv/+8Fp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDXq/kzVecc9fj4X4NivbOKU8EUeMzcdNn5h9CWbL9StV4yfPVYLVe4Z3NPfTzuulO7eyg1V5F0SRfIk37+98Ut7bwS/5jacJ2JBVefIGohu5bgmzXo/eT9X4YYd33+YEqWRwYLRt+rTESbJhU58SUnG+Tgta06MgdaeESVPJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty1RSPF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh1CtDQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty1RSPF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh1CtDQP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7iK1896620
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=; b=Ty1RSPF4gsENtoNF
	/Iklvz1AEoIc2j6ogqpyjHcxL5o6TOs80/FqxwqECUhgXNGw0A+swQgjkgTYGsIC
	0nssr+ifLUlnzkvShc04V1BIUvYUD2cZmVbRxKJm8OIZOsN5pkKlLFTrn4+YXGGk
	tLXBkOV+xNLGko3o327qKCk0/fsdfQD6Cy1xm8JrTrnmoGPbt3IcdaKt2Zd5FF/w
	nzZKOkozyXpHUspnWy9/ZhcOp6zDr+AXS6Ld467L9QL+aMGzq5ip963fx/s/GNM6
	caZBahHTYXKCwI0fufHdYiU1CoKExxg2qmN3wwnmF4w98e4ncyLPao0uQBwz7iq3
	pbnOLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr942n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:10:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso2033581cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401056; x=1793005856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=Lh1CtDQPPv8Z5hKaaLHl6TSicMFFqGp7DG3X4V2LcEJou7+YynNL0y3tUes2A3mT/p
         0a4i/yHFu8MexAWOktLe+bifNd80p76oB+LOEYuiNOBq4bAZJdXpeMWpaRXfXnLL5FD/
         jCLym1oTJOxpag0lsMzrfBlJWJmV9eFuCbebR0GM0s0jfn8SobqtcSIKajZdMUsbZcPD
         XapwJLFDeeDD3SSpRJglV16wQ91GDD/F1FnUB22ginMyPyfNIeZtlbpzSXJJw9m7OMks
         cbHPoIuy2jOVMXVu0Dh6uiseMk4m56tke834uMZE9QJLXm76mH/n4ME1JfFlktSWJrGp
         vfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401056; x=1793005856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=EccB2mjkFmXEyZ4Y5PPf59wM9DXSIM0wlunMR1xPYB3wQu/C2QpmAyaeR9OW8WnGH5
         mmvcZ/oAzdGTRPsIab3b+lp/wzpfTy4evO658cUCyEvTQ8cXVIO+VAC6mAgD5SC/F4fB
         ih9z/UHhAp3rgassLXHnRA28C+nnoRQduq1KCkyOX0NdQbGvrDqft0QdPPY+TzK8b0kT
         3XrFNrO2Isy2oyZV2OV/d5Fw29QjgcJCkyhdpWg/sZ2Abmy8/EZArmz2YsuxvXMgM5Ym
         O5Xx7r/MQEeYTvTesx6dNVSxZAapNeitxJDY13jv1KQNXc3fCKWZF71uhNcCZB0x8bCn
         gjRQ==
X-Gm-Message-State: AFq9FYLsbBIJaTYw6Q23z9aJIA1VJyOUXC6UzXuvyFibzkNfUIurbTnK
	vssqNh//P5nCAszDRAii9evBlOpT/R9iNRVYxm8zJLhz4NJjZLBZiYurZKjnv/HR41klh9Y0TcG
	8TBUE/jIXsLWhHSDlMkXBfHwShyzqP3JycAQgQckPHutYv4pq2DmUCn1Iv9o9AV0PdBe5
X-Gm-Gg: AYBFou1UOl/jOoiNEk7PkyWAcuMRxF6r6klXthHbtOJGSZvVXwD22XcybN1erZaN/DA
	K+ufNkAde1c9GKBIdHEBEGG/omkW2FHRTIcT2XpLyfdc748+6MWX2I56wXSZd0UUJhq1SFcetWL
	T1Gjji5aD9V1Jf5uuG0lJqf0xDHjp9lR9E2+Uq+IULDz3ZeHsqWJpKNsrc0D2h9B/aI0nvAkfT+
	QS70NJKHvv6vw9jSywyZebCv9qKq/gA0X1JEeHMH4Yb04e263Mb0cqwSr6ObeFUxlPIOJC4COSR
	GdJ9U04xv/qkpgRB6YY2AVJmxOiVdnFmwS7n+D1MyqdR89xmVviF59VuMSqFe/7oXQORAhs39vf
	M79y70iwYd0IcJ79kp5A89A==
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462861cf.1.1792401056167;
        Mon, 19 Oct 2026 02:10:56 -0700 (PDT)
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462701cf.1.1792401055667;
        Mon, 19 Oct 2026 02:10:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm349444466b.20.2026.10.19.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:10:54 -0700 (PDT)
Message-ID: <3fcaf48e-7973-4fd2-8ce4-7d214d2a6191@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to
 MMIO-based probing
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX/MP5IofimyfB
 kh6wp3oJ3xJ3zyFWOMMchnGpXRbUfc3t4VkrC/Qiak1WRoEulEC2h6iYRFl/uisVA8iVfR4ETKp
 TMFLmD5YmvfwRCRZOsjvMnVGvp6WdYNWx9tNmKnZcuC44ZhIE8MxnbCjrNWZHit2iWjfRH1/8tH
 RJyJrZYYbvfrukb5JKj59D6LeINd1jXz6btkTthpPFNCxvQU7XMvlLKZlQsbpCa2BO0gLkVxe7M
 sBaqeJhe3u/EsR1PLBhVq2rnahEvseZ7UTjgXHZ7QseE0tYA4osTj8dWUFDKbLGhKhlIhhTDG2e
 kFXFTY3sXsygLOfxO3rxColK5EktwpjQT6LQDhIHdjmsyTzusLc0IkY9DLX7sTgAtfjw9D7hFXD
 Hry1scQB9bh9qroU+3tSdMbHrN/0eX0pHALvjemoASgugKSTvIkrD1M96H+w+Hpm3r5rqVQtUjB
 SALZ3m4QSsAsZMx2Y6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX6DXyM3kUNnPk
 2yEV9PlrQ1xlsgZzsKh5BqW60gjv5eBU3upbZ2Q2+o6lsN8ki4CS6+GlnzBO4cY7CSvLu44NDdu
 oU68G8tJN0w7yKSNHhzYUwKBGyl9P/0=
X-Proofpoint-GUID: LEC9DAPWnuWiBgfRipgy21cUM-4LaoCB
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5dea0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l4fDSgpoRc1iC7w1fSEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LEC9DAPWnuWiBgfRipgy21cUM-4LaoCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 8:58 AM, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE1E495518
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436689; cv=none; b=lUukwlYrb7vA3g/bWcWVfN+6dik/TH8axwMKwcjRl17q6hRmaYTXODNu/bBuCxJqceSdfD9Wp+m44pTImQFVxR2LXa145CLO8TdWaBhwHLFpWAVmWy5C+lNAEc0NHTI09G4FkARCf2EOQLpOqxSqRS3P0ViX6DND349aqD1QgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436689; c=relaxed/simple;
	bh=kS8sab3+oqQ16BkkWTgftQpd9FY6WwLaiCkt6PdFW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYFqk5mP8j7YtuChcv6NUpnXjg491WrW/FfWb2mUBKexK+ypzJtQcEp0Tfl8lUyrUUl+jQh7+uzq9xiSXq8+7+MMX69m99ZbuNxBB2N9BaXA7ePWTAZEA7yYOrTIboO13FYGuO45z+6mo1nBRKSazc4FB8BEtvazRbH7Qcz5R80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcLDftjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNrpTiuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcLDftjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNrpTiuJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTKMj210353
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=; b=jcLDftjBcHBpvXD1
	CXxXFHNudhYx8FGU5VwxJKzWM8el536Q5h3XyiZnOZrQ6Et+E0FyhZlWYj0Id4jD
	k/jdoziPvaF5N7R+50mShcmf0ydpQK25FdvxmleWoYcMgIH74qL4TFyALI92IF3X
	Xpx+aauUDHIUp3Uxs3eGTcZ1HEYS4oJ70agschGic9XQxQzjjTVdNIeMUYt0QiIu
	uwrAOo4Tb1Ng3iPw/hLHuZ5j7Ga4ogUnmbOfaav4KqVY/F1fu5TUK0cMRxHga7gg
	FuNk3YzlwUMeqYUAsQyRMCTOGTs7Wfqai7f+hWnXvVLnRroP3MpCeAAcsXBo2MBU
	+Xn5Gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k838x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:58:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso29913085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436682; x=1789041482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=iNrpTiuJ7cVdb9dcHoUwremxlKxX2lwbJOnOnDIdWh5hwUR14mTmGSDpsx455fXmN2
         ouLVSeC5SfoGe1y81cZ6eq8oDhtv6IKOh6rxAPO5f3ag9X2cVj1r0ny+Y/lysj/FWbMr
         KJZtiwTt84FfyV6upoJIo6fQt3Z6lH67G6jlXZPeMZhkKEoy17MPoLgCLpZyuCRuNjwD
         4SB7g4tFQlxg52w9RM+YHcEZgqyKhuSTTk06MuBuj6+DpOaLctvfwAJo9Lx8aSHpKxE7
         8/xIi/iYEKmbV9eHyVXp/ZEszllOmT8jKAFxHkD4W3pwV/4l2r9smtS9GFYinZ9MHhVl
         1m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436682; x=1789041482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=Z4EMhg6+p1xvrYpSIKWvq4zZy7PEKH6QEtTW+8TXulJNvWTe/xqzZJb4EOuY+qyXx7
         lsR+xpjqV/33WaW+12MVkwb6aas8tvbxPtYaoJwqFi+5w7FoPPK9UAl2p4PfC/SGj0su
         NO5p0ObB3s61m+WhDxpkDJ4Gpv4AKZrxWOQHZfJZlrUuLwNXgoBgpiMSsiAzJkKs8BB4
         tKs2nN2v9YQBpCtefJfyXPeUsRnUFbEdrMEUx71iYg3cinJ808hN3jYhQHXsMrkMRMSg
         emOgF9X7tvhv73Rp8dykErelgjOwzyVSLzB0djON0F4UdAfU1EjDcv92QCSAFqLnnIsx
         xDfQ==
X-Gm-Message-State: AFuF++m9JMkigV/zvCptmR+TCYHJ1s/7BakBTbczJmd6vROHnMcovCS0
	a6zNo3sAnqaCH8/EGANsnEvhElmMawHSNQ89G4upqJFD3xGyJChY+jZs2GSIu0nDNicAxtzEZg+
	dmG5kMUbZZjTUyLJHANb2lCAye1gCTYbn+CHso7UDSnF6nUaOMWTkCoXGP2mqvqHdh8wz
X-Gm-Gg: AYBFou1pI+mvxhVOj7rDmlfW6TQAFP7eoCE+lD2RoilCDt9jxg2edu17H+s0RggbkYV
	pyiulaaU3izeVoOf39WMAtgIi3zFP0TRE7ykxe8s1+8PXj622+NWkXPIwAr8U7TWMdiZfzXfm7B
	+lzDZC7YdvjKI38xcdA3Xwn1Ran+CdQLHTj7wTUpDPgENbQAks5TKM2ivUzZ9andNdkP2qhl/wq
	81+rTHq77TNca95rWpDciiChXAuSe/5dp9JZyNUQuuOSSPAqixqoHS+C61mRCDCHs7xIZuRrf6o
	hB57IqH0fPp9zvp4jIvcTYTJthvI4GcHHmWmQnZXN+IBeo6A8Z/wWCiZsfIay9CqAdrVU8XrTze
	bIgcPZR4YaXdOIGHEnvzSuA==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898837085a.2.1788436677472;
        Thu, 03 Sep 2026 04:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898832485a.2.1788436676972;
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4174d7csm89224366b.15.2026.09.03.04.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Message-ID: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: THWrr-7ymV0edYKu1Zf99_UIhNlybO-o
X-Proofpoint-ORIG-GUID: THWrr-7ymV0edYKu1Zf99_UIhNlybO-o
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a9960ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7Q0HT--lCe2piuyCE3MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2lQkqcLamQmG
 7yiL8+iJXXBZhEzYBDGbagUUoGyBecdHVJCK1zp8Fno1QBb3v5Qy41rC43PcUOVvxv8CpkxfbrS
 MuzEsFvuRkO2eSo+yz2mRCQxYBB7Diyzs8iPZN1EWapLMt68ABrcyZ1BD0bfQOHf5Cmm3rTdzXe
 NQJb8rdrHrn78a4KZDNepkGnz0RB3krt7WWLP0ko8S/PGBObw5CmJlZ5SHQ3aI6Les49xY4sliV
 YPResTlQuFLaeQB7dMV8oHPECWc7cTP8Z8k+sfjaqifNFbpZwWc+lFMvKXEdznIWpp7FRRXIYwG
 QgxPGAyrFWCj8Ct/qQ0PVB68VSKPAsVqmQMI3K6IEPd063+tXfklAHC0KDhhu6vrrxH64dGXPUF
 P0xQ3FzR+Mb+G0Ss+EcYL8g7sZQFK/WGxxv6Id1elIDjAcxlaIg2IJ9h5fLubOcxDaRKkucw7CY
 LWJLd4+5AL9AXYjiveQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX+8iK5rZw6YIS
 oek4mLGgCbjulSZ4Km6/2lZjMJPA4Lsh/VTtQGFgupvBhCbuWZjIShEnP33UZVF+4WvvD3QeU26
 MTtSz/iParjDV/f0QMtoAJjLl5pBRv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:

[...]

> +static const struct clk_ops clk_pon_clk_ops = {
> +	.enable = clk_pon_clk_enable,

clk_enable_regmap
> +	.disable = clk_pon_clk_disable,

clk_disable_regmap

> +	.is_enabled = clk_pon_clk_is_enabled,

clk_is_enabled_regmap

> +	.recalc_rate = clk_pon_clk_recalc_rate,
> +	.determine_rate = clk_pon_clk_determine_rate,
> +	.set_rate = clk_pon_clk_set_rate,

These seem genuinely new

Konrad

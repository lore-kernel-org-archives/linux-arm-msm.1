Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777476;
	b=VUNJsHicKeYK8Kw3EwG+blx6Lc3RyWuylawYw3uhZIY/QwTNVroIiJXi7Fimif5SeQsm
	 9uaDxMVqwjG9G+KeOj47GDYtgzicHuNfukigS2s+yhLafZn2S13u4h/+URuh9Cp4vNeAj
	 XWLMseMk8K2Q7xabcXnasOr/llp85MnM18z8PPO5P68TKUPWKtF9ZFYZxX/RwTWlmoCxO
	 yZQUTUPJdlp3Cw/G5AI3mJzp5iMlwrc5Q4UIWi+GerV8QYmkIuTS06YeD0WulnafzQA5B
	 N7ga9X8inyF6VJAtz0JRiSx7KVNatcJ6EMIoLE/xLy36aAIE13FTsJ+RGo5GmRjuTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
	b=zI7AL5zjw95annnpPKDZG+jp2tKU/7ScBDgbEGw/4z83ZTxs4fewcsBJO8J7k3n1IqeY
	 YHcv9tQvuhyjOzoVXDPVyfu9aZugHaYUpzkTd81/1ME/dJm2ILuKmuesSOw4htjGLATri
	 5zqDOqiiVjE+6ICnOvljD8K+m3Yut8UdyWgjZW33hM7GYTPNDyKdfhERVyb7mtBR2NlKT
	 KGVeFmTmXLzcjfy9IZGzvgi+nlNwJuoUYcBmXGzQXC869K8Yib7DB7xTJ5GZ+epf7YT5i
	 uoaUtnkXoYOAx+6GtTicBlDGw/gr0xKJCaovZL/yzUZxuu6waY8FPTgKcr1DsCQz1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgMEZ3jT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjjgVIvS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8555606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8555606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgMEZ3jT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjjgVIvS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApAo22677173
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=; b=KgMEZ3jTV7Uvwsfo
	VAHtuaPZlKEnufiObY+9eW18ErDtz2WHcYcwr9Bp3pFv8GBRmcYakMn+eN2qqRsY
	f5cGDAKmYiA8gByXHlKjtcXw7zLASf0zc7DLMjSALxk3U1sXy+28KlcKYi4DGJrn
	5UvuOGzQcKMdplhfLH5FWMBVYgpm0eXZCayTTp5hOVTy3hBmaTC9dnBjXkY1zF1n
	pDbKoRuuhCptQklV74A0gKxlEi/9jSfEj+mzCK68Kjh8W8zqtdlpD/1XSPt8/1l6
	wvoJE+EbIRtkTu9EIzBDXn/xD003PqEU4kO3dcWzTAcV75k5h3wMwJCG0iLXcAdt
	eoJSXA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh93na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:04:34 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-716edfadfecso156501eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777474; x=1796382274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
        b=jjjgVIvSEc4rar8Cr0/gbfzTS78EqvMEIGuw9mU/e7m/tmzRuq6hFzpOYxAz7qJk+X
         7iIhsq2TEWEO+FTEU2P28WgIkQhjoQlWlp/zC6pUluiilOfI73BFnYb+AnB4cDmWHV5Z
         35jeCYuD8Nv5ZuVtruhqNvkEB/UZGAh3SbUTzoxBKsDRAbA+3TLHZivUrYIq2yQGxKk6
         lkev64eoiLLl7ditiLqC7xJuY6AkB+S67j+RhX6F9JX6VgAwVPBVCqC3JS0XckcZ4wdq
         yFXp2btDaleZGFDw4uRxxZW3GLVNKCMAoAjXtBoNXIPJn9x00bemQwD6CGTHF4osQGJL
         o9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777474; x=1796382274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
        b=Eug38M9EFjTNnti3J/H4C/XgB10jHjAHSiEke3mP75b+Qv64gwi51picEw/y+q381L
         dk+yvT+SVcgmndmxVAL5oHKRx8AV+z2Y6l5L0zxUuaVGkQCx91DGTSPm39yVnXSIAKH0
         r1z9ZN9sf6OI8yXI/K2d23YSocDmm52XqFaLXsO3hEDBvY87dFrurfKKsSSyILUBwg4/
         1kerAfO8E6MWw/v5PJQ3iCV8mLbAof6kxJgyP8iry/piXyy6tS+gvv7Q0vdPA8HgEyXx
         6ld2ZxRfFnD2n4Y55cwpOGAXMbVh+DNRBuFmSdYO87X2HqLUrDDuPwPwUOuYYSvRrLfY
         gevw==
X-Forwarded-Encrypted: i=1; AL+hErHmePRujmRbeCpHf7Kjh5B4H6KIrLwYyv1aOnWrtgo3AcJ93fZDTINF8Qz/aMjvOQnJ8LqmEkLkKvRsjKcQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8KjzbCHsiQ/PXSk9vna0sEo8DykQ8jF02ZJQJVemxWGyGDfpu+
	b3GMJIGG0Cp4KI9aAkRbtbTUW/sOiI3ckndIcRBBcUwQFUp5cu3eITnbMts110zB3bf11x/zGsl
	4AJAsVFIYxIC/PQSt8l0PgS5BkL03JyGZQ1eBGAhkbInfCatduGYgmX9EacBCGVvgBbz+
X-Gm-Gg: AZFdTZcPhcJJ4jhDO2+UpRPaSzUohoxrxpTXn65fPCHLVW9a2ZCRd1yIPcZgV+RYMWV
	KMdqfNxoQbm7ZyJekTdBRou3eNmoqwZKiNaNeUqXiCMYxlFUZvNIvvC+TyhZDrH87zNeHXdAxN9
	5JMqV4CBaYJk0xHMl3AU95sNuA0pdGQBYvmMyLyhOa3CXM3cmRQ1IWfTO/sYrWdJcq+/LK8KdCu
	7gAvmlXfAj7LSDZ1rbnqmd7+XIuI2q6xORDylWYkQrA22useV4eMhJQpS/13LwHOaer8WdgTBAr
	bmTITXJkHXhYkNRCOJbTEdBQAGLAMRc2ZJkpqvWGLNIV4eP9YNlt3KwfNONFuhAi/qaUS3EvX+W
	WC9mKxUER598m3903m/IiukIWBZTR5QWeyi9WroKTxFnclMFGsNjJWkD2aBMPNhT6K/r3xJc=
X-Received: by 2002:a05:6820:338c:10b0:71a:fa12:4994 with SMTP id 006d021491bc7-71b3938b8camr23273009eaf.2.1795777473878;
        Fri, 27 Nov 2026 03:04:33 -0800 (PST)
X-Received: by 2002:a05:6820:338c:10b0:71a:fa12:4994 with SMTP id 006d021491bc7-71b3938b8camr23272973eaf.2.1795777473432;
        Fri, 27 Nov 2026 03:04:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm11206250a12.20.2026.11.27.03.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:04:32 -0800 (PST)
Message-ID: <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:04:30 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Melody Olvera
 <melody.olvera@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX8WqDl3sED+2L
 retZZfM/1xkTzo3o5yg48YO0+e5g57B3gMaoDX453hszXakhwQ611QbSoSd7qm+SfnfiILHbbWO
 tqn4WV/7Vp6C1xgbRiBYgULBTZ/GDSs=
X-Proofpoint-GUID: L8OuSqPecGLc5GnpP4TAKtG7SOYApZFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX6NgPmkpNPhie
 EaHbHh/bkQooFecFKz1LTlQjbDjXkmk12nNHK61Pi4a8ajVKjfem5bxHQmjq1y+fkatJ7kwBD5P
 m4XSPW0wAuRLKT1mDLeI5vGD7gVPr3e/cAPhu9zYlkxYENYev/6R60Xy7gEMnmo6TtN8nFT1bmE
 cmpPiFZsM8uX8f2FF2G781xJA/77J1w2gq+gd0BNjB8mQE42DMcYwWdADE1f/oWjiISLcGxULgP
 5P4kwR8KQLpIvt1SSk6ibcQLikp5xKaCEML/giLGC6ew8gSyJIDc7p54EqZW6SKYRlB3bW2KDSe
 nasz2N9Gy1VoeKzA4Lx+5pd+1j1DykX6K8p1ENdmHg9H6Z74q95TFSCtHz5TcSx/y7oX2rG61j2
 iCNSuZ4wU+BAzNLhU50I/S6fO/wv6Y/JmyqB5rEEQ7rjWo0BNdmctIVgAOtIzG+fluXOkpFSqjb
 Ql3J03rCmB9A8NRRC3w==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0963c2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FLX4PCj0tlj7fvTIcSwA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: L8OuSqPecGLc5GnpP4TAKtG7SOYApZFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270043

On 11/25/26 10:34 PM, Vladimir Zapolskiy wrote:
> The GPLL0 even output post divider table is not terminated by an empty
> entry, the table is passed to divider_determine_rate(), and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, thus they may read past the end of the array.

But there's a .num_post_div?

Konrad

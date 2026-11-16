Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812666;
	b=cNDZaO1Ix99xA3j5lK1ndsVcQgViDpI67IqbgC9wRo4oPntrj/X0H1pOP5hhhYzAftMN
	 fsNj8EJyGkzL1pCKjC/KIFis/FxvKXzW9/Ij4vdtM6GaSq/j2qQr7fFoLOLh8X1JjDC2B
	 HgIbHXQ7fBQeWnTRDjddXK/zioX11CNrmGIY57lZLGX3/FnF+5EnopxjRkDD2S7VNKkza
	 XSvFVnjhBHMg+zTd0ha8PV/bskFFdgktjuracgWBfUE9AHpkebfs/N0iTl2unY+3Dadh9
	 Wrko2Ev1vK1bBMP922a101QqZwQvGQ0XdzHfXaat25NRuBXuEFbc1VWsXAA7/F5vISw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
	b=FdFdfrWoILNLPNc5Q1DTuwvGghF09TbgXYtzttT2LpekMWcEcIvAl/767F0PvyAx8q5I
	 KsZkmpz25+YPKh+bbn15h2zEVoki1RFd0b2fS6Z8bTkE03evQllTBx28ChjHxNjod8/o9
	 /Zz5LHUmbOBwB/+It2ke9b8aietZNoN4l5RlKFnbLd0pBXQLmwU8PFRBT891O5rmf/HPl
	 YhBNWGcdr5ea1CkXgad3rnyOIneo9DnWI/DabCHgyHbY39BmOybcfhgAmJ2gjntfl98hJ
	 tDSOPNqPo54p/iStMrbM7k1OmrSUUT/xDEG8ZElW829VG8K/Dx+7euYN0OpvGMTm4PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eZGqU/8+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65C606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F65C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZGqU/8+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVRN1585499
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=; b=eZGqU/8+OWhPYFuD
	ySKZbP30C/XMF2ZitJlxPC4u3cRqLNwbs0oiTdizemAKQjLXw321Bcv8Bd4VGZKw
	yXYWti83SgW7IMpcwN39A6zycURZRxSdw4ToTEntaGwkW/8KZ+kDuSKy9mEOH8Xt
	ySysFGaF9cIeUNxZ3N4DY9A+4fhDFas2dawrVScfBNjozNMTxRMArhqUoKyHFy1X
	sACoPuou1Ehfp6bXHBhifCBR2Z99zC36S6H4DYQ0foytGRoBS0YbzMxfIiEQhsJN
	g/U8B1YJf2vHJzIMQYyfo1fOkAZYITdEq/WNYcQ0m61OkfKI9gzTq5WnqMsZd4aS
	8x+1dQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw6h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdacb64970bso1274431a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812664; x=1795417464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=YJ0d9qSP2Zeg/LFjKTfPzs7IYhktn82izo8TeU8lm4LnLmbQ3pNOjbZNrkrat290lk
         ts7S5x8W5P9PXxXmmIaoyiefFbH3rsxG8tZwTWN3sUTWSI9gDn9Mud0Ig71GYa+6ASUj
         TBFYa0rwl7VPkzW8ugAj5x2ridU7c58Ufd6IYWenjmpJ0cmpZK2UCtZq50cISQfZsWux
         GJVJnaWuoVbSHpcBB3GC27/SmPVTZlpJefVgwwBh7v6YX7kja0tHZep9jKkt+aEkHbQ7
         AxIJHzsfi3E/8ybabAhZtXkiCfz3noyP+QHceoVjBZjyRo7Bl2520x+h4LTGBbTFXYMY
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812664; x=1795417464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=GGE8lwe/YIbMR47bnLy1O3+bF2+tV7GcIjb5ImSe9JO+35u83z+T/BfnkJUW6tm3cn
         1+N6sQQexQ3ehjDPC5/AFEoqtRVk5hHc2AjRb9Rfj1ErkKui6Nmf/M6JUDMZSLhl1VUq
         Xgsc9PlziCzl5vaVhqURusnlGk4A2cIVOhgg1v5P5UvpT/HPYokdal1m7c56LeZwtked
         Ri/jzf03Eqq0cjMx7f4yH4AbQRxB3m5PAyGWAQGL3HBwUum+Ym/Sx3x8mdGfUd6l+GkH
         ON6fn4jWr/qvX49Wwzap3j43Amo3Fcq/Fjez20l1km0PhOHzzd2RF0K88TT8cc8iDuxv
         m1FA==
X-Gm-Message-State: APuU4Z9hRFMPNdbyVMpQX/AdXTP6ejNtTTEC/q/aAnZNeCQFUYgsvlGQ
	OF3kykQmg4w8bWfI6oO4bL3SX6RnyvNcYC3QfjW1gp3FdazbLWe3d5QVid0ov2gjxCaO9e1awSn
	es1+6kU741jnShg/luTsvQrR1g2seJwq+hAVF9/ngiv9R9ggtt08JIN5IkfXfL27D0dN9
X-Gm-Gg: AYBFou3oQhiN6ysYpd4wprcNI/LS8X5LkWTh8qc3bv16kcBspQYQNuiTBT/IbBE9mzA
	bDOC3j5OWHigevbsqFkjg0IKe4pFIVlNjszSUGXWiCLPGl6eHMEauCzBvB0TVF4pXuisKrnSAU/
	LTQHfLBmOjxbSnH6gwrGmR51zqenY8XIWUpDh6DXe2GyBMIkeLsPIN9LZ1owhuWQmo6S45q2IYW
	K1ytHV7YW8l+psorWwrTrk/9VcBcFHBxwUu90SimSB5eLnSf2NQqVio82tsqAL+nVj1WzAWmtPd
	jOlhHn0yNEfRkHhrIQi3/dIAEio80MyhmQnEZCCyURri82L6kZ3PBHE1XifWtwyqBMqg0yraxAa
	AV1FfEsSYdCeq2Uzh2rflOVBayEG+L5rFFKRJPAZPQE68vaQ3QN/8Axkeu2Bd8Odv7m1vJrSBhA
	uuZw==
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731028637.0.1794812663962;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731007637.0.1794812663510;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Received: from [10.217.216.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3159661b3a.47.2026.11.15.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Message-ID: <92001145-02de-4a73-b904-a2e84645ff7a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:34:17 +0530
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
Subject: Re: [PATCH RESEND v3 2/2] clk: qcom: Add SM7250 graphics clock
 controller driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
 <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaaaf8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tvYaUqEbFtj8o43HNvcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX4dqNiRzRP8tz
 Cz0Y16RY0mfx7Y6E+sm4FC1kYgN83zuxw+p8KlQSbYrjYATDGo06iTss3PlVeLZihhwU6hYT1ND
 N0oiLvwJsMKUFwtfxuLsI/Lh06Cp9PQ=
X-Proofpoint-ORIG-GUID: 3Ygx0brQKy4aaELx-ZTnwOWkumLBzRo3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX1Owx8RY6VWmU
 7ra32SNKFkQMogU5UmnfPn7ruGgAMKa4nch0CJVNhn8UhEpCyLrugN6yS/eN4gj42vUI83eJmtb
 Vw1kSQqv+SmOLeWNWLih8JMjjiUQYm4LgZaaeBmRLaMFWX1FZAPUA4LPahSuhN5X2tiBPtQ6ZM1
 p/Qa6bxSfUfTrGB3l2cutU7QjSlQZdenF8j6q0ws4EH7sQLrAhqrf2y4HO1ZHI0QFbYmBqRyDBN
 WeexcYaQ3XGUixJLC/Vm8tHbDWjHXY1KA0szA7Sd5rxtFNIt7Zb7mvqRJkzRWv14Ozu8sowY/zo
 Mox0vbYM/seBpjpfc1z5GrT9V+YaZnX60e3yApW2jTtYiUEvijYL4XRvbQAJkFl/Rw43rI4NX8+
 du0A/h9BJVj43fah+ks2kKnyo934frZxaSWb66H1yFIF3KQL0LJPwiDotLcsKvH8B0ZvKX5xrdj
 yN9w1EPf8u7v0pN1usw==
X-Proofpoint-GUID: 3Ygx0brQKy4aaELx-ZTnwOWkumLBzRo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027



On 11/16/2026 11:51 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 379 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 390 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B615540AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955957; cv=none; b=mmIz7gFZ388JW4W3asWIgkMqm0WFo3zT9FTdvFYEfbMOI56yT8ITfQy1QDQNb5rZSNPQmm/56NUOibuiVIsKOJ7deWU/+cnuhQhB6ULm+i2XzwZpJJsbKFI8nHJ0kyLDhLC0U4iR1LWxZT2CUo1gwzy7wibl5ezsE4ixNrtTE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955957; c=relaxed/simple;
	bh=Np7c5aBXs40Izu6BhIoBcwK6jKTo21Aj+MxYQLBZy98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm+46MeulaKTgFq/MsA8+BkAeJIfnvKhcjNGPlyB0CJa1Jt31Wcy5jiklMbAhkZB9zhoJIxvtDJZRa4zIAs5bDckMCE8YaLMe1eWEl+kSzmZE5iD9Sw9rIKCuq15HPH184hLWe0CHIA9PKkm3R75Is/6iGaQhDMBQRf3BqwylZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7M4UGz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+9aU8Mm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7M4UGz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+9aU8Mm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4gO1183711
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=; b=C7M4UGz4QFPthV4l
	yS18nJkdeOLTVx7y2IPax42+mmc3Hn3N/vFtUzCkfsi4g1TpYRnWBjn79I4SjjQK
	CA+Rw5WK+OM4fY4WM6PCNzUVoloKqk2tP/5xDCRp6ybEy8RN1hIESUbo7h+YUSYa
	eopKOdWSgbvf0JWgYg+XXlzknNWdemqgqnpNS6F8UeGZocMSdLYSuCrdP7yv28rW
	8ymbtsktpmFoMPySPTcJfEMtX8cMWgueiHcnznBzOxiq15yVKy2ludY050OcmJHi
	5zslGt6qMPC07koi2QMGURnRkAxmGcgaS+GjXKSC2hf2F0NbXtKPztONVv5f7Gwd
	H3gpAw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rh0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:12:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so13686406d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955953; x=1789560753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=i+9aU8MmP7crlQsa8v2mVL2axFoUc8KuSsYKQxYJ/avR2EIXhBNE16h4z9jEisWrL2
         YCb6eXMyb09vF5b7jtz19uk/8euMJYViV595SxHNm4o016bMHmw5+eFHsjnnOONFfN48
         FnS/USHD7ETlq9UuFCXSE+bNE7sSYcPt1BcLHwZW+oP3BLgJBWmvRKlqP0Q/jeuWFS5n
         hiVNjifnrMC3NFFosULs6eafYZjxa1avQ4B/ygjKtbEUi3kPD2/aBPQ16TKY5tYgrt6v
         N9ZEAlEpYcVQ2pduKpZesN59NspuM7U4DuQqkuTTthloGY2FvB0dXr5QkVYHEOo73E8e
         vyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955953; x=1789560753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=MoXT6mExr48p8RjQytAqBxDmmvzy8b+FnzqlQ29rdk6szuqHR7oJm5KOk2HV2LMRdj
         3yEIZoioRngv8xYbwmlLG4gmUzxS9543lGyYyTlvOmjkK2H8mmheJQk2gF6Ux19C8KY4
         jsf31Dv/+oDFvJ8XA/zlMYXlTdMkZI0nJZFtdJjdv7FHRIP4mw3qLNLW7ra8sKZAoRAH
         y6TiRGlZGtXh9OFmyD48oQq3yBJCGrwTl/gNC5yDJXogw3HWBc8qHrBpG7XVVn2xjKOg
         G7fSfmQR6y/e5TXv2WU2Twf6nf0n0U1zWKdlpQF01AyyVviICv9XPSaOj68hCNCFSg7D
         k0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBw+J/hz4XwIacjNETcEUTSElT/MZQtcUomEwmQkofpciFsNzjyDhqNVu/KSUtZMqfFEY3KQZlqN1ZffGFt+@vger.kernel.org
X-Gm-Message-State: AFuF++lPRuqLuHCDIAho6X07HOGHEZiYP9yTG7r0q45BC8Q5CiVo5wRU
	Cxw24smXcD8FqoEtvhM2WiMKJYr+eVnVGHVhrcnFlqJAjuJU0/wajJESUx6uDAoJd65X7hRlLsh
	1Nr4bMTwnxR82eOELAERukxvQrKON9BUmfdqSMjDsUQjMuZjx1jZXhOAg1tAM5T5SptPB
X-Gm-Gg: AYBFou2u1dt0W0362Tj1luedJtGZLcj595GRdAW30W1vjBR80Qh4NSFGJ4X4aVXEqH1
	/jHtWioCSHAKigtZ2tsRJfg/o4QS8bhvxmN/AV2CNKF4qThD8iUUrAem3lQx0TebloUlScVTRBD
	9s0BaxuUeo+PwGzAlrUncJoNr0yMrsTRyRtrU4OWSEHaHrAJk4HIkQjmU4vGUKFqDIZBYyuugJD
	U1IdvLzZTVTT6kfNCS30NRyWTa47Xa0GNU5s4/MitxiOYsvZDmPCOQ7Ta2ldngFLc89nhDoEmxM
	qnuSHNX/VErT+plbCq5WEP5zE+uvRo7sPc4cVTD8vetphr360AAOXRDXkeJAZvD2wAmsAiGBM+v
	/P0kdV1pAMvNsQ+4qixA0rA==
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268739866d6.2.1788955952679;
        Wed, 09 Sep 2026 05:12:32 -0700 (PDT)
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268733556d6.2.1788955947372;
        Wed, 09 Sep 2026 05:12:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm752132366b.3.2026.09.09.05.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:12:26 -0700 (PDT)
Message-ID: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Mieczyslaw Nalewaj
 <namiltd@yahoo.com>,
        Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
 <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
 <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
 <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
 <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa14d32 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=W21wEWUqPQRnM_OgY4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Wmj2LLMkkb_2VUS2iUFSNfco3nvlzabm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX2YSA1spylYg2
 NDiJnF5H52hyxRoNWv8lLfJyuaBqcfoTwcTqD0g7vOvzzdT0BVn0thoolTY0BBoyPoc1iGD+u2+
 gnoM0vVHz6QsXHOWZeWHrBNl5T3p7r8=
X-Proofpoint-GUID: Wmj2LLMkkb_2VUS2iUFSNfco3nvlzabm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX+g3q+5vbSqqk
 4Shqhjj1eSznyPfyqhfAjBK/+483cKexNw+ycdl/QL0blSEmYC6Cn2TiGFnOeSa/lKGGDLvejN3
 QXgiL/4LZGf1/NYf3piq63KHAjaqseQe3rHGqcoseC/ju6XecmcuyFFB62r7SwXISKwjslcCIiK
 Sr9l8dhS5sRNRNhoQfkN6DlTQH0/cOkCSfUXXKc55us3UmeaG6lI3Gww0AlMRVGA/LNycq6Iqw3
 w0+mR58dkDMK/xpw/QBSdZjmSQidYAhVqcR3bvB+YOSMTmDS724Rch/c35X/0Iexzt4nXv4gU0V
 qM7KfefqaU5KGhUiAsR2wl9isLnPjWQW81OigWEkWT/w31zrytXgJKAgzOHERKQ9E+EkLtBqUme
 uETXY+RXvSiPIaaxgEtsN4Af4gG6BVcq2Ss2KXDJi/C+YJWdRBWlTpT/9hwm+Jjr6ewBcMn4nRS
 pL2YK/QjEGY6fkF2ADA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 8/24/26 12:28 PM, Jie Luo wrote:
> 
> 
> On 8/22/2026 7:19 PM, Mieczyslaw Nalewaj wrote:
>> On Thu, Aug 20, 2026 at 01:39:52PM +0800, Jie Luo wrote:
>>> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
>>> continue to operate correctly at the fixed rates even when the AHB
>>> and SYS clocks are disabled.
>>
>> The PLL outputs keep running, but the AHB register interface does not.
>> Once autosuspend gates AHB/SYS, any later register access to the CMN
>> block hangs the bus. That is the bug we are fixing.
> 
> As far as I understand, there is no expectation that the CMN PLL
> registers need to be accessed after the CMN PLL driver has finished
> loading on IPQ5018.
> 
> Could we identify which module is blocked after the CMN PLL driver probe
> completes?
> 
>>
>>> On IPQ5018, the CMN PLL provides a 50 MHz output clock that is used as
>>> the reference clock for the connected Ethernet device.
>>
>> Correct, and that consumer is hardwired in silicon — the internal GE
>> PHY and uniphy blocks take proxied this clock without any Linux driver
>> calling clk_get() on it. Therefore no device link exists to keep the
>> provider active, and CCF rightfully gates the bus clocks after probe.
> 
> The UNIPHY block is the consumer of this 50 MHz clock. It divides and
> gates the 50 MHz clock, then routes it to the connected PHY or switch
> on the IPQ5018 platform.

Is it only the UNIPHY consuming the 50 MHz one?

static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
	CLK_PLL_OUTPUT(IPQ5018_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
	CLK_PLL_OUTPUT(IPQ5018_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
	CLK_PLL_OUTPUT(IPQ5018_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
	{ /* Sentinel */ }
};

What consumes the XO clock? What consumes the sleep clock?

Konrad


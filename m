Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5F37F00D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224302; cv=none; b=bzOQIlUwRYX3DkaQ2JsMNghRux85/gX6H/iQhZZLJ/yz3elsRKQoZ+EcpRokeXk1zqIKK66dKr2f43NPJrq3INf1MIqBw2bkaos6yCjdpPpPCFnjhN79DhacU7fgfTHYJPiUOBNVLeOJXWd8eWvShkNPFpXMfRVSLxUU+DoLN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224302; c=relaxed/simple;
	bh=cUZ6i2Et+bNGbk5bcnO3ZKcnbZRCGsfE6AsUyJKB4h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7gVSLiwiAXWqqYUeJDybVlsnvGzxJ/Qnyw24QOgX3DfcF64cqDw2rVjP6psBiGgfNHLjPTp1s0OCZ+8WFsHN2jHduNZY9wPrxYKraJl7ZhPcjjwUr4JsNJgkunsulFh1uPHAlfOgKFMJUAh4tiOQXt9R7qkIUyVLeM8s8xHmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIQB/XWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8gTAXMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIQB/XWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8gTAXMf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGT3bj3172626
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=; b=eIQB/XWlMZ9FAV/g
	sFAO7WudT70e3aLk8CeCaK3OJpOmX6ZbYRMMePksLLqFKYMKElAcuBhFB5whWjZk
	Ja+Q5kID21X+YK0i6+HVEk2f+mqrI6y2pEzp6w4weR4aZfu77cwSOA3043jagd2j
	gCqWfQwDvq/KSEKSEmk3qEY+raNrTqknZdvnf0MAh++tRUyZ2ykgGMY3AZmQRRYg
	oQAE7WzMHz/pcggqP1rfR6ZE/2PLALpFsyarfXhCbs2eueg8FuXnEqqvAjWLwG9W
	nNOyqUe9Ew26O4hDW4u/yuKGg17v9OhKW1VP5ixE+MnxwYHARTIqFYBxJP5YPA3s
	2douiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv29bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:51:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so22193181cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224300; x=1784829100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=;
        b=U8gTAXMfMah2snxmcQmOBnoJvCqzM2sfaqp5oRkFV7qU+5PUBC/uubbrO3JSw/LYUp
         sSq+2EiASE2YYQ7fm1Oac9DqCBKuUV1H8CUdUjuYRxn83k4UNOZW7zFbVra87F684b/1
         LmwUhqf+VJQu1UC4fGI7yPeEedn/9EFJSBPSCzO5QiSJeng++zFSMDJZcwI1gIl6/HeI
         rTzu7MUL2EfBIS9IuCPj67IdLgggSTeaCkmEFxBR0vncEiulXdztN2NHDhfiJ/JOh1Nn
         c+aySlMk+nFRHHYsIbJGR7hgip8mEZXnDbxxjLVgSe7Yz3+gO06ovNSaIiVKZD4QGTwR
         /eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224300; x=1784829100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=;
        b=tC0JTqwjfg8+gh51Q+OBZYx66C1qkcbNZ21sBHqv1FfD9fGqo07+IHT7cBN6uHH8Ns
         ebzTX9WARYC4S063EJpr8g+WcWJDK3/rIaUm9c7Twy5jBdbD/i446/z0ydr2AnyZhEP3
         45uZR7wT9yDy19jHQz9IcheS7VszIXtQ47u58LkMZXxdjhufVRrxs4q0C4YCvBtclBIf
         JCRfMmRusw5eoxURyfweJZk4Xss/z9RpuSQvu8iYYWO8Mrpgyy1ZI54V6eOxu5hOf+o7
         Uz+oAckbP0fMRsCrM9Az/kAJP/kFDvqJdI51gowDZ1apF4dzLgPY4SJGf1lwbOEpWGgs
         bVMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3nfuaywnxc9Pb/VCmqm8GzbySAluifSH/OViRDD7MndZ7uqwsFe3xWymD6X46NQbciyxx+inItrOj9057@vger.kernel.org
X-Gm-Message-State: AOJu0YzHG0foOOPqIw1A6zVlg0JWKkGkVWUDxpot9e7pDdkjxsknUhHO
	LEDSuNyKJ2zWHthdV2E6oX3FOYwUzJ2vuMqRTWN3y0NhVpcnRy9NbBLJ2kKCl/BiOap0+mOd0Q+
	l/VH8bH9Z6/Do31g2d5JcuXfOApz3IuOikjXPhp6ge/+WU5UzSSl1DFzcDwXQLeDKwiRM
X-Gm-Gg: AfdE7cnlbqLU8iOyoQNdARN8N5QORp94b1wUzrLwP7XNWWP3Nxjx7+gXltupPRIZZ+F
	/FNlS2NHI4lxPMdusohs66n5SMcU0u11CQBfAvIiccuP0fWs7YIOd3R5bYulNPefnfTTd193s5o
	c6xSv/ys+A57RVyuQv/KT9sdslb9EdMeb7a2eIG6bDoa8A0Ycrstanb8zOVLyFh8KKe2CpF0TH1
	GZib6bFpyVuONbnVvKaUHNHj1F2lsf94CGQwWuBUW9lu7HWF8HTJTdkSasZqxBguu47ByA6Eykx
	F71Ug2g+XQrF8WLgy+t3ACTF6IpmX8N6/Fd26QdNSCghWtc9AahMOQNlOi+7sGvEGaNcipoVJFQ
	3+Z/+HlC5onZMcAeyXzesCrgp
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr191507501cf.4.1784224299626;
        Thu, 16 Jul 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr191507271cf.4.1784224299227;
        Thu, 16 Jul 2026 10:51:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd289dc26sm5032315a12.10.2026.07.16.10.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:51:37 -0700 (PDT)
Message-ID: <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX+ZOTeIBPut/E
 UttixKjHSCvwjbHpph9iT1S3Y6n2FsoEWCoZL0NgAVKjVdBPoJxw2cpA/9vFqijGSU9oUrI483W
 +ANMP/p1q5FXEF74NJwsuW3Q+zSnM3Yfkjp/fucl+WG5dZz2bn/WX3MY7eDkeO7ItLnDnK8fzUf
 Bdh4pi/4MXlr2SahNyG9BKjwc36pFr+ocKLPUsGvoAQfz2VbW9vtKvMBlk7ynE1Ycd+afpQF86g
 +m0mA2rqZHv/X7UP8DLEBD46ySlLwVg4XE+D2Pyci4pmkZz3N88JhsCWLF2wH3E0WOM1FabdbNO
 HCl0P8plr4i6TCxWC59pRpurO660wtxiQOmIOLzEFtkquLz5f7lOi2wnUMcq/owIf1uRR+u+UPD
 50pmupkXilHWjjsO51lw0mf28tCrMN+sS8temkDR/DKm6SwMzTBo+2VilMrJX/F0BCs2LtOT4V+
 xRMAepB3NA2PFYTyk7w==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a591a2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UaOxsxZaHnh8_INfHm8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: b_JEva7SHxxySNWv4p85QrNHe0VpJnMp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX1lbt7aGcVhli
 djifItIt0Od34f5SP1NMvSLiFuLbqNbp6tLgVw5wrUYAa+88jsBCtKTbbMZ54x1m5c78E6GTbjA
 hBc00OWOV6k2PIE4h3aTXxXL8W41pBo=
X-Proofpoint-ORIG-GUID: b_JEva7SHxxySNWv4p85QrNHe0VpJnMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160182

On 7/14/26 9:21 AM, Arpit Saini wrote:
> Hi Dmitry,Konrad
> 
> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:

[...]

>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>
>>> However, this panel uses MIPI DCS based backlight control with no
>>>
>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>
>>> we control it via the panel's pinctrl default state..
>>>
>>> So this is platform specific pin , we need this to enable/disable
>>>
>>> the backlight.
>>
>> Handle it from the panel driver. Also please fix your editor to prevent
>> it from inserting extra empty lines.
>>
> 
> Earlier I handled it through panel driver, but this GPIO is specific to our
> Qualcomm Daughter Card, it is not going to the panel connector.

So is it an enable pin of a voltage regulator maybe? I'm having trouble
understanding how this is all tied together, given the panel driver
uses DCS commands to control the backlight status

Konrad

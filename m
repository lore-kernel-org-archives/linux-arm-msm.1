Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900397;
	b=JhTxYIwtIwt04BVhzrRDqZUCBGkwYW5UCBZg7W7Hpr0q3iJxIRsF+ms4rvlVxdyJ5/cV
	 7CI2vZdxo9aoBF1L4TluLHma2QduBlDOScbLyUsK9PH4dvfHIm8+eNCJDMUm73p9Q/wrm
	 R2QGjoOzjGxqTZcP2azf65xjPYO25bywHSuGSLatAThgpOA86l5MN+uli/vzXq7YLcjt3
	 IxVvQfR87wYZ8pLae/uwpm/Dajsxyb0RlMWe3knNtFD5rOmShli7kZ+C1HWzZnc8NG0AX
	 Pw9r59OooGMAc+xDyLuCAqvqdaBtZGm30RRtg3aruZqFxgn1wWY4tw96244XPs9cCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
	b=cKmgtf5q5I1SYR6uqeAifn5UYG3699geCuxltOlKacovs7C2/oXtizx/Gcv2/NV/PacL
	 mi12mU9A/+Hb9kLon19Rri8p9+oHJ8Nv0eveERt0mJ59d/RHyJYV+0+cHQLENH/T+cVsx
	 jdHpa1tR0DUFo2jJaJqQBngB9M7eRkCKzumNj6taXrqVUEY8WCQnRnJxKYavqfKPA3lcn
	 FHmITg4JIkpzdhIwQ1ge/IS4f6Lg3BHYUtpgGTA45GK+UR24CIuV3OCMgv2VgytlrtcYb
	 nfFC+K45Go5AjQR8PcZ5duFeW3U3Wwa9wOlIG1hBAstEucck4SbBaEINdJi73gwLFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EADD606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EADD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aNKs2935297
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=; b=lwBI+vibggJsAHUf
	TCibgt8UJOSKTM9ZWDAoXdJG0eTAAwN+BZs2Zfqr3dl2WZWedkfVjyOfA3EinHVn
	7bchx+Z/R3g8uOEhAqcCgXUbLziRN0fwiN6TEzQhLLXbKw4WJ54GyZ0NTu0iKJuW
	TXmCGPXJFioMr+f/kIbaxGHV2YuKhzv34o80FsQY8REGgDdgFK9WtsUgIVY8zKCm
	vTpRHHcNXtlAvgyrszEI5zySfJbUUzi08aoRjpEsfWC55yRUJ3T56dReAwULA0Jo
	iSJgJtF5UNS6JSsKG5emFVcH2GfFcvaOOm91zowj96zUKltq8OpoJjaYfb+j0MMO
	kXWBnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m09vpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:26:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2775006a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900395; x=1795505195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=QHZX8XTfy//y9AHjo5mjbBuzMVOo8P9v139xj0dLBmLqOTv9FVumUmBNom56MPtmhe
         axIugMLN/Rb19QPVvv7Jd1k0KU+ZFF2G7wf79E6TApllfP4ocPpiyJPAARj2WYBXqmG2
         vYMyrVGt2kvY88UiZOPBAWI/fWZIqTnM7J5qKIaUbe+BjhlGJ9Kujg4eX85xfzkwko5V
         oS9vWygNTME9Z2RvLxg2uURNlZMkBUS4KLajwbO8NDnzZ2N+7o3w2snuGBditZ0xslx/
         cIMSGGcbDnOS8DiM09eurIP/C54fe7nMnaoVGSydPAJB7aWjdYk9uyXGW0okRq7AH7cy
         XrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900395; x=1795505195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=j8CUqBvssbC2bY8/+H5ZeG+TEuCy4mlg3XRrfPYG/NvWpIxf445e6yebFCCwwuXoyv
         6RK1LHRmXm1P3zyJnQk3+F09Qtf1APuJPuFeC7UrJ4s2LWosi1RxJpWzntc+NWJfQr5M
         vZ128e6SJYVnURrOmEVPdHt7Pmn+CSJVTb0H2KWYout18p4inHDHKMnMlGT9janLCdB5
         anD7oMYEoaNpNIOohl0F8U+7iWVPRlqucv4wfDZnZLAGclZgO+WOmYzhedmPiERUgSG4
         p2BdWcM8hlvy6lvzhdkVLohjgmc7fpqFNkdiSZdbfMIR1Y36H7xEVj7xHFPadCT5V3TL
         51/Q==
X-Gm-Message-State: APuU4Z8YfPuWxuxbRr9cNvzxy7uZx42yLUoFfzIM1TT2nmqN/HHfy/bC
	EWHOvgQ7rc0A9LHkcYxcSvvKMn3K6Tx7WODidib5z28emRgrYEyj5OO4Xc2XcNPshVQ8+bXILfu
	CK/f7LnstMHv7vnzy4Mz6j5y0vI/bLCQYs57c5xcFEcfjM6GgSGQrM3PzIfkn2odNQvdu
X-Gm-Gg: AZFdTZdbjOwDiZ2pz3iXfqmsAI8XQ8FG1nauBtIVeG1O2gwCQjDVrEu3D4FfARn0Q7k
	VNwvCBHSK1V94W0s3DwgZYXuAPhhr0rRjqmDng/3n7imHBoFkjY8wzgtWRCq+3ppp+K2RYq851O
	of2srdcxNnGjNQ+6VzIuTY1eGMtIqmPBpTZoKfoKXs0DECp9fbWoak/BF7FByG+WZY8HXfNZIEk
	YZ6EGpbzmLLYnEgvqc14V8tkCexZjreTIIcfLG9Iey7Y5MeDplzJI9Lkt45CwDYhokV9YFASjGW
	fXYKEZKgAM02Jo5bOYTRUTZt1OWs3wKxQHAeqYMQYUnpx2Oezd2riiOSF9MT5ACC6/EBytqthfk
	CGHT3GchhFkUYPuAN38iPdNOuHmLHZ9KRYinK9FmZAeZ3C5BHiAlnvr7jAg3A1/Jth2wMDa3P
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117644a91.35.1794900395167;
        Mon, 16 Nov 2026 23:26:35 -0800 (PST)
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117617a91.35.1794900394563;
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe78930sm2697549a91.12.2026.11.16.23.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Message-ID: <d880b084-ed36-488c-98bf-fe9acf757464@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:56:29 +0530
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
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwxJu231JYduJ
 /+4CXbetyg6aRX/v11E5nnmwryW01uJ0hdnt33mLlIWYvZZgEqOvSsISppnQj3Debu9eRB69ukE
 iyy4p8S8qJtlZGmb5L/Yd0US4vwBzGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX+9V9X76APqjd
 M5L5HKPUqAxjrz8sHXNOgWAb/ApRBIOMktr9duozNyfnBa9Cyz64K/JoVHqt9uaKMRc/9OcwHSU
 GH6shP50RgH/DCTJ8X7lWOGP4BbubSOd55v3We+tb31QwLEm4snzEbE1C1zkqrlHypD+34vsAdC
 sIUkvrTpUTuJmIhc9b9FwSszTVLhYL6dLQokngJwNwJyGSWfTkjqg7U/D+H3iakXyTurMA2uaQR
 KzsT6AOm58jO5CFBHQ0W3fwATw13PGSNb3sojaL90h27uetysIwjx8z/gsvclWI8iG9cGejYx4S
 eUBbLiSIZozDp+8MoArYtDTsAAk36ogtppguXJtgXCuxp8upnGEfHznoq913ijDxQ+4IseR/iv6
 RAV14TUxXKXIla7MwEgpklSsmRY0soIKVJ/xlkNhJdpMiEkiGHuUuwjL+/ZbBKQQT+cDOoGKR7f
 RoriIHFZSn0r1gKhluw==
X-Proofpoint-GUID: L45vonCusWfFv87Mpmbe-d0ioMOfgAmy
X-Proofpoint-ORIG-GUID: L45vonCusWfFv87Mpmbe-d0ioMOfgAmy
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc01ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SKk0sALQ5wlVL1HxRVsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> This patch produces dozens of compile warnings and is not split properly per
> subsystem.
> 
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

Initially the i2s1 functionality seem to be similar between this new 
pinctrl driver and sdm670, but now for further implementation upon 
further inspection , there seems to be differences between the 
functionality of this new pinctrl driver and sdm670 for example : i2s2 
functions from LPI GPIO 23-28, will send v2 with new functions, hence we 
will prefer going with this new pinctrl driver

Thanks,
Karthik S

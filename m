Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569494;
	b=jkDJsI9pTGO2I7dE9cs3/Wjcr68lPJXNaHfi8RJQWa6KavhDaFQm3xB/tF2H9RUohVoU
	 LWH7R9ETZNrJt2sXEA/iFO+1M6oIPVd+BOR3yNm/a8lhn8rK9EOuT38170jlKoGkCItCo
	 rFqiT18Qhgw5WGXtU6aVrxW1MooHRV0ILKGZV9v67SzccHnZnAQ5JfcAIQi9YWw5spzp8
	 eEQPPG+csEY3KTxsdW2GiphxN5m1zl5lW3mpO6d2P4uW5GRv7LZQ8VGE5HjffvjuKTk3U
	 K4xGOrTYOK4FjMpsZbjXCU5sTFDiE/GQ4F05LE0xDc/sXDlqdExetZ4bH3nCzxNmvcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
	b=wkgphge6isBfsHjapnwbHTGSZix3F5HXmvZ8ZANxhDVgpN9ggWmgHhdjUQ3g9REvdYmC
	 Ys2lQXhu2LLM3bCVvoyJtwq99wHFYwVe3Fpj2mC2pVnekfJc5s+P/xytCzP1imuxExnBR
	 a2qjW+ZVbCuy3nOWsfbC9yg4rRAiqfP024VSbpgSPdMefILsdizBHUmpNBumJXPoZv7zj
	 i29GN55AqsuoO7AEKt+qgbxjf2VrTj1DhB8ScMsE4diQ3gziGkhHCqdTC0Nai8SJNEBss
	 gI7BZyCMk6uXMQnO6oP4oLQn/zxMZzI3+QT+C+X2+duTSJAs5uqV67cf+NM+bIVZTiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767CF606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6o2793354
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=; b=JyRg4Okw2lzPun4T
	8MHA1mbvUB8lV51dPNLX6y8pn/PiWSA+2gtprbCZ4ZsY0hcPF9WdrIylI4CEjBQj
	D4a1erK+AX3S7vXeO+F9ogocVkMcKTVoReurMORgQY2bqMPRfnmGRjIb7r8nxL+0
	odkMimf7OXlLfXTtYjJ4pFg8JRObXLwVToiY447omvbw9FIjjWuGFKruwNOMY4PA
	Gsyt7ORqCGGaSa6bjH2Fma04fxolydR7ZA3etRiPB3LjzAdbuTSSTykcPyjRtlRa
	t4yWUF+1YE9prsDrdzMPGVeODP1X9GAkyqezqzTX0dCIbZLxZmcXrt9SlwpEZpmi
	SA9TwQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabjqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:58:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so2615816d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569493; x=1793174293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=D3uxpkYDAXpfUt2sshatG3/Al7P3389pCq6BNlVPmooJtnj3Xy2ncMMQy80krtq6x4
         RZ2LWKnSQmmZhhNV4xtAqyBXm3TpxuDSBbhLImm+p2Mm6WVLghJE3I9m6N/0hH9yyHWs
         MHC77wzOk7fWzvm7QiB2hpUJYZZbamU+6jJNiA7UYUjvd918XWupDjkBwjA4NWbXtxpG
         ykZl9B2MXtprCcS1n+O0B21Wu6DsxpMPgCpX7hFe8CyHonXu5SxlFjwtNjxw0Oh7S5QQ
         IthXjhssFTjQrA6HwxXLdUhg175rWkv5sX3xyZIKN7QMjBPr+OtUyHLFL7u/AVCf9TY2
         HVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569493; x=1793174293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=Gs2GtQcfdv8SJwwc5ni71JSUypBxikxdYJyzwgZ8Wf5wkjZjEkR8kJ4cBrSZ+Brbph
         byqhaJ49Qpz+1V25iDTJs66Nv21PkNVU7dfM2TGXkQ43T5UhaDh/wNvSwWX1u6dQlAF3
         riy0VbLfUhWdllRgiwYmDSCWUlqwcM23l3d9J8KSffPLMylPrMm8PDW2BW/7KarjLdPg
         tXcTzZk4bhoqnxgIxwUX2CcO1hbUC4LPXb1xSCEtKNgqlsEvUTExXuG+mQUNKwAGSui8
         thRRZ4zUymdO6DnfCmMvpu4MWSJAYpp5+v+ixuJIZJculfEo46Y46iM3Fndq95w1ilnh
         +9CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyi2WBs3FfcqQluVyr6R0+euqc5THlAtoarTdBNHUTyIu5y6+yqBybiRohsuLS8fQvMb54i3TkM6xTYwu0@vger.kernel.org
X-Gm-Message-State: AFq9FYITkTmwnvOdibyO8zqw3theAr+QF3sPTJZwAZx7/8MVjfw8FZST
	O/22n4m/qsWrOyLfuFv3CVaprDpMHPIuGS53SFOZ8pmOVHvQtWwl350alGB8PC4kF0WukF5arSX
	cuVIASDxTrBIbLzESSdaoG/GaB/wdt5ZotBmf8KG3HzL0KSsV8SUTRqJgV4lhXodT6Uw/
X-Gm-Gg: AYBFou0+otKsLZCDCMuefM1ildJrOQ95A70GBYXNN9E013A+vGlqAeso4y6CMesbJ8u
	YyZ3OIeQs+uVn4RrjFTbo6LJ/Bz2q+IS+bF7Vh6wX8WDxaIPRRxVx6Dx1hUi65+Gkhdi0qvBgSV
	k7y2xkemWU1KLjElxW89Uu+jQdnGymMMTFkkWVzxytPPb4MXeJqjR/nl5bTR2tVXLMxdHPNNJL+
	Mh2NGl4i68RDHbD9Edy4YRYt7JW/bqvok5CeQ/hH2wJPG0i2gpoU1l9twKiZCW/ancaKQfFjphH
	5wvHaO48Cs30Wu88YhC2ceosDKt60i7x2n46xucFHIbsCAb/LZvpzsm8E3/FkaDicmghrGVzpgy
	rzDFtAn7qQKsJ+fYq6O0Pgg==
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23732181cf.4.1792569492678;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23731911cf.4.1792569492191;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe5479sm49671566b.64.2026.10.21.00.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:11 -0700 (PDT)
Message-ID: <fedd4398-e652-421d-8c85-b5afed0379c7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:09 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
To: Christoph Rudorff <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com>
 <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/XijOGLMxVAX
 zWP1sj7X0sqHCbV1cGcHTNg6v2q4judgJjAIjY6HlRCQ2+26XEzVbSYSgsUxCrA/0NmJTs18bYh
 Admjn3CHMr39zqUsuHkZzf8QCxebMxw=
X-Proofpoint-ORIG-GUID: QYBysRTN6iQq8epzQS0VTZihH_M4hUCP
X-Proofpoint-GUID: QYBysRTN6iQq8epzQS0VTZihH_M4hUCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX5m3NIwcmOB7h
 jtOMiyuAOsiKUeuVymRLEc3RJbiE4+W/FPs3Il2WvO+ecfZ7d+5Aj73b6vH9V00G8w5sJqCTTW+
 kJw3Oq7elXM2j7hJ7zyOXAmybRTZ/Ufx+54zHFkHjnYJckrxb5Oc8vbpGcVkp1Vo+3w8e6QC8+m
 EOnJu0BUlhuqwyEdY3C2+pqBNNc4+2uTddK3/JBNYSiFAIvVLzR4H0VmE0ruOVxM9ed0VMe4laj
 1sWV6M8T3AHFWexy0bdjCQUzfcFHgQ1hSHTnrco2pUYb+YY+2ILoiH/HUW0c0KjUc+UA1KHAaZE
 WgL7EJbVhhEQFMKTDMDSb3ocrAV9TmtXGVWic9UHvZaUKlU9NYnwDIFy1BefLnZ/Tq8U0q4d/hC
 TJt2pOe+7cN0nUM8Xn8HulUBNjcMabTQGqvDNBwTLl+LfyS4wXbyXorOleFFYgAFIQINnRoLcxi
 Nljt1sijq+hSDIMRVqw==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87095 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qfT2Yf8mAAAA:8 a=QUAR2sPic8ULKe_pPicA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 1:35 PM, Christoph Rudorff wrote:
> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
> 
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
> ---

I'd like for you to comment on my past reply:

https://lore.kernel.org/linux-arm-msm/5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com/

Konrad

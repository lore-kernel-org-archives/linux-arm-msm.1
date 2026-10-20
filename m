Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503633;
	b=u+SaO5jkAgDOvk/6aBjngFd1SxE+YITtK0fnliCIdIBl3ELIROfPH6wPIiyPgGK5tmG1
	 Jt7Q9tW2fTCBnMxrPJClmE8TPXIQaxquJJHumqXZsG10LzzYOQjDfIfZUV+dGoEu4hWog
	 WF9seDVPPBQh1z+RPcJCi76pp2R1htSdrs9TaHM+d237KulOo0tp4UNT4l5jx/i10fYlf
	 DigGI7Gfac8quKH1xk11SxdTDn9LhHwNBuX0TBny5dK7CjfDXaEyCAIuZwVIqCXYuc7eH
	 wZjJHfXjLWwmfEfaNdk+lMybYfKjbG6RH0qxelMs6X9IMb5yWzW6E5ZdJ6iMqFlF4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
	b=c6KAqInJWG52M80szTd9RBsH+CbHed4Ux2hJrmjAID35BivMxWWyW3G4FYmILk38xQl1
	 ECuE19NxlFvI7tW7AyGL5tYwcO1628MTE69nYcmzAtausZ8NgRmkNDwgjmFim9AaCGnh+
	 peVXu35jcoYq4trE6fv9eQ8MdTWMaU46mrqCoD1hGUXNX7+jvkASC+GbFJoJRsy6rrAJ5
	 Z+UEX9owY42wfkIMb5i5IoUWxdwicEOyqIOTz9AQFI7+caB0b1axbpe9WYlMtp+irSZCH
	 l+U+2+Fo1Oz1ETvYtnZQhPc0LX4fqYcawOZAipnyuiP5yk6t/KalHlkWIXJ334u2wQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36D606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB36D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDADvM1429980
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=; b=J+lSBTPp8au92YwL
	dppsvk97Ir47oVbGtiv4KOuchx4pkFy9PDd8bUDY/mrhbW7QzlBWHrsqzh0dck5x
	7IzlATfYdGkklpaYWcd5nA9LdnB67rTDl2TIACrLnUCUOvDd6sWMcZE5ZGDuEMty
	hUqwzKLOtAAOBfYG7bHhnKgceozxVduKkx4PUZC25GtJQYGwb1BV8fiRBK1r0cf0
	iv/b0KGakppcxeBIeHsO4x0jqOOrLlhOl5x+yw/UTuLNk3ZrVqFrB+SyMcqY+hSM
	MXbVsW6ZsvndvWOR6HUgUll/1fPAfha0V6025kI0nN038Dy1piNrlSV2bLWX8uYc
	JHWeGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qapgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:40:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso9113626d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503631; x=1793108431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=Xerno1llNzdwOOSdwYCePrFJkureNneXwLwss1gnlmYvtd/qr63/KTHUUC0hDUk4UA
         k++h1q6CRlQ6V9WrP76XucKfxDD/qrfoVlJmdXluLcwlgyxQTWwLl4UGrkCHz2qT8YyJ
         TpP+/wdMKPqzVluqoMr4TqQnd4Iqzzj1x16QRrdDzWLK3bnG5fCIjPac2FoQEcU0AVLQ
         q4eJ1r7rBH4ffvRrrJYvQpLWd7w5t+SxkwMCu85ChTT7HJqeUUNQGnIhWfitZDaICJCm
         RAvhSY109Ncpk7pqYob7bfUcc5HVFjhU/I4KotYJr9VD3EEOY+70g/MZTFHDte7fuwOi
         wTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503631; x=1793108431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=epBlMEaq0L7H23/MkqWWo6lenD5RkwfluGo0L/nFUJc4UpTalb6dwxFmDJLeXz88Ny
         PWuoueXhMVX5X18thHrdLPuhuftHiRD4qZhuhu5QexyLqvN5ccyyBxCJ2XNrCCOJR3pt
         vfWKW5ZkLzPGjhRZMVx1mh1x6LQ9f8cTYCDiUXiClULDx8a9Xz2ejH9B3Vzsml3JstzD
         UQxQJa0/m0lcx09nyfBDFiPXq2aDvgWrH0Qj2EUl7JTa01EDgqcHcKndvalrkjJFcPdZ
         FX3V/VEqXW1chHdZFsc0alvE+mqQvZDZ7TLnfWR5pDT9qlKlRQAW/IRvxeLdfuY2msZz
         klKw==
X-Forwarded-Encrypted: i=1; AKwUvByMYeGlAgC5xGruhTcRCOh4uZ52wOqFck3RQUgP2mpYS1fnfMsICniRQfwfgAdR8JZKc12O0zBJtaHAT5Hc@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5seYE3dKjVwYKd43hHr4Ul8WLJtxE3EryCxeenovCSYkeimve
	WCBe7FhAd4MbJZK6gb3e7BB2Qi1kexWI/J4BsUw6LikpdE7SO0jKmzyJmZ68qy2pFhSk0fTj81D
	LHIQMAwyhwcJSXnZjYerCbhdkqi6S1WoxKX59rjSTVhjcrHakuD0yD6XoD+4AWH/OH1jI
X-Gm-Gg: AYBFou3oiYTBHX7/ZS9muRQKzN9e8LAinlJ7HXXeoIBxru/LE1tj5AQpKfz4s4gm7xs
	DrQaZGUJFRaVHNKDgm5I4i8OvtAJdHEMmQTQVn5unk53RF0IAgfk60QnZfUwemEoCapyhrtio09
	16oXgOXqgXNS9Kn5vOq2qpG9oiVmyP8rjy51OdPxpu4dh0oHsfkx8mSkRVfxVYOG8e95Wp8VZn7
	IMCj9BA62m7rLNCtfUM6i9MlHO1c5qtCFuiv9V9M6t8p+QxuQktv4SeAMgWNtqPhS79ZKtJQCeK
	wJZZ7zpSw2Rp2Cn41nZKyyZRwwsj3D3u7Kz6I3tQq9OMUahBanxRapW2Mhq4kN1oeEC2ENBYvjn
	RPBTOu885KJLZVaP7RdRd0Q==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922212885a.0.1792503631173;
        Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922204285a.0.1792503630475;
        Tue, 20 Oct 2026 06:40:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb165bsm477628566b.71.2026.10.20.06.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:40:29 -0700 (PDT)
Message-ID: <d3670f1b-57ba-426a-bdfe-be560740f516@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:26 +0200
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
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake
 IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9OerPOJaSx9P6ANc23qmyfD4fuGNeD_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX8rlP2E+LvLkT
 4vPQaLNsXFvOxrSFMsQUQv+YISKiKhNaBPTrFbRvxVdpXexDFn5ExM1DL+DW60Lk7zYutvBAgvD
 g5Pq2ZPbHkAd88foHLb1Lh5hUCBicwAUiyjiSa0lGeEMTH1H7MMyRffDJrK5uoPqq6e9pgokCJc
 qyVeWX2CQbPtIubBmVbW2pqsvyLAXfM4BGrPLgh4fMVFFauAUyWHAACjty87Wap12XTL5r24AOY
 baz6Nl3DlIzTLRwAPgOhTuy1k7f/zA27b4LusLOE3qXZWQDx7ONsTkiJiXj0h9Ki00/dC2lgYoC
 c+nzylAaKGyk8HSX7iq9g3nU1AYPu33kHpI842CdSGSbUH5YvHdqLZ35HsOWl4EdKTcsKEs+Ufs
 QyRaw4IWgMB95wl9Ie5d1IrZsEoyCO/oCGI97gLck5xfgFBMK6C9L59qWfHLdyJIbo+JVZAJhS1
 1OpSjVAD5cDw5QHgAog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXyCHbFWfuZQrN
 ravhAFJw8xoVixQ3p1m4QQsRcnEQGRpAB+PuUt+caUaxyHDmLS9RLdNLfPjvPrOkdk9Xu7ljFUj
 knBba2oWnuXnkTTmMSXtI2lqVrgX+m4=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad76f4f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=nQyRZacoh_ZcsPQd3roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 9OerPOJaSx9P6ANc23qmyfD4fuGNeD_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200054

On 10/19/26 11:39 AM, Linghui Wu wrote:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
> 
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
> 
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
> 
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.

qcom-next is currently based on v7.3-rc4 (for whatever reason) and
has 1398 patches on top of that. Please pick the presumably 2 or 3
you need to boot (I don't know, I'm not following shikra) atop a
clean linux-next/master and retest.

Konrad

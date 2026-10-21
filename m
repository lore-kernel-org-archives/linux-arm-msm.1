Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583516;
	b=5EPGf9mMhVU3Rz+KDdgkumr0BcDyFHZbB9zFYioeGCLndkQylCIGJ8+4EYhlsaYHnBwp
	 HMVeZl2bHcUWVkUmdZQ7i2UAItk7EaJjavoRqIEDZifSRqYj0LBpbjDOsQ6DG2rSpoGjy
	 a/3POVN8640VmDcbr24TGN3f+xrD/IFIPVBmDz+RRp2uClJLD41gSDgZKHdR0FbkBVhJl
	 JPySN5cR4yxaMQ3lkXN9XzEuqV/9dyWrO3jS7O6Z1rl4vOtO4ccbj8nLX8zkhubc+eP74
	 y67TxqIWT5vR9Ktewl9Dyp2vbtIV2YbGt0WZ74jL/P0J+rs6TsJ6M0aZQfCASy1pS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
	b=YVbJNh6J17Stl9JGq67pfYmbxa5K2NdFbhgZYGw6GV3BLeuSOhaMwqQSyvu5dX2FQ2xF
	 43gCgwNf6wpcmdWe09ywmny5bYFUwO/L47brJ2NU3pGmLurkcnGWNDKJlDrcXWPXXIvUM
	 npTXQ2qLvFmg4J/F7Ra4rVLmLZyjI6ciWGf0rh1hDlAeBE3nMw5sQx0MGc03GFWumwEGi
	 t42B37R39+UJYxD6WFd7AyVrPgKJfY5XndZWlbNy3p2l3xkUIHTAA4OE8B1NEBJuA+LKh
	 FpoauoAYjiN2hKUEGVZnH9VS4/TrLtcKqZ5AzrZBtSxg5izpFz/XljDOOHd50q21CYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZrNBlDPM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786B606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7786B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZrNBlDPM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg6tg1599989
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=; b=BlhaLsB8tV1S7WHo
	mFG1BNvflm0u9jHBOpjQ9dK24lk8As4RVKB6HBvefgkPRDkgd4s+7nEH0lnZw/Eo
	g+vGNP4oBbJevgXHilXfN8jD0jJmfSNXjBQrKoz62+1pF1q3yfc46Tq3giHe5Ud5
	cJ6sD6jK8A2B2+689kjUIORvtGB5ZUrUAkqb3k4Y/bIHI2NcAMLycPze47KLQDA8
	GQQT/RRDzzd7t6I4jiQCTnUpU0vUOPenxglCglsYYJRPio4+ZqjCnDcF0wNenxNC
	gWQ/sh8SHJ7EIyHjVW4dtS2qaZIL8C5iNpU5W6D+kQtas8mXiqia25NVrWpw77Ox
	A5pPuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:51:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso10180685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583515; x=1793188315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=ZrNBlDPM1vPFNBpn/zAHU8Wdo+qyc73uKsTApRAos4Yl3W3pfezM+ioW9WzhkmprXQ
         iIxVOXLouHEe6Z2GFdfaHCSvZAjtYJ+Zc7tj4XATyTzX1qlf9jixNWzBdXe0ML6WOvnq
         XhymWe6w79VkS0xXlQo68qrPx23P8zTGpao2nLQtMaGDbVoORO2iHF2M58GA1QyAhCot
         iGcYLoJa68lFGhUNH6f017o+WkYJzUL60j8xZsZ4wiSaL7iblCOdOayrPNb3jTU9EqBM
         4rIhRgs1d4zC0qnxST10NAMVDOGP0Kfpwe7VmczftRMxFnEhoqgyKkCWfNVRXs7FWzRO
         K/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583515; x=1793188315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=dcglnaglJKkqjXQyfJvHgPMxhNiU5nx/5Wfiul4LTrbXeoVRzMTDK7QacwCl91b7sc
         +FkVZaeRUT2HwSNo8uUPbQ+RDJ+Yg2tzQ2kef0ooZBLQ4blFfHzMFcx782JtSjkDdnmD
         G5YPUnLLm/5Cu0rftxFWwUpCf+pkxFoDXEcKNQdt8S0UuDDQlS0t4JQwgTBlu55vzVKW
         zlAhETitpJ68lp2RLGl/Q7/Mj2D1mE562SWEW9ysWvU565mvGfjbSMx6YflY7vDgs8eC
         aHYWZa6MOZy69xwTBQ1ReVOLqSWNREgYyaiy4iQrXoUf5To9+UXbfPT3uXTZ/DJomKl+
         MQlw==
X-Forwarded-Encrypted: i=1; AKwUvBxuQE75IwITCwZmKc4WWeGfPE3bTFjNveiEu/1xWiJs8HYKsyISwrOT9q/y9O1lJJCb/sfFG0xEIyZPk2Fb@vger.kernel.org
X-Gm-Message-State: AFq9FYJLlNs3SEO4Are2fd8tNDgCFoIL6Ke0JjstaBlhf/bMM89fq9nE
	f4MUZmktejhNvtYGeaaAvW5Y9OPJRxflRC7YCenTgAEMA62KHSHpufsL2AUsnLgZoqmCuHFeINd
	r1rXcUNhhiC+4BQCsdO2BbV3RTyVijDXXhqIeu46fdZMyHyzvpV5CXJhStdhesCNMh/4PXkfMHC
	1wIyhpog==
X-Gm-Gg: AYBFou03Z13cDwmSN01nZhh3/dcf1MrtF2fMCXj8s1c98WSNCeSvoh6RbvDRhUcoVIO
	ameqLjh+GOr3TOBHXAAzCu2QJD0bT8ijqJ+LV6lojHjcIdexgi0hcqorQkOWE5nYEsvHXqy76gc
	TMJ2/DQJgSGCm4goXmytyA/y9oj0zPcSHUzPvCf23mb2YYZT0j2KpPncRPsijzjCDgXWPET4tEN
	sdv9R2Dwkg09x8+iqSjYxBVMqbgglNUgN+xRGTz4hhS6rYOmw90OcaKK9ihjKdvS3w2e50zNjMk
	1/4Pk9FgjvYGsA1I7IMR4vaLjE97eaoQGrRyXIOHMPFg/iX5sl7qGyuNQ22UDPfSUkd4C4L2x8m
	ymd+V5rQIO2bjRK4IoGZvvw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413685085a.2.1792583514607;
        Wed, 21 Oct 2026 04:51:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413680385a.2.1792583513972;
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77ac4sm69148066b.28.2026.10.21.04.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Message-ID: <92642c70-04da-4283-b25f-80369b788b51@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:51:50 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8a75b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hSA76YPsP928zEigGEUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXzl8YDxtUuzXb
 VPs9xOUUOsQihwyRawXMzeqAHgyQqdOmkR+ulJCim4oNBs3ZPt4WSGmImWX8sUI0oFhpPfN0fQw
 NhUPzYjkCuwVjdljcYws8W5NhpKYM7I=
X-Proofpoint-GUID: hTVP6X5NnRt-vMz2G2yHZhKRNWUJsI5M
X-Proofpoint-ORIG-GUID: hTVP6X5NnRt-vMz2G2yHZhKRNWUJsI5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX7udAL151dhn2
 BAFQUhkV1FoyQPxavsODsq/8/vuAF2S90CzjC0yQoSXj4xpmW7ZhkK0XsCYnNwPt22OSuWUSK1T
 es1BhdYgycPIhrVy02EG2oCa+4GpITLZwjPzJQrTPh5x/l1Me2qpuDxUpdb+8DbVHW0D6Y4mZdZ
 fU/WSB+DzySvX0c5Dq72vv5oNyX084XoAPoDrr4mxHqMMCsV5apdelBaSAY6vWfCOe0bRuyPMx6
 6ibBd877evYWUgneO0BSw0rD9TfjtWddusFgDpxPttvP3NzdyfEBgKoveiDXFXJnelT/yN1vX19
 PsU+NQtAOomlYJ3nB4gsp+aMKOBDLX0pOcRXu48PLL+l06krjrGbF4RgfnJN2QWryrUOyNjiCBJ
 My9kydpPY4vQLa1SqLc2f/3YZxLuEdCczPiORW+4Nm+52yFP91VwIC86Yd+hemqxuQvqKxPoNoA
 5pj0//jtRZd+8kfRrKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047

On 10/21/26 1:45 PM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

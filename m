Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87F329E55
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168511; cv=none; b=kpoggpnsVTNAdZDFEAkb3DcG41ja159wOwUsxNYDrDsd4myZAsfuucU2cYKRn8BlSudoJo8Pyeh2F96I7f1z+hKeIBZQyiyPOWXI29Q98XosVq+mFgCW5OirPeGPgWo+nggrEQikBcBvIN7oleev6/DBG23j5aMLkYieEL/a0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168511; c=relaxed/simple;
	bh=QjHIjjeoTPKm4tEtKF5NR4KQhMmUScvXbRonqJcx9PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOul3Svtil61fPl4qqvYgVE9GqgxJuHyA6aRwpkCXTe+EUsXAlsgFAMliAYNzpB0fATkkROnqNxXnfa1F0qRbXvMC4dz4kOwrSBipiqmwV1I8iAcWzQkplTfrRnCfLGAO9HV1BIN7Z4jxQA2blMJnkcvwymXa5PwQQKPRN/sIBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjbmBUGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC1Hh2Ih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjbmBUGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZC1Hh2Ih"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVbS4144483
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=; b=hjbmBUGsZ0EUvL7/
	e5u0Q1621SR8kknoWNstiLgk5CLdjjyVaY4E/1dzERdpZ6Zm/6qmOISsF59P74gw
	z44LhV9UeR7rNbJnCVdkRR6xiy39Ow2UbvZM/Y91jNJF/gRjJesk5yDE0Y8sv4Vw
	cjZ38YpaiK1/zz5dwPcnRKtm3HKAWTCwb38islo7ZsTDdI4p1EFRGkQImSRTIEah
	AfsCr82pvoXhj+fINera9BZuRjQzc7z/QWK62mjsZl5VZDSXfb3iyOK43zF1YrRc
	+9ucELOMVUgK3DLzwgA8V0Q8G3uVoJPjbGy76rokz0dSIj+6lauuC+fXr3kOwsnb
	zbrMHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428tuuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:01:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso304961a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168509; x=1790773309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=;
        b=ZC1Hh2IhHydzN7yZOseLSNALash0Hyq3itH0IAl8HZ/wqT2JbP/GCDTYS/qYXPTSFa
         m1pHrM7jtxRN+P3TmDz0JBUhfpCKmXb35fqLVaMvdbWebzFTEaKUNzM+Gp2FcTkg8IuL
         bcHhrr0JRDGHCD+mj6nAf3KaEyrbeMCDrYBxgAxTEFrOaPcEETFzXIO5gk/u3TIVvi84
         /T4/2gBoxuanD9tYa7kpHw+ukx7wxS1D/bi2T3fqrpmPlIKFKplSdSXrpUyKu/zqX4Da
         8oJum3zP27FIR2s73M3qb5Lj1+Y1Cz6apgb7PAKcp7sNeeYEWqt5KRGpW9qumjrrvwWv
         VjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168509; x=1790773309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=;
        b=OzgWBgLG+lHgpQ+zWAZ6vmlJX3GPFLl1s5S2LpT/NVid5PIX9O84nTxgOohcoqmin2
         ojcxy0aAHtfYdTYjK8Ls1DjYDVNBeFqZGDrYsEr7hcgdp/l3lFc9bMgliEcb/FEo2xu+
         o0HCZZbWjOAmvfIWjxm7WRo46AH8hRi1/4zoM7hrD+jZyyM5D9PPRzmY+wf7dWOiJiaC
         +5I97MrfU+A2iOENZ+vlFdrcD98of6I88iP0B9sFnmr+6aLbWRR4taEpWzAW84iVxps5
         0ZXwTq7nlji4h4+Kx84tG+KKpaIhAZZwK7Q0jKg91unoYBKaj2DzSqbjhyWmCHsb5vgx
         xkYw==
X-Gm-Message-State: AFuF++kwl18TjMTHr2TO97vEF87ju/pcuOp17E1wouRJSNLsSguucZO1
	wnqy/u0YOXIy8w9hDIEMgxUWZRzZt8RwOdVOGfXrIQmw9jcYbOBtLEuhZqsKkU7rin/OaaE7R27
	e/CJR9reIsNJNmw2USfd2ZrqrWxixEKaUW0FSPsSDGOmrlUcXFJPX8amKYbVU9TZRqmEi
X-Gm-Gg: AYBFou0ZGq+Gdd6Jk0kocBYR7OcpM+wLHf9BuWrcMegQEXuEQDfOFcTbMCQqnIebPxA
	PBzSZqpnwUGXBXpPX/uPkmHUuplRWPY3TnnI//1stIES0j+UEaBBHmlUSKuUyNabicGjM1hJh6M
	ba5wM2CJvUN7Jz5yrkvvFiUeVi9GjXaAo2VE7JxOAQZgbEK75kjEXGICN6q3m/uK2zconrQ60IB
	4YMUJOLmLY9s5bDYl5QzZRlDpQxyUs9IIuE7DMVMJM/hi0v5HrfUsQYQCL/vODNH0ThwnK2aYWc
	f1K7Lk52sCYjRqjdobeHCmVbwqM66NMNBKh6gV6XXazIFV4XVTompzcqAyzed2s0+fhIrFFjQWs
	2YPRWU4Y2WmV0wL3tm1l4wA==
X-Received: by 2002:a17:90b:448e:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a07e2f68c2mr3690441a91.0.1790168508147;
        Wed, 23 Sep 2026 06:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:448e:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a07e2f68c2mr3690028a91.0.1790168502900;
        Wed, 23 Sep 2026 06:01:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eab45sm1650695a12.2.2026.09.23.06.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:41 -0700 (PDT)
Message-ID: <dde35cf7-10c8-4e92-b956-bc920c9cc5dd@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 4/5] arm64: dts: qcom: shikra-cqs-evk: enable
 the first Ethernet port
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3cdbd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YB9oFmEO9Py7Eu-ErZAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DdRrfus36QvzfcBC83NS94EqRb6a0F7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXxEhmIN4sD0FE
 XlBOkNfKYy6Ff6P4TZegx0frzEVpn65747NanrprDk0xPvWZtvE2sQpsmg3f4G1Hz3jrE/iS6Qr
 KxzDjcQXT22mn6aQe+fUjsmbI7DuU30cNx92Ubq2lQeiUmkvXt3A7J3/p5uUJtz4asLPl/PSqXj
 eTaMN5Sesae+7zWkloyn8APB3sIFT7H13C72c+u5vj0HCh7EXFkBxod21qV0WP0jaYwFMJxcqix
 c6B4WXHR8ITj0TYLBNsJUpEkTpno4GpJitSKq5o/fv5MhZeKmdJVk9tjtQ3bgzV7RZhUCn+QQ3X
 M8MI+PnTsM7wy1gp6Qq1Swkq7wJ3MNQZXRNXC8aPzZmHCfgTHQnvet0Td+xh4OFg2r8UoPC6iEY
 RPloNRaQ4Kj0s90TVChsq6PqQ2jC8onIy/GiZnQrxBptTFREwjIglcI1FAsuDzllInBz3UytXPn
 bYtBm8oMp04YMVN7KEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXwkqpf6voOa8Y
 aOEIi6HDN28dBJ/ARXJKFKAOusacdraTaCViVLKJGv6uCxMqXGm9LKGJGMEno+geLrlMTvX3k1Q
 qfG3C68rFRm5hSdjBVE255a04M7eGrE=
X-Proofpoint-GUID: DdRrfus36QvzfcBC83NS94EqRb6a0F7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 for the Shikra CQS EVK board with its DP83867 RGMII
> PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
> +		pins = "gpio149";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

same here

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

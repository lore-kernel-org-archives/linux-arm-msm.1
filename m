Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704706;
	b=uCYdZs9xvjtS3XgQEE4AqVUhvmQC3Q0p+7MF5jRjZFOkBuTfvo4CzkaPtG8li9qZs20F
	 udnOZT1FgR2X6VgopnuG16mpPnsNxrfblXJnPWeGdqB5ntDy/nVlR34JbmU9ujQi3aHkP
	 KkFJ8UpbS5GK5R3XuQF9juTKEcVrnhVnKqo3NBTvU3dQwuupLTtE+rjcyJJrMYK4Cszk3
	 PEmdNVY8Z62hrEzn9qB68XxIE9tF/rfDy4N6EoCxLzSpw/6ixh1bWCH75wII4AHQi2rXk
	 RSBskcn0Mm9+ZovPpUE5ZdiZ/2OinRoEhUn7SdCO5vDmA4s1Dw4Ci61YoFgvhMDuTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
	b=kBAD6VdlP5SxV8sfAsvBNaZ31JMh3iEp86BwsbcUpgeeKySFl0y5lpPJIyxh/27VSuHl
	 a3KogMqE1LOd0ySG5PrgfdrnDbkg53LZKC8PHIh3/UmdsxhP8eXZLajvEkTmjFxXbta1K
	 iGgDlOjhBWL36We0m4fKhgVRcVSW/TRPvPScyvr5nmwEqdcbeqHgPSlYDC8cPZVQQrDx+
	 n+vw0RDywWQHDWHJQI+KHz9w8hQUptI954GsG4zRbu+HSb1LYGjqxq9u39u2V2GTnqwmS
	 /J1baixEiDKaMFOVphu9SCgzVoPnl+zHSaaEBfpFKhxXSMz6yE2dBsVRBZuA+qc1jfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hC2qlaFq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D6m/f5rK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0A606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC0A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hC2qlaFq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6m/f5rK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV7ZB3171069
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=; b=hC2qlaFqZwOOa5OA
	3aGWxXcsDHzEraTeaGDfzyVTeTWUwlvouNbM1DCReSmw9Q4eEm8ud/urX0nE6Ezy
	gCGTi6s4+r5f24n5AJUp+f+Xl1xUVmBIzQSkJ5LpixU1/3C11B59JcmhslIf+Gpw
	Dl64cbtu3rRIYd5h8mLuSseKlvZit9wa79dQMfY7LObpWJnY3hKaUp7Q0BcI7G+A
	4qrxQuXbkT7g/LJoJidVkJ+VWxhDsQ2BSmcTx/1tyVPWVyIxyoG00cDvSU08SMU1
	eG16GORB0Xm/uzwBXfYkJ7/JImSVk23YYwkuNrXaLskSRuAJCrVJVVDCrwtKK97y
	ChElFg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbcfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:51:44 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso296756e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704704; x=1796309504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
        b=D6m/f5rKmw359YmVBhAgoSjuDalHZx91kEPGZ2aOKFRd+40+ACxhpLyutKiLkYEwDW
         6vtE9x/pX8DXVms/c9+ei3U/CzCtk92DxswT1tVZyP1aE8QSV40B3Th8fLSeSUysjo2l
         S4Ga7DKw9R/HPw8w8GRsSb61P9aBU1zK2LVrW1R0SIsi/pv8A19Cu0R/xKl3BJqNkMOn
         ZPU/FqN/wH8Bj7R95HHDsoctbdJmxC7oYkSFTUt6LRoef4+SdRBX+YGvo80tyU21Yw9Z
         BVqsBX8oBAYqekSY07u6GOPKYcH8Dp5JeXjRjadxXgAi4Y9YeDf+v2EUWaTEwfbjSd4F
         y7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704704; x=1796309504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
        b=Cp1w61QmUPSDD4gQxmGA8IcRvcw7KS4Lo4/y2u+E1ItgjkkM3E/WNQFRvQ92SOATKN
         YoitT+Y9fBVeQ/TKYgfEzDzO2VMMBShZJrpUC7y2iz/rLFFKYYVCRqYpj6tkAsvbqAtM
         8XhCkZAkePFzfb1ehM/JyhrpkyccVQDxAtXlzZbpJkGqFTQltHgqnUZivnkDc+R6QR/7
         hduaGePG/D36AolCzJWutKXD0l+6o4bF6A26ph9K7vO+rtoNr6Zegj9Iem+4prFNf35p
         k1l7vlI15l9YF2zOcb6cqQSDmq9OCuDK2PfqRc282/z8Q+qIoAmyIN0KW+Yu2txaKijL
         UqJA==
X-Gm-Message-State: APuU4Z/jop5xa6JfDtBNa+r27B28BwhGxhAluZlvCtbebW0djYqgOzxl
	qYpYTs4dy1j7zBiXR29ZMgSzmiTsZ5cA1mIbDN87ti2hzmgKVWjUt5+T39DaNkfKM/bw3Ok+s3T
	sxEOfDNcLxrJmxkeSip3RqOvCss9dXc2HyI1gxgjln4VcKafbkTQ+eFyMkyaN9Ilg8Q3E
X-Gm-Gg: AZFdTZemaZhEvlOZsoMugue0yRIMyx6OD0PfctgNNGMx9QRPSvy/K091oqIAzBxKEV2
	w2qDkJtfMJx69dkEI51n4SHDEUaIh01LiQ9196za0xJNzgq4/0MpTfV7uUaLy8bt7JS0mUeZYSq
	pAtEU2qQ88xvneRUObf+cE87Z4yQ2+EIlZ0vjC0DkmsQl7flHCDxaOFRQf0Pz9U5uUocUswXbef
	IybwIZPHxVMRQu9z+RPIboPwA/yYG2YE4R8mXOZOGtH2/kAW+z2paBJkX8Up6M7NMuSbIQmk+Zt
	+x9FEP6Qct4yRZoDSuc+GdIKr9Ed1Jvy03klJaU279vIqD7ADptq1UHN6EweCkjJ5o/6ch+f38K
	4Lr4qPdSP21tBkviZfKwf9ZYD9LwTVd1+sEh9RgEwMjw/Qz3q/YKUX3FUuKZn0+0mhGu9S+I=
X-Received: by 2002:a05:6123:424b:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee8adf2d02mr13329279e0c.1.1795704704128;
        Thu, 26 Nov 2026 06:51:44 -0800 (PST)
X-Received: by 2002:a05:6123:424b:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee8adf2d02mr13329258e0c.1.1795704703707;
        Thu, 26 Nov 2026 06:51:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm9784877a12.9.2026.11.26.06.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:51:42 -0800 (PST)
Message-ID: <8e071cda-92d8-4583-975d-7f07cdd783ac@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:51:40 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oEERSwsRJ0p5qWcp1y_3qBmhXWPXgNc0
X-Proofpoint-GUID: oEERSwsRJ0p5qWcp1y_3qBmhXWPXgNc0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX64MWQ7XK+CUC
 1ay5rGGv3XxTbKW25m6KbwF3U4r/G/oG+GxvrSwdxrFdErbpegun7ym63v5voaSDrY4ZoxQY+w/
 FBppMfiiQLub+RQwE11DkdlU6a6Z7eE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX8LVNJaB/h7m8
 n+GsT9s8vPypj9yTh66EMmKxF5waWklpi34iYTGaJecoPLcGYPm/ogMWPtQ4en/4J5IGnWXAKNC
 MUO2HTKHQ+Ud7XBLfuTNLK/98l7mIj/NkO6iAI9Pu2hBYPvmLfxg4bH5G2mYo4Z016aTukZrq2z
 inw2GoMfGmBdI+lKsFOWIt/UQmwJ727iYCQRDOZBntB3hZbcrMHTG5wQSkxXt2ITpyVZ3rTLKn8
 isqvBHPA3V8L0S977YqNMKaIR9NYRhaNdtCBidQyO9CbfKYvA9Irhp5XGHDsX4BUPPPTCTQzaZz
 d2ZjubHr61QueoYAWpv11ZFUT6GmoqYywTP4JW83VlSDcZZ5Ch5zoTV/i/91jJQLt3N9t6u1EU4
 xRQcIiewq04oj8gfafyOmn/obJDYmAVnRmDu4dA/0pcfzUsx6f3oZuxkazsdTSaJ6FN9XvjXXH8
 w4sMV5FbzsRZV5qR07w==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b084780 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ayT878WuGnbjg-ISTX8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/18/26 10:08 AM, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.

This is overly specific, the enablement of the block doesn't have
anything to do with the QCB board. Mentioning you tested it on
there is perhaps what you were after.

> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

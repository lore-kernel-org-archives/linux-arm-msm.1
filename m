Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758656;
	b=GXnLAGDail2r0tD0Xk+bFQ3QmxUsfVDMycBQHNmTDCwCCeGss/B9onOp5RJCVejQWaDg
	 PMNWWeUgxMZ9vaSq0AavpDnrw7+r22eRHr4m0OWDXevaWIzFz1x05rDaXtSRrbM+m5cQ4
	 7olopqByU/vRW+ad53IpVAoY8ZNZ9T80aYvYtE1YebdEA6XwyIcARAOWSS4jmkvp9mIzj
	 MjtSzcQKxn6ngsKwfBOaSDr7cpNzCDXqN32+Hq/HqpWBoyyPIGGYJF1Gm9DcYGrM9gRGQ
	 Muwxgu16h9kwSxL8wgZjiWVJR7cepe5k6P7bWzg5tSN5kAjRaMdtBQYHoqLfMMKikUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
	b=NpSHS4cm4LWEaZ4mMpWMqq3qBtBbcRS3+PZ+CGFvEAnNrHQxSuFfweI8W1liIpyf/lkq
	 Nc1YH8kMPaVyRNNGTYfa1tKbOXNTWgK2DosAqCsCz2NnEozOvo+jbdgcr51z+rhS0PS1v
	 32Hkd5Je4Grimca3bedXOVV8d5wSBlCFHGa/ajkxiIpYh5PhdqfdIuy0SD3aJXKdQ8fZV
	 hzHhwz1MqyxVh0iG0SxQB5AWlghqzBU2+dzEoTXYVWkCstwFR5YrPvR80/od0Q4HSDBws
	 IFxn5dvf/lp9kJzD7U+ez+MKtYWcmnILvwA2hftsCJ/tsjOJ7eJ+3FNfMwq30LX3IAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3KqsHv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8113F606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8113F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3KqsHv8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZ0L2509109
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=; b=n7ZDfs5BA9A8bQpY
	E1H2S/nbo2cvfF169cWF65Aol1lDcXjjU5WExuNarNWGPsT3JlaYWJ8dWgr7aGM9
	OLYZ6m58ai5BJEuRH6jVzggtVa9rEJcGnh2OQB0wlKUi0VQTkYOjyOl2lqixbDyW
	NVWte2fq9us5Ri9hYX4Sat0Pz6IrHel/OZ6uIuHxtnmEi5D4ubyOHss09NEQF/Sn
	Y+04LVcwpil4NHqnuIXSUHqjRMk0Gp/ImrIpWYQXhGohcYACfPP7EZYaa2cTzbId
	ktJUF/3ePHtvRqCUVzcf7FlgvB/VVlT2SKAj1As2OnMJLm7cyB1WSPCAa6c9/f+o
	vlTt1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykb2p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:30:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so19661285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758654; x=1793363454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=B3KqsHv8hhsMLLwiizISjoTh+hZ/tOA6Mnw/w8KSaKl132gdW688NP8EbWZgdwHBI+
         MOlllJmX2deUvD7NTFa4Uuik5lhUSKda1l2Q/cLWcXgUKDhrOZsmv6X/kbfaGp4JATR/
         6wa8DnnUzg+hEMK8z4hCbo+0feeFXTnBC6wCK2qoUkgDYaPvgha92wAGAPu6bCLB4eSc
         fBUBeOe8isL9hqLvb6HpybscWaIaA8PCOVPEN3O5XXYKU+Fhjf0rwf5X0YZloBkvSooj
         CMS3D/Eyvbn/PWcSXrDd2CRLCUupF1veG1I32mYNNYWJrYdAH80GkhhJDz8OfPfqiatK
         i+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758654; x=1793363454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=noFt59g1qzWbmAgZEkx0HO7Aa3+ThdyL+KeczlGgt0005Vln3JSVxoVY6gk8tyuc3E
         /9uvNMGFwBmM++eB177U5eL/j1qcJD6a3m2q8FZZSTRssNvHLR4v1orpMialhE0l2YF9
         vecmVlrK9Z5ZbtTesB1r2sJyrPIl0Zc+0GC/oSbp699GsiR9BuGF26wXkEq1t6d4kSRl
         218pj6aGvbQiI8Lh2h6IW64S3VZwAs4CF3j5px92lI/NSffpPXx9bCP2HNGSmDBdthqJ
         vwJS9GwLZv7M5td00n2XwaknWDkxw47YNHNBw7UaVo+ABYEvkc09hANe2+iFkRM13TN1
         /yuw==
X-Gm-Message-State: AFq9FYLFsZ4rSgD1v1t2Hh1oEX/NRJSl1/wRDbqCHGx5EN8in1ZfRe10
	aXzsrnzcypbLAyEzE86TdUMJfHiIiRKq5VFzK5uX/NklHQsIq0kSSyLqsQtCL1PDI2xmySK9FIj
	QlZ2LurilpTFwjG1ldeXG5RnsJjurIIBWjL03r1kYSTF+r7eXeMVLI78RTKeNBtto6K+cJim6We
	4Z
X-Gm-Gg: AYBFou3ySN40DBJjlgnLhikY455VIcoDe4nkOUiiMEnyBcM8tmXBr+i4ShhcsSusPNZ
	AsVtvrQMBkA4OdYtLMbplJ8Ucth4PoOXDguHO0bHSAK4wk6NUcZjcrBsao7iJdxbE8mXYOZNDsn
	fiCV4aeoeIVTjG7KD4tgin/hMdFjm4EYQm1AGvXGHpox4ONpV+JgRam9pe/nhro+CGMLD8PpfpQ
	SmopBmhTMyIjjgL7A0jAxnU+iyXKpcBM8Ot9lDbAWCTHd8iQyv7yLJAcZPHb+TkaFAn8ppK6ajR
	LzjzPuKs52i/H6CGFrRSIDtQQUEVlsEv3wMhIik0SawtX6l1YjStxAU9FcakhF8F/6+uU69dy/l
	GujmT1uQ0yIDcPiDHGEh4FQ==
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359355785a.3.1792758650195;
        Fri, 23 Oct 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359323485a.3.1792758647587;
        Fri, 23 Oct 2026 05:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cbeafcsm95025966b.62.2026.10.23.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:46 -0700 (PDT)
Message-ID: <bc06957e-56fa-4738-888a-02723efa3ecd@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:44 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX4edLt4ieuUvQ
 0HkkT6FGrKF5zlMFf5jak0F6k+X3mGsUuTuJaSf7TrJNDC0AEYtBYstskaDBEXGPOI2c5Y0hGd8
 cUXoY7wuXdSLC59zktkw5v6w2fv1+4m/SSXC6XjfcBhvuqzi23886zUcWsLrJJUHZxSAamAKHNr
 Potbq57po2mOlp7+vgsYpp/C3ZfipxyVUeFmyGce2OqukHOJACsDWXoDOhkY17IllugeYAnqvAF
 0EI7JBlEIZ3+hBLUKCazeHlHFP1pnjkdK4TrBP+TYcZ0VnP/O+N6mlAzC9pg6syJ3dFtYfN/U7r
 0R73t/IArUzi1ZKTdobgaD56CYm2x00PxKSWWePA8X/PFusA1pRfioSOU8p6ZKbltUtfi73dkBH
 1VxxcDvBtnqa6Wb/VkFSU6LStL4FfjfXwEaH5GlTxrRGBpERcCC5oA40L0ENtpPH3M1ssWBdI/2
 1h+z2eNfm5h2gKmIHKA==
X-Proofpoint-ORIG-GUID: X_mCfE0FViP4yxUJHLNUATV4GEHJ3sfF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX/c9vnexO0F/p
 al7aBEa5YyOEipluHbwfO2IK4oCogdf/LApXBd4LbzsMiV75Y2OxgA1yrXmrKS6JsytcKlYMpGo
 BTmTMu0IA5pxnhF90clC4gUijj9nZSg=
X-Proofpoint-GUID: X_mCfE0FViP4yxUJHLNUATV4GEHJ3sfF
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb537f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tUKzjj2clC97W38UOGYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

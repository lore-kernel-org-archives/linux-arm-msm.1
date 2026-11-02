Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620828;
	b=0OtPOhLiw2uI0enougkRrQqR0V8zRIJ/Ki+ZQ8c3s988i/IVoi5VZ6tiuTJ4LuTvv24b
	 uTsUOgTzCqfdNfP2cdkEOypk1wZzO5A9O+H6mRRZFtZozfXx6ceB1a5s6y8g7kSefrk3B
	 2aaCrXU8iiP8yqeuG2xylafAM3TmB03XNwf9ju7FhNLCN3iozZVA84y4FPcf/U5ynakJs
	 LUOWVF5CLB9mIzD6MBuWPd7chDCjbHNWTDlG/5HjTcua8XVOiP5sp0ACpIHAz1OPA2Qcp
	 1GvW5cWRAB6srZ17XZhoZZ+m/m3Oybx+HNQoFCSsK+2Df3UVpw0Fg/l6ecg+agwoNbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
	b=wAy9SHG/tBLRikGjZg7t/iX6SoDTTJ/PgRKAyHLKE11Im+0UmMDohfjEc1VJVMa3CIr6
	 zyuhAbta2qKZUQLYu9VKoVMZPjGExSUKjhlyIKmb6/1ojeOLUf/BRoJ8CIh2YSRHZk4+B
	 UIRxO537NwA2TRaq8cfFvzG64wu94h0uiZoujUniGvpuhAnS/l8dBjaRjiSj3KzsYRaZ2
	 m0qlsRe9jLRl5KR7THGYNe1icHJeRrsqrkFnZWA+Ka1hTRDUQYl58OaRwM3AMHSrZVeJP
	 iIv5JG+cprOwVNmVpm2iyPEWglpOOD73S8GoUzwWgNp28frlg1jBLNw0h/cna+Inn/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f/7QXLQZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CluXKYDg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D735606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D735606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f/7QXLQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CluXKYDg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A63e3403333
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=; b=f/7QXLQZPnwmp4m1
	ZUVYDFMF/eoPWW7FrjclGu6np/3fhIlm418hZsTYVl0UPZjXN2sLW+5BPJx0S8r0
	zs/97Vbad7g3Qr2Knm/qCTgB5ehvfrRoMbd1IH4NO9RYjicr2yl0YWP434iNQ0El
	OjmxptxCL8K0Q1vJeNYjfYeNTYFVIhFzMfzyeDxCrsf/+24iMNn/dTkrqgA5TkcQ
	nrnApZbUEAh+sB13cyupW/r9CUBNaDr5C59Rp+rR36+9avYbgPtNtCHyzoyw80J/
	Y2IN6ryDe5jdYhM/3AfiTRj+aPsCnM+etYp+M20nMw3N7gnPFihH8WXDiMG0CbTp
	UdgDkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8y9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:00:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso31395485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620827; x=1794225627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=CluXKYDgUZQZusaoG3PgNehmGEQJ7vRvFSEq0ouzzaiG1ufxgk2RQvv3jD2VGv7D3L
         Us+KOUdscnCPByyWYWMN6re+COHjVFpDyoaqKBaPAABgicc8e6xMaGPnugHV6QUKPMLW
         BMWO/UEHEeBgUwCB4o4ZgBNVyt7vvjf//YR3opW4MID///5B2AK4337niCpGMNokKk3Y
         ZvyLqjKoCd96e3C7+KIrqX+C1GnnXSHogpUrQi2menCs6+GJNRA28SPG+4Kx6OsC7gHo
         tDS7Z2+6QlwWmpHVwHhRxKZXpogaLjajuZEnc7MVWbkubd51LCIvH4F1T8flpMDkompq
         K4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620827; x=1794225627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=Sh9BHvnfwtNR/UhoAMpezUoaNGxSETZhEFiBkBG+vc4G0D+VHMkntlbKWDXvzZwYMr
         86mjg0DM/zF5+ABXTJigh2WKbnih/H/zyOHjjVgi3qCXRGp97tIsHIOJFzfkRD5BoMQS
         dw1mqhldQSMvQo49R8EdzacPI7sQT7iyzkwHsq6bFRVMUu70XbUydyv2V8IBwbvDaVyf
         scuv+03cl6lOBj37jpvT5jlFOgFQ2ZfrhW0XYoQa2IKXGLmMrj1wahnB2tcmlHK7QR2X
         C8YVJUff61rTrLVAUwYTaNqHVDKmJAPvuzOX22KlvdMF2AxoVuvv1BGpg0TWfPsKUr2C
         i88g==
X-Forwarded-Encrypted: i=1; AKwUvBxlFf8I7SQXQl82vxV3HWC8V1047z7OpW50uPLkoZLagGAv3Fd4sZDRMIG0mB+fAKJapq8R85Dkd3v0QH+h@vger.kernel.org
X-Gm-Message-State: AFq9FYICsDeJr4Op/5kulYb9EP3eLj1xRtaHiEsYKeXjwFHzrnP0OuV+
	t6a6wQ6d8kM2Pva4Ns80qA0Oyr6vd7tzQ5ibDCI9Rs2Ld03xoTjvF3Zmy6Ar1iF1PoXXC+Ug64+
	9GEYS3zRbZ7eXJ/LCEpzNhX4t8aOvjCU38WcCcpEeTUrqBL5O2a3vHpFmQ3+A8f1EfhRh
X-Gm-Gg: AYBFou3m77m1x42ZtvmbCaylvlbRN8u5WtwFni5gn4bfj09rihQSeORylRD/ukP0Bac
	tsjMC/HURuSm5bIwXRIiOvoEUpCxHM5N9A1MhyfdsRWbK9QbAWTU1+TGnA3ClBS4v3ZQlay25XJ
	gs4M/SAPOixklLgUttGPIW6QPjE/CcfPo/V31Ik4cl/k+4dQ9kzqx9xONv33wbZLKbEmRv3Y41V
	Icv5klseeX18tkkeaIc/hOk3raZGbFkah4iR23kO0WZoiqn1YnN5RYRPbdT6WQ4UPo+9j8BW4+/
	ApdxkseVkl4aYRo6bskuKZVl56Fot4XoLuqOh+JeuqlNeTK5crg+fLpQlys4a0PCk2L65mQUMU/
	8SrGrNk9uAeS8HcJsH1tCgJjh/L7iHUhyRwm2PT7bio6zqTuRYdDFPONDV5NX8nnQIlxAmS0=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606917885a.4.1793620826356;
        Mon, 02 Nov 2026 04:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606909685a.4.1793620825694;
        Mon, 02 Nov 2026 04:00:25 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm377507566b.53.2026.11.02.04.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:00:24 -0800 (PST)
Message-ID: <7264dc6f-ff30-46d7-865e-32d050c8c4a2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:00:21 +0100
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
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae87b5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=XQlgmqBj-IynFr2M_OMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX/QLXlD5Eq8s9
 JfN7o+roblh4vItPlG3cYzAiojDKEneMF1fnIsR3Q3UxzPqpNtQMgQuoCzuXedbkpuaXD+/I5X+
 83Sgy4PphkagBUvSVQSFSTZlHSm0C33+NyxnDUiXYnIv3NQCgmB/jAONqeCEYKX0w+oLWsKSfdS
 ht0uUL3vdkYv0gnMJNROZbcCiUOwinijxyvwPfsGmYXZrO2wuj3T2mGDByg/g6qLPiYkv4Jl4Ir
 GX+fvjvyV+3oYGA6qtQnA/KQt7ef3ow+jfdfbHj6pk8xfJjKVG/jwL0CplF+u/23sdwix36iFA1
 JGFkKloK7VPayPYcl+lcnf0zJGy6MDNro4OxS5ZWB4TE3XxCOb8E7YjusOJOd8UaEDiYqzWDtp+
 vx/oBLdvIfzk5g5D61aZpIE/3sSv0IPBdnxLEK/opP88+93Srv1AdiJK4RYeHobiMpQ6iQ90Lmm
 bPn+Mw1/9fn4OwnJBAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXxDkrJOO9tSLB
 lwD+88o1cMpDHiw8b4mJCDwybgEmPt8maA1Jix9elqnjuDgbAZaKuY2H+VzIP/dnffV5jzjFVmE
 +mhJNLSfF25WkOP3A+Obn+U+cpM9te4=
X-Proofpoint-ORIG-GUID: NCA9P2g61algHG8FZYIWur-lM3AGHNES
X-Proofpoint-GUID: NCA9P2g61algHG8FZYIWur-lM3AGHNES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Many of these are fairly low-hanging fruits

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

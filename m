Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80244E043
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388722; cv=none; b=gD3MZI5o2pu5AvyXCY+ZhzvDkCAFztFr2qpyK5fPRTiHllvx6RZINODFu0Yu6atIM4SzPc2snR8odDRFSSWCcIEBze+iiNYuDKvUc1UP+b/PkUMt9DqlT89kOIvZGNxPD3jceqNfexqCVvG1nsLhZqyMxmCjz/ReMrnz/zAToX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388722; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu/iWhgkHd8iHexZP5vLFzWZtbHsxlCqGOim+x24V2NAdJ2iGSMnR2mA3b3I1JhDFYQJLDjYVbE2U0ou5HWAFynV5W5Kva40/dQoILjBe7vD9yq85WvcTby+iYrs5tTvF+3tgdngF30mWZG4u6/pJaBY82l7Et2+7DVNR1ndmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2zGUWx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq8RKuV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2zGUWx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq8RKuV2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNfQJ432253
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=e2zGUWx82zMgo6Oy
	YYz8LezhLHZVD8F4TN6D83L2SIiCPTIzAkr7lbBu6Nr4NXpiS3j+Fis4Ynxp0044
	NBbpwjO8QV6Wt72rGGxzWtIBy0xPMAm0nW8ZQvTIgeWolNbJuvYTBeuvqf7tALHd
	wYPJFfhICCNCdRrNim52kD0t8/kL8zd3tN3DE97Tgj7+3ECcleh+u9yRouPrLyS6
	lDkfptHxrIJWZhLOOIjhO/5KazuxRCzV9mM2Gga+Vr/+yIsRlPVGndHLnhTTy01f
	YoeL3O2CK0SpREmxKIQ7HfBiqdmX6qw6UUrTcp9wLZrA6zUl6mnDFLvafsokNA7D
	JIRoYg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg05v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74ab6065f97so56252137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388720; x=1789993520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Jq8RKuV2amWD+Dw5+MbU4m6lKi1wC+6WrsFqExYoX2RIrrl/+UpwFRWq5kCtQtoDlq
         j57gIo0lfNy3guvFZFIKI/OkkdVQWmD7q+v0A5uyCNoKBuaZhcURRfHjJUQwwQwHcPnA
         QGC2lPKxBjO4dzQloA9CjVVmo0vCBcM5UdrE8ezskzx5eQ1D4q2icGE7EWjwyS+g93Mr
         wy4+UEvwd7BqrxwK595gE86nLXGI2mNZdcB/KEPwQ+HgdXfII1Q5QPnzq1vpNjDaE7fR
         WuxO0nx5myfjN9iQYA9Z1Fj/8JKj2E2BNeu1w/BRgxo9YMxOymYijanNScaFjpxeTRnf
         glSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388720; x=1789993520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=hA49EeX9V97d6XRY0WhJ6LpJ+swpHw6y4DvDQTHcKlL7cbv3GC6nLRKHBI/FGZrYWk
         nQEew+IdAWKndFO6Y6Bo0SA69avnKTWlD0wqdVAyYUs5hM6jh1xWBLmx0g2qOhLvsA/6
         EHoUCWPEh+TxuNs5o9aWPoeT651gJgQf/a2gYQBd3S4DBJmIjYH6y1frsTzCsPcWDUb1
         93gkBXkfI+iLdQkIsc0mQogCBzFAHGSOcQOPq6N1uZo3rMhcnlfR+s7nDnwKVma/4YH4
         TngHe0dgmLMfbHU+zEwWgUz+o2uJRywWSB6T8s/zqipjH62zBbg9npc6MKoJDg4na7kF
         OerQ==
X-Gm-Message-State: AFuF++k7vcZyRSzr37U1+b1dUPAbYXPf5XOqljedSqXfIjEMoRWbtFHx
	XSqPjJjtKgNFmdv60x5qsg7Zpq0DinI9G4Wm6Ifdy324TlnYq8328gFaNit0TxCjQzX+NKnHUFA
	N9rZE3FVSJUm3B1b7pmzFvwEtp4oPiboa4I6TZlA683+KSWuICiqo6fqCng6cThYZtEcG
X-Gm-Gg: AYBFou1MkkxxBzLCwm/I4ecaxPvY4D1c2CMBoPTq371TgLty5qeZnESBbHcIdlnlIoU
	BMjeNqWNV1SBkpX5IvZecPBAHwm3D5Gf8f/NHLjjEOe4Eg1SNyn85X5RrxpT4o2M2PrhCChxLfT
	S0T0ZsqbltZ7zYwqJJwz2l/nznwgS02549/hMSE55+iI2yu7wFU2DUAPxn89r7UoajQOZ0JsnNr
	eJCOWrYJ9DbCyElzX0KlWLfw0CboVtGYHqQjduwNtQMgH4kq1sv1ApCuXuphABL7GoGfV6miC1S
	rozui4B2PuTBNP1DlN9OTqdETyK+nb+ssH99u2tO2Fua56Pu2MZAX5EidLu1kQu5UuMaVQ/BOMR
	8mY8dIYKkFw+Ed7AIiJSEJg==
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219897137.2.1789388719995;
        Mon, 14 Sep 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219885137.2.1789388719658;
        Mon, 14 Sep 2026 05:25:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:18 -0700 (PDT)
Message-ID: <0b78a330-b2bf-4dc3-99f5-86850405a4f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7e7b0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX+O2RRXRE928g
 I2i9lYopd1cJxssHhtShZPbc/60VjNPmwwz2517hyrH7B+us/B2zLIy96uuQ+K8QzFUqi6pq/zF
 ykd2sklOiw1O3cSvvOrFqQd/jQR6HpVGIYWmmECd5zE7fhqkpk4JqLyP+5YIuPiaP2Pq67fc97P
 qU1t6B+iHW3gdB6Ow9VCThdnZHw3g+dm6zuiNI82DTS+X/36W/R4xxJ2d5MzpW4s8OXRgTkjHHq
 XrijRBLO+fP0PmXwMOeeKaFXrbxu5pdjrD4CZiqTZ75tuV8OlabrgF+1E4sTDaXLiFcHIWbEX/A
 jjQzuHoPo2Myya3i3BCY1vdvCUTtDP1FNibwiriuzVquY25o0MIExcv0JHakhd59mD+ztLH+FjO
 E/1n2gKSL2b40IKob0rL3XXhrngoZ0/aSuD2nRJk2GR6dVz8O1LqH/oNV7wp5HH4Mn/UQ5yahdO
 UXx9TND7fs7WRyxlv1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX6CtcqSRO6LEi
 6ygrr+2BtCz2ZxrbXFiStfQu1o1Rg+qDE0DoljoYMNscbjVhlM8O39mZSBU1cU+TweHRtUWATaA
 +J4BIGWzKYC75Blabvny23bjqlAEQs0=
X-Proofpoint-ORIG-GUID: KLaUUvc1YGfNdMCu-uUeYQHdQ-GWeTcW
X-Proofpoint-GUID: KLaUUvc1YGfNdMCu-uUeYQHdQ-GWeTcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140175

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

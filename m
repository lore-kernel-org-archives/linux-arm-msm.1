Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07C44160F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316115; cv=none; b=UkDgcsxMkgNzU6SMJqpCR2D3H1i/SR3j8X3tGkSsr/t16iYM0akrqpMBgYkJ0YA0YSg9F+GTPQVRjL6yYviL/T429/+V37MGdVIFVQ4Wiv85MnO6K/0IaJ8IBoczeM9VIeO/el1BbpDSm/0RTQltq6sHf/u7SIWRELfum6hgfr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316115; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKrXfX7E7EF6/RlUOgTw5YX7rbL28Ithr9OC/dgzXeDGNry2EhZY7ZV6/tc30kzUe92Lp/SQOO0yygo7iP5R/517gbEvxM2szGnl03Lre0B4WzqG4fP1J0VxuDtwobjSUdi4cYRy5F6Uz3lt+OyLij60kiYNB+M6/lWBzfyueXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+Hp9sbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eP0L3icD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+Hp9sbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eP0L3icD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T8htL31484320
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=S+Hp9sbKR2MEGGpQ
	kcCRLPIo6PWcaP4ZRBt8j3vMuyZTeVVe9YL45ntpoSmrz9PmEJU8w8MjlXGJty/U
	xPFfSso7aNXf9Q/DsYJ3ZQUwY7YsMvZqySxfHht1ebrhK63eD3l+MJHwGgfubEoG
	2/pf/VCz+/gXcxlxqIZIl0LbhFg/6IGb2YZqWyO+CUl4MjNp9mCfNszkfa2yOoIe
	xqjyg2m+04XpnwRvfq3FmMMJ8Pb9NMDJ1bMg0ga2FxE/QjxzWmsmzm+AhduCAZSz
	SVAV25UPkxD2+2RzHTm7KZ0uDfnem7KgdpbN52zyM9entV1wf2IeBCuSckELFU9k
	w+/vEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqe9203jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:08:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso1488076d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785316112; x=1785920912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=eP0L3icDdWIddOfvbMyiiewcrCpCBmYyIT0Qa2okQbM946FBFc7StZ9xkg9w72pnUZ
         o8qwXiPaMwD5CxXHBrelmnuP3/WNV9QLfYQFUhyIYAYmSkx4omYXDzLklB9BXMWA1Huk
         OIQUlQomOSxb+2koQkjnuj97nnJXGOpOUunfJ44Qi9n5yvFo2bQXZInFApCOQ79xV8R0
         gIyStOExTLg09zc+ucsBYxPLVV9lpnVdlAUj0sEGdb9lHUva8uBUAcohvatcCmgZ1Lir
         yFgbMEeCoL5KYhedRFp4DB4A8RXS0alMMuRhm49uTKGjrLgcmbzA6e7H4wMtm0zN+Etg
         CTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316112; x=1785920912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=qspeM0M3k6NqOZpuBRW7CW7EfrRZl8m+zA7TTY6nmFF2reqTrknpzvtIP9uyaSAngx
         S2nhsBZot1DI09W3vZavYDCXvHWK0RrSSgFqDtuSKUBUdOzKNM01+XSeCXhp+shBEuHJ
         I12BurKNe1Z+Gpebvn039k7IgO23Ij0PcLI6vE+JwHQ+mD2TE+QQ/R4BcSlj2auJvHNu
         Imto1XgOKXis0ryEdQhoVdsNia6wXf4ivw5kLLuStWlc2sqVn+U13U/ajA6UxZBcxAyO
         U5c/yL1m+Q1cEb21NeaD0iaMTnVHfHl5eoBGZxVZHw4Ma1+gcucrPZrUVlLWY4hN2kkj
         Gz9Q==
X-Gm-Message-State: AOJu0Yxq+6wvJZV/SUY3349Kc0mi8qEs3mQKWIBl5y5MODqDUmWuXwPF
	OzkWlUZG3WQgZw1h2/L6Bumd9TMkVjcYDvDr6j2esYWf3St6jrl9nvGj9hrvS3zQxmvv6aymTLQ
	NDOm0umKTVEApb4jh5rLAgHXXziTElZCvUK6Yj4/XY2Ye0OX61TB+Yv5iSpARCHKMTpDc
X-Gm-Gg: AR+sD12RLkBkEJh21UbZJyfheiUYrgycju6dgKTbADt7wjYg+ZJ8CzX8J7EDEZHs3cW
	zX39b00GQyx1xo3a6I6zxvietWerYikRUVN/Ekkra3i7JfFvQ7UhKyMcRUWbs1tDriXtTKXkK3+
	qBy0ER1MUR/aCI3iLfFNn8P25aCTxBtB3/iUg6WM7G/iImfDsMLB2g8kwkrRI66uBOiupmOOVDI
	jdR4/oItYn5W1EUipH7suOrgrrP5TYJAM2QmwITREU2Kmd8IgbhUJ3qzqycr1iyncXqzTmpgr0w
	LAGW5qxdd5YMsTk7j44v+fNirgFLBV30QXHtAHWiCz+4y6HdFbX6oJs+Ir/mmR6T/n1kDQeYOmk
	wwjSkRPUdvyJ3MjJ8rLjMccON
X-Received: by 2002:a05:6214:2607:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908173af402mr54178536d6.5.1785316112362;
        Wed, 29 Jul 2026 02:08:32 -0700 (PDT)
X-Received: by 2002:a05:6214:2607:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908173af402mr54178146d6.5.1785316111847;
        Wed, 29 Jul 2026 02:08:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c78e65sm592841a12.31.2026.07.29.02.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:08:31 -0700 (PDT)
Message-ID: <801d2f66-db9f-460a-9a64-e719b495f8d7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-2-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-2-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfX1SxNIdUHD6je
 2kcCeHLFoFxYY1Q9zcdFpXbw/zynV2pJixQ2xo5x8Q+sKSlSN5bi/dV6UlwqKNRudsMQXax18zT
 4wo0oyvsXQkOfB4yQbZZBz9mDR44as0=
X-Proofpoint-GUID: gQipOOpgvcCBmw8PipeUtWCi9SJ5qwly
X-Proofpoint-ORIG-GUID: gQipOOpgvcCBmw8PipeUtWCi9SJ5qwly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NCBTYWx0ZWRfXyuUOZMtwmCDL
 3m0cvVSuz/+O+7kSsBsS3vo41c9onwAOuv7RF/kQfty/CdDdHNJtSH2Cc4X5+pNbYzzeeDyCmVt
 KpTCtrR8Mu58fpzcuu5saU6rYmn/9dbjuAi7xiAV3Nu67lpNQ6a/Iid85UXvGd0KkWPfX2OEPlc
 fb7f3qCbhTXG6g4JfbXrqyAkpCt9gAUa0futqh46HcBE88AASNuSGx+fH89Ux0tVs+jIbTlEq1d
 Q3DAM3wqkz6n9hfbkmloMSUonouOqsj6/+v6H7rewo1B74FBlXviIIpr1Qi5vlmrHwjrFDc5Qy3
 fkwNIgISLDZwysliEXFngx4I2osRLj5fqvSzXPyRT4LlJ2Om3Ocn/TBVcKSYvnyDoKXBFu3tMZ3
 vyCKbpIS+JXcijkH4nTYFkQZOLlxVeOJ9Y7ijdlLaOawukE0wqbxCR2ixY2YERUcZl0BhkIT7nK
 LWKoYZq+RTXEmXy0FXQ==
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a69c311 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290074

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

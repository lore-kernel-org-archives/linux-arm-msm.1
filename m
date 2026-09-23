Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0410496D49
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179597; cv=none; b=Q3E5UWX664gCoHanSGqBuuVBoDC+lMjlcA8HgcqMGFy6lABVFfkSa+n2cFLZ188vK2z3KxWtsXHltAystnkXFqUkGbdPeVuIrnN9swAX3F9SS6BK0FTFlXzVxH7wWIWqfklaQDydMAYYfxMPeRFfgUpnwLC37lU9O0THH4hr/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179597; c=relaxed/simple;
	bh=7RgeHwPYtMaSqi/p1KuO9xl5tU58oXts3DwvC8M1/GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4DGW9LfNtfEVv9PRZ2FAM/IZZJ5OzOmN+3B82AG3pxr/5G1se58QiXRjn1aVV4nr+ZNbEAHIabUxFkRVU9Eai+gph/VSmGW4nQar0PojIPbLlDduw2/rg4Dbl4MrkntjOX5+YVbKjmytY3+5zGfO7PtCHjDfPcqDGWkc27fGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNjJZzh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhWD8bKp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjJZzh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhWD8bKp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDPCR02698065
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=; b=jNjJZzh04fJERPl+
	tRbkqSodlHUB41rjwFfkJyTZXPmBULgi6MBWQXIzCRGQY7ZRyc/1hbZBxchE9AM9
	COclNPuL7tk7b+9N8UP/7Y19X/UcLx1JkQTGvmPnTtWyrkOuH/5/yZCu3nOcVqv0
	Mdp73GrnCud/66qF/DG26T2LuU34Nh8GRSWEc/SxIZxwast8WNhGq0/irskxeYXr
	oJ4MDx5VVWv6GYGhvaH0N7mYaQKrV2NcPibcbGarIgPwRRBg1H4yXIgHy0x2yiUn
	e+SZGbCZNEeMQlI3pcyeiefRRWhdBCRxwW3dylDF0WgSPsJLjd8N58ve1rVKVLmN
	bLKHSA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwgqha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:06:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso115741e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179593; x=1790784393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=bhWD8bKp81YOPhyhw+j9PWLbEFyCJmHou7YxV3Y820oPcVHtK+m1PCRe5ZhAUEGQRA
         CcBntZpLQVzBCA44Qb7nshf44u12vXA+e8q8mFSje827iRGy2aYrG6cvyC8r/vXGeVqp
         rxDQr43yd0XnI6WM8OSMWXJPsFxIGdONG7De7eybygk8oUb/2IigMgfZClHQbkDXmWH6
         wmdW7S4I7KxbLmNnKyL5Pq7CtV0kLoPGh2zyw/+odgDl5ukIvLNDhCTs4iAqFqpTk8Aj
         HXojcbEVIlpyRZffYTbg7x6u1IslJznUVaGHKbtepmCAUvmtjUGGuxf8h7eixRCmSOgW
         +qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179593; x=1790784393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=Q4zjdiUVWLPKOZw1/EDx+x6/jgS69gaEhNyGeuQzJwUJEBTTksYi97O7/oQh6TflWt
         nBoZ84xAfe0b7Mf5vvbryXICXN5ifjFpGB+x9hNmEiDwxvDm70lts1C9Csr6daO75X65
         2NEs7jT/N0O6vSB1ffJywhPWxTOMW0oD3K5QxR7vF09H7jgdMCQDAKpA2vuxrESkqBHA
         Bb4EzyMAWEeeSj1dXdeKZ3uyQNOD+EGjOOIU5MVKwwG+B5Z74Mh3H3DQDPJZ9ujt0Qbb
         ojTkk3ohb1OgPYX7fRwrCSee025xENzYLh46lvOT5y/ow2WexVEZeVvx0uKu3QALI4H8
         Kqxw==
X-Gm-Message-State: AFuF++kCOPWX7bktEoOj5kYbBFgL6fUv22rZyTZXcoaulqTkWSFV1Otb
	ymdHKZr+jwLTqz7HbNCBQ+c46MySRyB7j9UwdCu2L5NP7JgiD8lAmaxCROyk2BIK/QxCe8SX1mc
	KT+vHnjRX31sGct5J37puc6bPBteWYVLCKEzlWaoaRfoLaE9mFIBkc6rrU1SbFgWvTkey
X-Gm-Gg: AYBFou3YLjueML+pvFG4dAOGn5tqxlIUoBGo0nQaht/z78agLkT3uutmyfTFHnnRJM8
	5q0P7S410dZ89zWaV+1H08khJN/XmjayT9ccqQI4OI0luT58ZMSlELUhcM/YSND8sJpeLQV1vEc
	ckvGD+/2QQnjaXw2oSbwjuF/6YpnnAkc1QdjQg3PB8DqlOH1/ER1Bgo0noWTRNoj6zZT41cE1NX
	ogbQWrPP/1Wb2MJMBLt0z5OFNo2ffxaZYTjO1aHgF+sxa6usr8K6xauzoWEY+vAm+WWexyTMUKz
	gb/PFuxrRAaDDTFvEee90CjS7TtuXNUxZR7x64q4/UOGHvlNMTn/sTwUt9oLSBN8jwRF9V8oeQ3
	/HWX5fi4VRwbWFhbJud5mIw==
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032914137.3.1790179591864;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032853137.3.1790179591382;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm154081966b.61.2026.09.23.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:06:30 -0700 (PDT)
Message-ID: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:06:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX7RcLoJIgiViU
 DPIUTDxsQLNljFRCTYQVbm+uvI7FgtN21B60r7iAwBu3TN5t02XnZzSRb70wPKwNd2+N1NHYPqs
 LC+HAtHsq2Km+VqxsLYePX+/y6+5F7pB4hEfC2EJyzfTPX/2Rty52l83bO+u7wuB0U5gqLwwvtg
 8LIpAZp5mioegQIDFby38Dgd2FUqEQe4wzJxiQX8achLlquOq/56n9C/RzZIS8QwghCk7Ceozv5
 cbihdWND+UrgixWPiv9W2t9EYAkSNCPltKShQo1Zm2WR53a9qA1pFiBWhHt3ELk+Et+Q+G+yL0W
 E/L7r+ojMtLn0N/+skOxF3sL7Iycaq52KHKAeRNJWx8mYqSVJdL5tOgKiuz7IiA4ni+Ts9TtpNk
 Z88mKTuyjEFIDSDvLGqWWzwL6XVikZLQ5vakwiKCKRGK8VnFzVbExL7i5IZljwnbkfj5grrCIK9
 I5GrUOXIZ3GTmL6aa6g==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab3f90a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XKDLSxsrZXX4fVXGSQYA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX2EurKwwtQE6n
 a7MpnbhYXwI5xhRhH78wvG6y4vXG42WhtnkAyT1DRCkW5EU+0dI1yHs6jjART8mO/g9HbWSt5H2
 QOMtXxk90iX6vp3Ve9rP2rAPnw3WQpY=
X-Proofpoint-ORIG-GUID: q_BM50ypY0Xbo8d6kYGTiJVTREUSlg_d
X-Proofpoint-GUID: q_BM50ypY0Xbo8d6kYGTiJVTREUSlg_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230064

On 9/23/26 2:16 PM, Neil Armstrong wrote:
> Add an initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

[...]

> +/ {
> +	model = "Valve Deckard";
> +	compatible = "valve,deckard", "qcom,sm8650";

Sorry I missed this before, but you likely want

chassis-type = "spectacles";

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

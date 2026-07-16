Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB4443AA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224380; cv=none; b=VHwduwRVmtWRdNyWCn75h/Fw5xOFey24ARowC9L1hnz2ylZdok+kQ8u1EzPzBZglIaAjjH9RY5TQcDF/xUlnbdIoKoD5rSj+1r6Qo/JsupCY2JvEQxjAoV+jhqAiyStO8zjh1lUhqUixoPW+NZrzHdBCb6h0Xoe6aIquPLWRK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224380; c=relaxed/simple;
	bh=BYR/ghk56lSok2v2umJY3ZICREtw/tFBhnOm6ucsTPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SH0KL0YBd3DnhGr+Gu31Dkv3Fyon1BxTe9v+WonrTKLnP5+oLy/DOZNXT1hIxh5N3YDkFu9/hrbXP/Otod5f0mgUwUrenthvSUDfSAdvr4QYz6wIeWMJo93G4poTBqxSuzQXONf7lCm2Ggabx3o0DvjRJHzuQZ3IOfLcX/f3kZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvrH280K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LA2HI90M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvrH280K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LA2HI90M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSdMf3274690
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=; b=OvrH280KO6UViHfF
	yYoQ1GCcEip5dloFRUldSKqSgFeIUkx6Z4W9q6jq6wkJf51A2mZEMQTI8oSOVMll
	Tg0EbzrZNGeUJGrcvrcxxsAWrS1rmcvnJJDZkMteq1RJCQwO5lLwtPOwhQO29bPQ
	WD90AhjPkniOu3HnVvN2ha25TfwnLEqqmb9u9P3tCDE2d+GVvJe1/16kvysEHq5m
	pVXXxZKzZp/Mjkfdz43H2mD6oCNKY+McBxZ8L4nhm5vZoU9qYGFwm1O1l/tjhFVj
	CoP57SxpYx+iX/y1g/hZAQbEv13g4kkv4HwtSqborf2LiWqn+pN+Enbw5Ar+ax7t
	lpmcAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2rgaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so21444041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224378; x=1784829178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=;
        b=LA2HI90MQc9BRX9pm+EqhN1qVN/7akikgLjyVLfvervQyv2LAAY7KZj1fDInNTuxx2
         DW/QsEi+A4NhtuxE6wFshk1Vdy7WG4XNNP5GkZzIJ8U+//o9sQ+AP1aphYCcdf3PBojR
         sYEm7xGLoV6FqWNYkKJ6oavgWELlPwOn4PpWdhMdB6gvSOl7+afSkPsGGxEDe6lGtODi
         diPL1q1B3zxa/NGEl46slxk8TqfuImnQ+mHN7Ru9JY75EvryUE66wtEB0Fpc6IhC7jY0
         MTesNst5jNfmehiKZGfsBeC8oiHuvbq9c8YSBxQbV6PaGkGH2aA/p87SQceH1goEmxNB
         sM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224378; x=1784829178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=;
        b=GGXirqxIFaJCwamr1W2av7Vv/7l3/sFHB2Otp9qJhcXnpuWdCL8pc82WKHmIGwm/Vx
         MkaeYK9tM4zH4eZxPKktrX3hRnBBLg2sj554WkveanUQ8oNfuhu93+rqKvBB96HAlM5A
         bpAoVmuAEJvfEBx3PshMMIkfijAuu8rtFN7zRIj+CE7+HQXOVqGpn3qYS3AXLUkJKi25
         Q9gqNvZIa0S7T62pERXEjrJHgjVj5TfefXwhbWCy2DnZvX4vYKAnwPw9VmRezfxNTYbr
         ztCJruoVP/ue87/hy04ccBoUuy68TR/TuFy5Z6IcvP3iSIz7XIoV4e9LfI0VKsqXbW7D
         5ahg==
X-Gm-Message-State: AOJu0YyvC4M0UBpSdEXnL3raquNbW3ph/+/bvRw9d1dbOkjN8kXQNRVZ
	dIdsaA46XNWoezlgtnyLO8j34anhkdPYTU/HlD9pS4j44x2vyqB6W/mFa/XRMA4Ztt2JI20I5qC
	kxS3LI2XK8QnixKisoimdQECmjrM/BCtwXRd6Rh1dLmA1oF6vcW+r63qoC8t3wNwBhqRH
X-Gm-Gg: AfdE7cnqAX2acgiVa+0D4Xn6fSc/Wlkr963BzeMhdtEwxPVPFOSGmzWwNOzw3as7wxX
	43jFlpyJ4BFXG2RhlZA0mWizsnnaI/MVkcIIENOo2MpJSW1m4ZRUnsTYRiguUi9dWQa0reN0ENg
	BwFFN6zBvLPxPJNYnrZK3rnaMBBp3XR/itTKORR4i01PsMC8ybdszalIa21MtxiUA4Nj+BlyB1r
	DfJabmoDlbc6XUwG3zIgauJNQ0PQREQEVR2w77rYAechqbfHrRkz5PYwUiNkwK6eknWInOR6wLj
	A/DZGkDfhngiEYU1GAaQX0JPyTxdtRtidzfpjHERiKI8FDb/NbAAZOtFEVVlL7c10tyg+O/OdRO
	wELaKfsV3W2Rw18DUxHJi9OdO
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr186838491cf.5.1784224377629;
        Thu, 16 Jul 2026 10:52:57 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr186838251cf.5.1784224377194;
        Thu, 16 Jul 2026 10:52:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:56 -0700 (PDT)
Message-ID: <6dc98a7b-ece6-4611-8b8b-d485c6848a77@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ollj9Om6r7TOehUdC28njoi_qp2NWjez
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfX+avQrWO01tER
 WG16b/oF6HyfHL0yxQhz1Tm4wSBdEly+wQVPmfZ6SC/2d4iwdk7Hq+EH0Zy6VvCU+BIH6+1b15w
 q4b5nFwAGChopBsvssWlJcWHUFRhOkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfX8g/+FytbKgyC
 voN/EuFWU0O7t6xYngGTG6sVBFRAKyW6KGDFfaDnUzeECpd5mQd2mbgKIewTXtTkyJdJrR38nTi
 VcTdyQjHNgpLE65oxnG/btq7+DLXiVrl8G/6T8HCO4KC8p+PXkfZn0hOsLN7d55R7Otekf/77em
 0CqOVaJ3989McX0w1QMnRCBj0suq6gHEooXOYUGLUYBEUWEs/WF10IyA/0X/V6nVbj+CGUFE9RG
 p3b7qLtQf5Zmw+eRXss/NY/MUkiQWBsJeSdNvcdAnT8qywt809Nt9DNUx/NusVMubUh0dk5vBZW
 8nIu8VXRd+ns9RS+iFniWlpRskbxZJJszWdEwx4A1CaPjwZTLHVQW+kPsYGiSdzH+2kN8pUtkY8
 vkvzN9Ipa2I4aco2lBmeI48QsWOeWTnGwhtUFhKh7JEyfeh/BC5xpj1TLpkU/XMaI9pCc4KZrHY
 48U0bPTt86gEe6MUXaA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a591a7a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bDFlRis0_Pq_FpikMJAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ollj9Om6r7TOehUdC28njoi_qp2NWjez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160183

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
> the device tree does not describe the bus width, so transfers use the
> default single-bit mode.
> 
> Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
> write transfers and improve SPI-NAND throughput.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


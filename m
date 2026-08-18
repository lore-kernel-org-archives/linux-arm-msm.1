Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30CB43F0B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043452; cv=none; b=MsmD2qMEvHW0U/1W7o89VKpWsukSPBa190J2r6kiGXp6lwyFUJZVIM7yk+xl/oD3IkKSqf3WpfMGBa8Lzcp9ib4EACX1Nn8GTjHWfGCinbe5yJk+8yfYRAPGfrFoO5/MU8CvKEwVaAQ3E8DK2moiPU0PIRxTUBCPnjuwa1uj6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043452; c=relaxed/simple;
	bh=v69QcsW2mOGfUzf1hWEyuWqfUsnkP86q/3Zcf5zRAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HANQs9WxyuUPMa1YoY7/tUd/WZk7aOnd850jg7uMRGJryFeInxrR6U2T6ciGoBw4qIlWs+6LRyQmzsPZywXGGHNv2jxca5rqsGiUoG8uL+9zGcF+MY5R/qfC8EPQY30Ts2t8RlPvIBo1Nf8HlRmlQKOBGJiD0AfnW3Jw29gFjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1YXZb/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr8DXtYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1YXZb/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr8DXtYu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLTV243135
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=; b=h1YXZb/apjm+o+yj
	D6/wwFQ+XyMLCBzqrCPZ89IVFPd0h+hrIPReUhWaX1Y9ILspzdYjczNngWvafd4A
	jHJ8MQl0iaTXzw4mqPw+LQfgjdr4EaawzIRYNaiEPGf59azu2DG+PIEzWs2xbadP
	jFiWIxXRm4EsKbaySytz1alkgyPbnS/u79oYPeDDcRnK+fhnHoFeI0nIT2BUXSgB
	8t2sC2j+YV7BoKTCwq6YUoAPoO2+HrrDlGTcu1EnEr1d8WNyrXDty1rLmmrNjjb6
	LscySl1vtsb1GVd0BzojtT+Ai/eZQfWIRi3UnEZel0Ovrg3wSRQOszTZqdRY8PWn
	b2TvRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hn9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:57:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936bd9b045fso2926285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043449; x=1787648249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=Rr8DXtYubw8KGhDyHXleT2bKC6PMethFt4mZyezLWuQ2jkM7Pmrl051N3UKlNweT+p
         sCLutcZVPxkzGBuQSIAWSLkGlgr1h9bg81m2B+eeXsdlu+QHf1glnr7rnsVpV20TTwPu
         TFYdg6VT44IqmA2phGQ3Dboz/QGaq3SdSNSKDaerCCITXtJmfNRY1oqAq/KMd37tSiex
         eJ2IHqVXNjOvFMewHCgrplbBbJXXmzJiVlH2kRPs0cp+lAstYUiHqNPxEWi2fCh/7k1V
         1otB0Mq8rHLocgludIjIGywT2LPSYsGhSkvBr5eaaDxO18Tqa794YzUt7/SkpBOBxQLE
         vtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043449; x=1787648249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=S4aVo/XgbjewEuUhJ9YeoiADzP4uzQiMOZuMcVuYUl1C35Ch4iMGESsINlF25W2VVq
         BryJcINRus5ft/NdoUhaFfIKT7z3PKfzKPgtcMjVU34F/OtZwST+JxDsyICT6wawL/m+
         qUWlDlunVxTSR36R11VQkZZKgVTeq8FdCGfzwEdzNaNWzMmP7N+DDsRRY3Rn+OKb4c9C
         aFXvN9ZftTBGvKCjH4tOpg4wzePlmIm7k7fqAQg19fEtTMTZdwgbCwSFKhFnTcXIAgeL
         lUWt8a3V9/sMX/r4ouN9TsGYv/zQiYPYXgQbj7/9typJfWC9B5bZtIjulOis5NbNIijB
         nUCw==
X-Gm-Message-State: AOJu0YyTgWSNPUgW4UKVtD278fOf22V3zFMEs+T6ahLqG/42XTwSM3Rz
	F9UnSZReOINaDs9TNbzsb1Kwc6CzdObj0LCWOF+wFzbRFyS16D5ccxcOYVxzn/zk1CwgKDOl5u+
	QI9KXlsfnbQqeL+N3JL4nNkrE6Yws4joV5WloaIONAIZoQYJOPcnVdIP+w9gdWl6R8Pc5
X-Gm-Gg: AR+sD11p4iF1Od7AhsFOcnbZPWX9caZ4SXPTOlC4iwg8PlOW9nICEZpNA8d1iprlr+3
	oNmAj9zS/zF/B4li1FyyP8aweCGxhVmDjyQtG4nsfDurL+NkYLCCB6gY8yPK3nvn3IloLYiJAXu
	jutv1sQ7alEJIXUnEYuOWb7hgjrnowV9/0xNaItItTZHu3PqJWTNYcoHOc2uet1dcpOoLkCY+hK
	90+i97rZ+4sUuqBGneys99AptT0l4TbOeF8HwdIRY8W14hFZaaJrkxGfs7OXQmlnRPOWCVdWOJH
	aGa3zKKtgR6/CZ4aNZkFa5klu2+S7DDA4Kf86UZvOC6cnIiGYCflxlpn/6M34MRTfkDZbsy7G+O
	WBx1Mf3RpT+OkcFl6+g5N8wIT
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213170885a.0.1787043448937;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213169285a.0.1787043448574;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9a35sm117355966b.63.2026.08.18.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:57:27 -0700 (PDT)
Message-ID: <17cbf5f8-c23f-4b97-b971-6b6f4f3226c7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:57:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY
 TEST_POWERDOWN bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXwALqoqDi2S1e
 9xKnlfhRddyjtvQjDIXPzKZOD7jTgNGL+O7XicjdNJzIbQWFoYCnDHGyMPf9obmctlCKoJUsesR
 CGxJQcYW6dc9jdv7hZSsSMGsacqC2wNANhAPife2xQczhPOtVZ5emJeCsGb1FwVCpfV3BJNmNp2
 AXAfS2ynBer4m//514ZQl8FaeYR32GHciBO8dn4eM7thZNCbMo3FfqnPoLNFa7HnG8jpDU1HkTM
 ai4Wwm//xw4/lMW6OOO61m0dMUDI5Q5y95iYfX1Rjda38byoBqLxAUV/5M88v/bN4eiqlbvbsQ/
 n580uVaC7Q+1oQAp9xMx4aaMc6OBF+cZUJcEFZs6StuLqxsf4iXgPvG7gFBaFpaTxUtUIUrpyeF
 G5ukJP79oKTefCJEMXvxFKyyuCgPDzHOHgS8/8qbnGZM//4Ng7xvwDV/41eH3ZLhxf5idQpY9zQ
 t3v+B3WLZbChQf3TJLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX8jA3RkaKovZn
 V+yoE8aK2DvYCIqp5ACoxbmoXqzJcoFVGXv9dXemI08GKcmPwjE99VqsYqI85VQxO0zEC87At6G
 QQTuFXIWX+aYOkN0Y79mNHtGdc+ohbo=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a841e79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zhQxU6SgEyqCUrVtDRsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: os1PkwP2lBcmhlF4jYV0CJ0-E3TbFYid
X-Proofpoint-GUID: os1PkwP2lBcmhlF4jYV0CJ0-E3TbFYid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The SS PHY exit sequence tries to put the PHY into retention via the
> TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
> the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
> the downstream phy-msm-ssusb driver for the same IP generation), so the
> sequence pokes an unrelated bit and the PHY is never powered down.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

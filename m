Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95B4052C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412847; cv=none; b=XBkddm86kdxCIthVOzp9hEb4YKKrsnJPueVB228kQo4NR62rkNNaMFvRcOeR15TxDm8U6SawA5qHhHet+W2h+FzHxyZUoGSVziiWiXpVsIRI4WycjppulF0EiiS2L1XFj6DWeMf1NER4/Hb/gzG7VW565xQ1z+bZWuSnRxcg8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412847; c=relaxed/simple;
	bh=/iSzGV52+3U2s77RWrfVZYZelWGYnoZNGDDuhVf8W5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0XWALX03X7wAFP6tlA6YfePEC6HTKrLBRb1g+drowsSvZlkBAH3n4I4mdd8CSImOUVjqjpJiRhXkt2UmA5/TAM0+fFEElwVutE7IRTZvC3OpcZ/bRRKEohkJCv8eBdEBl0P20CGRvFlYwEGhDTmvfNp9vtrm/zdppme+q6az78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaDMJ+HO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaHyHSPu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaDMJ+HO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaHyHSPu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBDYkr655139
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=; b=aaDMJ+HO1KRcD2CI
	FR5IUteiUFZPJ68QAqKsp970DL03HKkjvsC3WVx2Ukz23MqpsRZ4Y9JNKxfb34uL
	exE6HLAxVIjWCGB/ZIypBmrrKG62CuLDZN67IYN8DUEQW7eNzLXHhWOLIVXym/l1
	xaM05V3FA2cPi637CVxiA3AoVZWQXAQ22mjyhJXD3gxYB1jGIJdRXSQjUdZdMbFy
	+Z0WoFbjc4RgFKQsRiNKXJkupvDINkSP/wmaR9+Xz5Jv0ZTL0kTtyQBdq6vefZHO
	D/e4ptbOGDGKSf49aAM2s3zYwBoVeG4esKGmh5s0zUdRuD76O4fsvzxJfHHvLHAf
	b3TMHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5j38589-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso21823311cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412844; x=1786017644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=iaHyHSPucIr4UO6nO9QKM0o6ikGymrEdmMIqH1yGu46Wivc9bm13/EyBmnPphpO+RQ
         6JIIzcCz8MVU6euq7bXcQzI8uk0i8G6Kf9ZTzhrudDmGDs/3+KUJ8YecRscg2pUdIdpt
         0dOURtldNPrrlXhPQq0niYjiuZbm2hsgyHphigSzzG6vMDiy9dzigeR1JKvDMwuNzs0N
         xcHvem8s34FfbNGMb2eU61pvVAQH3Crs8KeJz8mlGIqNzx0EiZbf5wa2Pst3WWsoGU3k
         T1v0VlFG2Qpz+NoZqj2BRsi5/AeS1qjwyXTo6NYnQ78q8vXsQVZAZmlrmlPFyq26aAOJ
         1CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412844; x=1786017644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=pB3Hki/nIXlJJci6f3M5Xg7Fjah6ZWP3xmDu/XRJBNjg5boE/bjSwo1KiIfXU+eeFC
         vMKZTeWVLjtLOEQpK62a2/Fidj7g1CjbhA+6DYm7djto99FGHn9c2/e8fl/RhdIYtm++
         0lSGCejoj6Q7FGo/qN9clkSYIntZpqgUUuWNGK4vMmdmAATH0qBIfx7gbN7UJJtN2XN9
         fS4dcfuBW4OC1ihp7qTQWQ2QRWd4lwOB5WCOmgYJAI+p75k5nApu6zAjN96DelMlRzhh
         T8gaD9a8BagQ9aezRBJh/4+LRyTqOcrvRFTQL7gMDn6z/SmR4n59lWvpobGhNwOuCf+i
         UOBg==
X-Forwarded-Encrypted: i=1; AHgh+Rqx6YGq5NLplCxhX8AwpvRRmSox1uVyRsSw7iEntCpXaJSxpvpshED1dBVe4s6fV4kFhUmwe8l4WvbbCfzl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb844nLIBDHNF3sqFt6ZKN0y1XK+16bCzAAgRPPx2cH7KwAY4R
	b9PQ3Ys6seWZvSVmv1rKE2HqPfHIdiyr2II/e7B1bTtRaCwrIymnvNY5a3ASc3F6UC/M7T7ZrFE
	VuyTjQdP3l+dWd212Q/Xb7tgbQd+EJzCTE5PWI0KNfuKvYneWDVUOufCp5KFY0EUgQk7E
X-Gm-Gg: AR+sD11fLXxGsiiY9vkm6yFrNVPbujqIGrwc/yUKKN+JZYgqXnDR5po3GcmyRX1zqVw
	X1Hi6adeML1VeVx4wLLlb87wdvCc91GsP6NSEVpBBm5uoXH/h2Tme1S0/V568dz7EzGmOLgGSW2
	8bi4lWhuUbr09m/xuqJg55dHakZSbzpLzQPqKBRepS92LoH9kGwNzwN9NstZc8WooePn27uzfMH
	zMeiEapUXM13LDexxNzijL2iWUP+jU0U74AJsmr1097MciE/69djraguQBxi08v7lJSw6k3u3GF
	JUTieHg8igqgIncwlHNJ0/I/ahF4uVFjEeuRnbnLdVgo73IhJZeHLp0+QuVb8QtS30BhPy5CVQB
	xVcRaXx8fHXyFOnaia1dFRyfV2vA=
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22517191cf.81.1785412843579;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22516521cf.81.1785412843064;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fa857c8e1sm61431466b.19.2026.07.30.05.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:00:42 -0700 (PDT)
Message-ID: <8f41fc3b-04e9-4e8b-a07a-d2837f569b57@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for
 LPASS LPR vote clock
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yZ82ZDDt65Wtj8D2PbpDbpVIQdYsxAcb
X-Authority-Analysis: v=2.4 cv=JeWMa0KV c=1 sm=1 tr=0 ts=6a6b3cec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_tC8s0EdK-zx2rgeGFIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yZ82ZDDt65Wtj8D2PbpDbpVIQdYsxAcb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfXzisKccHWZofL
 JLqrH2GGS37ioVW0PCPmEKSRjG/QfFBaSNGvPQLCFaTPasnSYEApyGQu4xnZ9Sjj6cVq+9/jkai
 keXwNvTDa+vWoI4FYN3njCC0oh+d0HA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX6P8WuqRcz5Ns
 OVj81RAlkGCWhD4GYZ87lk8YNKBaVnayX0KUi+lFXYwJuJ5Y+tKNQApSiAAmIpW+e7whGVeAfx5
 FL5gH5IfUuOblXqJodU2YnfU3qgNWxo8R6JsaFYLcVZ8xv8XQzKlBAqyA3rEbsfrh6J3boTFdzB
 QimHPTWZupsw603q0oqqqWUyq/1fKXhunOTFLfFyWeEM1b/uUBlKLc7MPYyNbQBSdTRor+CZgk+
 ZwXY0xoaTW7Yj+yXh+5e5DMls59PxveXBZCddXR/AuelH0dWNpsu73AEMG5OYwWBt3xGUu1Lz02
 393NsUisfIRHB7apVOVvFxmagpPejZkSQ0dxVprWZ/YyCTnSF7SRChodCJgXK7sq9nVxVqkT7We
 EQYf0MeggDaHlvAr3dqoB7LVr5SStM1nMaDsQJQ5Se6eR0peR7g4lugJYkbf0f0eBhOBZjjumic
 iP53Lg5N1qxyxgVr65g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300090

On 7/24/26 3:17 PM, Prasad Kumpatla wrote:
> Q6DSP_MAX_CLK_ID defines the upper bound of supported clock
> identifiers in the qdsp6 LPASS clock driver.
> 
> Increase the maximum clock ID value to accommodate the LPASS
> LPR vote clock identifier.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582aead..ab7d20580638 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  


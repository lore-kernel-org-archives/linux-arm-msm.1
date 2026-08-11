Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976B41A792
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438404; cv=none; b=SBiwFac/ldssAGCJp7+52kBZEUXSGdqaXO8YI7RZsV4y48F9TUlwD0fqBG3c99MhPhkQCoVdPO5zCnsL4/ZB7bNkmyiOHvX3FEfv5NYVt6pbcJ+4polss35NfGqH3f7rbOBy0VKtfbkmrBt1TOiAw+T1sCO55NkqgHq8vuDo1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438404; c=relaxed/simple;
	bh=AlpHueBt0nZVt2Y7hVkWqy5+bwLUYtg+CHiJAgfM+mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoM1hxi75jRGaiwJHngyZ7NRkU/nc14UNwS0RaoZV09Q7Hz9pigCu83YukkA3/DDR+g/ZxIgMOGzlx0JZSaWNTTbC9H7eDSMpLCS1acTBdc/D9D3mQgJl+SXrMgKYWJTzhED1QaGTyvZQSWnYNYu1+68EBem09lD9VTIqSXn0mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2BVe03n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY7gJk2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2BVe03n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY7gJk2h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B43nZf3320728
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=; b=F2BVe03n5ioKA2IH
	+Yf3xy5KymoZ/+9/3BsXGZr+lL1yWAPoEcv2nHxey1DItm5zRs+vCQ6S2yy8sNxq
	5xLS7hoNCU6Pf+r35e6NH+SKGyXI5b1SUSwW70vZ+hcE4pjAklBMveZkqnC1BxAQ
	ZCzYr4u2KlZhlLg6AxpDjbWxqGAPA/5HMHrXzew03TaI9e7Tjj/w7qW8/SqAzk3J
	C4uqOSD9NqF+RTfkRq6iz1lDYBfnoW13/yhk1wOTilrFfAhEF7PkuADk3RKTDRI+
	uj6YeQTlkEF8pcNNET6luloRjZcZzCZot0nYO9pQJU8SLonVdxnkV8/oH6XOHmSH
	5UDFhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr90m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:53:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e6d253330so913810a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438401; x=1787043201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=;
        b=BY7gJk2hUMGrvNcmKRz8+5iQMaWRBeOoPjC/BcMnLVRo2zu2jSthNAgTy13gWmBJPy
         jETzsZM+9ALwq+QckooUUPC55E3QsnFPAueGLVsaWp1hOysncY9eiCYKP6GSXOfXU8kP
         Mlo6rJsJrTcnYPmrFUHXtImd88L9dRUnXs2oYEblTVdBb2fGpAYqGjfpgJjw3Q5DNee9
         XVjxQjCC2EjX+vWweTPdgnwVd/F2XBIwQNtQx1dSyOHVfDvWBB27Kp4+Lgnw+WpKnIAM
         WXjAdK1YJV63M3TSEUQBMGNlmzeueotOeIVaKzWZ9zNfKH/yKCBMYMP3At2bT/TcmHON
         Ej5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438401; x=1787043201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=;
        b=NZDUgqSmmVJE3ZcXlVU7HFcDP2IWOss29Lsxq0bFfkpNA9+i6zs0QZSncdl0rrevkG
         +C+tV3S4K8USBXtwref6OAYRNr8qfI+7tYsR7MgiRAn/WpwfsyCvBF/8G2+CWgpNS2+N
         BmDFZOVqDCtfu77fF1QgJ3WYPgDnEJ6MHpDzZPCo/csdC1JgGaVXnABjJRzweGsRi/Kg
         AE7FTXDCoARRNhKQkEe/Ols7101whUXC0PuKjD0KCtn6GhaYRN0jYTZ34qVhKVpHIF8c
         G7Z3/x69099kg86rvljfsbVtYQmJQlG+PF2iC9+l8wzl1Ulg9OX0dFaxFGj26uD4XGhU
         DXBg==
X-Gm-Message-State: AOJu0YwcgQoBLt0kru+IN0Y6E8auwGpCPf12l7EVm6kl3qjSppR/caJK
	WC3NnkQcAueqDDimu5m8bna/7LGXjMzE0A1hn1NuvRTUTbrqvhwNGTMYJ6+H/cZpGLMD0+uKIst
	jSUsf8D89iq1vJoRDAZpxOsngjZ7Bl79pD1u5xVXPJmESj9PaEKsnu+c141HLm6TWOARU
X-Gm-Gg: AR+sD11a5Z1gyjJ1VI1t+PfIA4dZEA7YoQmTDnvsd11cEnQgPgME2IYgVt46PwpCAY9
	tYicNe7a1ZRufqiHONssmNipZnzzZpbg3KOivMlpfUJ63rJ9nZJu/2NXMx6uUUw6VM+NMB7EolU
	kYHNL78odGaTt5porNgBndZ/qMD9Z6Zst7TfRAPmYQoc7DQJGk0qUpBj5cEE/WETWGZEFKALxSx
	C+z54o+H+e8yHLhaPS0NyD8F2eBgIIjrR0p4xKHQ6xUAfqiMUCQnp9sEBJyxt80pxfCTqNL/cWL
	ddFq43T4rsY6C3r1zoz6UaGpOhxwBJ/JDuv6xsfSFX7mQ0CLptKSKB/RIud7IU1OVPmXgzlhnRb
	mo3oYTFmKKblxJ7hhSAP3tnTE
X-Received: by 2002:a17:90b:4c84:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-392ed50d590mr575262a91.1.1786438401278;
        Tue, 11 Aug 2026 01:53:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c84:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-392ed50d590mr575236a91.1.1786438400824;
        Tue, 11 Aug 2026 01:53:20 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392e5650731sm560412a91.1.2026.08.11.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:53:20 -0700 (PDT)
Message-ID: <366132c2-273f-4b8e-948d-4956e5241881@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:53:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] dt-bindings: interconnect: qcom-bwmon: Add
 Maili cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfX5FmdLJa0uqhy
 9duj/F/PjzKU2RpC8f1wCpmDVB9LEYic0Hj/zenTRnM2qK/DMzSHf5/E+qP+bDzkgzV7bbP7UZN
 8sxD1PucLK6mhoQ2ED0pR6m1a9bVHvJdjwQdRBcIT/+ZkXFjYxYCRPD4sw4jJUayKsGAUtnH9yL
 xHZlzaevCnErkyRme4tmmEDYLQVHrCMXD79OdVQVSCqKezDUmcZV4MV4PJiC5EkFxdjoyvc/DI6
 WucJoKRm4A/phL8iQa9dP3YhF2FLFYqMqE6WwaFULVGtOUTn46uzJKJn+WjjiNJGP8HIcJG1Q4U
 PmaNP1SqJOXyjZYryEmR87njjL06wX72fEPkwYpRpWmwn5gnc7KldWATM6QGjDsKCjNDWf/crNy
 O2rVA/vPm35emkgG3BJ3IRq+rYaLJxfJoewdXm39S9LMlcSgZz6yjX4oe0uZQSPTcLLD7q8ppsT
 T5lxqAf1Gvd3Wa71URQ==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7ae301 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=x1iS9OEPbFcJzOgkp3wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: H2v5e8kpdGSYuOj0BbBA9kjv6PkQlNzI
X-Proofpoint-ORIG-GUID: H2v5e8kpdGSYuOj0BbBA9kjv6PkQlNzI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfXyWqKo4T2qBxn
 k0/21TSpLoAJdhKG0iUimQMCjrLOn0l1sNbguKb8jFnRtDDNT6jAWTEILxmG3C+MZHt0MPz247O
 G0XetzqR9BGIA0laegCnuPoGnWV9JIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110073



On 8/11/2026 4:46 PM, Yijie Yang wrote:
> Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
> monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
> consistent with the existing pattern used by other recent SoCs such as
> sm8750 and kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop Assisted-by tag; no functional change.
> - Link to v1: https://patch.msgid.link/20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 82b1d94d3010..7989db1aa774 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-cpu-bwmon
>                 - qcom,hawi-cpu-bwmon
>                 - qcom,kaanapali-cpu-bwmon
> +              - qcom,maili-cpu-bwmon
>                 - qcom,qcm2290-cpu-bwmon
>                 - qcom,qcs615-cpu-bwmon
>                 - qcom,qcs8300-cpu-bwmon
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-bwmon-ecb43fda63c9
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>

Sorry for missing the previous Reviewed-by and Acked-by tags. I'll send 
a v3 update to include them.

-- 
Best Regards,
Yijie


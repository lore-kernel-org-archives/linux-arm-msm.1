Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D0489868
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586503; cv=none; b=el4VPcDgkFodWd04qkrz8/0qzS5CRgSObqyjMUKFQoBTKFmyGgrDSsU47o9XBtzi6Q02NRfBFdq7iAEOEpWmCvJGtdVsZNVFNfWCCnQyzK9ix88WoEYAbmA52AhStihcu/MtMuEXVCG93Hbk0EtYKaW2tpXGxG0JIFUKSdelzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586503; c=relaxed/simple;
	bh=2xXGdaXDNnsrtVUnohY8qlxGqto2i/9dFMW5A3cmyJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H7oH68gFWGY4RPgqOV4VlWQO7AJ7JRRH+0YfxuMMF7J6ElBIveSa5vBqnTGhqfc+vwk43w0UxAIzMunAqP3LZpUnYRRHEzjw0PgSVOX27/5Mpy4Kzs4ablc8PZoNcNEHAJbGe2f7Fn7rmLFkxmTEKSdos5E2/81OpV75wtEYzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4yuEEs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjTT2zkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4yuEEs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjTT2zkV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xegi621103
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=; b=d4yuEEs60P3xusuu
	kBWMJ2ARnjphaQH8ep8E9kRY0B0WHZpTGgVxneQF9pGMIxwfszMp/BT0ChrD0gUH
	lx8sm5KpST+x69W0ajEKL8u+ek6iDcihG+eQi1fKCBpYyY5rQYZOAn2PAIxzMQ96
	sX/KgA8Yvd67AFozbx5eVqXzYXZLnPKwMsHlFujkzvEVlReIZ7mzjAFAhn7WsZQH
	RT/IBN71/keZIjNJd5SGiNAnsCbt1wT8q6dyMoM/+YYh9eF4nHdykqKY9SYSaiC/
	FFnf37q2wARh8P7Qcu1UtvkeJF7hdAd5PgpQx9pqu0ITfTIY+7sYtOI2bgU/vEYk
	7TKkvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrhuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:08:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so1330138b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586500; x=1791191300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=;
        b=RjTT2zkVsTTQ/wMZWqJlsrv8xvDX6iDvdiyeXGrHpL3QLOpOQZ1dsXpj+BogtGUl1y
         eOw+ueiaoWE2DphxWHQDl+tjJXUYuhl7iU2Oxk064vH4Dhe7nkh+kfhj508yEcVI/QgQ
         JQNBUYH8pWXJxFVZgvh7pCPEAkda4+qQO966olrP8Ti2dSiLi5lP6qzTfF5jCys4dHqn
         NKaXaf37HOYMlpEZog5pMvoddj6X/U+GqFjKy1qGJlQEa7E+IYclLFsuPFB1m5lngYCw
         PWN4tlCvaEOSa4yeLfZQXIudB7Q0Kar9wtCUMoUddvARoGQk8+1WEGQWYyRGzy4zbRHz
         g8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586500; x=1791191300;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAQnFlW41/utnhQvyl0xrVgFZ/ymHHxEzRYC3WPRPvk=;
        b=Tx67S08A0abknFJrJ6fxwK/Gi8T/F1LP7cr4j5SiN/HbYKt9CwKiLNCDsIiQIPywDk
         xCtDT0vlw8oon52EOScLF5FgW7iMD5Z1VphgacUS1vPHlbdTPefXrrZCR4qs/SjhwoYV
         DJy4FbopbXj7MsLd9cCnrbPyGdYlBZuqEwce83D/xcsVh19iz9GUOvwQmMqkao+ug0J3
         483fBweoB6hgfwvPZt+osx+oDXTR8XDV5e64Cvyka6ho2spzc4VbZFvavjmwBGVsS9ri
         tmhxz0MSq8evnawgwoPCd1MPm7u9jezkVXT/QdV4LVCfHObKpAsqFsE8AVjAmR+5Cy51
         zFCA==
X-Forwarded-Encrypted: i=1; AKwUvBwkJSxh4lZs8hWoJzy5TksCkNuyxFAI+PnXr7DHmjgtfaUoh8htrFjlHoalX/cSb7I9s7G25gWalEGE+TpE@vger.kernel.org
X-Gm-Message-State: AFuF++kQ0GNSyq43z1dM3KeQn97RC941497uI5dWHo75tDFEjTvZtQFh
	pxQZODNSveJa77eXYA7g2VBIAHyyBlk3+e+67GM9SuS1U6dRILoE8tg7kS//mhVZxp3T7x1Wh0X
	wQ1+WlS8recgZE97dwojPnq1T16f1tmJNbejKR6xGD88TMoYG3H+7Ehbm+U/sOi3+W6gIP0k6hM
	f9
X-Gm-Gg: AYBFou2qR8GB23dNtejqKzBvo54zy1UJ2Q0AK3qBTH9MXkIa8w9IPx32iMMsgEl/sfJ
	hjzfhoFpJEPganKEAu/ZdiNvZhQIrhSSxDTDvHaNa3gZ1Myj+1jTLewCHvs4tWu24jQl7G8g+WZ
	/Pkg+FpYqzV2/540Qb/n3J1A15z+i+LtD1SZtonYaaBrBo206HwSy8L1YjwSGtjSeMDt6+L/Bre
	avK6Oa4/AtlKrLvU9PY0/KItDkfgevbT5CLwDRVu8oA0KGHcEgPAKUQPdRz9+gBW2PVqvkgSKbi
	4F4ex8Iv0Aa+Idlf6S6dFtVxf33nVf7GC/XtMDie42mD09FAKEOe2924gK7IoxL7ZoLuVMbI1rt
	yu68aVYtv4uXtG8Z5CkfsIuLM1yqP59J6
X-Received: by 2002:a05:6a00:1494:b0:880:f76a:baa9 with SMTP id d2e1a72fcca58-880f76acb72mr5442004b3a.14.1790586499378;
        Mon, 28 Sep 2026 02:08:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1494:b0:880:f76a:baa9 with SMTP id d2e1a72fcca58-880f76acb72mr5441983b3a.14.1790586498695;
        Mon, 28 Sep 2026 02:08:18 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-883218be96bsm1273172b3a.52.2026.09.28.02.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:08:18 -0700 (PDT)
Message-ID: <b60b699e-7921-4a5c-b110-50448e660f44@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:38:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
 <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GVJU-0a3LofMs51Ro92OQpc_lYv3c4Fj
X-Proofpoint-GUID: GVJU-0a3LofMs51Ro92OQpc_lYv3c4Fj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX3aG3C2p3W54H
 vYEzkze17f7Z49i0KhdUOsdtAD9lIoLHazbowRrzuRb/v5VKK874Hsp2EqjYStnoFHAuz6hGwbI
 pbj3dqM/aRv3J/lhW8F9e4DUJ9Zw/k97+Q7kRikMXhglae15VGv9z/7sUon6dxPFEa1kIV30mOu
 GnxT4pWFNqLhZQKu2/XJMoUyvyWYxqBjNVSxXAxbpoPvHYU3SwmYHr1ELtQlr/9+8Dkgi11yToS
 gm3mWF6yv10uN+dsUlESvaAvsDyJ+QcH6v/pOixaWCOoCr3ReygvLLABcJdpbMHnihJQTHmLtmg
 J2B+k+MAE6vAD1nku4+N9zJv4bMJu0vEEf16cUluVqT/yflfm/Vrmab6ZfwEJvUUOy+OkXD0Y2P
 8T7a89i0ZrVPX35z8qVUEFZOn1xzqbJ9qmXZt7BCaLgPe4q4hG0HCFAGOjh9BDu3JY/jeB/oUhv
 gzm0FgFrHFOYgLKOAjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXwaLHfzc2bf2t
 mi70KPvLJfO8i9b1PD1XYlX3fA1h1cO1WX+A82Q7dqlicb3Bs8l4ap7G+tHXoKyIURPSuv25C6S
 gO98yERUR3ZVX2Y8JHh2jb9wMNmD19w=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba2e84 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=-r3nWBXi7OZqocfuUhQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280036

Hi Frank,

On 16-09-2026 08:30 pm, Vishnu Santhosh wrote:
>
> On 15-09-2026 07:36 pm, Frank Li wrote:
>> On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
>>> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
>>> interrupt, which overrides the trigger type specified in the device
>>> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
>>> to the apps processor; registering it as level-high causes the
>>> interrupt to not fire, resulting in missed DMA completions.
>>>
>>> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
>>> trigger type already configured by platform_get_irq() when it parsed
>>> the device tree interrupts property. This makes the driver
>>> platform-agnostic.
>> where show this? can you point me doc or code?
>>
>> Frank
>
> Hi Frank,
>
> The BAM driver obtains the IRQ through platform_get_irq():
>
> bdev->irq = platform_get_irq(pdev, 0);
>
> in 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270
>
> It then registers the same IRQ with:
>
> ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>                          IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>
> in 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335
>
> The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
> states that when no trigger flag is specified, the interrupt uses the 
> trigger type already
> configured by the machine or firmware.
>
> https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25 
>
>
> Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated 
> with the IRQ during
> DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.
>
> The Shikra DTS which is still under review describes the BAM interrupt 
> as edge-triggered:
>
> interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>
> This driver change is needed so that the DT-specified trigger type 
> remains effective once
> the Shikra DTS change is accepted.
>
>
> Thanks,
> Vishnu
>
Gentle ping on this patch. Please let me know if any other information to be shared
from my side.


Thanks,
Vishnu

>
>>
>>> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> ---
>>>   drivers/dma/qcom/bam_dma.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>>> index 
>>> 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 
>>> 100644
>>> --- a/drivers/dma/qcom/bam_dma.c
>>> +++ b/drivers/dma/qcom/bam_dma.c
>>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct 
>>> platform_device *pdev)
>>>           bam_channel_init(bdev, &bdev->channels[i], i);
>>>
>>>       ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>>> -            IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>>> +            IRQF_TRIGGER_NONE, "bam_dma", bdev);
>>>       if (ret)
>>>           goto err_bam_channel_exit;
>>>
>>>
>>> ---
>>> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
>>> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>>>
>>> Best regards,
>>> -- 
>>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>

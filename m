Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCC2853E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934809; cv=none; b=WXJRdSvQ4rZtyC6jDbE7fEj2wCz4qaZUXLGpLhMBwN3fxsHLqKSH0iDvHxZwCY3whnoo8kCXeOs4GMYnWEr5slTLzp5rOgX9klibot0KPekFgQ07fex/CBqwxNGOHsyDq3Ob3XNRx3Cyl3UBbraReocagb2OLi1Ff6TtNVEuWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934809; c=relaxed/simple;
	bh=KADqxpkKqeJJ7NhxocaAYgr+D1WmIsbRH2gRDlfAQTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFFlybsbx44WSV1Myzb3Mz7orKULPXNOHsOLK7ySQgpQg146pMLpez3X2fVcQpemYzBJPTJbu7TWiQlZ7QZbR6dswe/BDKoijOK17Tuh56JxssnuBHPRUgSiGpRcujwrOXLi3Ui6WGJPPXlpY1SkwF13JuRdDpLTe9C8zHMQKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gija2mVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vku7I1Jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gija2mVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vku7I1Jp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgZaV045635
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=; b=gija2mVMnTYsQWH7
	fgO7ywY02ke4wnAusmZkyaMsW8M2duGikQN56XcSuf2dGiKLgUfTMlOXXxiaYHbX
	isNM5E/eDE8SThIdoaoCQaG2TX94DqYwEWzEx0wsDb6WqrLFu69d0JkvifkqVCje
	+o0VXjERjDF3QOwJPvrfecacE6Z9Q0RUYJsD19kTQqViZbPrRU7hq54cNisfSECD
	vlTD01k1Ua+4DGIT2h6zPW3yogcKE2z3Zduba0W805eQN9d2AT0FSouWVXeKGyKR
	DJZhIBsn/ZFxpNmJa/S5aUs6Vs9qZ/mHiMevANwTuJVjhLomDBTYUnN2VGo42WTX
	JDAwOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewjfav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:20:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db3734d06dso74989925ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788934806; x=1789539606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=;
        b=Vku7I1Jpqldm9tQ4UgFeGeOG7Qm87Jm5e2mNdAMJL4F9BTpl1JMh4Mt4RMBc6FX6jZ
         dzuuEr9eB/i3230q9RtCOOjuigAeZiIjSxRFpZppbCRhwk6bB6rWxb7Dr0ETz2ZQLsbo
         su0YSNn5v6511Ge/S5T373o24ZjB8lEDjQ36iTY+QneHiTi/10v7qgxiSJQXmIGur4rf
         DHihX1KW60UDC5fc0IpU2RIh0a8OOl0LtygPDWhfeOg6fuzY0BGMN+pUIhs3uZbE2T0v
         jNgtmkviJZ63nyB6sX5UDyMkprDsfV7YADrHGofdBTcBXIkXY6/wLzSmDRacjg22MH2C
         9XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934806; x=1789539606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjqcZntMXzX9L6jwYgDveF30oGBgFXltEaA43W5//qU=;
        b=jq9XH1DDgF1LcwfBypOP//oYjjmu9zoQ8yHJRiYxKe/om09VOD55ulWNu3N0tcx3xJ
         j4gUlthAISIvsLRapU8Lt7x3fLIwU9k661vZmvyIyI+G3hAKiUonQ7xKRcJEVRd9wfxl
         IYPH554GB30zvQj2hxrvWCUCG7RRci8Xb/aK84X9pHFURPoZnJiiZPKAw2rydEuSV5L+
         KkakvCIQidjwx5P188EJWn+FUuy6Qjv+bIyHj+iS2tNwAOYA+zce02TmM/+PWdzHL02b
         r312mpuAWTAcE+Qs+Nzkko6pFUOjJPQ4f6oj1rT4Rs0Kn4gCz4ABBiOijD2ZK5NJM1Sb
         eemA==
X-Forwarded-Encrypted: i=1; AKwUvBwVODazcQaruOhVoGQE/GWgeb5Az+NhH7ZapyoN0v5rTa7S3wdtsXn96QiYb7oFZPlM6G6KCytyHZkaheCw@vger.kernel.org
X-Gm-Message-State: AFuF++nUA/tRXWKdjs69ZFl8on28N8JlYk92gLUR/9+4zaQi8UbGQ/fV
	rYBvKq1p3ZoBUZ85dU53R42a5KUluoufR3kzRCBHGrw4Becvrg4XJbUc5MQEUKsdNGhmQXGXtxX
	jA4awbC4u4O3B0Nl90uAGT6ZnF5Gk6tqJmpgjQVv6vXi4Xf5UdbCOPyqr7DCjq2JGbpHK
X-Gm-Gg: AYBFou3+qxBY4A2BfeNgSMFcZMrXGaznS9hbmfu72/oHaBR5X2kQTbEg56SL/ncF9m5
	HLISYR42z2R2S60D8KJzNcz5HMnOsC2oAgqbB08aPmBnPillhcuPDZgnNw9Bsk7Gv6MGikgipwu
	gVAvqbxOQcvZjk8ib1MfT6RQFLZG9m4UQQnvMrh0tEYcKBymIpTKm8YSvLfNXB6FsJJuDreUngJ
	Xno9b5WWL1kRM1TIEJI9CPwV5tYRMzg8jpQ0Hu2opV0lBMplXQm06ZDSdtB7eM5zixNcjn8qizP
	Smj4qHfUks2y2KWg/6/RpEmTuJ2gdmMPvbkHQcOzITK6sGHr2vUfJ0b9mteoSUQjRyKJBvtEtxi
	3jXN8ViRi9Ewl059zbyroqRGU3WzF4nFx0JVOOPdoDYvXVnPBYGxGFsjcOSqIpoI5QnmjBrwTi9
	1FFCGxxxE8GA4U/4J7
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr51701749637.6.1788934805723;
        Tue, 08 Sep 2026 23:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr51701659637.6.1788934805166;
        Tue, 08 Sep 2026 23:20:05 -0700 (PDT)
Received: from [10.79.116.118] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm46793290eec.1.2026.09.08.23.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:20:04 -0700 (PDT)
Message-ID: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:50:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa0fa96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wY5xiLK02p6FFHcKSBAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tu2hybcIT93hGp7aHv1IXfYL-W76MSO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2OSBTYWx0ZWRfX6FRaUuX9VsT5
 M+9ao64yMZ+RxABFHKPR2BAaC+jK8oI1y7ESe+dpVu1XH5mnVblEzjt5Vf5eL/3EqqJ3C1DXqlo
 Pma0Er1tElh6B7koG5QhctHVKP1hNDs+PvGcsxJZKQ4yLhCjb0eW6S44CDvmiryi8zOALGrhk6t
 ORqtbtHgfdkExXuEiz8PIL7hlMmUdctbaSTGgLBo4qcRzSUihoGfjOqRdz7FvqmKVryaGwZYJ/N
 43qTcNdWMmjVvKg8mBdNO7OIufk3NnxESIrmPn1ui1IVdpNq2+e2W7cC2OPJ+frD68UzSke65F4
 Kz4Z+JLS5I39T+B4vy6qhKih4G5jrTKH3OmkcmoX0zNXCrNgaCaufT82eN8ZWI6i8eKqz3nwcAg
 vza9ZToAw/KoDcMUhhM7Q9YCSanee6RvembuP4GTxURsIgK0j8NVqenNq8r4qZfsMm1n5sED7K1
 kZEGQYWygskW9x8vvWQ==
X-Proofpoint-ORIG-GUID: tu2hybcIT93hGp7aHv1IXfYL-W76MSO1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2OSBTYWx0ZWRfX4oVQf9gxhS3S
 3/Bdgs3bhnM0Y7C6GkElseAcIwo6BdZBBu6KfXNeYYU3YruRcxppwSAQ+2KyyrWCwOBeNjBkuDb
 S3j7Z5iOh3QUfAENGO/FqGUki/BuCvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090069


On 9/8/2026 9:20 PM, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit but the interrupt handler
> currently reads only 32 bits with readl(). Use readq() to read
> the complete register value and pass it to the mailbox client.


Can you please add more details to the commit message? It doesn't describe
how switching to 64 bit would help mailbox or it's clients at the moment.

-Sibi

>
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
>   drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 7ffc40acea9b..f56a05149281 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>   	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>   
>   	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>   		struct mbox_chan *chan = &cpucp->chans[i];
>   		unsigned long flags;
>   

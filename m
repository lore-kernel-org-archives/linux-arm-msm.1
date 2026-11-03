Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687142;
	b=H1DNS9zxv3zoS504lHuc15VgGbjzkKxYT6m39k+GETBRx8uX/hGfMMIX55frVVxZn2aX
	 XiSeUQ9y/ssHPmsAtdOurjwC7yBp5NNgrqmVTALFj+weDybdeIhamhrU9o9KtFHs6COb3
	 bah7BjY+54YjcPvmnGAEAtSEMliFAj/9D7JVnBSlQgky+Pw/Cr8/Mt/D5rMoO0C1eKiQp
	 mFCR7rx38epYN9/HHZssVskIwaZ23mXOqeVZIe8SQbPe8B4XYHm25fgZYmmmdCux2WsFU
	 nnbTOlYSL8IR/rf4qjq/InR1odDwGlDJ8sFu34AkYOmR662rbsASXp5K9qYI91mUSJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zuXF6ZSzTfT7+2Gs7wEgJItjp3Ye61fxPfiAF1h6RHc=;
	b=lxDG2B4oqEnjvyQFpIa5lWzJPuMrKi56EPgaMlYBz9KalEqvXsTydskCeuRsNBgZw9CQ
	 vUqRqdOuTS5/alrPLKH9xuI5p7E11phEYOV+44XgxM0wpheWwPRmsA797KviOjFvvIAId
	 ClT1VQMQ3yrEP2+2PMpp1gHM9ALDPtiCWh38Ul4md6gYk8MVLMRbM2k1LEpbfOybElDnO
	 RKX8pBjL8DP0jAe8TMdc6fPeTJKmUlZKfT3UGAJpwmMTo6U0WAfT0hyzOOvtTYImQHrT7
	 iLVq1l5uMFMbVTCDdU0PMoGshWI6SC0lyjbhEfHM9bZ8j29Y35YR04CvtpyWgjIfPxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKTIlecT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WORAAsag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89046606D806
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 06:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89046606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKTIlecT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WORAAsag
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32BqGD2106631
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 06:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuXF6ZSzTfT7+2Gs7wEgJItjp3Ye61fxPfiAF1h6RHc=; b=NKTIlecTkJkLQpyk
	l1CuiHINKA6OWTGX514QCSm3j//VdQG6yjs1xM+tfYH0ge25EUSaxS9NrDMWXWit
	68+W2GXucwhjmXqFm0mJNnBCdKHpqcMaBPO3lkns6EcBkqKV1pXZ0GiUu40lrfw1
	F+WduvqnYBt/SASF3tibJeVM6+PhR6Q4LTNm3Q+qoVMSZXI6BYq6xCNe5VKKpZhA
	U3avqe2sONtupM3eHOSRIGEFPMu3pJtMVhN4fQPM3G++JCU1HNONCq7aloO1unvX
	XCLkXgDrRx099SnCG29tLDVDC/6bQmicNs8zc5R4jrs9eEQ//jYwh7xVvrg12Ivu
	72E2EA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m98ss3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:25:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso37306975ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793687139; x=1794291939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuXF6ZSzTfT7+2Gs7wEgJItjp3Ye61fxPfiAF1h6RHc=;
        b=WORAAsagLLAZE33dKvZqoXvNybMdRp9WwZKdp64c2t8FgmHKtShJMXY4OGNxD6XaXi
         W7wm2kl7wwPu/FjVLdzNJHeqmapGp6jur8/FQ0hFubnkHkx0vmFeDH/CwwfWaAs8qvdF
         mkow1e5wqzolDZxFYt/QTCkvX4xOaano8PFP0hb14DDmYB5M7TbtN3LFCUkemA+YZI85
         +2HNblVLNglvL4aYO48Yz2iliubksQz7DaRvX8ZlJA+7oxsvPdwrbJCGXg7rRuCnC2Bi
         pDT2oFigRnxqDeZwoSzBV4ZAi1GFqlmJqk6GE3plvHT0czDOYNK4ZAqjsbfdZl0ZR6Zu
         AYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687139; x=1794291939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuXF6ZSzTfT7+2Gs7wEgJItjp3Ye61fxPfiAF1h6RHc=;
        b=uwoWsYiz/FSr1rkkvZMx9GqEyzpui6GlhmxC2+UUkap6+eP35Ya7Hs56DcRudvm6A1
         wuxKGpwJWpSuqcufpMs6r0pvslww6d6kILuYFq5Il9KdCt/XgLJLJo9ISJ4j63hddfTH
         fMgkzZsuz0zJUOQb1MiCKZOy46b/e4m5n5dPiXQG+dfwtlz7GcGeB+ilNBYh66Dno5Ru
         lp2Z9piVWelgDJY2BpI7tJsbbL+wFOGwAYXg3Tu7UM2CzBRadehGNJ+RpM2GgLtnpPWX
         x51FxH8QjzzbsvRggYRARZHkVShxFyZKWBjgR2cZE62A5swV2hJngFajkAspcON023PX
         OZIA==
X-Forwarded-Encrypted: i=1; AKwUvBx1RrMfRODb90woKQNXcn0PkAqL1jHKuAyV4ByDNKBxp0VmRVyoO4LlIzTKvwTuxrsqPOsShqeY03fm/xVl@vger.kernel.org
X-Gm-Message-State: APuU4Z8oOhax2Ins1YkyYl1L2kUp0ekqtFlm3o/Lf38HB9zzlCDuPEgp
	P2DNa+B5958chALWaAY1TtIEnM9SLONFOFdjUsVG4JsflyzswVUIyoPUNpQvy8Pxqieuqh7tnvC
	6n2loqQal9jhlOxWFVPH3XeNc4PVYdW494btga+m1/49qsuTj9PzLwVZRiMzEN+7PzKYt
X-Gm-Gg: AYBFou3qHAVIpwbUSEv5kRZWM1nnNJBRUfjoh2nHHzgF69W039w4MClpafyP5NBoTiE
	eJ756XoAjHFzlCgCzJ9Do2NtjDfWvv9itokTzfoLYKjsZngXAfyBaSnIpAdedmkC1VoPE3GD9F/
	oUKuw1S/2o7zIDHWVaR99R8g+VgL/ujCQzmy+55EbqCLqAs82G03xhlw4ZK+1zOktIdkpMdQY3I
	msspM0btx2kwxytkrYHNUCNjKViKsSeOzldF2jd6d57+GLzBMI/BHu7UNit3qj1iHkE0a4g5T2b
	+TulFOEUoTHbxVfjpznQmbFutrlUV4cxTpDjWv4x4F4+BHpN/OMVkAd1NapPqYEGXrmQGYof0sz
	kwUY49fGbxwFD5cIhJUETKJQBT6+NtJDZD3zQJRDEmmTntOsMsJwMpSCtAHhOElHl82lt9q7uiH
	QViOkH
X-Received: by 2002:a17:902:f545:b0:2e9:9f14:c44 with SMTP id d9443c01a7336-2eb364ddee2mr111958335ad.49.1793687138981;
        Mon, 02 Nov 2026 22:25:38 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:2e9:9f14:c44 with SMTP id d9443c01a7336-2eb364ddee2mr111958015ad.49.1793687138325;
        Mon, 02 Nov 2026 22:25:38 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c858sm36924505ad.35.2026.11.02.22.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 22:25:37 -0800 (PST)
Message-ID: <e1ac9331-7a3c-4836-bd78-b67b60f918fb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:55:29 +0530
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
Subject: Re: [PATCH net-next v3 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, loic.poulain@oss.qualcomm.com,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net, edumazet@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com
References: <20261021-qcom-bam-dmux-vmid-ext-v3-2-cedd1f681102@oss.qualcomm.com>
 <179292379960.3134.17105636011699871887@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <179292379960.3134.17105636011699871887@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cymy04S_ooUATIbcFg_Kt0i8RK3m-Odz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNSBTYWx0ZWRfXynd9Vq3AL7TN
 EKSj+UjcawZmBdD15HZKPJu6yFg0jtM89PVS77kloBeY74dKaWo866Ggh9t1fnSfS2AwXIfPsEh
 c2Y7/MQv1jtApUUtU1cKPxqdy3ePfzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNSBTYWx0ZWRfXwezlFliSL1ZB
 XUMiAD5iNo0psX6X47ni/HBqleF+rjDaqELKAT4MQH74fyAmTwiEUuuTbtdNQBW5yLHO3Qtpq5x
 YLIygFSanvDk+GD/2rprhC94GJ/b2Q2sr+AwRtEMJw0+HLt+0d9tYfE6JSz6a/7jBnuztFKZt/z
 PjXoPYFKIEMT/Q5kcvTa4MuYWiqJEq1yWalPJ37DBmC3HaOvaVzVlZSfO0FAoNlMga70hkkhLc5
 YpZsUmjejVjTO13d7/6+OtQdmk4eN3aNUa0k4EOT5eWBIUtH0Bx95kKd/OCnaWcEcqQqf6GtEd/
 uhPqw5bGDJE23DrZ+dBFCllr/gJqF8zIiKPecPmlLSFjXsjWvac6dGQhpnTEa+YEOWfGvORXXrG
 yYA9G/TBkw1+kojN0mitvrl3uQbEcjqe1D0Qs8fi0do2bDrE4Suwgnblb+bClqRoCxKY64ZFixc
 bY90P3YygCPo5ozDPLQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae97e64 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=70-S8w_-Z3ilBdKCbEIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Cymy04S_ooUATIbcFg_Kt0i8RK3m-Odz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030025


On 25-10-2026 03:53 pm, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 (1) · Medium: 4 (1) · Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The commit message says BAM descriptor FIFOs "must therefore
>    be constrained" to the shared region, and that they are covered "when…
> - [Medium] bam_dmux_assign_dma_pool() always passes `u64 src =
>    BIT_ULL(QCOM_SCM_VMID_HLOS)` (line 777) to qcom_scm_assign_mem(), so…
> - [Medium] In bam_dmux_remove(), `remote_suspended` decides whether the
>    pool goes back to HLOS-only, and it can be wrong in two ways.
> - [Medium] Once the restricted pool is assigned RW to the modem VMID,
>    every RX buffer mapping copies uninitialized HLOS memory into memory…
> - [Low] The patch changes the probe error path in bam_dmux_probe() for an
>    irq_get_irqchip_state() failure.
> - [Low] The binding and the driver disagree on which qcom,vmid values are
>    valid.
> - [Low] The driver and binding accept qcom,vmid values up to 63, and
>    bam_dmux_reclaim_dma_pool() passes `src = BIT_ULL(HLOS) |…
>
> Pre-existing issues:
> - [High] bam_dmux_remove() calls
>    cancel_work_sync(&dmux->register_netdev_work) at line 964, before RX…
> - [Medium] This problem wasn't introduced by this patch, but net_devices
>    that registered successfully are unregistered and never freed.
>
> --
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> When qcom,vmid is present in DT, this patch requires a restricted DMA pool
> and uses SCM to assign the whole pool to both HLOS and the remote VMID. The
> pool is reclaimed for HLOS on remove or on probe error cleanup, unless the
> remote side did not drop its power vote. It also changes the
> irq_get_irqchip_state() failure path in probe to call bam_dmux_remove().
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371..fa3621224a56e 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>> +{
>> +	struct device *dev = dmux->dev;
>> +	struct device_node *rmem_np;
>> +	struct reserved_mem *rmem;
>> +	struct qcom_scm_vmperm dst[2];
>> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
> [Severity: Medium]
>
> Is it safe to assume on every probe that HLOS is the only current owner?
> qcom_scm_assign_mem() documents @srcvm as the "vmid for current set of
> owners".
>
> Two paths can leave the pool owned by {HLOS, vmid} after the driver
> instance is gone. The first is bam_dmux_remove(), which skips the reclaim
> on a remote timeout:
>
> 	else if (dmux->dma_pool_perms)
> 		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>
> The second is bam_dmux_reclaim_dma_pool(), which only logs when the SCM
> call fails.
>
> In both cases the only record of the assignment is dmux->dma_pool_perms.
> That field lives in devm_kzalloc() memory, which is freed right after
> remove or after the failed probe.
>
> On the next probe (module reload, or unbind/bind of the remoteproc
> parent), the zeroed dmux would ask TZ to move the pool from {HLOS} while
> {HLOS, vmid} actually owns it. Would the assign then fail with "SCM assign
> restricted DMA pool failed" until reboot?

Yes. This is fail-safe, since the pool is static reserved memory that is
never returned to the page allocator. This matches the existing
qcom_scm_assign_mem() users, which also only log reclaim failures.

>
> The new probe error path calls bam_dmux_remove() right after the PC IRQ
> may have powered up RX, so it seems likely to hit the timeout case.

This path is not reachable with the SMSM irqchip, as
smsm_get_irqchip_state() only fails for states other than
IRQCHIP_STATE_LINE_LEVEL.

>
>> +	u32 vmid;
>> +	int ret;
>> +
>> +	if (!of_property_present(dev->of_node, "qcom,vmid"))
>> +		return 0;
>> +
>> +	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>> +	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>> +		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
> [Severity: Low]
>
> Should the binding and this check agree on the valid range? The
> qcom,bam-dmux.yaml binding in this series allows:
>
>      items:
>        minimum: 1
>        maximum: 63
>
> This check rejects 3 (QCOM_SCM_VMID_HLOS) but accepts 0. So a DT with
> qcom,vmid = <3> passes dtbs_check and then fails probe with -EINVAL. In
> the other direction, vmid 0 is rejected by the schema but is passed to
> SCM here.
>
> [Severity: Low]
>
> On 32-bit kernels, can a vmid between 32 and 63 be reclaimed correctly?
> bam_dmux_reclaim_dma_pool() passes src = BIT_ULL(HLOS) | BIT_ULL(vmid).
> However, qcom_scm_assign_mem() builds the source list with the unsigned
> long BIT():
>
> 	for (b = 0; b < BITS_PER_TYPE(u64); b++) {
> 		if (srcvm_bits & BIT(b))
> 			src[i++] = cpu_to_le32(b);
> 	}
>
> On 32-bit this shift is undefined for b >= 32, so the remote VMID entry
> would not be written. src_sz is still computed with hweight64(), so the
> SCM call would see an uninitialized trailing source slot. The helper's
> int next_vm |= BIT(newvm->vmid) has a similar limit.
>
> The root cause is in the existing SCM helper. However, this patch adds a
> caller and accepts a range the helper cannot encode on 32-bit, and
> QCOM_BAM_DMUX is used on 32-bit SoCs such as MSM8974. Should the range be
> tightened here, or should the helper switch to BIT_ULL()?
>
> [ ... ]
>
>> +	rmem = of_reserved_mem_lookup(rmem_np);
>> +	of_node_put(rmem_np);
>> +	if (!rmem)
>> +		return dev_err_probe(dev, -EINVAL,
>> +					     "Failed to look up restricted DMA pool\n");
>> +
>> +	if (!is_swiotlb_for_alloc(dev))
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Restricted DMA pool not attached\n");
> [Severity: Medium]
>
> The commit message says:
>
>      BAM-DMUX DMA mappings and BAM descriptor FIFOs must therefore be
>      constrained to a designated memory region ...
>
>      When the BAM DMA controller references the same pool, its descriptor
>      FIFOs are covered by the assignment as well.
>
> This check only looks at the bam-dmux device. The descriptor FIFOs are
> allocated on the BAM controller's own device in bam_alloc_chan():
>
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
>
> Their address is then programmed into BAM_P_DESC_FIFO_ADDR in
> bam_chan_init_hw().
>
> Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml has no
> memory-region property and sets additionalProperties: false. This series
> only updates the bam-dmux binding.
>
> With a schema-valid DT, wouldn't the FIFOs stay in ordinary memory that
> the modem VMID cannot reach? That would leave the XPU violation possible
> for FIFO accesses.
>
> Should the bam-dma binding gain a memory-region property? Should the
> driver also verify, or at least warn, that the DMA controller behind the
> rx/tx channels uses the same pool?

This is covered by a separate binding change for the BAM DMA controller:
https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/
With memory-region on the BAM DMA node, dma_alloc_wc() allocates the
descriptor FIFOs from the pool, without BAM DMA driver changes.

Using the same pool for both nodes is a DT requirement. The DMA channels
are only requested at modem power-up, so a check in BAM-DMUX could not
fail probe and would only warn after the fact.

>
>> +
>> +	if (!qcom_scm_is_available())
>> +		return -EPROBE_DEFER;
>> +
>> +	dst[0].vmid = QCOM_SCM_VMID_HLOS;
>> +	dst[0].perm = QCOM_SCM_PERM_RW;
>> +	dst[1].vmid = vmid;
>> +	dst[1].perm = QCOM_SCM_PERM_RW;
>> +
>> +	ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
>> +				  ARRAY_SIZE(dst));
> [Severity: Medium]
>
> Once the whole pool is RW for the modem VMID, does every RX mapping copy
> uninitialized kernel memory into it?
>
> bam_dmux_skb_dma_queue_rx() allocates the RX skb with
> __netdev_alloc_skb() and calls skb_put(skb, BAM_DMUX_BUFFER_SIZE) without
> zeroing. It then maps the buffer DMA_FROM_DEVICE.
>
> With a restricted-dma-pool, swiotlb_tbl_map_single() copies the original
> buffer into the pool slot before the transfer, whatever the direction:
>
> 	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE, pool);
>
> That would put up to 2 KiB of stale kernel data per buffer into memory
> shared with the modem. This happens for all 32 RX buffers at power-on and
> again on each refill in bam_dmux_rx_callback().
>
> Should the RX buffers be zeroed before mapping when qcom,vmid is set?

This is generic swiotlb behaviour for all restricted-dma-pool users: the
original buffer is bounced for every direction, so that bytes the device
does not write are preserved. Without a restricted pool, as on the
existing BAM-DMUX platforms, the BAM accesses the skb directly, including
its stale contents, so the pool does not widen the exposure.

>
> [ ... ]
>
>> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   
>>   	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>   				    &dmux->pc_state);
>> -	if (ret)
>> -		goto err_disable_pm;
>> +	if (ret) {
>> +		/* The PC IRQ may already have powered up the RX path */
>> +		bam_dmux_remove(pdev);
>> +		return ret;
>> +	}
> [Severity: Low]
>
> This changes the irq_get_irqchip_state() failure path from only disabling
> runtime PM to a full bam_dmux_remove(). That seems to fix an existing bug.
> The threaded PC IRQ is already registered at this point and may have run
> bam_dmux_power_on(), which requests the RX channel and maps and submits
> the RX skbs. The old err_disable_pm path leaked all of that while devm
> freed dmux.
>
> Could this be split into a separate patch with a Fixes: tag so it reaches
> stable, and mentioned in the commit message?
>
> The change also alters probe behaviour. The failure path can now block in
> wait_event_timeout() for up to BAM_DMUX_REMOTE_TIMEOUT, it sends a
> power-down vote through bam_dmux_runtime_suspend(), and it calls
> disable_irq() on devm-managed IRQs.
>
> [ ... ]
>
>> @@ -853,6 +957,7 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	struct bam_dmux *dmux = platform_get_drvdata(pdev);
>>   	struct device *dev = dmux->dev;
>>   	LIST_HEAD(list);
>> +	bool remote_suspended;
>>   	int i;
>>   
>>   	/* Unregister network interfaces */
> [Severity: High]
>
> This isn't a bug introduced by this patch, but the new probe error path
> relies on bam_dmux_remove() to tear down an RX path that may already be
> active. remove cancels register_netdev_work before RX is stopped:
>
> 	cancel_work_sync(&dmux->register_netdev_work);
> 	...
> 	remote_suspended = wait_event_timeout(dmux->pc_wait, !dmux->rx,
> 	...
> 	disable_irq(dmux->pc_irq);
> 	bam_dmux_power_off(dmux);
>
> During the wait, an RX completion can carry a BAM_DMUX_CMD_OPEN command
> for a channel that has no netdev. That goes through
> bam_dmux_rx_callback()->bam_dmux_cmd_open(), which calls
> schedule_work(&dmux->register_netdev_work) again. Nothing cancels the work
> after that.
>
> Can the work then run after devres frees dmux, or register netdevs that
> point at the freed dmux and are never unregistered?
>
> During probe, netdevs[] is all NULL, so after a power-up ack every open
> command from the modem would schedule the work.

This is a pre-existing issue in bam_dmux_remove(), present since the
driver was added. This is out of scope for this series.

>
> [Severity: Medium]
>
> This isn't a bug introduced by this patch, but are the registered
> net_devices ever freed?
>
> bam_dmux_register_netdev_work() calls free_netdev() only when
> register_netdev() fails. bam_dmux_netdev_setup() does not set
> needs_free_netdev, and this path only calls unregister_netdevice_queue()
> and unregister_netdevice_many(). netdev_run_todo() only frees the device
> when needs_free_netdev is set.
>
> So each registered netdev seems to leak on remove. With this patch it can
> also leak in the new probe error cleanup, if interfaces were already
> created.

This is a pre-existing issue in bam_dmux_remove(), present since the
driver was added. This is out of scope for this series.

>
>> @@ -872,13 +977,21 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	pm_runtime_set_suspended(dev);
>>   
>>   	/* Try to wait for remote side to drop power vote */
>> -	if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT))
>> +	remote_suspended = wait_event_timeout(dmux->pc_wait, !dmux->rx,
>> +					      BAM_DMUX_REMOTE_TIMEOUT);
>> +	if (!remote_suspended)
>>   		dev_err(dev, "Timed out waiting for remote side to suspend\n");
>>   
>>   	/* Make sure everything is cleaned up before we return */
>>   	disable_irq(dmux->pc_irq);
>>   	bam_dmux_power_off(dmux);
>>   	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +	/* The remote side may still access the pool if it did not suspend */
>> +	if (remote_suspended)
>> +		bam_dmux_reclaim_dma_pool(dmux);
> [Severity: Medium]
>
> Can remote_suspended be stale or wrong by the time it gates the reclaim?
>
> It is sampled while the PC IRQ is still enabled, and disable_irq() only
> runs afterwards. In between, the modem can raise its power vote again,
> and bam_dmux_pc_irq() would run:
>
> 	if (new_state) {
> 		if (bam_dmux_power_on(dmux))
> 			bam_dmux_pc_ack(dmux);
>
> That requests RX, maps the RX skbs into the pool and acks the modem.
> disable_irq() only waits for the handler to finish. The earlier true value
> then reclaims the pool while the modem believes the link is up.
>
> Also, dmux->rx == NULL does not necessarily mean the remote powered down.
> If bam_dmux_power_on() fails in the PC IRQ handler or in probe,
> bam_dmux_power_off() clears rx while pc_state is set to true. The wait
> then returns immediately and the pool is reclaimed while the remote vote
> is still asserted.
>
> The commit message says:
>
>      Skip the reclaim and leave the pool assigned if the remote side did not
>      acknowledge the power-down, since it may still access the pool.
>
> Would it be more robust to make this decision after disable_irq(), based
> on the remote PC state (for example !dmux->pc_state)?

Agreed. In the next revision, the reclaim can be decided after disable_irq()
based on dmux->pc_state, so a failed power-on with the remote vote still
asserted also leaves the pool assigned.

Vishnu

pw-bot: cr


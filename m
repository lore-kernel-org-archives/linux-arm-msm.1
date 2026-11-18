Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980915;
	b=kKfUodIy+pb7RrXlGceFMprSCY/1t5LFnc1U5BCLiuFlf4X+oNuxTQmiY0yuAM79O+9D
	 P91pTYN5tGO0Unt7FsDAEYmieKWbEsl+YTWAMxut6ErdoMs37PN71kFQoA+JTDAtAgQaz
	 NeCJCvCkL5FYgFgEGUvCSbvU4JiTf6n6DA9MM8MfEcIogQENobsRXEhhL/u3pL4oq14IS
	 46i84JA/oeaTXS1cqM5McJaX+r+JzHDkxIx9tNEkyqmIimbqa8DOEzRMF8Hdzw/KlM7pB
	 hk7H60ldI5afbw4DRUu4+t7P7QdhXxhwknMffeJnEMY9r0YRsYindwo/kVZ4sMlblsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9FcR6f6lZr/1s4o7lTSV9eGaaKbHWarYrN/iQAvAeI8=;
	b=XfxBjplSRqyEfjM0AFSWuNP6SdKed+9yHbS5PLafz3BBrFh5pU8UAbiNrdcMPMw3Or5G
	 4a3D5rWdnnKh44Jz44XsHi48Zp9OA4PQjx4lsABqCarq368W8rRJ67a81XO2kzULggt5V
	 pz43D6HQoRpXv2bZPDclxPOXuMvS1rme+sALYQIRdMKu4pY/ZZHXoi1+cMdHugeeOXbHw
	 YkFRnd+vC7xa7ZtzrFvRj8x0OrbHAbLW5h9ubS75279POU3UKWriX9CU2Jme7Da+ElOlC
	 483h0nZuNCW2+SccpNWEGskfd4nFxFBgUZxGrBQqLoG7zptacbXPHtZxwHo83pETNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHWt2ZDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMBGcDhZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72D606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED72D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHWt2ZDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMBGcDhZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwtT3121715
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FcR6f6lZr/1s4o7lTSV9eGaaKbHWarYrN/iQAvAeI8=; b=nHWt2ZDpbZDXkOrz
	UaMNUO9qGabbZNVb1k9K2lNu5nOaP+LXSvK9enqlisnS5oOicDiBFp2tL6rb43e0
	YCfy2rW8bHkvs52S+c00cXusU3yBYC+8wJXhvPaWH4oOf5SARAQHAAwbtbk7niBc
	avDF47XiU+/NJNNmgyzNuFvmR4mKkb1hV9rgX4Y+NHvj9T6gLe1n5AG2frrYDhM/
	wtEMLuqDQnNL1/zLXI/1xE1dgl3uLefhlBY7a+q/2RC2lmgtoaXILbRJed587GRt
	+OYGZtUyP4pfUnCn7qKazsOeSPDMLqTir7Wek6I/YmOMtBTe16x3R7aFn0iNwLyt
	db7yhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hcp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:48:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eddadcce7cso3719655ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794980911; x=1795585711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FcR6f6lZr/1s4o7lTSV9eGaaKbHWarYrN/iQAvAeI8=;
        b=TMBGcDhZ3IZoga/aCV3DBCaoyLmZjhPmoP+BUuxbpYq9tQ72BDkahFcWTiLizHFk4z
         hlnv7PmWMeoR5n5ZNmnyibPlVuYitPGC4jWIR3D1iGoMV9lbcT5brQXIQfQiqvft7l1k
         sBBCl6+zlLiw8DlzL5/bDOkhCnX46uOIIE1LbSlLYnrfH8mijg/nx10ySWzsgD/kO5X4
         ba360PmCttaC2EVdJMWrOnBYh3D0ZGfI5RIqwBCxZZmp1HdVH2GV2RXwE0KzSQQ5XDEw
         8qI9G5yV3sa6PHBZgtyH7p51t0RtcYBl+Vu4xji17+qEj6EsS7u1zzeDU3Xd2+JQGSjI
         zBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980911; x=1795585711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FcR6f6lZr/1s4o7lTSV9eGaaKbHWarYrN/iQAvAeI8=;
        b=th0cDk3ONcLUySBOkfRmQN/4fCSErL2J2d+CLkMx0FaGrXE7+YM9WJPoN5QMlwaPrP
         BRVIb2yKQtlarzApTE48qWjrGQqM2tHQIO77+zQ+q5SUfMDdQpWJLP/pMHjxFh2eOQD9
         vZibLRiImFZBUzybouHRUxK528My9ByoQDbXph0nqQpkoiPdMTc+jHMIBZd7LHGOd8XB
         ATwLDG7s//Ba9agQ/ikhNjNPC9fJBLhP7WGzoqDj6h3Jt2ItaVxCutAemMVNCK3702OO
         hvfgDkltpz9KmbyIjJnfdGzlJv4pOCgGI8Lr/KAB3hp3SrDckEOCzG/IlbQojs5Wsp3D
         zp4Q==
X-Forwarded-Encrypted: i=1; AL+hErGzg36a4N1mXCeXy0tXZqjIJ/aFGuc8l5GewBi2MfAytMsxegfKhN2p54/G4TB6Y9Uacw1M8F5RoKz5hNgG@vger.kernel.org
X-Gm-Message-State: APuU4Z+slE9iVus62TFpZr2I7iyuTGw9XCcO1fYG5ZBz0GOZWmlsqP3Q
	m7oE2bA7PZiFfytkarcVM8T0wf34CvrdBhT72KrweFsyxnWc7flON2K8xFzjuAuBIHfIBNrvpy2
	n+t2JlTTstlChoYdvjoj9B7QV+Q2vGsQW98Fy5kqIMETYzNqnHcus55naBKVWdLtSonqR
X-Gm-Gg: AZFdTZc/KX92ZAmtr8FMQ87VzrDa43iXuI8/kCIu/ufOutO73/e/yrTIajv2RU8EUS3
	FBdoxgwmqQ6GBlq2FZkO/4AUB1z9MjE/+97iV0PhcgDcXqGYFJz6gv6pq1Aj166PuVeiQPyoX0a
	dzByMk+mAH2GgHgRSgTKucJH5SO7SFYMpjEdXgg92Pg16H2v2msCQlo+y9/Uzk6CD5D8yGD2DoF
	YOG/cAfpOXQKXCSPZUTLMIEKL9ZMMJ4K965OxnGNzSC56fUAyhV/mtDnkR5NsT5mYYn/OXD8rMk
	fyxkVoIziLBPLCK69bRGdJgsd/lcGlC/v/LVJ7/9gH214uXZSeFe4vc1iNNBVIK8AsdHvewXL1U
	UejdxCoyjz4soyFWk9l2ciJ2VNEe8PgbpqZGRAm0lw6hdmU+OHvk5CwVWlZatARAbugcI4/GWcJ
	97GknH+ws=
X-Received: by 2002:a17:903:9cc:b0:2e9:a782:bb82 with SMTP id d9443c01a7336-2eff7559a67mr15155935ad.54.1794980911344;
        Tue, 17 Nov 2026 21:48:31 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e9:a782:bb82 with SMTP id d9443c01a7336-2eff7559a67mr15155485ad.54.1794980910703;
        Tue, 17 Nov 2026 21:48:30 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62842absm6722775ad.61.2026.11.17.21.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:48:30 -0800 (PST)
Message-ID: <12a0edcc-2c99-4f68-9ebd-0a9ec76bece7@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:18:23 +0530
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
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, loic.poulain@oss.qualcomm.com,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net, edumazet@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com
References: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
 <179483727219.3136.17411591489340995392@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <179483727219.3136.17411591489340995392@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a05OHrekEJ05rdIsyuTeyCSyAODCoESi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMiBTYWx0ZWRfX3gl/z3eJlzsR
 7gdnNfJO7FPrFvcFJmKhBA4u5j1+1HA6heIKAaADwbSQVzErJ9JIZRu9HCTnzrEU+Eh//lYeazI
 J33mhyp3tqNpjEMokX1Ic3YBmD93Yu0=
X-Proofpoint-ORIG-GUID: a05OHrekEJ05rdIsyuTeyCSyAODCoESi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMiBTYWx0ZWRfXyHFPgUTibCXt
 fjP6sPjF0SoYzRHprIrO/4BPo0s/dsfeTpRc+ZKkDtXTAPOoQ/WXFGCVAJCjZ3tzr7fp5Q8Vr0R
 /RDpEFhUcE+koT8/Rb4MO9kwvjrmtAj7IU4NMmQp2SIKAY8XNE0FEDsFDoSuV6WyoSiQFzgIQ+r
 MsgufYrj97kWFHODPHvHsVbKDAht9dqmP66RyxwGfW+Ko0zBAcyz70GEdHzLY4O4XOwtjh/nVB5
 wk9b4GnXlRNubD1nxQH4GCSzOVi3ltEx+aFJ93qmsDP3pWbTwQrbBx6XPtwevuXGA0+/49FRDMI
 Aifr7Ynor45CObGvu+gLORcNJr3DNJgSyL+B//Oge5JvT5YR6s3FmtsHYFIjzDO84rStCPPbIrw
 i41NibCqTRBWYJj3QcV4qEuBNasFvOP/1G1dPYNqJgu74DdRznpzBwqHZObiuea0l5XuPxsURjs
 Ug2b34LVq2Ce2mhwAuQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd3c30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dyU1RJjCsz40DC5tq2IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180022


On 16-11-2026 07:24 pm, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 4 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The patch does not do what the commit message says for BAM
>    descriptor FIFOs.
> - [Medium] The driver can unbind while the restricted DMA pool is still
>    assigned to {HLOS, vmid}, and then it loses the only record of that.
> - [Medium] Requesting the PC IRQ with IRQF_NO_AUTOEN and enabling it only
>    at the end of bam_dmux_probe() means any change in the remote's power-…
> - [Medium] bam_dmux_remove() decides whether to take the restricted DMA
>    pool away from the remote VM using the cached software flag…
>
> --
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> When qcom,vmid is present, this patch requires a restricted DMA pool to
> be attached to the device. It then calls qcom_scm_assign_mem() to share
> that pool between HLOS and the modem VMID before the DMA channels are
> requested. The pool is handed back to HLOS on remove or on a probe
> error, unless the remote still holds its power vote, and the PC IRQ is
> now requested with IRQF_NO_AUTOEN and enabled at the end of probe.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index 1479f8362e04e..04f3d46d4c3f3 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -760,6 +766,88 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
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
> [ ... ]
>
>> +	if (!is_swiotlb_for_alloc(dev))
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Restricted DMA pool not attached\n");
> [Severity: Medium]
> Does this cover the BAM descriptor FIFOs the way the commit message
> describes? The commit message says:
>
>    "BAM-DMUX DMA mappings and BAM descriptor FIFOs must therefore be
>    constrained to a designated memory region"
>
> and:
>
>    "When the BAM DMA controller references the same pool, its descriptor
>    FIFOs are covered by the assignment as well."
>
> The FIFOs are allocated on the BAM DMA controller's own device, not on
> dmux->dev:
>
> drivers/dma/qcom/bam_dma.c:bam_alloc_chan() {
>      ...
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
>      ...
> }
>
> The FIFOs only come from the restricted pool if the BAM DMA node has its
> own memory-region that points at the restricted-dma-pool. The binding
> doesn't allow that. qcom,bam-dma.yaml has no memory-region property and
> sets additionalProperties: false, and this series only updates
> qcom,bam-dmux.yaml.
>
> The check here only looks at is_swiotlb_for_alloc(dmux->dev). Nothing
> checks the device behind the rx/tx channels.
>
> With a DT that follows the bindings, probe would succeed without a
> warning. Meanwhile, bam_dmux_power_on()->dma_request_chan()->
> bam_alloc_chan() would allocate the FIFOs outside the assigned region.
> Wouldn't that leave the XPU violation the patch is meant to prevent?
>
> Is a bam-dma binding update or a check on the channel device needed
> here?

This is covered by the separate BAM DMA binding change:
https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/

>
> [ ... ]
>
>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
>> +{
>> +	struct qcom_scm_vmperm hlos = {
>> +		.vmid = QCOM_SCM_VMID_HLOS,
>> +		.perm = QCOM_SCM_PERM_RW,
>> +	};
>> +	u64 src = dmux->dma_pool_perms;
>> +	int ret;
>> +
>> +	if (!dmux->dma_pool_perms)
>> +		return;
>> +
>> +	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
>> +				  &hlos, 1);
>> +	if (ret) {
>> +		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
>> +		return;
>> +	}
> [Severity: Medium]
> What happens to the pool ownership when this call fails? The same
> question applies when bam_dmux_remove() skips the reclaim on purpose
> because pc_state is still set:
>
> 	if (!dmux->pc_state)
> 		bam_dmux_reclaim_dma_pool(dmux);
> 	else if (dmux->dma_pool_perms)
> 		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>
> In both cases the region stays assigned to HLOS and the modem VMID. The
> only record of that is dmux->dma_pool_perms, which lives in the
> devm_kzalloc'd struct bam_dmux. devres frees it as soon as remove() or
> the failed probe returns.
>
> On the next probe (module reload, sysfs rebind, deferred re-probe),
> bam_dmux_assign_dma_pool() always starts from:
>
> 	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>
> That no longer matches the real owners (HLOS | vmid). Hyp-assign checks
> the source VM list against the current ownership, which is why users
> such as rmtfs_mem keep their perms around for the reclaim.
>
> Wouldn't qcom_scm_assign_mem() then fail with "SCM assign restricted DMA
> pool failed" on every probe until reboot?
>
> The commit message says the execution environments are tracked
> explicitly for the reclaim. Isn't that record lost in exactly the unbind
> case it is meant to handle?

The tracked permissions are used for the reclaim in remove(). If the reclaim
is skipped or fails, the pool stays assigned, which is fail-safe, since the pool
is static reserved memory that is never returned to the page allocator. This
matches the existing qcom_scm_assign_mem() users, which also only log reclaim
failures.

>
>> +
>> +	dmux->dma_pool_perms = 0;
>> +}
> [ ... ]
>
>> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   		goto err_disable_pm;
>>   
>>   	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>> -					IRQF_ONESHOT, NULL, dmux);
>> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
>>   	if (ret)
>>   		goto err_disable_pm;
>>   
>> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   			bam_dmux_power_off(dmux);
>>   	}
>>   
>> +	enable_irq(dmux->pc_irq);
> [Severity: Medium]
> Can a remote power-control transition get lost between the line-level
> sample and this enable_irq()? In bam_dmux_probe() the sequence is now:
>
> 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
> 				    &dmux->pc_state);
> 	...
> 	if (dmux->pc_state) {
> 		if (bam_dmux_power_on(dmux))
> 	...
> 	enable_irq(dmux->pc_irq);
>
> With IRQF_NO_AUTOEN, __setup_irq() skips irq_startup(), so the smp2p
> and smsm unmask callbacks don't run until enable_irq(). During that
> window, qcom_smp2p_notify_in() still updates last_value but only
> dispatches bits set in irq_enabled:
>
> drivers/soc/qcom/smp2p.c:qcom_smp2p_notify_in() {
>      ...
> 		status = val ^ entry->last_value;
> 		entry->last_value = val;
>      ...
> 		for_each_set_bit(i, entry->irq_enabled, 32) {
>      ...
> }
>
> smsm_intr() also updates last_value, and smsm_unmask_irq() resyncs the
> cached state when the IRQ is enabled:
>
> drivers/soc/qcom/smsm.c:smsm_unmask_irq() {
>      ...
> 	/* Make sure our last cached state is up-to-date */
> 	assign_bit(irq, &entry->last_value,
> 		   readl(entry->remote_state) & BIT(irq));
>      ...
> }
>
> handle_nested_irq() is never called, so IRQS_PENDING is never set and
> enable_irq() has nothing to resend.
>
> bam_dmux_pc_irq() flips the cached value instead of reading the line:
>
> 	bool new_state = !dmux->pc_state;
>
> A single missed edge would therefore leave the driver's view inverted
> from then on. The remote's transition is never acked, later edges are
> handled with the wrong polarity, and the pc_state check in
> bam_dmux_remove() that gates the pool reclaim is wrong too.
>
> When the modem is already up at probe time, the window also covers
> bam_dmux_power_on() (dma_request_chan(), skb allocation, DMA mapping).
> IRQF_NO_AUTOEN is set unconditionally. Wouldn't this regression affect
> every BAM-DMUX platform, not just the ones with qcom,vmid?

Yes, this was a known trade-off when moving to IRQF_NO_AUTOEN. Closing
the window needs a level-based bam_dmux_pc_irq(), which changes the PC
handshake on all BAM-DMUX platforms and can be addressed in a separate
patch if needed.

>
>>   
>>   	return 0;
>>   
>>   err_disable_pm:
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   	return ret;
>>   }
>>   
>> @@ -877,6 +972,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	disable_irq(dmux->pc_irq);
>>   	bam_dmux_power_off(dmux);
>>   	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +	/* The remote side may still access the pool if it holds its power vote */
>> +	if (!dmux->pc_state)
>> +		bam_dmux_reclaim_dma_pool(dmux);
>> +	else if (dmux->dma_pool_perms)
>> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
> [Severity: Medium]
> Can dmux->pc_state still be trusted at this point? Once
> disable_irq(dmux->pc_irq) has run above, bam_dmux_pc_irq() no longer
> runs. pc_state then shows the last edge that was processed, not the
> remote's current power vote.
>
> The RX side is started by the remote. The comment in probe says "the RX
> path may be active even if we are runtime suspended, since it is
> controlled by the remote side".
>
> Suppose the remote raises its vote after disable_irq(), or pc_state is
> already inverted by the lost edge in bam_dmux_probe(). This code would
> still call bam_dmux_reclaim_dma_pool() and remove the modem VMID while
> the remote holds its vote.
>
> That seems to contradict the commit message:
>
>    "Skip the reclaim and leave the pool assigned if the remote side still
>    holds its power vote, since it may still access the pool."
>
> Should the line level be read again here before deciding whether to
> reclaim, for example with irq_get_irqchip_state(dmux->pc_irq,
> IRQCHIP_STATE_LINE_LEVEL, ...)?

In both cases, the reclaim runs after bam_dmux_power_off(), which has
already reset the BAM pipes and freed their descriptor FIFOs, so no
transfers that access the pool are left. A vote raised after
disable_irq() is also never acked. Reading the line level here can be
done together with the level-based PC handling mentioned above if
needed.

Thanks,
Vishnu

>
>>   }

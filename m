Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EF13DC4AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141734; cv=none; b=jTDCtzPw/4pF6Mjr9VuczoQpSHFMjZRWm2cPX42oiy061PhQg70oLqA1hDhOEXlGlK6tyOhlMWCVgaF7G/yaKNxk/wTP4H82w5VYvHmS5WRxFmKLvpUqlkk+9YfMBcQgQ18VtqU1W4e1hOL8TTDx4OPouXeH+65Ud1cclkcAtcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141734; c=relaxed/simple;
	bh=QuSJzxEun27I+S0fyidi/Nwh2/MldM0vLmfhIKSGC08=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=KaX/Heu1l0i1gPILEvq4sFhwkcwikyvcaOBtv3JNdgTACUWkOSEco8+yVF5MMq3SQP22HsJY27YBd6VLj7c7YiYN/paDbvzii4nD0CFhsuuf+yY5yelx2ahuqNZKpqs8SXBl/X+tV3z5jQmGDoCYPykZ6Uhoshy9weQholTC20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3uQ4b29; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHb2Wf4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3uQ4b29";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHb2Wf4W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8g65g3372830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+s8G2ux4SOx1ikW+oZADB+m5m7O1veSyxYJwy+RyAU=; b=g3uQ4b29v2viCjV8
	3TBjCVHPGZWR/x6BhDRoeRAnSk58kFWWNVaCqbg9OZBvVPQazTOrXnD4jAJE1XDb
	gpDMq3iMhSyebt60Y+Hh4IVpzq93QzLCs4Fk4nfaRtMBgTj6vENWdwWu6j5U5d4D
	NyniB/Km8YM93MZMngfzUITRCNNnU17j1lE+A4NdVHAuqUMFruVRGEzytsYLYmqy
	asq9IYXCvKpC0MhkQGpVi93lZLdLxUYlyJTNDMuv4RPulK+6QzelsXdSH7Gdvrez
	ll0Um+MLOeLBxfLGrgnLADoYfwOEUh2TCtKAqXde4M3cdIkgF3zrR+1MmiMZBicA
	v/XrkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngystkjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso49893575ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785141731; x=1785746531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+s8G2ux4SOx1ikW+oZADB+m5m7O1veSyxYJwy+RyAU=;
        b=cHb2Wf4WalNDcUFKnJR5/qtj36NoKGnpDyd2tgR15pMAGtOkcsdqr3+hmYztX0PIFl
         1xFNFFFplgPntUSW6dYGjqafH2hNXcvpnoiVPQN7MVOjsARU1lCn/Jx+xs0yDbr7jc4f
         0DvL0cmMgaw3zjvnT4k+ql65AxaxQGK4hOgftXrCz3MiwpqpLbeGQKBr9+aStLs0qw+k
         a8QQh6Be+JogZTKP0cqzaxZB/7z6NBdtvBHissc5L9cN5vJ7wVwUoy4fD6tsJcEleHAa
         SUPLWh6k9MTjqmM6lsLVnz0iG6l5CTY9RdGdodcExuNDjvwaL3i2ei+wc9aWhkeX5Tjp
         ieLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141731; x=1785746531;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+s8G2ux4SOx1ikW+oZADB+m5m7O1veSyxYJwy+RyAU=;
        b=PaYSfIlUXUUmuVLUe48u3objM4aqwxu1Tw8XrV+SwxLQPPajT1ghSoU21tm7OwSvIh
         MxEGjhk+/LKTxxQvs6tMb3jEE3Xx3MIBl7z3GIR9ih8hLiii3AAy2DuHLPnRyS5mGdBc
         rBM5tEeOjCedrbSohPhEQfuqYBXdjtJiYqR87wpLEqei4htqTY4nf6+ipXbagG2lRjAz
         sOSAlQLiIq/tY4zdjSPYnXav4iDX0HPkvzgrjHxxo0r2ywXnFCET5L7J3ztO/9yVJ2Kc
         63rVmVBovY59DjSfUafQTwdE9Y2AhbBqUbxYGWRTRPLcX78ZPtqy7sScX6B0jhXdiuNX
         A0bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGWWzbPZlUcvdU2P5rY83akiuyEoon81VtjPIaNJeKfyO7jUYKRmuDmNv6WilWcT1beQFaqIWfWhs384Iq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gv2lNrwHOuUUek//2M0g3EZxrBnZvADRFEG7sbBF5MS/jIPZ
	/6uf47uOrWrGaai8yXtWerQ9vxtIqXX9aGFgxftR1OjDiQxqKNKVRxG9rV1pR6UzdoaGlvFNm6K
	Phy1PPUXDUqbJHo2h7tMQJ+/N3J9aJlU97l5OFiXUfhcG64pDtF7OSVJtSKMKPHnJV3oY
X-Gm-Gg: AR+sD13QG1uCyD03itWodOY2VqSlvLhKG3lmw3hFADAusl0/VrDIXyF5FvMPJt48k+B
	P6VIMqliw8p4+P8e4JrLtUXvzoaX8zEziF3Kk+xKFICcI/yUtbmzMZ1K9fzttJuijHCwymSWcvF
	IgYrpi6CI3X9YewQGkP/IJ0Qj0roQ/I5D0+oEnPw+O2DpHXGVKkVSPiQiUXUMa7HJTJeAg0xHQf
	DNNPLtAgHN2E1gcTBbxO9ICqNtQBn7cYKuoQbqT0KU69qj6J/jE/WyszD2nSZO9FwzIpjY0yQkN
	Z5ITvHjO7a2luo4Jbpr0yYYvfKCvC5ZVd6zbSBBoXlmVoHmqScTAo0hXIXb3skpJFuewx2AoF7+
	8RTBnhHCUlRsXTW/blO2ywT8ypGk/G/uvDqfNDNm05P0/1f6V/U0QJIf5PuNZ0joZZj1gAw==
X-Received: by 2002:a17:903:1a28:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2cfde7ae5fbmr76200925ad.11.1785141731050;
        Mon, 27 Jul 2026 01:42:11 -0700 (PDT)
X-Received: by 2002:a17:903:1a28:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2cfde7ae5fbmr76200575ad.11.1785141730526;
        Mon, 27 Jul 2026 01:42:10 -0700 (PDT)
Received: from [10.249.29.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdacsm31607085ad.47.2026.07.27.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:42:10 -0700 (PDT)
Message-ID: <fc3cd1cf-93d6-4f3a-b7e9-96e4111cae70@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:42:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org
References: <20260716095847.479-1-jianping.li@oss.qualcomm.com>
 <1bfd9503-ebcb-4613-943a-f6b31676f8e5@oss.qualcomm.com>
Content-Language: en-US
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <1bfd9503-ebcb-4613-943a-f6b31676f8e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfXwMDah7hobSAq
 vnMJyKgIHHkb24fmWM+Mb4s1UtgSjszGO1EQDxcQ3TVr9IR1S1D86x1WRFU/iGNfHjRrIExlO/P
 Gw9Sm3Kn1WPA0EtvHG0YWSaRjqQavARHedpsgiuBJH7tSBasyh6zctCVW09CsKt8yPmShn8qygq
 q4mtUppYXu9BCl8Ckaf+C4HJjVznl50G72XCuUAE00ri4PGuVTMfGUst0hlFfqeJETrDKwg6Ct7
 44hkQkSQ2kqeYkJlZthZwzi4QdqnqRpVGq3Wn656ligQNAmOP+dIePdzIqy9+r4/9p+xiPVHptX
 9gUBshFAJwD8PSIcihqm1pd3Vnlv3VO+/vDL+eWtizDAltq+Q0XuIEztqhWP5FM93qViKfF4vvk
 jghNiJWTe3KDJ9FaMwoAgvK9QFTAQXWKg/8L3Djbh/f1U/iwQSew3qbnw4YRxQEJTCGtGP0oVaD
 msVLsojvr/leJqcJE3w==
X-Proofpoint-GUID: eVkuqjwy9C0-MR1ApGvut5yxgAvCfamh
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a6719e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PJDYU9TqTllFh3ubuRkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX8b+rJwEXATyP
 aTYmwWBluRR65VahpV/X9zmMr9Tn4WmGspLx2SRsgn30oyHqPJTF5yQ9xMDCt81qusMLSqHVB5w
 s0dK5JQFi4SjnN6HJCXL/Gg0Kgokb/A=
X-Proofpoint-ORIG-GUID: eVkuqjwy9C0-MR1ApGvut5yxgAvCfamh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270085



在 2026/7/27 14:19, Ekansh Gupta 写道:
> On 16-07-2026 15:28, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Add explicit validation for remote_heap presence and size before sending
>> the memory to DSP, and fail early if the reserved-memory region is
>> missing or incomplete.
> Can you also drop ADSP_MMAP_REMOTE_HEAP_ADDR support from
> fastrpc_req_mmap as we don't intend user process to grow/shrink audio
> PD's remote heap.>
Agreed. I'll drop ADSP_MMAP_REMOTE_HEAP_ADDR support from 
fastrpc_req_mmap() in next version.
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>
>> Patch [v9]: https://lore.kernel.org/all/20260707061733.495-1-jianping.li@oss.qualcomm.com/
>>
>> Changes in v10:
>>   - Move Audio PD remote heap validation into
>>     fastrpc_rpmsg_probe().
>>
>>   - Treat Audio PD remote heap as a mandatory
>>     resource and fail probe if the reserved
>>     memory region is missing.
>>
>> Changes in v9:
>>   - Make sure fastrpc_init_create_static_process()
>>     only sets audio_init_mem to false when the sent
>>     address is actually invalid.
>> ---
>>   drivers/misc/fastrpc.c | 121 +++++++++++++++++++++++------------------
>>   1 file changed, 69 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d86e79134c68..03f633028c00 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1344,15 +1346,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_init_create_static init;
>>   	struct fastrpc_invoke_args *args;
>>   	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>>   		u32 pageslen;
>>   	} inbuf;
>>   	u32 sc;
>> +	unsigned long flags;
>> +	bool sent_heap = false;
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>> @@ -1376,31 +1380,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	inbuf.client_id = fl->client_id;
>>   	inbuf.namelen = init.namelen;
>>   	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>   
>>   	fl->pd = USER_PD;
>>   
>> @@ -1412,8 +1391,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	/*
>> +	 * Audio PD is a static PD and retains the remote heap
>> +	 * information across daemon restarts. Therefore only
>> +	 * the first attach should provide heap information to
>> +	 * DSP. Subsequent attaches reuse the previously
>> +	 * initialized memory pool.
>> +	 */
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!cctx->audio_init_mem) {
>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>> +		pages[0].size = cctx->remote_heap->size;
>> +		cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +		sent_heap = true;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1431,27 +1427,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   	return 0;
>>   err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> +	if (sent_heap) {
>> +		spin_lock_irqsave(&cctx->lock, flags);
>> +		cctx->audio_init_mem = false;
>> +		spin_unlock_irqrestore(&cctx->lock, flags);
>>   	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -	fl->cctx->remote_heap = NULL;
>> -err_name:
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2418,12 +2398,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>> +
>> +		if (err && domain_id == ADSP_DOMAIN_ID) {
>> +			dev_err(rdev, "missing mandatory remote heap memory-region\n");
>> +			goto err_free_data;
>> +		}
>> +
>>   		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap =
>> +					kzalloc_obj(*data->remote_heap);
>> +				if (!data->remote_heap) {
>> +					err = -ENOMEM;
>> +					goto err_free_data;
>> +				}
>> +
>> +				data->remote_heap->dma_addr = res.start;
>> +				data->remote_heap->size = resource_size(&res);
> other struct fastrpc_buf members are not initialized here. Either
> initialize all or better just add remote_heap_addr and remote_heap_size
> to fastrpc_channel_ctx structure.> +			}
You're right.
I'll replace the remote_heap fastrpc_buf pointer with dedicated 
remote_heap_addr and remote_heap_size fields in fastrpc_channel_ctx in 
the next revision.
>>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> @@ -2431,7 +2428,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   			if (err)
>>   				goto err_free_data;
>>   		}
>> -
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2490,6 +2486,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		misc_deregister(&data->secure_fdevice->miscdev);
>>   
>>   err_free_data:
>> +	kfree(data->remote_heap);
>>   	kfree(data);
>>   	return err;
>>   }
>> @@ -2512,6 +2509,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	int err, i;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2529,8 +2527,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap && cctx->vmcount) {
>> +		u64 src_perms = 0;
>> +		struct qcom_scm_vmperm dst_perms;
>> +
>> +		for (i = 0; i < cctx->vmcount; i++)
>> +			src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +					  cctx->remote_heap->size, &src_perms,
>> +					  &dst_perms, 1);
>> +		if (err)
>> +			dev_err(&rpdev->dev,
>> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	}
>> +
>> +	kfree(cctx->remote_heap);
>> +	cctx->remote_heap = NULL;
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   
> 


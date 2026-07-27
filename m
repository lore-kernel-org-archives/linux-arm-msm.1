Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1013DB620
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136386; cv=none; b=QMH/Jowunzx2PksdIUucg9xpnBSjWc4p5mGciE43V/A7W1MgmAxdrL0/S/GmXNY7gqk3wiQcAaeEZ7KAKEz3kOusi+62HPZ9PId6HYv83BOmoituYydoQGvGow1T+wtAGDHR+beWTOm8N1L1R4zmOPG1M3/KpBejEW+Z4IwbZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136386; c=relaxed/simple;
	bh=8q/xOAFAgHBHBxK6oR3PGbBGMuZ5GjqE4O8me3V/4eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmkwdSt3BhBP2ThQEPLr8Z4Mab2nLiRVF2saScE9FCTQukAfzN96K3ey2Vn+/jO2DbvKQLxfQTyqcTPblbY/OvMaSb2U5WTM23XL2igr6E1wragG3NjHppfPHU9LspA/t+/0kd8h/XvyY6Y7bgf0XUr4rxvpxiRO1hyMR2aHVPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aibazxFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkVS0aPR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aibazxFT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkVS0aPR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g8Pb2382049
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gzxH0iJ7uxd/Q8Ifj0PsUmWyIb3htizXPaJRM8/mwc=; b=aibazxFT2VUbtEKA
	9Pra/XRxNfrFpFcetFQbPsDeUnuJG4gzB07qWOCOpLfINN6RC8RkKtSR22CGxqi8
	RXcUxlIT0XeOSHzti6KqzmXqDpFQTMsX2Ona64tGBNLRJ5MYUINcZuAQzi5wZkVY
	gNpHsCsxVZ57+h7fpQ1pR6EQYSaTOyDRtHpvKWdo0T/ZYJsM+canc9/XOLrA11UG
	Z9SJSfQ834qxRhdUgIxQ3+LxCfpHND73vmjfilMdk5HobTAzwQIGrL+L7ai9kbUV
	gKGUoZySAvkStNSRmhiXandrIy5sgI6iNUyzyVuYqWLaoEMUC50bpB43Pm3d1D7m
	KTdOdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vcwrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:13:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1518060a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136382; x=1785741182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gzxH0iJ7uxd/Q8Ifj0PsUmWyIb3htizXPaJRM8/mwc=;
        b=VkVS0aPRY4csbbLvQ/Te+PYjnw6mpNxXYxiBlfM8tmXZPkqnvm10hvYeTnUXpXiaT1
         Y0IvpsdWYzWLgoPu84nbotDEOb1t8oAvZrIRcl5laMqM9Cw9IgkZqU6bRaX6EM8Bo6rx
         vRSjy65usRz9vLBdIF0BqkOGSZcEY+CAqlLDsDmulHoG8Ph0Bshd6yu0J3JLmismhIBG
         RBFw0HXTUG17ScNBvjI9rB75G37S2bIsWWHbcddP6vizyHzs4sLRbLHAJ1xNFjPFK7br
         kTPn+t7lpMK8h2B1RsL/txHj5UuTIkwlbYRZN92GhsSSs54gCirsAN7DtiGbMJbi8s++
         LMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136382; x=1785741182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gzxH0iJ7uxd/Q8Ifj0PsUmWyIb3htizXPaJRM8/mwc=;
        b=kZDXFNglun36A/cyYgSsdkrTllSEuueCgb2TI43//DYon3whlhwUdNWwSdVsqYUTTO
         ILut6j4iyDyA9mGi4VsbxwUeyq2nBRvLTRIjIn8OCWG9kj1KBY1ZXAYv/Mu4wTlDpdbp
         moD1GDgcniOE4UArlKFS/ITSeCDBCNwwbZuOVsV9sgIomW6jxRXdT09HnFXhubnNcd5L
         oAnUPiz0x0hjpOj0aFYR1AynLhk0d4lFVcZ0jC2v/oKcxFNd9GTgWWjpps07pmUb2b0b
         AYMYQAVweOjKCUJTb4048h/8m7lKUKA9pc9I9rfrnKYmSV1muSBwHkbYt3VBPLRu0qO6
         F48A==
X-Gm-Message-State: AOJu0YwkBtLtjCHZjij33tNK2iCo5ZGZRqjgJKC78XaA9OlMRejMOTFX
	yOX86i+6m+OU50dBgfCbX3VnAeFmsZXUHOH1g6xvwNBJHUiOe5seJfv+NT5GHni0G1g3LrLaZcB
	6s4nmxdO72v4KioDCJYhtaEnmLW5Af3hdH9x7M9yyIXqbOAGdJfHZ077NpEEWOj98vsoR
X-Gm-Gg: AR+sD12943nyh4k6wSaQ5ua0aJ7NLdISosv0ww1Ftx2IIdILJ1yDSsk3iu8UYLYQP/E
	GbVLOPWwTAvRedKd7w2dGdDZkLZif/dr08kZBr4f8g43sopJzxxTCB9wj+Qu4sJFziL17wnlm8l
	my+V3lUtDrFdU2IqQ7O8HbXqgdG7Etj+CGJXTIgXV+sZIu1ZOTHbtC3dtzBZfvWsF+V16ggH0b5
	d3ncA26v9jBV4/kdqTcLsDExjSPmJYQgfuk1hJdIL9s6wv+6mCYtLlbdHZzkibK0aGwyJBqzpkh
	h4ftZ+7Cdx+9B+DWrtIinlMd4K9/pPsYdX93AEh8fKs19q/b94UzbMCxm4DkGc0z38hQjN1rbHN
	K+TcJFahWh/MfnhlJbHc8GRBZ
X-Received: by 2002:a05:6a21:9d95:b0:3c0:9c19:b27a with SMTP id adf61e73a8af0-3c67e0723d6mr6489406637.72.1785136382159;
        Mon, 27 Jul 2026 00:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d95:b0:3c0:9c19:b27a with SMTP id adf61e73a8af0-3c67e0723d6mr6489375637.72.1785136381638;
        Mon, 27 Jul 2026 00:13:01 -0700 (PDT)
Received: from [10.206.98.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6581beesm2836687a12.0.2026.07.27.00.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:13:00 -0700 (PDT)
Message-ID: <805d5de8-477c-41e9-b192-d889d1cca9b6@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:42:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
 <c0218d64-3b31-4d21-b8c9-e03a4b5a7f91@kernel.org>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <c0218d64-3b31-4d21-b8c9-e03a4b5a7f91@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a6704ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NJSu0_N_U47NrSEsEm4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: QzvQGexpkFZ3mXKejFAN73X3iyXianpm
X-Proofpoint-ORIG-GUID: QzvQGexpkFZ3mXKejFAN73X3iyXianpm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3MCBTYWx0ZWRfX6pJDiCWzLzsX
 MWd4TUT5MAQN5YuGfeA/+lCvaYBAVexxESoCf1o62bJXu155sR4zBBHvStbYGRNiWOyUQJtX93i
 Xr1HZC8irE/RxCSa7jHySg7gi8StsPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3MCBTYWx0ZWRfX3OunURDpgnZU
 NaiGxyJhOluu7HyMoJjZGpvr4SQDv+xDfzolgbYTo13u9iH/c27TOBMoujEA6UeQyEPlxOG/Mwn
 uHeDvdhQ2GMy2Y+7Bi3lT03QqK9tDYwKeYkrb4mv9EYx+WV2JZ0RT6c37dTLYl4J8VhpEd225fV
 K43jm0cZm5Omp+cXuV5eCvdiAuM4w51Z4E7K+aDuOr0iHov0wWdNdOuAq6aHTRohKeim5LgL+Lr
 hd479d03V4CaPcngkSCpyu4cLkfAdGu0VF3Dyz5Iq4cDQdEQlj89qVWeVh7ewWoxUXbkFfWOSqn
 qR4sBzlGkuInm1+ueUdpyDT7uHj8cXDxr+wovbbUIFZiRGvVvI6UnBReloBZPE/kdCMT0ZMDZ4d
 rq3GWEbavb9cEbuWB/PaPpuDCM4YNZqnsH6oYgMaq/p1q+AdBLZgOwJDwK1BG52SETCkZDdpGjo
 4/XGfPHJUlDip67zQxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270070



On 24-07-2026 04:50 pm, Srinivas Kandagatla wrote:
>
> On 7/1/26 9:11 AM, Anandu Krishnan E wrote:
>> fastrpc invokes work by sending an RPC message to the DSP and blocking
>> in wait_for_completion_interruptible() until the DSP responds. If a
>> signal arrives during this wait, the syscall returns -ERESTARTSYS and
>> the invoke context which holds the in-flight DMA buffers and
>> completion state is left stranded in fl->pending.
>>
>> On the next syscall attempt (either auto-restarted by the kernel via
>> SA_RESTART or manually retried by user-space after EINTR), a fresh
>> context is allocated and the RPC message is re-sent to the DSP. This
>> has two consequences:
>>
>>   - The original context leaks in fl->pending until the file is closed.
>>   - The DSP receives a duplicate invocation. If the DSP was mid-way
>>     through processing the first request and had issued a reverse RPC
>>     call back to the host, the retry sends a new forward request
>>     instead of the expected reverse-RPC response. The DSP thread
>>     waiting for that response is never woken, causing a hang.
>>
>> Fix this by saving the interrupted context to a new fl->interrupted
>> list on -ERESTARTSYS. When the same thread retries the invoke with a
>> matching sc, restore the context and jump directly to the wait,
>> skipping context allocation and message re-send.
>>
>> Three additional bugs are also fixed:
>>
>> 1. fastrpc_context_save_interrupted() did not drop the extra kref that
>>    fastrpc_invoke_send() took, so the worker's put only reached 1 and
>>    the context was never freed.  Drop the reference in save_interrupted()
>>    so the worker's put reaches 0 and triggers context_free.
>>
>> 2. The bail path skipped context cleanup on -ETIMEDOUT, leaking the
>>    context.  Remove the -ETIMEDOUT exception so timed-out contexts are
>>    freed like any other error path.
>>
>> 3. fastrpc_context_free() did not remove the context from fl->interrupted
>>    before freeing it.  A context freed via a racing channel removal left
>>    a dangling node in the list.  Add list_del_init() guarded by fl->lock
>>    before releasing resources.
>>
>> Also drain fl->interrupted on process exit, complete any sleeping
>> contexts with -EPIPE and schedule put_wq to drop the worker ref when
>> the rpmsg channel is removed, and add dev_warn() on TIMEOUT and
>> ERESTARTSYS to aid post-mortem debugging.
>>
>> Remove the obsolete invoke_interrupted_mmaps mechanism from
>> fastrpc_channel_ctx; context resources are now kept alive through the
>> context refcount rather than by migrating mmaps to a channel-level list.
>>
>> Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
>> Cc: stable@kernel.org
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
> Does not apply to linux-next.
>
> Can you rebase and resend.
sure will share 
-- anandu 
>
> --srini
>
>> This patch fixes a context leak and DSP hang that occur when a
>> fastrpc invoke syscall is interrupted by a signal, along with three
>> follow-on bugs found during review.
>>
>> Changes in v2:
>> - Fix kref imbalance: fastrpc_context_save_interrupted() now drops the
>>   extra reference taken by fastrpc_invoke_send(), so the worker's put
>>   correctly reaches 0 and triggers context_free.
>> - Fix -ETIMEDOUT context leak: remove the ETIMEDOUT exception from the
>>   bail path so timed-out kernel invocations go through the same
>>   list_del_init + context_put cleanup as all other error paths.
>> - Fix dangling node: fastrpc_context_free() now calls list_del_init()
>>   under fl->lock before releasing resources, preventing a dangling node
>>   in fl->interrupted if a racing channel removal fires put_wq.
>> - fastrpc_notify_users() now calls schedule_work(&ctx->put_work) for
>>   interrupted contexts to drop the worker ref on channel removal.
>> - Add dev_warn() on TIMEOUT and ERESTARTSYS for post-mortem debugging.
>> - Use list_del_init() instead of list_del() in the bail path.
>>
>> Link to v1: https://lore.kernel.org/all/20260525124222.3082420-1-anandu.e@oss.qualcomm.com/
>> ---
>>  drivers/misc/fastrpc.c | 101 +++++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 82 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index f3a49384586d..c0859a501617 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -280,7 +280,6 @@ struct fastrpc_channel_ctx {
>>  	struct fastrpc_device *secure_fdevice;
>>  	struct fastrpc_device *fdevice;
>>  	struct fastrpc_buf *remote_heap;
>> -	struct list_head invoke_interrupted_mmaps;
>>  	bool secure;
>>  	bool unsigned_support;
>>  	u64 dma_mask;
>> @@ -297,6 +296,7 @@ struct fastrpc_user {
>>  	struct list_head user;
>>  	struct list_head maps;
>>  	struct list_head pending;
>> +	struct list_head interrupted;
>>  	struct list_head mmaps;
>>  
>>  	struct fastrpc_channel_ctx *cctx;
>> @@ -522,6 +522,11 @@ static void fastrpc_user_free(struct kref *ref)
>>  		fastrpc_context_put(ctx);
>>  	}
>>  
>> +	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
>> +		list_del(&ctx->node);
>> +		fastrpc_context_put(ctx);
>> +	}
>> +
>>  	list_for_each_entry_safe(map, m, &fl->maps, node)
>>  		fastrpc_map_put(map);
>>  
>> @@ -557,6 +562,12 @@ static void fastrpc_context_free(struct kref *ref)
>>  	cctx = ctx->cctx;
>>  	fl = ctx->fl;
>>  
>> +	/* Remove from fl->interrupted if present; no-op for normal paths. */
>> +	spin_lock(&fl->lock);
>> +	if (!list_empty(&ctx->node))
>> +		list_del_init(&ctx->node);
>> +	spin_unlock(&fl->lock);
>> +
>>  	for (i = 0; i < ctx->nbufs; i++)
>>  		fastrpc_map_put(ctx->maps[i]);
>>  
>> @@ -594,6 +605,42 @@ static void fastrpc_context_put_wq(struct work_struct *work)
>>  	fastrpc_context_put(ctx);
>>  }
>>  
>> +static void fastrpc_context_save_interrupted(struct fastrpc_invoke_ctx *ctx)
>> +{
>> +	spin_lock(&ctx->fl->lock);
>> +	list_del(&ctx->node);
>> +	list_add_tail(&ctx->node, &ctx->fl->interrupted);
>> +	spin_unlock(&ctx->fl->lock);
>> +	/*
>> +	 * invoke_send bumped the kref to 2; the bail path skips the put
>> +	 * for ERESTARTSYS.  Drop it here so the worker's put reaches 0
>> +	 * and triggers context_free.
>> +	 */
>> +	fastrpc_context_put(ctx);
>> +}
>> +
>> +static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
>> +			struct fastrpc_user *fl, u32 sc)
>> +{
>> +	struct fastrpc_invoke_ctx *ctx = NULL, *ictx, *n;
>> +
>> +	spin_lock(&fl->lock);
>> +	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
>> +		if (ictx->pid != current->pid)
>> +			continue;
>> +		if (ictx->sc != sc || ictx->fl != fl) {
>> +			spin_unlock(&fl->lock);
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +		ctx = ictx;
>> +		list_del(&ctx->node);
>> +		list_add_tail(&ctx->node, &fl->pending);
>> +		break;
>> +	}
>> +	spin_unlock(&fl->lock);
>> +	return ctx;
>> +}
>> +
>>  #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
>>  static int olaps_cmp(const void *a, const void *b)
>>  {
>> @@ -1243,8 +1290,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   struct fastrpc_invoke_args *args)
>>  {
>>  	struct fastrpc_invoke_ctx *ctx = NULL;
>> -	struct fastrpc_buf *buf, *b;
>> -
>>  	int err = 0;
>>  
>>  	if (!fl->sctx)
>> @@ -1258,6 +1303,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  		return -EPERM;
>>  	}
>>  
>> +	if (!kernel) {
>> +		ctx = fastrpc_context_restore_interrupted(fl, sc);
>> +		if (IS_ERR(ctx))
>> +			return PTR_ERR(ctx);
>> +		if (ctx)
>> +			goto wait;
>> +	}
>> +
>>  	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
>>  	if (IS_ERR(ctx))
>>  		return PTR_ERR(ctx);
>> @@ -1273,11 +1326,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (err)
>>  		goto bail;
>>  
>> +wait:
>>  	if (kernel) {
>> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ)) {
>>  			err = -ETIMEDOUT;
>> +			dev_warn(fl->sctx->dev,
>> +				"fastrpc_invoke: TIMEOUT ctxid=0x%llx handle=0x%x nscalars=%d\n",
>> +				ctx->ctxid, handle, ctx->nscalars);
>> +		}
>>  	} else {
>>  		err = wait_for_completion_interruptible(&ctx->work);
>> +		if (err == -ERESTARTSYS)
>> +			dev_warn(fl->sctx->dev,
>> +				"fastrpc_invoke: INTERRUPTED ctxid=0x%llx handle=0x%x nscalars=%d\n",
>> +				ctx->ctxid, handle, ctx->nscalars);
>>  	}
>>  
>>  	if (err)
>> @@ -1296,21 +1358,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  		goto bail;
>>  
>>  bail:
>> -	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
>> -		/* We are done with this compute context */
>> +	if (ctx && err == -ERESTARTSYS) {
>> +		fastrpc_context_save_interrupted(ctx);
>> +	} else if (ctx) {
>>  		spin_lock(&fl->lock);
>> -		list_del(&ctx->node);
>> +		list_del_init(&ctx->node);
>>  		spin_unlock(&fl->lock);
>>  		fastrpc_context_put(ctx);
>>  	}
>>  
>> -	if (err == -ERESTARTSYS) {
>> -		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
>> -			list_del(&buf->node);
>> -			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
>> -		}
>> -	}
>> -
>>  	if (err)
>>  		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
>>  
>> @@ -1662,6 +1718,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	spin_lock_init(&fl->lock);
>>  	mutex_init(&fl->mutex);
>>  	INIT_LIST_HEAD(&fl->pending);
>> +	INIT_LIST_HEAD(&fl->interrupted);
>>  	INIT_LIST_HEAD(&fl->maps);
>>  	INIT_LIST_HEAD(&fl->mmaps);
>>  	INIT_LIST_HEAD(&fl->user);
>> @@ -2460,7 +2517,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	rdev->dma_mask = &data->dma_mask;
>>  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
>>  	INIT_LIST_HEAD(&data->users);
>> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
>>  	spin_lock_init(&data->lock);
>>  	idr_init(&data->ctx_idr);
>>  	data->domain_id = domain_id;
>> @@ -2493,13 +2549,23 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>>  		ctx->retval = -EPIPE;
>>  		complete(&ctx->work);
>>  	}
>> +	/*
>> +	 * Interrupted contexts hold two refs: one for the invoker and one
>> +	 * for the async worker from fastrpc_invoke_send.  Complete them so
>> +	 * any blocked retry wakes, and schedule put_wq to drop the worker
>> +	 * ref -- the invoker ref is released by fastrpc_user_free().
>> +	 */
>> +	list_for_each_entry(ctx, &user->interrupted, node) {
>> +		ctx->retval = -EPIPE;
>> +		complete(&ctx->work);
>> +		schedule_work(&ctx->put_work);
>> +	}
>>  	spin_unlock(&user->lock);
>>  }
>>  
>>  static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>  {
>>  	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
>> -	struct fastrpc_buf *buf, *b;
>>  	struct fastrpc_user *user;
>>  	unsigned long flags;
>>  
>> @@ -2516,9 +2582,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	if (cctx->secure_fdevice)
>>  		misc_deregister(&cctx->secure_fdevice->miscdev);
>>  
>> -	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>> -		list_del(&buf->node);
>> -
>>  	if (cctx->remote_heap)
>>  		fastrpc_buf_free(cctx->remote_heap);
>>  
>>
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260701-master-2ba6246f29d1
>>
>> Best regards,
>> --  
>> Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>>


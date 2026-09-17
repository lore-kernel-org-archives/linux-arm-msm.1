Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC744D0CF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642824; cv=none; b=YtFf9ydK4OA4hm9OFZgLG9MVtU43KOqc7KYv3N++Qw6lAk/2oLbFM10UCgJypV0rvAM2kWftvtxqfwSDHlnXY1M7E1zWzcdCuNrwVrlWJGXjy99dN8OkUGrXypK7R8eFtMiLCyi+oSTb/z5FuY0WPERbIKsHit4KzEOseCIsc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642824; c=relaxed/simple;
	bh=IHjKB4L5nRV2UKl/PMgUcbJsiI5fL3VekqREU8PfNK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iamc9Yq7ypMEWHlRTWBIPhYLgAIVFNyCT3SdrJV5IOoocQPG4AOqnYvVGsn3Fg4rgsAdmh4n+Q1xzzTy03lGF82l9thu+nPLnwDavooVAmWA5KhLlsNJ7aPszaOPKnoAoBag1gwafD2vSzSZlocTS2C74+RzXEgnHLRaL574VkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3r3Fe5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSIO9NbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3r3Fe5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSIO9NbH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVgh612890
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=; b=M3r3Fe5Yp5jZwPeP
	6U1a3JjNypIugGMJkitHM/ngIuXONUYfoxQmf1OOtvXXtV9pNgrtuKf6S9+1d0iJ
	4lvxFRHh+fRe7rWMd+ddKdiPs6U+bULLVs1vBFyoH5I4Q9XWDfeJ/6FwkyYO0Cmp
	an/Bsv0eb1P7eoFsE4d9ulQP+BLvjOmyOd4EtyQZa0vYg3YR7UMCrELsxsQAP1+t
	QMQP+Wc4TC44UhbhWCLWqf/j5rffOI9FzyhT+SO9chgi2MM8ufRVV4/XQ3j9yRas
	3ROpVu6TmvnQLjmbWToT7IlKqq+tsbMjnVYNNYi02H31alHdNKQOBIUiaahznN3p
	uHqgnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rqjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:00:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1552924a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642813; x=1790247613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=;
        b=NSIO9NbHJIbZG02B6AgRZ3a231Qi2faRDUm2v0g19DmB3estAO3fTLnXVcJMEZChWs
         j0EQq3b7YgqaVdTeYFejMAfE7noIIQECdMgjqQ0nD1nzNZY46sir2Ya6o1s4jkr9J7e9
         uJ1Gkax0Q6c+eIzAScOjJGncID7KDE2vSdHkCsKLIrLZ8bSNC7BASjlD1sXIJPe90Xa6
         Es7AxvMakGYEgvrtXqGbadnUL8rE5oMBzMScVMi7UMOx30qzsGHb1ITw8V/MLBPSPXB2
         IH0mn+W8qBFYEWoL33/hJ+DkXvYt75Md14mIPQL+wIWWDLgUtlYEpqRYs6YpzSfFj38T
         QA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642813; x=1790247613;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=;
        b=ToZULasMxob0jdgKYwq/s2ZS4NMqojbdUS7AU67LMATeP/G0zbWAbJy4PzO6kgE97L
         yoBlv3H2/BOlp02mV0r1G3C1E6lnIc3485QEJzVE7/GhAhUkJlQzhQhjwIy2EoY9qGKs
         9XoLxWFC5/J+4ynD/xayq+0zJ4zZIInwtb4QjHKS3//cdqyQwgwGti58Rco7SKY2ahVT
         zP/2DeB+/2oFGJk0uQ6Rtjnst8Qp8DbAhLnNcWtci2ZiREawkto1sw5Owxv6xYKy1H08
         TijMURAVVYHT0PNTJkRCtGbTR+tzJqAESFAbMnOj40QmU21CcZcLfx3RhQJ1oDux2QY4
         01ZA==
X-Forwarded-Encrypted: i=1; AKwUvBw2n2XaxQMk07C55qZuzcs2eivm6wnqUJlUuSJWF1WqAk/bjDYXjICuPw4ssOGIwZJGtEADuyUqNaj1xf9y@vger.kernel.org
X-Gm-Message-State: AFuF++n3nVrJLoEhm28KsUSKkFJntPrgRupVdMtvm//3g2pgmN9pS3o5
	M48Na9eiiz5pDw/+t2O9W4g4ApXlo6B4QNxufJZXuK3/H++RmK0DtloFGjEQQ7KxzjopBAn6G0k
	+1zj9KmsTcnmhPLemYc4/PwKQuW3qVZcnOqZSl5t+zzcXSWSgZXoPKRmgQiG3svIsFP7b
X-Gm-Gg: AYBFou2efNXDLrnRdyvvn4ZpQTdsf2ZQVNNNwF6AmtA1IJRWWQsC2TXtmJ2mVsGu/lJ
	AvRhotR+oFocea1wqPUb08eqfKBwHf7W4Xv6viP6AEVH9ei5KmOBy7IGti3k6nsSDkkSbvWtwnJ
	g6hf2DeHhOLurgU0GrEnquWiDWEwybdopzctb0POevrs2XpfhxDL1dNCScO6kkfbMuYpyQppwnI
	SKHTdRzhOTGaVfumAQ63I7AtmAKtORFrDOolVtPXR2d6cPKff1KszSDPwjCW0XL3FgMFwMma6fd
	Y3E9F895OmN7J3M5vR/AW7TzYYTwQbUQ/61diZvT6h+DS+GfIAZ8+t9Y+uNT+1cuNKmwujlX8VG
	+yZvcXKvILES0DT4Nb221e/V1Kb8=
X-Received: by 2002:a17:90a:6c96:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-39e21a7824emr9355263a91.11.1789642810138;
        Thu, 17 Sep 2026 04:00:10 -0700 (PDT)
X-Received: by 2002:a17:90a:6c96:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-39e21a7824emr9355108a91.11.1789642808808;
        Thu, 17 Sep 2026 04:00:08 -0700 (PDT)
Received: from [10.239.132.237] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e732d6sm4715358a91.11.2026.09.17.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:00:08 -0700 (PDT)
Message-ID: <ab07749b-2aef-485c-b54c-becd26e5dfae@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 19:00:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>, linux-arm-msm@vger.kernel.org,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
 <20260912050459-mutt-send-email-mst@kernel.org>
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260912050459-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _U9ot620H4QriuKiT701hKF3ADWl7CYT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfX9Pph8LdJaCGg
 Sz6BKS/rb51pKWf4I3ULHMCw8PbDM8jsghIuhr+Ge7e7JSp0dr/L1iGPV/0c7BBkPZzSuBeNp73
 Ur2pIakfbMuQ1naOEI1ycmB5B46661U=
X-Proofpoint-GUID: _U9ot620H4QriuKiT701hKF3ADWl7CYT
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabc83d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iuKekLPq-CDQsUwbdJkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfX/AczlglI5KF3
 S0IJFZY5RlZk6/iITESvmxzqqlNoFh1jHglQQ2p7GW5M0S+XrTQFH8UgUvV09Ic5+8RfKnHRJxN
 T7ptXzSLFTIwLJWyfDUyfcO2NBEW+zn5A6VUypJDAkKaSsCLX9wLf3N9giGOJmN4FObhHR4Ngsn
 EXm4lIwSQArm3asxVj8y8t0eUcdA7pmxGQeHwZ+X4NrVE1Snn7vo9TvP1S+VU6DtbZ6+gvS2f0K
 se/U0JPkAcF+0MNOelXk3rAwyTT74RPiwWmhCvaZkSZ00GWzlps64mesIM3sOPY0NYffVBDkThr
 BzOjw2J0aVf5xJE2XLbYb4gnHHS0mGH6h3Exp4/7C3C44TqoMmibHZBqyII5Mz2HmkWXngENDrN
 BtxkhWRASKX/Te0eTokhjwwjgXmcLwlomqzzE8As1Us2wYQh9ttgh3mbuL6BPta5dAHV9JNH/JB
 2KCQvtiinsZgjwrJ9KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170152



On 9/12/2026 5:09 PM, Michael S. Tsirkin wrote:
> On Sat, Sep 12, 2026 at 04:52:44PM +0800, Cong Zhang wrote:
>> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
>> virtblk_freeze_priv().
>>
>> Keep the existing freeze and unfreeze order. The synchronous call waits
>> for dispatch code that was already running. The queue remains quiesced
>> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
> 
> 
> 
> This repeatition of the code in english is not what we need
> in the commit log.
> 
> Suggested format:
> 
> The following issue was observed by ...: currently .... because ... this is a
> problem because ... and we can not ... because ... to fix ... so that
> ... tested by ...: before ... after ...
> 
Got it. I will merge the detailed description of the issue into the
commit message.
> 
> 
> 
>> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
>>
>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> 
> no empty lines between tags please
>
Sure. Will remove this in the new patch.
> 
>> ---
>> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
>> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
>> while the flag is clear. It can then be preempted before it gets a
>> request. At that time, it has no queue usage reference, so
>> blk_mq_freeze_queue() does not wait for it.
>>
>> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
>> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
>> dispatcher can run again, use its old flag check, get the new request,
>> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
>> reset the device, delete the virtqueues, and free vblk->vqs. The old
>> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
>> kernel can crash.
> 
> 
> 
> this kind of thing belongs in the commit log.
> 
>> ---
>> Changes in v2:
>> - Cc stable@vger.kernel.org.
> 
> 
> which is no longer there?
>
I only CC in the mail, but not in the commit message, will add this in
the new patch.
> 
>> - Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
>> ---
>>  drivers/block/virtio_blk.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> index 32bf3ba07a9d..7a570591e040 100644
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
>> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>>  
>>  	/* Ensure no requests in virtqueues before deleting vqs. */
>>  	memflags = blk_mq_freeze_queue(q);
>> -	blk_mq_quiesce_queue_nowait(q);
>> +	blk_mq_quiesce_queue(q);
>>  	blk_mq_unfreeze_queue(q, memflags);
>>  
>>  	/* Ensure we don't receive any more interrupts */
>>
>> ---
>> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
>> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
>>
>> Best regards,
>> --  
>> Cong Zhang <cong.zhang@oss.qualcomm.com>
> 


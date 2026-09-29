Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CC4582DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709988; cv=none; b=VwlTWXgujY0najZNck3ET4J+ewLcga1VrPfZ0dQVqZbyRQ4BOtr99lKZUIRJk5qp+0pDVRCMpuTYyav711GeWR6HximOJhZ6hmXB5hidiGF9lZEqWjgMtQpumeDM+w4iT0XxrzvqQy+qjUAAVf9CofR6rcJ6W6crV0GZ+Lv4Hzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709988; c=relaxed/simple;
	bh=bmytGywDiBZZEcJlaLynGrfkR8OAE36ghtJndTJvmGE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I14kdNbRHt5D1yU7bL8KkoaU4RTaaQ8z/Za2F6TnZfz2txndi85VQe/mkYV5MwAw2AMXGIJ4WY+QnWTNgxHu0afA8PYeojF7ZOSIWbJ1eX5cpcUe1IU/tRps2PTm6beJsRkHimIel6QdM33GgT+Y8eqoM7N8PFZ23ssyuk30V/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PY0bdX05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZNJYtz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PY0bdX05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZNJYtz8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THTg0p826551
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 19:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jcggai5cj02Q8AdG/I+0wRNZv2kOWaf+kgficKkoXVk=; b=PY0bdX05WUzvsHGf
	8RoMNUa8YwOF8uE3TT0Erj/VBvtbs0q0z411V5NjMcnbxdaWhUC8tiqOiQqD8xJv
	l4CYB0IF833ujdxwP6hA18mteyjrB6ZrtNf3+KUVsuLVvJZQSCddqHSZKwzxlCRi
	u+XOosmyZbCFUrYD9PGm5Hs/QJnQTjMC+fJFw3iySOGwkcot7G3GomBJqWImVyGD
	HvVRbbzGYlC2n+MBWLs32bH075tYlmDBQN39VPViFHidhy0i2AwiBXYsO5CpRPdF
	V+LPpHvI/Rk+0+uX/YiKvTTXbmDU6y1LUS79z2ygPL/ihRJFaXQRP2ab6Ccm5n0a
	wzv6Sg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh0fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 19:26:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342138eeff2so403510eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790709984; x=1791314784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jcggai5cj02Q8AdG/I+0wRNZv2kOWaf+kgficKkoXVk=;
        b=PZNJYtz8J18BuujiVysz/ZfMwYlbVnQrWnielfWUCnMhFmeejn0DEvhy4R8ET565/8
         hPH5dYngMeXN2kVOW/5uAkZMfQpaA7JTqWRYagHnKqxIX5zjZhlg+17FuZKKZXc2Fdtm
         7stl17i30X+H5w0kMEWlM4f0GFiSJ6DV9xVXmvtUxv01Vpj5i0+2pIvynxFhRk9Qb5dZ
         IpZQCHjqrblvJSAvqLyeNiQDSpbYD1lxkRkAWJ5wCpmBUqj01ORkl8Pfrpo27oO0JL0N
         zpEQQlP/gfNngU6Z86e+ZG802GUsBBCyNkIESoHJg1adVQkcfdxXNVzTG2PH/JuIoFuI
         GHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709984; x=1791314784;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jcggai5cj02Q8AdG/I+0wRNZv2kOWaf+kgficKkoXVk=;
        b=YvJCLQza2pr6dgQ54g3jVkFPm+8+mAfaqNcrG6VlpG3pRQh4Fj+LEwF3AVD0VIwvJG
         TfsGt68qGgp1gIm1CR3EomEUeG+6stQ0NxdEa7DVvOXOonD4Uxjxf6ro/CkLhFCp0/l5
         zM2jYLWUXLh+iU21gTeRCpFdLDTns12iPmuPcVpuh7aYuLEiU/BpLNdxBIyDsk0mq5+G
         vudx/HUyQ9wvxLxZxZPTo3e8pjDBj2vjQzsh5sdp3Jc5DBYF24eYLyoGa1qSmMVwDf6L
         dqvp9FewQB56QlY+L3ODAGmjXH0xIaVQDl3lW8V+7b0ho33OX/MBULYwdD7s0ijHIOEa
         n5dw==
X-Gm-Message-State: AFq9FYLUtEPP4FL5sFOxsp5t+RIgqV7M04oygSfaDmxIy4RF9ASuLeBF
	zTbb8yiT2IPq0lcfzG6s0oPVUrlUDDbEnSuuIMm1CmbtXhGc8jrNFofi2he/LTNGnjmrjoDKyka
	qBagtCdv2oisnib4Pfa9bGkYQhjCC7dd/MtKgJU5sR9aIUVI9THH+y/mSt5f2BiOMwEzMcRFlS1
	EjaRc=
X-Gm-Gg: AYBFou0bMgXT/ial6tCTmu2uMtmIqjIp3ja2Lg4bsIuzCFsjSG3AbZGeA5YJY8jbK7m
	EPQgc+az+qoSBeK2J3QTREu+HsujWyoumj96Dc5zAQj1qdNX2F62ytcC0v+LpiNg7KiZKeHhCd3
	n6Y2aiC4NW1COpfj+fymgFFAOAItsxLFJvRgE8cx2FZJVLidFvZbp9Xiwl7Dl51/OYGR1FbBpBy
	GO6lNLgFezVnX0YxgtG9s+IWnHttYOb2BxeYMJ3GWPnnQvAhMcMCk9Cl4bdRfnJ9/+yM7YNiagh
	nOU/2mh0vkvrg697nrdcRKP98wIP2Qy15bsoVMYd2VZ43ZGB3rKwIH+K8cvu0KnURReeTxARUFb
	A4FCVGiy7docZcjJpeDuz4edDKrEGnIMz5O3KUHZ99SoqGkTSn/GPOw==
X-Received: by 2002:a05:7300:d203:b0:34a:fc46:35c3 with SMTP id 5a478bee46e88-34c67ca5854mr293317eec.33.1790709983940;
        Tue, 29 Sep 2026 12:26:23 -0700 (PDT)
X-Received: by 2002:a05:7300:d203:b0:34a:fc46:35c3 with SMTP id 5a478bee46e88-34c67ca5854mr293278eec.33.1790709983268;
        Tue, 29 Sep 2026 12:26:23 -0700 (PDT)
Received: from [10.226.49.37] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm909179eec.25.2026.09.29.12.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 12:26:21 -0700 (PDT)
Message-ID: <d9bf5c75-91b4-4933-ac2a-33aace58cbbf@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 13:25:26 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeffrey Boody <jeffrey.boody@oss.qualcomm.com>
Subject: Re: [PATCH v2] dma-fence: deliver set_deadline callback even if fence
 is already signaled
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260922-dma-fence-set-deadline-v2-1-2338d6fac9aa@oss.qualcomm.com>
 <72e380d8-4b94-47d4-8721-a6f652dfd27b@amd.com>
Content-Language: en-US
In-Reply-To: <72e380d8-4b94-47d4-8721-a6f652dfd27b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3NyBTYWx0ZWRfX2jBZ5yAxhapD
 /uEqKxoEyGCOc3vCN7My2DWARWTEX+mUnAUcRbs29AGcl8sOsLEobuT95TuvO/2VYAuF7MH7cJ0
 Nb+NNMJq7fA+5UQS++nZOcx4vDNdxZOZo9S6e05/jTp4sSbHV9+59ctmO1kBYNMEpJ9v4vcQdbU
 S6fu8myUVgZqSGYK6VbtWOqt+CjqOBjqOe38PoHJYpKLQzZJw+dSXqBgCawfE0xwYNHfVtauaBC
 bu6cdgmqPw1xfUEUdSKA23szAX/cZvtsZpPlvghF+4k39Da4k3AaqIU7+3SF9mWC0OJce60rZyE
 BtVbFTseBbiUg5+FL+RNnmYFePjXYmfj463F1roxu5p30u+T8E3Up/EQjGJi+pTWY7pSZIsk7di
 xqmWcwrBZIB/e4/Ey+ExrE94C0623XoQHVd10ib/KCN+N2lrMHP2piiYOsyRiAz2Xauyyz+FTWM
 4XKqLb3xZYPL0Zs3zgQ==
X-Proofpoint-GUID: vvnJM3W0XoyA-npm74QXdFN6qvOZSOwZ
X-Proofpoint-ORIG-GUID: vvnJM3W0XoyA-npm74QXdFN6qvOZSOwZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3NyBTYWx0ZWRfX+Xo/3tDQfp4c
 zrVz94S9ymdSks+B6bhX+ij0n8HBPyKuN8a++PCgSpGmL5hbK1wMwABNkItNwb3J6U/CdCoNqyq
 obuRBeMAMHJ+hFk+KprtpRWg7m1Z66M=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc10e1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a6woDCoF70UX9vXSefYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290077

Hi Christian,

I apologize for missing this issue and will follow up if we can find 
another approach.

Thank you for reviewing the change,

Jeff

On 9/23/2026 1:35 AM, Christian König wrote:
> On 9/22/26 18:57, Jeffrey Boody wrote:
>> The set_deadline callback is currently skipped if the fence has already
>> been signaled. This prevents GPU drivers from performing power
>> management adjustments when the deadline hint arrives after fence
>> completion.
>>
>> In triple-buffered rendering, a staged frame may be completed well
>> ahead of the vblank deadline. When a display driver delivers the
>> deadline hint, the fence has already been signaled and the callback is
>> silently dropped. This leaves the GPU driver unable to evaluate the
>> headroom between the fence signal time and the vblank deadline, and
>> therefore unable to reduce GPU frequency when the target headroom is
>> exceeded.
>>
>> Remove the dma_fence_is_signaled() guard from dma_fence_set_deadline()
>> so that the callback is invoked unconditionally when ops->set_deadline
>> is present. Implementations of set_deadline must already tolerate
>> concurrent and repeated calls; handling a post-signal invocation
>> requires no additional locking. The fence signaler can compare the fence
>> signal time against the supplied deadline to determine whether frequency
>> scaling is warranted.
> Sorry but I have to clearly reject that patch.
>
> No callback whatsoever is allowed to be used after the fence has signaled or otherwise we break module unloading for the originator of the fence.
>
> So that approach you want to have here simply doesn't work at all.
>
> Regards,
> Christian.
>
>> Signed-off-by: Jeffrey Boody <jeffrey.boody@oss.qualcomm.com>
>> ---
>> Signed-off-by: Jeff Boody <jeffrey.boody@oss.qualcomm.com>
>> ---
>>   drivers/dma-buf/dma-fence.c     | 22 ++++++++++++++++++++--
>>   drivers/gpu/drm/msm/msm_fence.c |  3 +++
>>   include/linux/dma-fence.h       | 11 ++++++++++-
>>   3 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index bd58688b81a7..ebc7c5ca6f69 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -999,8 +999,19 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>    * Multiple deadlines may be set on a given fence, even in parallel.  See the
>>    * documentation for &dma_fence_ops.set_deadline.
>>    *
>> + * The deadline hint may also be delivered *after* the fence has already been
>> + * signaled.  This is intentional and supports the case where a fence signaler
>> + * aware of a periodic deadline (e.g. vblank) and the fence's signal time can
>> + * evaluate the headroom between the two.  In triple-buffered rendering, for
>> + * example, a staged frame that is completed well ahead of the vblank deadline
>> + * represents excess headroom; delivering the deadline hint post-signal allows
>> + * the fence signaler to consider reducing frequency for subsequent workloads,
>> + * rather than holding an unnecessarily high frequency.  Implementations
>> + * of &dma_fence_ops.set_deadline must therefore tolerate invocation on
>> + * already-signaled fences.
>> + *
>>    * The deadline hint is just that, a hint.  The driver that created the fence
>> - * may react by increasing frequency, making different scheduling choices, etc.
>> + * may react by changing frequency, making different scheduling choices, etc.
>>    * Or doing nothing at all.
>>    */
>>
>> @@ -1016,6 +1027,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>    * to aid in power management decisions, such as boosting GPU frequency
>>    * if a periodic vblank deadline is approaching but the fence is not
>>    * yet signaled..
>> + *
>> + * This function may also be called after the fence has already been
>> + * signaled.  In that case the fence signaler can compare the fence's signal
>> + * time against the deadline to determine the available headroom.  If the
>> + * fence was signaled significantly ahead of the deadline, the fence
>> + * signaler may choose to reduce frequency for subsequent workloads to
>> + * avoid unnecessarily high power consumption.
>>    */
>>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>   {
>> @@ -1023,7 +1041,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>
>>          rcu_read_lock();
>>          ops = rcu_dereference(fence->ops);
>> -       if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>> +       if (ops && ops->set_deadline)
>>                  ops->set_deadline(fence, deadline);
>>          rcu_read_unlock();
>>   }
>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
>> index 3dca8e09c192..3c5de96d4092 100644
>> --- a/drivers/gpu/drm/msm/msm_fence.c
>> +++ b/drivers/gpu/drm/msm/msm_fence.c
>> @@ -136,6 +136,9 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>          unsigned long flags;
>>          ktime_t now;
>>
>> +       if (dma_fence_is_signaled(fence))
>> +               return;
>> +
>>          spin_lock_irqsave(&fctx->spinlock, flags);
>>          now = ktime_get();
>>
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index ffa99b930843..839ef2e5dad9 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -264,7 +264,16 @@ struct dma_fence_ops {
>>           * an upcoming deadline, such as vblank, by which point the waiter
>>           * would prefer the fence to be signaled by.  This is intended to
>>           * give feedback to the fence signaler to aid in power management
>> -        * decisions, such as boosting GPU frequency.
>> +        * decisions, such as boosting GPU frequency if the deadline has
>> +        * not yet been met, or reducing GPU frequency if the fence was
>> +        * signaled significantly ahead of the deadline.
>> +        *
>> +        * This callback may be invoked even after the fence has been
>> +        * signaled.  In this case, the signaler may use the deadline and
>> +        * the fence's signal time to evaluate whether the GPU frequency
>> +        * should be adjusted for future workloads.  Implementations must
>> +        * therefore be prepared to handle calls on already-signaled fences
>> +        * without error.
>>           *
>>           * This is called without &dma_fence.lock held, it can be called
>>           * multiple times and from any context.  Locking is up to the callee
>>
>> ---
>> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
>> change-id: 20260917-dma-fence-set-deadline-a778746e9abd
>>
>> Best regards,
>> --
>> Jeff Boody <jeffrey.boody@oss.qualcomm.com>
>>

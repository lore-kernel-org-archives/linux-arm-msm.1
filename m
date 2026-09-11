Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F274611CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117544; cv=none; b=jG81gVgdXCCdiO+GHDfaGpFjpwCBeDw/+uFJU3hUv83A56VdUVU+DsahbfnIlGONT+ljb3mLiHktM1gc3UBg19h4KD1C8HNr3oo0a3zOxpC9wIMrT5iZl0kkPNWIVK/j8GoS8k7EmTcMCt+E6sEk8ZU38CActiqeSC2yMcj/FAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117544; c=relaxed/simple;
	bh=X3Nd95xqCpJNQclrIlWnptvcCWNauovHRLOTs2CwJRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyB/rdWtJmCB+93eVFEkKSxy+/SVu07xMP4gk5nb18WHVq3QyLLxCh+9CcW56+fTay1btKVM/I4u4dvysFscqY3IxL1Q8OPKN3N9tCi/PaYxf3ZA8lDHnBmYtlLG55o5JP8tMKUaL3WWFxpLrwtKe60nzOkRXeUAKEBjUKyvTwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyKA5qzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQP7aXmo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyKA5qzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQP7aXmo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpSZ2311499
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vw7B6EIuhuPmpddwxSeUbe9DHC9nTNYShdf9NPCBm4=; b=fyKA5qztPHpSB3s4
	J3UvPAYdx3p/yzYxGlRzzQGFIBK/W4zGT0eVqEIHFo1kUxlrKZIfYLHglMqrfSjk
	kWvRRG8aXGKbiyIw44m8WCDZH9qo8F+buzz+ZsodR0WPd4pH5NaH01Pw8+wCn86H
	kwtL/o0W37mB6XUNBQouLnsd9XzbxNKAufGf7d+HCBVEhhk4MFkxCAyyWnvzSeH1
	XCL5kogLRKdRZIGMojdm5XZEja2rFReEOgaNhdSmQXASc8mYvADa0q5W2kVGoE4M
	sQ4g9Hr4hI+OTEeSsSlmq8lCopA3qfcRgy4z9RrZbdrPLzZkuIWuHYFtI28MWMm4
	tqGQnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchmu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:05:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso9988585ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117542; x=1789722342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1vw7B6EIuhuPmpddwxSeUbe9DHC9nTNYShdf9NPCBm4=;
        b=SQP7aXmolrfAFbP+RJv5bu4MRnBUrHCi3eh/AA4iW7AiaiVdAevh4r2LvWvrOg7Oqk
         ma3VLalB/bSmx3fOLhVjqA8Ln6QRht/cXJQLqG++yOIUI7N1v7spj12tMINHMT6QRC8g
         pjzQhcXi9saYyT9S5jSuuZ0P1xHLmDgOoBAQZ4hazZ3PsGr4QuZCUd8+i/divhdxH+ZF
         gSwXurParjfkvS4eeP5qoniYsREz0prdlkzwHudTbdELiqSai4FaOM7fSnxJAvNM1GGi
         4eNX8OZxdCWlEGKcq9vOEfq4PXub5Y77Ypefl5/CdhuNmx7znXHZSEv2vFwrcAi1VwlT
         za+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117542; x=1789722342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vw7B6EIuhuPmpddwxSeUbe9DHC9nTNYShdf9NPCBm4=;
        b=SPTvp4Rihqn8MfOTRK1/vM8zGELw6UAmROvRF7ZaPQyDYSE1uTAGK3kKIhCM8B5698
         lkYSvdETvq37lkCLdjtMd/bd+k+yCJsLKAxSHtZTKJ7gj40VIu8Bc61+IKsPCX3v2rd5
         iGUeAwKqlPWokwozJ2I1Dhjoy6u3gng6vp6pd3K2KDJ/7MHgU/OqJdcjuZZFGFc/4JFm
         Eti0OrKOyBOBzSZZAck8IS1IcKAN1IDAjDOc/wN7uwPQ924dV3qU0o2NiBT8o3+oMdjP
         k/gtNwFJENlcl1GfMAvE4gyEcujlL9EmCJKdHAhM3qeCEgswNgK/mBIc8GwXqezBZy3H
         ps7A==
X-Forwarded-Encrypted: i=1; AKwUvBy7aPAmIZQtXCzQSUEn7lb5WxIH0wzUtbNCsH9ARX/F+GtPJ5m1Q1X7BF4p5OjCC2yeh+NjYGO34g+tQG9r@vger.kernel.org
X-Gm-Message-State: AFuF++mufCcfaK/ucNlFg+iXWSCZiDuI3KK2C75Ti0gHAQ5MZw7N8I79
	SlY1/yXMia4i+VciJT4zhhvDRye+HhT8AYZHhSd3Rcoigntq/3oBX1lf85j8jjLMMd3v+wr2tSn
	9pVWGQmmOUM9A4+u4EkgCduJCB/oUUsdmcC5AEQQLgNaIA4qhmY+DITpgwWkCQRpYcr5u
X-Gm-Gg: AYBFou33F9NBM8Rd06xza5SQsiO4DP2ySPqubIrWgOnuBMXWpThfU8SghmnprpIh88l
	/82fwALHeGbfK1CjxG56wpjyoQfx+spNz424n1UIUPjJoNQppWAmZlkj+o77khkd8WcO/cNmfgF
	7iUILJtEIo50P6E6xbbJowVeZgN2Xy4xYQC+3uVQySo/CzsAf6LfZ4Y1yeqhFwyT1oHF4k3R9eS
	LTRcg3/L+9m8Mt+zksg5L2YXXbp09vf3NNcPm45hXosqJnozAkCBTc6Qy4JSleD/wqKl+SNgriW
	VCVOcbZbc1Ufqailj+gvbLij0elDjUNsZasE4U6/M4fB1siIzrxug6BuvOisWr2Xazoe8AG7ZW7
	bJa+KBZ+3f260ojSuEezb4nBADN81pnMJ8VLnf1OrXOWR3Jqh88qGkWMk1wxmxKO6sMVc
X-Received: by 2002:a17:903:178e:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd2a336572mr72374675ad.10.1789117541737;
        Fri, 11 Sep 2026 02:05:41 -0700 (PDT)
X-Received: by 2002:a17:903:178e:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd2a336572mr72374035ad.10.1789117541116;
        Fri, 11 Sep 2026 02:05:41 -0700 (PDT)
Received: from [10.249.16.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd94easm8123485ad.63.2026.09.11.02.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:05:40 -0700 (PDT)
Message-ID: <6ba2f3d3-7c44-44df-b1a7-1434bce94e00@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:05:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
To: Jason Wang <jasowangio@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>, linux-arm-msm@vger.kernel.org,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
 <CAAf7B_Oi_z7M_A_LwoAs_CAvhuk1NGxvADQssE65_OcTroncXw@mail.gmail.com>
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAf7B_Oi_z7M_A_LwoAs_CAvhuk1NGxvADQssE65_OcTroncXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3c466 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=FvcSSuj2OSKhwKorxh8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX3IDMCTV/Gua5
 n7vFw8POJk8MBnUpLPGmpWuEdDcLrhEUW5pjInY7nJNeZamqxHV3L7c0oUAAYbl6TuZY9mPukt/
 WDEFOBSi+IFcWtfZG5RIc5pEAM4G3VJNLCjlGrAlIF8JnFO9YbbObCe3yLPDS4yG6kIXmGvS4Dy
 o0djCGq/ZPtwgWeCL0pSB7hr7KdfeMT9RtYT0lasPNTDXFbH2I05Dai5zfNOOsYbl+PvbtgojhY
 QB1GcWfQvfiBfEmH0cB0/RkNTMVF7ZnvAcFfzJ1VA/S0JMQN209/7lTUwBwOdwMoLmXvzVDxmJa
 H1KwglAtwV09sWw8nmUIF97gUq3opbMp1VWNCDrmaw35R4aMVabChhR5TfakQ0RgDMgOIRkRRt1
 pmASf4+kzf6o/CeDaFw9sZPBc2zknVb0WgMCEGI4o+/3XeukjlqnjLGIAUoUh7MvQwgh+C8rrUD
 oHsQsCx21ah19sNR2cA==
X-Proofpoint-GUID: n5fFckTh9D5jn4fH9R4lPgw1aZ3WRzxx
X-Proofpoint-ORIG-GUID: n5fFckTh9D5jn4fH9R4lPgw1aZ3WRzxx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX0DASfSctDTeK
 +YJnEoV8VMtRSiiujpymAZBawK/1GyRpEz2bp7Jl6HXinPjx50akKIX6ZDUEwy4CRtGULGg0J5v
 4EzIhi5grUj8Hfb9JCXT0iy0wR9HZAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110126



On 9/11/2026 10:22 AM, Jason Wang wrote:
> On Fri, Sep 11, 2026 at 12:31 AM Cong Zhang <cong.zhang@oss.qualcomm.com> wrote:
>>
>> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
>> virtblk_freeze_priv().
>>
>> Keep the existing freeze and unfreeze order. The synchronous call waits
>> for dispatch code that was already running. The queue remains quiesced
>> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
>>
>> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
>>
> 
> Do we need this for -stable?
> 
Good point, I will add this in V2.
>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
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
>>         /* Ensure no requests in virtqueues before deleting vqs. */
>>         memflags = blk_mq_freeze_queue(q);
>> -       blk_mq_quiesce_queue_nowait(q);
>> +       blk_mq_quiesce_queue(q);
>>         blk_mq_unfreeze_queue(q, memflags);
>>
>>         /* Ensure we don't receive any more interrupts */
>>
>> ---
>> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
>> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
>>
>> Best regards,
>> --
>> Cong Zhang <cong.zhang@oss.qualcomm.com>
>>
> 
> Other than this,
> 
> Acked-by: Jason Wang <jasowangio@gmail.com>
> 
> Thanks


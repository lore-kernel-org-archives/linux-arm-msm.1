Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CC35F602
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204194; cv=none; b=LeuAw9zm6oiLLMpbFIcM3EdkZ2F8znURFjwi9FjjoXp02CaR04G3FnfFsCTduy7O4PKyV9msHyHCI4M4N94QHn03hIHAnlr+QLns7EBcvFe5Ne7fu2H9ekAO6A1iSHcgIzyxY1a/N5n4mNGKr/8ptz+PX53XnLMmgvQ6YZzPTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204194; c=relaxed/simple;
	bh=Udoo0U8Eun6RScJdgOh2tTlkvguARmiSlB0JzgpGvvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9cmFl5bMnPb5WykqtOHbfdfaNskhDjk+y16ZUrKGNGc1dBPx/bvYCGa/GFee9xoDvdQY3YhMiKqFh48i+KxsSCj0KJfBgxMQDfcD+6Kcw+XqF4inHuI/vzbFdb3dTuDyp4mW3CWDV84eZBYG/V1tDbVgSfBDIljNNcG8Qgnc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A36Rsk1/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tjCJ44WR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A36Rsk1/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tjCJ44WR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789204192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2fTpUU0/C+r9b31rC+Uhm2IpvHL/cIjBJckoMkgqczM=;
	b=A36Rsk1/JGGPKhqUdkP2Uzb4X8kroFJyAcjL3JxOwzivEpPtDlCP+nSJ7VBC/8ec7Y9H2W
	CDeUtp1448Stg6uCGlbG7ZgmoWG+m8zKRGllb+kGWs0c+IWzYlrSiZAv0lStp5YHmBBwsa
	DSAArsG8P2ke6W7RIQPr7MTTAN0W9YY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-POJxtYpvMvyQLpFnw_N97w-1; Sat, 12 Sep 2026 05:09:50 -0400
X-MC-Unique: POJxtYpvMvyQLpFnw_N97w-1
X-Mimecast-MFC-AGG-ID: POJxtYpvMvyQLpFnw_N97w_1789204189
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843e59c32dso1108175f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789204189; x=1789808989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fTpUU0/C+r9b31rC+Uhm2IpvHL/cIjBJckoMkgqczM=;
        b=tjCJ44WRixS3c8wTvizTp2GmGaw6sxq2Adp4xYIfq2XzbTwj4hYNLotvo/ee9Ry1CK
         AKsv+XZQKkNwOnmPZK5t0sg2+uX7kDQkLIEwf3GZw0Cm6Y7bOeLHQPel+AIUBiqIoVoX
         SgVzQ4waqpFCeWFjKOQdA1/GUCNTP+M1OCM7anF3zbNacoATipImGmOLL0QpaX0NyCuM
         RQWmo/qSWrt4KnUrB8BrKhdQkVadjuViCyuHOfS0RNv9wkt5FewICpfegdsk6xBhj6Mm
         Zj/H32a/zaUo3vstzCcf3AXl+F7qxJAwA90k/+dFXRkO+MS39KjcRyAU6g5hjlpWGJ+N
         sUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204189; x=1789808989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fTpUU0/C+r9b31rC+Uhm2IpvHL/cIjBJckoMkgqczM=;
        b=pqxNBBQMb8NJMzepaRuEI8BToNdqHrCqRCdk0KxEcSU9LvKO0oSQBe20VCUfH/vIw5
         PFkBjJeieJeOmAr1FcSrnRhYudGiCQiT8lgRrO2pQUDe+QPs8zo65NaAkedsrSFYCgrR
         KdYVI4g1fk9NxL9sFSvh7EEiwX+S0WHbebob2hjR0HfKVPVdz8mhtW2J9lB0kPN8Iir2
         B0H0M9kL/oJ+XEJpD5/TTm3IJF+Sw+yJ0cjmMOiN3TX9coEbaXnqwimmWC+Aqrj2dkua
         4s725DYmFH33aOT5E10gRsufBZf7SNFOyHNPFnO2MtzItF7isNJulxc6yLKOUJZigiMX
         vTXA==
X-Forwarded-Encrypted: i=1; AKwUvBxwhwWJ65wiSjX2nBCnDHKi8ZAeidmh3df79Iq/Pmd+8zsZtGvO1BaMKaA8gZ53bymds/uz2qvQUA08b6Ak@vger.kernel.org
X-Gm-Message-State: AFuF++kss7q5hwzAUGxCTXx7oNUPI2M+uPw4eh1S72dcPKobf8jo5xlg
	5rn+u+DYuCsGKKwL4nU28MixdzQ6v2Tj1t69smrPgck3vreDPj2JnZ5F4ULUPtJ0Ym5aEroGtgg
	5yKs6qVy2XANc42wQ9XF/QL4RlrYSw1XAuAj9eywZKtqhLIEYIooaQPKctAbleMok3VE=
X-Gm-Gg: AYBFou2OZmQOWfUkhRstElgxuedMv/aM0h4rmthpmwrih8r7GT0RCQ5J+eDfE3tG1BG
	MnYojJd/ArES5oFTUZuOo5lHvjKY7k+WvkrTKy2W+h4egd6Fzxc6v60ER8sQYsNMRP0hsBs6LWz
	aaqXIZbIS0NGY4WF9Bt8/ynTzrBVYDRcT2Tfdpr2DfC8XOoPEtA5JvIIPi0fujGV3vTD9hUJojJ
	Ic0Bx4a2Z6XHyFzl3ezjyyGlWJznhNkekzd1Q1a4qA0mvOMZdYaoOCkDR3mhjdAaA+rMr7oXfoe
	lI/u6/tcJCW4i89NmwtmAZcBg0H1nUcp4m+2187CJaxHx7AFsIJQWuL1yhxMQxzlPwU=
X-Received: by 2002:a05:6000:4008:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-486eb329a0amr8768536f8f.34.1789204189455;
        Sat, 12 Sep 2026 02:09:49 -0700 (PDT)
X-Received: by 2002:a05:6000:4008:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-486eb329a0amr8768508f8f.34.1789204188889;
        Sat, 12 Sep 2026 02:09:48 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm11666697f8f.24.2026.09.12.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:09:48 -0700 (PDT)
Date: Sat, 12 Sep 2026 05:09:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Ming Lei <ming.lei@redhat.com>, linux-arm-msm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Message-ID: <20260912050459-mutt-send-email-mst@kernel.org>
References: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>

On Sat, Sep 12, 2026 at 04:52:44PM +0800, Cong Zhang wrote:
> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
> virtblk_freeze_priv().
> 
> Keep the existing freeze and unfreeze order. The synchronous call waits
> for dispatch code that was already running. The queue remains quiesced
> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().



This repeatition of the code in english is not what we need
in the commit log.

Suggested format:

The following issue was observed by ...: currently .... because ... this is a
problem because ... and we can not ... because ... to fix ... so that
... tested by ...: before ... after ...




> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
> 
> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>

no empty lines between tags please

> ---
> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
> while the flag is clear. It can then be preempted before it gets a
> request. At that time, it has no queue usage reference, so
> blk_mq_freeze_queue() does not wait for it.
> 
> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
> dispatcher can run again, use its old flag check, get the new request,
> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
> reset the device, delete the virtqueues, and free vblk->vqs. The old
> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
> kernel can crash.



this kind of thing belongs in the commit log.

> ---
> Changes in v2:
> - Cc stable@vger.kernel.org.


which is no longer there?

> - Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 32bf3ba07a9d..7a570591e040 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>  
>  	/* Ensure no requests in virtqueues before deleting vqs. */
>  	memflags = blk_mq_freeze_queue(q);
> -	blk_mq_quiesce_queue_nowait(q);
> +	blk_mq_quiesce_queue(q);
>  	blk_mq_unfreeze_queue(q, memflags);
>  
>  	/* Ensure we don't receive any more interrupts */
> 
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
> 
> Best regards,
> --  
> Cong Zhang <cong.zhang@oss.qualcomm.com>


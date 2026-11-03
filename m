Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716267;
	b=c4R7RJCEfANOFlwA4oDJFoumTmqpKaTrWa6mlFPi1FC5aFlZg811v8Zjj0IUHiMu6Djd
	 96jXAwNkMAY9aDDY+7PQFSHq/1WjOKTBZHOM0I4MrEUqqbPr0+nQKyzO086SDzCyHNXQp
	 Kz5FMJtjAZpGSSoWYS8hntgguwIaypNIgIyW5nNHeYeWgPujWV24N/XtybRNDd/eMOVE3
	 CXt0FhlTzSFVeadaFY43LQv63ow+DeULyqqDY52j3Fyvsa8wEQL1dpHG/tyEHVdt18xZc
	 80nwm7iI+u6sfS7K93W0TjTOLGkcoZPxDBDj3xtlPmPLopzBQuTgXivQWf65TccKM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
	b=1LKYoKOmkSByQTTGqKHPudkOtxAzL9WIiZyU4x3CrBhAnkOQK5aSGPA5JP7M88m7kH1L
	 lqy/W8oh/1xEDdZN//IEYFYEPHunh9sINRmE/pa0QQupE01LU9Xb7Xqd/pGeETTGJeShN
	 tL3UNVam5AFXbyDksxFna6EhGuj3JT7Vsb9tg/fSgHDQe6Dtk6KTb7/ePl54rYyx+0w2o
	 RixWVYoogsFAisa8x19df1kn/0ZqjuhNAW9/01hJS1av7pCL6SRcVGTXgYf5eJ9MUYv+9
	 dPHwzslgL1tYtthSB9KZONgXPYtf23/ZYJiGuth7/OH71X0eF18l+VUjS9HFMHfuzQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JAL5xEbx;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CC606D80F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01CC606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JAL5xEbx
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6270351c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716266; x=1794321066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
        b=JAL5xEbxeRyI5iZfq2c75QvgWSvM8A+hwAkPoB5Ef0uYyHxKF51D+EkIcYAiVT42GW
         O8+rFQnzDXYUm2OXJlerdC3iicYR4aSaSaHH3Ep/VgS3dutNQteQPI38N9cTs923fA4D
         BIryhyqdfWTScigh6MyLKL1CJS2d6DQawQgkmWOyqgp69tkPhN8FiEZNW53On/G87OWp
         kqGTqlIrju9gHXn+A4kicd+uohnWUkqFnZgHPqVrRm/AudeUaSqo5Vxq/cHqmboyto3O
         deySONUwD/jokWH+7+DxV4OSMbR/tJKnNpueSZ3h16f9pmnrEaRKiRgNtstEGOao5RnI
         wqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716266; x=1794321066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GXjmDSpdPKSM3dvXbu3WCZAHTmv+G6w0ssCMfJAnCM=;
        b=i507Jh00pj7WUimsDXp9bWWdpDZz6UN2MkyFnSBuYEmqGN7JNdXHuEZKQYV7fBiYN3
         VADXgt18M9nscwYSD6y2Tjwg3ySUJKrhb+k7mYVqvXhhn+TPnwsR3vYKJQpKNYiD31WL
         7TU+gkvu43BMuXMI3Sgx9i+vNCtsLsYyh9ApAVpSeHByQDutTAoTUDwFJIFJyYOyqj/3
         Wr3gUbPFGGcZ+NYB0pxYWchwb51b8/omqzXO/8mY8wkmrbpRpnrvIpM1OAYoQ4xNREcb
         mdgeY5PP3fKTrrdp0VchG9mmx2ZUKMU8pqcV+lpR8Jsha9rmxdKHwvS/rL8WwJzcWqw8
         4qfQ==
X-Gm-Message-State: APuU4Z/5NT52KnR3e3hoLI4+2CR/oNo7G1OaTInjrBCHtP0E7X9pb5kK
	w2/FTkZys1lELCwkD1B/tANOkkrlfEe4lRWdCl+kcFBu4aRoQCzQCJEyUjMXmvi3rSU=
X-Gm-Gg: AYBFou2L7x59iqf4bHEhBlEWKokU3bHlTfK1M9e28FNqyrINay8CpfR56QT/BAUar8U
	26V1Dw0q2SkHZUI+ykkCoEUvGht9MPoHSQZf871YF83l3C8kBWvh3hEz6S5hR7tk1dX36Iwa5QJ
	Lo+xMj9ELTfPY5zJ7hiO7R+Gzy6sYAEeuIq3udlZMv8HPcyxjpU2yBbazWSare12wbCdToGmfTu
	XVouugSPcRC5vCbQnUontyKGhwWCW65kFzjL+gMbS6dsf6aoGeTj9fBC3SKiyLairHvok5MDhKZ
	Kh6aghs4oBYmnioYptA0OkntRky2DZPZxovnI4I+LH3J4hkoWNbPmZZN+BfMkX3om0cWRv63jPn
	Xyt3qqzlMnIZbqfYAcXB/HIDaxkx6VI9ZbMQAHkcrmVHgAojR4yMS3+QP3kYexeTW43RpstvQFF
	EFUKPyhXk8rKCF0xQKeEgc0ss7+CuaUXxodLQBg35Se4Q/3taWX102UARmYoR8dhvo9KJbfXDsK
	F7rS4oNnLXLMtugFX09LHn2odEVQktXPGFsOth2TZ5j3NGIMx9zBnfxX0NTLYIhuhlyt5FbGLiB
	J2zAoECOogdp6brSDauTaDvOsg/Xw/JuDBw1IGw4PyMPTL8oYmeVJeZc4kEkk/bdjvkHU/XW3i3
	Zc9ibgXRDZfbG
X-Received: by 2002:a05:7022:c88:b0:194:3a84:e67a with SMTP id a92af1059eb24-1ac5d0da7e6mr18645854c88.41.1793716265860;
        Tue, 03 Nov 2026 06:31:05 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:05 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Eugenio Perez <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Ming Lei <ming.lei@redhat.com>, 
 Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261103-virtblk_sync_quiesce-v3-1-f40233f9bdd9@oss.qualcomm.com>
References: <20261103-virtblk_sync_quiesce-v3-1-f40233f9bdd9@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Message-Id: <179371626469.3691261.7199603294029974156.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:04 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 18:32:21 +0800, Cong Zhang wrote:
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
> 
> [...]

Applied, thanks!

[1/1] virtio_blk: use synchronous quiesce in virtblk_freeze_priv()
      commit: 6c6dec7883f8eb10b326bc9d109a4990c885d949

Best regards,
-- 
Jens Axboe




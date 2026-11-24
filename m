Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530211;
	b=vzZOiukuR8LAR8DpGkdJYJG6aL120KZIconIzD7P7Yu0lVjK/tcdcsP4NfCAdK5QwIsI
	 21+7FCAboQBs3gGyNE/WP/9IkDi0lZHnVngkVwelXVOqLgfpe+g6yNoGgorldKxqMLFal
	 WxTB8kigvQS53IuOsxmYvTb4eRJ8RHLl43YXRX/qomW1la59UvZQjOodPlAm9myTz3XGM
	 DqTbMKHPRWgNjWRnoPTwMXtVmz81j78A2YUv+7ZjW7YASm3EfIN9c/0abvlJv3SR33Cvc
	 TG6HFQrefcQ5eRNYLtvsrqNAD8PHCEBx17ves3l1dkq9z/nMtAd2LeGWKjMsw31EhKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Zn2B+DmPBbx5TpMchnmfzNC5AyyLvagXfE8qQeZUWjs=;
	b=Rz6r3jqO8zzayGbf4MURkivhpTAv6d6rt+UKWY8t2CDlok8RKvRbBDC1bxHJEXteH42i
	 S2vprmtFE1WhPqjqEfLu6LryLOsjEKRPZcJhhfYFCxuoeFQykTWDSDsAcvU4QrDI9lA8F
	 wYHg6T5QcuIz5sieChf8RQrEJRmb9hW0tYvecJhL4pIIt6Hkz5fojU1pqMoWwEQVLaUF/
	 LqtEunegBiDE6rXkktDUpBqIcrgZ7AbGgL+w7a8C+ej9qPb6D+RGIrlbfaN1oMlC+iCwx
	 lTzDd5tHumDOfGEQwoqTiV15Si2xqsGwptZmztpLplqekWZEre2kzH5CUi+daTHyc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZvENR9P;
	arc=none smtp.remote-ip=209.85.160.68
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA6A606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA6A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZvENR9P
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso4127555fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530210; x=1796135010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zn2B+DmPBbx5TpMchnmfzNC5AyyLvagXfE8qQeZUWjs=;
        b=BZvENR9POQOtHgRJjdMtTnYFPz4KQxAYYfre1KN5Uj+ulTNtBRK5nioAjaQNq8dyKE
         hFGfYxaIE0xfkgvETiaYgJ2DxMtD/pFk1yUAh1MIMgTfpsKRUXbMO/Yq5fnA8Wo31gOY
         fLI14sckIn9arQIBQEb0z6yphlTVMG/SnILJq6lXsQ+Xa1Wmc7f8CTMRFvNPVD9nO2SS
         P0ozxR+3CV5j9xcUR/PTzwndD4wialbD0ZSHzh1K1yRxwqu2f11m+HNiZR5m7cEkJHei
         fRjeGen+Cf6RsMxBRtaQynch1eI+86LWwuzxirvEBEdzF9eaqObUvZUZsC5AT1U5rhhp
         Gplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530210; x=1796135010;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn2B+DmPBbx5TpMchnmfzNC5AyyLvagXfE8qQeZUWjs=;
        b=Iz13d/YxXgv2ZGrNJ9ZG99El+BrMLMn88c4yqsu8XCitHQzrosW7Oju+qA34n5tzSk
         Kado05hxiziT+hrDQmXwf7d/RLWanYg2dSvvmp3luBLhK3q4gIt5u2a5rBLzFE30pfMe
         W7O37YhtOdyrAamhFWOFvnjlZoBmP4OGFZJmNTU5dKEyqv1C4BDvjGi52aTbCUJ2fUUD
         P2VQ1WD6YXH71Vv48DwIO//gBITbc9rVPwai4iuVumC6pFvX2RrIAcb30YmIAZkiqe4l
         Ho96xHqs9fdena6Esg+CBG9AZ0c0rZl7o3cPRsssG8XnoKSAel/3IOhqDiUghv6PA2/w
         ef/Q==
X-Forwarded-Encrypted: i=1; AL+hErEd72ogQMNroL/WDUPjcR0PXQN0/4RkIl+9J3wPTVEkGfVaISs3ohCpBkQL3vqjKqGh91BgMdrh6YxSG7FH@vger.kernel.org
X-Gm-Message-State: APuU4Z+gL4xQR8+TNtDDra/+L/d7vuPb30WIp8G9b/aW9Z1LCa8rb5Ay
	F0R+Y2S6HLwwI5HjhhaNKjwvFZCi0hR4AiBSf6ysBeUwu1uBG7nCuc4=
X-Gm-Gg: AZFdTZdk9TqaAKrFP0P9RatV3rq6jmcUWaW/STo9sUNX7IPPFXKF+AufrlpF8YcRuXb
	AqA46yP9xrApXvcy/eKI/C5JiWrIy2WVVi7ZEN3CXmVtGYzvj98d9CufxEQT9GNarckFFM6pGpL
	lbnK8T8IJc+WwFoV8cA4HkAT3axoDHCOZzz3nfgMHyo2eT+qxlRkzo5CSHwU2jzaakLmqOdcSPF
	rtBxwNHbqleG2qqIs7MlOr16MS/wOwty58RFCPjQ3HG618MH70Y4u8alpcJtKpb/mqp1g6rdUDp
	e37ZDP8pVHRNm7Ey50gEFvqX1s2q+O0Mx/om+tIkRWojiUrxvYxJtA9Kj6pg8e63TO63qBnXMHz
	BfTIncZMS+UC0ap9V5tm7xmAnVTSPtMip51apCA4ArauxyOKj0uYTFxEb4NrQM+Ujt7InFjhBT9
	ish2aG6VKDR7TYnX5Iant5E0b7tWmk0dR+1fhKEplyOF/MV3W8j1fUaD5UQrW/6VZbIOffVzYcw
	ijOyA8j79waMljTWXUYD7qMhDNrNyZuQ5spuD+bYziuuA5TAcis8nUt31F4PEL28f0b8654yHrP
	/bkaW+i9tpA10As1WxZmj581nw==
X-Received: by 2002:a05:6870:f62a:b0:498:8e03:c1e0 with SMTP id 586e51a60fabf-4bb3bf60561mr10886373fac.40.1795530210118;
        Tue, 24 Nov 2026 06:23:30 -0800 (PST)
Received: from localhost ([2a09:bac1:36c0:1f38::1c5:14c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm15090906fac.13.2026.11.24.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:23:29 -0800 (PST)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: rene@renesp.com.br
Cc: srini@kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ekansh.gupta@oss.qualcomm.com,
	anandu.e@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: Re: [PATCH] misc: fastrpc: fix fastrpc_user leak on abnormal process exit
Date: Tue, 24 Nov 2026 19:52:23 +0530
Message-ID: <20261124142229.88456-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124122011.2912030-1-rene@renesp.com.br>
References: <20261124122011.2912030-1-rene@renesp.com.br>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 24 Nov 2026 13:20:11 +0100, Renê de Souza Pinto wrote:
> Since commit e85eb5feca8e ("misc: fastrpc: fix use-after-free of
> fastrpc_user in workqueue context"), each invoke context holds a
> reference on its fastrpc_user, while contexts left on the pending list
> (interrupted or timed out invocations) are only freed by
> fastrpc_user_free(). When a process dies with invocations in flight,
> this cycle leaks the user with all its maps and buffers.

I am new to this driver, so please treat the below as observations
rather than a review. I read the context lifetime in char-misc-next
(917fcbf03) and it does appear to support your description:

  - fastrpc_context_alloc() takes fastrpc_channel_ctx_get(cctx) and
    fastrpc_user_get(user), links the context onto fl->pending, and
    kref_init()s the context.
  - fastrpc_invoke_send() takes a second context reference for the DSP,
    released by put_work from fastrpc_rpmsg_callback(), or immediately
    if rpmsg_send() fails.
  - fastrpc_internal_invoke() unlinks the context and drops the first
    reference in its bail path, but only when err is neither
    -ERESTARTSYS nor -ETIMEDOUT.
  - fastrpc_context_free() never touches fl->pending; it ends with
    fastrpc_user_put(fl) and fastrpc_channel_ctx_put(cctx).

fl->pending is referenced in only four places in the file: the
INIT_LIST_HEAD() in fastrpc_device_open(), the list_add_tail() in
fastrpc_context_alloc(), the drain loop in fastrpc_user_free(), and
fastrpc_notify_users(), which sets -EPIPE and completes waiters but
neither unlinks nor drops a reference.

So for an interrupted or timed out invoke the first reference is never
dropped, and the only other place that drops it is the drain loop in
fastrpc_user_free(), which cannot run while any context still holds a
reference on fl. That matches the cycle you describe.

Two things I was unsure about.

First, this looks like it overlaps with Anandu Krishnan E's series,
now at v4:

  https://lore.kernel.org/linux-arm-msm/20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com/

I see you have Anandu on Cc, so this may already be understood, but as
the two fix the same leak in different places it would help to know
which is meant to land.

> No thread can be in an ioctl on the file at release time, so drop the
> references of the pending contexts there. A context still waiting for
> the DSP response is freed when it arrives.

Second, about the symptom in your test report. If a context is still
waiting for the DSP, the put added here only drops the first reference;
the DSP reference keeps the context alive, so fastrpc_map_put() on its
maps runs later, from fastrpc_context_free(). The maps are attached to
the session device (dma_buf_attach(map->buf, sess->dev) in
fastrpc_map_create()) and the attachment is only torn down in
fastrpc_free_map(). fastrpc_session_free() runs immediately after your
loop and only sets session->used = false, so the context bank becomes
available to the next process while those attachments are, as far as I
can tell, still in place.

Does fastrpc_release_current_dsp_process() above guarantee the DSP has
drained everything by this point, so that case cannot occur in
practice? If not, the window you are aiming at would seem to remain for
genuinely in-flight contexts.

> +	list_for_each_entry_safe(ctx, n, &orphans, node) {
> +		list_del_init(&ctx->node);
> +		fastrpc_context_put(ctx);
> +	}

Very minor: after list_splice_init() the entries are already off
fl->pending, and list_for_each_entry_safe() does not need them removed,
so the list_del_init() looks redundant.

For what it is worth, the patch applies cleanly to char-misc-next at
917fcbf03 and builds there on x86_64 with COMPILE_TEST=y under W=1 C=1,
with no new warnings from either gcc or sparse against the unpatched
file. I have no Qualcomm hardware, so none of it is runtime tested and
I could not reproduce your leak; the rest is from reading the code.

Thanks,
Murali Krishna

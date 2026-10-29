Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271124;
	b=J9IKPqoNQ66PhHCk1RoeiN0wcukcBvtjd0eC74/g11o9izsLNB44GTOUvHFTBL5a3PSI
	 3PmSDoUlunBtJGRe3SKqR6IvIlg0iGzkdqUAF2zmx9xC4gvpqXAtXNJY8/aOftmJP0O4D
	 K5gkCV0BzCHa3O0FTThVVje4StqM7ljv+aV9hdOXVuCJO88Hd1YYbQi7UUo5VthlL53kf
	 sB7+MEI9jQINF5cHqxngXZkA0zOCJ8SQkGYO3V7hTQI4SNWAYxsmcXKcz4DbtBbNkvFSs
	 AML0vyKvqhZ1bd+ZHCF2CMNIJzW21onAlXbupogft7x8/1pzOPlR2rUt1FqBIwmfEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
	b=0iaJpI8jiBV5qMV3IZST7GRDa3I5p44BZTO5bJKtIcYSNvLCZ0QiEBabpFGzHY/uchPT
	 lGOG3wACQba/VyXo5RF0uoZNOjlgQ0E5I2s68AsXc4pF/VjachMMbKj+qqhOZXG407OJJ
	 c99aI+249IPYRqN8s2Qu8VpUv8ei8OfgkajmgB5sbPyRFiAlVZKRLN8efzIpzI5LV4mDx
	 L0NwE8qGFu0HWEMIFWkhYUW33b9AdJpwEFeczJpAoqAukiys6UCJ7c9ncPIv6Ieb81pql
	 7hlDRib/eyw4NunFhL1gaIUAYA31+wmEaCaOesLKcLkP7/DvoMNA9Tt8r6OkCS5LgXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSZB30aS;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100F606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0100F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSZB30aS
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-19305bcb72cso1846236c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271123; x=1793875923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=TSZB30aSZew/Y5iJpxyPAdCHSaUlGuRX0vGPWMGscUtyNdl4Gfru7VebT+uqAfmp6z
         QuRNmBliNwyit8/AV+JZGMrzS05uBUZyaJBYwcrM6V4CAEnFVG1H07Yh8XF6guXXqq/R
         0K6G6cvVOv6UxRt55KGii+YttWs6XbRYn3Y8tJ0JSK/FGkHwvCu2ElRB76I+w9muGUO+
         ehdbGY7CFuQhqr3Ct5KWUxe2bQqDJtvarrPkhglzBJlDKwFze5DOofXjDSx9NBRX5hSL
         ja5G7My3fhuw5URGr6Ba/QVGC9gd8w3GL/SZKX1gX5+fgnfevpEj7+FyT+7DRLu+RlLX
         hbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271123; x=1793875923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=hVFnq+0KSLMg7y2se9AaGPkbPmwQn/oN27GdhP1NVE26qktTwhEuHZHsKjrrTuCgq/
         g7aFR7knXn/Ov8EdBQCjNXIOenKAwFysYiY8MniO0fYxZ8OMPRYtFfaO3636eMLaWwEF
         YjthMRU5OO1wEtb8Aj4gFed9S7lqhGH+9f/SWTRHSLfyRmsxiTp0WQjsdcsSCYi4lDLD
         nMO/0YtmI4DKnnMFaA4PqZZh6EcLS7h6G12Jn4RogMcW38pB48i95aHbqBXJi0LXQcm4
         Jp3CSAHZKRKZUfOTUyN+8nVl6t3W4dCEyC0OnW1mR/l3TaT33uWh1PM6fHpiQ710BFcP
         uEiA==
X-Forwarded-Encrypted: i=1; AKwUvByxAgetNbhseKp4lP5xuENMVQ2F6wzNYWOaMotRTrrd800yMMA6pYeptcnO078KCVC4aY56OhklPVj1fDO8@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VAOIlObrSV+YwA3bLSQ0SUL+gVBoCi+h3ypHWGhcvx8gGC7j
	/o/9gDNlNWDJuj3noV3D7uXZEkERd50hxC446NVUGs6z5ilhCIgSPrlo
X-Gm-Gg: AYBFou3Tz2HNixxTtf/0V45S0XmfhQesx+rgSyxkGOQIgdr1ikdc+bmOCmk+endXvvR
	uta800oGdyZKAUewVpvUT8RLLk2zl2RJGkmogdiUr9qtX4GPMZ7eBTLJoSy4KbizKj1ah46qNnW
	2Puy9BpsSviRIsZ7ZLplZ8RFQGn55qN35L6ZlKkEaPOqAzwlyVXbYxYb/3WkFZRjoAiEadBPifG
	u3+bqCZmbumP02Ex/sGxK5U+trDNsx8FWt4u7Sdt2C37MacMbxgEasItBXuQZWRANdbkyN9P9Za
	MoOCpGXD+2P5w6J6hioxZygGDs4BDy+K+vpGY5+i+H31i07/l7hEVbbjXUQdbT1pl2TzFvni4MC
	VRVv99FDzjwPLBDYbXINVpPQOFmfLtNiOHBMcd/8SyZlHOb94KzRIw0cT/1gMIQKxlr/FQx3ahq
	kz1R4XtZY3SgKJLaoOE3/3iSvlP94Tx3xz0HQO7xULuX0BOIrrzfMHMcqimf9GXMpAUz30ldJoI
	lklNhkUYYXKaM/caGugm016NtWGDRSOnvBRlEdFEIrwZZA/docJDy+M6NEO7c6WaY0NvJhCdb3t
	QD42QM7irBVbeUTV9vy15d2HNbMv2TkTdV5F4Q46e7n2
X-Received: by 2002:a05:7023:c081:b0:14f:8e70:fad0 with SMTP id a92af1059eb24-1a6cfb045camr6418261c88.33.1793271122885;
        Thu, 29 Oct 2026 03:52:02 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c9fd2b4sm14692245c88.6.2026.10.29.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:01 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	effeffe99@gmail.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:51:57 +0900
Message-ID: <20261029105157.2553-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <at9mFUv1flg-6aMB@debian>
References: <20261022163116.1042-1-26rote@gmail.com> <at9mFUv1flg-6aMB@debian>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 08:11:56PM +0530, Manivannan Sadhasivam wrote:
> > +	if (cb->type == QRTR_TYPE_HELLO) {
> > +		/* Pairs with smp_load_acquire() in qrtr_hello_work() */
> > +		smp_store_release(&node->hello_rcvd, true);
>
> smp_store_{release/acquire}() accessors are only needed if there is an ordering
> requirement. But I don't see that exist with this 'hello_rcvd' bool flag.
> Wouldn't {READ/WRITE}_ONCE() suffice?

The flag is ordered against node->nid. qrtr_endpoint_post() assigns the
node id with qrtr_node_assign() before it sets hello_rcvd, and the
replay reads node->nid after it sees the flag. For an endpoint
registered with QRTR_EP_NID_AUTO, the id is only assigned when the first
packet from the remote arrives. With READ_ONCE()/WRITE_ONCE() the replay
could see the flag and still read QRTR_EP_NID_AUTO, which has the same
value as QRTR_NODE_BCAST, and the name service would then send its
announcements to every node.

The flag cannot be set under ep_lock instead, as qrtr_endpoint_post()
can be called in atomic context.

> > +		to.sq_node = READ_ONCE(node->nid);
>
> There is no READ_ONCE() in the earlier read. So please justify why you added it.

node->nid is read again here because the earlier read can come before
the remote's first packet and still be QRTR_EP_NID_AUTO. That is fine
for our HELLO, as qrtr_node_enqueue() takes the destination of a control
packet from node->nid itself, but the replay needs the assigned id.

The READ_ONCE() is there because qrtr_node_assign() writes node->nid
with WRITE_ONCE() and the other lockless readers, qrtr_node_enqueue()
and qrtr_bcast_enqueue(), use READ_ONCE(). After the acquire the id no
longer changes, so a plain read would also be correct. I kept it in v3
to match the other readers, but I can drop it if you prefer.

> > +		qrtr_local_enqueue(NULL, skb, QRTR_TYPE_HELLO, &to, &from);
>
> What happens to the return value?

It was ignored, and a failed replay was lost for good, as the Sashiko
review of v2 also points out. In v3 the replay is retried 100 ms later
if the allocation or qrtr_local_enqueue() fails, without sending our
HELLO again, and it is queued under ep_lock only while the endpoint is
still registered:

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

Thanks,
Joonhoe Kim

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271130;
	b=NWpD4yTyWQ5XC+fGbc45PgvC2Yz7AGrL70skKUc25e/neXUK+S89E3lAfz9lYsE8+gc+
	 ahABy1KQ7Zl32WbyZEwhf/qVQPIoIeikJcJg3ZcQztdp8E4+OnWodyYiN/W+RdL+1p/IN
	 HBxGKpT8jgBR/HaaGUZ57sZ5yvgsfsvm5RpGmegmGEOdJUcDv2qsHXg9f6r34EwCNtNDi
	 yLBP+BoO+yvDtHedMRkxQxN/TVVVmCOD4oj5vcGeQTwTH6TjQVjWGJeUJAo6nUfuGMp50
	 L7cEpZ2/pQaVwfVVVRkRnFXcIBAfc3nfcT/uCf2rp45U1eyKsorSlNIAgbRU/Oiw3zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
	b=hUXsR1Gs2RG3PhdpIFpiaK6mdXlwewinhqz6YnGmwybnDZSLKtBSnnP+Ur5Lp/qtP32k
	 zC5KlkdAST4n2mLJqotCsQn1s7BbK0MU01E1YUCmyx1Z+hDD/Er03h7iTznSLD3ZaDOWD
	 ylXr4VZK3K5wfMr1C26oq1n94J4Z6TunPBt2nIzM9Zf9zFkQbN78847AqUwn3HYAA4Gmm
	 fJaovUt8CfuDh/vgIRoadVh0Boyc6wqKg0vvyDVXlhPOJXl9wHmBIZIoTBgBAJ+p++9+p
	 I9P9Jlf50ZdiWlcZtIwxUGexgjnplfzE2tDkXbx/3jPcESv3a0SWl4r0fs178VnZNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW1nzIQi;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5DE606A338
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5DE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW1nzIQi
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1846bc43c28so2278868c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271129; x=1793875929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=XW1nzIQi4H3OuoU9THImPRKoMX39uKEa2/UmpkhhWUjm7EAeJ3Adb5D6ulc47NdL9y
         PBfxdvqQykobWATR78jKBnTxW2BoqtbN2mlkcu/98Eym8KoX9Hz9i+9GPgdgUdvRx7nh
         Df8q5C3sHVHkDmxTFfIgn/QjWjPSfh098Ib56d6Jt5QRw/nxfTdRBiuaG7Z56rNy7qdV
         /K5qnV+0RaS2HCFdHzNMmxg52y3rkcTCndb9slcH/OoGh/hfK6G/ishCVpFATqOTLX6Z
         T1Bwrs38pdoI/4HR185QyfFDn2AdJQjx8WjZd4396IhKTqfMY05x07rkO2m8F/jHBF/U
         6n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271129; x=1793875929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=DdOTqp+i2xIU21rcbXowrO59tGAi8LAq4BgMhzbqgQFaWawnelsFYBUo0L4SGuCOnk
         2MqtLNzu/SxaWqjsOS5KoW02olDxcgkbEaYIkU3ORZompzeh1Cpc/m22vu/1I68OeS/0
         MUX3SIMFH0IogkoQp01WsqGwQI5pxwcKFV387scQDMPRbrq1s0x0tuWBtkqeDu1kHr49
         vgKFdreCsMY8KtXSwKc+qzGKKW+P5dYDEYmhzELjXefmvjKnwRmAQam1LVNxC9FTVpND
         qur+usjIPXKupUst9B2PSLyY9239AuLZI89OEtSBs8qqrpfZImjHv+0ou0v0zbOYKhgo
         /bVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3aBHBpLcWFGtkVo/B8UweR0QI5jl7+Bhzr7XBhSTbln8Ifc7fPXIn/nPyrAQ40Jzul2hKzNv0agXWLix1@vger.kernel.org
X-Gm-Message-State: AFq9FYKFEQjfAvp8f3Hfxnc5iEMpyyx6tf2eNkaDoUxKG2GbP/aiWzVN
	Phhe00to6M6GRUmBTQK3cbl6Tm8M77/hOhz1tKCgNU+9XsmJA0Vj/XK2
X-Gm-Gg: AYBFou3tL96RXLp+B/Ex2r6ZBDy43zPKKgzpKx1gSW+XVyjY4dhSE+Yazxge5/UNrcM
	QoZZiwGRGQ5RizLJ+AWTSVSwk9GvgEUfCHhiCYROiuTm1Ff9eD0rBEi7gqsUqI3Ak9QMJHci0Ok
	bv35PyKj09kASPHm1lqwhM1iN+V85Tc/MGRkHr1Ktw5RYMjou7lASn3dbaNwNmxlVfXIHnCKgkD
	RvmoyI4KRqwXta9PGJ0OBf9kGgFrYeonBxffiu50oah3+uMFFpUWFHR74ANWgUx+0VWo8n3SuS2
	eV6Yxwj0HxFHr9w4+yrmliRWFpfEhm+U3pjI/lBmFstBupV6nCafHespsIh2OCwJI8NcsKfN32O
	PY4/+8zlrjKXJ4TMtW6v0ftdCSZCmECc4If0K0MJODaYY4paK0xSxRhEJUkzDN4vOKQEvu2+bIm
	6tCbSparqU2ROS6A+aTOaZUEXDIEkQik82JJxdI4Zxjf8rTpwbC9bhfX++G18Tg597mDNZsbSZM
	yGtMFJz9Y/xqW1xC0DlP0B72+iQY9goRZ2wEMPZaDpEabBeE81SMVTV8GzD0hR2LNr/seHxwlxb
	Ju5C49EdiwLD4BVnZN/td7hBihsHghEeBGp2pOLU2r/OHBmyPDFe6mu0vo+7zMsXLw==
X-Received: by 2002:a05:7022:622:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1a6cd3a116cmr8983973c88.12.1793271129261;
        Thu, 29 Oct 2026 03:52:09 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm14304398c88.19.2026.10.29.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:08 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:52:04 +0900
Message-ID: <20261029105204.2577-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179303637610.3134.6464335759134048296@kernel.org>
References: <20261022163116.1042-1-26rote@gmail.com> <179303637610.3134.6464335759134048296@kernel.org>
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

On Mon, 26 Oct 2026 17:39:36 +0000, Sashiko AI review wrote:
> - [Medium] In net/qrtr/af_qrtr.c, qrtr_hello_work() replays the HELLO
>   once and never retries, so a failed replay is lost for good.

Agreed. In v3 qrtr_hello_work() reschedules itself when the allocation
or qrtr_local_enqueue() fails. Once hello_sent is set it skips our HELLO
and only retries the replay.

> - [Low] In net/qrtr/af_qrtr.c, the new HELLO replay in qrtr_hello_work()
>   is not serialized against qrtr_endpoint_unregister(), so the replayed…

Agreed. v3 queues the replay under ep_lock and only while node->ep is
set. qrtr_endpoint_unregister() clears node->ep under ep_lock before it
queues the BYE, so the replay either comes before the BYE or is not
sent.

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

pw-bot: cr

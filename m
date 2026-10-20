Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502653;
	b=jgYkyZ2Pmljt28UyMaTmsoxdSS/YAS7Gde2VeH3f9te3wgRvuUa4xcli4WkVJyOQEc03
	 UINxhsxR5LqYJdOGsrw6eZSct3igxY35SbZW17klfMRSwoQMaojU6GmbKE8vGrtWm7JvV
	 OmOHvRphjJXLHhE2JGrzNHlA9AQO74FcIDeeMfXYKsWfdJe14anvCOMbxWkzVSbJf0roR
	 OplV2ZDNQKXF2wMbPxXj1U+oNwT5yUKjnbfNkb9JAkSMVOzLJLRh5sJM0Va0zAY6hB2ez
	 xAvAlYpe8PCNVfFzXA1hvyf4PVNZJgbaWxLMtY+67jTyW6/HzTZ3GpYp7XjT7XVTPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
	b=ksP+GujwH8DE4Bcd9SOmSG6VnBSOZMGjU7pAZOj45t/TuP03mNOLcnDTjqLEU476F4TW
	 Kt3bKEDTWuGtaY7aaqOc9JlwSlxdLPg7mX//fhMDnIuuePXlGxHqE5pftGxIAUhXFlyr2
	 jZzAgCVDuHpiY77iL9OcjG3X5MSjDgqrpkbsh7SUBm4JEdpg91I3OLDYx/HpdIPnr6nCN
	 GZRSxb+g5r+fv9x8cBJYNQSOF42E8Ng3yfHl/i6mfATLxdpRmBjhaTGr9eCk/vvHTW+Va
	 jN6YyyPCGHNqfUZQYXAQO4WSeDL8cJXKPPU223rVh1CAm6PuPCorFMOjYp8Cu8B3pqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWJBmoPi;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A0606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWJBmoPi
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2831534a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502653; x=1793107453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=EWJBmoPiTzgM6kfVEl+EtqoPCzocUVxgwjVlaA9tBeRdOEyfbSlWaNCHaymhCC7hm9
         NNAwloBqdpuX2iRcQvH8EPAUjQix3RolaxQ9KYXKNvACAg2VaeOKy2DMg9FENftE/PCG
         UoCnA5vpsfMfL3G0dO9R7pGOCb5m2tulus4DHYsvrYFcuFOh6E4PFEh/WX5OhgOm7fLj
         M3YveFmIqZ5mvjjh26FdsZBGx0o6t0RcIz7IboKGT0ccfIsh8zSQBimMVjQ28glI4sSC
         riAyJ/C+tcb85fiNGCNlmlht+s6OH97nSzoe3ih8jTP19629AfQ2wV+wzsTOjNHfXJQS
         kv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502653; x=1793107453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=hjbKsX73qwbuHUt0GUp+GweLJD6azKxNqSFLsd9eVAXI08JHvBunwt1dPgylMyTw+x
         j343xfS6B8P/ognVP2x2ZAxPdsOxmjxpyo0yUJ9OlwLtPDbX7oXDtGWggXLDMJRmzfjw
         k0qk8MKaabV8CO1OE88HSNBq7SxW1b5p/ag4ce8WvqMovu1/4tUuVpX0F4+r36mqUzDs
         xhgGDVMGQcXCI0cTDtjxCUZFsQK9KkPbG6A/UOf4BKZ53d0K7b7Kg41oHtUbHNhxRa0X
         UK7v3XAXvvikLACEPTjRMeVLTBw92AOPDqbNKgsbypWyvfWWrheTLQNJSixEpYOeDU7h
         RCEA==
X-Forwarded-Encrypted: i=1; AKwUvBzBEQyFL5uE2729jttMI0Bu4j5B2OM93CArKz1539UT4+KneeucNYz8iFbu1fvCPuVFVJ4h1qRKgFab3okS@vger.kernel.org
X-Gm-Message-State: AFq9FYLoNPO4BlGfGszuzKXHnCM5IHhxI8T05Meg+cBXjSfQEnqjrwG/
	f3ymlRPDjwkowex8H4ePw57m3xVFPFhhfoHO+spIa/UnnbJ8H1i0I3Eg
X-Gm-Gg: AYBFou0BgQZfcblyMGnckzvzpdx5tm51AN5r1GJIDpPZFade4+VkvXej5lyTBVQyoce
	k16jSuJVzNDKp7E43WnubWNM4jny3RMXOYBk3GMHovYeCW+3Jf8IUmb5z7nB4RgqEX+62PfGN/r
	KQEcRfI+W3R/NnD/5WqOX3EE0rtGDsOyUiRgFGUqGf2CSmEtTTvn7hwpHprQwDR1YGW/nPgCi7A
	tdog42QkB2Dn4pA1G4NMpLUpgr+Cq5R5FURmxdxxJwpo3AqkT5T7c7DcgolQJRGyudu8Bn3ccsH
	qBiiOapQPUj+LOvJlBFaL2fKAMB5yK4BJBK9BgHmUQRRzn0vNI+R3j6tfQFvBx6IqxbavjWXtaj
	AGqrZNE7OpmBzpOxfFhr5Yp5FViidvCxLwFqq8Cij7kAzlp3McoHRdz2mv2Rkz+aV5F8bX9Yxs6
	thhxIW+sfJoB2OeS4rL7yZsjhUhsW74UEqD3y7GLAgurhi/CZPIkyQ5EU5arqdSj7zDWah2Gcu4
	jOo7uVTm4S2uP8=
X-Received: by 2002:a17:90b:4fc2:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3acef5700abmr10872896a91.49.1792502652945;
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60be992dsm3550434a91.2.2026.10.20.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
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
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Tue, 20 Oct 2026 22:23:58 +0900
Message-ID: <20261020132407.968-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <atLkH_D2JrYdzacx@debian>
References: <20261016124600.31-1-26rote@gmail.com> <atLkH_D2JrYdzacx@debian>
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

From: Joonhoe Kim <26rote@gmail.com>

On Sat, Oct 17, 2026 at 09:24:38AM +0530, Manivannan Sadhasivam wrote:
> This loop is going to block other nodes. announce_servers() is called from
> ordered workqueue which only executes atmost one work item at any point of time.
> So if any other node queues command while this loop is running, it will get
> blocked.

Right, the loop holds the ordered workqueue for up to 10 s.

For v2 I'll drop the loop and retry from a delayed work on
qrtr_ns.workqueue, requeued every 100 ms while the announcement still
gets -EAGAIN. I'm thinking of keeping a time limit like the 10 s in
v1 and cancelling the retry when the node says BYE, but the details
may change once I test it with rmtfs started before the modem. I'll
post it as a new thread.

Thanks,
Joonhoe Kim

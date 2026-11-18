Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006087;
	b=FkyOJ1hB42mSKEzTuUShylIFsukTlgh7p0TMmAkOghPa841OLgLHeG0I6NT4QXOvFRpH
	 vaiTNnAvAC9QV4SRL3syEEzegKo4udTnEvmyQ4SzuvR653VcWrqciFlX0QhzLgVaOQ+qg
	 1PfXgW6r6PDjXMeBeXbtGTMA456Qwoaz4UiTlOHhmjQUHGMRFvRKZcVccpKSAX/E1QdjL
	 Js6VftdB3bIRK0G7j9GN7cBau3Ue3/fSzREUaB+7zF0d2D1tdQLYJ754/Bjsh7vLaRzZx
	 pi6l90BB6a52LTS5I1y++F8TAG1344xh7WFutuZI9UrryQ6NLzBXjI3d02MbAa0JbYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
	b=4w45TDW9/fTv1VWg0Tm1++GTjPJmNo0IISRACvKXDIiwbx/e/PlqJVQgzCgqOjrMwl7a
	 HDd951zVkWD7mgLYnq2L++8xs2mkd7CP2EPysKLGsuHPXatBRqdxIPCbyPp9zFS3sM8OO
	 TS4DPVIGE6zG85MG+0wm2iB+K7j8q56Ot2IJevqS3KYwud8lfJ0TGOBZwjZoW6ytB0PrG
	 4Xm4KH6Z9iAzMSOuNQ/9ed1xPpshvXobKLaaDyUxM+OkR1ai6r/bUWIdUKi7BPJUdaC1J
	 +Wb4E8EQlRvv7zBMEbPcrX3202G9xeFDZhRKvlYdyqJzvZGdG9qWR/txKVgQyc3V5kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdk29yw3;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74B606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B74B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdk29yw3
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9ae391a05so5301595ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006086; x=1795610886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
        b=Tdk29yw3/PRUl38+VNvz9P8HeVNbv/SXLOtLIZdOIz0pPeo9ny+AnQ0JTzs/oGlqxD
         EAJG0Auya2snuQ5mfsVmIL5uZXeEX3e3odvhDwwBaw01oT/obzyGhflt+2xwPtpjqxuL
         6CGDnwVPGxZ2C11PGN5I7/YS0x+41+m+fJdX8mZtoHF2uWrj1zpbo8nnVNUa0PLlJhFK
         0F789cia/Cj5tXTZF0A7Sj/d4dJzoNDY5AUtsRregNUm3qp3kupQO1s/j6u4xRf0gTgs
         9RCvCauILyPsYlN+dtT5ExsFzLu37Z3YrGnLDBeGa6smWRYWP60/hM+0mmNg+ilRvPRT
         5FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006086; x=1795610886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
        b=x35gHstdQP2SXSG1rFuRzsRkgIzF9wuaogqjKCb+fy999RWEBpahW6zv1H/zn9QBTy
         c8s+9OMfijfwckXjgqQPrJLXrDq2JTulmsEarfH1KXrL9esbG+Z0WdQr9gnO/MLYZZen
         OTQBju5sXYoVEfrCnB7U0BX6BxdpWPs3nIFcWT+E/hxBty44S/+0LD0BCxbgacZVSrqw
         6JSedSQP48jXuNi4YZHj5pgNmtz8iL0UyBIkACFr82khvK+OFlUzNGTX6d1HqSo+xHrk
         RCApbq2uKiD8BarxvrySiOTt+/T1/AWvYQ2OpIgDst8+HSLZBJoED4fyMiJ1SuzV5uwv
         ci3g==
X-Forwarded-Encrypted: i=1; AL+hErH9qJ9ps5EpuJ9YKNuEyYMH9uLTNyizPhiV2GDfc2lermyhi3f73Twx5KO+JVP04PF0ULtrwrZZhKVqOkuo@vger.kernel.org
X-Gm-Message-State: APuU4Z/ja9/bQbWUAgxdEG5/gEuAayf0jcM5NOroym9LxpW5k2txUhET
	RwtN9IL/gfIzKRODxrcfWGPoZNWV1TQFuhKqzMY+C0+SHG9EpTH9LheU
X-Gm-Gg: AZFdTZeF1LM21s3/YI7p58mYXq2ONS2miXZ1VZzBXqeS2nDBNll0lqsZS4ELsC+4hKw
	lu7tvaSRVJ96meZtzLPNamKGnPYqkRSXx9PqVSDFLUo1Xnt6Hf3LPswr1vzbV+VXKa1EKBP/tk8
	n4BGxlaM9xHYF0teR8zuVOH8N/HlI0j18bMr/tq6vKOow7jdmk8WR4xAHznGO0EB9YIxba1NmkJ
	MReIVYxI2IRIbNWvZsxH8FMakhqUiUdmjJXYO1Xt4B8cNgJpZw7ON+gbzfMg+rFCrFH4897m2By
	hh/QSzMys1xz3CnItxBKflukqx6Q6yPZGpJlQwpUhh0L8mTzEXJXrY3YIiPuwbGcgwSgiuFsoRF
	CQTrNNwVE+yfNw4iEpgtNRLf9bGxqIQEcOgv0lEJjtlxz+99/Mxoi+YYjFsIIp2suuvRulCJup3
	dTMDgjZ0lziCP04fn8KEWnhUJIaurfLRsmWfoCsgJZPFxN3wMp8bw+ensY1F7610eHaduENKo1M
	cyfTf2VKVy3IRefA9hDlkPD6ZjTLRA02WIxX95RAd4vdi2tKEChnWr3EvckxApGg+lqKoz3YVaK
	vLfg7KwB02gIEwc06YWv+0td4piGGzunvggoDKNToFz+7YaJtgEfmhVF/Hg=
X-Received: by 2002:a17:902:cf09:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2eff75209famr17213905ad.23.1795006086041;
        Wed, 18 Nov 2026 04:48:06 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm12775795ad.43.2026.11.18.04.47.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 04:48:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	brgl@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bgodavar@quicinc.com,
	lumag@kernel.org,
	mka@chromium.org,
	markus.probst@posteo.de,
	shuai.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 2/5] Bluetooth: hci_serdev: Track whether the serial port is open
Date: Wed, 18 Nov 2026 20:47:27 +0800
Message-ID: <20261118124727.2330-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179484638195.54009.8903355214693287470.wcn3950-poweroff-v3-2@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org> <179484638195.54009.8903355214693287470.wcn3950-poweroff-v3-2@michaelmcallister.org>
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

Hi Michael,

The hci_uart_close() hunk touches the quirk branch that clears
HCI_UART_PROTO_READY and closes the port. That branch has a separate
race: it clears the flag without hu->proto_lock and closes the port
without waiting for write_work, so a transmit that is still queued can
reach the tty while the port is being closed.
hci_uart_unregister_device() already clears the flag under
percpu_down_write() and calls cancel_work_sync() first.

Your patch does not change the ordering, so I think it is better kept
as is. I will send a separate fix for the close path. It changes one
context line of your hunk (the close call), so it will need a trivial
rebase on whichever series lands first. If you prefer, fold it into
your series and I will send it to you.

Zhao Li

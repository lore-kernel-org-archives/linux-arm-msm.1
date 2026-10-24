Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827212;
	b=Q0KbPh19RJugHNQqRJxT6iSSLtpkNY924poVKOvor4+uCMRMBPdSAuL4JSLiYqwDzVMt
	 26vbYNaOcTHTRHlAod3hwaZzYmJ3gxpnPuCjR44dQQXrwhrZxAN7XkYimxsvx/VlAnI3i
	 yLV1iaudnqBCNnVxi+/j2piaPUSVe2fFhW/cahsrTBqvwOLn/l3eNm/jRLtvul6dk4YVJ
	 avysRFfN+eOMaPHFpThpQ6zKBIcl1Xpzqirbr1vN7Dzn5KVk8lsZsWJAtOypoKcp6q/YK
	 AFzoHyI3OazUusq3JVc92k5fl6rpFWsHneqGOWBkSBnUFjwYDNEDqKYTqZGYMoxhNLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
	b=EjowpNbncc33YtQftZbCc/3OfRIcL17yAi+MTENZjKkVlFJf0S+2JUZ51tswSm1C402D
	 sW+bCIMjfqviTy4LEL60SJ+sRcAt9mnBkyYIKKUChwzdB4Wg+amoNJzODxuXAlVjBf2rD
	 ptg9N8466DR3sF4InW+dZHI5SeH5UQTpNCeWgneVq9dcurlPMwnUk9nluQoyimDKfN1kM
	 BWEVXIjyHC2tXL5NEtxibp2+8g/8jGhrKQS0O53QJFG2Z6hdpfaE3NJsz18kvlW+nUb98
	 NfbLPVVFDTFpeu7CAMUyuvdNjqEekm22T8xAGC5oRNBXaxQKziL2HwV3FLfAwvWyTVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="h/nhEG57";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C922606A325
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 07:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C922606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h/nhEG57
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-168de2167deso10255c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792827211; x=1793432011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
        b=h/nhEG57h+Lg9OmydDnC/PAhyAF82HN17Hdx+qIDe2YpQQU5kl4a2iiwUz4tzpE67O
         HuMCnjk/TvX5Q+2ITw5ISZfE03NVA9+Te3+g5F5iSELzfkOgpefeB68vPuQliqcp7VLm
         OPOPnYTtexrTe6z87YGKpZmovoPlz3f5G1WDLAZ7hz+76BUlhI8WHS9Qd2qQ1SOK2zL9
         zf3PprR++JukjDdlSh2ugTqPCmfYaxROhxdhvm2/hmYqpgIPpXKtWbfNqPMmGpON2XGb
         Rvdr3ecMyK0ObGDb9DSe15Yezgt5zO7laSJWBU/X2tS6lTdFow+5qAck3ZXeLDxB6jw4
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827211; x=1793432011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
        b=chbN+bKQYRMFXg/BxKt+miaRAcczoacSfjx7qdpz9J9kinupHiH2aqC2yv5QfPcsF7
         afT7hrNR0nyGhEJ+qf2XxdfXG3VxN7ijJzN5rhBAyb3Thy4kwUsQhM2GghFmkug75EQa
         MW7/nA3rfdwRFhb4znBlzQCCpLnBBRMkN19XHfOYn9ySi6vxULoUxOBYxcPccM8kmIg+
         ia/cgHIKRgLaNPT/RWTU1ixrB7m4xXiwCNPUzFcpfMzE3nD/108beYzdKDUJdB6S0fjH
         k9cUmaeL6IeQflVqvL0pEoJNPmb80dEkL/DKMzRvbMIFuzSKbWVi2FUICi7m/wHMvHB7
         YN8g==
X-Forwarded-Encrypted: i=1; AKwUvBxW80Uw/IiWHr/+6hwKOoSJTM0p/8EAtAIuEpRFe+EAfvmTlcUyHHAjW9d9/QM9rg2luITMmS9Bz6B1DPlN@vger.kernel.org
X-Gm-Message-State: AFq9FYJxQvJ/chVajp1dfWPdDkIMIvXKXhHo9k24O47AcyP1/xU9uXkk
	PxhCLJG1eilEKvWDelhxBmKMurtRbBp9l1YXbtzaWd5ptrP4ZnBDuICA
X-Gm-Gg: AYBFou13vo6sYgz/8IPS4KUA/c8fjiQhRlE4XZQDiHCKUJ2GEU8FkBsSqzIJTU+o0Zn
	f0pOz/rZTxUzjahaQed0BRxxlyLrPmvV5Br+ZU/pJljvy8lMGKU7QApJp7nMTq471yK6x6ot1H7
	GZF+R+078uhww0v8ZT6iAcyefP4AZbcAIAoP/SqdCYYKxxt2KiiMuais4qBQOwE+5xuN0lzzSDw
	QygHnS7x6D3QagbKZKkegp0UzCt3a9FP4E6N0IlOYugTSs69bjB3OSSsX4Kf2eOGGxg/yWB5zxf
	WKKyYhXjLMt3bGMVy0MU7xIj32jgDUTyeNVyxWXDnMEM6F1fsD7ltI8EsTvbqTqn5yCOzyw3HN3
	4M5Sxt6zreI+rupT7xKfM+PFlpaOkX2s5LYrHBYHa6VWFEYR2MfLt6o2SRnNTyq8YV4m/Ywa60a
	n49u0m//ZVp4k+IiKZcpLw3XcYBG7DS58ZN8EgcvWOCmhTPZfBu3uAMYTep/+us9pGG+R3OzZAw
	6wcKuvfi0yzOaPxYFFlF2WODBUQSFR5z9ylQMtq41R7zQyuXqn22kjjPstNVyvQBhgDn1w=
X-Received: by 2002:a05:701b:4516:20b0:143:5c2a:e45f with SMTP id a92af1059eb24-1991b1423bdmr2509746c88.0.1792827210988;
        Sat, 24 Oct 2026 00:33:30 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm5402319c88.10.2026.10.24.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:33:30 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: kaipeng94@gmail.com
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v5 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Sat, 24 Oct 2026 15:33:24 +0800
Message-ID: <20261024073326.3018902-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023180513.36417-1-kaipeng94@gmail.com>
References: <20261023180513.36417-1-kaipeng94@gmail.com>
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

Hi Kaipeng,

Thanks for v5 and for the detailed notes on the eUSB repeaters and the EC — those are very useful.

Two points from my side.

On the naming: I'm fine with the model string carrying the retail name, i.e.

    model = "Acer Swift Go Pro AI (SFA14-11)";

For the compatible, though, I think we should choose a name that can be found on the hardware or in the firmware itself, and "acer,swift-sfa14-11" does that: it matches the DMI product name (SFA14-11) combined with the family name Acer itself uses on its support site ("Swift SFA14-11"). The archived retail page lists the Chinese product name, but it doesn't show the device configuration or images, and in practice users identify their machine by the name Windows shows (which comes from the DMI) or through Acer's support site. So my suggestion is: model = "Acer Swift Go Pro AI (SFA14-11)", compatible = "acer,swift-sfa14-11". Note this is also the string quoted earlier in this thread, while v5 uses "acer,swift-go-sfa14-11" in both the binding and the DTS — could we align on one?

Second, please add the machine to the QSEECOM allowlist (qcom_scm_qseecom_allowlist) as a separate "firmware: qcom: scm" patch. This device's firmware does not accept keyboard input, so the EFI boot order cannot be configured from the setup UI: without QSEECOM/efivars, the only way to boot Linux is to press F12 and select the entry on every boot. With the allowlist entry, efibootmgr can make Linux the default boot entry. This is the same kind of change other boards carry, e.g. the recent addition by Srinivas [1]. My series has it as a third patch; I'm happy to have it folded into whichever series moves forward.

[1] https://lore.kernel.org/all/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com/

Best regards,
Jianfeng

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713897;
	b=xHhdzPjLUTZCwJ19Qz70R2pqPH/t0wS5QciL11nrwPNt2kqLhrPsow0zKbtjRS9hcyUL
	 G4gmcOJo5fOSrkqUWmGSA7MagCMXBZ0GLARbAsJ549CFtLEHplJb3OIIU2e6DntWJ943A
	 OimjsUIfx8t8yfq7UgaCiwRHPCmC5KvDSU9tYmdGfV3XftjSrxCN68A5ook7R1Sybu9bd
	 R4XfI9HXU3cWnxmYRVJkO1IUMGgb3QTNoc5oeNUtanul6pdoT4NlGlmNhUlkr5U0BSVhK
	 o1sY37Go3pUew7FZPcIsGde7dLQSzeQP8Qg7nBeWqxXdXOzdTO2kq/EIDOh6nTS6yQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
	b=xZuDi+txR9YP983wjklzDvZfcOMA+cfqBwsjGZkpe/W4xK3WYHPk03MTi0nxZ8qqbbHZ
	 eyqjuGQUK4LSBGV9K5qh/tbRukw6aiwnRWlB0pktUNN6PvATA8lxH+qco1FXtgT/Sl5bm
	 P8IIksvwBrMW8mzaM2a7MuMCwS8DOhYgKmWbocx5kd4WknHDkJw4YJUokRE5oZHP5ce5f
	 omhCSlV98seu6CJkgSLRLQRII3pC40jqvSrRIZK3JNU8UBSjHa+R0xdlKce3yIEnRNhbR
	 7cXaOqtQpqeJuleJW8uHzkWd8MySX8MjL2PIMEnTSPfLyB8xTOLmUNikJyzVyMVNixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2DF606EE8F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2DF606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so4589164c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713896; x=1794318696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=mIBDzcKJhns27qPQuV9fTSNMWAJy5I0qPLMthCC9g48zICpI3YpMKO5EHSiKnVe6E+
         uxWymqV4VpgPfeX6fTuM7YjQlwLhf7OellePlZQDhVjzOIkn5zBPbqD0lFRGhVDkVMFw
         BuRy1wjXQa5QNXEphT1gRs/kPWjz9RByIvqB33FtAya1PAw+olxxve762cQvyU2KMm7l
         9f8aLszCmdt6evvxP3UVh5hGoIF+iHWEK43hLl0KmIvzqCKg/vzbhKoyuKcZ6yBSuqFU
         UB0fJ8QgGrvUA537lqglqXCKvHYVqwVnYb6pSZUcNGGmq/Iafdu+fPNjLv9CrG4JOe3s
         60tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=atq0N48qAIB/1re7bxSImefttQeeUt5fxNy3sKFOJZM5mxXMNfZJd+cERiVSAInUSe
         btqsMnrW5j1lpzRymSYTT6lJebcJXWt25ktEvcsj9BJU2+nZJ73vg8TTNN/3a9eUFJj3
         3ew4haOXG3Xs7kk1iT1y18Yo/yNGvZmew2AVeBQE1qQEv9wDu9mYcigfbYrLr/+xgXqh
         uVVCubmlALs2MWB9smlDrTJIV5ce0D480M8xpxuEZXCdWfaID2lcTG78Edo18rIbuX8O
         tUCkM9e6f9q0tTEABDHTL9g2g798AGbuBCGn+NlnzZO5ctnvWMr9oaEGXa8mwNDQQVAg
         7qfA==
X-Forwarded-Encrypted: i=1; AKwUvBylfCXqjr2w9/BMwsyJPyR355XQ6WFPW3DaffWOjS+WueA0vJNgcmTHTEDK98alSEnQVHuLAQ1iEiEbG8Fw@vger.kernel.org
X-Gm-Message-State: APuU4Z9JMVRk/K9GqNJ8WG4OX5GDwx5mYoX1D9CxWRTnixAIGYfHEBLH
	rESHRyzk03nRwzD9Z8ZjW8pUsfvCrZKrC1o/JEJ0G0E/u2uj0igMk4HD
X-Gm-Gg: AYBFou33Jd+Kq2gqHbqDGyl/81bbybvvdL1IX/XiHbRVS7j/WXqKn6YK0j+xUR8GBE4
	poNExb1HQ8CStkUnt0viE1cY4MiZCnoOtm5K4tWubVccBcdil6Ej/9ghMB7ItFy67mEy5kDdCpP
	MDsEvxWXX8NCPWc2AGdKCUWNtjjeKquyLfmxa9KiANmazSVCaHxcpaGL+OwRqo1CtUaX9SOoGeE
	Y8DlZXe3V5Ehttg6hlaPS+1Zwcf7z9WsdkSb22KiQWdsqBnC1jhvcEnexnaWeLQJcePYHRjUc/h
	k1e5JR+J9GxP+d5J3tZ3qL2KySe0dvOniqLYoOuQRUv3YUe+ydfCfQ+5948G81Vpj8LZvA7mIVW
	+uLiDCXNbDCZocTw9q5WdUJBtCWiPCDAd0o9HpMkp+2Igwm6mPStWNWlA9sFudy2g/NbRkht1iV
	Cr9mFxfc0Zwpa2oVljOfRaoX09qgpSj8TPy3RBNO4SIwUjtVWg0iSqfHqGMiL4rBlbz+L8ZzGxw
	8DOLa089gnWGFnLWD3L5mGnULyLmR165gId33mbZFngg2MphUggLNFNGQp/gPYyZn79zVcCgvkX
	+b8P33ySX0ZrWyuWFbFtNoval6b4CG6oHZibM7MukO5O
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18652995c88.26.1793713895766;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm41742846c88.23.2026.11.03.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:51:35 +0900
Message-ID: <20261103135135.1977-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194270@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-4-26rote@gmail.com> <sashiko-outbox-194270@kernel.org>
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

From: Joonhoe Kim <26rote@gmail.com>

On Mon, 02 Nov 2026 22:15:59 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does adding mode-switch here expose build and probe regressions in
> drivers/usb/dwc3/dwc3-qcom.c depending on CONFIG_TYPEC?
[...]
> [Severity: High]
> Can enabling the mode switch on Kaanapali leave the controller stuck on the
> 19.2 MHz UTMI clock after exiting DisplayPort-only mode (Pin Assignment C or
> E), breaking SuperSpeed USB 3.0?

These two are about patch 2. They match the review of patch 2, and I
answered them in reply to that review:
https://lore.kernel.org/all/sashiko-outbox-194253@kernel.org/

In short, the CONFIG_TYPEC problem is real and is fixed in v2. The
replug order is also a real gap, and v2 switches back from the mux
callback. The in-place D/F and missing safe state cases follow the
PHY, which also keeps DP-only mode while DisplayPort is powered. This
patch itself is unchanged in v2.

> [Severity: Medium]
[...]
> Without mode-switch on usb_dp_qmpphy, fwnode_typec_mux_get() in
> drivers/usb/typec/mux.c will not match the combo PHY, so the USB controller
> will switch to the UTMI clock on DisplayPort pin assignments C and E while
> usb_dp_qmpphy is never notified of the mode change. Should usb_dp_qmpphy also
> have mode-switch here?

No. Balaji Kalkonda's Kaanapali DisplayPort series adds mode-switch to
usb_dp_qmpphy (patch 3 of v3):
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

The cover letter lists it as [1]. Adding the property here as well
would conflict with that patch. v2 notes the dependency below the
"---" line of this patch too.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim

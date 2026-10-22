Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689561;
	b=Vzu/bAL4JYrVVPjA612+IOli8HyTljb0xK5sRyuN8CeFMIN94yGPFJVDXIPN61tjBelp
	 yo7UYsHF4OJZGXl0zFbUZRCSEYCyKcRRVUZgXj4qTIdxPTYJ0bWpLU0XszP6f5hEalAxZ
	 /mDYRqFZe3wg4GdsPDlKo4hMGPZMGv9QUmWVAOQBTYusBgoF6EaOCiEG2RV18CqDYlnQ/
	 +Ro/ZPb1XPHhMFxLMfEnG/OV6UvT/hBvWuEAZO0Vm7LJSsgeTDqUnN+qB0XqTqa3SD168
	 6mtDQ/EZDqfkbloZUbTAtUrS8wsHr50SVWzIL8yDuekID8ci4O1xFtXXhqueU3XD9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
	b=f5tYryTk5wlMGaubP4HcY7QYaycfjfoc2ddghrXst9BHn8m6WX+l7t5k888+M2hltiC6
	 WFwvIJT4t2TUitCz6qlclLUkcBiO+kUU6wcybstuhSsKMdiKtF8B8AwnDI09NEUeIeojz
	 8mYo6jpd+AJPMQzqg5/qIUzndwlxsetu3ggJ/sujkH0VvlwL8iwxVMUPI7Pnrc5JihekB
	 WhfgR4wpPw9vpXgIl6CsZhfF92BltwZfl0hs2cbk4HK13a59kH2A/H0CXwUUeEdXAIGtT
	 27EY+TpYW6FkjheIAXCTxpDuuRuLLFR0T4nM/ub4cDB7NAoB7n8NJTDGNYNAGhzKEQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB5606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DB5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so343875e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689559; x=1793294359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=n7aCFcVHIf23YD2ATN1+PCpQCnZBs2/F56exZPhnkZiPsC5VMKba+7OTyZpvruXwqI
         WVKjZ2znsZwvAbcXkSWTastisZkY8WhRgvf1Ev2LWX0R4KPLVDr2bK3nZdzx1DlUdciS
         6+kfF4W1odMzMGdWut7hpELHRSDCouivKghnpk1Lj2fJWLYTUAHcXgqVZ80fTYuwB37a
         s/eEimdQld2nvKHScW/NbxfGYCXKLStY/Q8tB38SZFGh/V4xhGh8GaL5CQL8OZQfJzK3
         2ZglVMVNbmh1JhFIhEf7cVqhDP31ySbUoVPn7UhYhAgCNsigYvVienBgptWGhYwwIcX+
         CCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689559; x=1793294359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=XBhIRQeSujkV7a29I9XwfJor/K5aoy1wuZhO0WK/6KRm8yrGwEsCCNbKh1d21nCM2a
         oBBYlf48KMnvDyoYHdjQkGLZqaDosHQnKFW7joUfV6TfQCYTMylseu49kYCyophC2qRF
         b238ZAouXXMPjU7szsgiZU81P6QoWHeKr20apAmUuh4aiuCziqOdrLyr5fH3R5DzzbMB
         bgnR+8LjhoqjV5oIbbJdJtL2HnveBrojR6MMb6HLKnioXsKuVGZrfoP5+4xr17hdC51c
         B8OELU4ybiKpzyabSgQh3y1EiS18hnFTqB6bmPLqsQCQd1uwp1iTuU2CrEUb362vAFjw
         uVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcYo5cMRoogK/K0i3jQ8xHukxku6OgLWLLNWjWL3wZnNVgSkw4CTt8rOYKtc/YLg/UjJ5xAvgGauN9kOUw@vger.kernel.org
X-Gm-Message-State: AFq9FYIhScD8keRT3vJtReeCCbJ8VLpSFAxH92Dt3p9f3KS7M3nBWUbR
	hGqYqFL9i+ycgYdwmu58Rk/ik1UweHMvtoesLgggBBpvwSW3Lzz9PbBU
X-Gm-Gg: AYBFou2rvaDqELo/WpTTEzjJUkXZMxinPSSJEMBp3+ORwkrUIZiLctTJ7SznhedSbTs
	bK1wA9mFvUKhlfUWaH45SB/cCFmeU0EMjCSgumfKemeXYBvGAyFcFYlhQcT33dx5SrjEVTqfvj3
	C58GPf4dFH2U5NS1siKupmPabo4C/kWMf8+CAHi/jgyDXYS1zlTVgjE8QCbeNh4usbkf85jGNDU
	g/MV8BhMD23IO1SSvu53KhtSgJVmlGsF/EGAr+p7+HasrIeOMkHry59vIXA8/KdFToWal9cTE51
	78PVuDn8+/fnHlUh/mGKa/ALu46pijjbGSxWE+Ui8sZpo2E7zbLfx7AkhJCSlauY/qL4O5w6D+W
	92hsQQrU+ARgK+YeqUxP1iQ9UWiBfWCM6nvN/whqxny1+UZBcHFiAoP+u5nzWzlru6TD+UUMkSL
	AKH4HzFavQyAr5wCI4vlcn4Gd96joKlNTju/NjXmMQ1FTqfdWw6Wq7wfm5konOPrOQfB7oH1djp
	IXccOxWP+2wl3boWZD+uvv2Wv5u0O6FEcAFT4t3ZRzk49kYzm5r3ufF2YHS1SdmAmAInjv084o5
	y9lJ3A==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr51922995e9.8.1792689559453;
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034d740sm11288215e9.4.2026.10.22.10.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Thu, 22 Oct 2026 20:19:07 +0300
Message-ID: <20261022171907.2021-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261020132432.998-1-26rote@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com> <20261020132432.998-1-26rote@gmail.com>
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

Hi Joonhoe, Abel,

On Tue, 20 Oct 2026 22:24:30 +0900, Joonhoe Kim wrote:
> Abel, the RFC has not moved since February 2025 and two more boards
> now need it. Do you still plan to respin it? On Dmitry's question,
> 7d0767c5cd87 took the same approach for the altmode worker as a
> stop-gap until the PMIC GLINK rework, which may help here too.

I have sent an RFC for that rework:

  https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/

pmic_glink holds the notifications back from ->prepare() on, and
passes them on from system_freezable_wq after resume, for all its
clients. For a notification that arrives during system sleep, the
UCSI connector work then runs only after the devices it calls into
have resumed, so this patch would not be needed. A notification can
still wake up the system, if the client's device may wake up the
system.

On SM8750 the series avoids the reset on an unplug during
suspend-to-idle, also with wakeup disabled for both clients, on a
kernel without the dwc3-qcom fix.

Joonhoe, if you can test it on your board, that would show whether it
also covers the FSA4480 case. It is on top of next-20261021; if it
does not apply to your tree, I can send it rebased on v7.3-rc5.

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)

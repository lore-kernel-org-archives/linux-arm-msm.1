Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865052;
	b=CGdExaRpeIQSQxnxoastzbkLC6afXJbhpli6VfQ0X8OlQ8UNbZSxkB4A4qQ36J9CcZM1
	 H1W+8KBxxom1Hc21M51hcj2OcMp/9Up/gDvA8PLkdZLOwiuDLbJHsI59pRplBs4H45/i0
	 VbHOiWqBmeJso16WwRbtnuV2oOP+/lRzQnXYi/ncGTuZ+50ozgMflMPrctT/lvoaSwqAN
	 BmE5M/vuLuLeSFNYTJ7UWLpwK0XxigTS/KsWn7QUDYsjCqpMYuo0fasSFcj5xQOcz4lpM
	 9niKC5fYYSAUvZllv50sJ9XAqEk19tY4XQMWp8nFLBu1qZ/fONO1RYRlVkAr3n1wbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
	b=cbK8EGBqsiOd+69m+aAgcB+S49hHaySXpofhEs2J4jP9gPUDU3AEjqTRbtKvEiW7mr2T
	 HDGW4NzlEIJzTrDGRiuKsquWOurVcPKatjircpgkFBng9/yPGEh1gGusqfkECp2EEdgV+
	 CJ018dllwb5hyoaXW6OYYxaeCMLtgpnHygf4J5lOnYRzAqAk4RvsdHLC0xI+CEc/UYTuS
	 Bp4iomDc47auPcQpg/pivEgHVwr+2biELTCyz55+3xgl11yB/0g0uVyOj4Vyx6dCnq9L8
	 KreyWvSE9WcpWw5E9rDlDCjIyyUpZxmrWvWsuYldWtdKDA0IIr4Nyg+03WlzKIP7qIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88346606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88346606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25959425e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865051; x=1795469851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=ptrvNQMvZGrDGdeRfZ7P/5XmtzRi3+skDCRNqe3eKv7RaDd6Px0lOlXBfXoXIPk6ar
         0YwYpsbidhWdqnfgy48BeWCNSb/vl7QlwrJKBPxuQRGtNHefKMLMVOyClKOYTWkpnQaD
         H+DQ9MVm2XoFQqcWczODgyK7hgRWffk6+5xEPPmve6FV6tMePnKAUBfirKfx0gvpVkd9
         ogFSv4rMz1RhVDyJ8FmPjUM5/S73uz0hqY7Bh2oa1r/jWX3GIUlLSlHQ1Q03tVGQN/Iw
         0wPvxlpMgYX/dWRH0uh+Iz1p3BWaKqy5vSIcO2o/H6uZKoYY6+qKQuFTykeXO1CwuiV5
         vlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865051; x=1795469851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=UJ9GfeLynwPAYgWOzA+AfkX+j/waxkqIzqD0RLOKpiaktYxLgUdaaAacl7O+5AksU5
         UhTkU/aWq18/2Dv+0okxkC2yYVs+c2XCFAqlYqOONzmMacf6kBBNhQwtwrtMhPubxgwI
         BgTGt24yDjHEMJVEq61fsIktbM1ngj7Ud0Xkz4zalUAUyTnjl9rneZd0ufpUrzMG1GN4
         9rCRgLQ3776ARGdL+jGafCQh3K4nqK8Zadvk8HGT8r7wCFXslSyQ3zZIXQ/ma3myz2US
         xk9Z/QSrcDSCDqOYa8G7nqr60Z+w9LORvisHVDNvFLvOMLDfnD0Ec3SWYhaoy4+x4gIk
         A/cw==
X-Forwarded-Encrypted: i=1; AL+hErGVKui5S5m7YVxNnyB/ZF0/bN0Ct24CnV3/ZsuKLsQAp0F+tBDHz9+9yl2nxH2HUH/ob2rM5w4j89ZsJLZs@vger.kernel.org
X-Gm-Message-State: APuU4Z87OPG7YdGFphqrUwZU8deZNg12+XLRFc0fdK7BuATMJ79iLoQ4
	TPNz4EYTPqs3c4b0x3YZkauJvS32YbZS7lWhdhFZuxzljqtnq19VXz7p
X-Gm-Gg: AYBFou0L+fNhqUqTIkqlMewPlaD1R2YTnHUSBlkt6jHdxhVM0sik6SvuX77KshvEc8k
	S/0pE69nKCmsYiumbobeMqptE4G0Gg6Nhjvx+5/IoGeXNfuZMvibO7YjNubWp1YXTf38blJYdcG
	pF9KdaiGur8GTbL/q0E0IysKKeGGOZ1HCGmNZTliYWIcwRTOxiy6kIiO7ju6rFevHDBUrgaHdtc
	myJ+vLHo3KvTENIdS06kQvLZbIoK2MIAj0kg94LKzHkqZGmRLEAmbC8TND4jVC4RQJw/IzE9Smz
	bTME4xjyh/l1r+3TNODZJX9L91y1n6qw1/HO6R6XDpcMw/xOyZ62E8hDJdilgespcbR/MLhRrz8
	C0F4Sjv9zrU/NsI1d3P1GIKOJGbvuKvUKc0o9JGhAqkiDNWl3V8FuSAh9WXOivQ7r0nYTMgtpS1
	Txrfpw+aL9oXnS7ALFdQiKupP1eeqZlRp8XQHkSj6ad96yAWRUUaam2nIWMCswzqDX3wPs3DyXE
	3iMvhpw6zsX/Lqmndl7mBfR0TR+xnUoja5cpPB7utYyojW/EY+YI8abMG/2DBG3pXx8Pldrd9uN
	7AcTfxm9Hjva+5qmCeLT8MPRPzA8
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr187933905e9.35.1794865050987;
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm143331635e9.0.2026.11.16.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
Date: Mon, 16 Nov 2026 21:37:03 +0000
Message-ID: <20261116213703.3774089-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217729@kernel.org>
References: <sashiko-outbox-217729@kernel.org>
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

On 16/11/2026 21:32, sashiko-bot@kernel.org wrote:
> Should "qcom,halliday" be documented in
> Documentation/devicetree/bindings/arm/qcom.yaml before adding it to
> blocklist[]?

It is documented in the DT series:
https://lore.kernel.org/r/20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com

Stanislav

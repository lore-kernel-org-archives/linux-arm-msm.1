Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866433;
	b=11fr9LpYpoUHo16uFWsv42KtjpDoUNDiol7GxVxUa7zrD8VJYT0DLLdoCy43CCAO9g0m
	 RcbvCAAr4anM/Np7ULBN1bVHYsZStHUeZyGKYMlsnYbDKmS9AeIsgcXElYt5AmzlavgPJ
	 W3YYs2JZFCGMAPWynGioyGagPKoItEnFf7y7YeZh4MCzRwYQv1bG3SIUrj4revosrXebn
	 6JuWqf6QVsx1Qgn2+TcJWrBdiujDPehix/zvS8rEF+WAe3WxEp9P0IskZT6Ts+vYp9T/M
	 +xQD8oJxvp+/wq5f4j25slG0UwIV3y16182PkDAemtbFK9aJoYxc/f9NowVLkR0Ac4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
	b=IkhsvC30mH0Tyk2kdRA6EUeva384aGboD4JUPCuNCfsiXf11cZhL4tAmR1A8ObycFTYY
	 QLJ33xEhpURjBA4jzSGxDaj42GsBZRYY91DYuEUPn3zyNSplhaE6a926imdDmJzl7Lhko
	 DFile14MQBOAOJHW4h3C2rd22pUrXoj5T8jymPag37AAZItuR1w+oJ4Sgkc1wAEwgkw9I
	 aCHCaaGgCs8MPFwc/gl+Nc1PNFZGhUuI0BdSDd9RfDtibV46GBFhU//15zwY/qOfB7Sjf
	 BpbJgriaRaUXF47UmmPyK+Ig0f/P9JWPf99PnoKVxZ4aAiuZp7UNT5NPv+JBglpGGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxqm7Hg;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A6606A884
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77A6606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxqm7Hg
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45324845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866431; x=1795471231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=irxqm7HgplpcN+02tbKqEnRQeFtC7Ge5/DIoxIwH4O6Ve1jM9FFI3qn/zjcV6Xm7jC
         t4R5mH8o1QhJITlPinuIUXzYvTsoQXhJZD+9qelXZLRkj4IXjV2s0vvLW2ClB7B8jce7
         eQdnaIli8BZcvDSYFXYD0SRcmL6OgJBYVjzY/FNJFmNPpyOmdNa/oXvxKAhqIPyedeKq
         o8xqMGBvyQnA+hDSEbzI4zpb3KWHK2gaTQ2NxA1jQGhZXHFY9b2sHFqdnOkwK2t+/DC4
         t9yavAvb3b9Nksi+6KeBKJa5TAypibfDXyjG9Z8F6IaHAhZMf/rmDFyoB5ngTdjH2dHl
         d1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866431; x=1795471231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=uQnutoRN+yWmtTw2zPXSp+sLwFa/yEXXMXwMSmNO6rnMkjZ8hOM5IF+O9tdgxkygdz
         Kn8NTnsN1C0D00jU4LD41Tgo+Vb3IiTdyF1XBPknM9gjgogStHpcdZdm9eiUaJYoDbyi
         zRUZOS+ivZxxpn3jPImZp5UiOVX3RWtqh4qTl2rZeflN2rgOwQFUM7jKNy/+py+iBHni
         gJpRGQbKGK+UeR1gttRM9C3ngJGXqOV8EzSXoRItOj1zXlZGHGSwoaDqD/fTSUS/D/Ei
         yqDmeGo53DCrJvR5V3xMDs9PNP+NDO4nDBnszXjGpnlmu3/QaVPYpqxDRKcEQDeaQfnU
         aFVw==
X-Forwarded-Encrypted: i=1; AL+hErFolLJySi0VyS+KHJ+RSvnkCiBM3pNoy4tgKhomjLGD6hbBDoceyvxcW/Cd/AoP7c1P/tGgHgINtwj6Yri2@vger.kernel.org
X-Gm-Message-State: APuU4Z+vObI0tg8E36GtmA1FHqd4lCIffPyQnML9V4LbV1kj+EJAU9/z
	aTHl0laeRK7YBt3mzknqOMqGodmJkYZiy3FFUZZE0TpUrMicik5Y9Br2
X-Gm-Gg: AYBFou3nS8HJAUI3JnLD7tblmMxnVYP0x7lNe/ixBGZR0sL9DJ+y4MryEuVzswvSNgU
	2OY6+kg4baKb25CrjRlZosD9TLqXv8N6Vahwmg49A65vMydjQLiqebC9tFEar0hvJokMy6+7dax
	aCevM9nzq68TVY5MS74zJp3GatyAxdM95q7WB+xIPVUHY3xhxu2RcAVc8B2Nvc9pv8eSjZHG0Qi
	zoi9Cpkse78FR0rnmTBQvjCax+Pz3FUTdhOUCugwY/Zf3SRkWBaYt0kwGIqn7UFgYnaXTHGBpoj
	mXUJmjgfa6Yj6j56ANGQDM9NCbsH6vUgaZQow+IkSiwXJQftsFbY527sQcNgvW5d9C4b/fldZRy
	sjs01wmR1wfjrRMhkf+XnVg5uvWK654Vc6GPXHA6+ODsist2vr3eX2mfu7kcC+B4cxTmhhRymB+
	XGxHWiEkGlEBhbYTB8B0OBVMTT99DDJMSeA85OyWqOXEPiTwimWROXCD/yAMHH4Tgge+Z8136dD
	tz4RYmsPbXei74x+RW5tOn9EPfbtN83MQTRqUXkixF37DxyAnx9FafiEptFk7LF5L9e9sNjgME+
	nQ2uzIFIqqPzLeDZAJASzRXJS24=
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr250487985e9.3.1794866431031;
        Mon, 16 Nov 2026 14:00:31 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm25960175e9.2.2026.11.16.14.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon, 16 Nov 2026 21:59:55 +0000
Message-ID: <20261116215955.3784340-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217738@kernel.org>
References: <sashiko-outbox-217738@kernel.org>
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

On 16/11/2026 21:40, sashiko-bot@kernel.org wrote:
> Does chassis-type = "headset" fail dtbs_check validation?

"headset" was added to dt-schema recently:
https://github.com/devicetree-org/dt-schema/commit/bcb597bbb0c988b490fdd6ed08d023d6ddc538b9

Stanislav

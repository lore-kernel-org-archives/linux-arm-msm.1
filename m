Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528112;
	b=nmaSrCTKVE3zhnGyJca7l4O0tbilzv58NN8c9MMi75jl1RoXYnegvY6S+oIIK/GphZHp
	 aeBJElVz1TCCylQGXCA5ANklElr3OgfanGzlXFxaKgZb9NlkTYImur9J+5BLl4r+LsTXh
	 0TBxKvn6W8t1U8PWOMRbT/ilBDTvP60iBHX16i3sjRFLrxuBRgPWr7kTvWX3pfzTX7rw3
	 7Y0vAv7zTMTvoyob4fAREJ2lRPDsps6PCOs9M8f73kzX3QLOHXZUfqgcPXVqNTsuwMMET
	 gr6krQhZ7N2u7J1KbZIaSJKSu/CxeZbszNbkhD3iK01h4jr0tNT2MDZPQYlvMshdoyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
	b=Cf0RpKe65eK5o6eMF85yRjTFqv4huLMpvLw7eNI8amdMjlaCF9bbKWFFCOR+/S6P6jG4
	 4/ISNa22pH6tStQxjDJcKTldIc28qEdT8vTffs4RkgVKqJftPPyUNlISBCVtSpU21ZnUJ
	 ufVM+YMAQ+JR7qm2jFAsh9YE5Hnhs59Bt4mak2mteaD8vP4qH5Qo8AT6fdem12zC+SVal
	 779XPmp32ke6b6etLOytpbET3MgBiEsOybq+JQKXVkioRjNKR5ywRTY9jyETKdlTLGiSF
	 PuRX902abWvw8wcEsnk1sAd5oP+SnFZiNgYm76HSmMiAI5N4Dpc/u8OQ+tZSX6u4PdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AWU0KiMC;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76C606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C76C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AWU0KiMC
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a9841363b5so641011fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528110; x=1793132910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=AWU0KiMCQabspfqJkK9CfxUvhC0CCjGRLp7SAqZU6Rc6n5torA6hasvYpWaTV2N3ji
         Jw0FYcG2XXVhTr+R8zjSN8ITdr9miql1hKSRtulhsSD5yOJHtwUPEUokoMiJoZEbPaXF
         9dvaVfjIdr705QrfFXguCgF/8R1xzSnxYnJ3ppeIBDMenoU0rzOASd6YmepZFqbXjfRI
         fVcyHLXCVnUDW31COcZk3S2+Ek+9jH10GqvZKz5mPCBdMsPVNLMMKelgmxwOCPJbcVgS
         ZI7zFmtYew2OObafY/IKGvIlvM4FHVXbnQma71ENcRmeYEfC+naiMqtrfsUxdKifnGsc
         9smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528110; x=1793132910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=BRlZ3Y+C0WMxA8HVTcoBLmIA+u5w3T4wv6dfXAnvV7bwfjB66rTuXysG22eztnEmB6
         9I6ZhWIBzWTuaULJ8uDTCeNQVSWdBKWNL3BhMNhEMaGFhBxsIEW733f9QNg8icP6fA98
         NiiDWKU8+hSgc/cvpLhaGNzgpDwEM7W+PWi6kUrIwxIR7pNnRvhqAJ83mKUUkKVJOjAo
         WpgkuvO4uuvJLNS3XO5Rd5KAsurEDV9De9nJbL9yjqkBQXHOqd9Bu912iOf49jPowVkb
         0M1q3bNbhWVBidNsH/1BxIuS39KdTqdKAWNYaMKMgF9Pa/ev9BG/9tfjiEB2LO6MgwF+
         lXnw==
X-Forwarded-Encrypted: i=1; AKwUvByROGOV5vUsmARBUmDafmnFS/eKy7VvUgLbjkgCWFh0P4uZuvt6tJ1KRmhYNfb22rcRRaKgOjS5hyOiDMxu@vger.kernel.org
X-Gm-Message-State: AFq9FYLWrMHS6ZFssZQ8q5uOmR5/vUnOvDLI2GdnY2gcKxEYXcAWd3ml
	bv+z1PSTor7IYnAakxg0oY4fMsdRXLYXAGFOTyUMYHV6UYRxtpF/owLG
X-Gm-Gg: AYBFou36nxJ7vZEuFVtBW2HLj0v2SB9K3eHUK6Yt+ij176dyTbDfNU+tdrKS5k7iNJt
	68CTEjZqUaztBGY1WEW6uDGSaWfe2g5JzoUtjxJZ3FDfNqQ3swJUyUoVvsy51A2dSEaIMe2gxnO
	kRuZJJA64KoqizCtVBoNX5e9w2RIHJgG1lWe13ch7VlMTtuSLChYgoaQ7kT885nJD+Rsi5m0HFg
	qXSu4a115eAXZU5mzv7p3NJfZQW/4iM1p9VSa69Zv7NQplgeAUOExZkC7facPyjxNH/mBWltYll
	mwsmOeULyQVyaMFD0wox/JYVmINK1SJAv0gLH+nI/yNsuQDCggzjUo32NYOkzMHV455Ie+u8HnP
	3vUKM8RFQ+yXZfr+ozDF0+2xE3x8cAZh3u8B9KK9hy3hyoXftVOjUnN0NMIH3X23Bu1xItsE22p
	+7IaWEF2uW5IxO/P3USnQCMOmk514cuWd9hHxot1PF9RbgTZ8E4E1k+xgCtkMjn5kGNggN1/OUE
	NEbHl8ef7UfuXQgYkrUwMllKfCycJsww8Tj5YSskVN0Swof0kZ8H7ok8FjuHNwzIWMIHvOmBVbz
	kQA2lkQjyEgy8Ze+aCxUPnt33TqpRCx4Q/nk1eiCBABvb56BlFwmivvXtBx7WrmDxNzCZ5GPatM
	juQ==
X-Received: by 2002:a05:6512:1589:b0:5be:680d:6e18 with SMTP id 2adb3069b0e04-5bfa1be6184mr25360e87.10.1792528109517;
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1230c48sm88136e87.66.2026.10.20.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 23:28:25 +0300
Message-ID: <20261020202825.1178464-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020195021.1133728-1-gabin278@gmail.com>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz> <20261020195021.1133728-1-gabin278@gmail.com>
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

On Tue, 20 Oct 2026 22:50:20 +0300, Andrey Derkach wrote:
> Throughput is the same as with the old version, about
> 60 Mbit/s here.

The 60 Mbit/s was a board data problem on my side, unrelated to this
patch. With the right board data the link runs at VHT-MCS 9, which
exercises the patch much more: during a 120 s TCP download at
172 Mbit/s the firmware split an A-MSDU 211 times in 62,700 in-order
indications. The patch resumed all 211, with no warning and no
recovery.

My Tested-by above stands.

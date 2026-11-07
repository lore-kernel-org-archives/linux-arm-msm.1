Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010868;
	b=a4qRYROWIcTo4aSmvcX2+uvsuyf5c6yUFbPWkxhSq8aB+rYJN8EmiM43zdeTPuycdIH2
	 vzxRRmfO8wYbF7RCcG0kZB3As5SQVnlOyFHGo5QWd/Sjjd1GopOFcJ3kKDi2Hw1dnzpgP
	 cQtLjRt+nLfvDmz1bprOUc64GBLvZIL5JZAqu0yF71AFzckJD7iny9zH2WFGjr+LluBJF
	 zlpMTZksJ3e3EEIY0jYyWsZx6JqvdyrZaHU/NYI0cV2AEfWou5bm7fbzD9i23mPzPXLLf
	 TKtHPxB/W6yG9aeh9ydlUrLD414PVH8dy2zhb1vI8XtwPoX+7U5qmthTY5ilgjW79Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010868;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=0joF43u5+XHAP64jDEDGB+Kigo1RIgMbtFxRo/xDqK4uSB5K4S9uXqPisYE92XHaQ9TW
	 O5/FeZ/EeIKm0i8+DWhY5RQz/TzpQ/N2baWmKETAKWp3h47gXIX0uIjcfEP5ARmWUlhaP
	 JJDQfuS2Uc8WK0LGupPTwKuR+BJTQR8ZcnMWVzTKYfKYSdU8yk8muoqI5PqYCwa3XYkBZ
	 r41HrFyBLOX8MygdYnfubYrqVxZmALS/LrzEdkAbw6Rt3SGLBmTdFucT6T7HeM/2cgC1A
	 oYhFwRhswq6aqFqL+rdoD7oAGveIt/xCmUGF5G9zCR0ct/5pXwh6/s1GupEceom7FvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NlnKKXpQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFF6606A32F
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 00:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFF6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NlnKKXpQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=Jf9GISnBZ0wONKY2iaOs9SlIUDHitNSluS1ZaHWFlZL6MhuIR1isPyj1WkPkMoNRgW4vik
	rPWWiZ5COuCOQY8G7jejZGByOsfI6D6S00cpk+h/JGp0nGowQpaOSMWZA0DpMTXC88bwKm
	MSWuRJHegoeoF7da4bEJCXv257TrgVQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-BKc_XyNpOym-fi5Kvz2uOQ-1; Fri, 06 Nov 2026 19:21:04 -0500
X-MC-Unique: BKc_XyNpOym-fi5Kvz2uOQ-1
X-Mimecast-MFC-AGG-ID: BKc_XyNpOym-fi5Kvz2uOQ_1794010864
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso21176341cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 16:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010863; x=1794615663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
        b=NlnKKXpQWdB3nq2vpcPOQQ2XwSeHfcOq7MSiRvB6EnvBX5HJGoZSmIR8xyfXzcyOaF
         p3Hiu9HwInGKaixEiNp/I7sPXL04iwFksNuxGTejyFbIcD1ajnsnfTHk2GLnCaYDWQdy
         gIBSBcnHDvNefPE4/2m4+1W+rt///jw57XFEz2OM2pvwGnbdn02MY3/7pHlgwa14O/dK
         UQHwricNPtk3/Mnx4LUHDCptyBovtQEB3cG2MwKZsyTvlND7eWhkRsU4SejUv6xfzW2j
         K25IfDhCTpC2BiNl1AjhafgUL4hjMs0QKY+KP4Ga/EYjBx2dRWa414w2NfAx16r9aUiF
         z1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010863; x=1794615663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
        b=js7rEQ39jLsSvopXZ1Vr4edTf37C1MZ1XJJ4t1tmPgAAHG2Q2ih59Zf0xECoI00ybG
         SHai0vkrBuGnU0zMSJl8nEH74K3APlkZArCe4WixdTHe8XRY8DTSs8/K6bsaFwoMG8/t
         X8O+esxUoXFsbsGAogKylEu+0Zt6avzKqA0+7ShGjh2g3FYjLhbrHRF3t26gdqaIQi7p
         wNiywZONc872fp+BHx7BnH4NKYmetbMQAWUE4cIWdRdbfgeqNRPOR2BomKAvoJQi4JE7
         CgmUFrmFM7X8xtYXshr30qKQIY2QcFIo4xbZLwgYats8oSNcC/OmeRU3iYkFoN/mOZfP
         6AbQ==
X-Gm-Message-State: APuU4Z+xmpdVSIM991o4ajBEEWpz8Ea1N/oFR+T8aCzYaJq7k4xsvX7o
	oeMFr+UyvdTr83QVqSLhg7Rrje6+xSo6ZFZHrF6Oal+jtCRX2X1GPhdF8pQZ6IUK4LaRQz9VBq+
	dpKJz8Qo0lqt6RL2qdBUdncqKAzHx+JtVZ5OKHRiSu7JFLOXwcjvQYSrouYCDXN2mLyPoiKJZby
	vIXFzRUroRTXAzorRBNCwKJs3OH3uy5uyP2YJ2LXnMoIbEVYdDJg==
X-Gm-Gg: AYBFou1NRSyfLAULzhfdAMVDxAalFpwrOuNwPKZzPNYZrNCqYyQORwPIFOrKmR6s40d
	pgBv6TDvKydDUofDHsZgrsgwYiy4i/dt5CVLj4EgWl5rl/DpMpKCeLqIgdAehiF6NsxuU+LrIPG
	+cVu1F3O+osoneDftU3nE8OcKviAeD0R6Ms3E61f9RYdO5BWr5gPWic/0ZeGJBwIbWuJcmZu8ph
	OQcNB+7L8D7M2OyTu63jgUT3I0BpKJX72mHkeH4Uek4uxAKgVlvClWAVJq0oRZh11frtRRN3am6
	yQtDRExVXvSCroXNhLj+tkOgGzH3IITnuPSTxYnc8y8cTMA+sL+p9yRBBskaJ4oKIU7hv2P+suc
	2dvbJnxIJ8ENbePZUyerBP3PgufNeTVkkTgMqto5oUaAEiD6xPFUpuO4Irkay0uqx/3y7GXzdx3
	i4jmVk6gIW7ZKy2eiH
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67615011cf.31.1794010863548;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67614571cf.31.1794010863025;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:01 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] mfd: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:20:49 -0500
Message-Id: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSekkUSvEi1Sx5qgC05FEb17V
 ssPzvkvYAyEDFVyQcCdmOYpQqYJ2L6dOhTkokFlSkuZaTF6J3gzfLLQubOFMaXyZQ7xsAT0dHy
 xuvkdlwPa9S3AfT9JAH4AbgAAAA==
X-Change-ID: 20261106-mfd-subsys-63dc5bb82f83
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=AYswpvPVCUryj51+P1LGK9/UjRYirXKlC5LdoCoqFdc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5T17sENr9/zCym3LGN5WLlp6y9u3MOdpuJuDUla+R
 uwfkzsMHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkLZvhr1SeuZtycTJX6sKm
 lG6bnLoAB87Ld5vNeONt7c5fSK3qYGR4o1l8I25S3JrGvlru9bYuL94f3HnyzxUZh4K7DK9nsfo
 wAgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      mfd: qcom-pm8xxx: convert to subsys_platform_driver()
      mfd: tps65911-comparator: convert to subsys_platform_driver()

 drivers/mfd/qcom-pm8xxx.c         | 12 +-----------
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mfd-subsys-63dc5bb82f83

Best regards,
--  
Brian Masney <bmasney@redhat.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378974;
	b=4bU6MhFThRZxfFAF40n8CWkQpwdWPzz70A8Ghkq8API9mzIHyUT5wL44WemodSRbEmfg
	 GKLaywd6KZPlUAuqmbBbwD/r9vk9MdywzEIj85KaWcIGyUS+v7Pd2U6qWQLKrxd3gRrfb
	 iEZkhuKwT5KIDEw7bEw/BPomK1CProC5AwObuxmXV+KEbCIZvQN6ibwA9C4hrYdnCaAkD
	 fZtEq44V1ZV0wGUrAOTCzLWUp2Vh5M9epxJboTh9LE3o+Ql9Lfh5pgNiZkoILlNrNFA4V
	 Cj2wMqsncXBiZPPj3asoNNs/z8qSFRZSC2HNDqM1/j2y1ELcfWznTXb1GDsYWKaMQbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
	b=Flge4GJ6PeIHJ5vlJ5pWYSoc1CKLfFTCUgaQjFF3j1HdDkOtymuwV/pTYC/+zNEnwBYG
	 s5RoilreSJ39F1AkVZV6eVk4/gKQs1PeV2iEGYf+LZSMwNZPVRdqN6ajNVCi9yDZcBpP1
	 IkbajLYEQ7y6Rqqo5+U3Vsa2QK7pTa2SQdQPm9eSrVUe1l9/A1eYFYz7CXgspNWiKRRO8
	 Dn/Shsz0l+aESimnHhpJKh7k9hET1v9C2rJHuQXx2NEuCrElM+ASe8NwnLVLUjC3i2Fl6
	 MilTReEWXT1YlwuYUgDl0zgT2Jfg5F3wIbva7mytHL++XKBkRGkhodNBXcosY4RqqqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9g6nOee;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B71606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9g6nOee
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-945e6d9ceeaso247815585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378973; x=1795983773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
        b=j9g6nOee4xezCjykCdJTlzqCGnpYKG/HoVttPGr1dg4aCHpyOUV7W1OVDSGRh0r5gw
         ZU5CfTmL+ndhBW/H4RINENI/1vb9S8wkgvI7Ut5Vm/4cTjxk9qWnp3XjyVQCIp6MrA1j
         Rd1hSAdlM27lKOgBqL5h7J++AY7M7az+62ECtjI6mFsAIotKIuwoida4E139/MIvFIu7
         Q3DL+4UD2FKzFuGRiAJ6Vv//VxJNxZLjjHkiC/+ALheXM0odNZS4v8LXh10yiRLWKe0O
         sq0cIw9g6LbZeLG8Wmw/d8UYmSICUrH8STZopRZZeBw/OgjH9Z+yJHrEL11BybPpbAHH
         yGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378973; x=1795983773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
        b=HgbVrDoOe3eybjG3DXkASnS2xka+vSenHteQzey+M+YInxBpL5fWis/et8jIypN2d7
         Dp1HyluQ1NEFgXDtV9iVlwyh8qwAD3lMq/jYTXLd8b0trzZYigux/wBI35un35EFQ0Be
         NC9JhGffW8zciiLNUbzoIjCJ6oxFdn6oKGyE5+hxvK2jmAqCalol97MYtjipxr5Vqkyv
         /CSbYh79m4VITiaA0TUGQObCzjaZxh7d0KM5ZK8myk7FnJsMy0hCtxp3LA0h6+z6b4Z8
         yQDz46z8TPlP5HfGx8TyV6KaAwrF2+cMK5CK7sFl8iZ15eWYuUz6XFAvAHkG/OhQ82CX
         5OyQ==
X-Forwarded-Encrypted: i=1; AL+hErEDZSo1/oaOzxFv/I/Q8EdUHhgYuyncMm54yQtLAyIoysbldELUjO3MQooToLuxCAyN1NF2XzRgs0mWq0aZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8o549fxhBEanR8FszcjGGPnHrR2zwN8V1LG+X7zKsQk2oRVuWH
	Bop1aDFxpxLTTkfzoifcioBQ2mhyn5wU1l4+5GFqQLJ5Zknm642M6fCK6zO5N6sWZ4FOWg==
X-Gm-Gg: AZFdTZfatHw6H5IEegudBicG8NTqWZn06plpu4xl/UaQfFUR/CK9Rs2a+t+oP0GG1We
	XtO7A+7KiTktgh6kc0pknuVDbbj6Pg+6/UK651z4jrdd2ksBaFAmhxHbB8lIypECCV+iaO3Cr8/
	Ua7BfXo/C/+T/2T+t76vV2b357Mlr14tZw7/FyUqjFGy/MnPKYTGirlcAddeFEm5cOKkHjsTuHi
	C2IuDmC0GAOIV2rLj0ivvGL1LvF5Xl7qxWU+S2RL8Q3jxs7CZQc83oLBaa3inxNwoPm3llBCJgx
	6g/Ovgs2AND6n6DGyABmQe6i8G9dNbHV0w2Pftqe4VSo38rSSng/UqxaAtLn8EmVpc2w0698Pjo
	I1HoxuvmkGdnoD666XD6MYp5C1awvikValrTv3eqHRERkvrJleVjA1km6iWAZOk8R2z4KIIt2nX
	tnI+gm+1I7Q3AXFXqtmRJAV5gbKDhYR0AUjD7a87fX8hw0+jD30GfkmIc+yPE8aduc5KKelEC72
	rZQcALh7zfcGlO5bj7Co5cNSxZmtHxTovw6XJQi4XRiinl5g/WHXH6gcH6aEM+e5LaTxCkpyt3k
	jCJ5gS9/4QgbLJlQx/qDspAhWfvjk2bzkPUSbLfa/H5pp+5DZHRItDSUbzBRFPjQRSm88Ot8jI3
	OrV6GqdV3vDR7GPb0KiaKYqRqmUSf2nTZ2tdLdpNnb4yBSMF/ScHe1Rh6QcvVX2A6GhcFUPR1B4
	XCsO+2te3HXEN3nKbh0DjEEwwPG24kjXn7CAe5RVRcmeobXPZQEUfBA7CGB7u9ZeFE7VbzFYbw9
	OB1lRSXO/SSqT7XumiReJyoFpmPNUIFqrQjRCmZJLW9jiY3rU11Xeav41IarMzp1A==
X-Received: by 2002:a05:620a:8395:b0:947:ae4a:ba48 with SMTP id af79cd13be357-949baa0af75mr1570766285a.56.1795378973537;
        Sun, 22 Nov 2026 12:22:53 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:3c7e:3a8a:889f:c3d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm85114916d6.1.2026.11.22.12.22.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 12:22:53 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Sun, 22 Nov 2026 15:22:52 -0500
Message-ID: <20261122202252.58090-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <bdc56ab4-bdfc-4fca-90e9-d062492d5bb4@kernel.org>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <bdc56ab4-bdfc-4fca-90e9-d062492d5bb4@kernel.org>
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

On Sun, Nov 22, 2026 at 02:14:17AM +0000, Bryan O'Donoghue wrote:
> I'll take patch #1 from your series and skip this one. Dropping CSID2 is
> IMO the correct path.

Hi Bryan and Gjorgji,

Sounds good, thanks for taking 1/2. I'll drop 2/2.

Jesse

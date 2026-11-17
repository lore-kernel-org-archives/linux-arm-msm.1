Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922628;
	b=tKACbP8Ez2hU9Gfb1Fia5jp+t5AfMkF+v08VO64k1ptbTzsNqHiUi+gF7KGTi1fx4FQ1
	 yK8Vg4aFUjAmA43BQqmeCbkFRe5tALBG7WupZMKeePJwYCEB5b309PZnyiQNoFUdcm55l
	 N5tvi7bCVgkxJr6NuFUP1Lp5WdciDI4/tqZ47KTlVN5PTt+oJq2PeKcfdYEQTWqcInPCk
	 bTGoZvryYWkYk6lkofWPECnPoUOZghhZgG5G6aJ+FwJdp5mbPu5pb9WSempR8aKTtyx0v
	 1f91ryPfT/GA2WDakSqRLL7d0nuunaM35u1ZgslD84TxPVcAzq67LROGcrYOeUKrtwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922628;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=fPo62Pw6yLg3/n/Fi75BDdM3/HcM72LhtHakOFqTjOo=;
	b=D+dM3BZZYZkgGihuDlJm6Gg/bxPPRs+p1NNLu1KNTzqXXXTzCsIL6RFU25V4nvdl4w8o
	 4TFEtrX/ZR2KXJ1yvCSJUvHX1pqZUBn2LFVb0OKi7Ae1uefrnoVseXJk6t43xRuZ3GEex
	 4yT3jR+fNwmXy+0fmPKJ0PFZINxSQf6KEUIYawJ5f8/IDO+oj3XMIpzDPfSZeJl/1EnHA
	 bkx94ZADbkIksaWgS6wCc0nmRcvo2CoExiaLmP+awCMsDM2TpNNjgit/3nFXwLCnIAIni
	 ASKi+Oxqh2ETrlDLlc2LoPq/ICFLJf3unBT+sgAGxEi4N9PucpJmO+p0FVPvkWK3avg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YyG73sLo;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAE606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBAE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YyG73sLo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CC9A1A162D;
	Tue, 17 Nov 2026 13:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01DC85FC81;
	Tue, 17 Nov 2026 13:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D1AF11BC0008;
	Tue, 17 Nov 2026 14:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fPo62Pw6yLg3/n/Fi75BDdM3/HcM72LhtHakOFqTjOo=;
	b=YyG73sLoz6bnuTXHN6uw+OtCVQk5BUqSoBO2o7JfUE6pNpbgd4exj4wLNiMUjQCRwb8DCE
	UHEEIArk/8q0IlyoW8xKxXeFFOG7wJxWEMhDqCQzunGR6VZo8qopFTR0djoHi2sWNFskSa
	8lclcE5lBI0dR/Xz2/1KHQG3/BcKrCvEH+2U9boDp6RHywYbvPYupnkfY7ZpSnOxh30dZt
	9CN2Ueg7uxGks2hQ5sEaJBSCz8wIq3V5wzNlgdR7eRcx3dxLcen/a0OnCD2lhNaxYSf/ja
	2l0njUhvmhU7/iQS+qKmHacCKhDC4iaCZMm4HI3fTanc6mQNzZfYUehrw459Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
References: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: qcom: drop setting of partition's
 mask_flags
Message-Id: <179492261371.2237190.6788840618567953868.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:36:53 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 13 Oct 2026 12:32:12 +0200, Gabor Juhos wrote:
> The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
> so it is only usable to mask the lower 8 bits in the MTD flags.
> However the MTD layer does not define any maskable flags in
> these bits at all. Additionally, the meaning of the bits in the
> 'attr' field is not documented, so it is not even possible to map
> those to the defined MTD flags.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: parsers: qcom: drop setting of partition's mask_flags
      commit: b7cf74065f69d34ea817e0f055f66786d5ecfcf9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


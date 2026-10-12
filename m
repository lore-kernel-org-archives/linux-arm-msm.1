Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E84CEE4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829254; cv=none; b=Bh7xWFbpP+BKW+RO/3nmmFFy1UB1a8X4yGtfQBAFQwuzLWJsVPEw9aQkJt43wRHY0m5TXG3LP+ubXTRm0775jOcWnPbnRFfZOQFaIOKvyXeXJNNigkxk7GjKj2tuqoP2LYJ8TOZyaqynmSGzKhxtHcRhYwgu21D93DHbhBB2Vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829254; c=relaxed/simple;
	bh=9dsekB1ejMn8pBqNpM4HzXtWHhZNNxPqzfBPXC9EE4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NkXkorE7MxYD8K1/TW6aHhavduSluZbSdx8dLp+5UIqY3PxmQPMoNIpH/xurJ6BQVqtwMjSiFJJV3AfUr6Y/4lwKrx+6BcZQRz+O1d7v1BWdGiOkp/r6NmT5rvPB8laGQiXdWztlF/cjuGQkdo50QTjzGkdNJeP77yWZy8DezP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WdwYDtPy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WdwYDtPy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EFAA4E411FE;
	Mon, 12 Oct 2026 18:20:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CFA65601A6;
	Mon, 12 Oct 2026 18:20:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6125D11D70CE8;
	Mon, 12 Oct 2026 20:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HqLHg7kuFh2Vsl727kQ4Tqunm0qZW6IVww7wNIrvipU=;
	b=WdwYDtPyL5+1H65OGqMe97b95/Q2vzduPvIzGADQ79b9+Bk/ROoVKW4CdpELuOCPF2Ssu/
	M0MQU/XvbGLSC9lAs0a9U385URF6y50mnRQaXqlqEXTtqn1JgdLOXyv5wb9UgJ1eFpZ4Jh
	tC+Nn8qTPXO36eGyFlsTgAxzvawm7AgB3l9CSUKusPCQP8JdFcwxB/6jOR3CDFwvlEn1AA
	s1h5f0WcyXtexSSzJ6VGeoZd2EbBm6DoSNhe9Yr5pL6UZ1LXWi4oPA61VcwIDS+SfxNrJf
	lsda/6bJKWJAacKuORX3VCqU6XJXEq6inHZhl8X9o+TSP048z4NKOmg4RLJzeQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
Subject: Re: [PATCH v2 0/8] mtd: rawnand: qcom: share more common code
Message-Id: <179182924331.590599.3467246925960276615.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 25 Sep 2026 21:06:09 +0200, Gabor Juhos wrote:
> In commit fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
> lots of code has benn moved from the 'qcom_nandc' driver into
> the 'qpic_common' module to allow using that also from the
> 'spi-qpic-snand' driver. Yet, the 'qcom_nandc' driver contains
> more code which could be used by the other driver.
> 
> The patches in the series generalizes several functions and a
> simple structure then moves the generalized code into the
> 'qpic_common' module so it can be used by the two NAND drivers.
> 
> [...]

Applied to nand/next, thanks!

[1/8] mtd: rawnand: qcom: make check_flash_errors() more generic
      commit: 19961db84d806c8a7f6cbe457e752ae62bf65ee4
[2/8] mtd: rawnand: qcom: make config_nand_page_read() more generic
      commit: 5c80d1392cb6d3f8f78c3c8e6b80c884d07e47db
[3/8] mtd: rawnand: qcom: make config_nand_page_write() more generic
      commit: ee88ebffcd2abf7730e2e9ff638de5c04f3d19c6
[4/8] mtd: rawnand: qcom: make config_nand_cw_write() more generic
      commit: e4ff0d7c53a981690ae31d49f59efcbfeeef395f
[5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first() more generic
      commit: 137b9f25879245ad9825dbb6dff548b124b18b98
[6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last() more generic
      commit: cd93990ef5d5262e50b2a0d306a49e1a21019ac5
[7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
      commit: 555d48e52026f3e60f0b9acd1ee08c106d442a02
[8/8] mtd: rawnand: qcom: move common code to the 'qpic_common' module
      commit: cfae2182fa7b0f0e3caee02fa6acf5dc77410efc

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


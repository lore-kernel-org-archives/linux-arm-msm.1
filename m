Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599569;
	b=oO6dzL6fDhlxJU1l/Jsg70sruI2esGDJCF3A4VIQThVdN6LZECfft1zsE7rAtkdGuehN
	 T/DtKLdU1+Bn/5/G4MSa0xqy+dFDkQGZR3Q7Qng4FHWkB0u4JtDKKXDqyHYDXvFVTxJ96
	 zR1+eD0dkBqqyU3oATjFutULZ+lkhj497B/Hrs08lwncEpovSqkUsJEnKu/efIpaNcv1K
	 u2wcL7Abv3KFJGdFREJ5M8DlURxZ+b4qibj4fSToN2P/sFp3RyD5dUZn1hbph6Z3jYZke
	 MtSldeac4tjsQbc9rWn8qbMREat0k30Qiq2OSwBFx8UyoiK/absNc1m0dA7676EPldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599569;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=6t/ivMkvFmU8goAuxdIcWWT8Ek7XOgvXYLVnedSjOAg=;
	b=LWgKc7RS06q3F8ctX+PiWG3LVo7eyrN3466WA4KsGYuc4+drLcfWA5mmhH5BdMQpxjYS
	 wiSJztOgyqoxeu/tKrqEoT0gRCfMdCM4rHXkX0USO3fPajpOBZLDrKwg26xRB163Jb77s
	 W/5ul+N0m7Kk7VQFd9UGMVwH8vMtttCOeWsz4vpis1kcJd6izSOzepJgMP4h5HdA+U+e+
	 rJyfegI6PiZoxMNQ6Yrs1xyVlOPqBrU0eLhXUT4jTUk6P3/xLCrMiuydm8LgsfSQaF/ov
	 vEeXZtJ4rqBLu+64zxriilP+ELw89zceXu+9vByr2ZNu6+LakPU8NikimckxC76jFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ZqPoA64R;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644DC606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ZqPoA64R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=6t/ivMkvFmU8goAuxdIcW
	WT8Ek7XOgvXYLVnedSjOAg=; b=ZqPoA64RzNS2QzI81Oisg9k9DUcloVyGW553u
	g3x8vXq73/C+2njHof1vd2+LM2w/txm3b7/x+QyvuvACho0ii/bgb5kMyv4umYNm
	yGs1Gy4T6CdFJrCbGWL2IthjSwdLKnOsWv8PuDEGRiorTpKMo9YXDHq3kI2fLF8c
	8WoCIY=
Received: from [127.0.1.1] (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUFLKOhq8vR1AA--.452S2;
	Mon, 02 Nov 2026 14:06:03 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>
Cc: linux-regulator@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject:
 Re: [PATCH v3 0/3] regulator: add the WL2868C camera PMIC and its users
Date: Mon, 02 Nov 2026 14:06:03 +0800
Message-ID: <179359956355.462429.18100036179190338497@mail.ustc.edu.cn>
In-Reply-To: <aue_zSZqx_hsM7c2@sirena.org.uk>
References: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
 <aue_zSZqx_hsM7c2@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgAXnUFLKOhq8vR1AA--.452S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYb7k0a2IF6w1UM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE
	14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2by
	ZUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rnk1c31AAAsu

You are right and I apologise: v5 is a new thread, as every revision will be.
In this thread: cci1 bus 1 is gpio111/gpio164 (119/120 are cci2 bus 1), the
i2c-bus@1 children no longer claim pins while disabled, the CCI pinctrl nodes
are sorted, and arm/qcom.yaml left the regulator binding patch; the board-DT
scope questions are answered in the v5 cover.
Qianhui (drafted with AI assistance, reviewed by me)


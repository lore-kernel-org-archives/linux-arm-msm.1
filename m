Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598732;
	b=lmG7rwIPfPbkySzYpnOVTtKCaSmCWxvoN8KFE2nbxTyTUkMkruc0/I1hwzNhlNsbzArE
	 4qTkcsZ1EgQJBRE8xvg0m9npS++OSv+PI94DR9L11fSlirHoMvRw7IaR5QOlkfnUQDaFV
	 f2KDT/W5mZQI13m4AwOEzejURVcZPIxJQ4k3kE0s/60/cVn31h8Tz6LCREIuA5mOGOAm1
	 II/Eg4f0Z5egup/4zcZiJFDXnqjTXmCfirYOoCnZ4NA5MorLUo3t31kSFvSWTyfqVN0WK
	 3GTA/ubXl0EqksVm1/vqhQmgudQ5WQG3GTKHrWgV7Mhr6Pf3wTkyF45wThTnICEZLLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598732;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=IHwDKUZ4etoz5sutppnl0VaNG+odcWPWbRExkmWopaQ=;
	b=s74N9BdSGeVIsQjoowAeszQxPuTrpfsCe6yjg1gRMGuQXXBzchyUFJp29NsKfhj6Lvfl
	 zqJDVptKljxs2g6z2Uy8HKwYLFkkR584jcfK6lVqVTqS6nzYmCu9lOTZHcdbjwZh8vSiB
	 bRdraOrgE9Nu5PpevnksIxw8+2iwwBNjpwJMDDg5gC67M9RcptF/c6vHwBjum4T2NOh6g
	 TGb2N8N+eVDhqJTV7GuktF1/IBtr+/BV1oQavEs3d5GYEhoH7v6l7KVkBvJKRKuTMQRDS
	 Cu10j6QIxfFtwyWYqTPZt28/+1RmRcUcrHOhOqa3Tsf4SJHUGW6LSqJe1KW0TpKkM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hqKzX8N7;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A4E606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 05:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hqKzX8N7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=IHwDKUZ4etoz5sutppnl0
	VaNG+odcWPWbRExkmWopaQ=; b=hqKzX8N7oRkpUQQfnwxh25Dso9q+J5Db/oocD
	1Kkyo/zArwRRPOQfxzCID4IoitkzwMwegGIrqUc62t1PSWJ0oF6TExRgRhqjdO7n
	Phuays/SpLEVxZr7J+RHcwkBYUv6weylZHOuAEawxCflQvPrcCfxRgmT9w+d6gas
	buBbxQ=
Received: from [127.0.1.1] (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH_TEJJehq7+V1AA--.3847S2;
	Mon, 02 Nov 2026 13:52:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH v2 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Mon, 02 Nov 2026 13:52:09 +0800
Message-ID: <179359872904.440020.4978864415299817827@mail.ustc.edu.cn>
In-Reply-To: <odog4t5j3y7j4tatqsiywfj27iufeazkzp3vtfvzce2knct25n@ephs3ngmt2i6>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
 <odog4t5j3y7j4tatqsiywfj27iufeazkzp3vtfvzce2knct25n@ephs3ngmt2i6>
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
X-CM-TRANSID:3pYKCgCH_TEJJehq7+V1AA--.3847S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYj7k0a2IF6w1UM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE
	14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8m-e7
	UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBUsF

The comment is gone; v3 is at <20261102055026.438521-3-xiaqinghuan@mail.ustc.edu.cn>.
What was worth keeping from it is in the changelog instead of the source.

RSCC is dropped there too, so the series rests on core + core INT2 only: the
two blocks that were left unreset in the failing boots, since the SM8750 node
described a single reset.

(AI-assisted draft, edited by me; content and decisions are mine.)

Qianhui Xu


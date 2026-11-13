Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558801;
	b=eGJG16ii672A/x08tcc+g39PUWrf0irMr+eDlxR+s4Q2tkT/Ft5n/dxvIsMXWAeAt56w
	 x0P8fHZZERy4cZq/u0+cSZtTx9JfD9e77FGgGwgd97mw0ZS8z/E0M+7kkdXDwBsadrlN5
	 XPMq4moddsc3JFp7GdzxRJ4TmUWpP+XRQkFaWMVsXxV6eT+mdak/d39FAce5r+fWBdkVi
	 lryrkM6JCiQca8ukQO1jZ+Eh0mIYcI41rnkdXnWeFnO67WMTL2R9qS36EdMqgDFwcW2zy
	 +/WePdVdcG0zn1Gcu/qmRIfJnKc7H+PSxpuYIXr7dr0hrOnC5aOxWF40UsXTZsGdk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558801;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=uhmXzW9uBg5v5J8J71Iy4XAChJt+jEcSc4djzXvgVKQ=;
	b=yqLbXNklNYe9euhq388QAKsm2nO1BdsxVjKmNCA4aXqtnLo1gMtsjw3eC3Shpl7AgKEo
	 +rz5GM1My/ISR7T/FKsa0flmD09X9soEVHrA607DoRoEIshxmHs2NOtGJwdx81gA0iXgr
	 4K/yyyLBAi8yM4kZ8lcclmHtM+xunQAHJdk/TZRMdkClcdfJLUyfpKqFM0iuRNWCp2uFf
	 6S2fnwofpp7Lamw+PgKv+id62Q0KPXSyaaw3kaBysgT9B3bhuAzeGECo59yFyEvj0vg10
	 fp3p2nG0a4YNYgmwLECy2mGBvK8xwULsNFzWMsW2/fxH/wYz9jzSPHAyaMiWR1NLZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jHCNuhH4;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC562606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC562606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jHCNuhH4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=uhmXzW9uBg5v5J8J71Iy4
	XAChJt+jEcSc4djzXvgVKQ=; b=jHCNuhH456i5tLj4IR1cGJl3IKChGbvKZwdZO
	F37xV9GzP3cw2PPixW41iDBVe6g3wp+YSmy5uiURI9LVGnovXXc6G199TcmJjBPl
	5hE+e2l3KBcNtJKNP70hcRxP6R6ymHsdIQ4QtWvnVm9vUjgkqxr3o/uQoAL0g4Kd
	nTofYs=
Received: from [127.0.1.1] (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnIjdMy_ZqNDS4AA--.1444S2;
	Fri, 13 Nov 2026 16:33:16 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH v3 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Fri, 13 Nov 2026 16:33:16 +0800
Message-ID: <179455879625.604767.7465884400787133064@mail.ustc.edu.cn>
In-Reply-To: <awb7bslhrhemsgvu7ubaejvurk6fecotgvqlwtvsoe2benqdgq@tvh2sfjbuzyu>
References: <20261102055026.438521-3-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnIjdMy_ZqNDS4AA--.1444S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DWFyfArW5Xw1DZFWDArb_yoW8Kr4rpF
	Wfta43Wr4kAwsYk34vya109FyFyrs3Ary3W395Jry3ua90qFyxXrZ7ta4q9FW2krZ5X3Wa
	vFsIg3ykuayqyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU56UDtUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAis5

Hi Dmitry,

Answering the three questions, and flagging a claim in the commit
message that your question made us re-read.

1) Is it an interrupt controller?

Yes.  MDSS is one in DT: sm8750.dtsi's mdss node has
"interrupt-controller;" and "#interrupt-cells = <1>", and the DPU child
takes its IRQ through "interrupts-extended = <&mdss 0>".  INT2 is the
second interrupt block inside MDSS; dispcc-sm8750 exposes it as
MDSS_INT2_GDSC plus DISP_CC_MDSS_CORE_INT2_BCR (0xa000), next to
DISP_CC_MDSS_CORE_BCR (0x8000).  It is not a separate device.

2) What is the side effect?

With the probe ordering taken into account, none: msm_mdss_reset() runs
early in msm_mdss_probe() (msm_mdss.c:372), while the irq domain is
created later (:417) and of_platform_populate() (:537) brings up the DPU
after that.  The group is asserted for 20 ms (the existing "one frame"
value) and then released; dispcc PLLs and clocks are not touched, and
RSCC is gone from the series as you asked.

3) How was it tested?

At two levels, and we should have said which is which:

- tested: the reset at this position (mdss probe, after dispcc PLL
  programming) with core+INT2+RSCC as one bulk group -- 5/5 cold POR and
  2/2 warm resets with no bad boot (card0 present, DSI-1 connected,
  storm signature 0), against 5 STORM in 9 cold boots on the base arm
  that reset only the core;
- not tested: this exact v3 shape (array API, two resets), and we never
  isolated INT2 as a single variable -- the failure is intermittent
  (~50%), so a per-reset A/B would need a large number of boots before
  it means anything.

So 3/3's commit message overclaims: "command DMA timeouts ... because
INT2 was left out of reset" is a causal statement we cannot support.  We
will send a v4 that keeps the DT change (it already has both R-bs) and
drops the causal wording, leaving only what holds: the bootloader can
hand over with both MDSS blocks running, so DT describes both resets and
the driver resets them as a group.

2/3 only exists to make the driver honour a DT that lists more than one
MDSS reset.  If you would prefer 3/3 alone after the v4 rewrite, say so.

AI-assistance disclosure: this reply was drafted with an LLM coding
assistant; the author verified every statement above against the tree and
against his own logs and takes responsibility for it.

Qianhui


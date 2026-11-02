Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598732;
	b=44SzGp1cFgs+XqNGLIqXBIfZdHvRIiiVilemm4capfvbU3oZAqt+I3DDdBrfvRChqy7y
	 Bp4iNomDZ5uizuWWstyySfR+Ra1Sw00+AJT5qpnUJwnNiFSin2Q0MZhxvWx4dYM17qSYs
	 tNEYOm0fcBOEhiFNeh0YdMPtFpCO4tIFiqt4xt05CaraucaV+eIO8t7Pu/Fjp+aP6CMUH
	 H/cGLt186+vIikFpiuqj4fNww0iREIJdkHWbSvtB3HXndlM8ALJ6g/9j3hKeGFpg3wRT4
	 kduiCsmvlN3eNWZUIHt40ixLSXI/ww9zCkpkiUpW6VrjJgcQFy4Dk3vAzqHAuwaGGIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598732;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=0lZOsx1LITFD5ecgwcUKKyKeWawlR1YqeqpxBeLqpGk=;
	b=BPN5mtgR0gmLd+SsOAqLMoLTkzy00rvKSvPO4wEBSv77Lba+076dYGd2+5SjC5IY1ytR
	 Hfn5tWTAEOOAEt4/dY6lOAx4sqyK65j0TWrQv94JdquvGavw9/L384eHzXe8ChYj6juhf
	 VHHSlttgiRKxM1nKtZsoB1XTInZsvDLv3zEK7Z10s2nJ4N+tfq+jRpuo5Gn6gGL+W9dfD
	 EkmWa49iyvBCUMVJhw8UowULfvo/Z0GZ9zrHVN5UepI0zreeL5JVo0cPXO5nawOtr9ynM
	 iBFpft66A6Kywlr9GToBTI8l5/O2dWvnVwOV4y9BkH5yMGuVtbGTdjmhUR+pP4eP0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gE2WB910;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6950C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 05:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6950C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gE2WB910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=0lZOsx1LITFD5ecgwcUKK
	yKeWawlR1YqeqpxBeLqpGk=; b=gE2WB910j+ONZS2euuVNnSmtdyU9caSIH+BD3
	BnAznh3AQZYBNZDvhUEinGh7yDgcAeV2JAEb9hxg186kAg+ehrt+1v12+IgfIzDv
	1/b3JFALzlF527LHsRK7yWGjHUrZwhn7etbQ6ptgYgCydyGc4oPPprND0A5yK/SJ
	BgzMuk=
Received: from [127.0.1.1] (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3ej8JJehq8uV1AA--.402S2;
	Mon, 02 Nov 2026 13:52:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750: describe all MDSS block resets
Date: Mon, 02 Nov 2026 13:52:09 +0800
Message-ID: <179359872977.440050.668410399098679331@mail.ustc.edu.cn>
In-Reply-To: <dkwloahmxcka2ykjdrf6nh6d6cde6zgd7fe5s763h7s6nv3eqe@pm32d33ghgbb>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
 <dkwloahmxcka2ykjdrf6nh6d6cde6zgd7fe5s763h7s6nv3eqe@pm32d33ghgbb>
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
X-CM-TRANSID:3pYKCgD3ej8JJehq8uV1AA--.402S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYj7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE
	14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Au4U
	UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBVsE

Dropped.  v3 is at <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>: the
node lists only DISP_CC_MDSS_CORE_BCR and DISP_CC_MDSS_CORE_INT2_BCR, and the
binding and the commit messages are trimmed to match.

Those two are what the failing boots leave unreset, so the judgement does not
depend on the RSC.

(AI-assisted draft, edited by me; content and decisions are mine.)

Qianhui Xu


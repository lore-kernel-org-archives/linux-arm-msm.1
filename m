Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786860;
	b=ImdNqmkPk+tqPCGRsFmwtFIMbaWW6d45w4XvqtnpMgRYaOiXVnmg8gpgdtqNbvwIvtqq
	 pGizaALZ+Ffk8C3yTmuK2FYLBkn+rtzzaRLtps4Pe7kgl2GlvT1T6ToJAdhv/+421pjaV
	 vxxgE3wQNxAdVxdhNj0ahszHl6lTFfgIyx5MtLpwF4N12+djcuYTboDOIrzz8nP2RH2mK
	 4X8Fxg+OwPO4/oxEmxL6Q83j9x2xECMnHy/S8i79L6K2hKjY3ql4m4ILu8qp1au0qf4mU
	 +YTqmsuE+eGLrBN87lR5ILKf/mmYnoxktOt/l3Te69PeYkb3XWbRpMbN5pYUp34RyAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786860;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EAFzQn4AZO4T8Jr/IHZOyo9SxjxVpL3kZu2DnP4FhnE=;
	b=VP1hCzDJYQLfVm/5gZsJA0mqfndDNfUIkqdwyIFMBhSgDGvc+fAypQcy52m4fPpc+bVJ
	 ETTghnH5SVLySvcXkcDkH+6WbNb58D2Bea44l4DoSEP6yCB4PIQ1HyUOmDJlvRddxzQBQ
	 DLDlh3mB55fHyEweeRPes2RCODT6+ePAUb3GpNaSiQuQSOqR46xUKuYstd9rm1iJMjvEK
	 3cQK1IeWwNT1eL0TqToS0n0Al3ZzSirbr+wFMjig/52qWnZr+mA8x3NaPB3YKM3+0Ec1C
	 S8nHgYEU6U0sZfXLpIcNEjYoRbLRM45Vvz+uiblDXP7yCNnEZZhF+zWpBTkjdMMZPeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU1K0zBO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3E606A31E;
	Fri, 27 Nov 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU1K0zBO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5F81F00898;
	Fri, 27 Nov 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786860;
	bh=EAFzQn4AZO4T8Jr/IHZOyo9SxjxVpL3kZu2DnP4FhnE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WU1K0zBOFJTrkxe9LiCjKi/W/AujGjdENtU8d3K5XDlubRY138sKh1bNyhcAe675C
	 dzXp0STs+NwZqrHokoxLfItEQNJWE9HvSBAurAqsg2K0sWYjY1Z6OAQJRdKS/MC29e
	 UHttEfI2vQdMf3+m4O5SM6I9mb8Axxgbyznk0NweMu+5rfdSwTZ2+RnpYRMUTcq600
	 5CRNHqyxOPBTKKsetZqgpP1OvEBdHhDjFIFsftlHw8LBOFJ+/YToZ+C0DR4W5GBxBG
	 b0UgXSkVXYpBB806F6brJ+2nnlWCA3StHsXy7+Um+vd+7cvM80xMnaabyaCjE3NlwG
	 220IYznESq0Kw==
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
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-usb: Add PM suspend/resume
 callbacks
From: Manivannan Sadhasivam <mani@kernel.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113103111.156476-2-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
 <20261113103111.156476-2-prashanth.k@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:10:52 +0530
Message-Id: <179578685292.13164.3928712894764955778.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=mani@kernel.org;
 h=from:subject:message-id; bh=MTCJpckqKtkOgXfkUeumsV2i/Yarf0sYFkZT26i8sLM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCYhoq1p6wtIB34/tn5x7Vg8CjzZ2s69Z+7/sq
 IIMAN6kTKiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmIaAAKCRBVnxHm/pHO
 9enSB/4ikNp/KXToJs6w7LUGCX1XeQLNUNs5F0ITW0PxDzc6nZeuZ0KOR/R9Qw6gsuIX68qPP+3
 B7Aq+vDHgijss7xJeD40uuvWdRCSafTUqQ+dojPK7HvXzdvWQVw6gfYvdxioAg3oREWrGP2Hw32
 w9wyjUb/jPE8xHgzpFEuYsINRikCwaEqc1fdeOtanArt8BO/+QyXl+Oix64ftBFbl0oSiYJkLWv
 q8q+oV8s+sxbE4clFMLdg7oUErGCC358Q4bPji8M7Yj361aMEfTjks/T1X4bADdx9n4OQAswMHN
 /9pTmJe4DfK2+gkQ/umvcnjdlDCAtloja2jDdm64LxelqT1W
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-13 16:01 +0530, Prashanth K wrote:
> Currently when we perform system suspend, the phy clocks aren't
> turned off, this leads to power leakage. Prevent this by adding
> PM suspend/resume callbacks for the qmp-usb phy which toggles
> clocks on/off correspondingly.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 6a9faa0ce3bb..dc8be977e0a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -2129,6 +2129,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
>  static const struct dev_pm_ops qmp_usb_pm_ops = {
>  	SET_RUNTIME_PM_OPS(qmp_usb_runtime_suspend,
>  			   qmp_usb_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)

This indicates that DEFINE_RUNTIME_DEV_PM_OPS() can be used instead.

- Mani



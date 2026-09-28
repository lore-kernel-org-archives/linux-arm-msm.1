Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227854FD78D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630683; cv=none; b=OTrC+xkKYV8ggwDREXepOsO9hKJClWqZOYp3C9n8ptZg2+ifHPFtO/Tyy9Ay/oSWXwJHybiJKS/6NWBYNu9xbeC+iVyvzzQ2mx40XPSpjUpNp2D3s7lC8wUPk6h2Zg4KWfaLCdApyT6JaVmFHCH+Lz25cdaQbTxO8353xd0VSSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630683; c=relaxed/simple;
	bh=tHs2sgJfmgDE85fTcx2pgBoS5JPEH/b+fF69L3ELRxk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkgBB2ge+iYUeL8yQCzzfd/JdCrZYKzxrTATX6BSuXsy3GcCQel+xozHQFOo6ZnJgyMxHQs+vJqF2VqAuTaBbqAbE48vzBnlszNYubmZRmxpw0NA0DZmv5OI9ep3iRrcW106jUVTCFCVgVBB4AqptPEpXuXo8/T6TQJID0PJbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=I4DsH1qX; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="I4DsH1qX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail; t=1790630668; x=1790889868;
	bh=dfXTJyp6yjbRu0qwVAwpSfhNYTOxDGjNF8A7PpynkKU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I4DsH1qXQ2PQGDCXKZ8k2mbehlZKwgYCa3OehZLJ7ZEw3UdGr4v7+H08qJOgAcshf
	 b3G1+7xQN9oK9BSWeF1GCjDc8nrBr/wdJaEEhoybDa9qozFH1X0KHBQ08lu+4UoxVo
	 RRNrDKvAZtuw8npsoRgoktTTQD94JqSnp1MHU3NGcc0PS3AN+QWZWOR0hF8X87RQrK
	 AcI8F9uEyimLyXQh74EnGlLJ9LMTVF+2/lswNkVBmE2MckBI3to9+oWGsETUGFlSFD
	 3qVC/jRY+GH6Eo57z8bg470qaz6mKBMayLDfaCc/zK+YuALt39HkUKWTKehfIuceLM
	 qkMnNw91c2+gg==
Date: Mon, 28 Sep 2026 21:24:22 +0000
To: Robin Murphy <robin.murphy@arm.com>
From: Sam Day <me@samcday.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Invalidate TLB during context init
Message-ID: <enoPRqYYUjyyM0YwlSoxShxeNJxghej7Zhq8UxzN6WtU_JZk8Vzvl0qFkczoIFpEl8y_vbytWT7A_BntCl4HtWPcHUkAi57JoKHJA64Ap1o=@samcday.com>
In-Reply-To: <887e91bc-03a0-4977-aed6-baa2e069d9ee@arm.com>
References: <20260928-qcom-iommu-clean-contexts-v1-1-c88fe2b4ff48@samcday.com> <887e91bc-03a0-4977-aed6-baa2e069d9ee@arm.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 13122422adc9c6b1bdaba4e0e81f48ea485fb758
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Robin,

On Monday, 28 September 2026 at 10:22 PM, Robin Murphy <robin.murphy@arm.co=
m> wrote:

> On 28/09/2026 7:27 am, Sam Day via B4 Relay wrote:
> > From: Sam Day <me@samcday.com>
> >
> > qcom_iommu derives each context bank's ASID from DT data, so a kernel
> > booted via kexec reuses the same ASIDs as its predecessor.
> >
> > Programming a new TTBR0 doesn't discard entries the SMMU has already
> > cached under that ASID, so these residual and stale
> > translations/table-walks will go into effect as soon as the context is
> > enabled again.
> >
> > On MSM8916 devices (I confirmed it on both a Samsung Galaxy A5 and a
> > DragonBoard 410c) the result is MDP5 taking context faults on
> > framebuffer IOVAs and stuck in a continuous underrun storm during scan
> > out, if the previous kernel had itself initialized the display and
> > programmed the SMMU.
> >
> > arm-smmu invalidates the whole TLB in arm_smmu_device_reset() before
> > enabling the SMMU. qcom_iommu can't do that on these TZ-managed devices
> > (SMMU_SCR1.GASRAE=3D1), however.
>
> Can you not hit SMMU_CBn_TLBIALL in qcom_iommu_ctx_probe()? That would
> seem like the logical equivalent.

That sounds much more civilized, assuming it works the way we hope :) I wil=
l
respin the patch and test to see if SMMU_CBn_TLBIALL behaves correctly on
my apq8016-sbc + samsung-a5u-eur.

Kind regards,
-Sam

>
> Thanks,
> Robin.
>
> > Instead, qcom_iommu now invalidates each context bank by ASID whilst it
> > is still disabled, before programming it for the new domain. Secured
> > contexts are protected by TZ so they're skipped.
> >
> > There's been previous discussion on the list (see link) about how to
> > best deal with this kind of situation. This patch opts for a fix in the
> > incoming kernel, rather than the outgoing one. This ensures newer
> > kernels will always behave correctly, and also covers the kdump use
> > case.
> >
> > Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> > Link: https://lore.kernel.org/all/20240319154756.GB2901@willie-the-truc=
k/
> > Assisted-by: LLM
> > Signed-off-by: Sam Day <me@samcday.com>
> > ---
> > Tested on my DragonBoard 410c. Starting from one unpatched kernel
> > scanning out at 640x480 and kexecing into the same kernel at 1280x720
> > results in context faults starting at the first IOVA past the previous
> > kernel's mapped extent, with continuous MDP5 underruns thereafter.
> > During this time I observed an all-blue HDMI signal. With the patch
> > applied, the same kexec hop is free of faults, and the HDMI signal is
> > clean throughout.
> >
> > Further, it was proven that kexecing into an unpatched kernel and
> > causing the fault storm can then be resolved by subsequently kexecing
> > into a patched kernel.
> > ---
> >   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 32 +++++++++++++++++++++---=
--------
> >   1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/ar=
m/arm-smmu/qcom_iommu.c
> > index 21d18ce67b982..a37955cd90d5e 100644
> > --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > @@ -111,23 +111,26 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned =
reg)
> >   =09return readq_relaxed(ctx->base + reg);
> >   }
> >
> > +static void qcom_iommu_ctx_tlb_sync(struct qcom_iommu_ctx *ctx)
> > +{
> > +=09unsigned int val, ret;
> > +
> > +=09iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> > +
> > +=09ret =3D readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> > +=09=09=09=09 (val & 0x1) =3D=3D 0, 0, 5000000);
> > +=09if (ret)
> > +=09=09dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> > +}
> > +
> >   static void qcom_iommu_tlb_sync(void *cookie)
> >   {
> >   =09struct qcom_iommu_domain *qcom_domain =3D cookie;
> >   =09struct iommu_fwspec *fwspec =3D qcom_domain->fwspec;
> >   =09unsigned i;
> >
> > -=09for (i =3D 0; i < fwspec->num_ids; i++) {
> > -=09=09struct qcom_iommu_ctx *ctx =3D to_ctx(qcom_domain, fwspec->ids[i=
]);
> > -=09=09unsigned int val, ret;
> > -
> > -=09=09iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> > -
> > -=09=09ret =3D readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, va=
l,
> > -=09=09=09=09=09 (val & 0x1) =3D=3D 0, 0, 5000000);
> > -=09=09if (ret)
> > -=09=09=09dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> > -=09}
> > +=09for (i =3D 0; i < fwspec->num_ids; i++)
> > +=09=09qcom_iommu_ctx_tlb_sync(to_ctx(qcom_domain, fwspec->ids[i]));
> >   }
> >
> >   static void qcom_iommu_tlb_inv_context(void *cookie)
> > @@ -270,6 +273,13 @@ static int qcom_iommu_init_domain(struct iommu_dom=
ain *domain,
> >   =09=09/* Disable context bank before programming */
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> >
> > +=09=09/* The TLB may still hold cached and stale entries for this
> > +=09=09 * ASID, if a previous kernel programmed the SMMU before
> > +=09=09 * a kexec into this kernel.
> > +=09=09 */
> > +=09=09iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
> > +=09=09qcom_iommu_ctx_tlb_sync(ctx);
> > +
> >   =09=09/* Clear context bank fault address fault status registers */
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
> >
> > ---
> > base-commit: 3339792beb5fb1c9c423c544ba2fbc235e7d7f75
> > change-id: 20260926-qcom-iommu-clean-contexts-3ccda804c08d
> >
> > Best regards,
>
>

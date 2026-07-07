Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E82EC081;
	Tue,  7 Jul 2026 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395003; cv=none; b=hPiE45BWdtYJgcylp+Bbd0w6SmYPO/AbfAEcevx+HIlslPqkGbJz+hUEEb9ayNMEjYVkvFKV32ghoFSQcbeDrNuU3Goyr8GnYkwymMjSD5G/Pf3LZFSRp50p1sDU5oXwYcQMMVzxJj6zqgWJaPFIvFdynzApYWl5+h6280bCwxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395003; c=relaxed/simple;
	bh=vwTBaE6vqMPebBkKF7s+KPBrtgEj536dBlfksERdWc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV14XVDAyrc4Ikxp0LXi/1FjPNwYJj74gTBpsZffIdtXrGj4Y9j2ADlaao5WqVtVB17+vllgGHfpT6Bhe1FcsJPnHRBzzh1YBahDtlTJPs7BUch1s5Vh7WCIPSl/8IG3Cqv3HKw+H4wEr0hBVECCIKgOo2V2ln3T70aODwW0sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku8lRHNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku8lRHNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD081F000E9;
	Tue,  7 Jul 2026 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783395002;
	bh=BdSm9w9LnGQJ1pBIB81KY1z5WxN6VkGbTHYbagBNgrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ku8lRHNCf6CVUofmXA1M+X8vLitBCB4bGajAqHfEjRYVlj3ZBKiSd8nDs/NKWNmdv
	 eFJl0dxLtt5dNsCVIB0fjasu2zLQV6tIf6zOtJi/Tg6su5wVcP4XiOruAF71+chXYy
	 ySPwzzi2CikKrsisiTiFlc/GMAPO07pVMrzMtHBhwaReQCMC8Djl2EZKV1Tcoat/CB
	 VKn8lV7ZNCSDgh+YeLShXKRrje5tBR4+ferJmiXbqIxzHsC/spkSWrhw6NCj5bFAvE
	 ZPQu5d7QM2uEuEMH64UNi9YwPUT2ssxypt/27wNovIvXs9HVGChfYG0bSOP+l0JHDO
	 4v4JWLDcvtQFg==
Date: Mon, 6 Jul 2026 22:29:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Lew <christopher.lew@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smp2p: fix __iomem annotation on entry->value
 pointer
Message-ID: <akxyWw03z9fGqO64@baldur>
References: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
 <cc9cd039-83c1-479e-bb97-4c3b1345cf35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9cd039-83c1-479e-bb97-4c3b1345cf35@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 11:30:47AM +0200, Konrad Dybcio wrote:
> On 6/23/26 10:59 AM, Ben Dooks wrote:
> > The entry->value is passed to readl() so should be marked __iomem
> > so remove these sparse warnings by marking it __iomem and do the
> > relevant casting to ensure no further warnings:
> > 
> > drivers/soc/qcom/smp2p.c:280:64: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:280:64:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:280:64:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:318:34: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:318:34:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:318:34:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:446:26: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:446:26:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:446:26:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:501:33: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:501:33:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:501:33:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:504:26: warning: incorrect type in argument 2 (different address spaces)
> > drivers/soc/qcom/smp2p.c:504:26:    expected void volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:504:26:    got unsigned int [usertype] *value
> > 
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> 
> +Chris, is this actually iomem, or should this be treated as normal
> memory (since this is just coming from SMEM, perhaps just memmap()?)
> 

It's generally DDR, but in theory SMEM can dish out iomem, iff the item
we're looking for happens to reside in a RPM "aux" memory region.

It would have been nice if I figured out how to abstract this away when
I wrote that code...

Regards,
Bjorn

> Konrad
> 
> >  drivers/soc/qcom/smp2p.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> > index af0ceeaf6e07..fef6f17c3257 100644
> > --- a/drivers/soc/qcom/smp2p.c
> > +++ b/drivers/soc/qcom/smp2p.c
> > @@ -102,7 +102,7 @@ struct smp2p_entry {
> >  	struct qcom_smp2p *smp2p;
> >  
> >  	const char *name;
> > -	u32 *value;
> > +	u32 __iomem *value;
> >  	u32 last_value;
> >  
> >  	struct irq_domain *domain;
> > @@ -276,7 +276,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> >  		list_for_each_entry(entry, &smp2p->inbound, node) {
> >  			memcpy(buf, in->entries[i].name, sizeof(buf));
> >  			if (!strcmp(buf, entry->name)) {
> > -				entry->value = &in->entries[i].value;
> > +				entry->value = (u32 __iomem *)&in->entries[i].value;
> >  				entry->last_value = readl(entry->value);
> >  				break;
> >  			}
> > @@ -302,7 +302,7 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
> >  		list_for_each_entry(entry, &smp2p->inbound, node) {
> >  			memcpy(buf, in->entries[i].name, sizeof(buf));
> >  			if (!strcmp(buf, entry->name)) {
> > -				entry->value = &in->entries[i].value;
> > +				entry->value = (u32 __iomem *)&in->entries[i].value;
> >  				break;
> >  			}
> >  		}
> > @@ -528,7 +528,7 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
> >  	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
> >  
> >  	/* Make the logical entry reference the physical value */
> > -	entry->value = &out->entries[out->valid_entries].value;
> > +	entry->value = (u32 __iomem *)&out->entries[out->valid_entries].value;
> >  
> >  	out->valid_entries++;
> >  

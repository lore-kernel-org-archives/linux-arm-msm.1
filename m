Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49453C3D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702362; cv=pass; b=EPz2byRCSCbfiMacG8PMJeMMaHu8DYkVB412ugHw8tprlFWUJU5UuBP/EToy3LD+PkS/jLCZasDFBiuDTzTiMYz4dZ8qFSpCFAwxOvCEj75EBJiL4aZkZQrvr421QLOpyIhPYZqry3HbJ0Edf2FYqyUZpa/6VDR/Erdsuhgnqgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702362; c=relaxed/simple;
	bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkIJcqvwAxqdwOug0h1QIynYZYdhE5AfIq3xXyHoSyA1xSpEHaMfiFjcS0G6LKpvkgp4KfM9qgPEC+GeMUxxR0Zs+9PeWeuV/wrAevQLVJMfxbLy+/jpBTDlxn1DPrLS6xsMU0xG5cCdU1E34RHrJutCHyBqcqq4qRslOMB6YNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=hVF0yGL4; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="hVF0yGL4"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df9754484aso23001825ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702360; cv=none;
        d=google.com; s=arc-20260327;
        b=Nvz90bl2KlsMHKTZowzJowGAynijDQfQ5Jv+yyh8Bm+9Na07E8ACuL0tpDnnQTHDOr
         jae7jtV0v5H+ixVijUCmrLUx8Fl9RWsxmkzQziXQKPvXB7ubJovEQgZo6jOyF4iidjpK
         pldv1S7opRL5WKYGTryXXnjQz4MxgHFgDepeB/yOAB1IGvJvSczoyFUCtY7MyUdH+2mF
         IrJJ1S+1JG6MkEFK+LL90PDljMEcPYn3vbGJSJdlml5S9iBWu8OHKz0W2X4QXdEn5Wrw
         8+JLaoQgyyEdVFibzJ4bmwz9jdjWz4cLS8kR8GGZ8dWeY0fGH8f2NJ+eSodF8b+4KJI/
         FidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        fh=MOXdaOCpY3QcgkhuWvG62m1YHpuYUFy6yjFCrzKcVxk=;
        b=WHWjzcKasdqJarrBB/vv/mUntG/4dBxQzQ+RtktJN9AZUbLwSa0juVLgtRNp7Ow61T
         D8rPZNjgScx5hlm0bL1SZBMSxSSFiiur6yV6sbvRCIDGdBv+f4o5wA2Ag4SL4EDr0I8i
         PePXb/bNuQuDkws1Rqk3ieAAXoS1yCNKWHtJW2ta3a08PAtKJg+Tld+rZcjd0DzyeDg1
         y8n58ox1gVH8hbH+yloLYJoYBsGX48vAqc0ky7YaRPlzfS0vtJZTAbiGD/6TB9GIhe/H
         chMXcgYx0TN/1I96tslwF+tMmSHKuWGRQ2wbaX+UImkhb5/Z3zQWBKSbHW8owW60pTOO
         xoUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790702360; x=1791307160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=hVF0yGL4prYdXN8XMDa/Cw8CcLbVOt1isdWvIdPjK0HTaEhhTwGZ6GkNNkGAWq6FxC
         XF2gfXtUcjBBWi26BYCXqtlCTRKOiWUuEZkB39cZdod6SHv7ntz1JjO9+kms/CeTepZJ
         mhgSmDia3pRWsOIkGgrdpQuu+ufy0sGQkvdO/AaSGEZYWeUOLn8PHKsVSjTTVTMOTe0e
         +eH3bJG2OZlQhoBrRvscy7Z5XMwCJKYPhl785GGc3q+ddaeBfnICCWGX9mnm7MB4ZdNz
         DgTo6dTwiM/8uoPTeOJ1cema2N64LMvrcest3C/WDUdkyx4ZKs8YzfWvUcgXg+RrwCTU
         0jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702360; x=1791307160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=MBHhKJsHfNELMxn7C7mruegEg4ISYvw7rurnrRS3tXvpIa8/e8Mn8iwoScs+BmJdje
         v1JUqCYVC34WbZuYsH/oXidJ4bpPNxXP2Bat1kdnuWobE4HoIGXADZybDvPOsPjVRGa0
         tk1QlqkWsrMXy2W1MuNkIlf+FSU3i0tjWcExP4tdhl7SqaQecNzYsGlo60eZmXMMH1F7
         UA62eklZnZR3daR22btK2P9O4rgRiFvsMTxEIPmsbwDhmO4iYR0pUlJysAsSIRVXz9xe
         8I7zX3fS/Z2Y4xDhTbHAsmFva0jZplw5zYf/vORYxvhLvA5thQAMs4DXysZ0JCRtY6vu
         s8zw==
X-Forwarded-Encrypted: i=1; AKwUvBykXcyWG4azC0NENfCkbuv1Ip5eDXy1zfm2ZZYGKfG+/B4HPob4EH/rK4vGo9YUf52c+sZAMi8eQ5eq0m6x@vger.kernel.org
X-Gm-Message-State: AFq9FYI6AJi7ddLqFeVZtcM8lLMGYFxdOLC043Rnaf+DyyJYCVZkwUDY
	c3i1Jv7Dw8XAIMcEN/8dP+3saSNkOjPCGim4PZy+9vHIyrXot3gSitVpttssd+gVbGphBZ5Tcqt
	ZIqSeEBBF2SS3KGWXtcp/ui50spu8/DckLkgE8afDqQ==
X-Gm-Gg: AYBFou0h3O7l6sq3doaEb5G4AxPK4Ar4Ms3PVV5fXaNODPlZwBUQFm2/HxIzz/Gx6VP
	ZaqSQzEguf6Zy+w4hT0z6M1pDSh5wRis0KxSGjIYeFh4eP4oMF5nXKzZCzuUxRyQscC7LLV2SFG
	OO0TAJype8+S8CMr9E3BfBpcLvolNeN3Yn/DcD/Unfa6ou6YsrJmY8vpTpHp/tcFXVXBojEiv5X
	1nlviITo2IAQ6IHCjpMdqRtqTHFGBFfhs44AiyaeL3pPJBYLfrJgY1qi2cKRyUdfPi6wjuOr7cY
	KWZVRvaIMVpKUtDtQJ2X8ZqrHnsfjpCO9fs/y0bSqelyu1yE/eCCalDWtEeMqSg+FMXqsH7SdRi
	A48GK+nkab/OialGkdLIh4YoXISfGDRtBixc=
X-Received: by 2002:a17:902:f541:b0:2dd:c0ff:e72b with SMTP id
 d9443c01a7336-2df7dff6a98mr129292205ad.61.1790702360116; Tue, 29 Sep 2026
 10:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com> <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
In-Reply-To: <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 29 Sep 2026 19:19:09 +0200
X-Gm-Features: AclHuK-ToRBMZLSrRMx2mcPZtu0EDHFcdsd8teCC6hGeRk6_RwlD5j4V__Nj-zA
Message-ID: <CA+HBbNGS7sVROVN3mywPJEcRKn_+FzzxkijN4Uqv0CMLP-CEJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Marcel Holtmann <marcel@holtmann.org>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:17=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 29, 2026, at 20:05, Marcel Holtmann wrote:
> > >> +#define QRTR_NODE_HOST_BASE 0x10000u
> > >
> > > Can it be exposed with include/uapi/linux/qrtr.h also. There are user=
 space clients like modem manager
> > > which need to calculate modified node id to distinguish same service =
from multi modem over mhi.
> > > This is same as wlan use case.
> >
> > did anybody actually looked at the proposal that Denis and I came up wi=
th. It was exactly addressing this properly.
> >
> > It seems you guys came up with some hot fix and want to run with it. Af=
ter month and month of silence and not bothering to review the proposal, yo=
u are trying to push your thing?
> >
> > If you don=E2=80=99t support userspace, your proposal is broken. Plain =
and simple.
>
> I'm still willing to submit a new version of that patchset originally by
> Denis, if the kernel devs so decide that it's the way. For example, the
> "radix tree of radix trees" approach could be replaced with a hash
> table.
>
> There was also some criticism about a layering violation in storing the
> endpoint id to mhi controller. However, maybe that could be reduced by
> providing a correct abstraction around it, so that other code doesn't
> touch the mhi controller structure directly.
>
> Other criticism for that patchset by Denis was its overt complexity.
> Yes, it has more lines of code changed.
>
> This dual-card setup needs to be handled somehow, either by Denis's
> patchset or by Manivannan's patchset.

I second this, as in OpenWrt we have used a hack that worked only with
QCN9074 via its MHI debug
register in order to support boards that use AHB+PCI radios.

Regards,
Robert
>
> BR, Juha-Matti
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

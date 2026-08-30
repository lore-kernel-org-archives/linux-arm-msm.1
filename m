Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7703033FD
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788119012; cv=pass; b=kdCKlwkB89RRBpL+7piFpbBwDttK9xxVyFpgT948XrQlr9tJu9Xp3ePWn00NrJxKHYiD4rt96YxUO2UThhHptQbQHpXe7M5txbZAvT0zsXpT3tXvYMUQheQGMxOpVscB+oOhZBbEZde3SwBjMgps6Pwu58OoP/qLJCTvSpRPmjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788119012; c=relaxed/simple;
	bh=1fyGudfVL/P/wS7PXUEfL/mlFEi3QZbq3ZBqWyK4FHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKMJinL7LZMXx5a4wVOyizS8EoYlnFAbz6rZVpQ1oPF7TCm5GAs9ItDIC5CuPtnkLMo46psvjOsgwex+/qVVkETjyPhDOp96KZjjB8mcdLNNzgq3YYj3ScmBA9CY1gBjuUtoaieSDPVI1AEHN86/o6mvPa8IpOTBE+U/TRQ5VbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zip1GtYd; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zip1GtYd"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c01c79467so267121cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 12:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788119010; cv=none;
        d=google.com; s=arc-20260327;
        b=i118tKjprws+/nDHFb2LJ3ntCEQiea9N9SxylEvgUzuMZ3urL+AlNTwyAVUGWDxB7M
         7vsDw7RdkJ6nbTWYedZD7rn7ovZn944P+iRX5OW43r3Tuw9FPjZin/yTc/4TIootVpY5
         ixv1bChNtmK8jL+nMRcZOoopxhyaUF2WH3+JLKSrBqf/MQLop2bZR6P+22kbRJDxI9AT
         V/LFd1w9U0VRw34W5Rj2fvFAciVRfCK2jmxWPuZB8XGpRBHSkvRDGtXmnERJ5kWAbTow
         GU3tGQuE5Bj9AmFNAcPQwQLDld4NcWLsJzmf7YwPA7WMgQ9qIh3teNwBBgIAn1smoBLn
         ajiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        fh=ZRzftay3I/zTiWMheg6+aHqCYFWuzn2VHmXmc2QvwQQ=;
        b=mBP1YGoIUdkqv9IunpGylYyExPeC/f7ApnbueoIoSw8gbqFH2yWET9nQfO0DYm8EjO
         NXVVQbK9WNA+2Ct4fG6nQY4fYWsZ69vdm7YlR5o6L1Cpwe937YyKxyZh2hQeWjJuLdXR
         WX8KsRhfBEbNrsR9JdxI8ruMCyVXAL7Xrb0JWVKAuE8hyFe/h04nRODyCUECRmLJ17+X
         er4+CMgtKLl+gOyry1+auEXCl69k/HoejKGSV1mEoVgehymbzdS90dCjqO2QCecDWUwX
         imPkHGAugswvs5UPooNcfRocRr4hMPvQVYh8mvok6Vt5Fj2va0Y3D6T0eA/HBGP5gmyD
         FMDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788119010; x=1788723810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=Zip1GtYd/jpgw+9rPfssGFogszMSs1iT71VNQa1yxOHfmtBr4fhQDxhPnlUlj1P+pt
         CSK5inxQeV8v2xrdtOKyTdRbvt/P3sSC6PbaycW+MR27Gjx9DThf9z77L5iEzAo7A+Dr
         xqGVVq9oBkIPf/tLn279dyEwLL1WbIfbG9GrGUP84UkfsuBmHRxec+DUABQroOrWvlHk
         1+HK9sTzkPkWmOEGxRqX24owovyfCWsp9T+NF1oUNhE6kA79tyMI2J3cLYlDAAu1oxEN
         Xk/EACw/9Yr8QMcjA3cR+QV7ptRJZKpOaW+/vqseYJ+1SOnX0tIDYdB9aaqtmJKI8uzC
         T3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788119010; x=1788723810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=DbXZmFUbKYh5paOB7j42nz7sHYgjxOORur0KI9GjHQkwMV4s9+/plkfJHvTSB2vEhw
         pm1wHKdS/I14a208Iy4t+oUCYCin0TxftEzOSU5HUc6PRDd6wbhdI8552VVee1nNU2il
         FkceNJtfYdXjQwJbNjLto3hZLtXg/Cc3uxAN4QAXeS7G9gIkK6v8jQdZe9WRJ4Cwk67S
         o1U6Pr6EYHMUITRh/JhCPhh/FOVd2SxLo+DU3hzmgnYvZV3Da9rxDLj4KF9QFQ6mzq24
         agiGYYjBugnC5JtTG8J1JLQG9WqwQkTZ33SzTWoWJSR8Hq1+P015trTUU8clnHjIAV5h
         QoLw==
X-Forwarded-Encrypted: i=1; AHgh+RqKID0nuSELUcL0rYNXNc0sry7dqxI75JyO8DE233DLUiDMWr14whVCnRWIeCcufz6P26+XGtXP+o+Dd97Z@vger.kernel.org
X-Gm-Message-State: AFuF++kovDHLHmp/Q/Y1IKEUtNhvzF/a/4rzrtYT46eSbrMJf36Np/+w
	m4BwGfH4nx/kfy9ELkXz3DkfhsucqQoYMK3ZKdgRBgUyK9p5XdmlL8GpGNhLt9k93KQhNeUfBHg
	ipVh8ulZDKyPlydODczF//iHpdVKBUpah6g3iVz0NJShVkQ6tHOE5ae4C/Js=
X-Gm-Gg: AR+sD12Z7wWv5OILytQdSIrjp9ndk3OwXIJrSKxEI2Qb/q+fgBXIatq966SkCRYxwi8
	7MuxM7hicKRGuIeUiLW5VWEcfjnViqhudZbpRQTUyTjsh+MxXML7ARWku4PXOsesrlncfG2mzOe
	F1HHGZ+MQjQa/ojhRU/1aqzWtBWRU03jOTGlZzN8i84SfwVnmpg5V5xoRKbe4Ucoqqv+wwxajgQ
	UFCeaiAWSF2J9gpSVZM2M0fO8IQRLey35/b5q7ztgrz/CKhhUhzfB0+jXMNIeIwNdwehX+6TBoV
	Wpd7L2VYejst1YF6nHuzusr9VPOE0RVEDEoiPdvUMA==
X-Received: by 2002:a05:622a:102:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52ff73ae1ddmr20100711cf.7.1788119009268; Sun, 30 Aug 2026
 12:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com> <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
In-Reply-To: <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 30 Aug 2026 12:43:17 -0700
X-Gm-Features: AcwNN1UIYogI8mjESAIE2AGofbpoBdd5z6oJmUJSI9USsR1cMoCFWy7kojgNdhQ
Message-ID: <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:55=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> Instead I'll add something like below to arm_lpae_restrict_pgsizes as sug=
gested.

On  a related note, I'm debating whether we should change the word
"restrict" to something like "update" or "fixup", since we are no
longer purely restricting page sizes, we are adding new page sizes.

> >>>> +/*
> >>>> + * Install num_entries leaf entries starting at ptep (index map_idx=
_start
> >>>> + * within the current table), tagging arm_lpae_num_cont()-sized gro=
ups with
> >>>> + * the contiguous hint where both idx and paddr are aligned to the =
group
> >>>> + * size. Entries in a misaligned group are installed without the hi=
nt.
> >>>> + *
> >>>> + * idx and paddr both advance by block_size per entry, so their ali=
gnment
> >>>> + * relative to the group size is invariant across a run of entries =
within
> >>>> + * this call: once a group qualifies (or fails to), every later who=
le group
> >>>> + * does too, up to num_entries. This merges each such run into a si=
ngle
> >>>> + * arm_lpae_init_pte() call instead of one call per group.
> >>>> + */
> >>>
> >>> Can you provide an example for when this function installs descriptor=
s
> >>> where the contiguous bit is only set on a subset of them. I would
> >>> assume that the contiguous bit is either set for all descriptors or
> >>> none of them.
> >>>
> >>
> >> That assumption doesn't hold in general -- it's only true when the
> >> map request happens to start and end on a cont_size boundary. For an
> >> arbitrary map_pages() call it usually doesn't.
> >
> > I believe you won't see arbitrary map_pages() calls. I understand that
> > these calls are exclusively coming from __iommu_map_domain_pgtbl()
> > which uses iommu_pgsize() to determine optimal page sizes.
> >
> >> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> >> iova =3D paddr =3D 0x1000, pgcount =3D 34:
> >>
> >>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed plai=
n
> >>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed w=
/ CONT
> >>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed p=
lain
> >
> > In the example you provided, I expect that you'll receive three
> > separate calls from __iommu_map_domain_pgtbl:
> >  * idx 1..15 with pgsize 4KB
> >  * one call with pgsize 64KB
> >  * idx 32..34 with pgsize 4KB
> >
> > If I took your argument further, I could argue that we'd also have to
> > check if we can put down a block mapping if iova =3D paddr =3D 0x0 and
> > pgcount =3D 512, but we're not doing that either.
> >
> > Could you provide the input parameters to the iommu_map() call that
> > resulted in the parameters you provided i.e. iova =3D paddr =3D 0x1000,
> > pgcount =3D 34:
> >
>
> You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, iomm=
u_pgsize()
> already splits the request at the boundaries you describe before install_=
leaf() ever
> sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-gro=
up/suffix
> chunk for that caller.
>
> That said, install_leaf() is shared by other callers that reach it throug=
h
> ops->map_pages() directly, without going through iommu_pgsize(). panthor_=
vm_map_pages()
> (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgt=
able_ops via
> alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consume=
r, but does its
> own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ=
_2M, with no
> notion of the 64K/32M CONT boundaries. That can hand install_leaf() exact=
ly the mixed
> iova=3Dpaddr=3D0x1000, pgcount=3D34 shape in a single call (panfrost's ma=
p loop uses the same
> get_pgsize() and hits the same case). So the prefix/aligned-group/suffix =
handling in
> install_leaf() is still needed for that path.

Maybe other people can chime in here, but I feel, from an API
perspective, we should have only one way to make of use iopgtable. I
think we should just mandate that users honor the updated value for
pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
alloc_io_pgtable_ops() call and then choose page sizes appropriately.
Otherwise, we end up with two pieces of code in the kernel solving the
same problem. panthor_mmu won't be able to take advantage of the
contiguous bit until it gets updated accordingly, and that's ok.

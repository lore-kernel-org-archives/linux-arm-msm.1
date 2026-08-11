Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093EE145B27
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424676; cv=pass; b=DYYYJpBNGstuLorSu7b+Fl+urfd7CnZLvy/AQNYPTfz62La0O8t8xFtsFtfyDtOuKV4JFb8Y2+vMa9Kms5K0+GcadUTRxmg6rlJkgNdKDfA3iGuT5T/2yx2gTnWHxCD++pt1BNUzP5uAQSNsKYiZvn2PVH5sSxOSwIWcGCHWPQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424676; c=relaxed/simple;
	bh=PpQISvKwrciqTF1aWbKrFW+wu2fSy/bok9YASZzXAhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJ4I6c2MKmdkxuBqWNhEFJQ6dknNMpflzDfxgmbRICQ/frojBjK5qfk8UElq+fwJTpZA6PxB1ZwFOoN8hbzT/YKsF15dr7Xlj0tprxro+LXL6b+3QtTuf1e05PntMKngs0OKZwisiRHxPXdhBIdC8AAAy+BfnYQ0Shk5WxvpR50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qlJ0OFNs; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qlJ0OFNs"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c10ed63c0so103021cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 22:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786424673; cv=none;
        d=google.com; s=arc-20260327;
        b=VQnelabYG/Y9j/JrsqGCYQx8dVB1erVD4cv8CzU71Ae+Jhj0yJLQtEXcrItmceWqiT
         m2zOYCUsMBhXpi3zntOdrWQBxMnTAR6ZvbcUdyNXco7BU2C85LNUm4kPfBkucLKFGTWo
         th1jPYHlRGTkSdXVkboT5tY6G1nWHtckDZoiIc0ghEUM4yhemcSqexFUpb6qtn9TjTdJ
         QTz8yqbFXb7iJgSE3JbZSjRtkeY1924wKWGoeWw4VOAhrjqGkHkwDUK0/rlf3CpTEQiH
         d++FD4gU8wHFHcHZ3YyVipPiAXf6OgapO2vQLBLRKLrBKjMhfga8d6+Z9y60Ft6xJJ4I
         XlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        fh=G2XiTe8YqoramyibFcaWeYTCpzfn15Bq+vWcWcHAui0=;
        b=m6A/D+8/8tASmma5aSvDMYCcsrZM142Y+CDPwz5qXl+YrrssVD6dY8AZouLGX0+Z+K
         +q+Jngaxhu5w3MTil8AZG0g+iZJwxdLH+KamaHR1W7fHX0Itun6RveB49pCf+PdKwfrE
         DFpCJ7RSvOD3y7gCKwAobPszzKk3ZDI2D3CEnfK6VRQG+xDcok2QOU2mEOFYjQ0BsSXr
         iY5rn2MzWQjY4GjthqdwNtTRuUflcZAqpGE1cWVRTjeNONBycO9IV9c3y/6OpZDzqpy6
         kmcYCaTKJmmneDNvGNCmc6Tq+85Aa+hHdV8mAAGfG5k3/5AMOAgG8aiYW08aeUQR4ypn
         DRBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786424673; x=1787029473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        b=qlJ0OFNsdXUeAWl40lzyHhm6vJqj2ozyvfL7P3dcWrG1hJiVbeePj/rySj2wOUlQ7C
         Iva96Q7Do39+YETbo6irTIXwUzajRsJU5tnhx6QwFa/FNPkDeetVUnnm7ZSQRlk7Zz4v
         sV4Q8eKa4VKu2M/DnuQDtdIEffb10sSf41xw86XiMtbO7Jzj7w/MpSXL2uYrBzPWHx/8
         BwOefKR8zqhe9iCM3+DYA0TnAp2ro1IkU46ul2Daz1a181dfF0nusXSkQipwGZU3H7jJ
         GdmzdCaxU2JJUiZc3FL3XniKPSXabOHvGZPWKzkSUlc0RMJ9YamPsOePAi2PZXIfoFOT
         Ew8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424673; x=1787029473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        b=eB6wntA0vvTyromggwLa2tYyl43GrxB4ex5yMkN/uUd9wxVQ6h+PtDbCtPcy459BMi
         01tjVfLZizxOKX29T6vGy/cwZUvw/HYzRxanfku4G9nVIvrLqfBeYuUTOuMAqcB2XKC+
         RrAD1LwNBSoV+4CbRw5P+o0bIMmb0QTwpAU1Q7+kpNfNnYdIM2u1BQITrXVQHu9f9+gd
         IxatCmvy6RvtUxhVaPUQyMiSSG8aHtuVWQiHb/KNzHGvkTLwpsaEN/bsCItInloXh3zG
         PqmRsrmXWQJeld+mcBlO4sw0vfm9wZKkNSCxcc7vgiGQ7oKZDoMLLehoPoGg5X4FT/3E
         L32g==
X-Forwarded-Encrypted: i=1; AHgh+RpL1zbM0THlsju9nEOGBQZAdeX5RfqIh4SWC9+JGMOKgtfenalGy0r6TGt9jNEVvTT3LInqUcypmb8+hZzM@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYIblcpPYVSynMrKYR95PjdUxYwvqOzw8Hvo88BVkj+NcEfyi
	d+kNY+ATiBjkoIXUoZmUT1HYV4k18GRxXe7XlEvthdXD5Is4F8sBaOUmTBjH9Js29N9bFawKdiM
	YaVYmZvPi7VTNfIEVDC7uCn2ahLEhfAtHOqCNrEod
X-Gm-Gg: AR+sD13FUgOJaxkEmfZeudPVYBzcnGcgH0T9eQvBXHJgA6tq+43CEHNePiuTdS+HUpu
	4YWfvulJd9pVaFHjV633Lyc2rJ2FAhrGF84l3spWb+9iF1WZlie/n5+NmDWMiqxFmozB7v7muE/
	6GknFOjgmGSd6xeNuSBn+xwKJQZ2vtnmqgckPW95vvo2g9tlxS9mf9F3WFRBkuGBPLAMHJZUv8g
	0LQ1VFD6PmcRhtbooFT5L8cxnxX0VOndqgtCjstEB5SmHiq0ueFNGj9vmrPTLpbKYvgMpQpT9pt
	BKXacLQHWDj8EZkZwnKVyQx0wl+VVx47mvuSG5m2gA==
X-Received: by 2002:ac8:7fc9:0:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52d58236f99mr2540931cf.12.1786424672376; Mon, 10 Aug 2026
 22:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
In-Reply-To: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 10 Aug 2026 22:04:20 -0700
X-Gm-Features: AUfX_mz1Q0EQxjJGjo9fyY36FF5Mbr8Jb4EcjiIK9bRp6c3Ih6EjCsTWhRnEfds
Message-ID: <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:19=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 476c0e25631af..23a238de53ed5 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> [...]
> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
> +{
> +       unsigned long pg_size, blk_size, l1_blk_size, cont_sizes =3D 0;
> +       unsigned long cont_leaf_size, cont_blk_size, cont_l1_blk_size;
> +       int pg_shift, bits_per_level;
> +
> +       if (!cfg->pgsize_bitmap || (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO=
_CONT_HINT))
> +               return 0;
> +
> +       pg_shift =3D __ffs(cfg->pgsize_bitmap);
> +       bits_per_level =3D pg_shift - ilog2(sizeof(arm_lpae_iopte));

bits_per_level is also calculated in arm_lpae_alloc_pgtable(). I'm
wondering if we can somehow re-use that value, although, I do
understand that data->bits_per_level is only populated later.

> +       pg_size =3D 1UL << pg_shift;

In arm_lpae_restrict_pgsizes(), they call the same value "granule".
Can we align with that and call it granule instead of pg_size?

> +       blk_size =3D pg_size << bits_per_level;

I'm wondering if we can re-use the macro ARM_LPAE_BLOCK_SIZE. I do
acknowledge, though, that this macro doesn't work in this context,
because (d)->bits_per_level is still not populated.
Also, for consistency, you might want to call this l2_blk_size.

> +       l1_blk_size =3D blk_size << bits_per_level;
> +
> +       cont_leaf_size =3D arm_lpae_num_cont(pg_size) * pg_size;
> +       if ((cfg->pgsize_bitmap & pg_size) &&

Is (cfg->pgsize_bitmap & pg_size) ever false?

[...]

> +/*
> + * Install num_entries leaf entries starting at ptep (index map_idx_star=
t
> + * within the current table), tagging arm_lpae_num_cont()-sized groups w=
ith
> + * the contiguous hint where both idx and paddr are aligned to the group
> + * size. Entries in a misaligned group are installed without the hint.
> + *
> + * idx and paddr both advance by block_size per entry, so their alignmen=
t
> + * relative to the group size is invariant across a run of entries withi=
n
> + * this call: once a group qualifies (or fails to), every later whole gr=
oup
> + * does too, up to num_entries. This merges each such run into a single
> + * arm_lpae_init_pte() call instead of one call per group.
> + */

Can you provide an example for when this function installs descriptors
where the contiguous bit is only set on a subset of them. I would
assume that the contiguous bit is either set for all descriptors or
none of them.

> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
> +                                unsigned long iova, phys_addr_t paddr,
> +                                arm_lpae_iopte prot, int lvl,
> +                                int map_idx_start, int num_entries, int =
num_cont,
> +                                arm_lpae_iopte *ptep, size_t *mapped)
> +{
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       size_t cont_size =3D num_cont * block_size;
> +       int done =3D 0;
> +
> +       while (done < num_entries) {
> +               int idx =3D map_idx_start + done;
> +               int remaining =3D num_entries - done;
> +               int off =3D idx % num_cont;
> +               arm_lpae_iopte pte =3D prot;
> +               int chunk, ret;
> +
> +               if (off) {
> +                       /* Misaligned prefix: advance to the next boundar=
y */
> +                       chunk =3D min_t(int, num_cont - off, remaining);
> +               } else if (remaining >=3D num_cont && IS_ALIGNED(paddr, c=
ont_size)) {
> +                       /* Aligned: merge every full group in this run */
> +                       chunk =3D remaining - remaining % num_cont;
> +                       pte |=3D ARM_LPAE_PTE_CONT;
> +               } else {
> +                       /*
> +                        * Aligned idx but paddr doesn't line up with con=
t_size,
> +                        * or too short for a full group. That holds for =
the
> +                        * rest of this call too, so install the remainde=
r
> +                        * plain in one go.
> +                        */
> +                       chunk =3D remaining;
> +               }
> +
> +               ret =3D arm_lpae_init_pte(data, iova, paddr, pte, lvl, ch=
unk, ptep);
> +               if (ret)
> +                       return ret;
> +
> +               *mapped +=3D chunk * block_size;
> +               ptep +=3D chunk;
> +               iova +=3D chunk * block_size;
> +               paddr +=3D chunk * block_size;
> +               done +=3D chunk;
> +       }
> +
> +       return 0;
> +}
> +
>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       bool cont_hint_enabled =3D !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_N=
O_CONT_HINT);
> +       int num_entries, max_entries, map_idx_start;
> +       int num_cont =3D cont_hint_enabled ? arm_lpae_num_cont(block_size=
) : 1;
> +       bool use_cont =3D cont_hint_enabled && num_cont > 1;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D map_idx_start;
>
> +       /*
> +        * Normalize an exact whole-CONT-group request down to the
> +        * equivalent block_size/pgcount so it funnels through the same
> +        * leaf path below. arm_lpae_install_leaf() independently decides=
,
> +        * per sub-chunk, whether the CONT hint actually applies.
> +        */
> +       if (use_cont && size =3D=3D block_size * num_cont) {
> +               pgcount *=3D num_cont;
> +               size =3D block_size;

This appears to me as if you're throwing away information about
whether this mapping request is suitable for the contiguous bit, and
then in arm_lpae_install_leaf(), you're trying to recover that
information. Can't you just do "prot |=3DARM_LPAE_PTE_CONT" here and
then completely avoid the logic in arm_lpae_install_leaf?

> +       }
> +
>         /* If we can install a leaf entry at this level, then do so */
>         if (size =3D=3D block_size) {
> +               int ret;
> +
>                 max_entries =3D arm_lpae_max_entries(map_idx_start, data)=
;
> -               num_entries =3D min_t(int, pgcount, max_entries);
> -               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, n=
um_entries, ptep);
> -               if (!ret)
> -                       *mapped +=3D num_entries * size;
> +               num_entries =3D min_t(size_t, pgcount, max_entries);
>
> -               return ret;
> +               if (!use_cont) {
> +                       ret =3D arm_lpae_init_pte(data, iova, paddr, prot=
, lvl,
> +                                               num_entries, ptep);
> +                       if (!ret)
> +                               *mapped +=3D num_entries * size;
> +                       return ret;
> +               }
> +
> +               return arm_lpae_install_leaf(data, iova, paddr, prot, lvl=
,
> +                                            map_idx_start, num_entries,
> +                                            num_cont, ptep, mapped);

Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2441D4F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282189; cv=pass; b=KBIVEDMFd89kiLo1NafhXqU+QBIfOMDKNjPzTO7ft63a8MPuqX42JDeWzEqIjnua8bjABh0m2+AkphhnnjXz4FLHVNoSN+NuoXmik+Xr3yNrOIb2hpmH3I0ZR7p7WeCufa2jgDrdzMnUvU4UEoXcTsH3r3jiV8SejZsx0HQoM1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282189; c=relaxed/simple;
	bh=1DI5rrWvXbZEzrtTlhc+ovfTuoK1RIGdDuuJGBPbrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkANY/Xzl7/Tgc6v21oQIMlQR3i5h9Ciyn3Y5Kjq9UsalMMV2e16uvpk85tp/MU33bcEn3sIV8Mah29Cdy1MKpknhaJ60Y8j5feJnQ5SzouXHkfyAjCEJIQRfxqZ1qKSEYqnnq/8lqI4sU6wgUp7UHXeDsv3e706umrlG+lHKTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cf/KHokv; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cf/KHokv"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-532e9ad9a1eso84451cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790282185; cv=none;
        d=google.com; s=arc-20260327;
        b=jY/xJZDtaqb7TfnuSO8li1mjKy3Cz5n7nNZZnuH4m2oU7UbhRqSrMe7OtqdT3YUFzL
         PNv46RcaQ70F9SaxFXTE+sq+uyjHd3z8BMBqxWChhXVdKRblPRVr3d34L+vcANrHuBcw
         JrfcJDEA/k05zfbw8c5X27/XZY98nmQXJdNj7llbX4I7gGYD4BfryWrDklqxqHYmXQvD
         05dwwn9BrIk9/tSdB6HyZntJ0ymyD4hsTJiIGvtir9v6gQl3GJeBq7odcWTBoRxu+01r
         VEgw3Jzj7EzhVgsuU4TkW87HOePb+MyT5JNZWVsN/iIclvlet5l8pVhqsM4UDLhSFjUv
         Vp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        fh=a1pXA17Qj1EWbH/KAxiY652S3NWdDdU/LmLJWgKmVWY=;
        b=r2VCaTQx3xlNy0z3RL9KFO/dOAEUa/jT2N4HBRiON31b0tEHQFTLGtR02yMaV4xGR8
         F0vSsph4Zm0id4xVZhiFSicFnnoksFlJ/aHTVMtDMXO9ISzjdxq9grWFbWQ6F9j4IkH6
         ZVx7CjRzhFZCrswKPMb7QUFTobVh7ZxH9Oj0hnh0YFfx8fAWOq8Nl3N6gSZkArUDvT4Y
         PngLtwRWf8fjyNa44y5aPVo8iPP/5IKk52xRvRjLGf8t1QQPZ1g/mN0CViqwvgGoEsab
         +/FhDvwoVL2Ct/vX0XkxJpbOlv7lSAjOVX63GUd1rfpnX1LhFAOqHfxvNmHIZJwa7h0a
         B8SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790282185; x=1790886985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        b=Cf/KHokvqm6h2o0kwBSzPdJcpKzvpIv7Ns9agF957LfLzn1J1fusAZDGpja7RdPXZ5
         ggoREJ04w4zPiD0xSLcjT1rU3wBTV17lv++TS3a2eDsoywYh9dqnuuwrFj0eUCbc19EM
         hnSGiUDXYN9AzpI56uAwSmWHzjqqcZKGafUTiAMrSA1br0C0LoVlTbEOsJ0XR+evM9mb
         oFKGuvPVMDW7ktKXFclsumSB5mAUGZIxfUOKeKMWlzNdIOY/UhlrdFuQoamPVgOPbka2
         353DStr9LTj3Ce9n3G3djFhuygAM8ZnM/lbR7FwRcIXCci4y/sakuRzIGZQNrregfwc/
         24VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282185; x=1790886985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        b=SLXvKt0+RRljI3JnuCgZHzxGf286fl3N4d+UsOsnt+nCyEgrY5xw9ad+nFRt78NG90
         Fql4iM/crB4eQBvwcdRBaSyfiTFurzp9GY3XfSRC6CzOzbMtJplu5Wo9W0G4TrwtWCxX
         GFb3A1qYcfft9ZlKxlmKpxamRZ0xABjojhPbZuyLKRZokwxrQwrP5ocdENRkaiK94/V/
         MjAQL3Ff8LcKJT3cCpxpsKLeJ7NEzvRlfrNDy9jBldraLkUospbi5CQVef2uuxNTUmxG
         PEWR5pA1MNotBPpX1vk0hSHp+/qd7O6xNd9oqdK1bx+Cutl/31TPuTkryQlN6rq9PXkO
         2ZCA==
X-Forwarded-Encrypted: i=1; AKwUvBzpi02iBu7P0kRCdxsLsRs1bhZMpIgNyto2X2aLn1bV/bNp3Q7fTYGb1U4NUy5QU2FiwDqKhxEvw6WTC3hv@vger.kernel.org
X-Gm-Message-State: AFuF++lxgsHJ0dFv7Jn0iaxb8Sgjah0d8kalr4hSDBjyD1SE4HLB4bq1
	fvSFsmcvYa3/QdlNLg4uSNUuwC4HynvLW8EkUnfhcJGNLhKvYhAZiRUwwimRQHlfe0yn672ZlKX
	aEXcxr07WN4sESvB+en7fm2MSpLPcwgSlZHRj1ka4
X-Gm-Gg: AYBFou1jDR+ElV8I/HtzIn9Ry0zgarjnQHpq71I6DD3+9auYhLQ85h/DtCMg7sYxRDQ
	6maWsj318CMqxOfd3Mt/h0BExUPmI0dweAOcqU8k9QFJoJDhZefyGkq1nM8RC10DmCmiA/7k3VW
	l2cLtiLUdGTUdCfMGhaFCJsUApxil87ok/ANoSJ2FkfqKFwz4UZax26UAN6gAQYG2CUSWCiKbmD
	tg2hyBE4a3u6wB1WhPrzKVX5jJ7fkiJoSbUy3xTeRIEHkNg9bJ8/PG7xPvKYhUtqFJTXkLLw+Xv
	qBqM4y+Qy4y5YR2z1mB3KAK8BCJMozU2S24mgJJ1g5t4dvyjovhb
X-Received: by 2002:a05:622a:c2:b0:532:d72d:3e9c with SMTP id
 d75a77b69052e-5330c0eb219mr1811851cf.6.1790282183927; Thu, 24 Sep 2026
 13:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
In-Reply-To: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 24 Sep 2026 13:36:12 -0700
X-Gm-Features: AclHuK9Edhkw7dI8hy3s30oHjoVQuRqWKT854I2fNS_opd9KtYkgWbWonloZqbA
Message-ID: <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:44=E2=80=AFAM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 476c0e25631af..01d98959c514f 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -86,6 +86,21 @@
>  /* Software bit for solving coherency races */
>  #define ARM_LPAE_PTE_SW_SYNC           (((arm_lpae_iopte)1) << 55)
>
> +/* PTE Contiguous Bit */
> +#define ARM_LPAE_PTE_CONT              (((arm_lpae_iopte)1) << 52)
> +
> +/*
> + * Contiguous hint group sizes per granule:
> + *
> + *------------------------------------------------------------------
> + *| Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1 |
> + *------------------------------------------------------------------
> + *|     4K    |   64K    |   2M    |    32M     |    1G    |   16G   |
> + *|    16K    |    2M    |  32M    |     1G     |          |         |
> + *|    64K    |    2M    | 512M    |    16G     |          |         |
> + *------------------------------------------------------------------
> + */

I find this comment redundant. People can find this information in the
Arm architecture specification.

> +static int arm_lpae_num_cont(size_t size)
> +{
> +       switch (size) {
> +       case SZ_4K:
> +       case SZ_2M:
> +       case SZ_1G:
> +               return 16;

I'm thinking that if you use something like

return BITS_PER_TYPE(size_t) >=3D 64 ? 16 : 1

i.e. return 16 only on 64 bit platforms, then you can avoid those
overflow checks in various places. Same for the SZ_512M cases.

> +       case SZ_64K:
> +       case SZ_32M:
> +       case SZ_512M:
> +               return 32;
> +       case SZ_16K:
> +               return 128;
> +       default:
> +               return 1;
> +       }
> +}
> +
>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -462,20 +495,41 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       int num_cont =3D arm_lpae_num_cont(block_size);
> +       size_t cont_size =3D 0, entries_per_map;
> +       int num_entries, max_entries, map_idx_start;
> +       bool cont =3D false;
> +
> +       if (num_cont > 1 && block_size <=3D SIZE_MAX / num_cont)
> +               cont_size =3D num_cont * block_size;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D map_idx_start;
>
>         /* If we can install a leaf entry at this level, then do so */
> -       if (size =3D=3D block_size) {
> +       if (size =3D=3D block_size ||
> +           (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&

I'm thinking that the check for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is
redundant. If this quirk is active, none of the contiguous sizes were
advertised, so no one should call this function with any of the
contiguous sizes.

> +            size =3D=3D cont_size)) {
> +               int ret;
> +
> +               cont =3D size =3D=3D cont_size;
> +               if (cont && (!IS_ALIGNED(iova, size) || !IS_ALIGNED(paddr=
, size)))

These alignment checks are also redundant. We can rely on the caller
to pass properly aligned values. It's also inconsistent, because it
verifies alignment only for contiguous sizes.

> +                       return -EINVAL;
> +
> +               entries_per_map =3D size / block_size;

Can't you just do

pgcount *=3D num_cont;

Wouldn't that be easier?

>                 max_entries =3D arm_lpae_max_entries(map_idx_start, data)=
;
> -               num_entries =3D min_t(int, pgcount, max_entries);
> -               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, n=
um_entries, ptep);
> +               num_entries =3D min_t(size_t, pgcount,
> +                                   max_entries / entries_per_map) * entr=
ies_per_map;
> +               if (!num_entries)
> +                       return -EINVAL;

I believe this check is also redundant. Can we remove it?

> +               if (cont)
> +                       prot |=3D ARM_LPAE_PTE_CONT;
> +
> +               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl,
> +                                       num_entries, ptep);
>                 if (!ret)
> -                       *mapped +=3D num_entries * size;
> -
> +                       *mapped +=3D num_entries * block_size;
>                 return ret;
>         }
>
> @@ -660,12 +714,18 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       int num_cont =3D arm_lpae_num_cont(block_size);
> +       size_t cont_size =3D 0, entries_per_map;
>         int i =3D 0, num_entries, max_entries, unmap_idx_start;
>
>         /* Something went horribly wrong and we ran out of page table */
>         if (WARN_ON(lvl =3D=3D ARM_LPAE_MAX_LEVELS))
>                 return 0;
>
> +       if (num_cont > 1 && block_size <=3D SIZE_MAX / num_cont)
> +               cont_size =3D num_cont * block_size;
> +
>         unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D unmap_idx_start;
>         pte =3D READ_ONCE(*ptep);
> @@ -675,9 +735,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>         }
>
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D block_size ||
> +           (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) =
&&

Checking for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is redundant. Can we remove =
it?

> +            size =3D=3D cont_size)) {
> +               entries_per_map =3D size / block_size;
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_entries =3D min_t(size_t, pgcount,
> +                                   max_entries / entries_per_map) * entr=
ies_per_map;
> +               if (!num_entries)
> +                       return 0;
> +
> +               /*
> +                * A CONT group must be invalidated as a unit. Reject a r=
equest that
> +                * starts or ends inside a tagged group before changing a=
ny PTEs.
> +                */
> +               if ((READ_ONCE(*ptep) & ARM_LPAE_PTE_CONT &&
> +                    !IS_ALIGNED(iova, cont_size)) ||
> +                   (READ_ONCE(ptep[num_entries - 1]) & ARM_LPAE_PTE_CONT=
 &&
> +                    !IS_ALIGNED(iova + num_entries * block_size, cont_si=
ze))) {
> +                       WARN_ONCE(true, "Unmap of a partial CONT IOPTE gr=
oup is not allowed");
> +                       return 0;
> +               }
>
>                 /* Find and handle non-leaf entries */
>                 for (i =3D 0; i < num_entries; i++) {
> @@ -691,7 +769,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>
>                                 /* Also flush any partial walks */
> -                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> +                               io_pgtable_tlb_flush_walk(iop,
> +                                                         iova + i * bloc=
k_size, block_size,
>                                                           ARM_LPAE_GRANUL=
E(data));
>                                 __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
>                         }
> @@ -702,9 +781,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>
>                 if (gather && !iommu_iotlb_gather_queued(gather))
>                         for (int j =3D 0; j < i; j++)
> -                               io_pgtable_tlb_add_page(iop, gather, iova=
 + j * size, size);
> +                               io_pgtable_tlb_add_page(iop, gather,
> +                                                       iova + j * block_=
size, block_size);
>
> -               return i * size;
> +               return i * block_size;
>         } else if (iopte_leaf(pte, lvl, iop->fmt)) {
>                 WARN_ONCE(true, "Unmap of a partial large IOPTE is not al=
lowed");
>                 return 0;
> @@ -943,8 +1023,23 @@ static void arm_lpae_restrict_pgsizes(struct io_pgt=
able_cfg *cfg)

I want to re-iterate what I wrote earlier: I think we should change
this function's name. This is what our AI model has to say:

Originally, arm_lpae_restrict_pgsizes() performed a purely monotonic reduct=
ion:

  1. Identified the translation granule (e.g. matching CPU PAGE_SIZE).
  2. Performed a bitwise-AND (cfg->pgsize_bitmap &=3D page_sizes) to
discard non-granule sizes.
  3. Clamped ias and oas.

With this commit, it now:

  1. Restricts to the base granule sizes (&=3D page_sizes).
  2. Expands the bitmap with synthesized contiguous sizes (|=3D num_cont * =
size).
  3. Restricts again against ias and oas (&=3D GENMASK_ULL(...)).

Calling a function ..._restrict_... when it actively synthesizes and
injects new page sizes violates the principle of least astonishment.

>         }
>
>         cfg->pgsize_bitmap &=3D page_sizes;
> +       if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT)) {
> +               unsigned long sizes =3D cfg->pgsize_bitmap;
> +
> +               while (sizes) {
> +                       unsigned long size =3D BIT(__ffs(sizes));
> +                       int num_cont =3D arm_lpae_num_cont(size);
> +
> +                       if (size <=3D ULONG_MAX / num_cont)
> +                               cfg->pgsize_bitmap |=3D num_cont * size;
> +                       sizes &=3D ~size;
> +               }
> +       }
> +
>         cfg->ias =3D min(cfg->ias, max_addr_bits);
>         cfg->oas =3D min(cfg->oas, max_addr_bits);
> +       cfg->pgsize_bitmap &=3D GENMASK_ULL(cfg->ias, 0);
> +       cfg->pgsize_bitmap &=3D GENMASK_ULL(cfg->oas, 0);
>  }

Gemini added the following. I have to admit, though, that I'm not
familiar enough with dirty bit tracking to determine if this is a real
concern.

Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)

When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 table=
s:
 * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
queried and cleared on a page-by-page granularity
(iopte_set_writeable_clean(ptep)).
 * If a single 4KB page within a 64KB CONT group is marked clean while
neighboring pages remain marked dirty/writeable, the descriptors in
that group will differ in access permissions (AP[2]).
 * According to Arm ARM D8.3.1, all descriptors in a contiguous block
must share identical permissions and attributes. If dirty tracking is
active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
should be set or whether CONT sizes should be suppressed when
IO_PGTABLE_QUIRK_ARM_HD is active.

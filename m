Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD633C502
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740351; cv=pass; b=Eug8O8ZI5SHnvD/xrJLNTk3tDbbKvi3M/xI95FRVmBdk1GSEKUs+Dzhm5ZoydxSP5M5ORXIWyhA7XcdnwP/T7XkZ2m11acdnrF0wFir3YCpWvYd1/9UETQG1gZSXZ4Af04Y0U+6+Kid5DlAk0ZRIXx1MzpFkDNCWDma3DdrHxLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740351; c=relaxed/simple;
	bh=xWrd8PZWJsixg05es9DAonhAOJCzAB7wZrU+SCC2Vm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCsLFS0Dq502hY7iRvPyXeFh3rH7QmeXPr+OmXN2/3hWh74kX4GEMRRimT03YF5Wo7N3wabX3lNMJAi3XzN78jsTnxEORYdTf3JxIzRbNIRDDM84TKMf8v4gxcN6I4HS/jlY1bDCClktor/Y+ZR8L4efJI8nMnTXPRsZrm86ask=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E5J/Yzcg; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E5J/Yzcg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c15a5b265so357481cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 13:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786740348; cv=none;
        d=google.com; s=arc-20260327;
        b=jER9ZJMOi8WVO/tBJSIJseC/CK4evULT8NxkJj+uGVfUsGOO8CVhsgvKZa+SqSQpFx
         HPCaCOEg6LrK29/ZdoenTyxkfkL6NfdVIfXAnKJU4Ro1gP+92vo83L1LHm1arvXwPyl+
         0XP2R6oyaJm7sQkDju2z+HN2nfbX3M48WChCVFA9oBfbeilrNIuUMpJP7MGgQ3Fn8j44
         ifsSiZ+oGCcwoQ4dpmEXy7amOZ/decoitB4WDQ80+ufGPt19Zm3pskJb0sPhyhSTyknc
         Yqe9Q2GF7Uw8fecXLf6DlX2+PNueJuIZfuB3L0ERPyok28ZNGZ1cZnZbI/v8VGyHu12y
         osJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        fh=N0KNO8ex81QN0taCR6wy9SqyslXYikY4oGU9ESoISfg=;
        b=ehQkeiBVx26864/aRjdFtxziG/QZdrEEc1Mc/KFdOVtHHcV3K26wp2CPW6YaY4sNxn
         OMJl0BNbS+aMMPeube8VhtTFwnaK2sFvYHv8iaVnPMh/ST516n+npBOqjJSsCyOuhcj8
         X2txvhD/P69bTcE4S0FylaTLe2X2BNbJX7ArN9ByoQwEE5LOdjqY1ZMH+P1Ef5+ncwAt
         1Rxo1wwL4onx6wbvIm0TrdgE6a2Z1PRpxugP2qiLKe7N9M/VMQJMH6lMZp9BakzviL9D
         vTYxUsE3XO0V/PIWi8yfpvomGy100f0IC8QnbKfnDzP/Uzj58RoCq9pQzMqc5hsCmiwJ
         Ycnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786740348; x=1787345148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        b=E5J/Yzcgf0L8efZjlE8M8XR8vFKsvrURcP347TFc75TIkh8HnNMVbP4AL+6nnZeVra
         +i1bFTtWCDtfDfE/mHEtfzYhSRD1cBgc7u3IzWnVbd7IDsMBo52o4GVnCeKpP4AphA73
         zj5TBcYrxiambA0w8ujhO85TDSQkeK9YWEngde0dKhWp5rNkNAP+ULjwrU78GzPkyQIU
         ubUaXc8H9nXMS+/eSduENPO0kHUz5bfR7Mw/oDgR2qMhWjthKm/ioa28w/IyTruRh65j
         Jqz+mdfa29ss9aWsSOjOCHbBKu9C7OYznNoMejy1bTMDKqLpWOlOhN6HW4t9YQFMgUL+
         mLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740348; x=1787345148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        b=omT7IhITIz15g6ECR5AKgW5ymrlgbGBvowWbp4wPKVmCLLPOZLdnu24hq1zDKh3B+1
         Z8P0Wi0I90ocXsyEJ8gVDpKE/QL0HJtcrx8bnAt/8H0ZQuJ0o/WXuy2y57h+Gk6KRzgm
         wIbrh1VHfn43seLzezcGrYX6PCP0Q4LKkbFTsORdIcwANEbgDdf1DridPxZz0sL+7bdv
         kXzzIL6t8ksnExqI5fH+fe4t/RGm8QnfnPiDB8gercLJf23BjT6blFpXnLaRpTvP+JR8
         GSl7b0SA2Rab2Xkx1rYApxTl2uQWZiIS7z8FVGayxT/6aP3I1V+EtDj6f6YBeQkxwmdf
         wJHw==
X-Forwarded-Encrypted: i=1; AHgh+RpMhFg6x7UixlJRPd9BfatS1GDWsXte9OxOtJirBP1Aem8+4Rxw/T3/mHeaRMjzKjVNZLemabeTGVeIVt38@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgcqm8g9FSu2/baV1fMLLmQ0vVTNZWmWZx6IU0FLJvL7CKcfq
	J37TOnoB9n8CllZUYNd9/I2dec5gid5JPzokqzxn5sWeh4tVsYKwsh9WngnEcvGfLnXnEqFZW36
	Fka6MpqX474phElg8ukrhL0GoI08RYzEhjrCg6+CV
X-Gm-Gg: AR+sD10RHrKkLMEwFBUa13V4A2mCx2kVLfPtiaH9RbvA0b/KKPkO8SSXGA+qHuxqI7m
	owUaRZIO9i5hnbXoRvrbocqgDdHQ8jlW+BgZse9H7xv9iJK08rldlAbPgl+uDGa/d9y4Hjgqzcm
	at7ST72a4iAr/NGfXtTE0HZ/zlEYhwDYFpqnl9dnyQEltDdDsSM4lxTX3cu/j76KJuZ7K7tVz7x
	QLQtYCn872MHHU7Gjz6UPDuZhZCOerIqFwJLnHIC1Zpw1pfk0c3DEP5rRQL9FBLb28vPcCJOqj4
	3Tt+FWFiPxjUIS/7KkEDFWlLtb8jEG27PNlRDjjajw==
X-Received: by 2002:a05:622a:620b:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-52d845c09f5mr27121721cf.8.1786740347730; Fri, 14 Aug 2026
 13:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com> <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
In-Reply-To: <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 14 Aug 2026 13:45:36 -0700
X-Gm-Features: AUfX_mw7BuTuxcGh8LnvM7gYfz3LaE3KvKBdBRwSQq9-7IAPRVvGMYyqokzfJAo
Message-ID: <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:13=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
>
>
>
> On 8/11/2026 10:34 AM, Daniel Mentz wrote:
> > On Mon, Aug 3, 2026 at 11:19=E2=80=AFPM Vijayanand Jitta
> > <vijayanand.jitta@oss.qualcomm.com> wrote:
> >> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable=
-arm.c
> >> index 476c0e25631af..23a238de53ed5 100644
> >> --- a/drivers/iommu/io-pgtable-arm.c
> >> +++ b/drivers/iommu/io-pgtable-arm.c
> >> [...]
> >> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *c=
fg)

I'm wondering if we need this function at all. I'm trying to
understand that would happen if we advertise page sizes that cannot
possibly be used given the constraints imposed by cfg->ias and
cfg->oas.
arm_lpae_read_and_clear_dirty() appears to check if the end of the
iova range is out-of-bounds (WARN_ON((iova + size - 1) &
~(BIT(cfg->ias) - 1))), but function arm_lpae_map_pages() appears to
not have such a check.

If we need to restrict the "cont sizes", we could consider Will's
suggestion: Add all the sizes to cfg->pgsize_bitmap in
arm_lpae_restrict_pgsizes, and then subsequently clamp it like so

cfg->pgsize_bitmap &=3D (BIT(cfg->ias) - 1))
cfg->pgsize_bitmap &=3D (BIT(cfg->oas) - 1))

That would be shorter than the 39-line arm_lpae_get_cont_sizes function.

> >> +/*
> >> + * Install num_entries leaf entries starting at ptep (index map_idx_s=
tart
> >> + * within the current table), tagging arm_lpae_num_cont()-sized group=
s with
> >> + * the contiguous hint where both idx and paddr are aligned to the gr=
oup
> >> + * size. Entries in a misaligned group are installed without the hint=
.
> >> + *
> >> + * idx and paddr both advance by block_size per entry, so their align=
ment
> >> + * relative to the group size is invariant across a run of entries wi=
thin
> >> + * this call: once a group qualifies (or fails to), every later whole=
 group
> >> + * does too, up to num_entries. This merges each such run into a sing=
le
> >> + * arm_lpae_init_pte() call instead of one call per group.
> >> + */
> >
> > Can you provide an example for when this function installs descriptors
> > where the contiguous bit is only set on a subset of them. I would
> > assume that the contiguous bit is either set for all descriptors or
> > none of them.
> >
>
> That assumption doesn't hold in general -- it's only true when the
> map request happens to start and end on a cont_size boundary. For an
> arbitrary map_pages() call it usually doesn't.

I believe you won't see arbitrary map_pages() calls. I understand that
these calls are exclusively coming from __iommu_map_domain_pgtbl()
which uses iommu_pgsize() to determine optimal page sizes.

> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> iova =3D paddr =3D 0x1000, pgcount =3D 34:
>
>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed plain
>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed w/ C=
ONT
>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed plai=
n

In the example you provided, I expect that you'll receive three
separate calls from __iommu_map_domain_pgtbl:
 * idx 1..15 with pgsize 4KB
 * one call with pgsize 64KB
 * idx 32..34 with pgsize 4KB

If I took your argument further, I could argue that we'd also have to
check if we can put down a block mapping if iova =3D paddr =3D 0x0 and
pgcount =3D 512, but we're not doing that either.

Could you provide the input parameters to the iommu_map() call that
resulted in the parameters you provided i.e. iova =3D paddr =3D 0x1000,
pgcount =3D 34:

>
> One arm_lpae_install_leaf() call, three chunks, CONT set on only the
> middle one.
>
> >> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
> >> +                                unsigned long iova, phys_addr_t paddr=
,
> >> +                                arm_lpae_iopte prot, int lvl,
> >> +                                int map_idx_start, int num_entries, i=
nt num_cont,
> >> +                                arm_lpae_iopte *ptep, size_t *mapped)
> >> +{
> >> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> >> +       size_t cont_size =3D num_cont * block_size;
> >> +       int done =3D 0;
> >> +
> >> +       while (done < num_entries) {
> >> +               int idx =3D map_idx_start + done;
> >> +               int remaining =3D num_entries - done;
> >> +               int off =3D idx % num_cont;
> >> +               arm_lpae_iopte pte =3D prot;
> >> +               int chunk, ret;
> >> +
> >> +               if (off) {
> >> +                       /* Misaligned prefix: advance to the next boun=
dary */
> >> +                       chunk =3D min_t(int, num_cont - off, remaining=
);
> >> +               } else if (remaining >=3D num_cont && IS_ALIGNED(paddr=
, cont_size)) {
> >> +                       /* Aligned: merge every full group in this run=
 */
> >> +                       chunk =3D remaining - remaining % num_cont;
> >> +                       pte |=3D ARM_LPAE_PTE_CONT;
> >> +               } else {
> >> +                       /*
> >> +                        * Aligned idx but paddr doesn't line up with =
cont_size,
> >> +                        * or too short for a full group. That holds f=
or the
> >> +                        * rest of this call too, so install the remai=
nder
> >> +                        * plain in one go.
> >> +                        */
> >> +                       chunk =3D remaining;
> >> +               }
> >> +
> >> +               ret =3D arm_lpae_init_pte(data, iova, paddr, pte, lvl,=
 chunk, ptep);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               *mapped +=3D chunk * block_size;
> >> +               ptep +=3D chunk;
> >> +               iova +=3D chunk * block_size;
> >> +               paddr +=3D chunk * block_size;
> >> +               done +=3D chunk;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned =
long iova,
> >>                           phys_addr_t paddr, size_t size, size_t pgcou=
nt,
> >>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte=
 *ptep,
> >> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgt=
able *data, unsigned long iova,
> >>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> >>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
> >>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> >> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> >> +       bool cont_hint_enabled =3D !(cfg->quirks & IO_PGTABLE_QUIRK_AR=
M_NO_CONT_HINT);
> >> +       int num_entries, max_entries, map_idx_start;
> >> +       int num_cont =3D cont_hint_enabled ? arm_lpae_num_cont(block_s=
ize) : 1;
> >> +       bool use_cont =3D cont_hint_enabled && num_cont > 1;
> >>
> >>         /* Find our entry at the current level */
> >>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> >>         ptep +=3D map_idx_start;
> >>
> >> +       /*
> >> +        * Normalize an exact whole-CONT-group request down to the
> >> +        * equivalent block_size/pgcount so it funnels through the sam=
e
> >> +        * leaf path below. arm_lpae_install_leaf() independently deci=
des,
> >> +        * per sub-chunk, whether the CONT hint actually applies.
> >> +        */
> >> +       if (use_cont && size =3D=3D block_size * num_cont) {
> >> +               pgcount *=3D num_cont;
> >> +               size =3D block_size;
> >
> > This appears to me as if you're throwing away information about
> > whether this mapping request is suitable for the contiguous bit, and
> > then in arm_lpae_install_leaf(), you're trying to recover that
> > information. Can't you just do "prot |=3DARM_LPAE_PTE_CONT" here and
> > then completely avoid the logic in arm_lpae_install_leaf?
> >
>
> That optimization only applies to the exact-whole-group case already
> handled above (size =3D=3D block_size * num_cont). A single map_pages()
> call can also cover the general case shown above, where a misaligned
> prefix/suffix surrounds one or more aligned groups within the same
> call. Setting prot |=3D ARM_LPAE_PTE_CONT unconditionally here would
> incorrectly tag those misaligned entries with the hint.

Due to how __iommu_map_domain_pgtbl and iommu_pgsize operate, I don't
expect to see the prefixes and suffixes that you are describing.
Instead, I expect we'll see separate calls to __arm_lpae_map(): One
for the prefix, one for the set of aligned groups and another one for
the suffix.

>
> arm_lpae_install_leaf()'s off/remaining logic is what detects those
> group boundaries per chunk, so I don't think we can drop it in favor
> of always setting prot |=3D CONT at this call site. The size =3D=3D
> block_size * num_cont check here is just a fast path for the common
> whole-group case, avoiding a walk through install_leaf() for something
> the caller has already told us.
>

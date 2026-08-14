Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59583E8323
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786744669; cv=pass; b=BBpKzMYrIqJ93XH/D+OD4HrJvjrqA92TnrfKI4bubHIJb3FrtoVoEWzoiJWq3HQE+Y2ZPzSzTJxL+gUOzy+Dt6om9rPP4rUzujroiBhRMY6vUBZPKsG7NhFcQNEoXzc8JmD4SLQBIUWkznmAYKk9W2Imah8YwVNBO+3Sm9g+4U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786744669; c=relaxed/simple;
	bh=DQBzlyWe/dY1MnAyhHUw8AfdNURN8gg0HjSS3nmXkuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omcqpW4vmPDdidp/QaeClaB5VsYkPj9mdgWcObHNqPeTAs/fIJoqlkFT1pI7rRflwAfesly4IRB/s+/sftPBjTXLbqw8WwOxIuQFGt2aErebiKGnZrUQxSUR8zYQbApAlGa7tXR1hFlo67f/3EjMzNKcKK+bEnnqLMp5vVStHBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B16TM703; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B16TM703"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c01c79467so438291cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786744666; cv=none;
        d=google.com; s=arc-20260327;
        b=lFB3PECQEIb2xQpj3DLHfkfnrIjLfLiQa+GfYYZnXvXceDFToDLuuboKRrm44QrbuC
         ZLH764rS1xhaRFUI8J66f9Q5V/YUYRm8BEf6/f5DgvRagMYZuySJdh/UIgFXWzsTfuTv
         6lyPiYc3FjcXcO8sB0Nm4Ogjzx/MI0dJ29TuJL44Y2QzyW95S8WPXdU6mg51H9ms6HLE
         ixrjbk0f3H8tQISkVo/REBhLeGufiMg0w04usl9fqZiVngXaG1pGpts34IVrCUjVnspa
         hcFXbHDJIeXkjuqHVUCMZq5a1DrFaEGuATqKn6ZEmq+Q7Ycxu534ii7Cg8BKlpUssxj4
         bs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        fh=KE3eBo0GgqRu/lFIq345hVeWCV6tULg/6+rHXZrhqHM=;
        b=EKulHp9zer6wq8pQlQGaibPwQy0gFtE0PpFNrTuyH3HHof9G/jeI3XDVYiuLG3KfEt
         IAmq+YA0v6nbbTgWxRL4JQQ0UJXsa4f1K97gNdF8jp0DDbQxB68rx28SfSszfZxzdDgT
         DLkWoT9aIpHXhHAVo0mwzvAjPdfu2O7dFjNzHEkj75hBka0DqOMR/S67GIFcQQyxHNHP
         PXSqYRAnep8mbVl2b4OkpN3y+aEFZQm2ylChtV344+kT1pOW5IoEpMuWT1i/0VZ2ZnVv
         DofRZ1VQBK68Xn38ulB/6AIouLUmr2+2cHwOKZw8R9bTXflGeHbI45J915NrCavdWJiE
         IqtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786744666; x=1787349466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        b=B16TM7035E6FDsssgiX2k9WSnXIRRl9nP4A3/Fab63MbUH7aNzENU8sirCwQioKjbQ
         iNPMxKnqsOeeFflQ6aXM0mVk6dwPQqj1EQ3gLS6gXHTR9vMJFUF2FxTi0sSInPCn3LMr
         PVmX29NbF7POTRMtOOKPpmKXFQ8DRTXie9P2SbsnMFLQ5HsCBa2D1oSLeB+m+x3VBOez
         tArh8UlBAo26dDWVJZ/QKYbqbwilD0RHmuebn3Ufcwp7Fv9bACGAPyGVX3XzlWiQ91GZ
         TxI0r89xUQEFAje6carNZetb1bMYMsy1bqPXz5bnj4Y8EOC6FAilHYrOmcRlyERKM27Z
         Fw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786744666; x=1787349466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        b=ce35yyWBKbhW7vXrnp2Vt12hoXJtOK++gVti6fVH6JsZLRpdg5vLR9J7kcl1j1k6wx
         rYK4tVYlIy7n3o5wy6kojvQkp3gFgVlT88B3KsnwSpMUAzi2cMYBxyzjKoTPlPsK6qae
         QtwE8VbikvzolVg4fVDIzh/hrkPE4vqkl/I/HdXMmYE9JrC1yRSkb+4+XEpdFO+I9yYg
         aX9vADAG9tJ1PwGyk/GV3LdPyZ9MNKqvSC7wkAUebzcjGq7pxGwuh8tf5YfloOcrLbWT
         PhReMw09wxIGpYYDucTOLNhHfwoh1sYqYxA8m02cby3pSOktOD4khGtGxd89Z0ldi4Fa
         W6QA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx1JK31x9ddCFQ9zSASHBGnWfDlKQpkrQHzEBRZhpMVMwX+/x5+QRz3vx9pOKUo/U5Xn1FsE9jVSCSLFg1@vger.kernel.org
X-Gm-Message-State: AOJu0YzaM1+pPhr/p4D/nXiSioBLgwR1RiUPKkRzptybxqb60LUp1/Mp
	bLWxB4dzyhX2hGzU/oMt2o548kSlY9/J0IaCk1f0z3VaONVaV3bHd3Hi91qn/Z8xRLGAHB7HfSh
	44DSoeo6LGX54PdJppzatdUKZc0PJ/usrlBwQq6k8
X-Gm-Gg: AR+sD121FXY6HT5u0ZHHPpqfpsogX63wNBnyUNAQnIZHzmL2lnpiaEK029IGQ8VU4Gk
	bCSt87C0P46VD/zyjvanMA1749pJ9/2eqnR1++SJVcmUH+TeN6b8SIkssPjx6tl+OgNG04yoF54
	yGUJ7PambxYWuWkCBEWeYuz6CliDiM7i38BmPRJS5JXLQs4Y7/47rEyAykjCrWkdUFA6HHYuJMg
	SW7gtOt668tTJ5rBYSouO0espc3/qvTRKB9UUDhdJBFloV1tgAzxkQfqJjVhcdb+6H8fdcVdMEQ
	NTydmBuFZYiGsDK9WBBNBJbeohPPhF83RV1uE/YnJmsgA65nDPnm
X-Received: by 2002:ac8:5e4e:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-52d84770c21mr23823461cf.10.1786744665581; Fri, 14 Aug 2026
 14:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
In-Reply-To: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 14 Aug 2026 14:57:34 -0700
X-Gm-Features: AUfX_mw13XLnJC6leTXSRX-bWXhXBbTh-sh7eRo2QsAUaW0Ge3uaaXn1mQEwLlI
Message-ID: <CAE2F3rB7zpPFfC376mP=god9HWRmKOaQUEgPVzKScxS12pZrvQ@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:19=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
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
> +       pg_size =3D 1UL << pg_shift;
> +       blk_size =3D pg_size << bits_per_level;
> +       l1_blk_size =3D blk_size << bits_per_level;
> +
> +       cont_leaf_size =3D arm_lpae_num_cont(pg_size) * pg_size;
> +       if ((cfg->pgsize_bitmap & pg_size) &&
> +           arm_lpae_cont_size_fits(cfg, cont_leaf_size))
> +               cont_sizes |=3D cont_leaf_size;
> +
> +       if (cfg->pgsize_bitmap & blk_size) {
> +               cont_blk_size =3D arm_lpae_num_cont(blk_size) * blk_size;
> +               if (arm_lpae_cont_size_fits(cfg, cont_blk_size))
> +                       cont_sizes |=3D cont_blk_size;
> +       }
> +
> +       /*
> +        * l1_blk_size is only set in pgsize_bitmap if level-1 blocks are
> +        * supported for this granule (not 16K/64K, per
> +        * arm_lpae_restrict_pgsizes()), so no extra gating is needed her=
e.
> +        */
> +       if (cfg->pgsize_bitmap & l1_blk_size) {
> +               cont_l1_blk_size =3D arm_lpae_num_cont(l1_blk_size) * l1_=
blk_size;

Our AI model is saying that this might overflow cont_l1_blk_size on 32
bit platforms i.e. 16 * 1G doesn't fit into a 32 bit type. It says
that cont_l1_blk_size will be truncated to 0, and
arm_lpae_cont_size_fits() then calls ilog2(0) which is undefined.

> +               if (arm_lpae_cont_size_fits(cfg, cont_l1_blk_size))
> +                       cont_sizes |=3D cont_l1_blk_size;
> +       }
> +
> +       return cont_sizes;
> +}
[...]
> @@ -660,6 +829,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       int num_cont =3D arm_lpae_num_cont(block_size);
>         int i =3D 0, num_entries, max_entries, unmap_idx_start;
>
>         /* Something went horribly wrong and we ran out of page table */
> @@ -674,10 +845,22 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>                 return 0;
>         }
>
> +       /*
> +        * Normalize an exact whole-CONT-group request down to the
> +        * equivalent block_size/pgcount, mirroring __arm_lpae_map().
> +        */
> +       if (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &=
&
> +           num_cont > 1 && size =3D=3D block_size * num_cont) {
> +               pgcount *=3D num_cont;
> +               size =3D block_size;
> +       }
> +
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D block_size) {
> +               size_t cont_size =3D num_cont * block_size;
> +
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_entries =3D min_t(size_t, pgcount, max_entries);
>
>                 /* Find and handle non-leaf entries */

This comment is no longer accurate. The handling now extends beyond
non-leaf entries.

>                 for (i =3D 0; i < num_entries; i++) {
> @@ -687,6 +870,40 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>                                 break;
>                         }
>
> +                       /*
> +                        * A real CONT group must always be invalidated a=
s a
> +                        * unit, so reject an unmap that splits one. Chec=
k the
> +                        * PTE's own CONT bit rather than the caller's si=
ze,
> +                        * since a legitimate unmap can span multiple pri=
or
> +                        * iommu_map() calls and its size alone doesn't s=
ay how
> +                        * the underlying PTEs were grouped. Only the fir=
st and
> +                        * last entries can straddle a group boundary; an
> +                        * interior CONT-tagged entry's group is necessar=
ily
> +                        * fully covered by this unmap, since groups can'=
t
> +                        * overlap without also covering everything betwe=
en
> +                        * them.
> +                        */
> +                       if (pte & ARM_LPAE_PTE_CONT) {
> +                               bool ok =3D true;
> +
> +                               if (i =3D=3D 0)
> +                                       ok =3D ok && IS_ALIGNED(iova, con=
t_size);
> +                               if (i =3D=3D num_entries - 1)
> +                                       ok =3D ok && IS_ALIGNED(iova + (i=
 + 1) * block_size,
> +                                                             cont_size);
> +
> +                               /*
> +                                * Stop short of this entry instead of re=
turning
> +                                * 0: entries before i may already have h=
ad
> +                                * non-leaf sub-tables torn down above, s=
o the
> +                                * caller needs the real unmapped count, =
and the
> +                                * loop exit below still clears/gathers e=
ntries
> +                                * [0, i) correctly.
> +                                */
> +                               if (WARN_ON_ONCE(!ok))

Consider aligning with the following WARN_ONCE in the same function:

WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");

> +                                       break;

I think this behavior is inconsistent: when a problem is detected at
the beginning of the unmap range, you return without modifying the
table, whereas if it's detected at the end, the code proceeds with
unmapping and leaves the table misconfigured. Could these checks be
performed before entering the loop?

> +                       }
> +
>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>

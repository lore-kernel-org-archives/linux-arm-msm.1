Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902126AE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275810; cv=pass; b=sePMdUeOR8JTfAjFEksvX3KIYo6Lb5Prir3C2V6gU9OROvzf/afRrL9+a79YfBPYNlmcqqNYaMPztxsH378dqGt7eqNTQlEt1uq6iniW6UBktgld6IIDpOQqBd6mYa+YELqTKoNtlkoblmAYZhGs370H8zLZvFG64EnnyuknK+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275810; c=relaxed/simple;
	bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGun2PwI88lupGdJk75wE4M+ofX8hxuXi6K4RoO9y+X8IsTMwtTFg5Q+eFIPYKC4OvSrVQ3/7s32w2py0fTQ/b5T7kiYPr0j+x6hX6bxDoTJ59gTmjhNco7eTRjVEOIpmkqCOAp2Ttt5ZqthSD93cwzrFAVnEEzVk3PCGcB0o0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eKcp3EeR; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eKcp3EeR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53113d72966so33131cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790275803; cv=none;
        d=google.com; s=arc-20260327;
        b=YBi3TGAIZNLtFX9kE+qqd92LOl3B33IpevKFJVeJGoLMAn8i3m4ueOZiiks5AcwAkp
         hYdM0dpsJkh/0px1/FKvEoRTywgb4sf5JVP6dSU1o11ZzCYhVfojSfsw3BPBd6rhYAsh
         G85F9dr5qaCJV9KWT6NjyI7u8Is482sbI3S3JhNyV6JLgTaITrKB0+NPtIfxHxXUf7MK
         KqVvHEJMXyE4NTDL7rfM6q11eypwLRjG8BTssU/sd97jb3AHd2dkO7InCiL2tbijXjOl
         HeDHZa4/MQSlaZMF7wUsLf2wLh2z7lrBJ33Php4YyS9AnatTqOlLQrUUaTffDdDutHkO
         2QNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        fh=6X6Adm3K89TIAvwmBMj1A8Me+UvBNYGRwzZ22OnAm/M=;
        b=NVQajUnDjhojyDxMU7A08lhJt7C6Oe9goVfrrkAfKmZD1MUbAqy9YtSEnFjcujHGAk
         0j66iWTRyrEwCnHsWOVjeo9DCsVQCzC6Rcr4OHUxxcH6dUS0R0t5Lqli/NJ5kgf2MBOA
         YnHqg1jbAuGQP0QF74FfjHC6WRa3E/683iiyHk43SDLHw0D+t5YH4bn/86gIIGepGQct
         zRqB+jGURBR2DTC3gtAlhCxMg8LcPbfy46njuOng+L7D73WcOnYYqRMyczZ+ZTz6eked
         5ngFnFwkHOBpfkcJ7uZuGHv70anP+KWqdS+nx/dFqj2/Q7D+QuP3IvEOKf0TH0h1aBe4
         3bZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790275802; x=1790880602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=eKcp3EeRY3Exs24ydlk+X22pdW0CNzGOGPzcn0hcoq17U7b9zOjtCI02uTfJ0oCCV/
         3aODYtFKGiGxGehMoRF/rFpbv9YyW0iB0jS69QuhU5H274S1DZyo6Y53v2pd3XcqOWTn
         QQ7oi+h8KoryA1W5QxMYo3NW3m8KIIUmws/bl2SRMgs+87NsNpKNzczdw4ZnUIzHM1gw
         WpQGcMgagWXkzHq79dW7H6GldOsRZf4zpvLkSWe7g5GGsl2bAbIVp3hOBncKL3f7HcYH
         2EQrGvVnCZi9xhNtPyfoNaALWtqIWiahb20eNkwe/iVQlcxhtYB4WISQjjiqZZMjLJ6i
         Igyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275802; x=1790880602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovV3+8HhIOogBXh04yQPFlm05GeVlvyXWO/9SfNBaaI=;
        b=SaOnpXoVPbHEsnCwAZYdB36ZLOLnKP3SZyWGXkKKRYrs6AIMEmCsnnYxRQlbuCy1i0
         Ue5DlHQ+/6qwW4gK39L+5fSrPGPx5bm7c55pOnljwWtX++TeyDBBCPNjdy7zX0FFPhDv
         d4nVyno/JJcqxeXOgnAgrAvtMYXoyKhujbjvOSc3CVw71fAK3CTH/41+PPMmBj59hM3S
         QETl7JJVcQ0RIIdw6v7ZpBYtP8Pv1TcdH4apseTNWvbzSaU55i1NjUKT1sdxOO6tWMNo
         k0Cyafw6aHWbpud7MjFYN+ABMWSmqLi4MQVUZj2UaOfMUGrMMsUoRK5e9vmfhHIx6Q/I
         FbYw==
X-Forwarded-Encrypted: i=1; AKwUvBxoGPeDEIEmNb/DrlnnGTFhxjykhLmlzhoEQvGL44vm6az5+oYHP9uWytZ8QGkkIlE799Xao4SX3YUEAFNg@vger.kernel.org
X-Gm-Message-State: AFuF++mA82WDkpg2can1i1vRfyP31mgjtKuXeMNGWLruNLLDAFl2RlcM
	ObSZL/bjlXrNqoB4w70EmvjkKsv0STiZe3kSDUuDvgIJKyKHSePXxTctjXfHb/ZQouZFXlhTIL2
	2+nWx0RFxa6pitGz9ndsmfk/2T6k2xEctElli4pLc
X-Gm-Gg: AYBFou2p/avZ/MhWes/MVUTk9vcaRKHvjpUJyXU/KKq3WHTOMNRknkWOb47bc3qQArq
	XsQB8DNbzgW5wyE6cXpA0CJk4H8x3NPzfhG9AKfF6sC4rw7iFGfHc4U1cowZgtr+3oiE1eexQnn
	3NiP6CSvvp1JiEn6OkuoZSsIdpOCApDOM4fdy4k5wkHK0YLdvBIC2cp+dglbI9I1sBpGfXbT8IS
	UBB3nxHeVXqMQ/h9mQLBkU4jeYsHP64TI4W0+FQYujmTe5Knl60/PoGdLu0ZFl5+zRhyDuWBg0L
	fJmlYQM7qMhnpthZGzj4nEOXXx7NESKcX9K67hm+peWNGeP7rwa8
X-Received: by 2002:ac8:5a47:0:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-5330b91b69amr764001cf.15.1790275801917; Thu, 24 Sep 2026
 11:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com> <20260924001502.GO1540250@ziepe.ca>
In-Reply-To: <20260924001502.GO1540250@ziepe.ca>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 24 Sep 2026 11:49:50 -0700
X-Gm-Features: AclHuK8NxjjK4LAAInZh9B-AiWvxMmczV1znpTfWeKjoAyhZX_I7iFt3P7YZv3g
Message-ID: <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:15=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> >
> > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > When a set of consecutive PTEs map a naturally aligned contiguous block=
 of
> > memory, set CONT on every descriptor in that group so the hardware can
> > combine translations and improve TLB reach.
> >
> > Advertise the supported CONT group sizes in pgsize_bitmap. Callers sele=
ct
> > those sizes through the normal page-size selection path; io-pgtable-arm
> > then installs the corresponding tagged descriptors directly. A partial
> > unmap of a tagged CONT group is rejected before modifying any descripto=
r,
> > so a rejected request cannot leave the group partly unmapped.
> >
> > The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disa=
ble
> > CONT support for hardware with implementation-specific errata.
>
> smmuv3 has this errata, it must be disabled there too. I didn't notice
> it in this patch?

SMMU is an architecture specification. I am not aware of errors in
this architecture specification that would preclude the usage of the
contiguous bit. I understand that Arm MMU-700 has the following
erratum

3777127 Under invalidation in TBU possible when using contiguous page
table entries

The recommended workaround is described as

"Ensure that contiguous page tables are removed using a single range
invalidation. Arm recommends using range invalidations to remove
contiguous entries anyway for performance reasons."

and I believe we are already doing this.

Which specific implementations of SMMUv3 do you have in mind that have
errata precluding the usage of the contiguous bit?

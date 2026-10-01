Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C443FE359
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843949; cv=pass; b=WSFVN6UjccRn2KgCWeQ512mfWMG5MKF9IZA5jAMdKLUKDIU/DEuwpdkVIZLkRh29VURLxxhYEBZF9W3P+ZCQzyitlLp0PN7SgxxndGnB3w4XHpCe0NpBlSpoWrQOzYrCgowC6yC7rl8U24wdI0aY5BWZjxjfZwfspfqAcpODFwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843949; c=relaxed/simple;
	bh=6YG9b/mbyvuxfZJR/hYoxQdWj22xbNm9I8WMVofwsR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXQDoyYY7t4uLQ9RQKfPAeRUr2r15NUPhKfq79Ia3fVWJq9NMSilSGJEamfbvOw4gp8bUVzCnTx9ZAieQk2GZFPDlq/is4ndS+0O9ebVjVBS2ECkhF6O3FEu7iOJwyMfYY4fkiY4ACdO577DtCHx9amQ0IpgzQWIJ1DYLoohQY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/Ctwx1P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ktikbia5; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/Ctwx1P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ktikbia5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790843946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QhRQ2U3DMY45aElgUFHYhWE/nkabZyIzB51AujeYOU=;
	b=O/Ctwx1P50OXgYMUVbTL54Zq2NbNsyysZqdEca0PFB/rc3pSnrMvall+gVmuYFeqXnctC6
	Lcy0BpSg/v8bVQeHuBLUlawUVLGcMdN8yPCn1CLlwVYEmCJPNtdYY4oYsEDHMmRoC6Sw0b
	6ArYdQV2Twve+5e+bdgEPRNk6b7j7Xo=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-GCnf1hZJM0mWcq5UU4o9Lw-1; Thu, 01 Oct 2026 04:39:04 -0400
X-MC-Unique: GCnf1hZJM0mWcq5UU4o9Lw-1
X-Mimecast-MFC-AGG-ID: GCnf1hZJM0mWcq5UU4o9Lw_1790843944
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67533636d38so6330582d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843944; cv=none;
        d=google.com; s=arc-20260327;
        b=WbS5lZNiMFhy3Cp/Rn4Xc4R24ioEujDD4djo5xfp9j2cBxF+4+hEtwFqjxoyc203lI
         4jxrwbqEZ8lvwGuuZXtTu5jI1DIeLwKjT3RYfsP5b9nwlebKN3U2GmnHBsE5d/NfUR2k
         hpj6kl3ji+Re/ZRcQCy40vInlWZ/Kq4Yu4keWApC9LwQVNXtwgNr0p4e2U95y8RJhBW3
         aoIpXXyiHJ+bVuyOJjanCYOGcPJi9Me/hHngIQATft6LebYNDAxoTikJIBXymq+/+tHu
         Zk7BBrAVqooUJ7ybhv3FCxoT4q6KElJvjdmn+whaKOchOQ5ciHDxJEJZMXo0VaV6U862
         kZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QhRQ2U3DMY45aElgUFHYhWE/nkabZyIzB51AujeYOU=;
        fh=mKUTwQFfdkRH4niNmGqz+22kWlJZPnrA6Eg90SUE6iM=;
        b=fgESMSECinHNz9khCTUJyddpgWQnR2uaaN55mPIy3sUKZWd7ytE9RJRz4HC5fo43E0
         PeZzR9Vehs2KFM63lsXU5PGwi4jk9nkjoeTjPR2xpjCGFmNE8PS+EoNHeQVaS9iTX6T4
         s18EbDzlYeul2Jgqo7yeJEMCNXpfbFg4hLlHErXLqjt8KYMh4ADHZxuer1j4tVW+lA85
         1qYaGyVClP+94YqMuzPJjeCCYR9XXOjw7VSRjG24kdWpt47bTaLceUPrLzVG+FYpqvue
         d6EiKgOycIUDvAef3KZmAPVPuUWdgTUTUkNqT0uVzUQ1vzxXJNrbvDHyGMz+uxaOijyA
         Nr0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790843944; x=1791448744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QhRQ2U3DMY45aElgUFHYhWE/nkabZyIzB51AujeYOU=;
        b=ktikbia5sulX5LbjIZknMUBzVYwT3mVYgxnTKQqEHnVNTZ+R3eea04LBylZGeKhpBu
         av90qquHS7SLnFAmmw7v7uhmdldceXl8wp4wPgMYA66jT7zP2XSspY5WLDLymLv6v55c
         R3+OJLFhlAIhmyUUmbISgbIOh3cJx7N2Eb1rYmy2l6A16u2qFiD4app10Zj3UxFZPFUh
         mFvE5q+dproXSqSp/HLDZB7WFuqujP5jeHUQ7aPFDjwm4ybumGRannwxOp4TympbTLQj
         EFCe5brL7XEI2P2y89UCR75eOladEet+aZ6nZTCLx0h89WKUH/RdfHmzOYnXmS7fF2zq
         2Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843944; x=1791448744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QhRQ2U3DMY45aElgUFHYhWE/nkabZyIzB51AujeYOU=;
        b=DcMy+aSHEkDonN8HErqfZcWaByHKlyScvhyPxRsEuNavEC3j1puWMeDMIabWpFZZOm
         /cLMwGryWIHTI7IbxK9i/Rge4n7zK1Gsaw4j4yJWOecuXzMDkIm8xXVpBMYLrlpiy7LI
         bzRgUAtPldZNG8uuLsh6KTSGn81t9zd0q3sO4Fg85wcZYWIC7zIXU6rDmto+/wEC2hs5
         Kj8iLMJPPa94V6J4nddKDpqG4w0/5+AvIdnHZbya+ybD/qdOzSw9K1DdYVFSO57ybzQ+
         4SgqQ3QV4tPbUsmv1bGp9PknQIy6K5isBY9qTZ/qxrHcWibC4KgKKafY0VNbELY469Xd
         jLwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+kZpTa/2AmQLvwWfgqSlOYZiZdn5Re4hkCDD1LFfTI6ql/2VrNz3Z/qVHmDnn1eu1hfoEnQWBScpc0EL1@vger.kernel.org
X-Gm-Message-State: AFq9FYIZEQYwrFpCNk6q+wTn447Fsh5xifC7b/hKNNB4WqAo2gPiS9MC
	alch2OCbiQI+wNJeKeF+Qq7rzFzci1hLyZnXf3rmUI6wzVIKwz4CHiZDW5HwtgsO7wNYUYxL6km
	rlS+NVLA5vDXpQxOG0IUKeXmtG9W020BAr/aLGlF2Hes253rpGmsnSkq0/V0NunPPOKbP2rNjMu
	moCu+cHV4b9/0fELCqwFerI+TAOXJ5uqvywbgWcsOyUA==
X-Gm-Gg: AYBFou0URg4iFEWUYN+96M8tlbLfKWS47G575ICqnnEioHh6sVkV36ktoBmHNEDO8Rp
	d3kwVh36be7actMOCNWO/+1VyJgefqki2+hTu3k1vYuHQHEjhOWsS1Su+IfKb6p9Jq1+KxKJHT/
	zyLokJ2ZhufL5f3zZLrcmfsTvZT83/pQAFyb78k1cZOpQJ95HTI/fsJw==
X-Received: by 2002:a05:690e:11c6:b0:66f:c1be:a647 with SMTP id 956f58d0204a3-676834b3e25mr1875420d50.57.1790843943968;
        Thu, 01 Oct 2026 01:39:03 -0700 (PDT)
X-Received: by 2002:a05:690e:11c6:b0:66f:c1be:a647 with SMTP id
 956f58d0204a3-676834b3e25mr1875415d50.57.1790843943393; Thu, 01 Oct 2026
 01:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
 <20260820-port-smem-v1-1-d19a45f583bf@redhat.com> <apYFPXLD6hLWohz0@baldur>
 <CADSE00LeKbGsqd_fBnWhAssiu5yFPH2_FuaY0ZamxK1GYHt+Qg@mail.gmail.com> <0d485228-b082-4064-8923-a750db9acf02@oss.qualcomm.com>
In-Reply-To: <0d485228-b082-4064-8923-a750db9acf02@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 1 Oct 2026 10:38:52 +0200
X-Gm-Features: AclHuK9cmeLqklK-rsmgXh1IgBeL--dVPuiCIIoSuNUJZ31XEUBL_BTkqysM1Y0
Message-ID: <CADSE00JQq5En3SfbbTKoCGQAvt6OeBPA4UobRMeb-WrEA2_pOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: smem: add boundary checks for partitions
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, Sarannya S <quic_sarannya@quicinc.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 7:11=E2=80=AFPM Deepak Kumar Singh
<deepak.singh@oss.qualcomm.com> wrote:
>
>
> On 9/1/2026 12:34 PM, Albert Esteve wrote:
> > On Tue, Sep 1, 2026 at 12:54=E2=80=AFAM Bjorn Andersson <andersson@kern=
el.org> wrote:
> >> On Thu, Aug 20, 2026 at 01:34:18PM +0200, Albert Esteve wrote:
> >>> From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> >>>
> >>> Add condition check to make sure that the end address
> >>> of private entry does not go out of partition.
> >>>
> >>> Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
> >>> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
> >>> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> >>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >> I'm sorry, Albert. Sudeepgoud messed up the authorship vs signed-off-b=
y
> >> chain here. The author should be "Sarannya", as that's the first
> >> signed-off-by.
> >>
> >> PS. It would also be nice if this was submitted with updated email
> >> addresses and copyright statement. But I'd not expect you to fix that.
> > Hi Bjorn,
> >
> > I'm happy to address these changes for V2. Do you know where to find
> > the updated email addresses?
> >
> > BR,
> > Albert.
>
> Hi Albert,
>
> Sorry for providing this info late. In case you post new series please us=
e below ids-
>
> Sarannya S <sarannya.s@oss.qualcomm.com>
> Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Tony Truong <tony.truong@oss.qualcomm.com>
> Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>

Thanks. Series is currently in its v3
(https://lore.kernel.org/all/20260924-port-smem-v3-0-fbc2ea81a654@redhat.co=
m/).
I got the domains correct at least :)

If a v4 is needed, I will use these addresses.

BR,
Albert.

>
> Regards,
> Deepak
>
> >
> >> Regards,
> >> Bjorn
> >>
> >>> ---
> >>>   drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++----=
-----------
> >>>   1 file changed, 72 insertions(+), 33 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> >>> index afb21a778fe7b..194ffb2ac010f 100644
> >>> --- a/drivers/soc/qcom/smem.c
> >>> +++ b/drivers/soc/qcom/smem.c
> >>> @@ -2,6 +2,7 @@
> >>>   /*
> >>>    * Copyright (c) 2015, Sony Mobile Communications AB.
> >>>    * Copyright (c) 2012-2013, The Linux Foundation. All rights reserv=
ed.
> >>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All righ=
ts reserved.
> >>>    */
> >>>
> >>>   #include <linux/hwspinlock.h>
> >>> @@ -85,6 +86,17 @@
> >>>   /* Processor/host identifier for the global partition */
> >>>   #define SMEM_GLOBAL_HOST     0xfffe
> >>>
> >>> +/* Entry range check
> >>> + * ptr >=3D start : Checks if ptr is greater than the start of acces=
s region
> >>> + * ptr + size >=3D ptr: Check for integer overflow (On 32bit system =
where ptr
> >>> + * and size are 32bits, ptr + size can wrap around to be a small int=
eger)
> >>> + * ptr + size <=3D end: Checks if ptr+size is less than the end of a=
ccess region
> >>> + */
> >>> +#define IN_PARTITION_RANGE(ptr, size, start, end)            \
> >>> +     (((void *)(ptr) >=3D (void *)(start)) &&                  \
> >>> +      (((void *)(ptr) + (size)) >=3D (void *)(ptr)) && \
> >>> +      (((void *)(ptr) + (size)) <=3D (void *)(end)))
> >>> +
> >>>   /**
> >>>     * struct smem_proc_comm - proc_comm communication struct (legacy)
> >>>     * @command:        current command to be executed
> >>> @@ -403,6 +415,7 @@ static int qcom_smem_alloc_private(struct qcom_sm=
em *smem,
> >>>                                   size_t size)
> >>>   {
> >>>        struct smem_private_entry *hdr, *end;
> >>> +     struct smem_private_entry *next_hdr;
> >>>        struct smem_partition_header *phdr;
> >>>        size_t alloc_size;
> >>>        void *cached;
> >>> @@ -415,19 +428,25 @@ static int qcom_smem_alloc_private(struct qcom_=
smem *smem,
> >>>        end =3D phdr_to_last_uncached_entry(phdr);
> >>>        cached =3D phdr_to_last_cached_entry(phdr);
> >>>
> >>> -     if (WARN_ON((void *)end > p_end || cached > p_end))
> >>> +     if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> >>> +                                             cached > p_end))
> >>>                return -EINVAL;
> >>>
> >>> -     while (hdr < end) {
> >>> +     while ((hdr < end) && ((hdr + 1) < end)) {
> >>>                if (hdr->canary !=3D SMEM_PRIVATE_CANARY)
> >>>                        goto bad_canary;
> >>>                if (le16_to_cpu(hdr->item) =3D=3D item)
> >>>                        return -EEXIST;
> >>>
> >>> -             hdr =3D uncached_entry_next(hdr);
> >>> +             next_hdr =3D uncached_entry_next(hdr);
> >>> +
> >>> +             if (WARN_ON(next_hdr <=3D hdr))
> >>> +                     return -EINVAL;
> >>> +
> >>> +             hdr =3D next_hdr;
> >>>        }
> >>>
> >>> -     if (WARN_ON((void *)hdr > p_end))
> >>> +     if (WARN_ON((void *)hdr > (void *)end))
> >>>                return -EINVAL;
> >>>
> >>>        /* Check that we don't grow into the cached region */
> >>> @@ -587,9 +606,11 @@ static void *qcom_smem_get_private(struct qcom_s=
mem *smem,
> >>>                                   unsigned item,
> >>>                                   size_t *size)
> >>>   {
> >>> -     struct smem_private_entry *e, *end;
> >>> +     struct smem_private_entry *e, *uncached_end, *cached_end;
> >>> +     struct smem_private_entry *next_e;
> >>>        struct smem_partition_header *phdr;
> >>>        void *item_ptr, *p_end;
> >>> +     size_t entry_size =3D 0;
> >>>        u32 padding_data;
> >>>        u32 e_size;
> >>>
> >>> @@ -597,67 +618,85 @@ static void *qcom_smem_get_private(struct qcom_=
smem *smem,
> >>>        p_end =3D (void *)phdr + part->size;
> >>>
> >>>        e =3D phdr_to_first_uncached_entry(phdr);
> >>> -     end =3D phdr_to_last_uncached_entry(phdr);
> >>> +     uncached_end =3D phdr_to_last_uncached_entry(phdr);
> >>> +     cached_end =3D phdr_to_last_cached_entry(phdr);
> >>> +
> >>> +     if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_e=
nd)
> >>> +                                     || (void *)cached_end > p_end))
> >>> +             return ERR_PTR(-EINVAL);
> >>>
> >>> -     while (e < end) {
> >>> +     while ((e < uncached_end) && ((e + 1) < uncached_end)) {
> >>>                if (e->canary !=3D SMEM_PRIVATE_CANARY)
> >>>                        goto invalid_canary;
> >>>
> >>>                if (le16_to_cpu(e->item) =3D=3D item) {
> >>> -                     if (size !=3D NULL) {
> >>> -                             e_size =3D le32_to_cpu(e->size);
> >>> -                             padding_data =3D le16_to_cpu(e->padding=
_data);
> >>> +                     e_size =3D le32_to_cpu(e->size);
> >>> +                     padding_data =3D le16_to_cpu(e->padding_data);
> >>>
> >>> -                             if (WARN_ON(e_size > part->size || padd=
ing_data > e_size))
> >>> -                                     return ERR_PTR(-EINVAL);
> >>> +                     if (e_size < part->size && padding_data < e_siz=
e)
> >>> +                             entry_size =3D e_size - padding_data;
> >>> +                     else
> >>> +                             return ERR_PTR(-EINVAL);
> >>>
> >>> -                             *size =3D e_size - padding_data;
> >>> -                     }
> >>> +                     item_ptr =3D  uncached_entry_to_item(e);
> >>>
> >>> -                     item_ptr =3D uncached_entry_to_item(e);
> >>> -                     if (WARN_ON(item_ptr > p_end))
> >>> +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry=
_size, e, uncached_end)))
> >>>                                return ERR_PTR(-EINVAL);
> >>>
> >>> +                     if (size !=3D NULL)
> >>> +                             *size =3D entry_size;
> >>> +
> >>>                        return item_ptr;
> >>>                }
> >>>
> >>> -             e =3D uncached_entry_next(e);
> >>> -     }
> >>> +             next_e =3D uncached_entry_next(e);
> >>> +             if (WARN_ON(next_e <=3D e))
> >>> +                     return ERR_PTR(-EINVAL);
> >>>
> >>> -     if (WARN_ON((void *)e > p_end))
> >>> +             e =3D next_e;
> >>> +     }
> >>> +     if (WARN_ON((void *)e > (void *)uncached_end))
> >>>                return ERR_PTR(-EINVAL);
> >>>
> >>>        /* Item was not found in the uncached list, search the cached =
list */
> >>>
> >>> +     if (cached_end =3D=3D p_end)
> >>> +             return ERR_PTR(-ENOENT);
> >>> +
> >>>        e =3D phdr_to_first_cached_entry(phdr, part->cacheline);
> >>> -     end =3D phdr_to_last_cached_entry(phdr);
> >>>
> >>> -     if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
> >>> +     if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_=
end) ||
> >>> +                     !IN_PARTITION_RANGE(e, sizeof(*e), cached_end, =
p_end)))
> >>>                return ERR_PTR(-EINVAL);
> >>>
> >>> -     while (e > end) {
> >>> +     while (e > cached_end) {
> >>>                if (e->canary !=3D SMEM_PRIVATE_CANARY)
> >>>                        goto invalid_canary;
> >>>
> >>>                if (le16_to_cpu(e->item) =3D=3D item) {
> >>> -                     if (size !=3D NULL) {
> >>> -                             e_size =3D le32_to_cpu(e->size);
> >>> -                             padding_data =3D le16_to_cpu(e->padding=
_data);
> >>> +                     e_size =3D le32_to_cpu(e->size);
> >>> +                     padding_data =3D le16_to_cpu(e->padding_data);
> >>>
> >>> -                             if (WARN_ON(e_size > part->size || padd=
ing_data > e_size))
> >>> -                                     return ERR_PTR(-EINVAL);
> >>> -
> >>> -                             *size =3D e_size - padding_data;
> >>> -                     }
> >>> +                     if (e_size < part->size && padding_data < e_siz=
e)
> >>> +                             entry_size  =3D e_size - padding_data;
> >>> +                     else
> >>> +                             return ERR_PTR(-EINVAL);
> >>>
> >>> -                     item_ptr =3D cached_entry_to_item(e);
> >>> -                     if (WARN_ON(item_ptr < (void *)phdr))
> >>> +                     item_ptr =3D  cached_entry_to_item(e);
> >>> +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry=
_size, cached_end, e)))
> >>>                                return ERR_PTR(-EINVAL);
> >>>
> >>> +                     if (size !=3D NULL)
> >>> +                             *size =3D entry_size;
> >>> +
> >>>                        return item_ptr;
> >>>                }
> >>>
> >>> -             e =3D cached_entry_next(e, part->cacheline);
> >>> +             next_e =3D cached_entry_next(e, part->cacheline);
> >>> +             if (WARN_ON(next_e >=3D e))
> >>> +                     return ERR_PTR(-EINVAL);
> >>> +
> >>> +             e =3D next_e;
> >>>        }
> >>>
> >>>        if (WARN_ON((void *)e < (void *)phdr))
> >>>
> >>> --
> >>> 2.55.0
> >>>
>


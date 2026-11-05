Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920342;
	b=3ncxIqICDMJw1kNRaJTfeCxKhb9qY8Ec85JvaYWOta6XH6c2kSli/7Yl4FtL4sQI6Wwb
	 Hi9kzWd+wWtoLst7y4SCnzW+Si3pfPxUEHG/0D7vFcfzRn1pZYArPt7llilcn/DNSDcjI
	 X4pL29fPVLsp/zTzAyXcHaZhOF+fhgc0VYNnCPqzx1HIAhqNFa8zLL2mWWpEcwRVTtR6A
	 ZsM4BCGw5OECk0VwNWxzzyETQvueuZfar5sWpHfgnMYvrw/NCK08ZotidrQxTiMOXWavp
	 BbnuYIns5KFRpHHj6nlDrbBwob7QVxsuGxbnnlimLJaUJtoP3FEHsiWUsJ6qEi3LEKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
	b=Rf+Me/FdRrSXnzH9q1nLS5C6uFEeQ2Vt++BkAMDHDEJYrC+iTBULkq5J8tpm+ZcIM8Wz
	 2W3VKplqTVvofiCpPejKZisO2lGCLAiSbbTWR6faq7n7L6b3eWtEiBlB8XrV0P6P1lijM
	 GI96vp1scj9RbKjcEZpwnpHXDEiHXnivEKUEte2QBI6bHPaWFLLbHZHvSnrluUkTun9q7
	 Y6t/3WsDjYnv4G20VtHFibH9DVwQK/H+vUz94G9Aj4KgwGAXchvtxO5+JqelOgmahTxtJ
	 qzlNU+gCFcTjDT1xSuUkggpv60eBNXa0BItumATKgglr+uUnldJm/AobICwjxZdO25A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=ePSbskAw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B23606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B23606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=ePSbskAw
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso37362a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793920341; cv=none;
        d=google.com; s=arc-20260327;
        b=rnb20g8D1XX7q6k3lLIgKj5akvK0Kc7Zh9Km7HR72b2CNBKNO3u4xyxiRH0/EVSkcc
         gaKxMx7NWSe5Dum9LlOjnN4Tj8s/FhCXGxmZnvfSt5mygFVzX6IrGYCSmmMDl9uzG0K7
         kwIpqFNIxP9LIzHzVxqHInn9eQpSFu/Yr2jmTELJCbPkKgdopZjg15se44bHEBdLWsEs
         lLIaDNA1rrBfSJtyaJu2C+oHuz0TnXYM1VxbEldI+KUS1lx3xAdrk9Rz3pC2Do/KmJrS
         g8N0yfxNCVPOA3g8zigGX+yCzngeYHXOCUn9w4TInqsUfpM524cWDCKFamaUVPivo2fk
         J/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        fh=q3wgO4rtQho2M6pdil9T2dl5AD8Di37byGZqLyWjBSw=;
        b=QKblldhWpPk1x9nclgJgB8erAN9BmeZvPo8VweISO8kGsKv1n+GEH/v3GoEGXxPfgh
         4NtFXodWtys7p5mGR85NF4yCXFtAFnZzXOSMiX9Rz+m/p0v5l8mei2JX1Brs9lsw/s1d
         6qyCmVKQNdh+dUJcwoOppOzDdfRb1/s+o1I+HAafJ0FPtZrtXJ63wemnLOYrG8x3nDlg
         HWm227lohAtyWy+J+KMmTgjnKBnBKFxHB/9eidIvK+qjFpy2QlaYgTCgwlVxc78FmhtL
         nivtX1xyU+PKZ1WTOVjf4+ppTf9l1SF3X3c+RxrkhaTV1ExxShApYMtqlcAKSbQygmW5
         sxYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920341; x=1794525141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=ePSbskAwea0d9B6NpBdXuFYsWvLDCToKGcxFrN9C/fQLJKxAOsbctr8qBrrZUslJXJ
         9CLcMCSIkKD7ZW5JSZB/FlpnXL7wVvbFlxAaV35NsJbH9Ct+Vj1AE0PSCxPZMXuxmspf
         S8DzKorUUKYgddL+oYJfDiSPHAXfQ8DdRb1gIJCpXWqjafW5TeuSLk2tBK8Xu5u2Toof
         wmqoUSerZIxxVmbDxgyvtDxt3hKRgQ27SfmnssLj7BFyrZUgbmKG7qeTDPokQzsw8F3e
         sMOi8Cm8Fp7SxcfGGOrWu3vbz980QOeeJXGWbY7zrPoyxcb1MpuMc94aw2AmHxsi0GQi
         jm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920341; x=1794525141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+g0xKR97zcXC//9XGcArRTzIRGbaLo0LA3je3jFgFY=;
        b=lGl3Fjss/KoQpLovY6OZ0LDboaEDWDoh28b7KsZCrL6L4uT4HqoXIK7PfoEDnk0PWm
         x2MSnogcdqUWDHOebxwOIIbHb+S7VoAp6Q5d7KlzaXojudUm1GnDoh5HetHYecAV/lqA
         xzHk8lCSM4v3TfRnagq77OSYVuj8PQwaJpUOf2ByfAwkEADVNrLoiDqExUlL8MR5IqNk
         xllpFS8x8DOMe3Y9XFpafwRzjPyeWva3O50O/muh3GkVjgZzE1yCK6oCeDO3VRRRNiZs
         KMZ+Q+ajUqzpfwFEo57l/FM+GIqVAaqrHw+30LjCJHqHsAZnNlkJj4e+oBo7tmdfGj+2
         eCYQ==
X-Forwarded-Encrypted: i=1; AKwUvByA9pkrYHAwR9OUpt2bBGwiNJ2vo5yWAjoxgPkGjfmEhp+PqMtSXAGiGPS7bjNr3DFGx4KzwL0r2j6gPBID@vger.kernel.org
X-Gm-Message-State: APuU4Z8YH2rQSvvJYrkV6h5RGeqgyEXh37hAzc8Xc3g2zoCZgZfzyYgb
	GthXhOMok4uk/Eb19Gr/a8I0J6ivWepbXPRp7g8u6Lbtt/S1KhjA+JtLXUc8cmt41rwiz4sbhU2
	0lBbgBYSEjmYyowq5yJxe3pH29oGNrHiQhBjT5hFL
X-Gm-Gg: AYBFou2sJTzk7l8kf1AHT+z15ekCiagUMBORDJo4TOFTtausOVAhF1X7e+pGvDvFQ2l
	R8uaEI4d5V9l6pmogzYBV2wdqPr4z3uT7QVUUVdMPRVxwXX9K1scdq8K8UivHkpsaI2YFUda/Ri
	DJhFXrEr2sia8sbKo2NyTeV0NKsiEJ38eMHWQYZ7EuZRpmELfH5lGs68PRp0ppeOIEN2IMkckDS
	sGYimBSyFbCeDOHdXL78oVtS19W2GpIm4IA5E/S8VI8TiKJqumI1Roopg0tmb5aoJ8/8DvWGEty
	+XLcHVNS1G0mGTcJuSgHgc1hToDUmI/6zAiCn1PRFtLh+YyKT0yLnnlsIcJ2ElaYaVI5TnqsZto
	V2AbXQzOdvNur3BzD3VSjxpe1VZVyomJqlclTgcv0TDEPa3eNZQZXV8J2ot2pLZsJYkuz
X-Received: by 2002:a17:90a:d88f:b0:3ac:b867:81df with SMTP id
 98e67ed59e1d1-3b0db6fbe69mr555739a91.39.1793920341210; Thu, 05 Nov 2026
 15:12:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:12:09 -0500
X-Gm-Features: AclHuK9SAmQ1s59IzUj_GoyUW49QmobrDei9zDR78OY4d10Tcv8mWs8d-l1JUg8
Message-ID: <CAHC9VhQvpFeEJaEyPDaqj8_S752puSaNe0Rn-hxjh=ugCoFsxA@mail.gmail.com>
Subject: Re: [PATCH 00/14] mm: convert further simple mmap hooks to mmap_prepare
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Scott Branden <scott.branden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Cochran <richardcochran@gmail.com>, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-sgx@vger.kernel.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:06=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Continue the conversion of users of the deprecated f_op->mmap callback to
> f_op->mmap_prepare. Keep things gentle this cycle by targeting simple
> cases.
>
> No functional change intended.
>
> Build tested on x86-64 (allmodconfig, each patch individually), i386,
> arm64 and ppc64le.
>
> <<>>
>
> David, Andrew - I wonder whether one of you guys could take this series
> through your tree? Since it's kernel-wide it seems sensible to take it
> through an mm tree.

Granted I've only properly looked at the SELinux patch (7/14), the
rest I've just skimmed through, but these are all independent patches,
right?  Is there any reason why individual subsystem maintainers
shouldn't just pick up their associated patch?  Yes, perhaps chasing
down individual maintainers is a bit more work, but isn't that the way
this should work?

> Lorenzo Stoakes (ARM) (14):
>       xen/privcmd: convert mmap hook to mmap_prepare
>       KVM: PPC: Book3S: convert spapr TCE mmap hook to mmap_prepare
>       mshv_vtl: convert mmap hooks to mmap_prepare
>       vduse: convert IOVA domain mmap hook to mmap_prepare
>       x86/sgx: convert vepc mmap hook to mmap_prepare
>       udf: convert mmap hook to mmap_prepare
>       selinuxfs: convert mmap hooks to mmap_prepare
>       xen: convert xenstore interface mmap hooks to mmap_prepare
>       soc: aspeed: convert LPC and P2A control mmap hooks to mmap_prepare
>       soc: qcom: rmtfs_mem: convert mmap hook to mmap_prepare
>       tee: convert shm mmap hook to mmap_prepare
>       misc: bcm-vk: convert mmap hook to mmap_prepare
>       ptp: vmclock: convert mmap hook to mmap_prepare
>       vhost-vdpa: convert mmap hook to mmap_prepare
>
>  arch/powerpc/kvm/book3s_64_vio.c        |  6 +++---
>  arch/x86/kernel/cpu/sgx/virt.c          | 15 ++++++++-------
>  drivers/hv/mshv_vtl_main.c              | 14 +++++++-------
>  drivers/misc/bcm-vk/bcm_vk_dev.c        | 20 ++++++++++----------
>  drivers/ptp/ptp_vmclock.c               | 19 +++++++++----------
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c    | 20 +++++++++-----------
>  drivers/soc/aspeed/aspeed-p2a-ctrl.c    | 22 ++++++++--------------
>  drivers/soc/qcom/rmtfs_mem.c            | 22 ++++++++++------------
>  drivers/tee/tee_shm.c                   | 14 +++++++-------
>  drivers/vdpa/vdpa_user/iova_domain.c    | 12 ++++++------
>  drivers/vhost/vdpa.c                    | 23 ++++++++++++-----------
>  drivers/xen/privcmd.c                   | 11 +++++------
>  drivers/xen/xenbus/xenbus_dev_backend.c | 14 ++++++--------
>  drivers/xen/xenfs/xenstored.c           | 14 ++++++--------
>  fs/udf/file.c                           |  8 ++++----
>  security/selinux/selinuxfs.c            | 24 +++++++++++-------------
>  16 files changed, 121 insertions(+), 137 deletions(-)

--=20
paul-moore.com

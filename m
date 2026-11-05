Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920458;
	b=SqrF0DWiqlKwREyRn0e/iFY+UqXagV7q/5A7ogbElZk/w+V4rL408R6GOSOPYfexgTTr
	 2lhj9FqCoCtZhiLlaTvdflOikMe9hjk1G+6cq+gNBMsMOlu9DFDOCuYWLY5JONw5GE6UY
	 APwF0d2fXDJYKXSNoipgDQSGLjVAXjrkkm2/Yl+u2PWuZWuk69sYP3o5iCLCqAmg3lhq0
	 vJ/INSbU4MIlUPBn9dujwxUbf2P9UnmwdNIHgDs5C3/Ahe82Z19bK8/8+dJAdWtrw8Vw+
	 QEZtQrYckvCW0EaLB28V48yRSxrk99i3zgXMa9m5QBvLXeWakSuRbXWJlUdtw3tH3UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
	b=XZARksvrzXbEMgwcUJmSQRntMKNiVSiv3zxx06cAsEVMwZ0I3u/M7bjepBFjdhxzJfgm
	 7FpP7mO3B+952pLkaJaZIq32nufUKK3zM2WWaOcZEcGRNMHz3MYVC27OJlOL4cdOh2Zuf
	 YhPXAq7jfKYCiT4hBoNmStv500aVhgASo0vhKHQveWWBViHzNTTNEOWM3B/+XvDQPvr7z
	 gU2wFHRKbqghTflxE46kTKtT4P3hCoVGmRsbouhAs1Zw8dLlsbyQJj3Uq9YUEBUfYxVwp
	 zqUcl0aYNwtcnSPQibw/mtxCd0xAA51EBUzCqa5Cb6AgJDwReV2n/An186kSWe66IFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IU6i1Fwv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32188606A328
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32188606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=IU6i1Fwv
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb628232d2so28008a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793920456; cv=none;
        d=google.com; s=arc-20260327;
        b=pPchm+a031mE4CEGIw3PPijddspaChjfhz770cuKQTysHrt4UYA0vfj1bZHxUANhRp
         dOuEpOftH7T3+kR65riQfAOF1j4mP4V20kaXtWhgvGqFvyu7gipXlYoser2FbTBC1EIu
         KlXq1kuoaSAlFWW7fgQ9GVDBXoXBZxmo29JkljhusFYJa4+iSlqXQomAUzQOHC1fWtzY
         GBjMvEWARg8gjoQ/Hxf9bb0KCbptCKWOt5V+9D/D1fqbQUWHn2nvXaEbO7cY/klzRjdr
         ll9EpeBnjVNlAdVA2VielMsVsukAW8VZHfKB2ZDrK11xqxVWVB0N7E95vp1NG4/VOnpn
         A2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        fh=pPiEhAwi+LBIKg9zW+il0l3w5sEUZgzYMOCsnFmre2g=;
        b=EGcc6xdOc4OOu70lalFocFYf4bFl60+CJAAo21Z+izzF2yg9pBagdEGDvVjWI/qwVW
         Ycww5OW1ot7yGUnUpKjqNIIKX1xPzL4Jxy5nYptm0BovWuX9MEO0Hf9678VoecjT9r/F
         ldzIgqcAV5a/bd7fcwijyjctWFFRNCtToFelpCYa2HwJmMZoNtlU8dgUlqNZU+14v/QY
         vZjtlW1yb4ZFtXNOMtWUTWAEa8NcrrUmpSNPcBluQ6QXKcFpIM6WstwXEzDDZ6KpmS5F
         9SyQZWzeguDANu3rQvzsIfzJUuWPB61XRAMp3gFFiYMDxHuS0jJ6Brwl32wNg0QlUuys
         cRZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920456; x=1794525256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=IU6i1Fwv/0w/cks1e2nfs6t6sk022zL/8GvQwys2lPo33xKyfU4+rlcYd/DQAZEHG/
         pOKIazGTVuNB5nr366kMh62Z8mKuK+0wykvjpk6nMnF62dQEPqXhVYv3AiAUQh2yheQg
         Wv57SCnVaPWXfP0Spf5ZrgQ+6Qros/0dGKzT5Ct8KPvTnGxmERS9srU07KlGSKT3u7rc
         WSDGWK1HJ7ZHGpFoQ0kLcdKEj3NsCe6oNqECA6Dmye2YgKsYtmlI/U8g/CwAwltsgKHy
         7lk6f9CpVk0uzXD9qAsG8lDByv90XfisBUHNR3hzhw22DDDhGO8biMGoTBxSg1pPVUNx
         pPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920456; x=1794525256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGiD8zQqMuzCkGXAZBtgumh8HlT9rNPiWNa35MXqkeQ=;
        b=N6kbkKcfj3hhUjGA8lJXc4knx0ow2ndfvx+9O4DGE4aYn8wlOm5AEi6pvkTCc2NXQP
         t1lDXUAd2Z95kuw+13X0KxF0+8fenlfFOazDRdq46eXMNzPK0gmHE9Y05NExdJ4iq9PK
         PhIsCTa8kvbsDD5/h+5tRc48aAISKtHjoW/0DbAWEpjTV2wRVxHBLnct6KYtLQh1Silj
         q5O1eHjJ3LRlGsLvl6QucJ2zlYJ++3R8pY9Iw0aLO8BOqt5SzrzbrP5dcvROffC+RbIU
         PF+dRf/NwC5wwQe5mAkznPqv23n+WnBlOTDbwubLOcgWc5AztMJgMpR4U3HD9ZEOxw36
         fNkw==
X-Forwarded-Encrypted: i=1; AKwUvByRZmztqhCDXU79pKOmNXy0i73RJ8Cly6XPTRglHtpNOUCWRl6+xRrNtJlTMmppenm/M4CeBE3eCQluJ6vv@vger.kernel.org
X-Gm-Message-State: APuU4Z9KgIMZ38syawX3Kfwp1cVpAYmLJxokCfEES5kj+vHKk/PrLZua
	JPknDeP6s0lv8bvnaUVu9G2J+7danyBofXqZCyMs145D6t7ZqI3xq6mDIh92y958JFhJl+KBmoK
	VE9qX8Lcwi395js79FXZkQjqnMBS8zIqSs74HpGsF
X-Gm-Gg: AYBFou3gCQwfcMhEgeZxjlIbJFqHnShtXxRUUZB+wEJ+VSSScmInVV9sotzCp6mOUka
	1mv3JiyfWgaedsr3bt4X+/EGKz6oQEs9g0pGmGZRUyxpnmW+3QH9Fo8P44ld7BLm6iNZdE1PW49
	onlu1qv6GzlfA7KMtcbnUrqKqHWJQ0gzZuGaV55y1zdXRqlp72f96+4LZxLe05OB+RY+s9tPRy+
	4xyX7ngNyhnt5rdOD5yNfTjVhCHcAcL/D4e/m+W2oRT/W869BGXNYyxjyZs5Ntc9rJ8cIn1qhFH
	dW62qaI47CFedHh42KiK5sqBJDLhwgTQ6dHvc3DK0E6fWLTJnabwV62QLFebosKv+90qPmYh1xJ
	0pVQ3SOcXnjF9WCGiTkLDzcW8pw9rLJKWmCWCeFxn2FBhrnbMqMiNM6bVtFbKC3W+BmnT
X-Received: by 2002:a17:90b:48cf:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3b0db6e8ca3mr534231a91.45.1793920456567; Thu, 05 Nov 2026
 15:14:16 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-7-c56aadfbab8a@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:14:04 -0500
X-Gm-Features: AclHuK-Yq9Ya_gmjsTlhf760be1vg51BQVbAOtNinoyo6VpZvAmG2k73A1wV2Mc
Message-ID: <CAHC9VhQcmX09Do8BmY-HYJEWKiw7Tf-ZB=EEr9K6t5dBzk0SSQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] selinuxfs: convert mmap hooks to mmap_prepare
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

On Thu, Nov 5, 2026 at 4:07=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook for the
> policy and status files.
>
> The policy file only sets VMA flags and operations. The status file remap=
s
> a single page, so use the PFN remap mmap action to do so.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)

See my comment in the cover letter.  I'd prefer to take this via the
SELinux tree so it can be included in all of our SELinux testing for
v7.5, but if this has to go through a single tree with the rest of the
changes, here is my ACK.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

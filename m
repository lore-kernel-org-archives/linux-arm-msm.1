Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229611;
	b=GMQiq9ty//jqy3OYyQ8Xfxlhc3mDq7A5VjI6VToBxH6r4RiIKJiqMf8DAp2vibNYETRr
	 oxN+NKa+Pf7p8E7+Lh4yB+KED2Bz3IL4zS+CnelZI2503Q7GW6ENc/yVtkFVrNnkfL92Z
	 iGWH3eUD5iBwcXTJ6w0zhSl2iFiF001cbc0BGzJ68GA8woMPv9+xkItnshedyhJwRPy8A
	 L5MXCGndJ0F8z/Vq1xZA+unlx0IjGl2hJosftkzUdQsS+s93FxGnY/35X9F9Cx6TGti0/
	 OmEd12fpVl3/z9c6OO+K4WKa6c5QTVJItmKrUgIpf1ZtpRI/oFqlPiHh2xV5EtI2LBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229611;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
	b=EGij/Nvrn9d5epZZwy0ONCNmeTFrOPAxN3NFXlE1O97n4SoyDcjuEDjiLy2vV57/k075
	 kbXSZN/t4jJ5UryFjUbHPTnWoHUT9XilVM1cAvmsm3j+6gZqbAcP19wRLKkPsxpbgAFz5
	 Qa3xlfi42V8Csi8G4ToWFR7RYLqVNdgHYpaFiknBWjr0af35RQ2tjre5jB9sB3j2Z0UWP
	 WYp7ibfQ8X8mjdkxFxsWHvWlonepOwh5BgQ/Frcq7wvIbM1i/8/ixIGUYLiesrZTpa/DC
	 Fwys9npqPrE6qdTkE/p9zMJyKvshARhiZ9feLr1KJFhRZPME3Pg0wuvR1z1yJbqkGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmcXJOt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hvH2JAKU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA315606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA315606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmcXJOt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hvH2JAKU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794229610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
	b=UXmcXJOtilHFjGvwez6rO6q+AbZFLoTde0Y511FZa8Lb1Ab7Lbiewhz5vCV0eEA7Nz7xDA
	A34uvJHDfl2e8bxZcRRR4hqBGi7MDd+AImCsbElrXtnX9MNkW6wqAu+HeVd0jcVCzvVv/X
	0mIn02WplMqjvTFwaiUbo3BrR6zDdRM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-wQFLNN2JMZqhMeIY85jgUw-1; Mon, 09 Nov 2026 08:06:48 -0500
X-MC-Unique: wQFLNN2JMZqhMeIY85jgUw-1
X-Mimecast-MFC-AGG-ID: wQFLNN2JMZqhMeIY85jgUw_1794229607
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b57627bacaso1015590a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794229607; x=1794834407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
        b=hvH2JAKUSPVN6CLi6ISw5CHEFk3kPPwX1uKW23tcP+tjSVKeRNUFAITwWBNXNw3VXK
         zAS0k7VgaTGEeOoiCTbdFHAyPaNCHkgQAr0Iw5CKQd5HTNSjYPUzjz/W2V6qPp1GfwlG
         QXUlhHLmJG/B84GBezCBkFReNNINJG7gH0Pt261lGg1cSjRs1YY0rXZeXOmbC6NCKRgb
         4Yyxk1tUUGitmRMqkX9FdvZT9B2RdJuzn/5xE59oCnobNDOJupirMcPqRWUWQ9w+2r39
         x3nWRxdKdrdnuJIPiFXIw+j9wT+Nlanvnm41D3MtSFPF412jW0sWvm2PFteDKwoP38kK
         360w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229607; x=1794834407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ala+oDARam9VyrCVVd83FiqqzQ26GgOylxTttfV+xTA=;
        b=u/ym4lBOfmqdJs0ueNf8YMTFBN8F67L0gXM6eVdR4NjTL/tAKA5ZJvLeo4uYrqJQ6d
         d4n0fo/JIFHGDg8/aq17hMtsz9aJJkSp9xrEPMIXoYtLGUOgSm/UWYdOupPMcKZTabro
         fTnR46O4quuBAIihJ/NJKC015HBvdjvm4rGSjS65bQ/FX0IVY/dF1TzgKd6Toenm8R37
         VFgMN39BIOYGWaZs4hLp6egWTvgb4gTcDpUnxSGos1g0TTxCRIZQ/LJn8sFx0BjsHdQV
         ePvc0IfIo0PgmxjQsjPxjirYOLSlVyBE5NKmRALOmYnh0vyORZVLDBE0tGVRGf/JLkBw
         sWaw==
X-Forwarded-Encrypted: i=1; AL+hErG1OLyPFpqBX65r63bJDyNN6d/bJ9az2i+jODOAPY/AWTFXrbzCd01R9i2nGoINtqgVfimB5hMGADMcgCS7@vger.kernel.org
X-Gm-Message-State: APuU4Z9+zxMJ0CpDMPzETydjKEQjg3Wjkx5OqmXlvJdRY/SCL3F2p2on
	qMvlIhgss3/51qQJx+JepU/lUvXbWECyfyyl9u/yuXbSL7XZfNSjpTitqCSfCfxrOwlPpFyRQlY
	fZ7eFKn5EkeB24GvSOTxIpUWt5InJ+iIomh8ihWA4F6VPf977LagYfFEei8fabfmIUcI=
X-Gm-Gg: AYBFou0mpO/4J+CtKUqSodfZxERokINDdwXwdwocFSAK4IoEpJmG0DJCLFoQjAMb5hc
	usWbiEN8wRjyfUE6ro/E9PLlhIH+cwVszW856c22MqC3C00/kOhUbkZQ4pKETIdvnO/0ENLvtb7
	9ztdSu+0Te9Zae2BpNW1E4dDNEFM9bOwEUPrhP2MVFbChUrtCE4/mV/cNcSYRCF5IghNA09sw6n
	qqYyZZMbFGZES6qP99JTvBdcbESQlrB90zoZhtjxxllJSxp0C+G//BOtajcGs7sF7RlFdS7L8Uf
	9g3aFpWaUfXCYIVJiXGnE+lFxGkKGHcpJhcCLIlvQNhErcLKCrYYqjqUeU96CptV31Y/sQlr5kD
	CdXLPe7uLKDlIFEaJh/s2+s+k+O5+X1nC03iQTrJU
X-Received: by 2002:a17:907:18c3:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c4d6db5760cmr321577966b.18.1794229607309;
        Mon, 09 Nov 2026 05:06:47 -0800 (PST)
X-Received: by 2002:a17:907:18c3:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c4d6db5760cmr321574566b.18.1794229606674;
        Mon, 09 Nov 2026 05:06:46 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9384csm168299566b.13.2026.11.09.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:06:45 -0800 (PST)
Date: Mon, 9 Nov 2026 08:06:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Cochran <richardcochran@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-sgx@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 14/14] vhost-vdpa: convert mmap hook to mmap_prepare
Message-ID: <20261109080616-mutt-send-email-mst@kernel.org>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>

On Thu, Nov 05, 2026 at 09:05:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook. The hook
> only validates the request and sets the VMA flags, operations and page
> protection.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

Who's merging this, me?
> ---
>  drivers/vhost/vdpa.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index ff7d90719171..993b2d7c8927 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1573,19 +1573,19 @@ static const struct vm_operations_struct vhost_vdpa_vm_ops = {
>  	.fault = vhost_vdpa_fault,
>  };
>  
> -static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
> +static int vhost_vdpa_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	struct vhost_vdpa *v = vma->vm_file->private_data;
> +	struct vhost_vdpa *v = desc->file->private_data;
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct vdpa_notification_area notify;
> -	unsigned long index = vma->vm_pgoff;
> +	unsigned long index = desc->pgoff;
>  
> -	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
> +	if (vma_desc_size(desc) != PAGE_SIZE)
>  		return -EINVAL;
> -	if ((vma->vm_flags & VM_SHARED) == 0)
> +	if (!vma_desc_test(desc, VMA_SHARED_BIT))
>  		return -EINVAL;
> -	if (vma->vm_flags & VM_READ)
> +	if (vma_desc_test(desc, VMA_READ_BIT))
>  		return -EINVAL;
>  	if (!ops->get_vq_notification)
>  		return -ENOTSUPP;
> @@ -1598,12 +1598,13 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	if (notify.addr & (PAGE_SIZE - 1))
>  		return -EINVAL;
> -	if (vma->vm_end - vma->vm_start != notify.size)
> +	if (vma_desc_size(desc) != notify.size)
>  		return -ENOTSUPP;
>  
> -	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> -	vma->vm_ops = &vhost_vdpa_vm_ops;
> +	desc->page_prot = pgprot_noncached(desc->page_prot);
> +	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
> +			   VMA_DONTDUMP_BIT);
> +	desc->vm_ops = &vhost_vdpa_vm_ops;
>  	return 0;
>  }
>  #endif /* CONFIG_MMU */
> @@ -1615,7 +1616,7 @@ static const struct file_operations vhost_vdpa_fops = {
>  	.write_iter	= vhost_vdpa_chr_write_iter,
>  	.unlocked_ioctl	= vhost_vdpa_unlocked_ioctl,
>  #ifdef CONFIG_MMU
> -	.mmap		= vhost_vdpa_mmap,
> +	.mmap_prepare	= vhost_vdpa_mmap_prepare,
>  #endif /* CONFIG_MMU */
>  	.compat_ioctl	= compat_ptr_ioctl,
>  };
> 
> -- 
> 2.56.0


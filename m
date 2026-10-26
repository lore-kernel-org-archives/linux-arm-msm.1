Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010473;
	b=SZEuzmfPgcrnQEidK4nJW3zQvP/QQf7IDoBxcy4I6QxsfhOvQ7n4/o0B/BsrlCZclB5G
	 vB6itSVhursd8YQYA+YNzHWBE5Gn9TUJ8MdHuSCx732RPxgr7hjSUY0k5QVTcQ5IY0kBk
	 0wNlW0zLEB/Uc+RLboWz/iD/gk4E5ToNK79k9uUkAcD/YfEgVL4S93oD1Vu1XMUUpPxQ/
	 w0w3JrX1j3rMPNLjGtks47CSwU4+LRu4fdSCeBfhefwYb9HaX57IorLlkqckvZAcLaaxF
	 WuHVXYtSBUORFTRcyOZUO8Sa+t3Y1CA+27Rf0zKEITAkMGDO0+Mg38zpcOEDf3Vp8vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010473;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=Luv8dGbRKcBYtrxmLcHfhk2bqjH1S5LnpPcTGgTkjNzUhvFiHNNp9S3kTA/BRuu6FfEq
	 ouP/h7IjBVqnOC+t38bQaQVRObS4G4FmILFVpUuNlCvr4wirQ/9XJkhfv1KcXhDkCybJw
	 AOnuaufvgENcM5Lsz4mOFDpM4nEibUGv61uj0HjGsh+K5icz9b0+9KBPVyJEZb6wZ7nVR
	 iOWa3OcAvDPpWwv82IAekPirsjtG6ETiRFBxowUki1yh0V40gVrvTj2zjTm7ZOsz2TlTO
	 wbC3PgTW7bQTwY+8G2nZLtvkMtu9kjuSWpVl4AsARD3W4iPVPfYYe3M3zRNQTGheyZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khda7wlK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4861606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4861606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khda7wlK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793010471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=Khda7wlKgBX1HquEHaj8T+sZqOpGHk5kuuw7ZHI2WFLxo5xOpHzBax3m7mEopkaEw3q314
	8+/WISFV3ROJyc/1GXSleRn8TNHJ4QEBWqylZne/hPKkFpAARDFwOFXTAXMO1r19zCKgQw
	GZBr7Vc2zLOwN0Luk8M42HpXqx8Md/s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-jMA40MxvP4CwyTQrENPXmg-1; Mon, 26 Oct 2026 06:27:50 -0400
X-MC-Unique: jMA40MxvP4CwyTQrENPXmg-1
X-Mimecast-MFC-AGG-ID: jMA40MxvP4CwyTQrENPXmg_1793010469
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0af48c18so2538215f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793010469; x=1793615269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=sRiZt3m11RfvggKftBaVvpS+01UETYAGyxYbWp73pAV7ua7Ps5NFUlEM4a3wXHp/I9
         Gopn4ncvcFP98lxb/IH+C8XyGBE+KpOAPDHUud2MBaCI7PKtVB17+iKp6qhqIIlNNZyW
         OpDCp3yWbtc+wav91MW6LdJLGHmlHzzAwGtz0lIVlZ8saptgEONYa+58D/0QKEotNl+d
         R1EaH+lYSglh+Wa3dnLIbrT7+eBQKFXpgzMOJ1hMQol0V+rTTGNuiuo6JrBZHeWal36y
         +ap3YVyna9gyYGJULDYNIRwhEZwjnGKt/iiWQOwQYIaKvJ6PqKAEg40IUIQhYyk7RTxZ
         C6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010469; x=1793615269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=Mund4YJeOK4Zzqpf6LolUWEsEDNTfZMvQWvbIH3A7KgVJQ+9Ne8wNSw2ztIO7D5V/a
         O8fwOUjiR+4/45iHqQJ7Q4jcpPRsKPOB+f3a+FBLQ0to3PqqQf3agGU3a6NMd1p+tAuL
         +/hyADEhmviCek7Z96N+zIxz2k98qtYMPM4lTa4xW3R8SLcO7c8b/G4jS0Ic+HwXiYLS
         12Nk9cLvfg+J50y/thDdwdWVn5yOHUa03zm+NYGIAGb2rv/jGI5Nzjz/vJbpTE43qtsv
         YaOvxBfglFoBGKk16DXKDdduFGQKkyndurshKCZLEPUCd5acaJOWdto1oBO+sST28pFr
         JWOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsp0Ox4uHArxV5zWqZ3I668YVF+fX21d4r2HkDbQHLtpMM+S4BKYKhBlfm4kIG5clEV/MxQWeVPGh1rX/3@vger.kernel.org
X-Gm-Message-State: AFq9FYJmSgQwEZYQr+SUD4CR+dpUrECcketVThjxrousheEUiSjT507y
	Wjz5tnRLknxEUFNG3gQaHxTgcjdxNXw+uX353C4x6lCnjXcPtp0qWeCpLhuTgULRLE/IrOKql+/
	EbEFz+BZXlYdtOCUY8VpP7TNFiT/45VuvJaluImoeYTq9dJCaIeC61f/k6MB2esAzE4Q=
X-Gm-Gg: AYBFou3A/TGt0e7oLQhlq6aorE1BR0nNVTQaJMC5nPD4LzOCHPxP4cmBgHz+KlWOjOI
	lxaRTmOYmn1gQB9z9JU8Eu1Bwr45ZjEBlYUr0EzhAFsOozAPhslE2YIjONA80vb6wwxC7OnK5K7
	v4LhP8TOcfBxfomma9oUdr4P2LKPvQ3wgj5zwcSv6JYY1zFueT5DnIfk83Er1J+cynisgrJkt43
	juv+MbncGkriKM3mQ5Yjq9wnctFKrnetYGj+SVXqB8E2n3afTDi/DbcmJReQFDpNcapJJYGfxQS
	Yd4aJ9ZjpqbKDtzhQqlVvLBZl2cESBqQtzQBsX3zGOpHERoVwvrokFzqWc/JBYti4w0=
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919740f8f.0.1793010468961;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919670f8f.0.1793010468317;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15899811f8f.52.2026.10.26.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:27:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 06:27:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	Mahadevan P <mahap@oss.qualcomm.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <20261026062229-mutt-send-email-mst@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs

virtio IDs are allocated through the virtio TC.


Reserving this spcific one as a generic VIRTIO_ID_VENDOR is now under
discussion on the virtio-comments mailing list:

https://lore.kernel.org/all/20261022091645-mutt-send-email-mst@kernel.org/

Please
- switch your driver to use that + qualcomm vendor id +
  validating the device through the DT
- do not merge this yet, before the virtio TC has reserved the
  device ID.



> -- 
> 2.43.0


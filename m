Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674476;
	b=ZJrcZhr7GmYSB1lVnEzHWj7sfGpPURRbKXlja02xGdlvgUiODGI8oRskdVa/rM9bbXAP
	 4pQgOUEK7vYgrcWKP0MjdkANioPL1XsGoISJGsy+8ouXkfKXhonHQWt1nzDanXm4ToVmE
	 qoB3twljJ0fwNLJd7+lDZW0ccbLxGqH10ndCX+PIZwp0xWBAYiNVbiAY8em5OnOYh3aOy
	 LAKu9UbmLZNn4c0BQs+a/F2Q9fTrf5/RDz43YI1uc6Rg78DMKrFZqPoYQiPLL8WOCGLYs
	 a9dS+ySGT7uqIR/AUB8gKs+LG9KjTmong33ejpYMdLQTMnbThmIdQ+BPZt13XP3FnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=zevDRdvogR79sVU2MKiE9eoMhnIm5s1RrmMIa/VHNedEfwxbFjq9smtJzdwqBEAsfcpw
	 KfbFnsr3UnvIwyQIQrPXTOg1+WzO1QGkgsGSMtMeBqHFFdouLUX1j6jwgAtkuPJnOv2qc
	 HlFc5uapMffVtGeN1ArZMTPqhdaEJ0s/HPzsdUUowO9EhYyhSFKXKLBr8d7i7Es+dxmYd
	 4GGOS0Aj6XXBXOrxSYV1+5y767JN7R6ZfNGLad90M5G7QEY166uNlD/NbbKNeiJ5wSEMz
	 ZJ6Gt1aQOuF6JufKr7R1++VK1/fUaiAUPK3nISO/1l9pv9iX78+740v5Yaa2FLaxSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YU3dz5z8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59916606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59916606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YU3dz5z8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795674474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=YU3dz5z8hxqa3dUPNuSS31CKO9673zsvf0BAhWEZS6/xpIgvzKUklILav7xry+r9tXMq8n
	B0EBl7XwOsPs3/iqi/eOGn+tpJDHUvW/ju5LZhUi5pua8fmBB/5BmrW2FBToVL1S+tQ7Qc
	k5uRmDLolmaFC+50s88hcvRPpWmBrfM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-S433mX-JPBGnD_RuHLfbPg-1; Thu, 26 Nov 2026 06:27:51 +0000
X-MC-Unique: S433mX-JPBGnD_RuHLfbPg-1
X-Mimecast-MFC-AGG-ID: S433mX-JPBGnD_RuHLfbPg_1795674471
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so46417905e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795674470; x=1796279270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=UsxCT3+vcGpHo1FlQa5wibNzAz0XKjPBk9+2YofaI0NCCQsNsQm6kzCV36Z1yDQZ6F
         3obzY3PeE5b1wTTpin3eFYcQWixPWs425/MsW/w2K+R0kVxC1lMS17t2UaR9Lqc4mG+8
         IZKDJQJy9YvakuZaEnMFS1xFVtpWqAyNLdk4ZAukXt89HKh4MtAwatL6kGZz2BNd3wvm
         CwtvxQAJmITBj+G4vTmut2zK0Vi7SRnemSMCP36XQ2PGdz9ybeR0pvoHlj/QPxXxlCtU
         ge5qBKSjz47zCJdIDK82X+G4QxBYU3DM59pIq5tGlyPK+MsjcOGAa+nEfKh0KbIEpjcG
         f+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674470; x=1796279270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=q8KIecxe5ShRPy1geDijJh54TAZDU+HeMP6Q9lFVvllFV+N9L4MEAwZIaMDbTPQn7w
         dmwFCSNvkNpSN+uXY8eKEQP33hHH+y+yMXiMQ/D8JPTxa14VKkaiuoBNNA9+4MQYzqlC
         sePCyggh/PKk7vyQeyU8pMK0dHAptyLdla9mdjhk1cWjPg1eXZ6PcEIikUesjfaQwNj3
         hHuiEZSMQEPlbcg6dXLQdDiS2qwz/0wGD/YrNSaDGIWY0kGtziyKPJRILL9vpcgCnsHs
         6e3anNFp7k9C8vikqIsGIHPOaUg8XueTrr2S8ZZFQS2ebzMdK4Bj9rdk8I/VL7Rdikff
         QDtg==
X-Forwarded-Encrypted: i=1; AL+hErF6SMZC6RBvGEENHb5S+EDcUkD128iK9T68/wZC9opp2FGgSMi8ODNx7JHEnPCa2boCE8ye5XND6kgBGX5W@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fdk1wkKMLT63Ri1iT1J3nLNnoF0jO1DOPy11tGEgc1bg+i4AB
	IxLC2Bt5jIFG2qn6k5T31CdhOsUo/k0egFwQ0vICv7pQpwTwhLF5LeZsH8IdPf9uwztdmu6vj1y
	IL5yj2XlVHkkjwBp4sBHoGE6f1ci+OxEqp2IxXpOoC2Kz9LqKHzqY21RLNta7jJ2gpB0=
X-Gm-Gg: AZFdTZeFN7Vrit9VzrheIqMGE5tjI/rYHmKqSfg4A135hR3Ey91iP9XrFvBBeaJb2nj
	e9HfYkEcvjDFjPbqvDq0sxDFd+8snVnZz49n5Xl7cB5yCinEhlRM1WCQxkZH8rGie1C7FNO8HW7
	DQm6aXnfYTks7j0t3ckucZ7eJC+WWKA2+pEJzoBtcNcwZBwiRQrem8MWFpa77AegSgbKbqdluHq
	JvuY986heJdQLfsGIL0046hT6ILuBI41DV2WFXUAJ/yoBjLhUA0AnrrQOaMAH4RaurEr6HQRq2I
	uDTn+mmSSVmP5TNuqzGdic+cF+e0WMtbcYP5zHWIPckJE0Un+nZSOSE9LWzO2hBdqVs0qJjhV6A
	40RFqNB9zGxZhK/vnuKnHeUtp2iIvxo4AZbP0GOLHWUE=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405069415e9.4.1795674470501;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405068955e9.4.1795674470015;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm44293956f8f.24.2026.11.25.22.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:27:49 -0800 (PST)
Date: Thu, 26 Nov 2026 01:27:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] virtio: Add vendor-specific device ID
Message-ID: <20261126012523-mutt-send-email-mst@kernel.org>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:00AM +0530, Jayant Shekhar wrote:
> Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
> vendor-specific VirtIO devices. This allows vendor-specific functions to
> share one VirtIO device ID and be distinguished using their vendor ID and
> platform description.
> 
> The value is proposed for VirtIO TC allocation and must not be merged
> until the ID is formally allocated. The DCP function driver should match
> the generic device ID together with Qualcomm vendor identification and
> the DT-described transport.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..9a8b6a6a03a4 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */

I am fine with this. But it has to get virtio tc approval or you risk
conflicting with someone else's id.
Please request a vote in the virtio tc going on this one and resubmit
once it's approved. takes a couple of weeks usually.

>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0


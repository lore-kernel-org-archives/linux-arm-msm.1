Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956376;
	b=aOIr6lwRE+S1Aq4Std+6+GbBB1bHgZ1HBHbCkpuVbiT5OF0goXios72/NHahxAWX0GsI
	 Z7PsHcVU/luHDcp5lcOaes+eGGefZqbU5WfJRHLtzzOoSax5Tu12aAa27gyHiOYsvOemS
	 zVpmfTbVFpLsifgPGyE7kV4iBIwon87PgNCHp+0u/kO23T51UQzKj7Yt6Z+uGwUlisBXq
	 Lli+Vnkl+DwJ9UcApNOs5GrpOwxgDPaAco4luFmJqOwWrkZn6PmCO7kKetRzWOxvD4EhO
	 7t5RTVaELvi+9YvCbFWiHM3EWjBuMjwMB+Jj5rx2VOrfFhX5atULGGNQHjUz4l9CgSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
	b=rC/oFj0QE6/Wz6BWNzjvqnhPjT+qrneOeiUp6nFt2tDaAjXVnQjm1Ss50dpM5VrJkgIV
	 rdsZTUh7TjQ8XM4kkCqtr+8VlTTQ3V0uBbaa0pxTo9vKZMGqDE0jRJ1vXk9t4X5JCwfhG
	 kFSl/CQL2/IqObp6jiWD8E0hubemr/M/UTi2e6QtyWLxJ4W7StOAEJAzpaZImvUDRG9W1
	 RjSoGOGPnylT63dRjgtLKaC4UyJNpFk6HwRTVC81c1xatFfO2peCxFqK4latzivFjGq8h
	 QAzatxYkGylzIld/Io7F8OFUhk7/M0kUqi2+ps71KRhEoA18kKUw9xEy6QKaNt5mpgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D909606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D909606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2415785e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793956372; x=1794561172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=F7DCHBDWJZ+4W4fYCOJAzTGIPUZxKEM3GQC0UOoOPoAWs2sXUCP0NuFdJ6wVu2Os50
         3wVL8GvuFQE9sHoxI8MVjxE6iTpOBUpa5gDiv+DeuFw4+Jk1J47d+J9iL2ailF9aRunt
         evoZoHyEB8egMEAfX7568Yz8zZUnzf91RfioeY/omDmPu3ZKADe6339IZJqYWVHPc26J
         z5VNCpWEHO2L7dXDObSFERCeTlRP/WQ8092QYY/fghw9MpgBbnJG83NLZf4fc2Y3H0ed
         Y06oe2zadbaLO6k1LP9aUY+7pkHtxwkzuUfNJKb94ZaW874HUt18oTsDZzdhU8U4MzRj
         c9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956372; x=1794561172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=oSnXerlCboePBzYflLU1bETBBgEdZPkXvOXhMk2WU79/eNU3H7CeKme+gqb94prDOE
         8BIM9mC/bs0MxW3O1uoqqEDD4MiFr2o4sC4gQFWGWZJGZLis2mh9GaZ25pIwkbYQNBwd
         DUTzyPFbvlSQ2E0tNB02N5zhoDCz0SJETQPWklxZKJmcKtYpIm734bVD+zA/+latk4J3
         qFejnTVipob9kRK1+nAGd13TP5uQSFr2c9LbzYie91tEbkRnddD2MPBelkONv1nszfS/
         3e7J/UsNVVZlFbbSBBPFNSd47owjbzRX9ibEMmcS6KlqEQ6aPUuLLbJ/ZciThss5qAW/
         YCpg==
X-Forwarded-Encrypted: i=1; AKwUvBwrlA0JarUkfGsEyTYJQNKh6SsvOkqwynu9bkGrw+exxihWYwjl3luG5kUd4WjxjGvHYTNvV3tLAGT8GUrI@vger.kernel.org
X-Gm-Message-State: APuU4Z8GHtddFBCmiWMG15XUhBXg6oZJitJkAJld1CIsnOfUyl3G+C5Q
	njKhdoUHGjdJO7H62SGxytJujhOWIv6RqKui4xs2Io67UTgdnPOiOWlnrC8EnLrCyjc=
X-Gm-Gg: AYBFou1E9oAXLVP5hKO6M4KJcVm7lT9Ytl2bYJTE9i7oYoUFFrONncWAPxBwxangv2z
	VoKl/lqJbO7yGqrZN8DkggiFKyo5CNUZcKejdTsCRZL8W2BZPei7iMYgC4GzgmTy8biFFmfPOIl
	6rLc44UUSEnY3NpZGw/zZKb9U+P0T08g8lVoSqRw5LsjPyGqt7ensWGOOKSBaWYphmWU/WQtrE8
	c9Wp5zufWRbwSzHy9Jrds7fsDhL0NlrdRWzvUmT/IJ2xj04xajOjx8lRhDfRf58syU4zUx9kEvg
	qBZu1VW1lOYLBJWYtBhYrelfdfxLGfybFx5FOKH1CmOASOheojwbgV/5COvwN93q6a37XhVN+E9
	drQfVfOCsqF/xn8dPg9mnAUqHo8g1SpsIIlzwKDV1eYENYI47L19i/gCyC+iYExnB7YMB2v5Hya
	45oyJKzRKRovsf0TexBE1ET7MbvC7T7MMxD/9sGy3qXMLzpFR5CiU2EbCYutsg0t9FThG0OWaQe
	TvFHvW/XAflg0VYfbqCixeyAKhPUkxF+j184vMQj/7RpVl+vw5W99qeYakQQGvitynKQreKcR/5
	JW0E/pk1tzCoeRPtV4lzPnaapIaqrfAUHiH/38oenB3JCH4FviGLSJ3ptN2DeFb9EnRxe6bC9ae
	EsEsNRq8L4QOCIiTFV7v1G28exIvk72NysH5kD80hplRyVM/Rjg==
X-Received: by 2002:a05:600c:a4b:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4b6dff8449emr26012245e9.35.1793956372121;
        Fri, 06 Nov 2026 01:12:52 -0800 (PST)
Received: from alcachofa.home (cst-prg-36-190.cust.vodafone.cz. [46.135.36.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm226920045e9.2.2026.11.06.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:12:51 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	krzk@kernel.org,
	rob.clark@oss.qualcomm.com,
	jgg@ziepe.ca,
	lingtong@qti.qualcomm.com,
	cacar@qti.qualcomm.com,
	sandheep@qti.qualcomm.com,
	Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Ekansh Gupta <ekangupt@qti.qualcomm.com>
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
Date: Fri,  6 Nov 2026 10:11:19 +0100
Message-ID: <20261106091121.3958523-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 03:51 AM, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
> User space
> ==========
>
> - FastRPC library: https://github.com/qualcomm/fastrpc
>   (accel support: https://github.com/qualcomm/fastrpc/tree/accel/staging)
> - QAIC compiler:   https://github.com/qualcomm/QAIC

Hi Ekansh,

I'm still confused on how userspace gets to execute its compute kernels
with this uAPI. Let's say I have a compiler and have compiled a function
that reads some values from a buffer and writes to another buffer. Could
you explain to me how should I use the uAPI so this kernel executes and
I get the expected results in the buffers?

Regards,

Tomeu

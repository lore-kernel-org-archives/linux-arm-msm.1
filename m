Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385700;
	b=1lJcsQXwMoxztI2dORUbMM2gYGOohroN1QA5i+gWbASCbYqjW422Rs0w45Lrn1sEitt6
	 J67CloOOuR4tjHJf05eCMN/Fc01L4RESlmZZEhv+0NIZNA/4AXXDN8ztVacZe9ZfQymcR
	 8XRuDsGYS8PVuP83cUla9uieGGGpPj+Z85HEjXeth0jkZmWN1shP0AuuXjwo2W1OEHeag
	 vfS8HmsoeoqEdyPDYElKC5aKi5DxTEQ3q8LJr5CXnAiRJ+6W8IS7zG+bBEslYP7UWSlDp
	 XNNKhUjTLkWxOOajCiJc5LNhXhNB1bIA4xYtbD0oGyl3K75fyhGCIWy+H71yJ6tpntQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
	b=JP4VN6DuyKNpJk0LhvyVncvv5Ga5o7w/2VSWPiPzsY+RLTniv7DK45ggXoer2ExzC1a1
	 E35YH9OxgN+S5Nuh94s8H0z7XdKFOZNNpcBbM24+NeJfG0q8RMQkH1fsrCUHFxHLzwyAx
	 Ck/pTFkAmhTjp7O4M912lkE5HZnbPDYqxXuTSvRD3DyJGEV44Z7mjAzosR1vW4+3Phfd4
	 Tc03+Cd6aOfMFt230Tj/lCga1VN1wO0KqSUWXagg/488E1jbJfLgpl8UXi8fK7R48Pk3N
	 nykATEx+7kLk3TpQ/if0BvwF15HTizl50OroC3z8JBZ5Cn6Y4qZdgP+A3ke+GhzN3cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xkxcbiyN;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E660A260A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893E660A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xkxcbiyN
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so3350975a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794385699; x=1794990499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
        b=xkxcbiyN14ALxrYC8ozLa3iqzBGp48l+79afE8OGelHgkXaYpHCY0JDzrMskfU9Mhi
         +STdmenPCJrraWLt5SpsefxWkLdepApkXnfZIQtbfP8lGmh6RpOM+GrxXa3u1Hnl+AMM
         L2QXTQi5F87V0Le33RGhCus4DqEZ0WEUHrWqcG83MzSuDCYzericb8uGVyo2KJ82Jazo
         S7YKj8wRL7imqcUj48fOhnt0xAJ1r+5mcwTRqaf4XJqTV6gSuaa5stX8GxeZW0r4xmyM
         s6of8Lk3WzeW2/JhUF5ljU/SKMWbT1T97qgqre23nX6BN2BkDipdlckfeq/HU5bzfrtk
         /d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385699; x=1794990499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
        b=KpMaVNrgYVjWVDmDyK93GCz54FvGiSIDHY9we11P5rbMkDwU4v9qamWEn7saBQjLuK
         H15fO2+uw5S5/V9nxwy6w2aXDHmoLX6pwlmy5D14cBrUyZQC6xZ4BqcBVmqrBTM8S0FM
         ahPNMOE1zgQJIsEdjGtMgj6ikur+fPpcA1Q0kHNtdLL2sLXhtmwW3YHuD/aH2lNtqvyi
         gSHJyaB/yaHqRg10IdQbGhoDvw2UQbgyqTy/9vO658C6EatE6FRL6IQNG33RW7aTx86m
         iC9iFbEWZRQqhXu1oSMO/30pM8Cub+PJH5QZdcU8KHuZWAyMWotVoSn71ZVqb15xuR1L
         MtRA==
X-Forwarded-Encrypted: i=1; AL+hErGqSws5NWY9X1B3ePWif12BRY0jreuPIu7GxKnxJw9hEwk4WAKd6ZgSjjotWwVPjCz7cjUYYC9ZgNBmh8MG@vger.kernel.org
X-Gm-Message-State: APuU4Z8sS8HCV+2HzCpwtx5iNekuTvwbo7XGbtvXQTfC9FjkyL6tkGYV
	GgK2jFh0UqaoAv8+anhJPnnhg98e9HKbjVh81rXZpAc6mD42W8uUpxV58lEFWMmOyA==
X-Gm-Gg: AYBFou3DSsxXTewwcX5lsXNtEYCuWyyQamnjvLkVrgrAG94P5tQyDfZ9A9GKH9uJq1u
	iYzfjbuPBvSNcwP54hSh1LU684S6yQQFWHH0BOnnIpDZqvXYvGd0zwQrmpi8wbcCnToe0PbxKF4
	8LdFQJzzsxiiuol/ZmNGKCX28T6ox6oKEiJG87AagSk+Hd7P6SJrE7cd54u+J+l8U1tEUjLM/BV
	qtLr66Do8p/mdAnflXvoMLHUEsik/ITnux2JTWWn8jON2D30WkpifzVOHIbCBTen9ah+XIDwxDS
	Q37Gf32l9ASS4MQU9beiQGi8pEjcXUlYe64Pxp+APgUsj05nfl0941+AYe7RnlU+JC7m8ig3wwt
	j0xncN7IQLHWK3+Die9nzeQi7B3qcBxL0yVh8QZuRZx7kfKOgHzAAY1r8dM3u7q3k/V8W4b+rkJ
	W1zcgCvKxrjFUMUfIVRVGE4InjQWnUYNvshg19mhTiuXf4aVSonMqtolxxom+ckkvlgWPIUNNrO
	UDiIjDpL1VU7Mn+9i16xwCGau8xw5SmIozSIbB7chV9v/mfwZteJr5leqsvuwThClumf2QdW2RC
	UiIC62h+UXFv8vnS30hhZ9bB0zo5Vd3ccdb1wCka0Sd/feJ0B5rcpDGehhXW8Wi9cQcw8E421Ig
	Xb9G8LoG9XSH2WWqUE/1T5V/zzRGBsCw/rvXbXFrxYsuaUAQMeYfkxEHzA+fizqhM0qxcJgfGKv
	NgEk+tK+WAjiUxMSaVQ+bC8FwzDNZhJmli2Cq7W/pnwxrz8YoiBPGLrr9fIiWmYQ/o1aK0cGOow
	c1G5Nit5On3glDfbZv8bSLTCdjN/qh3mCv4OVwmYvI4MSsFmhVwlVnm+1DOcZvWLdl4rgmGp88h
	jWYGWPetAvWPo+WTacc=
X-Received: by 2002:a05:6402:913:b0:6b5:5fc8:9ca2 with SMTP id 4fb4d7f45d1cf-6b77780e04amr1206149a12.34.1794385698810;
        Wed, 11 Nov 2026 00:28:18 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2305457a12.0.2026.11.11.00.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: yaoyiqi3@huawei.com
Cc: srini@kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: Fix double free and races in fastrpc_req_mmap() error path
Date: Wed, 11 Nov 2026 09:28:14 +0100
Message-ID: <20261111082814.248812-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
References: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
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

On Wed, 30 Sep 2026 07:13:40 +0000, Yao Yiqi wrote:
> Fix this by adding the buffer to fl->mmaps only after copy_to_user() has
> succeeded, so the buffer is not visible to a concurrent unmap while the
> response is still being copied.

The double free is still in mainline at 067c5c24cef2 and in
char-misc-next at 37a87cdaa3e2, and v3 no longer applies to either:
9e47ad9c562e ("misc: fastrpc: Allocate entire reserved memory for Audio
PD in probe") removed the remote heap block above the first hunk.

Could you rebase it onto char-misc-next and send a v4?

Reviewed-by: Julius Bairaktaris <julius@bairaktaris.de>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793672913;
	b=PgklhTIORiikPfK5o2ta6OHskx7UwHgsLYkD0u/iAA5ojCpGu04QuC8DuLvOMCYcmWoQ
	 hWBdl7SUY/E3c9pO24/35LX32kOUUOtTF5d4ztuKm+g9xqEOQLmrygjsABFuL8k72l0lB
	 E8OoPBpl1rhNZxb/zDAUE+Ap5gw1xrzHPCUe7wdzqGGX+5JBtAa0JJRXm7sVcfsG8VkzH
	 Two1TXkUoGuskLvz0ClbgSEhoMqPyYnWGNQUp7sYtulDovlvyR6u2cU23tDhbmSZa8FVY
	 ehxoAsJPIFnJokirm9I/PBCekZ8L2ItX+/dhFXebuIj6k7soeIIpJ0Ak5VBq91YRSDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
	b=qvLZgP+2r2cSc0FUM97wM9RDOXYsbG1GHUSENlAFisRAnCh7blXYhVzwGo1XKIHGkco5
	 cnJx2nJwqyvZw5+OCt7bcSI0CinJwzz9QRpHpYPySMbh7PF5vd/CHWsk+Z4DL+BUaCdJZ
	 gTn2ZnAWZdUj0a5Rlmwc601hW8A6agcj2P1fNqzTWnA7AwfDyhSSUZ/vSbdpvBrpE77g5
	 8mL7CNm/HFoUchS4q0yp++JFWdNy7hHGPvBmT4evCfXxub2jQcm1Kvi/RIYYfJjzHVxTk
	 kJq1IN9+U/IaoZeJ0VT84aMBbtt0FPwMhMfxkbus63xL9QJSb89PzweXnVJTD41PrQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90F606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 02:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B90F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9a04c5so62215021cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 18:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793672912; cv=none;
        d=google.com; s=arc-20260327;
        b=M912VHhkLlRIbiTl9gw8//E4HgKTip15dDWmRcsFXkspJxKqSxEKSinoKXp5Xb1QMZ
         OWCwup3rLX3aVtvvUwQoR7dtFPh0/KRxo+dfbZOQD9HzjujAJFqdS57pZt/CnSKuODw1
         pOPFI6DiqmqL6lnkYXtke2IfJTrLxjgpdIt6NTRMU9ECKIZ2lO45M3YvWgd5mmFy/z7d
         lw30Mmtchq8IMBRUpBhyVzVSP3NJcyaBrTawX34p7g8GLOYYD/7nNdWOpNCtuvVC4o9P
         6NTxlbkUPN7WPl8fNoSipcRds5fOe1kM+kd2dckR+ef5CMkG9rbrZYbvlwF8ZPING86z
         iT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        fh=ol8qAAoLzCZEjqs72jm+S3CYUbagqHLOXT2flgZRy1g=;
        b=XBp/f0ukApjI3waGdhTepuUjlcjdbSStJjQm0xuHEogoY5pOO+JHYot8X7sVwS3F6V
         mOKpZKSLCk09q1szQtV5iOa9swRJ2zl6e18WDs0gidoSs63XHww1TFPBOrzkrAZfK/bn
         dHdegu4N2QqyWYw6d7zFrzWfFNV4ziHsW5KUWY5AOOXyW5x2J5B/nQXim3/fYWLVxY0Z
         sVRyRSDOFRPsT6f4yby5QHWofD+8LHVLpFzCXdPPGhgukYp8IKS8ZMcf6EkWNeGkxC96
         B97pZRz8Nt4owYd4O0GxAWP0qaUytqHGa58ZXZSVLtpz6rIAqyFamWnGFfxJOE4rRwAH
         comQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672912; x=1794277712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=TBcVpV3Nm0DEYNMpivFPwbeMW+Qgh+kb04TIohJNdNrJXXHNLdU09nGHewGUewzNB9
         kGC2oUWJ6M26At3CDIR3ChUKw8t/UezDkoB22nnJOwjzv3syJrngkTRCnZp90UBO+KJR
         jw2tK1G9qf563Dq/aHrzwejkDJKKaNuQ1oPPe9Wu+sk8CrTm01ftG8UFfK+Op3Ky5V3K
         a1J7/HcjRla/z9oh2iSNS34iC5Dy0pJSl4thJ8LmoAhb81bYvvJ5JCBeB8gO4pD8WLtK
         zJEMycOpLbu7GrSQ9VNPnvdK0Y9R0s398SjtBGUIQg+zf5y7TWhZpymUFUFrUSS0me02
         shaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672912; x=1794277712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=cH2UxUrSByOoECEQMDRzODF/dhHKrcn9kzsTacVO1sLoCgiFhKI+xafMHNbGhSxUKZ
         OmU6ng2BZAmxX828jsZmXyisEYGGPaNDMiKjfRAi/MnS3e4IFgAv+Hvctbpbmlsgzgq3
         yJR4im/XXxXHdQfAuBnGY9B7OLze0cHJtOKJOkIjGqxatFKMA6cudDXdDUFSzHvJoAkQ
         cRYdez2Ly5xXV09IMd6MKzotJMBjjhAWTKap8Zrwft9wdV9vk25k3Bbr49OQRU4b1DJM
         wXrJFz6N8zhXH682v0g+/grNd2NSRy8FxD6b3W2KAFEKIyP3FGXbmGIjHo6C596Kh69O
         bnRg==
X-Forwarded-Encrypted: i=1; AKwUvBxXe48wLy1xWvtyT81Fq5tG+qH6yDpFIES0uY++Qmoiuz7kqSc5hWEunpfyONV2VB4ZFuPWHM1meCc/K039@vger.kernel.org
X-Gm-Message-State: APuU4Z95x/mSzNlitqKYzvihtUlGUDLuiSmvADTqpY8v8jbEZgdLRZIT
	wcRWKSoNfZPVxqOp2GfC+k5SO+NxkmlAMXiBMiJ6DaTLsRVXvqclguEGmAvxNIMNCWRzTyv2twR
	2+jfUoYtD9QkqZENPJuDabYAZ4GzaOgY=
X-Gm-Gg: AYBFou2/RvLkQ32g6TvGONYwj19vd9ITAf7pcX9rL5WOzksctZ6KLSZv9ff8GucFbqm
	5Cubp/3C5X2HPyLH7KtRknqcDhgHLx4Gt+QgvbXN29UhuY+7YcMcQNV6Z7ujr8pSrECkhOqLt7E
	vvnMHHjOg1KtInRO1Yy9xhEYDnBUgMwM9CQwmIqioT4ubF+n4/aeBaxo0KnsMKW0c4f+V6smc2F
	DyW8oA9Fqsg4OlRWM0h4dowMia7ydVzFW9PxaYPTqOqb5ESTfoJY2ke4rwYisjaAA7OjwGXqQzB
	8tyquu6jkLDAQvX/qdM+FjFgREDxikQ1o3m0m3JeKRdn+ZV1An5jB6Bu2yBAy+wC+nNPJQNbRqE
	AkgOoBow7oTCY+oi75XJxnv6Np2UVxcVvmy1qNcjUhZrGD0mw8qooKdgGIi1CPc7cXFvI82xNbd
	fqtO7uuSxYodeQfhjNZSEq0P1oKODxfb9mcnNBAXSDTOJTL+ep5yRs5PNzUpceTUCVDcMWbMhoY
	CtdFGuK5NNGI9zx3Kv83HZnog==
X-Received: by 2002:ac8:59d3:0:b0:536:3a49:f76 with SMTP id
 d75a77b69052e-542b62a60f2mr208129931cf.27.1793672912039; Mon, 02 Nov 2026
 18:28:32 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:28:20 -0300
X-Gm-Features: AclHuK-mWSKXd9lnXqiSNJlntbzfXiWNAcEZqwA15ieqTiGdj9OVEQ3Jtku0h9M
Message-ID: <CAMAsx6dwZVCVQpfh9DYVU3NoTrsbRLOiORdMKm3Yo-vQLmpyFQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: kishore.batta@oss.qualcomm.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
	ogabbay@kernel.org, mani@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kishore,

> +| SAHARA_MODE_MEMORY_DBEUG | 0x2 | Memory debug mode. The host should |

Is "DBEUG" a typo? Shouldn't it be "SAHARA_MODE_MEMORY_DEBUG"? The
rest of the document spells it "debug".

> +| target. The Sahar client interprets|

I think this one is also a typo, right? Shouldn't it be "Sahara client"?

Thanks,
Daniel

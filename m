Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362070;
	b=ZHcltWD7dE0uyAcKETEyzdhl4g7rb0HyJ5qM/fntR97p9cnTkkPbogVd0igkCG4kwmL3
	 e7/z0IAqunUX2xiU6EGHOYw2EMVnt1mkHBGpGkGxbWTgvoWqzWt+FRC4Emi0cRMhitS+h
	 3zJmk1rNFK83OchXdJhobVAyVvj+8qad2nbZJ5DpTNwfcLEjIE04QV9MKzmMm9otuUMhF
	 hP7n4J0ijDN4rtzeUu/NYD+M47S2pYmEpvhr/2Vei9zcibKOfwRZWwvY45R2bNxMRluxj
	 jkX5FLEUoVSVpGaQ8fDMofneI+cVHlfS1NuEnsjgvBxSxTrDb+eW13ds1AVbG9mBA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
	b=mJzFOq36EyD3PuAW8qkPCaspzfWj17EUL0Q6hpkN6cteA0rM7G6/qMeUh+SmNOrbVf2D
	 K61vevnXLGWdwOqXWzuRZ9RCmikMI/qMq8QmwIVZ0+KK93PdlACD1QbQgZOX4+8tgQYCN
	 ZgpoX74xjeuUJNDSSHK9ZQRkhQsyp2JBCML6S9iV2yNrQC8j474AZWWc5mb+t9fx9dQby
	 i7ZKB0L2kg+dqKAMl2lafXcU2NazwGwvh0INuiCgWPQI1z4EKoUcPevd5zy/GyM0TRJ4U
	 VsHbVJjpB4Z9lE0AJD7BVJYpkuopiQkv2VVbjlrKvIceXem8CffiTwm7v+N+Ig/uNOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335D606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 15:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A335D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso17166535e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362068; x=1795966868; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=aF7PRWXc0cLKKbQEjH/NWrxHpk0VSt4Mb98W7lWcuTXny9UwbVQjWNgdaTnkALpRnk
         ux/9n6buSQRz5KI+3QLBJxNTc6MUL/3Z8pukSMMvpI70jSCBmFOxhunBAjmFon5OUlw8
         j8OPqHV2y3RIwcRGxnktk5JPhwVLXFh8TlC98YliUQXrUK7di3eUuwqTpBcyymRaglaG
         xyyR8E5UJTiikMyV02fX9tHJ/uBmGGBQyfCCJYTXbaoVH0N1QFVz0kcVXdDY9vlJIm84
         r77wwS/7ZPpbbrad9ITagWEzOdLJGFlIqjHs9bpxtCSxmtc21k6nmUljdxekl0bDq1gH
         HOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362068; x=1795966868;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=RrKLkhllg1uNrIuuZIZh9oqdaQ2agZVpHvq/0ia52Un+n+1rl/u2rVZk0IUd7xpsFp
         7xFbVkhorIpyPIsJiFTD2NSDHM8amvhUJsp+OTdIN0wj+TDO2qZ6+AFnvAoqI9XwXQg4
         BnV4M8y7mMwV3AugDgZ7bO0u9iBZJk/d0o8eqMhqQhbfo9+mgbFv3DBCYqzkZ3NpqtFe
         3yisjMSobEQXeuBi3zBiOmFTCjPmzjfL5c1+/ShhUzSOea+16TF+KZkWuUICLcosucHi
         C0VfQHSowMP6DkNt01Fu6BIFXT6yOL4XEcUadjm7yTgvo6uDjOxMzZ7IDIrjHPS6sA7y
         q0pQ==
X-Forwarded-Encrypted: i=1; AL+hErGdb7Dj8uY8AuVEbIyIhO0gJB8EjPgv8FEk75EL2zgXeVHAZNtdgShZHp76mNcu522p9BZs1ccC/oqDJqgY@vger.kernel.org
X-Gm-Message-State: APuU4Z+pwK/6S3F1QGvZwv/MGW0sCgo+pkGzOSGxHPiJ5a3Yo4Wmp8QV
	7X+5tOIndJyTdtro2PA45q8mm5a4ziEAPg8ni5ishJkTmujvt79QEE1l
X-Gm-Gg: AZFdTZfPmLRd5G9H1/rQVH4ySbJinGtDhmTjgqIJc9Qm15oiCJELQo/7KKIiN8ucKnf
	LB387zPRrYbOrlGRBXD4auSvbP0fNfo/vOzPCrMfjkNPFbSxhVuzgT/mGNh1VOuvPVjYV4+yvfK
	HBi91/HE1E1SW22AHgF82AC2Wg7/xY6U8K4cUTl0FgvYR06EmcuKAR1+LHvWW94P9UdIKe6ezz4
	IwfX7aLSL0nW2B/+ZuXKEpx7W43CdZPNR3Gxn0z6hHCGHWINJ/+OPf0jusaUG7SEm3nEWef14N4
	uir2XVOtqnhl1tGGhMIlvM17oNYoGbI08VhF6M3uOEGaNsQCnp27qWZhJzpL4IM2egaKxe7QdfT
	4vaT0FquNrDOPqDi+wqeB2nPbc9ckiJ9pQI7Diyq5eqoxE4Yrx2jhfJC5yWsGCWKDVyIAIlw4Tx
	LUNNbD21cpwwc5fw9Rvj8Vd7Tb4+9KXbrGYTTE3YelI3N2W8fQvytR6wHXUS99TgCty9UnUUfGd
	0dL2qFJFpbpNJOSTjTMhI9Ccx7O+BWKVz2m+iaqssNq+HDRx7AttvaB
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr201760365e9.35.1795362068140;
        Sun, 22 Nov 2026 07:41:08 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm276634245e9.15.2026.11.22.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Date: Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: vkoul@kernel.org
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
In-Reply-To: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <c15d3417cda640aebc7bebff76b0448e@gmail.com>
Message-ID: <b9a72d2ad40d4a8087acef99a7bd2fc8@gmail.com>

SGkgVmlub2QsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBpdCBhbHJlYWR5IGhhcyBT
cmluaSdzIFJldmlld2VkLWJ5IGFuZCBjYXJyaWVzCkZpeGVzOiB0YWdzIHBsdXMgQ2M6IHN0YWJs
ZS4KCk9uZSByZWJhc2Ugbm90ZTogdGhlIHBhdGNoIHdhcyB3cml0dGVuIGFnYWluc3QgdjcuNC1y
YzIsIGFuZCB5b3VyIGZpeGVzCmJyYW5jaCBoYXMgc2luY2UgZ2FpbmVkICJzb3VuZHdpcmU6IHFj
b206IGRpc2FibGUgdGhlIGludGVycnVwdCBiZWZvcmUKZ2F0aW5nIHRoZSBjbG9jayIsIHdoaWNo
IHNoaWZ0cyB0aGUgcnVudGltZS1yZXN1bWUgaHVuay4gSSB2ZXJpZmllZCBpdAphcHBsaWVzIGNs
ZWFubHkgb24gdG9wIG9mIHlvdXIgZml4ZXMgYnJhbmNoIChhcHBseSArIGJ1aWxkICsgY2hlY2tw
YXRjaApjbGVhbiksIHdpdGggdGhlIGVycm9yIHBhdGggc3RpbGwgcmV0dXJuaW5nIGJlZm9yZSBl
bmFibGVfaXJxKCk6CgoJLQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CgkrCXJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKCSsJaWYgKHJldCkKCSsJCXJldHVybiBy
ZXQ7CgkrCgkgCWVuYWJsZV9pcnEoY3RybC0+aXJxKTsKCklmIHlvdSB3b3VsZCBsaWtlIGl0IGZv
ciB0aGUgY3VycmVudCAtcmMgY3ljbGUsIEkgY2FuIHJlc2VuZCBpdCByZWJhc2VkIG9uCnNvdW5k
d2lyZS9maXhlczsgb3RoZXJ3aXNlIGl0IGNhbiB3YWl0IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5k
b3cuIEVpdGhlcgp3YXksIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IGFueXRoaW5nIGNoYW5nZWQu
CgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK

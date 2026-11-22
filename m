Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342488;
	b=yoI9UwZIeUPnGRB+3AVGNYW871QWRhSr4dgpxUjh0dhTpcIXitSr1MfKFP17tRJ4Qo28
	 wmDpy+DUF1Gv3Zs93lYDm5KqAnNKyFdBiVZdSyhP0fD2c1kpUntuQaf30HCktFq5oDgr4
	 8o2IoVR8xDq9SlS0pQLeTSCeJZun3oehlUfm2UYy55iSxCmDTzawy8idcrKfY+N5IHHdZ
	 b4DHUmV/Faqjm7r0IkwOP22VSPhE1nuzWk5WRhegqVIWAXcfOTVWrlReM56wDYXPhF5vz
	 jFJ+61OCeoYgf+j0UAaW9zrKtcZptJnx9Dl6zkGHBMj1X8J8TIQAiJwkEMkDkF1wFCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
	b=f+ZbMfd5AHviLaOlSqgbIQFovVbd4Mb0yb2qmwSIvgE5Ah9XtYSiYUSlcrKe4qi98tX3
	 hTsvAaP2W96f/Lxva6CZN8821OMOpG/cPzwZT5KvRxzm+kh/Z3Kppka+soo6oZyYKYx9N
	 ORnQ0Ghw9mIdmxuOdTnl1WTDEDa+XFSK5GgVB2i2lxfKp5PSwxPryiaQGhhqHhlJU8wJr
	 TPkcgOKJnWNakp6zm/p5htVc6faProBzX8vOiGlL/8Sx2hWVw9Hygogi7WWtHzn+Lpbep
	 ZQQYxSibjXEZQdUiViRC5q8jCkZxFvbcJp4NUn3RdJEXHGfkA2OJjsFNSaP5VtiQqAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D4606A32A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so14809445e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342486; x=1795947286; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=aDHtyFnnrzRBtyyZhnLselLVunVioNXJxNB4EW9L94a61SA06PRXZmc+GnmSXV/box
         iaAHTVrnRs8ObBKUlV2SgkLchAD1Gg5exAGml6I57wEAEE8CkMx283jLvJnGJgYwfxNl
         07S9UBEOuLbCp0RzRUPH9DDvGvrV8UujOKb3nAahk/QYa/QTczCXMZhMUvvVdna9RUct
         sfXxsU49qmORv24iGjit3+/wTQHJ8Njrey/8/vMahEUMN4olrlunYHXqPfYlgRSeAfJ8
         F1QYeyhKHrKMTTvIDsVf1BJep6E9Abmi3UrRh36o0TfvO5etYUsWf1tBQ5UNUM+EZ47y
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342486; x=1795947286;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=rfK/QBx10Dcgo3n1E9ouZab56Cb2Ln7ghNnP3qgdYui7PsLNW5UidHCkKzg++1oJ7i
         38zBfPFRLj7w3noJPW4w4K0NlyywStMak4z5iXgLf+ixFh+eswmiIY68M/YbbHBlQ0aN
         v0irPh/28ovWVSRM0XuVh19Hig/fPRXc0o7EglsiPgxdDn2XCBAz8ag+10R5sYp/IEkJ
         ZEFA7rkSKj+Bq/EIfGwctklDWw5BC3bziI2M4WEDRQthhpWnfIFiA5Xsl6plGVgGtS55
         FhmQdkhZAP/a3j8WirivLIj2x/lORgXZQWQWK9nKzXTd+vxT8h6q47PvoVhwiqXUoPJu
         5+6g==
X-Forwarded-Encrypted: i=1; AL+hErFkhHDdW17rTh5ijuZWxk+l2v60EDdkueqJEDSs4NGmPGgiLMNKSjfHPoMMx481VdiRO5P3MJaSoBxds/3R@vger.kernel.org
X-Gm-Message-State: APuU4Z+fj8etFSmTDDDu3Bt3hBwvNIujTyE6UrUGC81F3zlg5XZ1Sc9Y
	PvutpcR1B56olJtuUpsPN1XY/FBj1lrARLG4CJZ3JYKp5z9VQJIVzgAw
X-Gm-Gg: AZFdTZeAgpnuWzOtBy8fwJmsqhIxdaOZBXEmvL9RLDDwu+/j9Bwabl/TmljzaEKRwtS
	CdQV+mjQgdn635+tu3UYLjqf6D6fb4EMKj25gr6VjQXxFFviSLOcdDUx4BOrHRaLM8Q61KupkK9
	+1kCJ4AY5o4uigLRBKD+fOTIV75k1ySJWtrbUoPhOYAERg3GWmzoxaX0OIx4KaCsBxGLsFvwY2N
	MYoBi8q4t5Lu9CPKdKeBJCjT2Eh1KTn7JMVvp1v1zzepENQlvN/xWm3p6VYvTSKMVPfzsKy1KSa
	NbtqnrR/ItnwIFERCOHiwDPQrYAMfBNU4NXlC+Wcum6xuZw1m//IUuOvx++2KYLPKNbdOwoVtKT
	kz8pm1S2Jau90ReCciA2ojw/rklIAT0b/uit0004DxRrtPs2miZQSlQ8bQj1AEbdZ62G8/2nnT1
	Lrp+Ra1Fz/cn3BXTc1YGKNgDNkzb0uuXJIO9dWEN3yu4SrePoVImdlcMcKhlNAt4RLFzsPmGMBB
	tsjJW5OSLTGiKzCVFDXFMNu/6A1KQGgHl8KNcOHZ8ybqy09kUMtkz4u
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr216757975e9.15.1795342486072;
        Sun, 22 Nov 2026 02:14:46 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm112778555e9.0.2026.11.22.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:14:45 -0800 (PST)
Date: Sun, 22 Nov 2026 02:14:45 -0800 (PST)
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
To: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 yass27106@gmail.com
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
In-Reply-To: <sashiko-outbox-217692@kernel.org>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <sashiko-outbox-217692@kernel.org>
Message-ID: <2920a713778046808ee4a8c2b12002f2@gmail.com>

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBubyBy
dXNoLCBqdXN0IG1ha2luZyBzdXJlIGl0IGRpZCBub3QgZmFsbAp0aHJvdWdoIHRoZSBjcmFja3Mu
CgpQYXRjaGVzIDEvMyBhbmQgMy8zIGFscmVhZHkgY2FycnkgS3J6eXN6dG9mJ3MgQWNrZWQtYnkg
YW5kIFNyaW5pJ3MKUmV2aWV3ZWQtYnk7IG9ubHkgMi8zICh0aGUgZGV2aWNlIHRyZWUgaXRzZWxm
KSBpcyBzdGlsbCBhd2FpdGluZyByZXZpZXcuCgpPbiB0aGUgcGFuZWwgcXVlc3Rpb24gU2FzaGlr
byByYWlzZWQ6IHRoZSBwYW5lbCBub2RlIGlzIGluaGVyaXRlZCBmcm9tIHRoZQpzaGFyZWQgeDEt
YXN1cy12aXZvYm9vay1zMTUuZHRzaSwgYW5kIGRpc3BsYXkgb3V0cHV0IHdvcmtzIGNvcnJlY3Rs
eSBvbgp0aGlzIGhhcmR3YXJlIHdpdGggaXQgKGlHUFUtYWNjZWxlcmF0ZWQgZGVza3RvcCkuIFRo
ZSBleGFjdCBwYW5lbCBtb2RlbCBoYXMKbm90IGJlZW4gaWRlbnRpZmllZCBmcm9tIEVESUQgeWV0
IC0gSSBjYW4gc2VuZCBhIGZvbGxvdy11cCByZWZpbmluZyB0aGUKcGFuZWwgZGVzY3JpcHRpb24g
b25jZSBpdCBpcywgb3IgYWRqdXN0IGl0IGluIHRoaXMgc2VyaWVzIGJlZm9yZWhhbmQgaWYgeW91
CndvdWxkIHByZWZlciB0aGF0IGJlZm9yZSB0aGUgYm9hcmQgaXMgbWVyZ2VkLgoKSXMgdGhlcmUg
YW55dGhpbmcgZWxzZSB5b3Ugd291bGQgbGlrZSBjaGFuZ2VkIGluIDIvMz8KCkJlc3QgcmVnYXJk
cywKRGFuaWVsIENhcnRlcgo=

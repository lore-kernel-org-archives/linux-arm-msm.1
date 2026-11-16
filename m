Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862553;
	b=u/ZL2i021cDWZJYWUd2CNBSBEthPNc9bMGJxzg91booIcJ3+eP7rOzqWS0FSJbEWYOMU
	 LB9NHiRhOsKpI4MoPsXrXMnTdREQUDBjYOpi69rFMuVjidBrmQXMKMDy7q07Sh5ela4pa
	 D+UyCWgAn67xvz0OoBtRTOqOMfhMjWk9zsFzvuwsCBBCuRVsnsZ9tgDqgnU6qS3gPgSw+
	 WHpG1C7Qdjx9fg71FltOTIVDXVd5p49rWIRqsP7ST7PkVxvWGiLcUYICMzuMOmHZaF0jf
	 nFmF0rZM1srlB8xrX2lqXZTgLxGiu2wjXypVdWOg563G52p7rKDcsMDqDCtrdGabh0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
	b=U3ukHpI/pF9XWB2IKe7G5f2x69eJBmESyVsTZy4ktbRLCcZTpD0i7hH+2pw6y0tDHesh
	 Y5w4Cbo6P7KhEkPCpwsvs3FKzDV0yTcdRM4vrRtedfH1BI7uBitzBKBTdYu7p+Tu9WNAf
	 KnNhbak4t8vVBLiCDcTyuWbbVwYtvG3Yfk1ev6sX7Zzex91S2XlbZeFMXxeGk5Mae5nIY
	 wtuORb3cLpUvsftjCmXzdGiQd8KGHLrQ6fnrpNmF5uwnNCHf5PHKAV+w02MW2LffLopqr
	 D3rYpn/5W/OGuzl2loPyyjykgUR9pPERHUvRhyJsLoTyKhmWqTlkDFz5i6/fa/JQdWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA91606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA91606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15766925e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862551; x=1795467351; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=VhXSKqN2KUJdD6k1M2C4NY2RWNQXwLUMa7za0KGRNTAszgCYrmzIrdkvn3YP2iZASp
         Okn2ZahhPIfImI6ASXd9oczijF5PYBuze1NR3SYEI/SPa8igSIUyONqgJjxRqh0fggnD
         OAGgxT6vOcKq4YkYpXZwpRxKF8KioS+AU93pG5/WJab+tK+M7cUEZgQkfGjDBvJjpbMF
         OmGYDullBl6FYriNxEKpo6GxS/Stf/V4L0w1v2A75LXSX9u4WLPkm6a4Bw/IlxWZT1a8
         HseiGkliKx4G1IRTjhBU0w+LnGW8MvAjCoxKhsfkfCtu3fNSWNq8USbBr/UfPKMVXuuQ
         A7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862551; x=1795467351;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=z4OhKeJlYgRz1ov9N8AmVWxrmL1nTTLe1cT4WS2Saj50un5ftWXExImMHsSgskfMTp
         V/ztVy3Gewj8wI52zjEBnmOm0gOZu44HvuSeExswn+MShdllk1KTXWYlKcgXuZKx/sJE
         hSzxHKfzAycbFLU0RwmcFJM0EPv91Z+i6qFT0ATj9nnr9QVlDQbaI+9XnhXGtwtY+3Og
         6HLaA6lgBZuH6hmQOA5KGcP2Q4M+TDZAE800xs25eiMCBDWfNcxtHtbWoORMYavoDILb
         pTsxKB4KJYPNTfaOSb1aH4gLQ8j3z1x329OxdOBDISD4deJv/QbyBnuN78TKNOV6KdX7
         q0cw==
X-Forwarded-Encrypted: i=1; AL+hErGo27Xqikq+nS+ETVr6i/YlWNHXUnmA07nxkY74O7CWkRezfA15peUcv8OFNUqwfrm5ZEI8uQL04yg2CQ4K@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKV0uV8EI7AvEPKJbRWmvdt9cQeS2uvO2DmbXlmM55W/H/QKM
	qUg6BhwaueSa3Ahd6AK1icqTp43NTkEjs7sWFt7YZG+ourkfqzr/SXTq
X-Gm-Gg: AYBFou1XVY8GGj2HNFql0lnay+CMM4Hp0L/HryDyzLiQ4G5ibK9ewNoOD7mCOo5Kx6A
	SJ6Qn5TYwGvASts/UMbbDh3t7PZQ1FK82fiHfw3uggVZbHX2oZottsi7oNdu4IqGIAfCu3pbQro
	Z1JAr2UPh7wjRr0VxnjoKRx7NeRrhQxKsn1dTLTpXdbIMAyLiy4CC3msM87dSAsOQFulR78Xf4q
	bdazdhpa6EZNzBBNtbwvieRA508W9Gsl1OXFF7sEJbZy3QMxtjCC2dL83WXv026rmTyeNPKh7ct
	zeRdTeSHzhL9cvz42np3M4LB2VIcF981sJjeGwjf1d/PH2eSUiHcC02t3jTeTOYgeDkjHFRTeER
	CSJ9hUROsZgYR6I2YKez5ODedY6H1KAaCtuzy5b766tiFzXkfyB90KHLhFEqCm2l+wCEG1PNTjt
	tqjWDL4tYfhUziz2mO/BY3D6XZ/RLZ8rDVVkSNzHm2C01Lczptad6FiydvtT2qK++OcQnr3vp1Z
	l7+dVunACmDjrjkgsvtVtQzUWRN6ECFEqnr3rsV3TQqCBrRG9PMz4OS
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr258682125e9.32.1794862551105;
        Mon, 16 Nov 2026 12:55:51 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:50 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:50 -0800 (PST)
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
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
In-Reply-To: <6fc5be59b56e42728e33595d5415441f@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvc291bmR3
aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9x
Y29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggYzMxZDkyMWY2NzkuLjJjZjJh
OGEyYmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysrIGIvZHJpdmVy
cy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3RhdGljIGlycXJldHVybl90
IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJdTMyIGk7CiAJ
aW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKSkKKwkJ
cmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3RybC0+cmVnX2xheW91
dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRyX3N0cyk7CkBAIC0x
Njc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQljbGtfcHJlcGFyZV9l
bmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGsp
OworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5hYmxlIGlmYWNlIGNs
b2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYgPSBkZXY7CiAJZGV2
X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3ICsxODA2LDkgQEAgc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2lycSk7CiAJfQogCi0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJaWYgKGN0cmwtPmNsb2Nr
X3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVy
YXRpb24pOwotLSAKMi41NS4wCg==

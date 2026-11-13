Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603782;
	b=wneVmBxuDz/7dgipkJKnzb70rXeXf74sP8LHOBAppBxIj0ZlJyXqmpb+/2mEcJguIdrQ
	 3e1zAq6H7IFzz4WciKLSX+89N5aKX107a0Jr2V6OUIuXCd5zzFmwsxG2oalBNL7WWSyq4
	 LnP3SxRZivBIHosw6PnxFLVhGoQtw0RQQ/tOvDqW6BcZv9Y49t4zwAZl5cteePnRMdn+2
	 EMGOiAHgYNufzuOpPtBp6iZyJCPrk5exUVQ/sUXsx5kxb0a0zGJUa7l52T3uAESsgJUBZ
	 FUQBhxin7pZ7vgJXXzpkGhEsTPvgyMcgt6CqzRY24iEfHvy3+btWOJ7/zsyw0zDjv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
	b=YQUT9aHic7XF1XI19sByq3lLk24KswxGsoUmroS6mDFYX3MMFIyjFLGwynHhR1zYsaAc
	 HejypMn8O1DJ1o9lM8XSZ2hfv67sVtyvbbTGaAUcGr3NNIqfMZVX2/lUmGHRG/z/vRXYX
	 bzkDDHjw9qSJPlV8dWXm50yvzgeUUtH2QuUoev1SlSBaKO3QdnJ+2QpjrnjDLnIjCwywe
	 ROLkh9dVxamhfyMKTEtY9p+anFp399vhNYHCE1fqW+4hcrKk9yP2aV8JhjcLcpO2s7pxN
	 rDOuhQssxsImULbJLSFDQMZPOPmwWrw/hUkOvxbJMtc1pfR+723VPol8uUIhicPJTsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4AB606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4AB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so6426105e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603780; x=1795208580; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=CHLACVWhovnsNiZdUJHI0G3UixV34Vj/LecHfz/DFEkccalsYUW3udTSzkysCOGL1b
         aDqILnh4yZF59Gy3/31VIkG/DkCRlPI6iuNa3m9Me9GUazkGC3JEKcBAsqH5XWnZt+QO
         oFn/p0TQpQxOcESlUjguSqrsQP99L0DpeWO2UgyV9wb3LuQF+UrrTIgYAoVwcHmdZMjW
         h2oOo1blRZdaUOf0Bf3p5EVNpebP3WSOOrD0jZCUQk5DCGsvzItGoOJS8k9yGgbyUAq3
         PIQX4Q/zT8wZtnkDKIaJvCRm0fifsBFShIovQqDY2okGec1NyQ5uZ1F+HMyORVto6fOE
         GzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603780; x=1795208580;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=TI4vqY2Sd6Wlh7s/oDRueHYoj89KINWvkag28OP8gbARoj9d8mM4Mm55/47N5GdFkp
         EIQupEGgqmoUVJqfGNfdGSPMqXbrIxb+9680nOhrQBH7B17ampr2pSOunWUrh3yxPlwU
         QVQhz4d0xlOmvRF30jixU4K5K+QRKsfBTwua6Yq4Vf4WGepMgTCORcTv61t4uuGr30WG
         s7Hq5rkIY+RAiCc8O9+bpf0i409umZTkxTp30YUyIDhfqVOE83kqCvCYm6L+OeMA0rzO
         K9YnB0BnmiYMx/gmtKKkg3BiUSuFxbGwDOLQiseCQlsUHTovPWyyiCXZC+CODHUE9Lnh
         N2jA==
X-Forwarded-Encrypted: i=1; AL+hErFY2fp0AQojJRECUDZN1pZ5SOCRjhXgn8eDpbzeu+voamCjAdXlgGafuVnQOvC6krOFwPxh0g4sHVImDFpd@vger.kernel.org
X-Gm-Message-State: APuU4Z9MVsI6KknO479zupW7ZeN6wdDddeV8E4F7jINDsPAf4qEvOF8e
	1O/W83U8XBeGHKp/GYJUM9l7N23l+pbZOHu0i6N0DgpSkviyYLOIyxwB
X-Gm-Gg: AYBFou3REnJnh5gW3n6qdnK/eeeXUun13Lqx6fuEdpGYCdYIUr+SUrd7Xl+4aUHy0qu
	JkMvRFDQSoIu6LoxKalu+ux5jTqVE8dS02h65oS1F6cdHqtkMNDttMbr+l8b8vLtG/k3BpDW0+Q
	itRrh8iJHqoJvgwdMJyEVqwp/TN6/+SVhlu6jQXtpcbesqFCAN0eeWRzU0jW2JroqxWQk9erlnt
	AFvRRRZyifWL1jPgmOQYKuTnViWdLoUeH6rVDd1n2d1c3QvDOyuBUSkCHiNPwC9idstJF+YDuHw
	w7+vQnc2Xgm+wa25dK0cz7zN8TnJH2SJr2d0XbnQap0HwxLNzSMux0VJZlkE8pyW00KlcqfU+Sc
	sS+DPloXG4qdZnmKkDlQm7ekTALglhop5fCnkkVROBxqe0kOyKWKYzF6u6FV0L7b7s4QfGVU9wD
	RB1ZpXCzRdDJq0HBKz+2DlwpvYmaYCU0TuLMjKejVsjnAB/Ph2wnPKK+FmzxpeZLNc1BwWrydJ+
	li5uDgnfIXOqQ/uSaC6n33JiMZ92Fdr/en2JjdHiyAfH50ZOBx7
X-Received: by 2002:a05:600c:628c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb55a7f885mr75593975e9.31.1794603780470;
        Fri, 13 Nov 2026 13:03:00 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:58 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:58 -0800 (PST)
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
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v3 4/4] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciwgaW4gcHJvYmUgYW5kIGluIHRoZQpydW50aW1lIHJlc3VtZSBwYXRoLCByZS1l
bmFibGluZyB0aGUgd2FrZSBJUlEgb24gdGhlIHJlc3VtZSBlcnJvcgpwYXRoLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIENhcnRlciA8eWFzczI3MTA2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNDczNDQ5ZGJk
ZmEuLmM0NGJjZDBmMGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysr
IGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03OTksNyArNzk5LDkgQEAgc3RhdGljIGly
cXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJ
dTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBh
cmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5o
Y2xrKSkKKwkJcmV0dXJuIElSUV9IQU5ETEVEOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3Ry
bC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRy
X3N0cyk7CkBAIC0xNjk2LDcgKzE2OTgsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQlj
bGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5h
YmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYg
PSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgyMSw3ICsx
ODI3LDE0IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9pcnEp
OwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkgeworCQlpZiAoY3RybC0+d2FrZV9p
cnEgPiAwKSB7CisJCQlpZiAoaXJxZF9pcnFfZGlzYWJsZWQoaXJxX2dldF9pcnFfZGF0YShjdHJs
LT53YWtlX2lycSkpKQorCQkJCWVuYWJsZV9pcnEoY3RybC0+d2FrZV9pcnEpOworCQl9CisJCXJl
dHVybiByZXQ7CisJfQogCiAJaWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewog
CQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==

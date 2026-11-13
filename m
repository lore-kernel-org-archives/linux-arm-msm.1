Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576268;
	b=vzeuBXrmcPE6r718H5NKylqBmrjnA7+WUOohB9C2jaHWCCfsJllAAiZxaQTVPuBUYy0C
	 Mps3FZJUXll8iw2z9sTR0mAdI7FBfbNwoQhW5P5GdIyp22q998juBa8wOHt9+bXxJLuUl
	 N+TQzlADWWN9GV9zWdThrX5EDC2rdInOTu44daUaJzBcdTgcRz4xplAR4c1lS35zP2yCx
	 xKlWbRpvehtiKuG6Co4VjY7cKAgSWkTOxaSrzp36QP0Jup+3F9+wG3BQBETc0CnIDjbt0
	 61Q7PztsuG05CX4nnS21+TBTzRFL0lDafPr/Wj88YBIyiKBUdWj0ILA+WXUMf71tTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:Content-Disposition:To:
	 Cc;
	bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
	b=zSMtPnIleuisLUwxQyyguV8/rn+mEb91WfEVDSbl7QambeDuEWrtdrPsxgmMqrevlhDv
	 R4hYMuRalVFXrkOSGfVSzFTQvRJcDq5EszsUdZgfyuBhP4KirMdAD+tlMyTA/yKJd+LlT
	 /T7mllJ98lX2DQx/KNfeHOTRpNdiYgQOKtoWUY/y5jc0zpM7oBaOJhCztAGJYKGJzeTxc
	 5PlkbOTa7WUWh8c6nki1LX/ImZrk2UUDu0RHgnVl1xG+jgMPoAdySePcNJePJJznmboBm
	 WjpIdsrFE6oxvji0WoMbO8nniNJH66tsaT3Ir4g9dn4DC5Tpis6TQ5Cda24uG9PT9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk;
	arc=none smtp.remote-ip=74.125.225.74
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A2606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9A2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48ded18b8d9so146052f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576265; x=1795181065; darn=vger.kernel.org;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=MXsmNfMkwmrtzH5QjA2Wxfle+/oOPLkWAIi6ePOk/jbUkUf8919leGBOnEaDEKyqUF
         63XyT4w2k54VUgxbkgF87CmSk4kBwa7mGWNgsu37iC7SdvqLPNVm148QmlA/lVLyZLBk
         5ecd6w/ciPaYgxpW3VU6mRTOSwEyripecZW++PkhfXPQouAY6vUlLpy3dZII/WgBSyzV
         MLuqoZNff+l8SDfNOvkSsOZrU49UGiTb3RhlWr2Sk/7LBh00bwFjWInjB3OjyetRvrY3
         u3yhSqV1yi/w+7jrqSo9Ia7xHTRR94OM3faplZg9BwBuaCaY8sbI3VFyaudztnDV1b/j
         EW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576265; x=1795181065;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=Uaw17iUx13mUXJFTrlB6BnaA5DkeM/cYHMzWEEhbGGYqJkuZ+3ABbVz7fCyHo/e2+O
         H0ylPaQsx2wtmLH8pNSrX2nvTkoeT5ogUQQUgr2wfhFGOyaFN+tl6wSlTAZ38SApnhym
         GQPaxb0ayWtrdFIY9vIWr8OCmNNxwm/2/F9l/Q2GaPwORVkZHClQ/d38UEIhy5xFRKTu
         tEdWry0U18emIl17ePmLHEOYXS8io9XtICeRpHUlhTv7Cy4gjLeF0M5GfQvGg3q1tNUl
         vPfG8OC3pS/cXj4lddxW3OXzp1X1RTX0p6otnNoLdfDDSNiHlV6XPt8pJITUDaBQXDXT
         gGZw==
X-Forwarded-Encrypted: i=1; AL+hErHY9cwEHTZU8S0bEbh3EY4iUlXOt1TRh2LrWP3A9NfhLK4VLRqtZ9fQKACJZu3GYjSJe1tKemvCOb3ZmUSk@vger.kernel.org
X-Gm-Message-State: APuU4Z9epk+LoUV6DJ1hfQ/dohIp6cE/5FCa6TpkAi7gDerTOHo6cjK9
	hBR+IDTkTBpPMceyxwVyG39iMktyRB/8SwIDAPjTq6xk37VPST6zcLbn
X-Gm-Gg: AYBFou2VdUszyA7zWcnFJN2/SK8m+TC58CBzGjV5wW3Z59bICIuUt4KAljeAHy2Ca2v
	nSO2+XwqQWNl373SH94GO30NsvlsatX3N1q2hHgiKm8WpoNidCdDbARkqVb1Hxubq2JtYsD6iDl
	u0I7nJuqIag3YDXT87N6CboGoofnhAB2TxU3c+Yck1V7ppWBjOaxtX1bSt7obmqJeAn8+LF2zdF
	+AUpuNblDL6maIQM2kYKIAvs7skpAS2IKa5FfewrQUwyqn9fi+cMTLMeO9fBbIVPgrZ6sAFYTyW
	Egayi97hSZ7/OmE/2Bj1gXZQ3eQHGE9bWQqRA1uM6M6YpW5Ce3A2rByKJGLGjWsA9UaDvZEN6IG
	QshsAYXDiHLTcRFiYkt6FyBW9NUG4pskAQPwOLAJS+hLZ0po41iZSOsBCujKpVzmQjsZt9baPle
	S7a1vQxBm/H8a+gYA/KC++vHzoKKH8vNXOnU0kPGoSLhZRkayFa+krh8sSEYea+wB2a+kIjkGos
	cFWWLolzP0jbcDW/dJ67QZA2m6uM6+2sPNIFwHVR8m8/QcQxy3IpSv6DVCT9jtI1GjsXKpR1DCF
	7HdrjF8apIKCwfF1CDjEmkW50hvP6g==
X-Received: by 2002:a05:6000:161d:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-49c74d2daa2mr4041400f8f.55.1794576265256;
        Fri, 13 Nov 2026 05:24:25 -0800 (PST)
Received: from [127.0.1.1] ([196.237.238.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm5377498f8f.52.2026.11.13.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:24 -0800 (PST)
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
From: yass27106 <yass27106@gmail.com>
Subject: [PATCH 0/2] qcom: add Asus Vivobook 16 X1607QA DT + LPASS audio clock
 retry
Date: Fri, 13 Nov 2026 13:24:21 -0000
Message-ID: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
X-Mailer: git-send-email 2.45
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
To: andersson@kernel.org, broonie@kernel.org, srini@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com

SGksCgpUd28gcGF0Y2hlcyBhZ2FpbnN0IHY3LjQtcmMxIChhbHNvIHNlbnQgYXMgcHVsbCByZXF1
ZXN0IDE0MzkgdG8KcXVhbGNvbW0tbGludXgva2VybmVsLCBhbmQgdG8gdGhlIFVidW50dSBrZXJu
ZWwgdGVhbSk6CgpbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUg
Zm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQogIEluaXRpYWwgRFQgZm9yIHRoaXMgU25hcGRy
YWdvbiBYIFgxUC00Mi0xMDAgKHB1cndhKSBsYXB0b3AsIGluY2x1ZGluZwogIHNvdW5kIG5vZGVz
IChXU0E4ODQ1IHNwZWFrZXJzLCBXQ0Q5Mzh4IGNvZGVjIHZpYSBTb3VuZFdpcmUpLgoKW1BBVENI
IDIvMl0gQVNvQzogcWNvbTogbHBhc3MgbWFjcm8gLyBzb3VuZHdpcmU6IHJldHJ5IGRlZmVycmVk
IGNsb2NrIGFjcXVpc2l0aW9uCiAgVGhlIExQQVNTIFdTQS9SWC9UWC9WQSBtYWNybyBhbmQgUXVh
bGNvbW0gU291bmRXaXJlIGRyaXZlcnMgcmVxdWVzdAogIGNsb2NrcyB3aG9zZSBwcm92aWRlcnMg
KHZhLW1hY3JvIGZzZ2VuLCBxNnBybSBjbG9jayBjb250cm9sbGVyIHVuZGVyCiAgdGhlIEFEU1Ag
R1BSIHNlcnZpY2UpIGNhbiByZWdpc3RlciBhZnRlciB0aGUgY29uc3VtZXJzIHByb2JlLgogIENs
b2NrLXByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCB0cmlnZ2VyIGRlZmVycmVkLXByb2Jl
IHJldHJpZXMsCiAgc28gY29uc3VtZXJzIHN0YXkgZGVmZXJyZWQgaW5kZWZpbml0ZWx5LiBBZGRz
IGEgYm91bmRlZCByZXRyeQogICg2MCB4IDUwMCBtcykgYXJvdW5kIHRoZSBkZXZtX2Nsa19nZXQg
Y2FsbHMgaW4gdGhlc2UgZHJpdmVycy4KCkJvdGggcGFzcyBzY3JpcHRzL2NoZWNrcGF0Y2gucGwg
d2l0aCBubyBlcnJvcnM7IHRoZSBEVEIgYnVpbGRzIGNsZWFubHkuClRoZSBEVCBhZGRpdGlvbiBp
cyBmb3IgdGhlIHY3LjUgbWVyZ2Ugd2luZG93OyBwYXRjaCAyIGlzIGEgZml4IHRoYXQgY291bGQK
Z28gaW50byB2Ny40LXJjIGlmIHRoZSBtYWludGFpbmVycyBzZWUgZml0LgoKU2lnbmVkLW9mZi1i
eTogeWFzczI3MTA2LWh1ZSA8eWFzczI3MTA2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4K

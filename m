Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603762;
	b=DR1krWb4bxQ6VK6h9J64H4OeLOpOKTMSMf9gHzbFISBTKF7Iv9AA8wHrPndj628QztQB
	 i6HvJ1otdpcoUzqHpXxNCSmLvySgGUQh70fyHdYbY87zi2IaXNlD2PTEsGjnWegmIbkU0
	 6JJJv2HthDAQQvjc5k/Cq3K7e04Ejb/iyYhyzYC6sDc9Tq2m1HAU3Vt82TwJS77+45/aG
	 JC78jAgnFO/i6cEEe0dAdLfWYza2Tt+J+qDEXBFCmklahAmYT3jkq6ZTlAMVb8I77/Wpx
	 lYtenL8C7FQzoNzZ/PD62eh6PpaYkhInQdVzRq+80TpL5A4GPWHhFoQ0zWpz9mci1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
	b=YQoy7A+KxGWTP1SlmEMA0eP+zIP9MsuhnSsUK8RaS1KdT406ANCm7e7v2hpHmPhbxWdU
	 nGwil8gWWLmOCa6nH3e9oGCrO4zplE31W2E0hRJJKJe1z+HJ+45iu5oTvthghYO1y9tXM
	 Lwbq6Lm76fP0IiXFT2n1miFBEOmjhJmSZtVrXOrUpA/XNoEyRu7hmo8KX/MivTXwf+q+4
	 jYC0iztXPwet58p4kg6SF+1JkrAfQekGOxzqgdX1wj1mn9FqgwT0atIvklA2VTBQO/VMK
	 Fp9L/t3sHPL6xLKEcfnIC3GtKSjss9WKhUbm4RixcD8LnkTdIdt7X/6cd8DiC69aMLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B6606A88E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2B6606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso2434245e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603760; x=1795208560; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=vhNWPkFDUTrf2CnKOWMgYdIWu2o0nTf/e4Pu1EMpPy+H20XWePJ5nudOwmGMKSlrpi
         xwuhBQVNPouq9VItlLs2XhVtJ7CE4XkjjcJ4GtkBi4O1eFX3JiW0DW1+HoQnoRIRLJiW
         dMlm7pVZR55ZO8iQmlKB50fDcuqZfHokMfUUZzY0TlI+h0gNLO1gLJV0goXZVzg3VtUN
         UYj1RXXhaxzNt5yibTMUm5pQ9xeI3uqvh09oQx7nEatKSJmSjwrEP7xhN/y3EVRWZCOj
         xiEW+tGGXSmWEtpk6kE0awccANgaaAs8Nfqf/Bz2U/Cv509PgCVebIBieyT/KMD53iYA
         GEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603760; x=1795208560;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=Awr32w34K0MmjxPCkAr+wqb2C1+e9uC75uOIluVBcdqT12Lj3/PJgxmLvx+2O6iCBk
         mSrDJpNZfEb3y72yYOOlU91/XtGZyqy97hy43UniSJ7oZGQz95AGR+oBgoWBcJ1BgtLm
         ykchDBdkTnCqt5pIL9jwIXxTiypuyjhS22vSaSdsZ5ywPPH7l9Hg8NDN4UZjbN7UkLla
         yEgfAO2LH2I4i0WHm+1C9nYCzNOCQAQS0YrLZYmVLw5G/ZeCtkXlO8sZDMxksvFpsqOf
         DBIDo/6k2LeSbj02IHq+4Zbx4sRxM9dCUFk8HmzYuHXQYUk6uJX01z+suKq7Wbo0KK1E
         vQ7A==
X-Forwarded-Encrypted: i=1; AL+hErHgwsjbpqhnoTupsZUobbv+hzI8+A5gS6azlY5oVTPkLEh+UB4vOCWnM6Ds25Jx8H0nEOl8uTEV5T/CHNEn@vger.kernel.org
X-Gm-Message-State: APuU4Z/++JGlWb/iD/0ArCQzbA8YvPr3v5ER/7CXoY5hpdifFM/9wfq8
	le3TpjII+IcmHJMm7HjE2RtL0lEfVQ/xTgivtX7bQP/5mqP7n4eaiEpf
X-Gm-Gg: AYBFou0teilAibZnN+y3pGG2WbpY9Hnc1bAGRG5lDPCkK3NKHhoql6PTETCL4+hfHhj
	W0769fPBiOPFC70vj1U4fo4Vt15bZ9zTqgi0BPi67VSbCxC05I1jzxcfJVVqLOogysMC6gMPzbK
	kgSpE5yN3bX8cfSWNsH+avnBeQyfuL52Dkr/JXDbZvGYzmj7lxpKMgf6gf41PlLjfW8fDrFuhTL
	/+qWt5SeMJ5iQvu/62zLbLjDFZqT5G7R81E/DJaZyVGo3tXAl5tquO/Od4z/qNQtPyMuvqVByGX
	wkxFCp6dMjdoHRXuOUBdB4j7BSm8hXdtCt/MINJKJ4jdqr5Ez3d5iXh2dsIvHihnNQS0R1FNsrN
	NKaLa3FgDga/XTZ7GAbuzN/WCGY+XitfQsjZWDRb0k33KD0IaZNz0DBjHVD1DZBprsX4sq512N3
	qN7aeg0ALf/k3b6z/o4ZA4IDB5QOTr8xcT0c1Ew8txSwxdrQhwoyPBWzGfMpguC/TuktJSg1w+5
	Q3BDvoy1D/ut9LWeZZpEt9aJhyy6jZdyCZKuAn3qQu67jV1Ymblg3rsjUUhfR+ICVKlVi+OZw==
X-Received: by 2002:a05:600c:a318:b0:4bb:5f4a:db62 with SMTP id 5b1f17b1804b1-4bb5f4adc6dmr22065715e9.14.1794603760103;
        Fri, 13 Nov 2026 13:02:40 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:39 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
In-Reply-To: <0a29235e23b24698adc59fd117e0a222@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKHB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==

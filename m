Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602023;
	b=OCWeyAtbuHWYGgeIbCqcFoMUp+BynkVAQ7CNz+bWKQLQmhlfD/uSRv2Ly9tN77Tcc875
	 7gc3FyNH0ouETP5HKiU/AeBq2wyziacguAlPpxT2mZPjvayVAmmuIF5hrX4fYkyvoKWzM
	 y7pGG2KU7pWwjx2gg6d1y7g+TUmOQ+xT/OgG3bsYkjDnBriq6jigrIieiIeFqDjXp9Zpp
	 p9U9tf/DIGZ2pcHfPyrpLmgmZj36ChOZTClzbgtzarBfb/MnPVvDfDTNohV05bhRQP8G8
	 kziQZepiPsMRGDsGJLx50cLYDwoCJvipZmNkoUmV2XBUXGM7YQKVr2R4nPZAsOruEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
	b=mJOiogLVdh+Jq21teE49niPxs9CSI/pW8kMzOx4Pg/+KJmhSMSk4hoZauVYtSM9Hf9Ps
	 54uqEwNxDI2VAz9bZg3vMWel54OPGpUVePud/cH0uadLh4f1+h7BGNa8Al4fztb8EbSQL
	 5E5wE8zXcLyEIvNNx1H19GrB5EuWZ00ddM7o+1JmldbY0JsSUBeGH63RqZ569HYQD9rSH
	 gThGR8pysvokoeRMedQJu9qVdYQQ5DQVto1nYfU963gUWA7A31whqlfQl91HPeUfZXJuO
	 VSNXht3HXP291zHaxzbw8PqQ5j9V/9f54OeTJN0dnbriV283INKI6rLFsMeOubaVYUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KaTGq/QM";
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DB606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KaTGq/QM
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a21339d376so701145e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602021; x=1795206821; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=KaTGq/QMfrG+ztyqqp3U0jtvWTe7IwQIm0sWiGKq5xEqdbcADVGHsW1K3+5l1JwC5K
         uHSztfhTvNp2vKDKp1bxlN/IMin5/WBE6tfJZk8LKSCHgdM8Ai+rVF54UIO6sInKx835
         WimUBInSnkClOn1EXHV+7yIlbF5GLHQ+e2+EEYb/DOZ+JDG0Bqj7Asy1GrNc9nQwrISX
         IZj93ZttSaYcOGwhZJEvqWteyXrl5KZV6pXCrypVtNiGxHZwjY2ANL1xGDMmxM4ddPOj
         dfBedUknCHSsgYG7EnWtvWZJc9ZD3MFaKygDW6xz6gUAvkoirnq+uCQQZmEo0KXCYbV0
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602021; x=1795206821;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=qKDdVa1pQfRfXg3ceoQKYpyQ6zNwkK+z/t2pTcwdMUtkJkyWOdJSNTxtUYEp+hUq3Y
         CznjuQCnssoJYYdukWNZupXTH0LjthAIKLnIMyikEaFlZx/V8P66qMGE5sBBCJ4t/s9j
         rZkMeHvoKmayNQtZqL9aAwAdC4JYviwZEoBf9+PTye6JY7S1Jf+bd4zUr6nnOMVVyoLF
         8L32kbZnMhmiLZ4EReCeVjyp8zx6Q1IxiDTjmbQ+nDnOXVWmPuNpSi4m3diyngetQLJP
         zRpxN+Nm16X7svb4MUaepdQdlKLj37JBY4rsVbkntIGi2cN7iB9F0cFpSFRXM4jfs49b
         Ft6w==
X-Forwarded-Encrypted: i=1; AL+hErGqnn8YFZS4ppZcJ8MqRBPS94ijJ2MXiChusO8oYBTc8Qw+WwPBG3UoUvvP2PjS3JlgOwONq9NHhsDO8cVN@vger.kernel.org
X-Gm-Message-State: APuU4Z/xtf+wqYTNIiqwfD7du42Pk57blzXXey4bl2Mao2IMhTi5Y6HQ
	odhG/Y9OQHYLB55eATxiWdavvumihS4mUK2Wxfy5zdlsdwzB7Ta3o70d
X-Gm-Gg: AYBFou2Ynva5pdZPrpRFLJ53F3kz4tWG6qMEPN79XaAnISmohXgX1BZc+M4VdRi50gP
	rfU5SJPqcYFQiSQo1y4l6l379MHnOKz4yGg+F7lX2hosM+EpmR14rnboMnv2Ceepkvx6cWfwVvU
	2/AZkJRFtLd/175OzYLaTRI3pl78acsDbKQd4VMwmtcAjrqlNuT+4fCxZFY1uO8lS/VCFN8y6yQ
	nVJ4AZ7dcjHznAO4pieCPaafY7Ov6brR1sahsmXwQWjSdcFCkgzrc3U0IDJE1W8ixvpKdCl2la3
	1M9I90cFisjENUSRRbjXBwNPFqACspaZ0rJqY6lvoXcxbUTLZ/ToesNy+K02YYLJv0+r3QKD3ur
	5AZq0Tl8Ee35sQuR17WZvK7iyJ1bjadri826JBIEcxVqws+UffXGeXtOOT/yalMUpjLbe0gSa/e
	kflUziCe0UTmm3OIpjwisTwSWAz9C6RdR5XsAk7hP6n0rSp5WC1crlPHi9SMdI9TAP6VstAmlK5
	lghBf0d8Qb6rUQhvo5RQowmo96XZNuD2Wfg3e9odrOfUxeX2zLU
X-Received: by 2002:a05:600c:34d6:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb5599801dmr79325435e9.0.1794602021647;
        Fri, 13 Nov 2026 12:33:41 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:40 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:40 -0800 (PST)
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
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKaW5kZXggMTIxY2E1NTdjZTEuLmQyMmYxYjBiNGVm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFt
bApAQCAtMTMwNiw2ICsxMzA2LDcgQEAgcHJvcGVydGllczoKIAogICAgICAgLSBpdGVtczoKICAg
ICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay0xNi14MTYwN3Fh
CiAgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay1zMTUteDFwNAogICAgICAgICAgICAgICAt
IGhwLG9tbmlib29rLXgxNC1mZTEKICAgICAgICAgICAgICAgLSBsZW5vdm8sdGhpbmtib29rLTE2
Ci0tIAoyLjU1LjAK

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602017;
	b=dyOJxXItQhbmKZcFjKK8gKiSNwB4XZteVM2HG9wWk6ofy0YkRJx32kBZvO6osjAj3juv
	 6UlNdaa8vY3d/iqt9kpZs1vr+45harId7qbrSuyZv35nOCqJKVwlhvh/WOHq9sziS84eG
	 5ul/PVrzdzfELcCDe97PiyiiVySFXXji4Ab3Ri8PusNRkd2IXtr/ks/etKpb71voL/e26
	 t4Ub7rBeH28v4sP8R7Op5ObrsjBx9bQbemZcFwwhKIA5MbJoUtY/tYsqYdsDZc69kt6wT
	 vQUlxnmojn/dM7U/bar7j1P8rxQNWGF2FT3psR/Zwk9qh4nPXW5jBOeI2CqAuMpAPOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
	b=ShIZnrGMb3pL8dBW9l8CDLX9Iux9ZscV13FhokYyGLJRwfq+z7AU/ys1yB29+NSC9KPk
	 JMcyoy3xzIrbPi57ISx612txh4V9Oyb5ceMzykC4LNXmwWcabNDohxfyusAst0BJjoPGa
	 Pr85cf8FCFfZozw7wrZ8VWjaYIz6DpkYk5g0oJWPTa+igfHH54rrpBl4aOkWtKs+bZNmi
	 6JZxwCZNDXcxiQN1Sbe3Clo3uJNMohzAt/9MF0HM+3+ZiUC7bswHZgKBOTcT1Wx7JSsMl
	 MRFCDEl/qqpLp8C7PTIwoTP6PTbeQ83TzUy2t9qwsJiFFg4cqRzdPO+2qhKZMe4J5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313A606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2313A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so19428895e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602015; x=1795206815; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=wSY5bQ6mHQtE7OEqfQyqajUidx6WmK8z/6DgbSY4eXxeMaI2cn/UEYpePyM6Dka2jV
         6jGyEtVtq4E+truNrt7G16Tso1F+brW6nQ6kzxtDVypoYSx5Sq2l13+8p2v5xWBj6B77
         ux6letY3KZbzw0JyToVj6Jofc9E164wVGVQhHkwlbp7e2w9iqbhQGeWYIUonXe/PUq/y
         xz5Nv+4VJewgv8F0A+TgTEmH5jweg4iZyDhbagMHF1uL1W27oa+/eaqGxJuos3mjBo3c
         nxq/dXf75zueN++GoRfXIu43thk85yIou8Xtl/GzocW2Pu2WUNse720dwfcS6dJswdae
         CaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602015; x=1795206815;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=NhIWZE4ImZ9sPnu54EGxsS2tOlQq9S+hrIOMqqUhSedfVCPNxwkvaRMogr4TZ5LVmE
         E0J9pq0GGoKLdlwV/NeL9qSqDgBtd+FvizSCeC0hdx6p1vWda2lP817pRdHBo5U0RxQZ
         NM0HLE8gagPeJEmrbPwN+NzE/YvsIqqC+zNzU07Ahfe2xQJpdTqw1/LJba8aqna96t9+
         21VPDPNd7izcf/tWrd6UM4Dw4iCUMK7hMdsyTQ0Sh3JIC1jJqRzIX5QN4Uh9YxoEH27a
         I49Mh4bdhnwGGsvjYFe1i/hwAgcH7m2mNrGCCqOooENcMVJICHEb9eK167xm8/l5tKot
         OZYQ==
X-Forwarded-Encrypted: i=1; AL+hErGYt9T8/4YIdxY6yLR2oFQi/9x5RmyBvBPcFPovYZiUquRFiK2eiAcv8Hb1uzTQyN3oIcqy1dhct6uw6rx9@vger.kernel.org
X-Gm-Message-State: APuU4Z+n7cy6rnJJvMqeRK0uU/yb/ocAt6GFItZJ92F3OKgCENoUyutO
	55nzZq2NnMhDJQAOWWPevzwObHudvccs5XMabTllQM9rUKGCUHK5bRw/
X-Gm-Gg: AYBFou1+eKW9DCbgsH1grLAYAnJISSKBIl+4q3ocWGj1+2mmSwVFjoaQIB1HqXfP2Bj
	ApHZ7xSxCn1WQ3GlDhF8asP3xRryldkqhe6Dm1V6mMm1dAj88YX9A8uNofW6QT14Ipqp9TiMYMx
	UQF+hlM/r/O/q3izF7mVwTyzgJH6RLDVoGRej9x8kyqReIO/jcR7UoeZopxnxaLORCc7nF2YM8N
	BHBcUtqRQ5jIIJaCClT8W0IAujebzmQGAZRVePYjocowY9cMo233OdZj59x+PQ7XoA/IMBwBo8Z
	kKPAu913hr/XbtPmXf66dxig9YKA+Nv8JGB9QURNOtCvM2r/szX+DzciL8tyqosX0mGJ6aj3nLT
	i0D0y9VrMgikP9xXpuTfAPC+g3h3HzofS4FFEod7p93yimjxdSYw40o6MQO2rPpskZUjiNn1T39
	fTf7FbTH9KivaVyiyhfbqgpfFRR2sulU88Jl3ccJyXio9pe79phR0Cc0TfCEcWhzsbHt0tbJcgO
	dHRtQQMjLWaXkzzskcasT7zO+uhEWbXcg9MdiRCS7UIVmp4JB4O
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr55295145e9.23.1794602015435;
        Fri, 13 Nov 2026 12:33:35 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:34 -0800 (PST)
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
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/2=5D_arm64=3A_dts=3A_qcom=3A_add_device_?=
 =?utf-8?q?tree_for_Asus_Vivobook_16_X1607QA_=E2=80=94_v2_series?=
Message-ID: <9032798812284dd2842cbf003c75cc0b@gmail.com>
In-Reply-To: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
References: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MiBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHlvdXIg
cmV2aWV3IG9mIHYxOgoKLSBUaGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGlzIG5vdyBhIHNlcGFy
YXRlIHBhdGNoIChkdC1iaW5kaW5ncyBmaXJzdCksCiAgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuCi0gVGhlIGJv
YXJkIGNvbXBhdGlibGUgJ2FzdXMsdml2b2Jvb2stMTYteDE2MDdxYScgaXMgZG9jdW1lbnRlZCBp
bgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sLgotIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCBwYXNzZXMgd2l0aCBubyBlcnJvcnMgb24gYWxsIHBhdGNoZXM7
IC0tc3RyaWN0CiAgbGVhdmVzIG9ubHkgdGhlIE1BSU5UQUlORVJTIG5vdGUgb24gdGhlIG5ldy1m
aWxlIHBhdGNoLgotIFRoZSBEQ08gc2lnbi1vZmYgaXMgbm93IGEgcmVhbC1uYW1lIHNpZ24tb2Zm
OyBhcG9sb2dpZXMgZm9yIHRoZQogIHBzZXVkb255bW91cyB2MS4KClNlcmllczoKWzEvM10gZHQt
YmluZGluZ3M6IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpbMi8zXSBh
cm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2
MDdRQQpbMy8zXSBBU29DOiBxY29tOiBscGFzcyBtYWNybyAvIHNvdW5kd2lyZTogcmV0cnkgZGVm
ZXJyZWQgY2xvY2sgYWNxdWlzaXRpb24KCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQzOSBh
dCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFuaWVs
IENhcnRlcgo=

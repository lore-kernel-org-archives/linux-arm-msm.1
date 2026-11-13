Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604655;
	b=pyUrODy2htjBF3Dcg64DagzKiCN2te+mX4wzdvQZYp8PSOo1wrkj3AxsQrUKW1l9BVZz
	 +JJ8eLc+nyUx/DedaI0Mz3uPMW1D1S/HSHEVxjXuZ5ycDjrTUSEM4OYxeIKzeyayz/0Ld
	 9YNrSrykNvXx+nd05tuFCEjmKy9r67wZ0xBrWCzLzqf3h1J/8jqxCDqp1huJtrw8aUZGw
	 i6iwEWLR93gwGV1Apm2v4EnFC2lVlErWjlNpHrdQASW96VLi2jcmS1G8ZeWqfrTuPK3N1
	 PuIsC9ZwggE6Ghmu8rcAP0HrsaJpBiXJxTCQb8yOfmfkzyIR8M2bJQENHnuyBZZEPFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
	b=zDsiM4uBvarl23YjZuBXSkQIAzvh70vnPGcJ/418wjLrHU66jCOgRRJ+moHVJprPP3r6
	 o/4wvpr4vPHMCHgm9R4vJyilPZTp5l1QB1M4r2XgMIo+VlvV+9yTVNFlHbOOsx4uHytKk
	 zzQvUpI4TwjTuq1e//aNKmdNlYJfZ3dgv2sNz96nO1tIFaya7S7M0t7aF0zhWxHuQDTFG
	 O7w+t5fH3Vr2ud2D6TrNtSjGC61WXUccuMc76hR8PFRm2i2PP3Au8hpaky5cCQn8d6PfR
	 5KO5wXqX3Z+9rW62bzz1l/+AO3LK360njRwfn4gLCxzEivcBZucCvH3wCUSfsnh+7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23733606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23733606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4ad5d6045d4so6022425e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604653; x=1795209453; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=O2WBBlH+sEuEaGq8nMhpEC31wLP5cHyACfvnWFyo+t8kE7jALCAQIcPTk/4iKYTfCi
         SfM6XAr5s6RuqMydSXxsKsgAPnzincklnEBKZZv0jfEbpykjUvXHA+yOhQv+lzPXtdUx
         oS0/tszRxuDMJDIFP3cw91zaMXEOlyOqFoXUTIN7DtElV5HM9S1+nDhwKTXSaU7QN+NV
         kXOBmQC9QvP7wXJh6f7jXHnDOHHzbL+0nWAreDq+qIZCy+eh1p2cK2rBX/bqo9KCJRCc
         +O/8Pq4LXYXiliUbyO8HyNs9N9bFKWwvgXjEjCqlSo6UBTxo6c+/+sUb72QA8+7gec9k
         a/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604653; x=1795209453;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=cR4tnnd4g56kLPabOPrUmIQAIL3ogEJdByJgeXVo9A0FpXKYGZ+o5u8c38fXe/htCc
         F1vhzV6QTAmQKCmncg4EZ4pt9KONrAZc5+eP8sCy9wX6gPF6ZUvA9eRBC1TClndGAXR7
         cqrbwnSfBbql++hOkEqIRztrxwRg0gGoZV4+v7tNr8Ikg7B7BFKkd83kmHHpBQY+qc94
         RTmbt/yw12M1KGzYdlvQoTzYd7KHLF0SXqJGtsG5ScUDVzbd35YwvjFJT3hzzU/OMF3Y
         JmTBQp8SWkDmTdgta2cEvPkGdmlXnmQYGCem1a3bOBm+KvClZqKHpJJgS5aBDA8V1SPQ
         WVaQ==
X-Forwarded-Encrypted: i=1; AL+hErHa4yVy0vXtJMthKrgUBCDQ6fuUBTKTsgZAcWyfvAOEyeiNCcFckVzV8lvu9lTusdvsBijFVrK3UndsuylA@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZEBf4mfLO5arTHzcKEeRjFtIEInMfYnYCKJGG6OPr3t+PE136
	jrxhhyRQw0gKKln7egf7HIPm+B4M3a0M1nXmMsdY6gbQt4VbzuVpe8Sk
X-Gm-Gg: AYBFou1pARjPTnrSHwlk1caRLAw7G/1wY1LUQGxM+xvDrG2ACgYoJtFupLewq3XP5ZL
	aF7Rx1cwojZVt3y7bzjpW5W4/iNOH6300FBifTi+66jgnOxYqTkYtzPJWSmr0cvgTN7KPdq0rPw
	e20xBTMaNw9aQ2OdgRqQtzddT5lyfeDicD4PRQCftX2Q4ymXWVTDxfQJYEwonGM51D+oLu094sG
	uJ4Su93RxKeqQV2Tb6Vonzg10gBabchH/uAUKu9PRDMNGtdBHk/sv9V7du8iWiF0NkYws4it1qP
	L98/Ay41PVmbLJ5LRMkE8/+lm0kpEgFJ7PeEjT0Q085ssuWAjqHkvfx3pWUNPqKNhyRVaYzMYX1
	d4iKqNg4rHvBORDSy6Qe8FLCnJ9If/Mr63D7/nxrcg0vDYkd0pmum47czW3RW649qoCvKj2ea7f
	KLQUK1AoRJCPvD9fn55mrHUyG+O64Y2awDXz8WE0N2Y3Xq8GT3i2SBi9MSCMncEeXbqvrolwDcO
	UwWRIrKZtqLsQJNV++tJRW7eU9eYpf2G6v79sbxBcPBXm8uoSiF
X-Received: by 2002:a05:600c:470a:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4bb55a01bf3mr80266735e9.2.1794604653483;
        Fri, 13 Nov 2026 13:17:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm30939805e9.2.2026.11.13.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:17:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:17:32 -0800 (PST)
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
To: broonie@kernel.org
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
In-Reply-To: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
References: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
Message-ID: <cb70e9d4bc154a52ba5d9351baa57191@gmail.com>

SGkgTWFyaywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KClVuZGVyc3Rvb2Qgb24gdGhyZWFkaW5n
IC0gdGhpcyB3YXMgYSByZXBseSBpbiB0aGUgb2xkIHRocmVhZCByYXRoZXIKdGhhbiBhIGZyZXNo
IG9uZTsgdGhlIG5leHQgcmV2aXNpb24gd2lsbCBnbyBvdXQgYXMgYSBuZXcgdGhyZWFkLiBJJ2xs
CnNldCB1cCBiNCBiZWZvcmUgdGhlbi4KCk9uIHRoZSBjbG9jayByZXRyeSBpdHNlbGY6IGFncmVl
ZCB0aGF0IHRoZSByaWdodCBmaXggaXMgaW4gdGhlIGRyaXZlcgpjb3JlIC8gY2xvY2sgQVBJIHNv
IHRoYXQgZGVmZXJyZWQtcHJvYmUgcnVucyBhcmUgcmV0cmlnZ2VyZWQgd2hlbiBuZXcKcmVzb3Vy
Y2VzIGFwcGVhciwgcmF0aGVyIHRoYW4gb3Blbi1jb2RpbmcgYm91bmRlZCByZXRyaWVzIGluIGRy
aXZlcnMuClRoYXQgaXMgYSBtdWNoIGxhcmdlciBjaGFuZ2UgdGhhbiBJIGNhbiBtYWtlIGFsb25l
LCBzbyBteSBpbnRlbnRpb24Kd2l0aCB0aGlzIHNlcmllcyB3YXMgYSBzdG9wZ2FwIGZvciB0aGlz
IGxhcHRvcDogd2l0aG91dCB0aGUgcmV0cnkgdGhlCm1hY3JvIGFuZCBTb3VuZFdpcmUgZHJpdmVy
cyBzdGF5IGRlZmVycmVkIGZvcmV2ZXIgb24gWDFQNDIxMDAgYmVjYXVzZQp0aGVpciBjbG9jayBw
cm92aWRlcnMgcmVnaXN0ZXIgbGF0ZS4KCldvdWxkIHlvdSBwcmVmZXIgdGhhdCBwYXRjaCBiZSBk
cm9wcGVkIGZyb20gdGhpcyBzZXJpZXMgdW50aWwgdGhlIGNvcmUKc2lkZSBpcyBzb3J0ZWQsIG9y
IGlzIGEgYm91bmRlZCByZXRyeSBhY2NlcHRhYmxlIGluIHRoZSBpbnRlcmltPyBIYXBweQp0byBm
b2xsb3cgZWl0aGVyIGRpcmVjdGlvbiAtIHRoZSBkZXZpY2UgdHJlZSBwYXRjaGVzICgxLzQgYW5k
IDIvNCkgYXJlCmluZGVwZW5kZW50IG9mIGl0LgoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVy
Cg==

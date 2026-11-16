Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857458;
	b=B5aPkHFhjCR14pzsZH4cLaECm4+Ai3YY87H47wBu6Eqiwfvv4Ie3p51Qh8eRip9qTV8U
	 v4LkluARAPv/K/EIntsotpvxgV5lx2cfRYPDc9DQ+kiWYzUmwdYtNCBnhFCFMPrMWNBpE
	 nTon8TN/K+7svk5G+Sm4Oh0rbMMgorEjmCVjqOCsmmykALWJNwkksQiStslXSEnNuUlh9
	 817tUKIMx9mM0/8SGVMxwf/19h4nwlx6/Sf29Q93bFiPuG7zkOkV9QACy47WhLJ6qYIzE
	 +Wf9Fad9tLvF9ClprJhfLixDffsMZ1Burxjdg/A31RhbeZ72ZytQ9FMpWx632QZy8ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
	b=EkTLPyZSJMuvZbbQ7FdSO9u3xADLT5hgcum65HBPwTMr8enS9dwOsb9zCKcPyFg5IcVw
	 jREpTHOUjMyykSf5UOjmGRziExYIY1fWU54s4PD3dTjUCYIx4DMgskmFvT44bqVop8O38
	 xzhbinO/ys2HAX8F4/nYOsEFv5kx5OGgqN+BHpoNDA5/b46t9nbKk4pHnt1G3C4ID1RCp
	 NWx0CORCumK0gSGm2whONmNVYZgSYhqnIhMrXW72cGW6mcGEOVeAdqFNbpJJ8iyA14mFG
	 ItYoL/wu6ZKuBlfvEuykzOdAOcMDh5XJlyDK2bC5x5VX6UdyZBDh7l0qH3Qz3cJEOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66AC606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 19:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66AC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23384675e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857456; x=1795462256; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=uEy1AElbgSN0iCbkHQHkrKmNsM5r3ifbSQ7MflZws670z1/j3XYQdOz48yxOPyaL4s
         OnMA9u0AM8XheCSCp8GjPpfa5hoNvGLyi7CE+UX9NUMjl6r6ZC5HI+l3oD47WctQ3f1P
         HU/MyiF8UH1zBhaoAkpuLOEPKzEnNw5Tty4ZE7srT+EqGmxJAvHbXGoF7UQ5Qs1ZDP0n
         2MZzc9shFf8oMnwKbQXiwfMTswA7/x+mAcIxIg7bugBCUJkoMA2SWLcfaoKaSg/vuDTu
         nx7esPZ9gdHvzYV0id1z6Ih+czIMOqDs+cNZLXPdITpR4tEbhO10xHpHvCBiQPRAycBM
         PMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857456; x=1795462256;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=nNc7hUB2Op78GHJV6OYSfvB4lRpV8T7qg4nluHaX70LlYC1yk8TeHFhkT1KBTpQLK1
         tg6rNkGzVmn+DGy1J4Kbn/fJSx6ZvfnHF6WWD3WB/4f6ECXB7nm506iU1vTFV2FE92Uy
         70lNF6nmeQKluDpREEx5iREAnu8xeqs5XJNS38VdpgcR4YKEX+0dZdo2EF10HS21GVp9
         TVKlUsq2EypTsMv5+Rxn9QEWfHBY8ZNoyZj832FU5xK64HeA2pLLiyzCfWqFk9/rewYr
         g2315stQvbO3Wh723LPsxSed37S/o/fZZ6RA2w4BKzT8rtUG/ueBdAcRDvM8UiVZMmOH
         c9Fw==
X-Forwarded-Encrypted: i=1; AL+hErEnoJxusq84J4zdVVp+SNyOgHVnjjNMeHnViHYOkhQsPzITeTlWAldW69LvAVxUn8iYt0TG/e3TpwpQTMsU@vger.kernel.org
X-Gm-Message-State: APuU4Z9YWmoNeu/34155JVAWFiCSoh4Q2JRDgl4f2S9XhUBjzaGGdsER
	myOZAbLgD6ddOJxfCDu0KiM/mNCjzCSfV13r5f/CBfTFtH9r0PMLA7HP
X-Gm-Gg: AYBFou2iIsbAbB1pQhuJB9zVX7f0+yqDK4llMosJUCpfrjmcvZsiu8znVEpmZ3zasGA
	EQGYQ0vBESiF47OU9k4NGPeT38dwrdY0KWC831g2nzuoY9IxhKIChVvVhehOVJ9d6RaqwgWzQGr
	IPVsEvba5kbR4H02efE1/1xnsJUfCCceJjc2UxOYGHOEmiNDtJHXCsuKGExUZooKosTDU2npeYn
	wTpl4ayDL0oHUHJzAbvbRRg4oxl59W/mlStE248s9p9/uVacCsK0n1e+U70vd3Ed0Ep1bhymC7r
	x0E736rqKO5mnK5N1MyKoPAyAZY9+AN3jMOmA1OQFA1U1fLsGvFclqJh5dEMvrRb5oeibqTzlUY
	UGWobkDjqSX5npYDUlMNO+DbnHjxx5C0m7snJMYM2ia3X+03/YmsvdS8zg5ZfAYpHRU6LAz3tLr
	A5DWDvMLl91JrenbzgJhHZuS4h4T8rZGQ2KOOIIZvDuF/kIZoyByglNNNzj3hLJhxaheXvYxPkh
	noM7GShQIDwfgrJRXwZL9UC0n+2jK7LJBXH2zjXItS7CXR0481+1LDx
X-Received: by 2002:a05:600c:428c:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb55aabd53mr158518805e9.29.1794857456017;
        Mon, 16 Nov 2026 11:30:56 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm16318555e9.1.2026.11.16.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:55 -0800 (PST)
Date: Mon, 16 Nov 2026 11:30:55 -0800 (PST)
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
To: srinivas.kandagatla@oss.qualcomm.com
Cc: broonie@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 3/4] ASoC: qcom: lpass macro / soundwire: asynchronous
 probe with clock retry
In-Reply-To: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
References: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
Message-ID: <312911d6ca094b94b90264688aeb9df7@gmail.com>

SGkgU3JpbmksCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsIGFuZCBmb3IgdGhlIFJldmlld2VkLWJ5
IG9uIHRoZQpjbGtfcHJlcGFyZV9lbmFibGUoKSBmaXggKENjOiBzdGFibGUgd2lsbCBiZSBhZGRl
ZCBpbiB0aGUgcmVwb3N0KS4KClRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uIGFib3V0IHRoZSByZXRy
eSBwYXRjaDogb24gdGhlIEFzdXMgVml2b2Jvb2sgMTYKWDE2MDdRQSAoWDFQNDIxMDApLCB0aGUg
Ym9vdCBzaG93ZWQgdGhlIExQQVNTIG1hY3JvIGFuZCBTb3VuZFdpcmUKZGV2aWNlcyBuZXZlciBj
b21pbmcgdXAsIHdpdGggdmFfbWFjcm8gbG9nZ2luZyAicWNvbSxkbWljLXNhbXBsZS1yYXRlCmR0
IGVudHJ5IG1pc3NpbmciIGFuZCB0aGUgYXVkaW8gREFJcyBzdGF5aW5nIGRlZmVycmVkLiBNeSBk
aWFnbm9zaXMgYXQKdGhlIHRpbWUgd2FzIHRoYXQgdGhlaXIgY2xvY2sgcHJvdmlkZXJzIHJlZ2lz
dGVyZWQgbGF0ZSBhbmQgbmV2ZXIKdHJpZ2dlcmVkIGEgZGVmZXJyZWQtcHJvYmUgcmV0cnksIGhl
bmNlIHRoZSByZXRyeSBhdHRlbXB0LiBUaGF0IHBhdGNoCmlzIG5vdyBkcm9wcGVkOiBmb2xsb3dp
bmcgdGhlIHJldmlldyBpdCBiZWNhbWUgY2xlYXIgdGhlIGRyaXZlciBjb3JlCmRvZXMgcmV0cmln
Z2VyIGRlZmVycmVkLXByb2JlIHJ1bnMgd2hlbiBzdXBwbGllcnMgcmVnaXN0ZXIsIHNvIHRoZQpo
YWNrIHdhcyBhaW1lZCBhdCB0aGUgd3JvbmcgdGhpbmcuIFRoZSBhY3R1YWwgZml4ZXMgd2VyZSBp
biB0aGUgZGV2aWNlCnRyZWUgLSB0aGUgbWlzc2luZyBxY29tLGRtaWMtc2FtcGxlLXJhdGUgYW5k
IHZkZC1taWNiLXN1cHBseQpwcm9wZXJ0aWVzIG9uIHRoZSBWQSBtYWNybywgcGx1cyB0aGUgdW5w
b3B1bGF0ZWQgcG1jODM4MF82IGNsdXN0ZXIKUE1JQyAtIHdoaWNoIHdlbnQgaW50byB0aGUgY3Vy
cmVudCBzZXJpZXMgKHBhdGNoIDIvMykuCgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099875;
	b=KWSMPFrHjLEnYz3bvefm/8bHMvmWnNIsnGo4UVvsIJhx7Tyl0Ivo8mtpaGNPq14VNpDQ
	 ffl7He055ikFNsQy+BY7/OLBlVM31zqoaDmzBGIvSH4KEqwtRw7ibAA9Y459dXgsXXLwE
	 lppv6VrHbSACYIuDqfarnQBKee9Vt6XL9bMr4eHpWfqIWnJR21Unjbk87CbRwy2QFpo0B
	 W8mOx+v7Syxj1kOJsGhnZY0D5y8aCKCjEd3Ra3qFhqP7mFnP4HxiBxla3wkg3xwgNtJdD
	 d0/LfmArFcKOmnCYeSVkXfOugpc30aV1dd+li2hyeIx6LtdVMBqjFXk3pgSuXHhdAIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
	b=lF1Cp9PQvCFP7PRE3MG341LXIY0p4m8HiS8LYKW5+B0V8gDi6CyypsH9khYdCcxWyyBE
	 zx6DIO/Ks+R7NMK5oNwg1TMq3kQ7ZPO10DRNp1u87almLFu6F9FQzs0JSlOEL1hRKwtbj
	 RkYqwJYmX2uRGhhAsdJyaYUVONlO/b9zjgj71xhmVvsXypf/XCHvDrkFwJGU6RFPdCWuZ
	 OYZhimE5HGBR1Nz8huogoT7BUkLkHINpd5BBV9rYnIYm1f7te46nYmicbEnA4JiAeoupB
	 Qn6IV3u8e+UeSh4J9/aEjUm+6YAwUP/hL3ieyCd7Bij/0xryVfEGFZDZb+d8e2Yhobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFC606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 14:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BFC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso2524771fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099873; x=1795704673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=VL7MC+zFVy9dh95bxdI0i4adxbHSpzTznJz8NOe8ktBQfQdW132dePH/Zt5Grc5VYp
         tJUXKNhVIaRN1C5TmaeHf4EAy+7JVM8UnyWYN6PB0ahMjyIJ+nRjdIR52n+C4eGQkSqM
         QdiQ8oRu+d2g+jFUbUQL4wz7w6eWQ5sNGs312ts8oxAf/ravDm1bah7sz/7vIyfX1gU2
         p6cYrHvPBl9OsmoGWFuyIz2wKAujNHTDxzg0fvuC1JZ4JNGYSjz9O4b2H/w39HdHSI6O
         E8LuXuunIpl/zXVj1XzTaSKBcxAMgmDcXGmFAku/kysC0Bnq/132nw0A6n/CtzaXAN7n
         K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099873; x=1795704673;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=IDhBk1jggXN9w4EQ3aPtfprJVXNAIS+Udp/w0GrA0n1rQZyIPKhC/tyAWAX/cI5J8h
         gPjzu+sfv0QMcZ1sgM5ik6yLupZvbFuJyjcu6ES1+FgasqKrJNhdy+c744JuGD4WfjKc
         kkNt4kUu2pq6kRh4OP9f8EVmvIfH8VuokhgcUBlnXPsmcLX80wdaGV9Y7AW3+Mo2SILV
         59ytnrux/L5HZZgANJA6xyEF5TRC3UOSdy1j+34RVeF1z7W+B/IvwbvrVEbrE+cmE4Wd
         wI7ggIerJVtSlAaESK57hQE4M2C9xLKWFpNfdhTnEaCY+MIDBPvOs6xvzBZXFUWHNHH9
         lrlg==
X-Forwarded-Encrypted: i=1; AL+hErFKHQcd/2SOVPN4NdiCnQ60vbYSeJo9Zp4n49X5788435lNQAGSEmoM+izeN7+xgqAfe1DxovR+nJDGw3a+@vger.kernel.org
X-Gm-Message-State: APuU4Z8vZv+QK6FGBf3z8C9loOLE/ADDaJn4YvP5LPt9zY3YWGesYi92
	8KNM/0nCKDdHuu37R02CZXfnJmTMQmsxxKr45vtHkGo9o560s6DiWppU
X-Gm-Gg: AYBFou0X+zOLIW8cIpq9YHff2/rQ+7uMHwvfByGUwX796IyIehEjLvS+RRgmXo+Ady0
	vQBLxmxUmqYQEU2KQJybAhVO0D0fYjKrgc9YdNMO3SARUO+2bznOpdfkPcKAzgUrB7R4GNtkNKU
	rTFiG8G44lTNU625QAyRj95Q0KEsyjR1RccLaI8FNc1DsiLJNNMxj7aa0J/tVqT9KLprL7VUDoW
	/ImLjOEvq4Kjs6wj76UTTsmK2O92cLOnzwBio0fCXpVxY/su7BWvJCG971z+Eexcgcko/zp/XXw
	HGXIbERRHqgiF6OWcqKKzDfi14MSJkorP5WZ0K+umQD+TIXJf6EAnZvJTfWsnCPb3MD9CWeofRv
	TCL5kZds8ye3E6XYeKKyxbpsuE2qeSI0NMrOkVRebuFuT9ijPqgaThnLaBDh3WqvU5ABP/m2Zzn
	m5+S3ocxWo+M+z94oQa0yElGYIoMdrjsQ0XZ4zeDxUPkl0N71001uuUMBlZKkGXONQ0Jsif9p/3
	LuWA26C1RVo0xeQGHgq9eA+VCkapmA98ga+JYaH7+QXvSud3kniI/AlFA9NR9SGKBHXwqopSjkk
	JLyDBnU5TTp3wF8TlZQfngZKGFueUJ5XcMDEWcp/C4kvG5WKHGDfTZI3We2DFgR/dv8pLINVqKl
	5sZ2nR1rCv2pmKm0j5SasuNbalo/+ysIRBix09Xs/oyL5Rw3eUUKPvVuNU6mpJA==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr334811fa.1.1795099872835;
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ea7c659sm11264611fa.12.2026.11.19.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Date: Thu, 19 Nov 2026 16:51:11 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wcd934x: drop the MCLK on every disable
In-Reply-To: <179509724666.116416.15851195764740977182.b4-review@b4>
References: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
 <179509724666.116416.15851195764740977182.b4-review@b4>
Message-ID: <20261119-wcd934x-mclk-re-ba7379da5f2f@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026 at 02:07:26PM +0000, Mark Brown wrote:
> Are you absolutely sure there are no other paths that could do this, for
> example take a look at wcd_mbhc_adc_detect_plug_type() and the rest of
> the jack detection code?

No, and you are right to point there: the jack detection does not
balance its calls.

wcd_mbhc_adc_detect_plug_type() requests the micbias once per insertion,
and wcd934x_mbhc_request_micbias() takes an MCLK reference with it. The
releases are more: wcd_correct_swch_plug() releases at its exit, once
more for a headphone or when the work is stopped, and
wcd_mbhc_report_plug_removal() releases again on every removal. micb_ref
is clamped at zero, but the MCLK reference next to it is dropped every
time.

So with this patch alone, a removal while SoundWire is running would
drop a reference the jack detection does not hold. The early return is
what hides that today.

I will send a v2 that first makes the jack detection drop only the
references it took, and then removes the check. The board I test on has
no jack, so that part will be build-tested only; I will say so there.

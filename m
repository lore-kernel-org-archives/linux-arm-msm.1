Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606788;
	b=NRWpHUOuWlvuxKD1Fzl4+lSm28wcJUyNGkN5EbJQwkfIRCFQAHuRmMKNVim6RPMHODlH
	 F0w2tnQnmf6jsNzzODvJGUDpTgA7zjfZwbe3Cij2vMeHKVIX4dgfzKYuM7AVjLFmPmI+s
	 GnoqGr/n31lSA7q9GIStzuVLDVANh9omM7LJHklZMtI5SHMdWneJogxQwFJReuCK3yOdY
	 EvlxgZPMyyPQEkBU7/gLEQJYQUQUVtTSxEzV1/k49eU6TGoF8FQ0WJAg/hKQGn9XWHeqz
	 ifq3kCOvYn22dkfqxEGdTd9UNzTIPU6xQQjMS1YtGP0fRjAzzmWTEGSHg1zN+J9SvFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
	b=ezdaA98KinbGgn8gpoxMvLezh/ktWUfQfzWHVC1EAtllQ/8WFxEFW44YgyDOjBP1txOx
	 HBkZDIMeH8OgIY586rO5quH1lYS+ywuOqAqqNKvW4GvWfZYzuOsje9ELMveX7xEgOphZk
	 Yj18n3oKF4B8V2MLVVWCH17rUDrS+p5+fTBlFEwAMvr5lCGQn7rIqO/MIFeXSEmZERmUe
	 JKIdwVePta4//JdGwpmQ9Gzaw1kOTGbkB2GIX9bzkH/eK9XeCmIb1PcpgbniATwSFtuWE
	 4HfVmm27hq4PzH5mcRmQeOf4u7TgvkaDu/MY5kJ3jAvWEHtaf7ac2jG8IfeiYMZl3Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAGpfHyV;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240E606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 18:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2240E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAGpfHyV
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so814437e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606786; x=1793211586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
        b=qAGpfHyVfaMIH7CJNiBwxj9rv0Qe6qb2Bz8HH8EBd7DU/Gjg/s5+p/zxDysVJdoVt6
         gHm750RlBqNpmLp3R2mVgZtSwqCnC0mWd5rSRkHqtSt84k55Wem2s13Y8Tqt9qR2pvTc
         amDxGM37Q1biWEVVa3KpRTDLEvBhyEsuBj1Wu+N/uzl3RODyG/at0S/jTNUmGum9GgqG
         yFqFiS8iKcOn1B0og2Q6mWoyM7sF1uBmIH4fPOrt23TZadX2ELc2fy3pYnR0e9VRRekp
         9aQUnX2VNlMqn6+hspMHTJwFuaPFnV0IqTAxeQ2RZGFtN/tP1+FnB7Ra0ekHtOztob7u
         4QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606786; x=1793211586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nco9E6pnxf1U90wQWWUGgERQdyljr6gpJ4DY5U+hjP0=;
        b=IZ4KsGGO9wuLAiMIeKd9GvkpwVYy2nMeIBseyFiobk+jfhcsPGby4LB8TS89gJsG/X
         fvUvJhb+gnito/M08KikoQg9oDI+0TWmE5pji/0Q8nqbD80sVR7KjjecH/u9lTxh3wPG
         a1nJIeaDX0kmEsiYCC0bE2+no9zBu1n/jR4OywG6Ef6BxutFNJjsd3JH983c66ViwqzX
         BJyo6wUFy68H368WXEseyi7dDvM/bjSoGPwaHHNelA6w7qdJTVSttzi8M2wCucybhT82
         2UywRILy8zFHVrEvCA2qDkWDyXknGR+Z6G7kyv+hjf2PkkiieH35e7E7q2sYd5SUcM8U
         6zgg==
X-Forwarded-Encrypted: i=1; AKwUvBz0S41lUqlKy+7Byc+I2L0Q7sDWTfTdB+bUTg/UwyT1gSbDujK4kthZ5SpdytI6WMSe7o208Ka8PQf1/BTn@vger.kernel.org
X-Gm-Message-State: AFq9FYLOW4Suf9R5nPcyrCKUVkyMU7LdUz/P8H9S/bUIOhneCTvURwgB
	X/ew//bgWrmPx+Itt6EvMFiRFLCisNKcLZ8PVE5z/OqmmQZTcj9obPt8
X-Gm-Gg: AYBFou0Z7icai8Vz3u3nZYq8q9nac5iV0JE81iJUTuUPpuoFCmYnOkUIvB9KXp3dk0r
	VJOj1ixyyzdRUgSRGR7ib0FqbXrcpKstk+Fuo5SDR4ww+m75YbVXHvzwtDXThgw45s3gCGcsDEY
	PhFurDMZ0kHDIyM1UEYxySO1gXwntQ55eKu6s+DXTYnkv8Yh5z+iGIIVvLfZUk6cDXYfCefnjyg
	NX1L2g7JtNOfTxyCp0ZEoVm7MgaYSydrYEfCn2ER6e8Vr1sf1s2YCXGOX2MzKJG69QA1vkZgorn
	9ubSxzL/QAEdaNpp0xpYwFWA0MZOLYgt4ytYZOj+IRGDOXgI/TvzWXSW64h2ajD1NfcOBzCTsa1
	EJqtbrvi2RbBe2zHMun+mzgw/5BvvsOwhxRUYtrMUQcNqHlhHxKWsCkjgvNnymbcFDXNeNeO3xv
	E92Vu8knu/ll4w656mQKtIhedNwZ2hkEivurbR7wmXaUbubnOQTR+eiUV/EWUXqoO601gLCYxqo
	ePg20TjecWEF4FZzMW4ZuMlngRGyymmTyf8AA48jUitnmW5uENJCgrPTva4NTmkVXCAEsSNupeU
	0wDjOWbEpzoQPTkJBP+TbTS2SjO96kYTqipohfXKvC41rLfpJGCEuIbkbL6tOUI=
X-Received: by 2002:a05:6512:3e0e:b0:5be:488f:6008 with SMTP id 2adb3069b0e04-5bfa1ccefb3mr1270192e87.15.1792606786005;
        Wed, 21 Oct 2026 11:19:46 -0700 (PDT)
Received: from yantra.. (nekmmqsaylkikwvppw8-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:10fa:2e9e:78b7:e58])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa123120asm649718e87.69.2026.10.21.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:19:45 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Wed, 21 Oct 2026 21:19:44 +0300
Message-ID: <20261021181944.14272-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org>
References: <20261021052435.112686-1-zoone.rupert@gmail.com> <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 08:15:20AM -0700, Bart Van Assche wrote:
> Why doesn't this patch set CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y?
> Shouldn't that change be included in this patch?

Fair point, without it nothing checks these annotations. v3 will enable
it as a separate patch, so the fix can still be backported on its own.

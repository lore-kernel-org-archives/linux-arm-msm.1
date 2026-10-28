Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168178;
	b=qSdY9HDFvVqIcMxAfaY5w2ceimC5yrrABBVu6QMx0+kh+jgaAxqUiGN5bhkcnNS/FF4B
	 /dQ/iM4HeA8zvhdZzX3hU/uwVCcwPjnTMAmupiDRHwjL2EWbCHqSzjrGIeI2HafPDdGwT
	 d8OECsYqRewLYAAgF9n53c1cV5S37l+OPUIAvR+pWc7On+WJCNVCxITXLPvuJKXnn8gqE
	 kxi2fQKOpdoRs8keYocrAxd1YkML8Y9aIP1YBaXHI3TrUJ7M8LzCLZ5Ew2+o/FLWpTmBg
	 GW0I/OKF6b3NncPhqqF0DCHi0lT/Pe6rONde8Y6P91ruGpnh9NuhefcfC0za+YF9U5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
	b=Kv+OxKwGZumiaTwh6RcjLTXxRjP3nUu3k0TMvdZcQeV/TP4HgpmJZsaqH2IKIvw/0QWX
	 PuvAn43gRKk6d413jnIGK4UuRvL3I/NL6lbBqq4G11DAojuX5tKtRtmThbLYvhItNl+S3
	 3krBOX8jwbdGpJE9tQYu+j5kF3TZjh9erPR5SmFciDyQz8gsFj2ojRbbAiX/XEGECUeu4
	 rCE32fLuOGzs5NXlJQLEiBGai05GKVCfpodACc8fjhqNVVVDwAvH2iO5TViCoG9aAin68
	 5kTmPaWwMmQORfePNfOSbhmY0jED17oxjCi8gtOmpGhyR4jPSNRYLr/W5ywmNSCR3Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVrrS+rA;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC872606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC872606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVrrS+rA
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so507965e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168176; x=1793772976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=xVrrS+rA48dR++IWDoeT0yzgI8xGj6gmsCuXugY9JkQg8WgACbfDsXwKUBfsfE+oO4
         xWeUg+T12a7Bbfsb5wCcdiLCdoMQu5a5u77uLDQJ2AYHQiH8zXrGn9/9sXY008GV+gQR
         Rvf6zK1RU7ithcxnnEsZgKBC8J6OXzVYOYbWHsEVuUJS3FGX4oFYxfsqQyMBoUUaIJzn
         p5Gg4diO74fqYRoEQqGKbXmrpJGDvWGUg+MQpMwxlvGGVncK5E6Z9c3jw3DJOAi9sncu
         baKYmGIraPwobQ9M63jnTuEVNUa+cPVrVO+L33aJu2tm42cwY6MIQ2pZE5R883rrFRCg
         qSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168176; x=1793772976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=sU0SVs8Gg0ZeS/sdQGLXECZfsaD4XZiTOm8KV3JERezjnY9OZEkXEKPreeExM9MUwP
         qpUioVxfKAZumPHonDSaTbzKdjAystgZK7Qo9LGOX3pdSOhOJcUqY7uapwEj90di+N5B
         8nD9IGCRu08WEW4r46wB6ElQusB72HFuV+lEBzP+oFuad11wDj/kgwEAvAl0a4vtNiJu
         OFO1mafDuVCEd10q4OISvuUEuZTk1Ubpiutdx9kdNZpJiXvJLOF1YkH2jQQDKM6uuk7r
         8sfvTyPpz5JFv1yPs5yLxmvWpuMdVIOtWroFzWoJZTyHq8mw4Ha/m+uDvk4GiTDB3xQw
         nZSw==
X-Forwarded-Encrypted: i=1; AKwUvBxTghwL1aIX1XRB+j0EHoOQ6BsSPjmo1cyqTEDxHsB0A7YtOG1F+PBWWXD/Ag1l26FuXMh8umdJ5l+QUYUk@vger.kernel.org
X-Gm-Message-State: AFq9FYIUtXWEW3U2n92HTfDupMuRwyF4G/4uSlFHfWxYJwKzZvCrCgsV
	HhMF5OxLEqLliSlQZeEvcFQXQgPxqXroNouNmim3lda+KchWcjTsHYvu
X-Gm-Gg: AYBFou2BsX3tkPGr/NauHpdguVDa7kivTF1/ndk8zdfm+sgURnVCHAT7GqgdT2gXi1E
	LSt83xX8UXc4U1fsE/2oW1OnsIrwP6WhSqFM8RJxo7bvdSCwg2c18IQmODKBqPF1EfpmwzHHX2k
	a+kahjoNpUwtlz+roixQ77LYwd67rwjV5CWdOIOL9XFvKvJLnB02wrvca0YnQjMLMCNRmFSke0i
	5UYIzz27zFqjflBwl5AF5dTM8i9mIDEdWDm8BRrlDFcPPK7EVTVxdvvgy4VXsRsij54i0G4F+fn
	zJJm93QkAAAkbLq98wE8rTnUD6HQ0HeW1EMT2TCt0Pk+deNsfRyCRk3zmqJqo3o+jCqZH+Q7OOm
	+/tjxsjgYnS5MMeSDID6obR+qcA4yK2vUFZg6gEKMy/cKAq+rQ7nVYTrSu9oDH+Gqm25S3fZvvT
	sWaOr9DN4O+9FMTeq5WfAFSiwuWiIBKfQARpK5TE4EOP7kmGykdmSFkvAhbAGykv+JLYd7n6/pA
	NfM5B0sZZ1WiVb0WvcudjysdGBpC5e88MQtuD9XxNM5m8504ZZlk3BSmkZv8tlb8yTnIMYkNArG
	cj7UN+U6BMGZQp7zjDktkO3qr1vgzpr26k9EGwfIb0SMqT/075pQQ05iDYRVyQ+paTXPRgttqkp
	rbiGfti8DBw==
X-Received: by 2002:a05:6512:3a82:b0:5be:4be3:bb8f with SMTP id 2adb3069b0e04-5bfcad787eamr578392e87.19.1793168175751;
        Tue, 27 Oct 2026 23:16:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f9f2sm400912e87.8.2026.10.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:16:14 -0700 (PDT)
Message-ID: <9e9a2f4b-b6d6-4faf-95f2-e227b41d27eb@gmail.com>
Date: Wed, 28 Oct 2026 08:16:11 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock
 helpers
To: Rupesh Majhi <zoone.rupert@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jinseob Kim <kimjinseob88@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 14:49, Rupesh Majhi wrote:
> kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
> and kx022a_turn_on_unlock() releases it. Annotate both so context
> analysis follows the lock into the callers.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

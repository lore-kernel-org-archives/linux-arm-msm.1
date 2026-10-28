Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205174;
	b=duP2BYZJiLrOX5T1podwiv1X8hGPQS284oMrxIwrkxj+qD9/UAPbFsa9UsPAja6tNCLA
	 xTqFZSi447R/hLgV5cAIVOnbwKX9fknGDtmcyUIEDDdBG1KYws8OY/eiyCmyKfXR0PCob
	 alY2vXGnD5l2HD4hAcEDJU/9JBxRBr2UvlboHTGBxmXy4NSsodxl6pM/2Z3SsoTFqimVf
	 5YHe9IEJNzwYk85HuDBSBonKhQhsw+6fIbPEaIjFOPfld4nO8VgTMmw5thTxfqN1Kppzl
	 E6kE3F4xF+VCb4EjiW+RxtxfoIPhWERl5ENaUyuTQxrhuziupurd8Beb0qTYlEI3c5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
	b=wn698LlNDDN+iEgY+IEHyF0FvJVFsJa9+qxK+ZICPgn+NW9jqp4qFyfX8N4zy7RWbdzO
	 mOcMQ9uuGCk3nv3lvAq62mwdvESTFpnzdWiDnQzCCxSQOv6ltEAu4i6/zKSGOM0Hj9vKs
	 dCDI8mDSUw+mtKDdULg14coCrgzBRzHRfLP1fT15ob1n/EU68xfoASUCpOib1DmrSJfAb
	 grF/lDUp7Mw0Lz5KFah6FJprfCLjjrFAyChPJ+v6qCAnHT0wCwVKYwBmEG1E9mK3gAQcd
	 grVh1RC3dIq+iCvuqwiY0nbIMdbD7UHmugfif/1fvHmg96NaYO7HW8uhtBMg47G5G/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C85606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1913965a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793205167; x=1793809967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=eXbHX832eO7KCEIcf9QIePPynNTj3zpEb16xJdYbSQOpkoowvXm2FC7H6N9IvePrjc
         NYQ2YsaKAWrn2bA552yqC0m4jx9nYIEsJ+kAosssFdnCwTnhd1wrP5purilJVqmg7IW/
         9PyvNGGsC/J8INfibywsqgTj/qEsPfMTfKHOw4dM8efcKWBLZMUAodnHQ54JjxrTf6rN
         cUXimDERsjEyUBueSdi1MiLTD5lh4jvrY5h0wazj9l3ROl/0fZ8OLDTM2Vd6t6/kkAK3
         OMu88H+ojqLazQ53GiyqfkVyj8dVS6lmsTdc9R8SFLBxu3UN0Fq7XJUuj66hC7CQ5WNn
         GpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205167; x=1793809967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=q8HjhR5tlmlCsEPD7ltl5ekJmpn8DBXVPh8o2RzNQxHXBR2VFZrzfZt+uPUVe9tcat
         h5Vqz97rEo3MLFRKz7xdwceUstmhDV5nnBSq4jA2JcShfySharDRLCKxFGoRAmkvIV9o
         Id0ZZSulY7C4rcm5xuTetrVfYIE6NqFPVdHyzMd0IZAwHoYLXVyvaD4MHbQ7Vev5zby+
         4KUEf4EWnSyntD1vM2WSbKNLaTzp1KH/UTVlks6/Ual0l/htfEzTJnCjvnFJ/MMGFFYB
         1u7aNcPY3Kgi3hZOwISmHROd6Au1/MQcg8/VMSQ4ttoT1PUiUypgq++wsOXmCdVbl0uG
         Cg+A==
X-Forwarded-Encrypted: i=1; AKwUvByYXdKKGQi8od/9ktzI5FiNZOBV59oNBUWVpag8NC/y8o7YObcCrR48/fmlI5tFEBlQcrBCyO0hPj04icRG@vger.kernel.org
X-Gm-Message-State: AFq9FYKgD5w8zhnCeFMRMNmWIoQEyjlUDAcrRqj1MSB1tlVk7Zued4zA
	rSlEHS0WqvqKW4odKHJo38eSa4Ym0eWfh1GvHGNTAY7LBQ1qjumKKZHPKeGjQA3PN3o=
X-Gm-Gg: AYBFou38JSKXvIrTycY04t/HBLB8+law7E6pNmX2mrdNh9S0s8smJfWdwvBYfeHli6F
	rMpEGzXBaribClMt6fg60mZ+Ubvv/oiaMEX4FKbgSOsEO8G//MawNHQhP6tkMOTXhxAnaCy7LfJ
	D8YQuALm8i4v15PTuv7YaazlBeOHOonCWCWCys1Gz2nxIkqiZZRhiH35Zr9oc6TNHZ9J1ocN3Oa
	KEREp21mVxHmBCYmgKkV2RwdDVh0lIxmnb/hj/p6WPtaKCKhNRIaQtU4J3+tJMXqxxh1Z0AGq4c
	dbUVRURsQU0FhrfwH/hI6mCFxAylcWI9xcxLOuLgTzFP2Pg2opzTPK+Dk3Qylw/CP4bFZ5XXIg6
	XqmLbr8dlcxT58e3/EcUd4CrlQTjCdvujMTQqip6zgYv2Dyvc4IWG72E3+raPKlvC1OCDUi5R5j
	VxZjWdwm27O9TaJgxvnRCo65Ia1gz/hJePUd/JOMDz4FF0lCWo1sFuYCKrP38ZOJWu51EfATJM3
	K9q9c6jD3UYP6GgmmMOgGeJAjNKDV7OndZ8MFIgQyr1pOalfTFUUq1gb/Ms+p+qq6C1k6gvtFpx
	FSGgfX+6wPdbZG1nYxXwNihy7x1oZbqkVj0TZ4v9pSk9tAOZGtuyBRttnpCQq4YOvnXRyhDUhUe
	HgJXA5mPEGaHDM3pEOvDDLZ3tl/M/
X-Received: by 2002:a17:907:2d25:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c49bdfd85b2mr258903766b.43.1793205166976;
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm637108266b.13.2026.10.28.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Wed, 28 Oct 2026 17:31:52 +0100
Message-ID: <20261028163152.26892-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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

Hi Srinivas,

I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
problem.

1. Over-read in audioreach_get_module_priv_data() (oops on topology load)

The function allocates
struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
memcpy()s from the topology blob. It crashed on the first load of a
topology containing the speaker protection module config blob. The
cause is in the size computation. data[] is __le32, so struct_size()
counts elements while mod_array->size is in bytes. The allocation is
4x too large and the memcpy runs past the topology data. This is what
I used instead:

	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);

	pdata = kzalloc(len, GFP_KERNEL);
	if (!pdata)
		return ERR_PTR(-ENOMEM);

	memcpy(pdata, ((u8 *)private->data + sz), len);
	return pdata;

2. Slim 7x bring-up: V/I feedback never reaches the DSP

DT changes for the Slim 7x:
- The WSA codec list is extended with the VISENSE ports
  <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
  swr3. The speaker nodes get #sound-dai-cells = <1>.
- The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
  Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
- I cloned the CRD topology and UCM, using 4 speakers, with the
  WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.

What works:
- The card probes and the SP/VI controls appear.
- Normal playback through the SP graph runs without errors.

What doesn't:
- Calibration (Operation Mode set to Calibration, then silence
  played) times out waiting for V/I. R0/T0 stay 0.
- I read back the SoundWire master and slave port registers, the WSA
  macro SPKR_PROT TX path enables, and the DSP module config. They
  all looked as intended.
- With the SP graph active, the amp stays gated and playback is
  silent. This matches the calibration never completing.

Question: is there anything Hamoa-specific on the VISENSE path (din
port numbers or channel masks, the macro TX decimator routing,
multi_direction_codecs handling) that I should check? I can run any
debug patches you want on this machine.

Unrelated noise: SoundWire parity errors/clash messages appear in the
logs, but they also show up without the series applied, so I don't
think they relate to it.

Regards,
Fabian

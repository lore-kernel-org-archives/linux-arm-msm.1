Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056375;
	b=rMaA7zr0r2nbiBRpbelFDhB7tBPqtCMg8pAG/CX9heH6+Kdn2O1QQtKgfvmwtcMQRGzy
	 w3y/2TgG4kdMw72QQBaTEpHvDYvc6SSSlPFXh0VvRdnZ3plzLC5/mK72GQjzoqpTRmUbF
	 ru6VmTxu/bUiFhR00E/UnAUjMBglLhsthmUsHfIvZLaa2trxTfs8nwgw3S0vUNoHf0nAv
	 M47OqZOLLcLGXd1kkaqUFUqsDY/a3+gR1itAnCkK6afQJ10qG5v3mNrk2+gHPclsSUQIA
	 1a3Vembl0MKt/E9E6qJAsZi8VRntiWMAsPvvs8Nt3KQlSj+iT7Mk1JLraE1BOnypsUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
	b=Xnrib8zNYhCbIRODiavWmU986Q+7E9mACoEGfNtJX/efVgLEqJQcFeQGOI7XDQNpiFYr
	 0oBJ+vJA3HOCSXQ0DD+C5M95k8wns0DPZe04p1tM7pFrHuUWmUDqh6YCGruOs8yV7JYY3
	 5uofF9hyXsQmiL6GfAs/JPkylszTFSz8q/fbNq/tCwDJELFVYS6iBHRq7IRDUp4eleURQ
	 D7ZXe69WAOmarAiBRSMYUvb63ZWB3I0TQGceqJNWaUeUJrRPFKb0uQCCr0X3YdAPQuLMU
	 P2AQmSQnKJ009v0wMOoSgZDYugnKK02GBmT69a6v9E/KWmugYRmFacJaPLW1G3NbVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRilCere;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C15606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C15606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRilCere
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17417515e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056373; x=1793661173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=aRilCerebHy+kF6vnnvW0jj/Q9uLDDrTywoyUyeMhiipONTZd2IUQluvjI0jnnKGNP
         5nppDehQuYJicLjntoH9W0d1gEvh5uvm+Y++H7Z/gm1g5FHCsSMqG6mFrDIOgDePHd38
         PqsapbD53k7pazaNKpc+I6MVV5O9Oj0+G3G21QQwXCkcFYjC1xE7ZAyOBZYcOGAa3MpX
         MMMkrR1ojHvLZD0LPu5JK6UmNI79ge7OFq8S2VE2LwsH/NQB8NHBRtG5hy6YpbY5aX4E
         k6JkCxilvej2FO2/anbmOpgOVrJx3N7Z0JiRMhgzbJq1cwNYOhT57VqQhUZ7vBjFgkvM
         E1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056373; x=1793661173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=1gezNAkzSHFRJsMlCmXxYCeKwbQkuO76xi7KM0LKVK/SqvcVfKLrgOL51WyS2N9IGe
         il17DNcCouxJhk+NTaC+MK/FgsPqMtIvYjMB7ON6bie24IX9l87SsGrkO2q8Q3qceyGd
         XK2+BTftNqVqB/urWn3APhGdRe1YyI/BwET38ilWYTOKPUlrLdHCyYX1Paif3cM5DAY8
         MpwUNS4mdQSsqi5KG3lacz4vOUdnEiISsQlVpA1QnQT1QfColI3HYD1AjTFF0/abkIv6
         Vk9Kel/PNqH1WjUsVMyaPhkGqCD6PUsKx9EfUiIu7Wa86ix8819kmhnn9q5UWhy/rvgy
         X3FA==
X-Forwarded-Encrypted: i=1; AKwUvBxCqjcMDRUOT2DofrvZc6RnXMksq8aoj0KTXLFIhjA+56PHNJOGnl4DCpAAoR5Vowsd3fkF3cj420WlKBW5@vger.kernel.org
X-Gm-Message-State: AFq9FYLX5HfWS1vrpKVeDJkR5V31agVEtowe0WwJqO+TY2556dkZ6+Bd
	l+ZDdI/Lb2+K3GeoqdmUgo5/E1BbBMs40+EFdpaBRit0iDFTHmRb+OY+
X-Gm-Gg: AYBFou0wmztcs0LQfFvnmRrDMIlbIyvM7P63OmGhBjuOLljAVw/T/ht2Tc8h6tL9jj8
	RZebfJ7GFgA2iZDFzajr9chNpoN+p5szqe1YrBLFRYiFtoYUMgitGZxXti1jZoNFqzWzBNQjvJ9
	mbPMPcc+iKoWwYTsZnW6DQFDHCQR/1N7SLQqBlFs8apxNabiXjBU/54jfVj5ESefIId8qwLa6dZ
	YaimvUzg7U/n87KxgCukR6TTeqTfHOclnlsXjmsvEMdwIzklyguw2tPhVScJF0kAjwdBFzSDCld
	p++zQhJB32AebZ7P05oI1DpCoO84tF1MXRX7nNWTGvJou8YfK9uIE2DPLz+MejWR2cJ9n4QaHIE
	RAJPnmW91ttto+O3NFW6bkc3D7/mhnaVrQAeoRBi+ZNJVNJUqi6JNkF57GcCk0mkEIyuyfwf8YY
	OBJ11xIdKuoZqb7lLJS8P8dGC9bIX+OTXS5wpYSeoYxIwWI1bWmfM6WXKMbtxVHSYfIJDxJQRxn
	+QSCS9xxdYbaY6r8NURK/FoNN+UlRaVGLYdnNX65YvtzO8OpKajiAYQQVGdy0pr94MluI5aU1SL
	AAUrfaJKOboeQ3i4+OV1ePeys5bXkA0q5h6P7Gs59cmmZSqpGltZCXe4gxx2Hw==
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr143906785e9.10.1793056373131;
        Mon, 26 Oct 2026 16:12:53 -0700 (PDT)
Received: from iamyoubutArch.adf.bham.ac.uk (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm212047515e9.9.2026.10.26.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:12:52 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Mon, 26 Oct 2026 23:12:36 +0000
Message-ID: <20261026231243.68801-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022163116.1042-1-26rote@gmail.com>
References: <20261022163116.1042-1-26rote@gmail.com>
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

Hello Joonhoe,

I ran into the same problem on a Motorola Moto G 5G Plus (SM7250),
which I'm bringing up on linux-next (next-20261021). Since the HELLO
gate went in, the name service's first announcement to the modem fails
with -EAGAIN on every boot, and so far I had been carrying a local
retry loop in ns.c to get rmtfs announced to it.

I dropped that loop, applied your v2 instead, and booted the phone
seven times in a row. The modem came up and registered on the network
on every boot, with rmtfs serving it, and the phone never reset.
"failed to announce new service" still shows up once for a remote
whose HELLO arrives before ours (one boot logged it for both the ADSP
and the modem, others once or not at all), and the modem carries on
normally afterwards, which matches the replay doing its job.

One thing I couldn't cover is a modem restart: on this phone it
resets the whole SoC with or without your patch, so that's a separate
problem here and says nothing about the patch.

I did the testing with the help of an AI coding assistant (Claude Code);
the results above are from the phone.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus nairo (SM7250)

Thanks,
Filippo

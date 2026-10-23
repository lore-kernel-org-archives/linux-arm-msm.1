Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741730;
	b=2cER/XMB7htLXChVePaCECoXujiOnc6hL6alsFmgH1a6i94G1U7kK+NVZXRd9xt5j9jV
	 7uj9iEU8E2o7bVQkmrpjvcD6C8XiBu+Yu4MBUQC4h3lyosusX+HuK6qwrjQ13DjGKeHpu
	 T7W6q3l/M7r1RaqF9xqeHwirdL/8AOpaa4sop0uimcqZ+d3qyeeoPujj501ZiujS2zpUW
	 iUgR/YPQ7XBtaveHitK47Y4GwL2lp8FfrkJfwJzECXeybBNukTmamuke/qS4gLpNKtJWg
	 UWZNXIUjn84W4YCd+kV7kOlB8VWYf0dRUV8KYe9aBdvFqZYzN+kBBY9qF9m3ZitTrtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
	b=gu9kc3WaIx1rMhBDkFn9hVQrD2zhCufhI3Np8a34aNI6hYqsbjoCIngOXezHrBtbdG/T
	 8sBU0VGl/Qxf5S0W7RdLjvE+T9GRkS7CMLA53RNUKAa+8VO/BuN3QxfOMd3+I3Aw1hdbM
	 iUS/3ARoft6HDNnQM7lzJPrytXgY7c7fbm/0nUS/5KdAp/tjwB9NB44kshGJSNPjA8uqm
	 032Vk7trXOB6wrOuxvzEmbMH4sPZakfFh40CHA2tcZVK1SliR6FMWwYTkFgZC3CCrXyaf
	 IP0mbWh5ixf6ot0vc4Q3OFL+NN7apNvVXMxnb6W7nsZVmA13Rhln7f2EE+SdE8g96nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwAHax5i;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA1606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwAHax5i
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1517bda04a0so686660c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741729; x=1793346529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
        b=fwAHax5iQGGUgoYbSzCa1ibvgzwxg6lBd3IJ52t06wOM24SN1CvJDwFWu+EEyKSu7h
         WyFRmZr97hdACv5Qknm/oneHxpqy3VnSkERpLLdUd64x827R+6K0oMf3cpyIu8Z8GGWq
         gD9W8nExco+z8csBk5xvvRytSqcOWRFen6UaN0Yp/+/z+iq4TiyUotR4c1/LgeIFloAz
         vVzzhE8ovxLWOXfke1lbUrfBt1alt5X/iopSxLHkC0Hy2anPTMoW7VMmMBZY8tyDRAzz
         7O9kcCXK5RLOaS/zZFM35wk8AOU+/A9KHHie8SlqhGov3/aV+3lMC5wiQXoIghCA55RX
         etAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741729; x=1793346529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
        b=P5Qdj6Wf4KD8l9HCOCqIC0mB6OeCPPGLidQmATIIbIIqo3OVJHEQrUdtTdo47C4+Sa
         7zLxzmr8/kli/J9/yVS+k2B6QoYPiSw2dXqdTplU6ypTK+E8PPva4Jdzpum4buInVMo6
         o4tHn12bW1CmKlhdwFOjw0Ml66sxGaRDbprl/PDymGdfm1Nfy0Coh9WZ9XFg63FliGj+
         SE43w1ReoJ8zV7VjV0WEFgON7Go1VqFAkgi4n6TUhVXeLSSDH4SjjmUGi/G4S6vqDJEj
         1KWNogY9AG1IHxe43SKQwQ9PS7PlvbnFIgQ9n3XqQodlDnVTrpk9tqnpxP/w/HMD2MJ5
         bpCg==
X-Forwarded-Encrypted: i=1; AKwUvByS3SQwV4cc1A8pTnkguIAHHR4/Ek6CoRb6PceQZd2q50GB+g2VcnLUrnuDgSOnjFP8/7x2putZSVz/cZay@vger.kernel.org
X-Gm-Message-State: AFq9FYKPhZfbWKXgg+Ey+/4CYOV+tg7xI4u/9ENfIGSOYKmdQEbBCgms
	rHTZxwHmFv+nT5HZA0KTpyIMwBV+bhrzC15Hjhh1O6CuDgUymeXLDTAQ
X-Gm-Gg: AYBFou3IECSmN+95FLzIaTdEKkEo0xGiiUDrmiqI+lEnr5h9RyOdPS7aHsM8imqT9Ou
	0qiFP3pQpPmK0GBSgS0mrCqRHSoqQf0Zv6+wr0nG1025YxT6uPZDUEMp9SSJb9uhbK4jfcua+nd
	8PeoDWTwet/tkXK2ox0VHbtaT6GBt7Kr2ipH7n1MPDHAXglUt20mi0Cb2sL5SifjBK3umBQ4CX0
	ODXRbhEWDU5NyowVjUPju0In3z6JAP2+sLnjcran+vg0XZqoFdvUfIAA0aHVcgVA65jIY5JDpc1
	bAApJDB0M60bD95zWW2ybCLWH3MFJ3ra/BUoXTHpoXUXCkVGU8C1vtBKBl3VWers6jlbuiR8MKW
	r2VucO3q5PyRMxMJLjacVGlSDyyNTAL7OqTF1bLyi7r0ZCR9Hsge1j5v+eprK/C5kxQndRJB+4y
	VANE4PAf0nMbsOOQEkP4iy+pn9kxApiAunAPtGlEzzxdbXn32GuZBPtl3t7ozZAZItdT+ePUwHP
	yFkCZyMU0gBVDVVdViPlbxS701wNRv/wxb91SPq64fU0b6yzTdS6Rnh17WIIMvRX5ds
X-Received: by 2002:a05:701b:2059:10b0:16e:c820:b20d with SMTP id a92af1059eb24-195c02759b3mr2129883c88.5.1792741728538;
        Fri, 23 Oct 2026 00:48:48 -0700 (PDT)
Received: from Mac.lan ([45.112.71.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm8402854c88.19.2026.10.23.00.48.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 00:48:47 -0700 (PDT)
From: Kanishka Chakraborty <kanishka.developer@gmail.com>
To: kamal.wadhwa@oss.qualcomm.com,
	maulik.shah@oss.qualcomm.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address reads and use it for rpmh-regulators
Date: Fri, 23 Oct 2026 13:18:38 +0530
Message-ID: <20261023074838.29254-1-kanishka.developer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
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

Hi,

with this series in v7.3, SM7150 (Snapdragon 732G, Xiaomi Redmi Note 10
Pro) no longer boots. SM7150 support is not upstream yet; I am running
v7.3 with the sm7150-mainline patches on top, but the problem looks
independent of that and may affect other SoCs with older RSCs.

Symptom: the boot stops around the time the RPMh regulators register.
The display (left on by the bootloader) goes grey at that point and the
initramfs never runs, while the kernel apparently keeps running (the
watchdog keeps being serviced). The v7.1-based sm7150-mainline tree
boots fine on the same device with the same DT.

What I checked:

- Reverting 09d99ff7fc3c ("regulator: qcom-rpmh: readback
  voltage/bypass/mode set during bootup") and its follow-up 216e8873bc80
  ("regulator: qcom-rpmh: Fix coding style issues") makes v7.3 boot.

- A log-only variant that still issues every rpmh_read() but throws the
  results away (vreg->mode, bypassed and voltage_selector restored to the
  pre-readback defaults) hangs exactly the same way. So issuing the reads
  is enough to break it, independent of what is done with the values.
  I couldn't capture the per-read log lines: the display dies at that
  point and the boot never gets far enough for USB or a log.

- The apps RSC here reports RSC_DRV_ID = 0x00010100, i.e. version 1.1.
  rpmh-rsc only describes the v2.7 and v3.0 register layouts and uses the
  v2.7 one for everything below 3.0, so on this RSC the read path writes
  CMD_MSGID without the write bit and later reads RESP_DATA at the v2.7
  offset. This SoC has two active-only TCSes.

I don't know whether read requests are supported on RSC v1.x at all, or
only need a different register layout there. Would it make sense to only
issue reads on RSCs known to support them, and let rpmh_read() return
-EOPNOTSUPP otherwise, so the regulator driver falls back to the old
behaviour?

I'm happy to test patches or collect more data on this device.

Thanks,
Kanishka

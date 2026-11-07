Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044510;
	b=X/TipUX4U2I0LqE08pwvT9SMe2hQ6S6opd573A2iyFC/9+EZqlotljxBwtRjUuaxjNlr
	 UTFvA/iBdAUoeYhWdZBVJ9EWZmP0X544wAyQ5j+4Eji9M+zhEDHIBDeGr2obLdMyBXtFz
	 JpVQlhhKoDmwYMWZ67ujtMhq+wUGdB1692Ngii5SoOXSuU1OcjBTVfxlO3tRS6WFCiopW
	 JZvq+VY/EBqefPK8UujPEVjWg9cNlernxAbwruxiDusSg+4E66S2johD0dArtWwunkd75
	 W/z184MEz/i44ma8mRf29Vmp6cYgcWEjxg5z1Y5jWIJ9FyItZHMBwRp8BjWAkEJDq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
	b=gkonOBbPQPyP5vI+7DhFdY6UU5+bV5iQtjBUFtBdfoSziKPOSGBRJ97YiUZsQzXRprfu
	 FoEZY0miW7XjvLyd6phIyrzSExosmWFfTc8nX2YBTVVV4U39kK+HENzDwe+pvIX5I6E4E
	 J2RARnJMaF61Ry6hHA8WPUKsUp9pksqK/FFa513dVrP8f2VO3OnygbmOTrSJ8szxjraUz
	 GdckRLNpp2eKri2qb2amcQW4G7pwDrlKxWHD8VaGlq9aVHtBtl/6Z7aFdcHrTyPknUyra
	 UQogSqzuqgSu7QFjw7GHbdVpmc0YUzthHT8XUPsl9xO2eg4J9FLHumPt3XADM48D3aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EA606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 09:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so1980197eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044509; x=1794649309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=wTHFVLQ7lIK8cCXieQb/LiXf/TGXT18n+melB6SbVAQtrewoWsMtNSpaRRmmiyMWeK
         J3e1fUnsbEP8O9GbYUo/qnOn+pBmltZ7VSr9piae9TDTbJrU0jQtR+beThqNBizI/sA6
         GrGAgLSo7K14uD7iFbhCW7sLyanqbul+D2aVIhub9Dlv4Gw0XlaeZpopOALiqhKx9cnl
         7DUFH2VjVXCWm4pRAyltmscVNmpz7xeYGdQK85CU8Wjjb+9KqXahF7I3lWNkBWZ0ec7r
         Pmbmb8PjauMHCuqDUm/s/EmQu0qje812wBNU/IdF3mizlDBgEvAWH308u0N/VyaWT37k
         fvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044509; x=1794649309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=ltmHa+kQ42l9Ou6r/tXHk+b1r0xqku+eMMT4Lo0OcaXeN6U18yvNggljuZH8rQWsb8
         8be3PLCW4KSpSkbqJE9gjXYVvdXjckmtwTtMXMe0L8P4kP947l1OC1Zr3cyS0FqtIJB0
         N2ER50CKuszaotQR1EeRnU7AE3NsWhy0XaHNZovcnB9b1cPwudzYbxCIEc58fp5g4QqE
         /9m2z7eTK4PFrMvG/eYDHrvqK8wolZzBlvZHnwsYw1em69RXGncUy5PmZ36QBMTp2LcG
         1yUm2N/n68ixoxVA89bIMDra96KLrBMHsK85iL0hDZia7gJ0wcQyTBjPpgA/FzhF2kQC
         Lufg==
X-Forwarded-Encrypted: i=1; AKwUvBwgL366kdzErJhHxtIdATqnWYr0ojbrTibA9HdOXPumjaCCSWWqt45tE2NPK/ZoBJOe/sioLHjQZKXG3/Zq@vger.kernel.org
X-Gm-Message-State: APuU4Z/WAZf1z4/Rox20Sjg1mxdrDnCO31gJOZw+/D5QvQbpYqqIO3xs
	9Tjo2/a6cbeJxU4CHqJoBfoEEDJkADRYnGEH+S4VLICBnpkcU2ECSEyKar+O0BvwaUQ=
X-Gm-Gg: AYBFou3J6ryXNu9pIrDg1KVOEIp4UkQAEekqsyT0rawxsmHmvGwrEnDQJvK1RZwxlaA
	+84sBwJ4RJTNQBNqJbesh8lC+bGILPpE0lldyGyLUwsAC7uLQzYrqpB6H412O4Ac0htOlYaEkLS
	WIdBnxpMKelVLGp877a2ZJb90HoTtWGZ5Un0usmPTTXuB6BwclsparMqaFjmusMsVm7MZfwXv61
	xsQ3rez1O3iUYv3BXYA0DYu+s2GyXEmQmWBQ13srPtfQUz8Zddb1kFDP3fdvEaJVzx+0FssenHZ
	5v4Vs7VJ9L1DxMxQNBOm3RcXATlhd30hnJabAWIQ+fvBb0Gfz+8BLtm9asWDKLy0WmMljWHFv6r
	SQHvUEFH5LzNBFVH6Az1fC4SXUQsnQAsJtyTujf+VhVazh9PVF8iZeKn5ouiC7X/DwX21kF6gDX
	G92BgsLQeRuCpDiKVKQQ9Vxz1b5FJwlHRmXNwdDIFm45BFQoMmNadpfgXtKCpV96hgaNqfjKhws
	tnZ90JImymRsi4wD40ZpRGythGkSvsYyanz6Cy9UVoCNaE1jntlEba59eipcsfE+Ar3FfJ25bbw
	NT7ngxkP2NnHxWltPkdVpj+EgU8yo6FU0gWxjdDSiXt4uHPLtH23D3ypPkg0OqWy9FaPCXmbtVd
	+TZDCVKCQnkvongc1gk3d1W2VpCcruOmrDx+lBcqk
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr6744419eec.18.1794044508755;
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm12554457eec.21.2026.11.07.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] soundwire: Fix Critical and High issues reported by Sashiko
Date: Sat,  7 Nov 2026 18:41:40 +0900
Message-ID: <20261107094140.3951536-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

On a Dell Latitude 9420 (Tiger Lake, SOF IPC3, sof_sdw with rt711-sdca
on link 0, two rt1316 on links 1 and 2 that are aggregated into one
Speaker stream, and rt714 on link 3), I tested this series on top of
soundwire next at commit afd88e7ad781. Only patches 1-4 run on this
machine. The intel_ace2x and qcom patches are not exercised here.

With and without the series:
- all four peripherals attach at boot
- playback and capture work on every endpoint
- 40 start/stop cycles of the multi-link Speaker stream (10 of them
  after the links had runtime suspended), all links streaming at the
  same time, and Jack Out start/stop while Speaker was playing all
  passed
- ALSA pcm-test: 24 pass, 0 fail
- the dev-properties, dp0 and dpN sysfs attributes of all four
  peripherals read back identical (the words arrays are empty on these
  codecs, so only the trailing newline goes through the changed code)

With the series, s2idle with Speaker playback and Microphone capture
running: all four peripherals were attached again after resume, both
streams continued after aplay/arecord re-prepared them, and playback and
capture on every endpoint still worked. There were no SoundWire or SOF
kernel messages. I did not run the same s2idle test without the series.

These runs only take the normal paths, so the failure cases that
patches 3 and 4 guard against were not hit.

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

I am sending Tested-by on patches 1-4 only, in replies to those
patches.

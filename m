Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281798;
	b=Mg5bKrf3RmZ+88bVhNYpHlzhoeFfqUVrUDaANVD9oDSJ8oe+dYsJMfxB2uJ9N2WFeca9
	 v54ff/Ajnp6e5oHsbChZ6y7N6qscFnQjEtLGZt2AuR1CMMXemgBqyXqBFXYUsqt56eSsU
	 ZoEG2t5DCPPFhNtG48jIoAkDH5I/RjC4TW2ogSJhpj64UP1GgVwQOghlRwGZFOyWJeKdY
	 oL06bN5YKtggfAcN4DgrW8imwOEIx5w/tKADHo8B7vloeuAeeSF6w14dy0ghCoILJch50
	 FHhf5I8VzLvBxjKDoV3a1t3rF5wkwi1R1cOYhl0s9KlCQTRyMSyY7O/ptBxjCsTWS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
	b=ULbPV5ASKTowRYWSXc81TiAZ5QjD/y4J5rHDzcmf79qj2jmq8btvTvlMKFwaMVa94Psy
	 t03Zfri/u/15LzpV5DigGkBQGWylOD5ekYzElRYjX+6/FOzuOvXxqwgeRquqLo/7t89mj
	 Z7+Wp6CgdFRo8sq04/dkOOWgoYvsTJEdfvimJSilH2zaHy4xVgQw19hXWiiMUKbareYFn
	 AueZLW55fDHtlkuMOd84BWIXPSLgxvwrDVJU9LCGQ/PjijwpRENBYwaKd1khdmetTVDnY
	 /rgHtdF8sPU7eZ2kniAhTNys11TmbQWkpiMvGWq0JvA1/8rvXIe0z/cqCOIwI4yBVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7FF606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so4145540eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281797; x=1795886597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=lRO3qt6jwuQ3jetshv02wRrSxpRYrXbQXzoajLn1J3Yq4k7u8wVbh9XMq1yJERTZ1l
         qiCgHYN+rxXKDOy1LND+/FqW4GmTY38yOVM5JL8YETrPyQQMX5wG3Ul/MSRJ+eDEdOhw
         mH800/ng44G2LwJlv36HaBwMHsHe6lC0axjitMuLP9OHU3NHlOMkrg4lsG8vq1RfCaud
         ZtMI1aJf0mWvPmS6D+S1FX4VZI3tHzWY4JB8U87wGleiLvZkrbb5ukzrEvj9WUKaA5Ba
         +BIb3OfAn99n65WsQbbn4CcVIIhF8IWQzGPrUUykZwRfFn1oKNBzyd1rt16hBSfHAa4/
         uSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281797; x=1795886597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=HCOb3nXA2ympjhvT4U/o2cOnARYUhKxAKb2+cJ7yd7aUVFosNuKGdgG8zfUF5xZpAW
         b4LWgnm2hYeW9A5qMXIYBitJB0dO5yqYE325u2y+K4XkkRXAQ0OFIbC4+qkgqNT5xJ7J
         0QRU7nFwm2xoZ+bNMuA5Rd8hRXXbjAfj8c7QmX87Wuw+H9d4ptd1n+6E1l0EsRqtavCO
         dh7FFZxChXBLGkV4FiC6DwTNNl4a9+w88+6h+q/0N6IfG+2Enl3xlqfzMRCgaN83J1oO
         roooD8neAX1OoEW5OHyzefwmQ/MPBuLLnRQCKxL2tmc897MxNYKMuexT6ynHaqpokKIH
         e/wA==
X-Forwarded-Encrypted: i=1; AL+hErFQ82ADg7jpQGHbWr2hiF+jdkaQ1ImOd/ID6W/6bRg30pyX/WROEipM/yLk4RqK1+VSFdATRgP1r8AY6/Hp@vger.kernel.org
X-Gm-Message-State: APuU4Z/z2KSML9Fush5lrPb3BWPYYBWOURUo4r5vjoMiVLGPgtaNv3p5
	YpOM7MihSetsWX30m8a5jweW+qUlziYnGFQHSCURFOb3gD5ieswiJdFq
X-Gm-Gg: AZFdTZezfwQhIIXT3NYDyQhiBQMIjhzlb3h24smPL8KaPTAqLywN6VamgX6zzfLiWeW
	tXvZY4vXPuSgTLwZDT0+6pnwB8iOI2DDmwH77m8P2o828AOhoZIC06BN+6ACI5GGSeDEpnk9gbm
	J0etjUTIvnoQ9UsG1Ev4BaEQirsPsjRRmJCdeAYmXi0simiJTmdig+kLnFIp07iCHAauvBxuWXD
	HvNEy5euJ/iu3L2ArEDzYuwn21dCj2E7Q/9c2CJ7cyHGP9w0o7LRfEKSDuqsL1E22ts9Y7ItEs0
	/TJCIs5nEmIk7XTh+FpY3yDQtVjLOSWX1A7D4KAhVHYWKQV526jQu79RMDD+UANFAKh4xRLzAyL
	upHDd1F0jknbJGB2+DC/P0PeYPu5PBt0dfEKhMppmjwXcai0l6uHd+A9uRNoczsriys1inWqetJ
	p/V8ZQvn7QApJYzjGokosq307LfYUHNYArgAyA9gFkS2U1smj0C6RhnYDfjqxe7xF8YaflsouBV
	ZodqiXHaCWnXn5qRZI3FVO1f2ViCuVK4WwJWaCuz6l9/JnplaXHminouqMHsYcEiSXO08xLbcUs
	Kdub60RTxJCukiHZwE0KSYckxj6hrrAo3LUe
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr6879077eec.28.1795281796821;
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm22413703eec.26.2026.11.21.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
Date: Sun, 22 Nov 2026 02:23:13 +0900
Message-ID: <20261121172313.812-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com> <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
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

On Fri, Nov 20, 2026 at 09:23:10PM +0530, Venkat Yadlapati wrote:
> Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
> DSI0, connect it to the INTF2 output of the display processor and feed
> the PHY's byte and pixel clocks to the display clock controller.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), whose dual-DSI
panel uses both links, with a board DT that is not upstream yet. Both
DSI hosts bind, and the panel works after boot, after a display
blank/unblank and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)

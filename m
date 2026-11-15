Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703711;
	b=DO4rINAoxn6mOsfqhNiiplek1pwczrCaiTuy2BCBur3evEhGAHcRDaW/dg1NPOfYkdDi
	 HLM9kLj1pn4dFgYDwuNGTNGxkf6enlswoiV3Om5VoDTD5U1L4nlwH9q5WwgbJ+Fo/bGxu
	 UhdBYQHIOmLjPRyZ1FcRI5hDpMachX9JpbbJATj9MpwnsIrCUPDgrjyn2rQ2B/COhacFQ
	 mJwg6P2XA/qHEVwPrnjr/uKv04aE4zlFslP76Uf6XN3v6boHaw6q4pnvNQ2gV4pvLgE0E
	 MdyAK3w/Z2HBP72O8py/sJlYAM7mAyS3IZxNfceDcFSLxTk85y54IKKvzvdTkasKMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
	b=yognXJ0EaL/G9OQ0dmRxNKQ6pEM2AXL5rFnyhIXVPJBZSlu+el35kFAb8pdcTSruowZ8
	 8mATEds9FJ48IB3aCJjcIiWyuHTS2jDfo4BesUwPU5qBFCHvnBkOtCyAABeJwkI+D6ve1
	 gpRWyyUoGGRLINNkDzKU7opMDNLeWmmhHMySsxweqsP8v491UJ8fzSYdMjH+Y2bwE8xvt
	 7eE2S/00yAjTQ6CUeLdKWiEpONywOsbjaYyCQ47zv8g+JkMls0ajUHkIZIF444Y19bAYJ
	 LKcZTeYV0JG4Kw9Es56PfpjUHrsN9lgVQrLJAAsNe55uqU1FMe3MFFQORx+dSj9NEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A2D606A327
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so2978344a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703709; x=1795308509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=DMcqLdbVjGQlExaBwxojv82/j1Te2Q8Gs0X17+IG0qyDhCFq+1Nt0dCxNncZ0loGmW
         ZfI5Ao6vE177C6wnSiZfUM7gpK6TuV+0KHsIWXhF/pUoR/PEaV8i6FwFa8Va6yqt/LHd
         h4CEm6Y8C0QXmF+mbfPCvi3DAy7buSqHon2Fx7W1oNtPLWQF4dvDeGIiU8u6lhB8Pti+
         pTIgV5tBB/eUMPJUVssMgjiqdsIAR0Wbd0u+0ec3qtj9TxZyDqlxy9VfCEv1GId/mNun
         1Mml1QtgowP/lu9GKK8iFct9z8Y0WG9Rl7uCqfPiyT2DdUYnrbgZKrSzwm5A3UZj7A82
         ZHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703709; x=1795308509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=fXwvttwoPaBwql/MHAmDK3e0nGjP5kWs8JuckYdAGTJChbGyyvB/z8ZENPTI08VM0e
         3ForVr2uDxlH6LFmvThtcQ3W6UFTMjc2Sryy+yTUR5KqwwZYDlC21k8/sKPBsBkFC9KB
         mTVYtyh3WFFc9+acJ6qWx0MJe70QyY0G4iCSM0RDmZjXHvY38ewfr/Vh8IczZHmSBamb
         2qs838yYMEJXH+Ni+HOWLLMO7rSJZE6iCOeXUZsK0L1glWQ1I41Zqf/OqLYHhWib9CaJ
         Up+lJSgz3b1V3Q2ytA417DAa5a+r4ba7kvy/3I97pUt5nc8z4UizaYrucnIsiL0YQmc0
         4hOg==
X-Forwarded-Encrypted: i=1; AL+hErERb7M/TYlJZgkPGrKEGmZKP2OuZlAkNcq5smU8rbRnQSCSwE0i4S5imsMdPfBnNXCGE/KHeErj7HBvFIWF@vger.kernel.org
X-Gm-Message-State: APuU4Z+s1lXUxstvR5vJhi1PS+T0uT6pjgxA/hR1dORRCfGhQzf27rpZ
	3QlBn1RGP/7aE03QAZCWXiooZi5bmczk4oXWuDpKcWcLAfBOJ6utzZU=
X-Gm-Gg: AYBFou1udOX1vPCO756q7Jhxhq0VCd2MrykeQ1n2WTnz+KDHpfL+Ok2D2KbPT+a/UZi
	Y5t4OOcrzf80w6fKD8JneK+ufO4eOJ7+1W0hB0PtNNjdGUiU2SH19nbe2jqa8FlSiOqFpZkH3KG
	NNVbuIN0Bk5NQnyFBrL8RT2Qf6YgJq+jo4EZ9Kf87hP4MIaZq4lTlb85J6cMOhMOntLX02G0rCn
	UhusZi0eMl6OicJ6n1Z5QxW9/XEMkheBdT2wfrLk379BY7w/PpxNWtvgIGBxriMsLdpGJQh+h00
	QfXt1jNyWJuBubmHLoQYXUPkIzz++ZaGv8ITSim1G8yw9XKttiWl6xY2uA04IdtjaWgLdNSj0qK
	2S6aumUK/ujabfpvbdyJ4jq5NgsWj2fPURFRxx8JsPv7C11AnadIttm7rciXA/N8HTpRaaLrbUt
	LZHamzfr6J/ucfWh7toLDHbLSbyQFidBgg5Z1pmpZzEX79Erld7J+SYhuelBQuRgjP67/Nc0utY
	zhjv6iCBbvkysx+pbFaeJlzHtUsibKJS1v/EJCHbvj8nLt+RIugAV607Y8o/e0hgvDd5EMjV+0t
	jlyFuUkv4g9mhOeQCyTIH1xZIabexrdgII1taoeEzt3enmwPxSde9PtB3h/qlSAGsuxUPNA+z0f
	Im+qrOJ/TBNVR8xhCSvaZuWTmX4txMw3VzKQH
X-Received: by 2002:a05:6402:a513:10b0:6b5:6ba3:5860 with SMTP id 4fb4d7f45d1cf-6b7c0c12b08mr3317211a12.17.1794703709333;
        Sat, 14 Nov 2026 16:48:29 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm2857574a12.23.2026.11.14.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:48:28 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: admin@mswin.me
Cc: konradybcio@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	amitk@kernel.org,
	thara.gopinath@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature sensing
Date: Sun, 15 Nov 2026 01:48:24 +0100
Message-ID: <20261115004824.395133-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
References: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
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

Hi Roman,

On 16.09.2026 10:16, Roman Linev wrote:
> cpu4..cpu7 are the downstream cpu-1-{0..3} cluster
> sensors: they get #cooling-cells and per-CPU passive cooling maps, which
> stay inert until a cpufreq driver registers cooling devices.

I have been running the same TSENS description on a Mi A3 (laurel-sprout),
derived independently from the downstream trinket DT: same TM/SROT
addresses, 16 sensors, SPI 275/190 and the same sensor map. It currently
runs on next-20261113 and the zones read sane values.

I also have cpufreq-hw and CPU idle states for SM6125 working on that
phone, which is the piece your cooling maps are waiting for. I just sent
them as "[PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle
states" (you are on Cc) and left #cooling-cells out so that it does not
conflict with your patch 2/2.

I could only find v2 as a reply inside the v1 thread, without reviews
since. Did I miss a standalone posting? If not, it may be worth resending
it as its own series so that it gets picked up. Either way I will test the
latest version on my phone and reply with a Tested-by.

Thanks,
Majid

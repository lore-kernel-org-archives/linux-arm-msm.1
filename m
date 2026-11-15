Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705773;
	b=sKNLqUmemdphYbaY+D5XK7jFXY32joBjPWS8Mo7dJ0v99TzpzEIBiiMNp6Dyfw0kaZ6w
	 RtBeAMmm2g1HYZjrKs/FixIxNcIChSd5SbO0usDPbBh9VSU1kbJx2kARHyqSjZFByskl+
	 xDhoXCGPBV0tVD1T8FqV6hT0fYJIUmi+UKwFoScevj8Cg/dpbqijjjcFFB5J6bdtAaUJD
	 yUrP6ZaB+IB0cK6L3r9iwhQwE3T9FEEASzHuAsWWylzynohOsAjwhworaV1L/pdpMfufr
	 t8wzpDsOcrKwuxUjQv2pQbMZuzoyPAKCe2DLFtNb7M5RTXz2RZ2ebAW2AKXaKyC35HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
	b=Mgd1EDy1hOLwi6GjRC0uWPd+EbWyajG024AwNt44fcIOpk/ixNPVAUoVyavH43tkkwqf
	 8N+qOMuHVkf0aKymQmCdUhhfkOXoY/5GKQXeCIuGbaEnf1lL9bQ2c7dH+Uu256d2Faiy6
	 zvcH0+euNbsPo3wUoyronSI5wprCCiNeZiW8BcB0UTFMiwFrH+CGJ8/rJq+knMpnQwshx
	 53nQOdOk8kBVoT7tPIGkKrN5385bLa0iwod3QwS8i76cVeXxt9ebkwwgHdwgxqJJlfU5b
	 pt9sRqqsERgC5+Xe1jdFNcG75ohDsD/unX6adM+XEHzjlmHxqRpEc8kwowsZR/okcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03E606A32D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 01:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F03E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so3758542a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705771; x=1795310571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=JXvE48TKiy91S9dvEv9At4IP8YWrv9G85CuWVftuPW0Nm42VDo9KFgSl0Wt6vcS56X
         H/qmdvNli+F431Mg85skwEVk3uZHmXjh03Qi1nriXU+eIVvL33jxebJhCOEYHkhdTzpe
         qqZmE/91d+DfQD6wRraqOOfh+6h/j5NhZExktRhovVugD8/uWjdRZ5edtEdRvQKSbyzS
         f2JkGxlgs18vVYYXWbHFihlv83Ce+ekiPSYHXuNjHYNdv4NqwZegVHcEX7C9VocMT2zZ
         HChWwWqXQwoRrokeuXsOueXT9eKfEoso4m9TOGVYvUa0b1HSABp4Vy3dHtUYsJRq4o7h
         Ty0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705771; x=1795310571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=SUnEQv3FSItQq9NF9o/BZ3H8F54qmmn19ph14Lm5qBSVIgZIY++RXl8wiRyU0+dmNo
         r2MxLDK81LNq8FpiL0uNe6adh9/atMaXg5HdPxQhjbJT3zumVKx/0sucMOPI/lr/Yqvl
         6n+nOX2R2SAodR04OcQ47mqqHHWTCN9GIt/ojV2byrF8pBdH8flDhKPiZYtzBsgVvhxM
         CA+CdR05aWdfN7Bwd50EEn66UVwIFNcsva4mFi7tx/92uxxjkW573jSid2zJmpRJNtlS
         hTdZjxZSV9BUVoOeURnVVfVe30/7fBbxq9DZpK0dL53hAN9xBPXqnRB5B6x5e8+Hl37e
         O+jQ==
X-Forwarded-Encrypted: i=1; AL+hErFfC3fi/tpGRqRyto0p/csxpthKuAeHa5o20WRuT5uIKyfMBQ8R+OcCaFMZkpSoBjaufpI2aNbLXJi2E8xy@vger.kernel.org
X-Gm-Message-State: APuU4Z9LmKxx10TgVZwt9KUUP9ubNJY0J1/K4TQNhyjB+hy0Rrii8azu
	semNtUYpNKg5dN63bWu6HUNs+4sLINIY7s9kRIKR6X5KKjf5IuvyZqs=
X-Gm-Gg: AYBFou098undDpxdR3RkXe0atMKjHPjj6KBOxQrNMiCaWig3UVAEYhUHrb7VVL3/Zdv
	XOkx0EByxytLMGWS3EXBxozkpSYdfffAsq/8bfXtDLDAeX2p+GgsuF7R4M1vVslSChepcn7CoJv
	bEsH98WlglUMNNtcem9UhnCGA9c5kEFAg+He/+SbJxaDFxf/k8Iv0IIEPLIJZwXJsH73WsIpbl8
	8yLoC1nQT/va+JfNvMvdwI0GVe4VpvBvl3A+DAl1S0/OOJEcczpG9CxPaUj1n5Uw0Wc77Mjsc4T
	yxa5TfoT1+mT0TDL3hE8VP5a/co9ImoYGJRgePTtS7ve8zNieNeLx4MmNateE7+ISifxk1B4v7h
	KR1BmM95zO81kFXHUssycvSC15g0cO9eKz1QyhL9/wPKaghDvCO6jwfQuZvxoTW+6I3F2i+iMRC
	yLKQu7uKOl3a5Suu17guKUDwWXM7wHDm6Q1sDn27r/oEKkr+CQqZ3SQGeGpd4MJVuiqjcYF0YFU
	6KEJLFVyJcYOrv8tEWPdxQKoo1RZbjOwypTmQv/KWk8oGg4dYaZdrJ3i2H+isMx2aeSQaYcrT0P
	til3jAvOR1RFGO5/n01TeaJhgV7Ffz+5E42LqLz5u+Y0xRx/UP7d+Wu9Dsca1WuNirWY1FfDAl/
	D2oQE3lnqN9fDyCYSJEw6NeNx
X-Received: by 2002:a05:6402:849:b0:6b7:c9d4:6b96 with SMTP id 4fb4d7f45d1cf-6b7c9d47044mr4130497a12.8.1794705771576;
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2636697a12.18.2026.11.14.17.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: val@packett.cool
Cc: marc.lainez@gmail.com,
	luca.weiss@fairphone.com,
	barnabas.czeman@mainlining.org,
	danila@jiaxyga.com,
	sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add driver for Qualcomm QGauge (qcom_qg) fuel gauge
Date: Sun, 15 Nov 2026 02:22:47 +0100
Message-ID: <20261115012247.621144-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
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

Hi Val,

On Thu, 12 Nov 2026 14:07:26 -0300, Val Packett wrote:
> This series adds a driver for the "qgauge" battery fuel gauge
> present in Qualcomm PMICs like PMI632, PM6150, PM7250B, PM2250.
> The PMI632 is used in SDM632, SM6115/SM4250, SM6125 based phones.

I tried v1 on an SM6125 phone, a Xiaomi Mi A3 (sm6125-xiaomi-laurel-sprout,
PMI632), on top of next-20261113. Board side: the node enabled with
monitored-battery (simple-battery with the OCV table from the stock
profile), io-channels = <&pmi632_adc ADC5_BAT_THERM_100K_PU> as
"batt-therm" and power-supplies = <&pmi632_typec>.

It probes without any kernel log output and reports sane values:

  capacity            66
  voltage_now         3979548   (vbat_sns from the ADC: 3.98 V)
  voltage_avg         3979937
  current_now         -72631
  temp                297       (SoC TSENS zones: 29-30 C)
  charge_full         4048000   (design 4030000, so the SDAM read works)
  health              Good
  status              Charging

Two things I noticed:

- voltage_ocv returns -ENODATA ("No data available") while capacity is
  reported at the same time. Is that intended, e.g. the PON OCV being
  used for capacity but not exposed?

- status is derived only from power_supply_am_i_supplied(), so it says
  Charging whenever USB is connected. On my phone the charger float
  voltage is limited to 3.96 V with a local patch and the battery sits at
  3.98 V, so current_now stays at about -70 mA (discharging) while status
  reads Charging. I would expect the same once a battery is full. Would
  it make sense to report Not charging / Full based on the current?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # sm6125-xiaomi-laurel-sprout

Happy to test v2 as well.

Thanks,
Majid

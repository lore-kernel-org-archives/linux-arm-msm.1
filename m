Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52191542EF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921217; cv=none; b=V5C4Pd3I7zVmyTvTBoB8pDKRW1R59eMb3HR1xbYfREzCTYtxTgb7Nk1WYVmQ18RsJeWBowsQjozhx3EwZ+6VcpYJ2lurxY6VnUvH0CnVfcWWW4jCP0+YMRqVXlITFAEX6tyY5ER+auWo9dQb+Salrzszji2ht36KPvf7LV1D5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921217; c=relaxed/simple;
	bh=9X+B3VzuP6c2+GbMDzQKaInOmGWlAa6Crsdlsjiub+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOXdKIhCmaVI4kRojfLmIpP9RNq0HTISXt/5e/9LU1XNJxEsSD2ta9h8PsaeT2PAOxv3pAbfLUEzTvxFO7YOe+h+Rj7FIPPZKA1nH1POpQeKikXDmwIrCFI0g2FOM2g2UnLqgDm/wB5paQbGgZ9dp5KDchiR2H58LK8v8mWolrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=EPUCk5Vh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="EPUCk5Vh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9178d514951so30567406d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791921214; x=1792526014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcBu6oPAez1ljZeSMUFIBe+d1rm2GYp83jcwBgf/ZWA=;
        b=EPUCk5VhzC4xZLPu5RJNFkGJNQIaQGlNdADxDxWxR//Q6VGL5HifvRB4F1j3YoqkIO
         D997XkDKGrvbKBkYRhUaDKBlUsJKe3qweZTasPrGov7LJl6T9VnlZ/jVEL3do5ifowEv
         KFFBa3pDn/YlhqbEdcjCbEbwnQAYj1+yfWPEn6L6CDGymP5DPD3zhoRoqvLcgCmEBvSW
         6fqfOsaR0+AOsXCEIIGG7hdUpfMQPJ8BTW+dXRpg266MqkkZ0wmvoV7/Q2/4++21uc1S
         vBq7Wsoi5aVZFMUOpNeRoHGu7kvF3OoQIT0d4xY1dE/HBSO7RL9fVox9wAAAgDxo/q9F
         FSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921214; x=1792526014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcBu6oPAez1ljZeSMUFIBe+d1rm2GYp83jcwBgf/ZWA=;
        b=Zfod3iI3UmQMIhL3r+gsMT/ldLZWMZKzwkNpLcJVpwJz/v9b5lWN5ncrJN8TWfWGbR
         WJNTVCzMS8UHytZFvCl9Gwe5KzRlCj2AlgBqV7NDjSzVdic9MD6+wEj8XeCqQYk00+vy
         MNXYKblI+xuoiN7Vf3/RoYX2d1ps9oKVWH892WZQU5XlpDdCzuQr+8AnJhACGbFnMd4X
         ZPIRUMouQ6z+mAlzPnS0/1OQ1UpVVgUhvVXAM7DqioE7j5IFPa9b8atW68GuSO0rNkZH
         NAhsAyim5KAOqZ2lTOd/XN9HPOwHSGKFwnv7eUb6k4R6ortcsdY9U6DPRZteygyTr/hH
         GVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJaXkPXDrOphISk5HdKPNfdhpaUTtmVuhzjKwDqFuMIGpYRr3/MR9J5cUNtCxnameHZaxmG1VLx/7k5J4E@vger.kernel.org
X-Gm-Message-State: AFq9FYJzRIg4oZ83bia11dsRYVfMAolrtm8mX6hTIuTm/S9pokehog40
	LrGWKnp61J/JGp1am9+0201ImQ4qIrt2HHPbI2aETPMwvgGX7GWgQxO7fInSVPbAuGs=
X-Gm-Gg: AYBFou3gz9SaG3nh70BT5KM+sopR/Cktv4jllpk4n3ldK2DdJo4cfS0uhy30MD3BWb7
	p6gZhHqvoW0z8rWyJQy0jGtm3DI5P8YTxu15XYpUv8Okss2nisQxajUwJvG28yMNSji4vBw/4lY
	c96LrYYLRzSHmgEapgUP99hFLL+ZE8D2AKd6V4/epMr2PJifwACg8tk/RyN3c25CuNK09nSBUvv
	rF8s6dxwQBCVsIYTfXw4Aigr5ftDhPYK+jKtnk2KvACgtQp4rnqDS3FfTmAMMAJ2RrQg2FHSVt5
	UCEJz8woe8lUhNritVJyXV4diZ4OrlXrWr0eQwivOpbkTCLIHapaECp9CoUrgyPLNXVbaN1t0+2
	cFk/lhhxITJU35jqsWSM4sfwoy6KLqi0Xq1Fg5BrvERCfoVltyHsdq/sfgqLk520EA9mh/rkUFC
	L5epJ6LV5GqP/g86BF1ddiWE6++S90ZBg0fOfJ5TxyBDttZCJnll6NZXtKMHwsmpBQCC0sfA==
X-Received: by 2002:ad4:5fc9:0:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91b8d12bb24mr93591896d6.0.1791921214109;
        Tue, 13 Oct 2026 12:53:34 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a61d:7a00::11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c35bfcsm33085666d6.42.2026.10.13.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:53:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Michael Burch <me@michaelburch.net>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-hardening@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Date: Tue, 13 Oct 2026 15:53:27 -0400
Message-ID: <20261013195327.19571-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013172718.12355-1-me@michaelburch.net>
References: <20261013172718.12355-1-me@michaelburch.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 12:27:16 -0500, Michael Burch wrote:
> These two should be AMUX1_GPIO and AMUX2_GPIO. My unit (BIOS 2.14.0)
> shows what Liviu reported [1]: 0x14c (lpddr5_therm) reads 130.048 C from
> boot on, and that is the value the EC is sent.

Same here, and the ADC1 table settles what my readings left open.
On this unit (also BIOS 2.14.0), with all four GPIO channels defined
in one DTB on a 7.2.6 kernel:

0x14a  38.6 C        0x14c  130.0 C (constant)
0x14b  32.7 C        0x14d   34.7 C

A charger on the left USB-C port warmed 0x14b by 1.6 C in three
minutes; 0x14d stayed within 0.1 C. So usb_charger_left_therm is
AMUX2_GPIO, 0x14b, as your table says; 0x14a reads a board
temperature and warms with the SoC.

> +	sys_therm0: channel@14a {
> +		reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;

One note on the shape: hamoa-pmics.dtsi already defines
channel@14a and channel@14b as pm8550_gpio_01 and pm8550_gpio_02,
with gpio3 and gpio4 in high impedance for them. The EC's io-channels
can reference those two directly; redefining the nodes in the board
file only adds the labels, which the EC node does not need.

Happy to test a v7 with the two channels moved.

Liviu

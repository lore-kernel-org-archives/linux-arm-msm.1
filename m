Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657128;
	b=wGDFWpil3jlOsn66X4R+eAdBeieBicrVBUsjn6e/OcPeiLFpXBVkkxmjLLb6fGHW9K2l
	 2DPTGMC9Q3QH5EwISGxh84XMtmEduAIuocl+ve8rZ26yacHHpoQyCwtiXBHBOXooqvPh5
	 kRm2hIHUP6KQd/YAK1j/hE8IrTKDPlGEB57Rm0YxGtlhqv+tooAtZH0N+Qg72W1VaIONA
	 m4ekZBhI4NTEBRI4K2cZmWmNymf9OcTNh54scPLiawbBKTHsS3vvTRPwyOp8HNRSlIjUU
	 8V7elon6DnQ8zXHgGj9rRMYipsSHjCqrLGv/zM5obL1/yW5A4gNTqIISSMZIQh3/vxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
	b=3/4yjCwhlwCT/HAixbEyOo/F27Ew865U6wrfpYLngrVLVZ68KS0Ywl0T5cDqgM9tPsIr
	 n3ePdeFyvS/5xTcYuG9c/RUWCZdC5HPb7+iyHiAtX4QWuj3SIMupWksE0oASghKVl2FNX
	 +Fi97GorYrwBic+vNcKm2YuwY+pdjKz8GExIrx34nUXki7TO5wdhQo5qsTLSdGXAtxLFz
	 nOQ1Rtoi7z2HsovBMXbr2Y2sS2kTglO1dTo0Isqu9Awdnkms1YGaT10UGJPC+p+03HIUE
	 biFj7dI9ZbQxxsNQF1ZcfFBDHfmWSFU/BhttmoC9nZ3OfU0NmaRMTJ0c7CYhgcosJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A99606D811
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A99606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so6476034eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657127; x=1794261927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=O99SkEkGgX+yDaEspfPEBwygqQ8yh0ngcnnm/iplfx2/07xIvSVgCWc2jc1qSkcnwO
         jwtCw1qWTsbouhE1lPeROQ3bJgD/8puj6J3ZcZehM7KiNfcNo5a15Ea1Tn+iKWQN0xcC
         SVz0yHWR9XOgcrbepl4xvqGN0g4RpL1+2S5tarjVZ127Q6+qaBy9dPX3zPa8fFvAvtMm
         klf9k68dSi0CUQizgOk+OWsodAUtoJTSo47meAdeX/9NRKcji9hdhBcZyU3a7b35XVVY
         DH9AisRVVfLhfy/udG35z2389KxygGWgIF/3F/JYdd2ks6xjup4RnAYhSiRQqnJHS7/G
         9PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657127; x=1794261927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=oXBC1xr4cw+X3gLb1VzAEGTtg8WUblJk/v4al7bWF+PlOP9xP8/9cYQ0hCJQ6VnsVg
         Z/Cyp5uiTGNkKj7WzLaZXjT29XocdLrBC0hXjoKZatIPwV9Ukg7uqOgI3Ydhg4lprp/A
         i1Bln+LKCPweMc1RO7jw13sjCEjFJTbd0qG/b1tLkEtgATb61Ajv/6yG8lqujsNgoEoK
         0Nn79MvYb4Rsj3dRJO1Nd7j2kw7F7gkhuJl20NAxHzKy53s3zpJrjz2yfJIuKg/KQ0dA
         r102UdaAMBol1yuhsXCLqvPNPVbMJ6/twJe+wPKT2C0FJ1UGUBhdb2OZGLOiifgsSFwD
         6zJA==
X-Forwarded-Encrypted: i=1; AKwUvBz6quV8epve3KDSaDt6EGKJ2koI4vl5HlMxeXdTgi3KM4k+/eum/0vFxZU/j2OZYLegT9pLAupOurD7y6P2@vger.kernel.org
X-Gm-Message-State: APuU4Z8wtp0UNU5p1xQIz3jl9jXyVWqG6W3QuNHY5N6ABH1hsFLnHnlT
	jckEBf3QAYE2BchnhqWtRF7QnW6HI8plGYYcrdGDJu0xYR+aiMEh5Tg/
X-Gm-Gg: AYBFou19CWoFhG6b6KgbG0K5eaOc0irAlm7cjgSCAz6XuSLhZjg0y+5R5D2DWgBFKfU
	Y0huk2uuxAYsoUU/gMW+fhICZoqnsNu169A86XPhCU3EJobhfHitC21tI/9fzIH8WLjvjFynbB2
	wXVzFxmOqEapDJ4v2Zk5dpZxUXvAk6HEGJZLuY7kdPOzmOoLGcBbuMvWDZihZjp/VBZV3aiCqb6
	8VL2diN28tq8f0AmKGX6Hon1AsH1Kjj2lMJwhpUoZYXv+BsOi30SDoMWczsvRWbvbqyi7omRa12
	NXcvvpN381yr+FfxIrN+pLSZ13X2MGFzAOSznZEahuxG9sY85S2OPx1Dtu3OGPYHiyd8oJve9J4
	RjxVhwU4TT4mUEl83VfptSHYZJ9zXkhpoSai9SBzZv5dcgcd3GDwlLbwlbDofFllvQaZLcnt/I5
	oPeMB3v8iICI6c5lJAdonpdQwBOvvnS0UX3s4ykSHB5tX9bwh+a+WbyM2/GtIqH+l+QmICwKaj/
	k3oJLZuOXWFwBkw7qtHrkQi/bgSwFU+x/uo86x3BeMnWODF2P/YHKFA6kh9xKeroFC0zjCPYfm5
	nA9qiMyNS6sf+VTxHI0cpnyvTvpG2y6H7xKSpWNlPP7Y
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr20683512eec.27.1793657127005;
        Mon, 02 Nov 2026 14:05:27 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38470009eec.19.2026.11.02.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:26 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion during power-off
Date: Tue,  3 Nov 2026 07:05:26 +0900
Message-ID: <20261102220526.1755-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com> <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vishnu,

Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
(TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
right after a decode session. rmmod waited in __synchronize_irq(),
and the iris IRQ thread in iris_hfi_isr_handler() waited for
core->lock. A loop of decode, rmmod and modprobe reproduced it in
round 4 of 20.

With both patches on v7.3 and out-of-tree Kaanapali support, the same
loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
HEVC and VP9 decodes still matched software decoding.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali

One question. While core->lock is dropped around disable_irq(), some
callers take core->lock directly rather than through
iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
iris_set_clocks() and iris_set_interconnects(). These are not held off
by irq_disabling. Also, in iris_core_deinit() the firmware is already
unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
that window meant to be safe?

Thanks,
Joonhoe Kim

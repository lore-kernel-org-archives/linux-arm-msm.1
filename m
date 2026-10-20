Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510671;
	b=assFRB0N2a75Qa6C4doE3gFZaRv2p7uSFRv/6efuXSxCWF+xC5D6LsocbJCWcRHp69sD
	 Tvqvjz0fNbePI3oCiCSzTysInBRKyDmUaV3GDVAG/n7dEOSH35jhCQ1mgB7a9L5hOXeqA
	 Gisy9gKU/yq8qxWz5dFWjPP2M3ys8FHpYTmjBvi3bh9MSYm8pp4PdA1pgcmG28D8Z+GTx
	 aDLlp7VmCNgbda2d+QFmnK4Pp4I6NYpCCYQm9zKv6dR6Zf/XMyhc15rjCmWzlrfB9Dexl
	 kyWqczJOJalZM/UR23AahWnc5p7MQCvI55RlRW637GGvLx6FL1vS1mT835bEqZWmjxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
	b=vLvpgchwup/Kqei0OZ2jZczGeToJPxE1fVVGHd1pAIW1YVpMSo+zN3d/j6N24qcBfEkj
	 jIIq8lhUgP0F6Ke5GlMe/BVA6kS6e68pdS1Oi7p/KTjnxXEoarInRrm02AxqQ/kfV0O9a
	 ImP5ngCfCnWPoReMvOjWgbd7WJ4ue70Pi8liqCso/6/DylXhyHy/8lPV2VlD8K13kknKA
	 V6kJXMjpk8ZuLKXqx6KQJusffamSmcMVwathY6zKlU0jaVYb7QiU7d7plm89Y3eIKVJQw
	 MR+z4LO/v4GEswaSA0LfXGPlhamWe6eWaOjanOb+6wjaUOkGx+DwPxU3NQGnXjOm59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m443Q3Vi;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052EC60A5BDD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052EC60A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m443Q3Vi
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so1165368eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510670; x=1793115470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=m443Q3VirsnJs9uqqDI+na0O19UGS5EaZ553keAkzdj3aqWoobQLnV4UpOZAwDse1U
         4sEglFVvXuewtYfGCs26hcdQOO1F49YoU5QEAdJqMVtltLqo+gd6+UI/Zm9xhB6u2Rx5
         YCAb4i5azbCMtKoCEzpIJTVx6niBrGdFP8Tz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510670; x=1793115470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=iDrFq2iJpPU0Dwg9dHh4imOK9wXv2LxUvlp9ZK/Yl/rLs5wE+8/8kbClFL4w4drPWq
         FwDr9/b9+Z5BcKSI9tCKe1tVY2ygz3Vd/tqwxhnzZmPKjcfnYyNPFzi2Gejou0KKfroi
         ou9nSH6/XbrkiegoAa9tm5Xx2LEmS85KcNjpaEbDfLTU4JY7KpjBcaSjODruksrGZsXx
         oC2IuwtOFgEV3Rg4GMB69VmdxtKwMKRXm4IItexcYdG92KM0CESY80N6mXNJCFiztD7g
         CPhaT7bmcGxzqIVbz0PFYquvPV5zvsRMffReo23A9TEFy5MhOwmWWoMlKGtCsIzqHYnM
         F4nw==
X-Forwarded-Encrypted: i=1; AKwUvBzyrza95raUScKZ92/46vs45EV2SH6N7+6grStESagGntRJxIf8VBOKfMgwhwcBd7z0KqRNfQIUNL00DZ98@vger.kernel.org
X-Gm-Message-State: AFq9FYLC2c83HjxyqwcrPC4NMYMLRBZUpRA/e4uDagQJkBZ+3GKWUT+X
	IW7kx8jwUKwkfN7rnBcL8k6H8PI+TvoDBMeATHDZoCmgIn3R4LCdnHX9c75Kl99JNQ==
X-Gm-Gg: AYBFou2m7gG5WmtzEZiRCPl+YYQ0SB+8BkowwP7DH9x1s30o/WmNFZ9Plvc1w6WxsMz
	Ji5qXjncmYPyWc1oqlwDtDOAMIDfxAr3lqQgR3hyHJxlQ2MwkTT7EsFvNjyW9ARekjLMSpi1fbr
	BAgFrTQLXsLxsk8FdbcWUfUmJTJf7UovCnceOwBpVbDFbqBowepep+zA7rO4fPY1Z4PB6y9wwFd
	j1CQcYz0iqMYRvpJamOvuMbQWq5q6iEJyeSBp8fYK0APP2bC39QFEKGH76ONdv2oObVvbIl8oTp
	WqlIzUtdLp4m1PAUZTN7fykcsgEiYV1rU1Swpavno+r5dNYMB1ohGy++Y/WQKB3HY0gnZnYHbsB
	xLzCaendEAaAwtj41wnlR1L1RzBNPIqqdYRDE6obcTgMf6t+zWGtosJ8i8C9PZfaAz29WFACjXW
	nvwLJunIkIg/fADyTwZvdDHsr6LmmhT9gVgfROyR34RZunfsvpOgfDaokSvlxAcs8/00uM4vy34
	5lT8d/GpfYT9mHvZBa/pS3A50FrthgTJxira/fK4bIwpCf8gdbOsrsLYTI=
X-Received: by 2002:a05:693c:8353:b0:35a:22a4:132 with SMTP id 5a478bee46e88-361a284641fmr14607802eec.34.1792510669987;
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
Date: Tue, 20 Oct 2026 08:35:25 -0700
Message-ID: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
image for SC7180 Trogdor family boards using `Image-framed.lz4` and
LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
to be built with:

  make FIT_ITS=qcom/sc7180-trogdor.its image.fit

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. The FIT image created here is pretty much the same as what the
downstream build scripts for ChromeOS programmatically
produce. Switching over to this would have a few benefits:
* It makes it easy to use fdtfactor on the trogdor kernel image.
* It would set the path for future Chromebooks, and on those
  Chromebooks maybe we could use the "description" of the
  configurations to help the bootloader so we didn't need the awkward
  piles of "compatible" strings that we have.
* It could potentially be useful to people in the community putting
  upstream kernels on sc7180-trogdor devices.

This all being said, there's nothing terribly critical here, so if
it's controversial or people hate it then it's fine not to land it.

 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 1 file changed, 728 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
new file mode 100644
index 000000000000..310c286706f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
@@ -0,0 +1,728 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/dts-v1/;
+
+/ {
+	description = "Chrome OS kernel image with one or more FDT blobs";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image-framed.lz4");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "lz4";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "sc7180-trogdor-coachz-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "sc7180-trogdor-coachz-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "sc7180-trogdor-coachz-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-4 {
+			description = "sc7180-trogdor-coachz-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "sc7180-trogdor-homestar-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-6 {
+			description = "sc7180-trogdor-homestar-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-7 {
+			description = "sc7180-trogdor-homestar-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-8 {
+			description = "sc7180-trogdor-kingoftown.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-16 {
+			description = "sc7180-trogdor-lazor-r1-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-17 {
+			description = "sc7180-trogdor-lazor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-18 {
+			description = "sc7180-trogdor-lazor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-19 {
+			description = "sc7180-trogdor-lazor-r10-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-20 {
+			description = "sc7180-trogdor-lazor-r10-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-21 {
+			description = "sc7180-trogdor-lazor-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-22 {
+			description = "sc7180-trogdor-lazor-r3-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-23 {
+			description = "sc7180-trogdor-lazor-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-24 {
+			description = "sc7180-trogdor-lazor-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-25 {
+			description = "sc7180-trogdor-lazor-r9-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-26 {
+			description = "sc7180-trogdor-lazor-r9-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-27 {
+			description = "sc7180-trogdor-lazor-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-30 {
+			description = "sc7180-trogdor-pazquel-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-31 {
+			description = "sc7180-trogdor-pazquel-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-32 {
+			description = "sc7180-trogdor-pazquel360-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-33 {
+			description = "sc7180-trogdor-pazquel360-wifi.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-34 {
+			description = "sc7180-trogdor-pompom-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-35 {
+			description = "sc7180-trogdor-pompom-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-36 {
+			description = "sc7180-trogdor-pompom-r2-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-37 {
+			description = "sc7180-trogdor-pompom-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-38 {
+			description = "sc7180-trogdor-pompom-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-39 {
+			description = "sc7180-trogdor-pompom-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-41 {
+			description = "sc7180-trogdor-quackingstick-r0.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-42 {
+			description = "sc7180-trogdor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-43 {
+			description = "sc7180-trogdor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "sc7180-trogdor-coachz-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "sc7180-trogdor-coachz-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "sc7180-trogdor-coachz-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+		conf-4 {
+			description = "sc7180-trogdor-coachz-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-4";
+		};
+		conf-5 {
+			description = "sc7180-trogdor-homestar-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-5";
+		};
+		conf-6 {
+			description = "sc7180-trogdor-homestar-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-6";
+		};
+		conf-7 {
+			description = "sc7180-trogdor-homestar-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-7";
+		};
+		conf-8 {
+			description = "sc7180-trogdor-kingoftown";
+			kernel = "kernel-1";
+			fdt = "fdt-8";
+		};
+		conf-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-9";
+		};
+		conf-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-10";
+		};
+		conf-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5";
+			kernel = "kernel-1";
+			fdt = "fdt-11";
+		};
+		conf-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-12";
+		};
+		conf-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-13";
+		};
+		conf-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-14";
+		};
+		conf-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-15";
+		};
+		conf-16 {
+			description = "sc7180-trogdor-lazor-r1-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-16";
+		};
+		conf-17 {
+			description = "sc7180-trogdor-lazor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-17";
+		};
+		conf-18 {
+			description = "sc7180-trogdor-lazor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-18";
+		};
+		conf-19 {
+			description = "sc7180-trogdor-lazor-r10-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-19";
+		};
+		conf-20 {
+			description = "sc7180-trogdor-lazor-r10-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-20";
+		};
+		conf-21 {
+			description = "sc7180-trogdor-lazor-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-21";
+		};
+		conf-22 {
+			description = "sc7180-trogdor-lazor-r3-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-22";
+		};
+		conf-23 {
+			description = "sc7180-trogdor-lazor-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-23";
+		};
+		conf-24 {
+			description = "sc7180-trogdor-lazor-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-24";
+		};
+		conf-25 {
+			description = "sc7180-trogdor-lazor-r9-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-25";
+		};
+		conf-26 {
+			description = "sc7180-trogdor-lazor-r9-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-26";
+		};
+		conf-27 {
+			description = "sc7180-trogdor-lazor-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-27";
+		};
+		conf-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-28";
+		};
+		conf-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-29";
+		};
+		conf-30 {
+			description = "sc7180-trogdor-pazquel-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-30";
+		};
+		conf-31 {
+			description = "sc7180-trogdor-pazquel-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-31";
+		};
+		conf-32 {
+			description = "sc7180-trogdor-pazquel360-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-32";
+		};
+		conf-33 {
+			description = "sc7180-trogdor-pazquel360-wifi";
+			kernel = "kernel-1";
+			fdt = "fdt-33";
+		};
+		conf-34 {
+			description = "sc7180-trogdor-pompom-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-34";
+		};
+		conf-35 {
+			description = "sc7180-trogdor-pompom-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-35";
+		};
+		conf-36 {
+			description = "sc7180-trogdor-pompom-r2-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-36";
+		};
+		conf-37 {
+			description = "sc7180-trogdor-pompom-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-37";
+		};
+		conf-38 {
+			description = "sc7180-trogdor-pompom-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-38";
+		};
+		conf-39 {
+			description = "sc7180-trogdor-pompom-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-39";
+		};
+		conf-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-40";
+		};
+		conf-41 {
+			description = "sc7180-trogdor-quackingstick-r0";
+			kernel = "kernel-1";
+			fdt = "fdt-41";
+		};
+		conf-42 {
+			description = "sc7180-trogdor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-42";
+		};
+		conf-43 {
+			description = "sc7180-trogdor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-43";
+		};
+		conf-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-44";
+		};
+		conf-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe";
+			kernel = "kernel-1";
+			fdt = "fdt-45";
+		};
+		conf-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-46";
+		};
+		conf-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx";
+			kernel = "kernel-1";
+			fdt = "fdt-47";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog


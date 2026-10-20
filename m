Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510657;
	b=lG43WnvlazbOeHOruyiQMUrDle/uPyR7KDFhdLFoeEzqx8uqgfdoZSCbtErZu324lqBO
	 74rINLcpjQO4OuHKYzDlxDKl9la2oldAe5d9xVgitDpnS369Ynj7BYoO5RXAJYg6nG4w2
	 /JyL9qaKimhPQNB2yOXYnXFeaJ5qsNabQL/BVtIuC1iZItrCZwqRizfMzxX80sG//9sFB
	 HbYw3CnwUbvpivSuB3vFyLiwZsurhhC4LQxTDAXI5kXryL7KWAvjwh8VVq7f+klK54SOo
	 S4ONxdGj+oal3A9QqpN4DNrCW5S7KVUNUvd96xG6ZwJpFE5ErRllQaCUeehIaZ+DFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
	b=vK7gZOoloPi5eEjvr5/ffx+ctulciiJvBzoIUDboMHPfN2bdtHqTxh4qQ2Pc55isMT1f
	 52WoDL3PtUrTja7Rm7Z+YUvzE4x3oM37SNg8qbuhsxQBMQJnXoj6eOs/ruSwPcO0dbPQL
	 tCkpkEuabHJpA9ai13TmQu3u5S7UErupcqTv/sWk/uhw5S+XLxHVGQqxAROpMaqEDCfWt
	 41x6bjuK1b26p1rbI17sm2yxwUKukkdBngw5/ikXEwYjm4wyLStLNn+hXPq9U4jzMZnZL
	 JOQNQQMS1AeKU880cMVK7h3iGIICWaa2WFqB+q/2N3mmyn3/0OWc9l4NqlDNRjj+D8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8860A2631
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D8860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-366421dc8ebso1152811eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=IEWFjXdYPvHf1GX8A4uK2ABfWGSlVp/WQdtFWAFPb9xPpTeDY0wm5hQzqHNR0CGNyG
         gw52LIeiYhC9IHIn6FIdkvW2vBm4vC3ehHqZJblz1xfrlYYx/RYysnM2pQ/Y4+etxin0
         IzpXTkMh6gCy2nqoHlR5KxsNg1/pU5B6tIaMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=mwqa+ciamgtzft30R7c2Tclq5Nmphy6wX4MAvzY3VRxGpDHDp0UBeYnsIlbcqJOFAc
         dpgjmSaJmAQHQzswr5HpFm5G4NkEN+zxlqeAwkYcXy8T4al86S0Cl0ADmfECzRcWHoKd
         YwpawNLzugDW9Xm/697/W9SAat3syT4q0hTPoOjjHvBBXt8t6Y0c4rx+k+UvZCAT5rvR
         q4wF0AvPIuqciH9Q+Rk/MJ9Ov99UtaUr5i+oVXpreka7FAh5vcGXrBIjjijDGO5bCJKG
         DZd7x3Y2ZHgbwpdqzlp74Uy0dLU7jZX3J7/E1HgT/EwRDEu55QK6Pp5wEpTcvToqnuOO
         Xj1w==
X-Forwarded-Encrypted: i=1; AKwUvBx7sEmyVh0YmgtF/+oDzJCcdee0vOYvev4wRXVo3CKH6pBuuZQ5Gh4L1yNmcNxb+ft4VW+B5fwVxPudI23T@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ89mSGB4gmPI/axioOFezD+hDpc8fCQvpUw5irkcZ7Vhmf7Fw
	ZJHan/tk45TRlqw5uMVP0oTWQTCHIGjP03TUdHf4RacN1hZSTmEWbVvhyaqgeSju4g==
X-Gm-Gg: AYBFou28v9WS1BLlwMZXa+YukFv9UWdKvJ0Ix5HT5n0Uk/JvVliBoZGNmKTufoxRFqm
	i+yrF5kHsn9vfDNEZsBxNjl253o/jTOTEymomU38DrnYqU2xNYSzaITNzZVpQIZKxSYGSeXogob
	EFYySGBHyuupJbuRHZ85u3e+2hge/+qrVurJPqMzab80o8Eaaj7G99YJoOTcLpogDbg/P6H97wp
	Rz22xVKbCi+G/+1euXkCYvlJyOifcVkBPYm23sD74pndvlH5tUJN5oFvC2fb+puHl0f7KBpMUS1
	JiA0pYaG3Vj5nnuI6idh3DHkz2QsxmBjQ0m3cxQSIKH+opms65MYGHeTLfxrOlLJCT5HKlihrQh
	UPpBJ7R0oVTQEuj7V0N4nEjdd7Ug6o5OOUmxxwtxYyPcCdRu6wWEcUoJwF/jEaxq0KvgnBRj9E4
	7SMjm06izY/IH8yl7oAmiWthO3I0+4qzkTGR4NDGr6yNcTF7Wbcq0mGl3zphqBXgQM+oiqgXnPc
	0cypuE6xofE6GWjBDN6CgKaO1L3ncw73OGpFGexn+YSmoU9OAnkfuG7U0Y=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
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

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog


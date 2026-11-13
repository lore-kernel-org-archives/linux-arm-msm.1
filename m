Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604179;
	b=0tVWdMKAWXF64Z9bFzaRSn6wOjzh2c+lJBjE5Dz2X6ZfRvgAzUB3VKkVlEWsizrnH/mn
	 JinlH2ZMdqWz0zky6GV6eILJLOpWsNCEJ5mKFktgmt+cwe6uqwS3RCnHFGkymHSyaLPvb
	 fHBZdXD+SgZDR8umnXMhidKODRwblszFs5EDzNyQUTT5Y4Zz0n2Etqb+Z+3mjMtgQxdpL
	 SrVDW7cSw1aKfIDsAFeKj0of/D2KgYrCDn3gc1Xq1Gb1Nk43LF+68T9KOoDbUFG4ol3UY
	 +cDTXkP5tcM/tC2rx00/nWk9cf7jjj2c+77IznYCFmEY0HGddBZK9Ov2ocAuD5XeeEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=;
	b=2ZaXzps9+U3cPuvK4XkCCH9nBaHeGmRZJ9RGvThh5KM/HsRC9Y9lItX2H3JyAaC+UT9d
	 9HbZmCjmDYUZhgKCI0gsfA3rPFeFQy58WYGQodlP6a9S1+N8Zk9xMjvMTfz4E+haE75nV
	 X3gB6i4QaFU8I17bykRD6C6qQEjDIPdUykkh0Eg5r5Yr7DPDrfzJFI5DdqiklEkh5J3Y6
	 2Ud0fr7o0QGE6NR6V+3lNfxL5YC2G6ZbAjwTMjJ5QeMzaPY9mhYthGnVYbeGavo0E8kea
	 WMPfXvKeS3I/GiG1N1tX29YjUUKSf6uE43tWXU5CQdcROeEbzR3ivizpOrKdSEI7bXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M6rJy8aT;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539660A381B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3539660A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M6rJy8aT
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so1986535c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604178; x=1795208978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=;
        b=M6rJy8aTnb0136QVcRJMq2NZC9EtA9pIfx1kaH/gyLpesPtwcNeh6eANAzQJ6k05DS
         yiue/YfbIgSWxLDT989qg3QQ43xXL55q0hCUFQpeYYSmC/LpCWrknE4XnAMDIaauNLXm
         Nb1XGgG5YwPUvvg5hxG/yrUE7Ve/kZU7HQ0Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604178; x=1795208978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=;
        b=dLbiVFNiVSDKegVvFm8yKkMb4XtDIfejSv50QisKgCv6XkI6/UKamkfr7WUnKOi7tZ
         MJK29zG7ugQi6g7jZq5UDzsOYDPSHio9TXCugDQWSBTAbSpeVptUeF4eJQiTkDJ1dwmv
         6tCBTBZZvs5T2l+OpW0EcOCun1io/nAwx5ax1Bt39sPNcaXhKgOtiwI42MHDU0R2+qQo
         sODBfEdEsq4s7Z3mb2YaT/PZ5PKiyWcN9pEBvVGdxCezagBfErsiP6knm8sotJV3dSpj
         cfP4lkHQtBXVlvBLZLSfD410CwN7eCn0rnPbI/l/iQ/CxIONZ6MqzWabb1RYFzFMRPtc
         WG2g==
X-Gm-Message-State: APuU4Z8ZGmUu4DT8cxEDy5VcTY+ihsx6XO00gHelcUNsgYNkSzQsGRQd
	F1onrSRn+Vjae3UfG5RmtHlEGwoj972/JqpKxXx4oSEM9fNome6ZqFDWWa8br2QlRQ==
X-Gm-Gg: AYBFou01vhLKBcDkk0Un0NPLtxYXc2SQUoOSIXMzTZDt2tCn7FlPc1nriNubUQEvnvv
	G6e73vlxV37d6XsIKZYz8QJgAKuL0KAGmwZ8cFJDCTBTsS7kXpz5T+z4L0GQcMaWmogpjiNSbto
	cPvigT9/9CgPxsFf8te1Igl1spM0w/oUu9imvEYw7Nb1GMr615hiIkEWYjScmrr7RId+rO0T3TA
	Bl6jSqUchH8Y01EFgO32LClhDl6hcAHj0l7meRS4l0PbVvYIxJAXtEd+WnnEeHue9J/4/iE1WKo
	4iPc2N/oElOpaT+N5J6Qh+XtYLoVjVBW8RHaEHZqkiZXOjv1DKwvFSPSfDUjhtME4W+14o2/+GC
	CRPOqkcUy3zdZNaPGwaJkW1qwnMro6eSLXgSrbU+DdgzNJCBQtLJMVUTcPZe6aZwt60faQek/B8
	eorPyzwhRSsSRnb+Dd/NOYpe9w+8VdM4gCg90VsSexuPFUbNgkt9GCSvJSPmpinkPosFH690rJ3
	IcdBwOjT73kRpcwsmsVphhokuVu0yDn+xGPoIKrpt3H9otDnICJlDhqYI/JRfYYgjBMf7xePsb3
	rlXJk55kCw+eCWyeeVP7l9BsH0G0BT+2lnt2+dU8UNJg8tmteZruN4Xx+oiP/Kxv2Nv9UdCZkwl
	FDYtG62Lm0a0f
X-Received: by 2002:a05:7022:1701:b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b5030ee9b7mr3024887c88.40.1794604178303;
        Fri, 13 Nov 2026 13:09:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Xu <xur@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
Date: Fri, 13 Nov 2026 13:09:12 -0800
Message-ID: <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

When packaging many board DTBs from the same SoC family into a FIT
image, full per-board `.dtb` blobs duplicate the vast majority of the
SoC and board-family device tree across every FDT node in `/images`.
Because each FDT blob in a FIT image is compressed independently,
standard per-node compression cannot deduplicate those repeated common
nodes across boards. Factoring the common nodes into a shared base DTB
and small per-board `.dtbo` overlays yields substantial space savings
(for example, reducing the 47 LZ4-compressed `sc7180-trogdor` DTBs from
1.71 MB to 213 KB, an 87.5% reduction). In addition, some bootloaders
(such as the Pixel 10 bootloader) specifically require a shared base DTB
plus per-board `.dtbo` overlays rather than monolithic per-board DTBs.

Add opt-in support for factoring the DTBs inside a compiled FIT image
into shared base DTBs and per-board overlays using `fdtfactor` (from the
upstream `dtc` project [1]) when `FIT_FACTOR_DTBS=1` is passed to make:

- When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
  included in the FIT image so they retain `/__symbols__` and
  `/__local_fixups__` metadata needed for factoring.
- Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -F $@` (with `FDTFACTOR_ARGS`
  defaulting to `--strip-local-fixups`) at the end of `cmd_fit` when
  `FIT_FACTOR_DTBS` is set. `fdtfactor` transparently handles both
  uncompressed and compressed (e.g. `gzip`, `lz4`, `xz`) FDT image nodes
  inside the FIT.

Because `fdtfactor` is a Python tool that depends on `pylibfdt` (similar
to `scripts/make_fit.py` itself) and Kbuild does not build `pylibfdt`
from `scripts/dtc/`, `fdtfactor` (along with a matching `pylibfdt`) is
an optional external host dependency documented in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst`.

[1] https://lore.kernel.org/r/20261101220224.1436242-1-dianders@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch obviously could only land if some form of the `fdtfactor`
series [1] lands in upstream `dtc`. While `fdtfactor` itself will remain
an external host dependency (since it relies on `pylibfdt`), we will
still want to sync the `libfdt` overlay `/__local_fixups__` changes from
that series into `scripts/dtc/libfdt/` before landing this patch so
composite DTBs built by Kbuild with `fdtoverlay` retain full
`/__local_fixups__` metadata.

If people hate this patch, we could certainly just run `fdtfactor`
after the kernel build finishes.

Changes in v2:
- Update fdtfactor invocation for v2+ flags (-v -> -s, -f -> -F)
- Expand commit message and notes to explain why FIT_FACTOR_DTBS is
  needed, that fdtfactor is an external host dependency, and that
  compressed DTBs in the FIT are supported (Simon Glass)
- Document the optional fdtfactor dependency and FIT_FACTOR_DTBS /
  FDTFACTOR / FDTFACTOR_ARGS in Documentation/process/changes.rst,
  Documentation/kbuild/kbuild.rst, and arm64 'make help' (Simon Glass)

 Documentation/kbuild/kbuild.rst   | 14 ++++++++++++++
 Documentation/process/changes.rst | 10 ++++++++++
 arch/arm64/Makefile               |  2 +-
 scripts/Makefile.dtbs             |  8 ++++++++
 scripts/Makefile.lib              |  7 ++++++-
 5 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 80cac4c432e4..4271883bc10e 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -383,3 +383,17 @@ Path to a ``.fitconfig`` configuration file (relative to ``$(srctree)`` or
 ``arch/$(SRCARCH)/boot/dts/``) selecting which DTBs to build and include in
 ``image.fit`` and optionally setting properties or subnodes on each
 ``/configurations/conf-N`` node.
+
+FIT_FACTOR_DTBS
+---------------
+If set to a non-empty value when building ``image.fit``, compile the included
+DTBs with ``-@ -L`` and run ``fdtfactor`` to factor common device tree nodes
+into shared base DTBs and per-board ``.dtbo`` overlays inside the FIT.
+Requires the external ``fdtfactor`` tool (and ``pylibfdt``) from the upstream
+``dtc`` project.
+
+FDTFACTOR, FDTFACTOR_ARGS
+-------------------------
+The ``fdtfactor`` program and extra arguments used when ``FIT_FACTOR_DTBS`` is
+set. ``FDTFACTOR`` defaults to ``fdtfactor`` and ``FDTFACTOR_ARGS`` defaults
+to ``--strip-local-fixups``.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 28f2ca63318e..f9b2a35ddc45 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -201,6 +201,16 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+fdtfactor (optional)
+--------------------
+
+This tool (along with ``pylibfdt`` from the same ``dtc`` release) is used when
+building a Flat Image Tree (FIT) with ``FIT_FACTOR_DTBS=1`` to factor common
+device tree nodes across boards into shared base DTBs and per-board overlays;
+see ``FIT_FACTOR_DTBS`` in Documentation/kbuild/kbuild.rst. It is part of the
+upstream ``dtc`` project at
+https://git.kernel.org/pub/scm/utils/dtc/dtc.git
+
 GNU AWK
 -------
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b4982e94f80a..f12f4f7c6a02 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -224,7 +224,7 @@ define archhelp
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
   echo  '                  Configured by FIT_COMPRESSION, FIT_DECOMPOSE_DTBS,'
-  echo  '                  and FIT_CONFIG'
+  echo  '                  FIT_CONFIG, FIT_FACTOR_DTBS, and FDTFACTOR_ARGS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index cc14fc905ea3..bc0c62617a7c 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -126,6 +126,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
              -Wunique_unit_address
 endif
 
+# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
+# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
+ifneq ($(FIT_FACTOR_DTBS),)
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+DTC_FLAGS += -@ -L
+endif
+endif
+
 DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
 
 # Set -@ if the target is a base DTB that overlay is applied onto
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e08e35d4ed74..af2d3e508424 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -418,6 +418,9 @@ quiet_cmd_uimage = UIMAGE  $@
 # ---------------------------------------------------------------------------
 
 MAKE_FIT := $(srctree)/scripts/make_fit.py
+# External fdtfactor tool from upstream dtc (requires matching pylibfdt)
+FDTFACTOR ?= fdtfactor
+FDTFACTOR_ARGS ?= --strip-local-fixups
 
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
@@ -428,7 +431,9 @@ quiet_cmd_fit = FIT     $@
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		$(if $(FIT_CONFIG_FILE),--config $(FIT_CONFIG_FILE)) \
-		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
+		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
+		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-s) -F $@)
 
 # If FIT_CONFIG is specified on the command line (either relative to $(srctree)
 # or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
-- 
2.56.0.611.g1030f0b940-goog


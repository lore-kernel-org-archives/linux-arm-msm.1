Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604171;
	b=X2GE4MDlZAm1Rpn31ag7C/298ZLdgWm1oIUOsSzM4zRKjr83v8aTqBUmKAzHecNt3ir3
	 kr7zzqFA2KXktptDiJlA7y4T8ActQJof5m4uQI3zS40cQm5JvlIcVXB5jebUkXNyP+VUF
	 BMcqRN2hq/ry/wyFFfUPCCz58Yw9kvzBH9XdCC2W4dpikEtZKwvTPAyb5lZmfI1pa5r00
	 PY5ZG5AyLTORBUMsuI6UA9xQpSpFpf/eGZgh58nkGm31VQtJJhzeH8A+fNIuttvcqv/Mw
	 0SHbk05dKVWldC3ONcs2vZ3BT2Q4Lq1lBkvERdZn3+n+Rgf1h/q18jQjIN9JMILgl2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
	b=KS5dWUibvd8K90M8gFfwtGfyMdOk0t8lztg7WwTZ/wuAe32zA/oTs7uPxgtSKHtpSFo2
	 uSEoiL70NgMN+2/gnF5Nv7Dk05uF7YNFpgQHeUCO38dHmfHdDxPDppsOiFlKLPzGTtQ1x
	 xi/WWSbJ9MfT3TDx2/SqABcwVAVPffrQI0vEiNxTg4+PZwuBYUTYV/jeLjb7eLnWEMEnA
	 4wDEq+VKaCeXVvVSODDX9qTPs6encFOU4dD9aG1x6iO8jbQOvcD8qkMOY1odJCiegITt6
	 iGTs6xUlTaT0jCVwrwhXiMZ/Qm8+c1PjzcjNxzhFU6K2/P4OKDf9oF+kebvh1loBSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="byh/3nmq";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628860A260E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A628860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=byh/3nmq
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1384712c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=byh/3nmqI7QpjTJjL85XL36XrLVmQJX7b416OaueMm9iHjof1uYq2ZFN7Pfll3IAvV
         +X01S5m5HOaYZHlDiDaPuFiRmYKrPA+w+1JW7YhJqoVFFPJEGnEmqMTcrdwrPGVV8Zz4
         i1lGy4B/V1v3WY/ao6ofASJ8TCWkgzDrO6u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=NASh53Z/dw/AtTAWk1mK/Naqej3/rAWX22kuMkwBl937mnXc/VR56iPnlQw0ROjh8A
         SiIHBz/i71ebdGdQlR7NkgH/5dXSUPfiF5uEyy+Xr02Qq98BhHqQZFDbsGbWBmOIO7oM
         w//1KS667wiDqTlM+lwtXvJQ/UJigjZn+35ffeeUo9wBzk3q03xlHYese7WfvzLyuftZ
         JKabxdbE/GwunHhrNW2zCKvDXSASsMuR5S1piD6b9xTVcYgML7qXyZ0AH9h0IqlxHAxV
         rl36J+eW0wEAtTIK1O2M10UTcDIqdJ7G0ALjZ25dSOtULDfBIejxe1uNksnGG5L03Lpi
         mhAQ==
X-Gm-Message-State: APuU4Z9/Q9RIYaNiOFNvq1GIpXalf76t3Ozjr5tgWf2sLlPwje//57rb
	ihuWnHEvwx3l7yjyHJRt043iz597sifnmOZMUxnx17jQzTc8u10KLT/WtQ0zCs8z8g==
X-Gm-Gg: AYBFou3hkPKICD7IMto2ayHelLfwvGb4gxEtMhWTgZy0JpbXaoSxG9d+eYIKpFQCA84
	5vSBMPsNkJgTuoZKuMp1OqiS1kZm2t+b66ckB/Ufn5hIuw+Gi2KcHOzpPNCqdcGX1DVBOdJRnAv
	ifLG/9Temp0YMls9NGoUkmKH0X8vDBlMi2eKj0uYxU5Tv3r8uC5wPdW0IGwwPEK1IhKgEYz5Ydu
	fv9l2//Necg7yF9AZ13ZZ5pW0tz3wawkDwHvyxEQZqaRKGjcLudP9kFlRRdEfcgN8TMd+VqDjP9
	3hqK1wQ0Tm/sZlXkxlFiVdp1ZNvtFV1jgsTu5IMbR3AM2iSaqNBWGyt2sT/PAf/oZYeragNBDw3
	G3/PArrfATz/UdKzbatYbTbC7tJsCHvbSg7PHZ6T4bfn71FnvVu+t8J2fkjZTYR9PS5JlkuwnRA
	NhPYrWmqzau3Kf54DGlyveBRfrNqNJUOU7bPASgrEMqNajLe54dnCFAnKCKDayiHptJ36Nr48oh
	S+VW01JzkWF5iwYzskq4ZImf8EniIUo2pI6JezhFGVq5z4nqVeEOYq65gEc9m/Nc58nmw91C2J8
	mszyYGFvH2uPTncdH31oankhuZIoGoNUmILxY+5lqlaoB/fu0I73fm5P+cjh3tprwGWfxBYmGGm
	ENVz9/KiURyBs
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
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
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
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

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog


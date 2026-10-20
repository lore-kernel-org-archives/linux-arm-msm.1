Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510650;
	b=LvFl5TXnDtvU+YFwGhdrVqRlrlqUXBROKI+rn65js7Miyr+66QLUBEKTtxMZiqg+Im0z
	 8tvt4y6gXBjgpZTQmiIWVVAKMA5jNpdGkGX1e3fk05u5dQNtIcyQmBKf9LOa8ULKBJre1
	 ivUI3+aUqa4XrM96F49FHuMsulkAGytfN9FZSY0K2jqLp0Hm/coNurHvkATQylQnQL+aj
	 tYkHYj3wU/rs5Tnd6lI3jVKUANcXeq5nlglGsqPzBJIxS8HC+1RUSKbbj49wQNrPaOX67
	 PPLRZC84S95MFOqUGJPYSpRE0Vts1arDCfy2bNHkrZc7CZna2qZc+E3FHYcTjfkZr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
	b=xdUcZBSfU176rnYg5hwBQ/LxP8xpDzf3/93SbFQm0Br+5P0g4pamjaj+OZcr08utTVaZ
	 fc24MND3SI99SbDTc1osFb2OVGaeAN6v6PW9MSGMBz1JVyYnqy3gw8Ej+GlYXY18Tkqwd
	 89bjcvk0l7sbDf0p5D6Xx//1pJt+uipUXuI9t5wr3yrSyCIe/Wh5AsuP7N/SaF4o1+E/e
	 KPy6EG5zFJE+AKWw60LmzlktQlkZtavltcio/4kKBet6+tspBDsuzxapz0ZzNLxkcktSh
	 RdNJDeBGc2+IuzNE7yg9HfgywLaDo9HXku7MGxx8MA4sbKD3D9rjH/dFnGaRCd6Pd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A0606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815A0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so990354eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=ZB0AmpTiEFpkYXp0+xLjk4W6R0qcTahYVXSVmFDgQXTNrUa4ZAw/D78slYkOG/1pqT
         WKBNuC9DZqypB0b8Rk2Ji9vE0p9+M71yqhsJS8VL89DlXOT/kJhPFZQebjojLdqPK6Ww
         0H9XY3j6gr6XmSqFQ0RJQN77Gy9M93W1ltSps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=p/o6jf6vEes0MeGe30ZA7i0brhYWlL7VqtvDHKswoXIAPOkeBFXkY0zP740SWvZVzT
         07YHW+UoEaF7W/0NnEd+Sw1w228du90NZTr5KD0lpuhC2rL1X6eA4dQWsaxpdyKBtftC
         /i4o2ncbzxJ89nSmwgjDEa18727N9GZ5kQdvxAf0nIEyYP5M0lJgmFsBPsKypj2D/byq
         qntehAU5P3c4U7XHbzFL0BfVuLTgNpg9XCxOCmtqONIXVXvv4fcx++7hfrcT/B4bfy87
         fJO/pGk6LoRAdKkzcgRKp/vehG3r95a8VC0/bmJ1i9CX7xWfT5WgbERAulsizwW8Stny
         2JYA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ8y1DYIOipH29f6wduZwafxBQ5euBL/ML9nTGYf4Cs+xvfrELKINCEDzq+sBd74CreJDa/Bqx56dgTVHf@vger.kernel.org
X-Gm-Message-State: AFq9FYJrCqhTcXL8YVrQ4k8VUz5DJZuSuygoKkuIYIH/UoGSK/0SeXYm
	ataJJgAcOE75ubmK+am6QdQsUnXIdDFKE9KOYwu7ckfuUrUEsH4/HCOIcIaoZFuMBw==
X-Gm-Gg: AYBFou2RL7idXnFZPykgGc35fzhV6nYzCeqRiqQBZEJc6nOzUfXwTZPFItQMrHIsuF+
	zXx16qNeMlnozfxvLJSyIH72hKqSnIaHDVlm25HQ6LkAmDEL8rYtzp+ZxuCAD+RMpptWdDZbkAs
	nOsflybmnM19B0ix4RXbMtzpKbj3HWVx63iVpT2iXUP1Gv6mWllKogqhxjq+/Ecv1TvPob7XfIt
	qp0R7i/Bnt5uSkzNRT/3lSfbY5zj4hOnBOer08fAh4MYbzxCT6vMdUL2W9WsDWpHHJ+illHE/EC
	HO6GHo78b4HgXA3kOMGyfRV3AsWnOjX74HDcAwqk/7CPb+uxaqMR8/dZiR6UYNaEX+L+4rJIN/5
	yT9dP82ySj6hq0i0KBySPZOdofT66Smq0RnTcEhafgFzhlnD6cOzeF6vuL+7bPDsJS9Gp+5uBIb
	tMHfsjvAjTOZrHWOj0QJ5LSe8Mb2N6eqGbdBOtg1aEEm1L+Ly7ZCpZTjKw80qjyjE5O5AlWm7AM
	uKqFglJ4YK0M/1NHMNUPl0WaW4nBwANXh29Enf3g2LjEL7zKUNfb7yBxy4=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
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
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog


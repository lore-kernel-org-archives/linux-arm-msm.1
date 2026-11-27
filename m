Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774793;
	b=r5XOJ2dhSf70NjOI0eKaSCXxLgekyMFl1qo8xGuk/lzT1n4cGw3H+Kef60J9bwpUW+iR
	 eKiacVmO3Zq27Jr1JupK1o0aQeiseebCQWsJsyASMAUpH/QCckWDL0lL6bL4AsH0+o6VS
	 buwjF55W930w7nyArWvD6jr9mAKHRQLL7T2NBsXeaGPdIp5rIe/Ukdv5b5FmBeAwhdPHL
	 VpIUDUi2DcRU7crURIeqNi1zCn92XA4YywiT4KigYpBAlNWpr14+C6TEa9mPZ1w3DCoCz
	 PtFZA3SvqQcoPr0Q0K0meHL9rSzK6ibr6PHKz+WUXfgcZJtLpIbblNENLAjCn1N+/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
	b=Ys9W+1YpPZa1VUxOg1MTotkCeUc2780IPE5bFAraRKsSZtostqYBk3ExkMHlWE51cEia
	 3Rf8oJk5YHQf0EB9frz/mBkUZ4Qj8Y43637SchQ0Ca/jzzvtKh+K05GAq+ICryUaCwnxT
	 YVK9Sv9EfPKpZ90s3t1OmA3hj6r/wNQ5kyQimPXI6F2YXfqWNXUj/Zjan38AGLYAvTrKy
	 QHzEGlSfIR+apSVT4Kw4T6C6gBT8nZyXWgkyRtfU5ljQmji+l8wUnR9kGFHZnx3kg0WKo
	 Zzce9yJbcACynImjA6Ig/VJDwPrBkUnmRrB3jcMb/iZMzAmBe8Bcd1L4/Ibyc9YpUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s530ybTG;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47363606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47363606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s530ybTG
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso310965a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774793; x=1796379593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
        b=s530ybTGbIbc1xJHfvMbaFIkyd84eLYU6b/KLKlJtqxWaR7rpjLmoZICIA8x8/hCjV
         5gPjiA0nkI1rqyqYNJB2S3Ue8re0Ihkp6LA9LvA6EFEnfpG3U6xBFZbHvS8DCeDW++nZ
         ccFfCu7dTQbpHBPZ+5JfFhcIRwV+e2Pr61+CuHwDm4hS37zSBXFzTZZX0yt6mijvGhXJ
         FRacnXdWfk7hDdC12vHFnqzQDhFd3USXFvFQCWGSDkTyPrCUVNsvTrrmU4+wMVyU0v2U
         /JR4o7y7vHwWoIIkn0sUL8rGwVSKbFOjwFps3cEuhBTkrKIJ215TuybiKTCsx2F7KAlX
         2oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774793; x=1796379593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
        b=o2N7dBrKB9f/L2d2n1GihzfAPC89DErGjh+ckn5KVuZGGcwcEhRiGSmmBn0MVrTDHe
         yk9LBtLLq5vKNkpOlGnEBY9ikcD/dElAWxi/4Bn/WhhdUW19YxwoCC6UnlweZkN8fUls
         6GWX221SYUER9Nwhph2qO8iW+uopCxdYD9L3jLGfsKCDwE/cThv83XKGuMutQiEJOxXD
         tAb/pAk3h3YQzimzshMQ0bKmwJ30YF2Wq4MguZP06Ugp777SGPKlg1hs5I0TvLfZPu4h
         QJr3wf8rDA66+ZUgzXvXJFHlyegr2J90I+0SnWLZeElQ3ZChO6D3MLe9as6qc1qJpUGA
         tKhg==
X-Forwarded-Encrypted: i=1; AL+hErHgnw1Oj3iq/WmgKArwhuEe1hv6PF8v7aXPfoChIvP01kmziwvEUJx0ueR104ut90fiOyydV8oJig2BEiCz@vger.kernel.org
X-Gm-Message-State: APuU4Z/iuDj5I3hPikAxbDPhy2+93byANx3aFFCKX0YI52nratNu9gP5
	uNWFN2o45OH21zt/OFo05NtvKppl4a1RZZBN9amRCoJer6TpLWKxVMsM
X-Gm-Gg: AZFdTZc3u2aPFwxlV2EEdG/UeffY9JoDNxr6N3aHKGKnKqoLwklb9Fok3HY6Xv++cH9
	sCask4URuwZrWVHV4sLd8lkQKRpefJdJasrs7QFBVO1ofOcsDIsJkeXfFBVWqJfELvjJmIYG2yP
	uwiqr3cdol61vrrPCgGwLjIG4pFD/BhXWKFRdTuZ61b3/nC+CWcvLZTxyg4fY5iB3KXKV0uUBQq
	iUqB4/T0xckeHgba+hBhRVHGIOIgHAx2OlOPhU2seeyItsjkJXyNc2BSVO/Jb4VN6gO6vc789jF
	tmvoNjjIqPfzijj0BHIP9JOx9uekLyg/FF8SvS3FHX+aoz6FlGZgMSYPO94lpvnQBF27TSgzSc/
	XsvQKQArpkR8088TNPKAaP9Q/WB7GI+mMjUkq3h84NEzUUqAw8SMHi4bUW+BRvzw0OlqvMBIO8+
	dim283ZlfSi4Q7+U9ffGdj35nY+eY2EC+I1E0O1puG8KBC+YxUIeFiv0rDOkN+vEMkAjCVgLENp
	5+inxp2JTerGX5OlZwlsQIWhaT90ICBaf9caXPWZqv6W7uJ2P2ibsdknS0ieD1wxH42j1OMqqmd
	b3EVFthDRtcW0VrbhX/X4W/ZzH9+3JrQuQLRoKN+Ky4zWCWQ3+YKSA==
X-Received: by 2002:a17:903:4688:b0:2f0:7d6d:4a09 with SMTP id d9443c01a7336-2f07d6d4bc1mr273030015ad.1.1795774792626;
        Fri, 27 Nov 2026 02:19:52 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:19:52 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Distinguish Xiaomi elish display panel variants
Date: Fri, 27 Nov 2026 18:19:18 +0800
Message-ID: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Xiaomi Mi Pad 5 Pro (elish) ships with either a BOE or a CSOT display
panel. The two variants already have separate device trees, but their
root compatible lists are identical. Loaders such as Stubble cannot use
those lists to select the device tree for the detected panel.

Document a board compatible for each panel variant, then prepend it to
the corresponding device tree's root compatible list. Keep xiaomi,elish
and qcom,sm8250 as fallbacks. The binding now describes the panel-specific
compatible lists in place of the generic-only entry.

This series is based on next-20261125. The binding update precedes the
DTS changes.

Validation:
- Strict checkpatch: no errors or warnings.
- dt_binding_check with DT_SCHEMA_FILES=arm/qcom.yaml.
- Both Elish DTBs built and validated against arm/qcom.yaml.

On-device Stubble boot has been tested using U-Boot firmware.

AI assistance: OpenAI Codex helped adapt the existing downstream patch,
prepare the binding, commit messages and cover letter, and run the local
checks described above.

Changes in v2:
- Remove xiaomi,elish from the generic SM8250 enum, as suggested by
  Jianhua Lu.
- Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
  by Jianhua Lu.
- Use sm8250-xiaomi-elish in the commit subject, as requested by
  Jianhua Lu.

Jianfeng Liu (2):
  dt-bindings: arm: qcom: Document Xiaomi elish panel variants
  arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel
    variants

 Documentation/devicetree/bindings/arm/qcom.yaml       | 9 ++++++++-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
branch: xiaomi-elish-panel-upstream

-- 
2.47.3


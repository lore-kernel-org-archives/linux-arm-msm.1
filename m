Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036682;
	b=4+iowemHdykf1rws4iL8gATkQsmbB8ZjOLzkGirC1Igkuce1qJuXy98Tai6QpFUhpELO
	 51An9rPy3RqGBLWdd3HQ1ftL+hlmUygKxrC9KXivuh0OEvYqNaAJo73RfoDlS+HOz6v9/
	 dJtDlR34uOncUZ9MF0Pq0H6zDKfELamv/A4tcJfl5ho/gJlWU7vEfrvg46pkadkcr5J4k
	 dLVk3oY4fCQWF7N8fp+0L2TlQaWwhYICSoQcEIQ+8+wEWc0Nxyrttf9Q1PP6Etkva74WZ
	 3d3mc9C8aW9tfo5g6LQH62Lizh5I/md7d/i0pA1MaLFOveRvHsITU4eh/j/zq48yt+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
	b=gCy6WNUUA6Fea6ROvHk1FmZkcuUszh3zr2chBBYzEJSNjnVMSf4T68+RHQu7ygqsQ6Id
	 mOGLd7s57y3bPxdmwDIOdRUU66kfwteeGUmOQN64zJZnkaRyvDy3ijGLVLegvhJndeRQB
	 jrP+bPwNCIiPZNAgRUJORiI7T/ugXLck8HI+RHij4+hyxC3Ptl6dif1u18FCYeeoIWMp2
	 VwoYBShmQ8DdUEhnqxjAdEHBD0+R9BBb3MACApWyRzzBBilhv60NVZjeA3aSuhv6MdRu/
	 hmazBMurMZXQdfxCyufA6NyaI71z0durV1JnKnoN8IuJxjY16/QvdBPwKX5cuurq4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mswin.me;
	spf=none smtp.mailfrom=mswin.me;
	dkim=pass header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L8E5XqA6;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A30606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 17:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A30606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L8E5XqA6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c498fa2f365so168695366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1793036680; x=1793641480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=L8E5XqA6Tqzxzv5x+x3Dnt/A7KPA1+eFip+NQx04KhL6C2dStKFQf8ld29c5xMK85c
         HiIGJx+dO+lPi5qreXNsifCsc+BQaLcL/U9MYK7FV/DNzeJYAJnHYRztxN2Wns5cfLJN
         Fd3hX293ZhuHlLBFZY2Or4chX0tVIgcEykewJFRKVzhX9SeyxGIAuwK2ArvLos6ryo4t
         EP5bMzSifgq7ShQPG6eVE8cJoM02VumKLSRxxaCUObgQej9ox6C1Fnp1VwnsqEe/Ievh
         oMCY9pIt3nAHEWRF0LJx0TCO9asKtk6+4CNp83eGh3wlNc94zDh5mV/5jS9hyxTDUx9c
         fEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036680; x=1793641480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=PCy2owP89z2oj8fg4ax4xYMh4xTTSCb4/PKNpLjPApJWV8O2qseMGl/IXuZ8D7soRY
         5ij4wiSVls3KwasuYXi+s5tFRXW5YwSA3Mejlg5ISdPnFEqlUOXbnJwzd+MPrTC+26+z
         Qj9oJPMRT+j/vaTnNMTvlan7eQ4QROFak3QJ2ynb9jztwVIp4Ah+fx7t1/mytoMJtvdJ
         JeAGkaYN8wWP5rZoYseS06sFcr6QUowyFSJdme4aOYEPHpLoiHrm/BDN3PQviKCIkyQ5
         ANPOcTbuenQSefYhhO99rpam3fbqfSUnQR5jIOdqen9Pv9VlEKUlIPT7GtbvzVhGYJm2
         f91g==
X-Forwarded-Encrypted: i=1; AKwUvBxXwkL7MB5Z+GHbDFQxhBOAIPBU4ewqPW+Zho+nZwy8f9kfD4YPBhY3K9VFLBez1o93CjGFuwPkNgXH0lsJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8XV//whXSRGqPDyhdph46qRC80UtZwU/86rB/WK8Z8vrh4LdP
	+giiPbs8oNOjeC3OODzqiodaZTcpM5xVDdGxa6jq6TLjeykTamycLMsAEuBASmZnCj0=
X-Gm-Gg: AYBFou1QuH1UYM+jzpEGYERMbTbggKO6YhE9IqWCOWdU/8kkdU/DUu9SPbLqoJZdDXd
	z+lF4fKFv9rdDuOP+ZlLiLmS3/V9mFAZ8WN0qrBZVS+z5ndLbdi2pydHv0hBF1I4swK21SMg/l7
	pvYxK0K49FGvgEQ236bEs5SMSxRuUWK8DHdd5lgIem3g48EpZ3zX4tkaVrkr/Q8N8JxJUGXDTbM
	j0BRqlGzCep+pqG6C5KrTrV/Sbzr1pLnjmPABOENaHwfPSvGkuIzn3VlOvpOWLguYhSo2ZhsM45
	ha58GxzOoViINOlvVRwZ9qiP420LMpx4Cm8dr3vA5cShEriIUIK0o7R5VaTEXMycPtLI8QqmceJ
	Xhp12ehi4HB24do9j7GC5tg06jc2xOUs/dKIbPedV0nUgAUn5U8pPj11WXxyUG/GpsVvNzGp1WX
	3GnedRjFB6plLGmw6DMB0EP3r1rKdunaSDALyDyX56BXhh7co3+inKiV9cs/qoNhWyau9K6jS9u
	BEcmYLoMfninI2bSMFLkr1P9W9Ks/u3Gm15jn8im3ODW/LhD6NkLL/bvED3YeI=
X-Received: by 2002:a17:907:d16:b0:c46:9ca9:f522 with SMTP id a640c23a62f3a-c46bde42195mr863150266b.26.1793036679205;
        Mon, 26 Oct 2026 10:44:39 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm346004566b.31.2026.10.26.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:44:38 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	barnabas.czeman@mainlining.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
Date: Mon, 26 Oct 2026 20:44:36 +0300
Message-ID: <20261026174436.305327-1-admin@mswin.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
References: <20260821032541.1856299-1-admin@mswin.me> <20260824155535.335494-1-admin@mswin.me>
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

reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
ending exactly where camera_mem starts, so the 28 MiB in between belongs to
firmware and not to the kernel. The dtsi nevertheless leaves that span as
normal System RAM and hands it to the page allocator.

Every sm6125 board inherits this reservation and none of them overrides it
or places another region in the gap, so size it for the firmware map in the
common dtsi.

On laurel-sprout the mismatch is observable: page-cache pressure eventually
reaches the span, and a store into it never completes, which hard-locks the
machine. Before this change the board wedged at roughly one lockup per
59 MiB of buffered reads; after enlarging the region the same workload ran
691 GiB of buffered reads with no lockups. Booting with CONFIG_MEMTEST=y
and memtest=1 sweeps 17 free ranges with no bad ranges reported and skips
0x46200000..0x4ab00000 entirely, confirming the carveout is out of the page
allocator's pool.

The downstream laurel_sprout device tree describes the same base as
removed_region@46200000 with a size of 0x4900000, so the reserved bytes are
not a new claim about this hardware family.

Signed-off-by: Roman Linev <admin@mswin.me>
---
Changes in v3 (from Konrad's review of v2):
 - Move the reservation into the common SoC dtsi, as the size follows the
   reference firmware map and applies to every sm6125 board. The v2
   board-level &reserved_mem1 override is dropped; v3 touches no board file.
 - State that no sm6125 board overrides this region or places another region
   in 0x48f00000..0x4ab00000, and that all four affected boards build with
   the enlarged span ending exactly at camera_mem.

v2: https://lore.kernel.org/r/20260824155535.335494-1-admin@mswin.me
v1: https://lore.kernel.org/r/20260821032541.1856299-1-admin@mswin.me

---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de156..fb126db 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -282,7 +282,7 @@ smem_mem: memory@46000000 {
 		};
 
 		reserved_mem1: memory@46200000 {
-			reg = <0x0 0x46200000 0x0 0x2d00000>;
+			reg = <0x0 0x46200000 0x0 0x4900000>;
 			no-map;
 		};
 

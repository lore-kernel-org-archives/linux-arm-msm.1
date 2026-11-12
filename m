Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490395;
	b=PgyW/BaCTeI63jtKYffPA/RnulFMRxzFJn3A7JAGlxThf+7De4lbv7iSyVdT/oi6ilvd
	 +by4znW9uzIFvqvO6B/sSw0l6x9vnaVJVh0UB0VY8MXcJ4V0D/GSCpxLVBU5bwKhfN27H
	 xL2MuooGrOynI1s0hXZQi1XHhgeRiQxD6QwoRn9c9HiLseSYH0FIL/cR9dMHJyU2KsBXZ
	 35+wYTo9LBUtWexE4i745S+DFJXLnpI9CKx5qM3Xm6kPEbXH73qweVfr3zy+/dKQm6q8e
	 etUXuVQwpKdwAo+8zbTVdQOkfMRn1vSuKYvOeCqhZeSMbcZzQuqW/kzyC82SzWopp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
	b=AiI4KWbvehiSwAjQ4UZUPkXZ6gQEsdUl/TZJ4hezn4EP8C7fwYJPoXvL3lSNA1TXBzxK
	 DgHsPdPXw1lk1BvQc0HHf395fWmWb6ZbwEmEzmEHhopum7eRRsWmrtuk+LLh0NyWCIzgB
	 jTsyAXMIvscBvLWOcCjLiPY9XakD9d/JFCWmNKJN923AORm3AsbFN/zFsIYSRawm2z+py
	 uBMO8aGyQMAewMu0Ouj5MO6w8lrscmwKvOA8MijI8cZxpju2OWAnN4sozlDPGV+uMWp5s
	 /Go1rxhTLS8b1sTNJTIwxrAKhxAqPEXwG/RUSMnZnlMaNrMtfFKgfEJGlvL7EnIY26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b84wM/G4";
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652D606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A652D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b84wM/G4
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acef9307c7so34768691fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490393; x=1795095193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=b84wM/G4vgRMKU6oCG6n7mGlXsC5PjUWqVhtv+VHwzTgQ/POI42br+FPYNgXKgeDMC
         gLIwKYG0rSsVu9Zp/iLKcFEbA3WReq99mpRHi+ae8TDkvji+Y7IU8iblAqCRkxEEN5YV
         Z5FvV4/Zg1hbD5/ByTdxz1Fslu1hi6EHd6N3HHgi6XQEI6SGHHSqcWQkatt0r5+ix0Wf
         GqI/pXr2qrbPa8ikNrHRMK+At38t4EKqbIMUp/ApLb8mCxWCN9IS7InZ8OOn0nRxDLty
         seAGVGYOLaJjkjb8v67DwCzn0gN3l4PfmtcPtWUJ42hVGFCXWgJ8tAWMKgS9900UCXUq
         Alag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490393; x=1795095193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=kMh4WG89oABhBTCj7zEoC/paEXn+hqpgqoERzTt003wVI4zn7gHm2MOb5gnpREdBh2
         uvgamz0eK7GrluzBnTulxIaBP5Z1dfMYEmokt+SreDxTPKDA6NQ+fiHpiD891O5+PcNp
         qVo8kKNcQIn6c7hpJHQYgxfx8BbFWwVk1NC1Em2q5O/dxNx7HeXAq++tCDym9lKFmjYe
         Anb1k1sihpJbxCe2+dJV64Z70UlPhfteOuKADiOgtBcKa6E/Vq7gKk/sgu/sUsfD7E7n
         GjJWauQo6o8ZpdlJlF3wa3dErdE7YhIol+FtKmdtKWYo9qQ/R8xXX8prPrFqT5Q4oxhV
         GZ1A==
X-Gm-Message-State: APuU4Z8gRL9vlF+12I6bYAzBdqyrKssCt6je5Pn7RlFLrFUwi/vzaG2C
	Rn8nhsQ6yTo5JRJsWVeH7oFChxCE9KgdQAz6/6xiqnehpGp+UOv+EDTu0nbWWf4t
X-Gm-Gg: AYBFou2h7FNS4OG8GSFc5WTpTNsiA+++6e0/9TvqMb/wR2FWU0z4ZUTId73pbaNgplO
	dsopz2WBBZrk7nU7JveVGb4p3HQkCOzW2Wt5OBto+sMW4OzHdy4UqKv8dZ/6x2ROgPuNm18LB4r
	BKV2h6iisrGOVzKqseth7Z6FjZE+3Sv8VpC3W2PA8QNT8fnTw09U2nH2ZcLSXtT0wgkIHjGfvqN
	E8WZYJ0z8UoaPxNIq6/HBriCqISu21yx8jk1zBR77KK4/0O0Y/xR3sRszd5Fy3MPFpaQnF5RLhT
	Eoo2sKAWBfFN+2Ey48G8m1uatg8Hiw1aWh/jmRYVuw8QhvqH2iJlc8qxCXSCU3CcDT9Ys+aflhq
	Hn/8kG4LyXqMguaK9h1fvD+JN5H7Vir/vJykh/dehYoay+yazXu/h1vxUc5gZER86tlTYTW4reO
	w0aJ5qaGS8xsCFvrmeMU+e3uyj9HbF5d6zZOkQaSkKkNLyMMjO2bNmtR8koLupPfKCMnwNIp8rI
	USibP8q4VL2dixq6XRIm9R8Lrrw5QHzBOWSC+4VHXQfidTN02mt142UYrQupz8exS1OtbIEkJZk
	RdZWs5k5OntLQMXfwI9XlgeduU+DwadkBzgCuy4V
X-Received: by 2002:a2e:a882:0:b0:3ac:8e61:fd7a with SMTP id 38308e7fff4ca-3ae126b904dmr12347471fa.16.1794490392858;
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:58 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5685755a44f6 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -214,7 +214,6 @@ vreg_l6a_0p6: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vdd_cx_wlan:
 		vreg_l9a_0p8: ldo9 {
 			regulator-min-microvolt = <488000>;
 			regulator-max-microvolt = <800000>;

-- 
2.56.1


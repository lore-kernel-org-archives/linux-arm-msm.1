Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF33DC4B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655296; cv=none; b=b3hQWBaweBlEXrolTSz69GtO+rjuaZdcCnFm7H7m0oWodFENaQGnmQf5ntUvOshF0dAOEymSNHndHOIbuc+ub006atj5Ny0ug6H1IGUim0mV0Ef8sdNNC2U2Y4auijc+lQN0ICgAWtjqTnacsmyXj1FmWuVhcpUL7893bvIdMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655296; c=relaxed/simple;
	bh=cFXjq2JXCSfmvvjsjl7kaIwIGpfd3uICNYyzTRRVr6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7nqTgUp5IUEueG7unSMfbMhtjHZe432svS/OtcqKk/UJk8SnJF2viNqQzpJBfMK5GZDUVfa28Hg0SOsziFM1rZOOkg3I8kYzaOtH631Ayr80vpgkFyhjqO7kNUdknyKwkOsDRpgqpmB4u+lhK+yjbw3SaeVKxpMsv5FS9ka6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=U2qJSkGL; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="U2qJSkGL"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so14384195ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1790655293; x=1791260093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/00Ko7gZUPuAiTpJB4dBnk2KXfjE/uS38djV/L4NvE=;
        b=U2qJSkGLwVHNC75N3D7jHJg6yXV34LZXxTC1qYxxz2WxEbXt/G4Ai8Sb6x18hcbyDj
         UJWewIbqzQCXsom078jmIevHvMWaTLYNWnkPBGzhxEWYl8ozBK85lzx77xxTxo2O7aUS
         axhS7hTfDqSp1CLVlYUw0ryWS3cMozc7uD+iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655293; x=1791260093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/00Ko7gZUPuAiTpJB4dBnk2KXfjE/uS38djV/L4NvE=;
        b=az4J/oJ67wO4p+832EK68+6bGcLKxk/nXJiHNXvmxdNvqPRJkqMPbsQ8GdnTUstEkb
         NJ7JRo1hCEC/5ETm8XGXh8zrbe9gjo6QD/XgwNHPIvHDdJbvsQPDjGflU2pEs621LhGj
         JXko0Cc77ZBKjw3NeQTg2omALMZdSDtM9zrtVDNzHdFht6cUUxvtKxOUv2oOpf1HRZt5
         PDSEMbIvKBp2IeMk0JxsKdST+3YCmn/67vFk20xsXmxr+i54YxVo+WbdffC17d1VZwD2
         lpBC77Oo2GoJGNzabqdo34zUjARPtLh8j+1fC3Q9yLX+e6/KTjJZ4D5tyallkiI9lrGU
         GMtw==
X-Forwarded-Encrypted: i=1; AKwUvBxw79nkOw09avr7bDkx5NHJhZ18A+/oLrFwnEVjuCYrBgGhEuAOsEg8uhMmvlgfBo0ctayIRkq3JISvXJOn@vger.kernel.org
X-Gm-Message-State: AFq9FYLeFXKd2RwkYyAIJO+bIGlRYPiqQ/UN8En0whBnxzdXSq+wJ4GL
	gVoa+z7w7BGu3M9FXib43ojkjVLaAj4RmXU1IOhNEO/20UsGoYJVl0cYRGDyhlq4FsE=
X-Gm-Gg: AYBFou1jZGRcyEJ7fQ1h8UIYOsa0bvW3TpfIgJelPpFxlCCiCtkc1ifKNGHgIaz018w
	NgbiwgO1BKqSa5MAYzBnv418R88pyCyS8doMRhieVdsLc4X0e3ZhgWG8zR5txLeGdZb94qdw5ZU
	f7SqRRwmP8qdED8qxWheWzUaNUFtY8VsBnN6Zipl6Qds2cJG1e3wH0L8nLnrU0bzzNWaBNC+11o
	DscisGkD2NmVBRd9rmBNN6cpJfAwXYV53giJHLxpIJ0hZWFPt6UEatkdTlsdD+n43nrlM6MZlBx
	U3smM5Wv8ZkroKGCaQTWsh82AlYo4FPSETdzw/g042vh2INnQKlIJkIMQB/uoPUcEl4tdiB1m07
	WsITHDssn7lw0ipE/CEklHHhrFpXl4px1dysy1oZm7bAf21zrQVmPZMRpHNnM62Vg97ejyp+G3a
	zjkxigh9HsGhW+HzR/8rggdhy8SsyvgnNF9KEg6R3Pk7QYqTNHjiS/EbIIKT+Tehf9t4vk2JpRW
	5lcSXVeDTq7a/8unwEeh8KzalQ+VWHaL0C15r0JIYBPdfEBcQad5nkCo3c9UCA9cTZk/bBn0SnQ
	cPb4yui/Lyq15orwGjDluk4Y3Ts4rbWQ3ekNOjbra491nLJSkNeKBwqka6pmH3I1mMdaSs2er6N
	RavZznbXGc8O7rzxSgPK85iw5uj6bvlYKbEGfMY5Vyps=
X-Received: by 2002:a17:902:f544:b0:2df:98a2:a2e2 with SMTP id d9443c01a7336-2df98a2b3b0mr90144685ad.30.1790655292825;
        Mon, 28 Sep 2026 21:14:52 -0700 (PDT)
Received: from aegis ([175.158.243.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c6f46976sm3192895ad.22.2026.09.28.21.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:14:52 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
Date: Tue, 29 Sep 2026 12:14:43 +0800
Message-ID: <20260929041444.9837-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
SE_GENI_CLK_SEL") allowed GENI to use 32MHz clock. This changed I2C
timing, making the Yoga Slim 7x keyboard (ITE 048D:8987) unusable
on all boots, and touchpad unusable on some boots, resulting in:

  i2c_hid_of 1-003a: unexpected HID descriptor bcdVersion (0x0000)
  i2c_hid_of 1-002c: failed to fetch HID descriptor: -110

With this change, t_high_cnt 3 and clk_div 4 gave a tSCL of 375ns
versus the previous default of 521ns, however the I2C spec has a
minimum tSCL of 600ns.

Restore tSCL to the spec with t_high_cnt 5 giving a 625ns tSCL,
verified on Lenovo Yoga Slim 7x X1E-80100.

Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Cc: <stable@vger.kernel.org>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6a39e21d5ed4..1336a09ca183 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -193,7 +193,7 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4, 5, 9, 19 },
 	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
-- 
2.53.0


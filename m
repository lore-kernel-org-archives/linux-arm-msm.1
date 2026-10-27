Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124354;
	b=VmuIOHcP083i3e8W99qFjAjHe2Q6nr3iXY/oez48t2xd/u+16sw3aJNayBhF+HdnUuxt
	 naDcH718uWjzlh9Bz8d8BDK/ejW2F8JbPRrUJ7T7h04GeGr0U3LGDI4t9kHUVkx3w10c5
	 lSylWrv4MZYoEXmljzV7BdU9VMoXNWJEXAS8WUbD5auffMXXUtZgkqkMYiaJLR4C0x0iW
	 2iCk5D5ZSNLt0k+5DU1fTAAEBbIC2f+cmOfT5K2ViXnYZFnDOuFcRvyiejlOOStdWrs2f
	 AVXdnJgFzEEeu9SUabQO3aIZwNzqVHQxQTVHWlxybfqFZP2tL3DJpbBZiqFlKtn50gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
	b=b3b4IwhCTurV3+FoL0PH/VsmmsaxIzyO1geK9tuYvkt9baFrNlImvi/PaQcWc1ogjZdV
	 kwBFN/HnzsxsUvAfowYHLswmDkgs3vPTsnYORwRLX582DCTGZON0Opn+eRhyRl2PoCvZe
	 vM3UmoBU/Iasekc8Wfzm7cjGwtyF4ElRhCCvbdkyIKvV14pwZaDzOV0JQmvSLAymwt12/
	 XsZrGF9VccHarrGyM8Dz5uXfRXPnsedCQkTWTSa9fG1pRtjUS0RW51/+rPlTwGttS02DQ
	 ZGI1cii/5QURoneqkiGfWOnkUUiSQbRF1/E5jN51Sckjo6vwtB0XkpNgGT/8Zx2Xhrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83737606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83737606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1212555e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793124352; x=1793729152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=wjC71WDpudNxsBmkC+HUupPNM3w1LrCXLfkkBxxZfDsa0qhcrOKjoQ/YNIWqX12EfX
         NInLwkqvGLE3q8LxUWANF1xanKknrqeYDj1E+QWq1Jn8GQ3TUPPI9GW+XH+3iUs1US2d
         yhM3Ii/z+dLDQtgeOtYNozep7N/bFDSjpTAu5houmKUkFFeoRt75jg5uQsRKHA2Dgmnn
         KgKt6IRC2L2JIrSxGIx2VPeS2aYKNY+TNHh/UTTGeA1lB2mBh0zM22JHmtYMYnUh8h6q
         XCodVJ/7BzW0bi7B97fsjOo1NCVvNqgx7xD24BTrfFqbEIYNAS6mSaMsUARSoXqam2uc
         TxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124352; x=1793729152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=EsV6LqKL4isf2okoyUvQnrXNOGTgGEKGJScga00kfBaGPtIvXgKW/ptqQ3+x65E9iM
         v+qSsoW2Y0Sto4PZUus7kjJGnqNTB32gPEDHLCLQVhiVxxvvxNq+ADtkeGdaSzXEVYFF
         WI2IWxPfhqcRNSZwhv6AN3DoTCpvgvNnClVK7o4wzY80zi0SMY0NHDTSDaQkt1F1YPLH
         xGwmLJRdAYz1jFc6LUAbU85hrUEOmGE07XsNHV+95dtX23U6WiTjdbDgCDTFwwNqbWph
         laoOiehvUEKEPOfV1HDSfIATlbfRoSwMciGRkAs3qdZaahbG1hbrTrPwSPbPZbF6Y3x6
         6EYA==
X-Gm-Message-State: AFq9FYI48ZeoLcf30as4HskNJHWEONcVpsTL6BQcAa7oKaEIWd861WzG
	h50Lo8ECF/5ctMkmiZsnTPtlMX52/PtoogS27CPRhlwzjTEe5GdHP50D
X-Gm-Gg: AYBFou1H+AsrhP3Rab+tREgdD6pz+xHIJwi2+4HHtblA6DkBaqmCt53g8A7SCNb5OTA
	+andP9k6T6A6O1jZ0HgHp1E9eOpcfPulbt0hT/yADmnEuEyGlnPMvEouxKSCik5POj3YofczZcD
	LkmLEZ7bYz/xu5O+sm0ibGO2qPp81u6RAwNKXS4ShSU8JiUA5pHAxKHwEXH3bfM6cuf5IK6FskD
	VWw0nyool5pIl8B5JG3EiHN/WwdYIfTt4Labzrtw0lRQwntmsJX3kHQ4R9Bh4Hk40ENhmN3xaUT
	UKDW+4BospX2lh89OBKqXtSye8bZibDx/ze1x3YfjiTa1NsPTkXW7vwyzhoOjnvDhsHNhWpD/Rk
	9RRsSM+GJwi5VIH5VwWzSiYJTKzA42QMU/FpJOZe0DNNc5OY59bSWs8hsSZB1KFp7zwu/2kHgGr
	YGImEnqn+cWGjiLwuA1JvoKM8w+EqgL93iiIXZCdlvkmR0scjlcJ/MmXvbvDBqL67euuTQ1Z6Z8
	c1vtFgRK39pUFDdZm9ONKsYIGU40KtRoL9IUht9XuwoTP7wMy24loIv6eK4Wy0VFmpkjBPS+mcY
	X+aEqDrj
X-Received: by 2002:a05:600c:8b41:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a77d22c51amr93525755e9.2.1793124351725;
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a92bd50b05sm8192805e9.12.2026.10.27.11.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 27 Oct 2026 19:05:43 +0100
Subject: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
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
Message-Id: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsHMSvpKdJBcayEs1oog+nvSc
 QZmHkgkTAn64gGhixNvMUNVFjAtLs6E7DODVrqtlO5Qplmjuzb2GM91xf0Q9CQUUFnbmLpurHE
 Bcr9nyff/Hsb3/QC1uay7awAAAA==
X-Change-ID: 20261027-rcg2-avoid-null-ptr-deref-0885433584af
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
removed validating of the frequency table entry pointer returned by the
qcom_find_freq() or the qcom_find_freq_floor() functions.

Since both functions can return NULL and the pointer is passed directly
to the __clk_rcg2_configure() function where it gets dereferenced
unconditionally, it could cause a panic.

Restore the sanity check removed by the mentioned commit in order to avoid
a possible NULL pointer dereference.

Compile tested only.

Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d7914e59129f..260e90f53461 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
+	if (!f)
+		return -EINVAL;
+
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
 	 * the CFG value in parked_cfg and don't hit the update bit of CMD

---
base-commit: 55981579b27b6541aeeab81c768f248dba0491ac
change-id: 20261027-rcg2-avoid-null-ptr-deref-0885433584af

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


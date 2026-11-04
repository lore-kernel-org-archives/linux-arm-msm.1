Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804265;
	b=mW+Es/b54Hc1JyJy8b9YQAwAL/gLOaUxlpQwLAqQ13ZX2hmZEnAFmS/mtiNKI2t8bPkC
	 CQjDWGHiSjHYUipGDTKKAuJpM8D3FA2ue1r5QQIgVm2SalZKXfOIqUe8+iCYuXsict1/x
	 RlVRFS6MFDwiUP8dWiUnJ5rxQrcCrDn0LdvW3kFH21VCVpRQ3XXbyHOuM32/QdI+GqGPe
	 nit/tOLH7VEL+I7TgVhW22FAJkWL/iFjZCDa/21+/7QqTrJT7Z58PtRUOZwxzRFb/YwSe
	 jLgH046wo52GvoEp1wOZHl0V1noXv8Z0K1kdavkZ+S+g3cbNtRf2H5Y0zDLESd7P4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804265;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=apXXgMBcXmgqhAAmBS3GdCjBKzXMpnkhL16Of9ur6Ww=;
	b=1Hp8oHlsjUlit4OoxW5mRjAjXgZ1AYuHUOxTY9tNzsVRbaVZeTuouHiLZi6QS2VBKyQS
	 VXvhx8g3no477jA86MHeX9HTvAnnvkSS45SL7wbJIQjHj3Zz0cu9wqClWXJQq0m4Y3eXe
	 JWnJOsmb0f/b5Ds9pcUcnstYFEQZ3qGruiDgNdK+EOfxorCNphKmFpHjx+l48uLY/P65Z
	 VjJv7NSuTbvGfg8f4poWzFo5XjRpweo81h4rYtZj5azSxiwvnmPBQqmQyg624/95Unc2L
	 S/F+XRFaSOu2YZcyYZMQn8kCSx6E6loDXIpY3l7HRyiuph2SglYmzijg4FzPOyYrtUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371E606D804
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7371E606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1147306f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804264; x=1794409064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apXXgMBcXmgqhAAmBS3GdCjBKzXMpnkhL16Of9ur6Ww=;
        b=F0HC5Y/IHdWHokkL/4vv1lBHjz65q+xmsESlFOHVWaIA0R4CVwY7GoMIWj4qRPLn+P
         SyFntE1Bd1SgyDyFAuIAlX4DhBKodbcVS+t+Fr29d2VBAFMmDLJXVz0+n+ADxfhDGVZz
         Ieg9tdTGm5O+BctUE5d3zHLNOswHtXwqRJo7KQR6/NkkHo3jZqfSmcJBabUWutbsm9jV
         BOZwvu9QX65eSWajbQNAIpTFHha8X1KSN3+7KZ1HKDF0K/tAPKaCQO+Uev/btdMdhuHw
         G8laHd3yOo1w6lNik0JNT6w3kenyFtGLp77+1CgsUtJhr9ok/chguXSuuyyocrLpm9zZ
         r79g==
X-Forwarded-Encrypted: i=1; AKwUvBx8YS0f9H8wvQN8zy04q+DfHKkuhWSqA4pCHgkm2jYzDXf4oNjtiOU1fO2FWcbcHPX2kNv/W6Gvu1NtGkWU@vger.kernel.org
X-Gm-Message-State: APuU4Z9rJFTKMPvy2nS2o87X0vB/A+s9j3Tv/zIKoNC7ptROvriX/q7b
	8CdrdYlahnBjK8UhwaDsmR/mFnPqQvxgnB8CL8lXcxwDgM15s4vHJhrdHNu/KoqJcaQ=
X-Gm-Gg: AYBFou2Bs5LVCSVzGzfIIQc62G5N0xQ3e7I6FFJb0p2khaOHUMh+EqR8DAyrCBreDjY
	ltVmQ2AGemN4MyHQG2JiolyrgOMG0UP3ZH7wvmOu1lG0C5c7opgRWNxOvKkgZKj/y69mqnToygN
	mpynmUv2WbCXI5bu3omw8Vn0OSbbYZqFkeHLffIkPGKXvmf16o7HRF+lGc4ovX/57OhkxkwrTEX
	Vk8yolT0GemGlqr3Lc8cWKydOXctftejw7qTna2PWpPRCUPYHfju0MQQVqfhTPh1rp5TC6QiJj+
	a7/U9aOfM01aUBDAmlfUxZQBE7snaeQnbCqV8nBvj28wQYN2BjVX1ixg4FkKl24yH9xH4Fc/aO4
	NiIunvOqg4wcuFpZ1noqnVByjvldxt3WsXZiKnnwIrdrOPu8Qd5EefS+acPS/2Jf2949Y7v2ndf
	qBBlysVZQURlryifsjYPB/QwJXs9Ys5SBAtXwZGlxjrdrGSGJxMj0CamyNf+7MyUbDlCkzA9vVs
	tOSwWsVB91S0xPH8EGK+OEN6o56QWE2Ktp1mM7ypaNamCjPMsVhDw2rGXvSfUUTPuRW1W8r3ABp
	V9mdhCm65uljW6h93pWzgTykIA==
X-Received: by 2002:a05:6000:420c:b0:48e:6264:c371 with SMTP id ffacd0b85a97d-48e6e2cb57dmr39441884f8f.9.1793804263873;
        Wed, 04 Nov 2026 06:57:43 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm4830051f8f.27.2026.11.04.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:57:43 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH 2/2] thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init callbacks
Date: Wed,  4 Nov 2026 15:57:40 +0100
Message-ID: <20261104145740.2623473-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
References: <20261104145740.2623473-1-opensource@grische.xyz>
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

init_8226(), init_8909(), init_8939(), init_8952(), init_8956(),
init_9607(), init_tsens_v1_no_rpm() and init_tsens_v2_no_rpm() are
marked __init, but tsens_probe() calls them through priv->ops->init()
and can run after free_initmem().  The call then jumps into memory that
is no longer mapped executable, and the kernel oopses.

The probe runs that late when fw_devlink defers it until the deferred
probe timeout.

Fixes: a7d3006be5ca ("thermal/drivers/tsens: Sort out msm8976 vs msm8956 data")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
 drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
 drivers/thermal/qcom/tsens-v2.c   | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 32d2d3e33287..a13897632b91 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -207,7 +207,7 @@ static int calibrate_8974(struct tsens_priv *priv)
 	return 0;
 }
 
-static int __init init_8226(struct tsens_priv *priv)
+static int init_8226(struct tsens_priv *priv)
 {
 	priv->sensor[0].slope = 2901;
 	priv->sensor[1].slope = 2846;
@@ -219,7 +219,7 @@ static int __init init_8226(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8909(struct tsens_priv *priv)
+static int init_8909(struct tsens_priv *priv)
 {
 	int i;
 
@@ -240,7 +240,8 @@ static int __init init_8909(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8939(struct tsens_priv *priv) {
+static int init_8939(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 2911;
 	priv->sensor[1].slope = 2789;
 	priv->sensor[2].slope = 2906;
@@ -255,7 +256,7 @@ static int __init init_8939(struct tsens_priv *priv) {
 	return init_common(priv);
 }
 
-static int __init init_9607(struct tsens_priv *priv)
+static int init_9607(struct tsens_priv *priv)
 {
 	int i;
 
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 7bda8e6087c4..ed0064f4e1ae 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -145,7 +145,7 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
 	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
 };
 
-static int __init init_8952(struct tsens_priv *priv)
+static int init_8952(struct tsens_priv *priv)
 {
 	priv->sensor[0].p1_calib_offset = 2;
 	priv->sensor[0].p2_calib_offset = -1;
@@ -173,7 +173,8 @@ static int __init init_8952(struct tsens_priv *priv)
 	return init_common(priv);
 }
 
-static int __init init_8956(struct tsens_priv *priv) {
+static int init_8956(struct tsens_priv *priv)
+{
 	priv->sensor[0].slope = 3313;
 	priv->sensor[1].slope = 3275;
 	priv->sensor[2].slope = 3320;
@@ -189,7 +190,7 @@ static int __init init_8956(struct tsens_priv *priv) {
 	return init_common(priv);
 }
 
-static int __init init_tsens_v1_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v1_no_rpm(struct tsens_priv *priv)
 {
 	int i, ret;
 	u32 mask = 0;
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 843dd29fad2e..22284973bb61 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -220,7 +220,7 @@ static int tsens_v2_calibration(struct tsens_priv *priv)
 	return 0;
 }
 
-static int __init init_tsens_v2_no_rpm(struct tsens_priv *priv)
+static int init_tsens_v2_no_rpm(struct tsens_priv *priv)
 {
 	struct device *dev = priv->dev;
 	int i, ret;
-- 
2.54.0


Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD579430CC6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352259; cv=none; b=DTA2J9J2lA60C8U2AxMWE5v52Nc0K6ax2W8p9inJnPLBvCsYLFW/XbayAtoBvgDY3xKVPCZfjGAeB7ajmM6sELktE9uUyvGEqZMgZovGTWv9RVOtsnTVB1rpwisiD1sBlQfpsxlsrcNazEcJo/bGYY9zxn7HmTizbnhfzzL3Ebg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352259; c=relaxed/simple;
	bh=XnHX8L5AF9ZaMRELajN5+CeiTtHBiHPfbPp2pHW49wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFcL3jtCIkYOzRnorNvauhi8LuqZnyTKd56FrlJ3gGvczHp0n0XXBCK8R6bTMbMEZlTmiDjPUsL/0toynoil5u8qqlqFFueWVMTP8p0KxpFphgyh7Yc7acF0QIibYBKlmd1kF7sfyIGq0+r2BAkPvM4Mp0NDHVZ60kzSE/MrUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeWH5Ec+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeWH5Ec+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-476a130c138so3310894f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783352256; x=1783957056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAsmhVeMGD8Mwep60H7tvGMGyolCd+7xtF2YlxHKa+Y=;
        b=yeWH5Ec+53PU4urzxqCxYNTJyS67OXkqaZ9EqCjzdDpCVKHDy2/gYXjm24CF3gB34T
         SkAAPsxAUUhq+WV+FXvVCWgd1ahEXlA6rL1UhH9moJbTc4oPtbo+KZbzlV3cvMOgg6o+
         GjMEyjVk+F5W2BC1DvMvCIkXkStOKMvv95fAUdfSCqZXuho809SoNU40zDofYWYo4V4i
         c5ZWkyJYQa/WiFL6KHdcuPk95vHwI+HfDs9PFqqyUFsrQeXNo5BR8QdexThLTFDXqunW
         EMxvrWRpmgCPsvkcrEvrBluYrkd7OcEmVzmWJE3UlpzxMJyuC8PyzmC/fFuYgWvBhK+V
         b9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352256; x=1783957056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAsmhVeMGD8Mwep60H7tvGMGyolCd+7xtF2YlxHKa+Y=;
        b=lT4mg1OSK31VG8wcz7gtb/rkc2t1WHbGqSLB33XDd5D5XSgiIU/CzL0pgoXXAZArEW
         rFeQdFqibnsR2Tl8ayXCzXqdnX+/mLSftqT79C0R2Hr5JwyW836vCms15T3BURidYrhs
         VQQ+GcnfF14XFOVBBVTbZUz6wvZOc9LeSVybqX4NG9MEsxFXXAtbrIG33rOBbCh+SQHD
         R9NTXn+eZ2qFXagDiGwlifb6Dgx/tz0ygT1nd0DdJlKeQoJ7DZVFYyGTNyouV34XR5Ys
         BPydP5XTQciNFkLSZRsVw2tIqHs9BzWyjqBTpf/MgXblJzXCnqxk0VkPCOE/Ugj+ecRg
         SNKg==
X-Forwarded-Encrypted: i=1; AHgh+RojYMbe/G4lLfyneRfLrS1M4fbpDuk1FpfzlxvK8nUSW9kI/YHu1l9Bt4Ed0SbIZGBIeeaLnIj5lyLTxYbS@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHTUJKKmR3zOlfYLdhuqlatj+vqy9vPEfJB+fSxGOShBAJrJP
	nmD/mupY6dlfXi1NSum93kfy7oNPXvBlT5MMdAgU7QUKKUjAxfbTBzOMAbqrc2jVFrA=
X-Gm-Gg: AfdE7cnuUDwRHlkkKzF1h3zHUlLVPSfqCHCgiX95zmD1pJV8qEViTriwE2CYNZhmjrs
	ddyGxfxSwmNK8L+2ISvgJcO1j13ZnssgR1SpREzmXsAwR72qRjEqn+iDuI8E+BGNkRyMbzwvgGQ
	4oNgm/oKbEN2tfATETjcalWch39Ww1dz6F8hnKlH1Q0ew/jYuHODi/dj6cK/rlU+xlxfXbJZU2S
	BawfF5U+iXJZed7PsOD//3KsblOvnuYMSX49SknZy/jUvv6xrsfvRVxllSSB4l0Rt9Zcg/cpSqM
	hpuOmIsub05UnkGs6txqbLSAF5QO9ldyrQOWRLSyofWgibAOJBZIolDy6HpAQrlYa+7C2LmwcW5
	ZkXd9tmzvTz379ebX5X/83/2TCIXLooMBd7G41KsFToMuIlm8+NcOq1BX074qLy9z62l5jKGr5l
	kTfjxAfITXakCGxN81SgSXAB18YA==
X-Received: by 2002:a05:600c:4b89:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493df090aadmr8526575e9.38.1783352256154;
        Mon, 06 Jul 2026 08:37:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm26216613f8f.5.2026.07.06.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:37:17 +0200
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

On MDM9607, the modem firmware exposes the QMI subsystem control service
with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:

  $ qrtr-lookup
  Service Version Instance Node  Port
       43       2       34    3     1 Subsystem control service

Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
service never shows up with this ID, leading to the following error when
trying to shutdown the modem:

  qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service

Set the correct ssctl_id to allow clean shutdown of the modem firmware with
the subsystem control service. ssctl_id 0x22 is also used by other
modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.

Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 425601af50d1..eb14308e7aef 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2486,7 +2486,7 @@ static const struct rproc_hexagon_res mdm9607_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MDM9607,
-	.ssctl_id = 0x12,
+	.ssctl_id = 0x22,
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {

-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499784;
	b=BSXe7ERu8bI2zPDqbc5SkPciO1i9dPE/ZOmsIW3wu3iUdPT0wk1OsdbJhiXVvhdWHM4I
	 /R2KvxQM1ybaEfKOUeWMTMZI95auiEKSFa78kYMJIwL0NY5Uv8o+AkMuiV/kLPWR7TP7A
	 SLCHTqx59+EbfJC69Iy2P8dKIzRw7aayfnBoIECk5IbkawYRsybLOxF2YiRXRHzxpYixe
	 vqT//WrbETHOZ+lZxc6Wej9IfWy3Ds02DhQWb5deeUpvK50hEqBBH5ni4z3/RH3kb6rPv
	 1o+SyvHlxtQiwSiBpcIp4V7eQ8Ch5Nc3uhrgiKB/0iYkypWXzfX+R8cUJufhiDPI8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
	b=MTcscflMbXec94p6vW01FBPPmvEc6BBhIg3QBCtn1ZPRn2Cei3y7V5w2JJpzmkEx2OsV
	 cws0y/utn2w99QBK6jivzE8EfdHSrjQy3/BwxNoQDBn7HaYLifMvthQYUNZUSg8Iwm6O/
	 kpkek65Jv8LEKbYkea6G2CrNFK9Ay4lo7NYi7tMrozpUT8Q4tUyaWABfINSGq1wqmoutX
	 fP/yLigDnIjAwtustOgE+g84rzWjjjfDjee4ZGM1lxCjuN3PAdYC05IazolyoBTYQNJph
	 UumoFjRN5JKeAdcTk1PeOnsrrJDKK3XTgj8b5EGF2xTSS0YtHFUSPxL6SZHkOLA9xYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqVc6QXz;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD03606A887
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD03606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqVc6QXz
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93efc0452b5so293879685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499783; x=1795104583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
        b=kqVc6QXzgemIPXmf3sUGyXwfEEKVcTxQIwTKzWLQCzXoQanQat8M4/5MUIoYRVgeCp
         SbK+q44FWJizK1E0AgDm1bLJCUrVbOWnOC/HQLOGYINAMRVbRuoKwozbzqTpI3E7+WFu
         AwkRdA1FXlVbUApBcg7Ori72R9hDGXqda9GptKaZCsi1wawpT+DlfniFYlWc5+qZkGkB
         WyQKBIl+k0TF950olx4z2A2uRAjFo+OIiZ2WoM8oDMdGhDp5HHLHris3UdbjuCFYNY5f
         +uFVyeIqTf0hNu+BmeCH10wbxB4B5WBsjxgS4votG+EaBuQjE2nKGxTcWCSy6W1BPyoX
         SpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499783; x=1795104583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdtkQJYBK1MhcTd4YCF2h5+7E/8dXhz0lllKlYRgzVE=;
        b=cwd+JSiKAsiqy4D4Of8mF7iaU0+YhBoj30DyJNc34+q/yr/7Ub831/WyNo05JnCEX8
         maYTgt8vyqbEm1DFjoDUFS1AkkPOd2RjIPb7ezXYY1VFyX6GCtrltmNhHz/yUGfT5CFp
         7SIaUxTZvaooghZO52Wp69HZyiDv7MdX47hAjrQQGci4xhrvSUIwm9OEILE5v36dwZ9U
         MitOqbO2FsLAbWGz+2gVgNRk0SgFIqz9jzXyl43qq6AwzY+Z5MUmjn44h2WYXRtUYLbs
         p1H9ER4mI24lYqTFX3IfJJioSQrlos1jdcHZ9n4bVH/3sP+dKrRadzYV6eMCZ/RYmXsg
         Jrvg==
X-Forwarded-Encrypted: i=1; AL+hErGZxkW0C8TYfxq8GPzgeiMNtbnRHq/L8bSeZ38tWqfTBLF1CwAqNPMkxnNBioMdhpnnLsk7cx6ngtQqotEL@vger.kernel.org
X-Gm-Message-State: APuU4Z9/zHPaRtfpjCJYFGxaGICEtf89COEoys6/zbrWycUkJfXdcvm2
	gYPAmnsk8njKTJi9UtQs2xRYTlEBizYjTfhk0+ngsrnwdxWwZr4YPpgR
X-Gm-Gg: AYBFou1rHrB8IpAYQ80rw2uRcwAzKANcYJ0Tg6lQAy/K3w7OPwC2UD0DLxVGufN/lcH
	RewkdF/2nnFTf89ANR/wBpuXUknY+hQDnS56KYls9Njy8VvFarDAjzuT/SW3sZVDIW0Sv6oNp7v
	SvuBhK4ech+NsUzJJPW+TE1a8isD1ukEXfHgi4WYF271sfQQ41pU3vgsEvh9GSoVZuJmt1az+vC
	hP0sCDrVKxehRc9jxtnN8qBLr+TM7IXfpPtJm9H+0XAWk3QRBkGslSMsRyqKcS4NEpaXmYqaBpS
	vVv2TkuaP6y/G5EhJWEGXm2cpmndM40sN6NSevfVtsNUHHzjcxiL9Tir0Xpf1bF93HU6K19vsM5
	GNmipir9DIA3IeZJpUQwBl3ohO0/3RJv1+14y/ga0SGhzK3qdHmLKaIm9Fn1OXNoDNmDbzLAPjX
	62wRm6JwLADx9/LvTbuIl/vmKFQsEf3MgADFqDrGUBAojWexuknCk9EwaGpFupjhPsBCUWmZX6I
	x7BYrfBt2Yc85tLAazb0k+jPmMyoO882M+QCxQZXtn7oXnUU/wqUPGJaYIkBudjVn667fdkr4qj
	RwvJzcIP3lrfPbsd0/14LBhmyaVaP7ImOk48/O973XrAyhv/Ny87f57IvQzUkmaIjRv/MatEThl
	/Pz8fSWxe6Pug4rW0ycJa3jcGNICpD5fVefmLTOZ2jCQISUcpAkjLr5nkVMVJofutZSvQ7r1WHd
	pgqDviEAjLVZjYZY1qpLdtXg0HzsnQ5FMtH/kxmpLzChW6ymXKNP2GhfkROFi9+1ofr68cqtIec
	i3X+CasLM3CY+gTYLOf1C2SR5L2hJ83O7i9P73LoU4p0F9jONotkVX6Z4fi0gGLrQ==
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr1051411085a.57.1794499783220;
        Thu, 12 Nov 2026 08:09:43 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:81cc:bb20:fc5:ca2a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7d2b86sm760012185a.33.2026.11.12.08.09.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:09:42 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Don't overwrite the initial mode with the boot readback
Date: Thu, 12 Nov 2026 11:09:42 -0500
Message-ID: <20261112160942.27909-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

rpmh_regulator_init_vreg() registers the regulator, and
set_machine_constraints() applies regulator-initial-mode (or the mode
derived from regulator-system-load) through ->set_mode(), caching it in
vreg->mode. Probe then calls rpmh_regulator_determine_initial_mode()
unconditionally, which for an enabled regulator overwrites vreg->mode
with the RPMh boot readback (mapping a raw mode of 0 to the lowest
supported mode).

Skip rpmh_regulator_determine_initial_mode() when registration has
already set vreg->mode. Leaving vreg->bypassed clear also matches the
non-bypass mode request that ->set_mode() just sent.

Fixes: 09d99ff7fc3c ("regulator: qcom-rpmh: readback voltage/bypass/mode set during bootup")
Cc: stable@vger.kernel.org
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 08e39499be86..da4764ffa632 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1961,6 +1961,10 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
+		/* Keep a mode already applied by set_machine_constraints() */
+		if (vreg->mode != REGULATOR_MODE_INVALID)
+			continue;
+
 		ret = rpmh_regulator_determine_initial_mode(vreg);
 		if (ret < 0)
 			dev_err(dev, "failed to read initial mode for %s\n",

base-commit: a2a6f6b0b394eda55bd3483ecafbdc8228819a98
-- 
2.56.0


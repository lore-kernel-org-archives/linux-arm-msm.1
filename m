Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531ED396B9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020512; cv=none; b=Ity4p7S5bHk0e+Zk+KEaZ0vQiyoA66mQj9SknKbGTyzMh8YwDaPo9Lzr8nS21KCixNv1+mv4uqF3N6Hrk8Ij+UCwfwj2POwB+jhHaP9DUIJqPpxb/zgnAK5Zayqr2he6KBC9tmFOCDFtY0+Ea2Z3hGnVwCWBBmTmmGVIV/0FFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020512; c=relaxed/simple;
	bh=EVlqX2cbaVjrfoKraOcMkkI7tkn5EwYgUfH+JxCZu6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPPPA64P7KUTdhmAS/Hzj/OAQPnQ+zJo4xj25IsW6BR5U4iSuE+wJCHHWpheWUQMlaWCkbhFz6l/yoFzvqh0rv7ZE6irROzPvijFxYV7383UqVzSCrnG/KYmR9mL7ljoJjH7HzSiCJWkjLHj7YJARgroxptMeQIr+6HX7h6y9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdlWLCs3; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdlWLCs3"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-841f1dfc30fso4615717b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 19:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787020510; x=1787625310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReHlwFtDs4koSeyd05a2Rx9h6n99o+4rueMddLy74wY=;
        b=CdlWLCs3HBdQGWfqg1xDDpnX1msKGGsLprC4JJwh/H3X0w1pCuFoS/FO6Sx1LSvBWE
         gwpBj/PC9/E82Hh67QRyA5y0VunPNv3PmZ+js9miE4T+OvL2MOMQjFJwFWss5762TOBe
         KtWhFyXOKsjIql/BI6BpdJaoGtFTeOT90eLindoBumnyHFbeRqjk5aR4VNo9uReCcLUZ
         rSuZIyGAq8rbS5OQZNwKEH+aGTubc4Vd+OfiGeP9In1VbNHAaL2iYgayxR7YjiTOEEl4
         64li8I+LJTOgcjMRNUbaUb4N4Jkb3o4O98qXdj5oFP65E7oJQ7LIL0tTtfX8kt/ylr4f
         f2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787020510; x=1787625310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReHlwFtDs4koSeyd05a2Rx9h6n99o+4rueMddLy74wY=;
        b=TS9rnKsLU3SDDBbualysQDPVz+mjXlXqjiv3n02kbBNd73E9DAg8SH6U63ypxKWFaQ
         1Z8HdAPArO0XyPDIP7NeXrY+WY8/YrnqDctM2m86dw9vDOhwgSRPCZIAPQonphUzqSyq
         PeVP52AmSgwjCCELX2G4jyow9ig1olrKI4upnfTKDlCekfu1dsUWER6Si3vJuDaldXss
         m84LdStNg2HuY8PzjnMzK1L3WDj6bePJMuYE/IwHIS2hmhQQPC+MwygiSYh8HR51jZ7Q
         pSIZ72yPGCVBAgUuL/7BDLjswWFMSUDYQVQ7NRyerb5boIHu3XPw3ksv9peff7Bt+5Pr
         1olw==
X-Gm-Message-State: AOJu0YyDjiWryBOozyvuYo3Ymi3WxGiBYn+6bJflVfvNaw5pLAvas6Ek
	dEk6LlBEcxfyUOn+v1O+q/dbY3RkuTOx8fWow8nwFRw6iSYVU3zimNKR6uQqLQ==
X-Gm-Gg: AR+sD13vl8RFza2T3b5UX8l4hyGvAOshLl8AhIgJEehrePTLWY0SFFuiyz5PWT3fZyw
	T2Kw/iZ+hef373OyQRCfcHEpxdx7kiYeZWGnU6zDnLV7DaZ/pFkZ+uIUzZ62Xm2d2mD6VFXt1Ed
	Pi10E3nziP9J5SQmp7qZVtl3KfjTyXs4CYJ2Ynmk6tVlI2zKX2Hxw++l1AqS/QDH/aGPepBHDkQ
	/FP8ZP30x1qam7nyHaDHUsc/9Y79zzmuFQHeHD/LcPX8Gn4oSvSQI2jLssdmOrpPs+g8fFe7hKT
	yhUET8/cJ2IaPu56rd3UolkLttPNQRDMxsMDDQDpt7Ee8m3Wqb0VJV3NMTy5tfq+6M/WcpKpeac
	mE0O/21BDNWUV3AYRJM94O2jhPYaP8InEyCkhzbFwu3TicvXVbkn6QSjapKS0WjTtoFoVtqoQIf
	Ms5LIIdYg7yu7HJyJgxDI3qaL5sBFAK9cVqza+30OcaeC8HLpikoGOvJyYlasL6B5c0OJfM5cZF
	vo9B8Peb5pij82MhduKlS8s3+FE8fO7JUSc1J1Z3am5sK9cAbEoYf50lckP2g==
X-Received: by 2002:a05:690c:c4e9:b0:834:fadf:6050 with SMTP id 00721157ae682-841a453a9e5mr13400967b3.16.1787020510113;
        Mon, 17 Aug 2026 19:35:10 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::6219])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84068077eb4sm14765067b3.10.2026.08.17.19.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:35:09 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] soc: qcom: smem: Fix signedness bug
Date: Mon, 17 Aug 2026 21:34:41 -0500
Message-ID: <20260818023441.891274-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function smem_dram_infer_struct_version() returns negative error
codes and 'ver' is an enum, which makes subsequent condition (ver < 0)
always impossible.

Fixes: 1d234eeafc56a ("soc: qcom: smem: Expose DDR data from SMEM")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/soc/qcom/smem_dramc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db59..3a3d2f8f1775 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -371,10 +371,10 @@ DEFINE_SHOW_ATTRIBUTE(smem_hbb);
 struct dentry *smem_dram_parse(struct qcom_smem *smem, struct device *dev)
 {
 	struct dentry *debugfs_dir;
-	enum ddr_info_version ver;
 	struct smem_dram *dram;
 	size_t actual_size;
 	void *data;
+	int ver;
 
 	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
 	data = __qcom_smem_get(smem, QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore


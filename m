Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ECB379EDA;
	Fri, 17 Jul 2026 18:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311608; cv=none; b=fQ03/3NIq/Ht5+ZxL4RW211qszjEfJfQXQjsErIf/WxIE3DvK7c8ASgFaI1/bRDQ7gEbASeEnInc1MVVuKGw9qYzh2LRXNklUkyELG7wh274xtkM8Yx7067mWKE5nSzshYhLJw0/yNR+F3mryoPS1BTjFgZ3kiWWVc6DgVt1o1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311608; c=relaxed/simple;
	bh=2FgJeavxO+ub7awhURuts4G1ByQkH8UcDrV1LpS/kYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=go6A1vg6BRd5ypoPkTjRMiRknid3laq+AO2ktQpLuT0cnPXCq+kNZ13zWbGf8L8WY90Wt94zeFQXL6dcJIXziBHw8bq42EFZLKhRAhQLumfPz/AoeOJghYEShKJV65nG4xigUjTh1fzJ0YJzGRNKwAAawgV85WugPso1GoTOIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1k/emzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1k/emzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2921F000E9;
	Fri, 17 Jul 2026 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784311606;
	bh=UIZqeYCqniyRH4iZexQUuomNO/24C+sbwjpwtBrCYM8=;
	h=From:Date:Subject:To:Cc;
	b=c1k/emzMQnZVXmRW5WSznPIIxAxwHVtgGgc1jbiLJE6eISPIFRyN/DmaJtQuFiTU8
	 YjZP9GJh0V+pHMnUxKoUmienG6xou+6HmVB2DS8qW0F4aUh/1LEt3TXx+RbeVAEjHG
	 hGcFAO4wSxS36jN45nNPdrAgSs/0Y82EknxsoD4nQMofyoee7qnc8FLXOClkviRgUf
	 vjFJVASZ7LWzpnq/ql0QYDcICnQ26ZJHsatS88omiexmmlQUrIN0e1/HHWi9NURKvI
	 FQHB49wzuvcSbovpVxn9kj+X/EvLKBO8Joi1/y/ca2cxnDAd9/OBwluqNqB6NuqpAj
	 DBqEGHZX8rqBQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 20:06:37 +0200
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Define the TBT extradata
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-tbt_extradata_fixup-v1-1-5caa18f1c8d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPjcQLWr0KqVIEqft9kFDshZBv
 HujPn4M82+UEBmJ+mKjiB8nnqeM8laQ/9jpDcVjNlW6anRbtkrmwF6JkwGrRDtascOL1yUoU7s
 ad+NMB035HyLycLYfz8tpcV94OYK073/yiQ7zfQAAAA==
X-Change-ID: 20260717-topic-tbt_extradata_fixup-85b5e38b89e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784311604; l=1567;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jHkd5VL6bw0j7DXh1rZyZ12Rld5znjyN4IgJ160qhvc=;
 b=fnR/naoFtEj2qmvrIWhziZ/BfuaP1v1kQm9mqxq2UgNq3ynrR+M1MPy0QXV6fDP4y90+AlvMw
 THsxPeQMB1fA/JKoQuNdFrU2COdogytW1/rje7LJxpo2cWWybwLCUmH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Before the fixes-referenced commit, there was a trailing 'u32 reserved'
after the payload array. That commit gobbled it up into the thunderbolt
extradata. Push it back where it belongs.

There's no functional change, since the outer struct size remains
identical - struct usbc_sc8280x_tbt_data and therefore the union it's a
part of made up for the difference and the res bytes were ignored
anyway.

Fixes: 0539c5a6fdef ("soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications")
Reported-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..13c434f8d03a 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -53,7 +53,7 @@ struct usbc_sc8280x_tbt_data {
 	/* This field is NOP on USB4, all cables support rounded rates by spec */
 	u8 rounded_cable : 1;
 	u8 power_limited : 1;
-	u8 res[11];
+	u8 res[7];
 };
 
 struct usbc_notify {
@@ -74,6 +74,7 @@ struct usbc_notify {
 		struct usbc_sc8280x_dp_data dp;
 		struct usbc_sc8280x_tbt_data tbt;
 	} extended_data;
+	u32 reserved;
 };
 
 struct usbc_sc8180x_notify {

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-topic-tbt_extradata_fixup-85b5e38b89e0

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517986;
	b=kK44h5GaY1TkRqsvAm0S/u5jptTEivD+LJeI5EXeCZX2knfJlL/TNpuBQEgDTvy8Pcwn
	 1rDrSXEdhtEgW5TPeE6mzLMmAu+e4631f4+1IPEqK22LOrMQ4rJZ8c+oJIxLgnxXT0DVV
	 LtgcKtMYhKh3cilqYFjqvqL8Xsv8njZy1Dv4/kcotJVUSw2m0hDbnfCwY+6imDJu4dofw
	 yXsDJjU+xNszVOqSG7qq2ZW77+4jv3uwKxaN5X40uqpAZtJwkHnT1cJ9N+J6So/MRyyjg
	 jEqRz0OBQbYZHnfPFPWD9WQY6D5nLB6dPbCQIZlNSuMOf86bxLQqxf26mWm9uzJVd7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517986;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N6uRvXXdbzOgrjlg7A6t0V38H3wfSpwMq99VV1NJOwo=;
	b=5nu9K23Q3n3ChBNQ6xX1XudZgKcMet6I6ex8Ga3laOk+IVws+mt2FJtlSojOd5pE7V2g
	 2gI+iabb+1vUd30alkzNpVaxnnlCyDRAtVY3T4l7xiX0XwDTi6427Ss+tpJebsYtJsxGF
	 N/oZwFL7lZy6BCPYIoqniDrlrgHnnsDSATyI4gb9EG9MbViU3ZaGKB3oo0PtVu6ge+pzI
	 NwfnlCEZ3KklPM4NDv09eKPsWdFpPBjStgeDkmHkbevghiqUFDvEFOVbTmdVoBO11XuZK
	 2seQZkH9Anibp1k9flXrcqc7iT7O+j/WYtDm+dWXJKnadCBQMbCGETAO8PC+v+rYAUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZZ5wkF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58058606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZZ5wkF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679511F000D0;
	Tue, 24 Nov 2026 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517985;
	bh=N6uRvXXdbzOgrjlg7A6t0V38H3wfSpwMq99VV1NJOwo=;
	h=From:To:Cc:Subject:Date;
	b=ZZZ5wkF7Y+r0J83uaENM5lJ6oQAKF/X3KqHuNs4rPvT5Q8nH7EOvpL4uEZVjANp+4
	 onF9cQvlzDs/E7W88ZzLd/B1HP9p5+5AxuhkRrYHweJ0u1mTN5l+PRAwyB4RnrJiiH
	 Wb59aCcHoj4ycg6ssLOX8r5+GOd3J3fXIdlVLC+lbQLIKfqRfHSpbA2xp5fOb4pssd
	 H16eFyWkrMDKaXvgTZxLy7mhn88Ao65ItIIKnawtTUiw4NyG8A8rbJm/aiqZYBscpk
	 n6mIgPQ6Tn6w2c27o+MphiQ2ocyppS180BXxpHFWmyMXUm8fUtJhQ/nKHnIH791s06
	 6dPrf92RpGVdQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-uniphy: avoid build failure from duplicate PHY_TYPE_PCIE
Date: Tue, 24 Nov 2026 11:59:17 +0100
Message-ID: <20261124105939.1440586-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

Both the DT-binding and the driver define a PHY_TYPE_PCIE constant,
which clashes at compile time:

In file included from include/linux/phy/phy.h:25,
                 from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
   15 | #define PHY_TYPE_PCIE           2
      |                                 ^
drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
   47 |         PHY_TYPE_PCIE = 1,
      |         ^~~~~~~~~~~~~
drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
  127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
      |                           ^~~~~~~~~~~~~~~~~~
      |                           PHY_TYPE_PCIE
drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
  135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
      |                           ^~~~~~~~~~~~~~~~~~
      |                           PHY_TYPE_PCIE

Nothing uses the definition in the driver, so just remove it.

Fixes: b28eecc89399 ("include: linux: phy: Add phy attribute "type" and associated helpers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
index ef8709ff0e16..499ff3ce3b28 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
@@ -43,12 +43,6 @@
 #define PHY_CFG_EIOS_DTCT_REG			0x3e4
 #define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME		0x3e8
 
-enum qcom_uniphy_pcie_type {
-	PHY_TYPE_PCIE = 1,
-	PHY_TYPE_PCIE_GEN2,
-	PHY_TYPE_PCIE_GEN3,
-};
-
 struct qcom_uniphy_pcie_regs {
 	u32 offset;
 	u32 val;
@@ -56,7 +50,6 @@ struct qcom_uniphy_pcie_regs {
 
 struct qcom_uniphy_pcie_data {
 	int lane_offset; /* offset between the lane register bases */
-	u32 phy_type;
 	const struct qcom_uniphy_pcie_regs *init_seq;
 	u32 init_seq_num;
 	u32 pipe_clk_rate;
@@ -124,7 +117,6 @@ static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
 
 static const struct qcom_uniphy_pcie_data ipq5018_data = {
 	.lane_offset	= 0x800,
-	.phy_type	= PHY_TYPE_PCIE_GEN2,
 	.init_seq	= ipq5018_regs,
 	.init_seq_num	= ARRAY_SIZE(ipq5018_regs),
 	.pipe_clk_rate	= 125 * MEGA,
@@ -132,7 +124,6 @@ static const struct qcom_uniphy_pcie_data ipq5018_data = {
 
 static const struct qcom_uniphy_pcie_data ipq5332_data = {
 	.lane_offset	= 0x800,
-	.phy_type	= PHY_TYPE_PCIE_GEN3,
 	.init_seq	= ipq5332_regs,
 	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
 	.pipe_clk_rate	= 250 * MEGA,
-- 
2.53.0


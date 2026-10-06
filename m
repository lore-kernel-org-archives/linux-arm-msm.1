Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641F2C15BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268059; cv=none; b=QQuzbusREi9kSOHhp/wF41DHgkWB3h/+41Xn9KlQpk/IaqmuJkJwIw4JCCXSXfSMujINf9A1c2Oe5x3BTV3JgSchiaBQR36z/44PUYNrZVAzvar5aHv0j+kP8Kt2Wqui7T8E/jNdlVnX0BaNXkn5K+hW6f+CE+Pwy5yrqWr2aK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268059; c=relaxed/simple;
	bh=xSxuORG1HORqXwgd1D2Pao2qpG0YgIMnbGQKbAk7T80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p/ndlMD9nDKRVItgE+tQtLnMA/lzpF59k9Gq/al4zjWLN6pURQVlOTX2Ty+boC6SQAo3HucwLGwr1jkzQVd3M+840lYLW2BAXXYmpWcY0t2nWrBx6X8y2esowBfScuf0Lot60kkJAtEvf8BZ33XnQL93HK/YYQWn0os3y//z9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD4fTVmZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD4fTVmZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17534505e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268056; x=1791872856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=KD4fTVmZhMWIN6QD7EbNVAY8jwriCyCyTKoOMC4FiroHax3lFWiEHMVoA6U3zeH4IB
         1xsCzLY6CLaV5pgHxG5rp2HTzMP4r3MAeTu3NEyMl9/xV9/ryidXhwCI3VjFRiVLmEdb
         OluD1Y1H6NpDklfIEllnGWc6lgZJ0XpjwML+eYaQLQN3IusZTaGupJgyYCypd733pfqJ
         gX8tM3pBnUi1fearbeyTvhIqyMBOTTZOFqStBlQEJQg7b8nK2KuLKRr3QOhxwPtVAwS7
         1NCnXOswd3HHyRFBufb4PW3hHLwcvwkJvWZ/MIv2WEWDVq5bnjtYTdf+Zi61/iXLqF5l
         ft5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268056; x=1791872856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=I5Iia0ldoMdV1YqJ74wi7mAj2BkfJGX0Qka9r+80Bk1Hf27rtCLJk47afnutjiFnNO
         y3Bi5/nh6+sWw/9AhEPM/ebwBgtsD/qNmINFr0fy9tfnMni1DyuRJS+q8g3O9SMuQ8ed
         FBavIG6CcVguLsd2Hn5O/n56rHRLJ+D7Iz6Xsx7TQAMmvKI06flNIJPStgp+YoHBkVoJ
         us/ZKTHqfCRPP5F+pHceU1BSZQFa8L+FR42DSDu4Eueubr3k8ICphKi5NUHgE8zoaMAT
         c3I3inYx9AWaryWDeKItjFL0/7a5j0M2XWyzmtJMeY7Y76hhQ4PU4948+ZNXFmqstrP9
         mv9A==
X-Forwarded-Encrypted: i=1; AKwUvByWim1Vm3LIsouIoKYKyD1tZ8XtRL0fdNmMSKFnrkar4E1K9n1wtGwWs6bw39s0RVo57BW3BCOC2NXZB7aQ@vger.kernel.org
X-Gm-Message-State: AFuF++nq4qDg+lGXjLDdoGRUbAhuOFyZ9gPdDL5JBAGg1blaAFsy4DKU
	B0mwTHX8m5VYbzk/rJYDFY3QANwAjrgWkTYys7VeIXxtu1jR5YzQ24fu
X-Gm-Gg: AYBFou2Dt0sKFNg2kk6tTWenRDZnYpNrtL3DIuwffLv0m3+IFwLAiQypxym9o4/mUe5
	8tzwf86kDTcKfIIqa5m/jqrwVBESE2I4gzaXAsW//NzcQ+lbUa2jFvhZEuFjOKvoajc7U+EFS+0
	V9yY0Zmvu8cysixvm2/sH+vJHp8U1bzNQ2I4YD0W2o4QASnEdaTHz/3vbKwSBOP2DuHrwWfaYZ2
	6lPhEAgVbWgP0wOVuwRit0bldZL611CEux8kDkXMc68vuSxsHjvjK/fhkeowGN+RlqjaCmPfwDs
	YhJYU2tb7+1oDBb7cVQRikAP+3Zo5JIHd8XCsAEeeaAGTC1g1uNWP6uRgdHik88EjOyrBAzhbah
	nfwpMfsRcWydNv22enGvOMFQ1nJIdlIWjLRrUIqEaxg5TukkWbJFUnlkDeTWdMfWW+GJ6rbz7yL
	cIF9RpGXGBi93VQF5W6Hliq/OlvjLg0ktSEPq8bxck5DGNPynq6kxY2is0eVPf29ybeyyh3c+ii
	aY+GL6lbL5MVFlAkXN1pg==
X-Received: by 2002:a05:600c:a116:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a1680e94e3mr115543345e9.11.1791268055657;
        Mon, 05 Oct 2026 23:27:35 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm311830615e9.2.2026.10.05.23.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:27:34 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
Date: Tue,  6 Oct 2026 08:27:28 +0200
Message-ID: <20261006062728.45007-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
WCN7850 hardware rfkill input reads as "radio off" and the OS has no
way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
but DT platforms cannot. A DT property was proposed for this and
rejected, because it describes what the OS should do rather than the
hardware. The suggested alternative was to handle these machines in
the driver until a connector binding can describe a broken rfkill line.

Add a table of board compatibles and hardware revisions on which
hardware rfkill is known to be unusable, and skip the rfkill setup
there. Other affected machines then only need a new table entry.

Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
booted with the unmodified mainline DTB: the interface is no longer
blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
and microsoft,romulus15) are based on reports from Jérôme de Bretagne
and Dale Whinham. I have not tested them.

Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
Changes in v2:
- Use a table of board compatibles and hardware revisions, as suggested
  by Jeff, so that other affected machines only need a new entry.
- Add the Surface Laptop 7 (microsoft,romulus13/15), which Dale and
  Jérôme report as affected too. These entries are untested by me;
  a Tested-by from someone with that machine would be welcome.
- Retested on the Surface Pro 11.

v1: https://lore.kernel.org/all/20261004165132.4313-1-franzelfranzel@gmail.com/

 drivers/net/wireless/ath/ath12k/core.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..67d4c98fb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -72,6 +72,35 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 	},
 };
 
+/*
+ * On these machines the OS cannot control the WCN7850 hardware rfkill
+ * input, which reads as "radio off", so hardware rfkill must stay
+ * disabled. Ideally this would come from the connector node of the board
+ * DT, but that binding does not exist yet.
+ */
+static const struct ath12k_core_broken_rfkill_table {
+	enum ath12k_hw_rev hw_rev;
+	const char *compatible;
+} ath12k_core_broken_rfkill_table[] = {
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ /* Sentinel */ }
+};
+
+static bool ath12k_core_rfkill_is_broken(struct ath12k_base *ab)
+{
+	const struct ath12k_core_broken_rfkill_table *entry;
+
+	for (entry = ath12k_core_broken_rfkill_table; entry->compatible; entry++) {
+		if (ab->hw_rev == entry->hw_rev &&
+		    of_machine_is_compatible(entry->compatible))
+			return true;
+	}
+
+	return false;
+}
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -83,6 +112,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (ath12k_core_rfkill_is_broken(ab))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0


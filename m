Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3D27FD43
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563402; cv=none; b=a0wt2MX6SjL1NbyJ5kab+LXUDuOCthWifgHGOLiAXFX+9h0gypD+Y79mTtooO0s8BIWBY787Rqsm4k173lVN32wMmrHY6NX20t46zMPo2TSoDYZxQqZTzulejoY6SWK8/SEYmF78hlbr9G9nIMx+/Za5Stnt6Q0nKoUpuBUBh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563402; c=relaxed/simple;
	bh=97JmprBqbeoexeJnNQ50AWIZviL4S7SD0NO1tVXsgKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWle9VydvkXgNXyjSfcxEZ/RK0ydcMVaNx4pcn9Cj50DApVw3ino5hUP/b62Dib5sHdrl1OR/RC23/V8rZ9Vk2INqehk/PPaDektm88tYsi9Kb8haeECmsgvCHA1Y6UAR1i7X+zYhXdJFE+ueYs0igkBMYpFouCJRzHs5Qi/rE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWpz5N1r; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWpz5N1r"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so472234f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563390; x=1790168190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ka5zpxp/jCsYjEbSlG1itlHgACxSBnD5svSTVFgMxoQ=;
        b=BWpz5N1rKqSglVhiC7uzoHIaVvtCEIFpJuQ9DShTdK5FnCq6mm/eIizPONhVnkrUjD
         4/IZtlWE8D4yFu7/wcQoi/AAd/if/4CfdYAruU6xaRaKDOacQq0B/2a8YrvqjVud74h3
         jDnSOZt3X4EP6YSezi18J2TuD8Z6MAdKRbRtFECiUWiLC6EyTBVop1x/VdsytiJFJbO0
         Zf/4QVY/bXHJkJw/LdlStS9yzStkSbNaEuvlgaIQK9qr2rOpzIS0EMgXIXXASiB3KfuP
         tiWuehPLTlSD19B3QNDt78A2yCV3KPr+lbsD3UEAve5SvrFda0KWAqSipZJXDtj3piuE
         KhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563390; x=1790168190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ka5zpxp/jCsYjEbSlG1itlHgACxSBnD5svSTVFgMxoQ=;
        b=e88cTytERtIp8JN0CWQdVh8Qnji7pmR4P63APY4glMgYmHlldZayH6zPmHSJrSZmu2
         R+UyU6n2r/rkJlaWKdN7x2+tHLlLenN8Z4u2Icw7d7M+MvguqcH+XCNeYcSQGU5KBbKX
         7so0LNaT2bUsqfO8Bs2r5FFB8a1MMnJOP87vB/xf7y+7W1Ju8qC7hzDOW0zZV91+ykeS
         hXXWMs6qHZpkEahKDdaEQR8M2TocAZIos0xv4VG/qKMm2h53smud3Sy6Q9tU/O1ihPjH
         dBUyxQeK8mSnmEM9EJ62AvxOk5Uzf1DAQAV7D/t3svFD+VTax3Ji7OnnwEBAy0KcQpHu
         7fjA==
X-Gm-Message-State: AFuF++mHZQqKs7DxW0GdW7KiyucGSVi76CMIIPARuLzVmWc1HIrVlv/L
	++6rHeB7aU1mjs8Ml201i6fj4PpKZhq3IgqdeWM+481MS6+jDVykDKlS
X-Gm-Gg: AYBFou3P3R+DaEBYHOYrBJ0hAeXFDNs3J1fwEIXKn38FSuXKzWRN4sc4NDVIccBYvoQ
	ClJLx7JpbzmWbiW+ao/IB41hT0lwt+kGe/kc4UR2+b+MOyrfCfSzhG1CinN0+ix01gAn1+nLMMQ
	vIBDkqI+7Hj0mhNRDGv9lZt/JsMLvqrfNwj9MwEEfgd+LwHa9MYnGL/+cx2MOTSSR2W2RH9Zimo
	5lshti/WHV2IFpeUeADu+OAQZm4qkGTuxlC6gk3tP2FiWDo4Mv9tJnTZmurldQN60UGigxaUYoj
	wQP8g+e8VdJlx4Sjr/zJnPHG4d4wKNAJo+VEsI1vqvUTVi/FG84fxst4VJx01ysYHTtPV0CbQ87
	2MBztOLWR/ihCMv6JC2NRhQd1Osh+E4nRy/qL6UwDJUhrwiv2xrrMNYBINKh/H4c/kh+Oh4Jbx+
	WZuLMsRGqo62mR2rnfD4IQO+qJnTCzR/Cjb7nwT8ozfdlGGqCGsLoF5pOS7dOaaqGk8fi2gnIqp
	rJuMVZVGso=
X-Received: by 2002:a05:6000:460c:b0:487:767:b301 with SMTP id ffacd0b85a97d-4870d2921d6mr2931012f8f.57.1789563390295;
        Wed, 16 Sep 2026 05:56:30 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm6750729f8f.24.2026.09.16.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:56:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec callbacks
Date: Wed, 16 Sep 2026 14:56:19 +0200
Message-ID: <20260916125619.4587-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125619.4587-1-okerixx@gmail.com>
References: <20260916125619.4587-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_reconfigure_phy(), which the
typec mux callback and the USB4 init path use, tear the common block down
and bring it straight back up on an orientation or altmode change, but
they discard the result of the bringup:

	qmp_combo_com_exit(qmp, true);

	qmp->qmpphy_mode = new_mode;

	/* Now everything's powered down, power up the right PHYs */
	qmp_combo_com_init(qmp, true);

	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
	    new_mode != QMPPHY_MODE_DP_ONLY)
		qmp_combo_usb_power_on(qmp->usb_phy);

If qmp_combo_com_init() fails - a regulator, a reset or
clk_bulk_prepare_enable() - it unwinds what it had brought up and returns
an error, leaving the clocks disabled.  Both paths then carry on and
qmp_combo_usb_power_on(), and dp_aux_init() after it, write PHY registers
with no clock running.  qmp_combo_usb4_init() already checks the return
value of qmp_combo_reconfigure_phy(), but never sees a failure from it.

Propagate the failure instead.  The PHY is then left logically
initialised with its clocks off, which is the state any forced bringup
failure already produces and which these callbacks have no way to report
to the PHY consumers; what changes is that the register writes that
would fault no longer happen.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index f6d3320a59d9..ae70ebba36c4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4601,6 +4601,8 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 
 static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new_mode)
 {
+	int ret;
+
 	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
 		qmp->qmpphy_mode, new_mode);
 
@@ -4615,7 +4617,9 @@ static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new
 	qmp->qmpphy_mode = new_mode;
 
 	/* Now everything's powered down, power up the right PHYs */
-	qmp_combo_com_init(qmp, true);
+	ret = qmp_combo_com_init(qmp, true);
+	if (ret)
+		return ret;
 
 	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
 	    new_mode != QMPPHY_MODE_DP_ONLY)
@@ -5166,6 +5170,7 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
 
 	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
 		/* QMPPHY has no orientation handling in USB4 mode, don't cache the setting */
@@ -5186,7 +5191,10 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
-		qmp_combo_com_init(qmp, true);
+		ret = qmp_combo_com_init(qmp, true);
+		if (ret)
+			return ret;
+
 		if (qmp->usb_init_count || qmp->usb4_init_count)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
-- 
2.55.0


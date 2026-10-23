Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758842;
	b=mkVm1CKtBi5Bpp4igERnxQemkQh+fpINveW5BqK4zaDSH5F7YM0NdKL9kxNMEs3cV9BU
	 O9d2fAnXeAQrRr3KkkL1RQRe8AbaXg90u++aatqwfx3w/tF9l1Nv4anA6EEsR4hNbQjtK
	 BlpD0bwUcanBqwciBVk/ksf4bsuJdWYd331LG9+2psqiaU8v2eMC75W3H0OGA2d9JxMcZ
	 t0sMWjI2+g7TtfDtGQoct87GUlNEgOv83RiBHWoLxhLut5lYIQcxl16tJz2bVOuch0YZg
	 KQhEk0fpm5qscDYD0uZHyVw5LfDJGNFNNjqpAaOsLkzDFGxsh3McyZNp3LgarBKRvxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
	b=H8Qy2ElB9fI3WafcFrahmvY8w+sDCjME0ti35MBcBQI4I2Mb5z/3+qP71qh1Ueh+3/Vq
	 yB2JNAT8Ml7/dRBoDhTNGk4EBgcl6rv6Tesy7VWMfxnq5UX1MFQEAKVe6LJ496iKlg/xH
	 f33IYBiNoHOAOvMDxAGJqAMQ7D9KJET23dPVaYcUC+hZg5parZZP86kbDAHzhpnbZBdNq
	 1nf1opg83EPn/9XlK2T7sNCA1PwYML4oXNe0w5Jm6DvkZfHMNGxEaHIOfHATnIgO103hS
	 R79GnlFnvAZl8Jzao76ZfrglqhpQm+4Ma1u8DrPAt9Va3Fah3pzLzllrjmnWJ5Ze8MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A48606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso527124f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792758839; x=1793363639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=pMlORL2I6+7rhNHqB8En4FG5uhwxzwQF47m2miuC9rrV66FJsPYjqlo7yAdff8y5Rb
         UrvXjKaBs1IuPVfTNGy7PB3il8E5izR3RNho35cXnFxIAM6ZASelIgsLfg0zIU8GanDS
         QOgY6HDQR8mokySp6e9XnUwVOmSlihQNYA5In1E7/vYyOUX1gTaP2e+7CJfmEzHqtpXS
         4hegguegEOf7uVQQHTufUG5dvGf9isXtLLZPooCltDkrlToJxoRwG4vekDuPdDz4GcDe
         0uOYWV+zoJPTkJLEhSM89XwyIKrob6A0opj+zhUd/dAY0B2Sut1taPxfkyLl2GRZSDxF
         mIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758839; x=1793363639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=CZoZoXKHPyq4PD0Nm3XOM2gQmpkYSlgOpfZ59ZTlbOaf+Au4MigAjxklaGuYDJVrAZ
         f6O5VDUM6pAoyfiV6+VNiAGdqit3WS2+3jLUpQrPsvU6RlQrJn47wlyeNb2X0pQcs18z
         ByxHSU91zL5gNs6LQx++IVN8Op0cp4OqGvhEOQh+sstFDV2kXOmfVoFWi3dAJISizQjf
         wfZwE8yfRK02c1Wj+mj4kr9aWFe62Kp51kxMrAm44I1TZl+woI1U3M7mJ8nRcWmYvtX6
         B9ISsJnQT0VGHpa+MdwgcvkSEbP+TAmICk7k71FeO7Jf9+KtuQkkgZVKwktP4ruilGU3
         APxw==
X-Forwarded-Encrypted: i=1; AKwUvByzpVcfgzfNtnAwSH+S4EeGfKHxDuqURF0cKTUl5X9xUfdgVzZGCHlkNDCNaDlwUOZIOryL4qlJa//9hFA3@vger.kernel.org
X-Gm-Message-State: AFq9FYKqBe4FyiZQAnmOS0WYiuT6sX9l4rW+yyWYj76cUeIk1IobaJX+
	rp/9Ew3l0QWXe5+VXvw+QoNcGuCAXzVDvXcqMsZT0bS3wirHi2WHQfqwVgqXwxOcVkg=
X-Gm-Gg: AYBFou2rljq/UxAvKO4U4DvWnY4FN1w8a0kRnIVCIzM+HBCAyGrOgk9KqsxT2Pet4Y3
	kJFR3C7sPaoIDkXywJFJujxme3vPVhqT+FWrPKIuOlm+9OnTVMZYZIYK5i3spqmLNxd4Sh9atOr
	7QvTcrbhGgV0K3I96aOCTO3yxgHIoO/PTGm+7aAFx353Hw9bZLjJxB4KfsxDuCgFTYVl0wLtv1V
	JxT8fbwriGjWxtw089/I0lq4JK3ZB1/J3tJaijJKUnyQPw6xUmbv9i9DPlRc00RS/t5zE8MSydD
	ReWbJ/u2hi+PlPZru9MZe5DVoUg+QbwtB49vkE10IQIbxLcq8pyjuMB2qyGQZI/elJV6UyNfgdD
	qA8HGHKj7Dn5lqgbpfo7nZBpKBxoHDp8J/AYxK6/N8Sk3cbe4HSeuzTGRolGdkXl2b1sY3AFx0J
	YknF8aTXvjX3YcZmYAFkmNRvsGZMRJLUfvsJLUxY1TSzrqEIZeqLA+sxiu/4CCE71S9uRRrUubP
	v/k7jbGd+MAEPo5+rWu/4BvLpPY2PbHkTzlDkeCQoD+AbXsBV5azAd+cxIO7PhDmes=
X-Received: by 2002:a05:6000:4288:b0:48d:cda6:4dd7 with SMTP id ffacd0b85a97d-48e385b4621mr3251773f8f.44.1792758839526;
        Fri, 23 Oct 2026 05:33:59 -0700 (PDT)
Received: from [10.221.242.139] ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edd26dsm5554766f8f.2.2026.10.23.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:33:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 23 Oct 2026 18:01:55 +0530
Subject: [PATCH RFC] phy: qcom: snps-femto-v2: clear charger-detection
 state on entry to host mode
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
Message-Id: <20261023-phy-qcom-snps-femto-v2-host-v1-1-77cf6a5177cd@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQjhLUreAB3IqLmE7NCE1iJ
 hal9O5GXf6/eDMoZ2GFfTND5klUYqjRrRpw3oYbo/S1gVoyXUtrTP6NDxdH1JAUBx5LxInQRy2
 4cz1treGNMRaqkDIP8vrpZzgdD3D5T31e7+zK14Vl+QAvmyLfhAAAAA==
X-Change-ID: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792758833; l=4680;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=c//aO+uFRscbScqkNAvaaqbbKqzdZoy9nP9LH9BBuUw=;
 b=277h+fYW2NZCq8zkRo74BKyfkAOx+NVESfzGX0KBZvoRuS2vkofYvCJnTaYvxZi3/dHOkgswY
 Y04w1TMcjHWAe7UVqbc4p+2OsP/gemCutXE9HhiaPolYK099c3tFaUw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On QCM6490 (Fairphone 5), the firmware runs BC1.2 charger detection over
pmic_glink when the phone sinks power from a USB-C dock. It leaves the HS
PHY in UTMI non-driving mode with the datapath override enabled:

  UTMI_CTRL0 (0x3c)    OPMODE = NONDRIVING                 01 -> 09
  CFG0 (0x94)          UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN  00 -> 01
  HS_PHY_CTRL2 (0x64)  USB2_SUSPEND_N_SEL                  06 -> 0e

Linux never writes these fields. They match the configuration the
downstream kernel uses for charger detection (its "dpdm" regulator); the
downstream kernel re-initialises the PHY afterwards. Any femto re-init
clears the state, but on mainline nothing re-inits the PHY after
detection. When the dock then swaps the phone to host role, the
controller cannot drive the bus. The HS chirp fails, the hub enumerates at
full speed, and SET_ADDRESS times out (-62). The state persists into
later sessions until the PHY is re-initialised.

Clear OPMODE and the datapath override when the PHY is set to a host
mode. usb_add_hcd() sets the root hub PHYs to PHY_MODE_USB_HOST_SS before
it starts the host controller, so the clear lands before any port
activity, on every entry to host mode. The clear is idempotent: when dwc3
sets PHY_MODE_USB_HOST again after host init, it finds the fields clean
and writes nothing. On platforms where nothing outside this driver
touches these fields, the function only reads them.

USB2_SUSPEND_N_SEL is left alone: HS works with it set, and clearing it
has not been tested.

Tested on Fairphone 5 (7.0.8-sc7280) with an i-tec USB-C dock: the
unpatched kernel failed every sink attach (15/15) and the control arm of
an A/B on the same image failed 2/2; the patched kernel enumerated HS on
every latched attach (3/3, with DP and charging working), and has been
in daily use since.

[This change was developed by "D.R.racer" (with the help of an LLM), who
 doesn't want to have their legal name referenced. But they agreed on me
 taking the change.]

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm mostly sending this to get a feel for whether this would make sense
in the eyes of the maintainers. This does fix an annoying long-standing
issue with USB stopping to work, so I'm hoping to find a way forward to
fix this properly.
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..e2b9404aac4f 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -226,12 +226,48 @@ static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
 	return qcom_snps_hsphy_resume(hsphy);
 }
 
+/*
+ * Charger detection run by firmware (BC1.2 on QCM6490 with pmic_glink) puts the
+ * PHY into UTMI non-driving mode with the datapath override enabled and can
+ * leave it there. The controller then cannot drive the bus, so the HS chirp
+ * fails. Only a PHY re-init clears this, and nothing re-inits the PHY after
+ * detection. Clear the state; this is a no-op unless something outside this
+ * driver set it.
+ */
+static void qcom_snps_hsphy_clear_chg_det(struct qcom_snps_hsphy *hsphy)
+{
+	u32 ctrl0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_UTMI_CTRL0);
+	u32 cfg0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_CFG0);
+
+	if (!(ctrl0 & OPMODE_MASK) && !(cfg0 & UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN))
+		return;
+
+	dev_dbg(&hsphy->phy->dev,
+		"clearing charger-detection state (ctrl0 %#x cfg0 %#x)\n",
+		ctrl0, cfg0);
+
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
+				   OPMODE_MASK, OPMODE_NORMAL);
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
+				   UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN, 0);
+}
+
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
 				    int submode)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 
 	hsphy->mode = mode;
+
+	/*
+	 * Reached from usb_add_hcd() before the host controller starts.
+	 * phy_initialized only changes in .init/.exit, which phy-core runs
+	 * under phy->mutex, like this callback.
+	 */
+	if (hsphy->phy_initialized &&
+	    (mode == PHY_MODE_USB_HOST || mode == PHY_MODE_USB_HOST_SS))
+		qcom_snps_hsphy_clear_chg_det(hsphy);
+
 	return 0;
 }
 

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


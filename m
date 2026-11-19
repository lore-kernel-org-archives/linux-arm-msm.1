Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092362;
	b=PO6zAIfSLw94+zplQGn+I2+oLuHk07t5X+VTVmrec8MNcvyjxWXFrBX0YCTx391zYdx4
	 s2X8CKalvGV2Gf3ysA1SVwTtSndd4b3zBx5oVGrkKCvoZw3VEdLlwymi7BDI1fMOeJM8j
	 hSEH6JgFLzq7GUfwjaDK4v4FhZl4pe0VJAwLgSz2dsxINmY1MXwODG4azODP/clzhoFFl
	 C5m9jOWiaulD5szP+jczOHjheIdxMkI8uqbulB/vUJHb5PFYWScvoNYVs8Kl8dRcmPkAo
	 qC5U2nFBQq/Dtv60iBrN+th7/61+ZqfE0k1xHnLxUR+m5ZzEaSclpueuIkA2F+RUeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
	b=i4XrIo1RTGiXx8gt5+9JoUqgdevbeDQPRwR4m1eFsCcXGrH4UrGi+r48XXAfoPrU5UFw
	 BYX2f7SaLMR3Iu3lKRzavK9SlSDGrXz4veae0tcRQldByhE+jjkvDSH9EDWpVbi8B+WZn
	 AW3AsglPk5Ja3syvG6Ci4rMr2zMHE/oCGm/zVvBxMyjWegdxJ34dID1rm2MyCkLZafXNY
	 pwuWWdx8VI8FNwm8snuYDkea9A07cfyiEuljexuC7ED3l7BmMuBl0wDhsn4QoAQMtq0LX
	 Bj2UAgrUto4b9AXzUk7fca54jiwGVXpB5i6z9eQVax3758F1dFB0LghWaO3OHoskazw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Duv0s0LH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02189606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02189606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Duv0s0LH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so3361891c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092361; x=1795697161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
        b=Duv0s0LHI+TJP79LoK0fEyHo3WzKLqQMCUPqob/fKZsAyZfyr8EZMS9r/sQKPry51G
         hk94sqxWVsdcIH4wciNOGvVNM2/aUtEnDh/MkPgO9W6U4L1OpZww2waCgWGDo0ojLJzC
         AnAcYYzGVqUMooVloXxmg5wr7CFH0+SA9/Hr8ZoudsMtiZLmje+IZo4EviegV8QcYe8W
         /jsxz1SIf/2h6T8lXu5VHflkcVGdosUJi6Q3Aa6f+7TA38MVB8DASlwN16Iv3dpAF2a7
         6cBlAoWc6Wgv4z0uT8s12/UmacWiyU0KyOWPAS9kWhK6u76q4vUq7ZzBM1Vvi6MgwY64
         dFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092361; x=1795697161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
        b=sGaZ0Ap7JS4E6rIoUjZ/Ew8ZTAem9gzlqr1COg+ujXchJwpF1delUU6IfuiYJ9oCJK
         jRE20b842E9y1Pupq5R9Z3Lf3I+ADBYDcXi5qM/cM4P483LwYhVzinLhFGlYFTp8kcX/
         /xYAZmaVtJiQrSVElwGz3aHDzPPRw0EAQXLNILGg3N03D+nnRutBT0SiDkljSw0DABAe
         fXqofeiBY4M3bPPCIkLJAJFOfuT4A52DgFEasF5MQ6/32s8p0iwiSZWLD+aO688TiQXF
         3Ph1BDC/thjBLzBffmWooitY3jHfz4MX56QRHBmQ3tK17WKgBHZ7R2IovvxcWlbo2ILe
         zCaw==
X-Forwarded-Encrypted: i=1; AL+hErHB1d7VSAWUuW+bRgVIzl9X7IQdzxbjOftNFUzZ8meEjhqpjLpOjoK12ZEUj/RVj8yKntMtQL95XyHKGNJV@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Zrugj1QLtETr/0SRoQcpCWzqTSoY3Qhxvnedj1En8iY5NsEC
	ZsmnmfaTDMOYTEVH3QH1rynck3Z8WPaL6roBdRqXwhQbC+TuzoTpd0qH
X-Gm-Gg: AYBFou1iKtdLtRoCPT95AV4jnTd+51ZTcRzpoInw2VT5d4hpDfIgrpl8Hd6Gj0OW95g
	ZXV3d+C4pg0sCb5vx/ew68GTcNaRze6xh++XceoMAnORO0/RJv5/6hlNW7WhlTbcOruwgUiHYMa
	ynnSh5QKhu/uT2WnJT1IchLpz4mbFP2VuhEXfEjPrX1aYV75uOP6c7R7F8jhcP1lnkwvqey6n3M
	ZLc3lt4gS6QoW5yMXAZ57EJqgl6qYgCkQpBDmUISmC4Q0bVqyUTjfQ4jIdGYb567XfuuI7ubxRH
	ff3mbX7qGeKlQUFicjrBeJaQe4jyVHr8dFLn4ZYhcIPZ/JJD682rN3eKBltm2zIqcje+RHJydHl
	rlO+UNzG/GBZGFhqXey9f+MDPrqiXf3kElappyhrk5cbijOIPZHNre6mzguidqzGkp8eSjOUsHU
	CxdmaF9UiH+fpFFqYiYRxL3d1uwM8xDr1+Ei2ZJg0hwPJG3Dnys+FKrs0OhDTqg2CvvtqsaSLKF
	yGA9Bm2XEWT+qusPpYF47mu3e5D18sKGUTAGEYfGPoIsyxUBO/4lDK5o5qEpTQ+gwgnA6t32JUW
	GJJ4DZDzw7u4GUrV1CyivUKAWMLUqajFT0s=
X-Received: by 2002:a05:701b:21cd:b0:1b2:5f31:21c9 with SMTP id a92af1059eb24-1b543b19674mr4990798c88.6.1795092360904;
        Thu, 19 Nov 2026 04:46:00 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:00 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:45:56 +0900
Message-ID: <20261119124558.1548-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
PCS powered down. The USB 2.0 pair still works, and such monitors often
have a USB 2.0 hub, but the dwc3 controller still runs from the USB3
PIPE clock. On Kaanapali the next xHCI reset in this state times out
("Host halt failed, -110"). USB stays lost until the cable is replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series registers the dwc3 glue as a Type-C mode switch next to the
PHY, so that it gets the mode (it does not route any signals). In
DP-only modes it moves the controller to the UTMI clock, as
"qcom,select-utmi-as-pipe-clk" does statically, before the PHY switches.

Peter Chen suggested on v2 that the PHY could notify the controller
instead [1]. This series uses the existing Type-C mux framework:
typec_mux_set() calls each mode switch linked from the connector in
graph order, and the controller (HS port) comes before the PHY (SS
port), so no new PHY-to-controller interface is needed. The cost is a
"mode-switch" property on each controller node. If a notification from
the PHY is preferred, the clock selection in patch 2 can be driven from
it instead.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [2]. The controller side for that SoC is a DTS patch
sent separately to the Qualcomm tree [3], and Tapas Rana has sent the
same for Glymur [4]. Neither should be applied before patch 2: once the
controller node has "mode-switch", pmic_glink_altmode defers its probe
until dwc3-qcom registers the mux, which only patch 2 does.

Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
PIPE clock on resume" [5] and reads the selected clock back from
QSCRATCH, which loses its contents in system suspend on SM7250. [5] is
still under review; patch 2 will be rebased if it changes.

Patch 2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, so with the
arm64 defconfig (TYPEC=m) dwc3-qcom is built as a module.
pmic_glink_altmode then probes later, and a monitor attached at boot
depends on Yongxing Mou's "drm/bridge: aux-hpd-bridge: replay last HPD
status on hpd_enable" [6] to be detected.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
backported to a v7.3-based tree that also has [2], [3] and [5], with a
USB-C monitor that has an MST hub (two displays, DisplayPort over four
lanes) and a USB 2.0 hub. On each of 5 plugs the controller switched to
the UTMI clock 1-2 ms before the PHY switched, back to the PIPE clock on
the next USB state, and the monitor's hub enumerated. After each of
three s2idle cycles with the monitor attached, both displays and the hub
came back. Plugging the monitor in during s2idle woke the tablet. The
mode arrived after the glue had resumed and was applied right away,
before the PHY switched (once with each clock selected beforehand); the
path that applies a recorded state on resume was not hit. A USB-C hub
with DisplayPort and USB 3 kept the PIPE clock, and a USB 3 stick on it
ran at SuperSpeed.

Changes in v4:
- Patch 1: add Reviewed-by from Krzysztof
- Patch 2: mutex_lock()/mutex_unlock() where nothing returns early
  (Krzysztof)
- Patch 2: leave the probe code as it was apart from the new argument
  (Krzysztof)
- Rebase on next-20261118
- Link to v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com/
[2] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/
[4] https://lore.kernel.org/all/20261117113834.925310-1-tapas.rana@oss.qualcomm.com/
[5] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
[6] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Joonhoe Kim (2):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes

 .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 150 ++++++++++++++++--
 3 files changed, 143 insertions(+), 13 deletions(-)


base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
-- 
2.53.0


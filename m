Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656287;
	b=caqxTkwjl2+bv7T0FUSWCzdjja2dh7VJpFxepBVkyj4LK+3jOE3DyU5udChr97aqniiF
	 J95CvBJessTbsKFhBPnom7jQjhQXnsxcm/mLyx3+oEZ6zX2rnXgsk0SywbAyr9rRLfG9X
	 5qV2yPUUilPH0w4NfSkAHwlPUKDBKUvYAwoMckBfmDTQ/gfynRRXE16ubga7CdDyoHRM9
	 AKAFcT1Pn0IpULovmI46MJ4FuUjorDSvv0vVkDtvK0/3UeuNopjf+8u20vwflpZtrRaxB
	 6zbPgGlM//HOMPJM0Om2lO66xsiOn5CMez6T6+5mt6iG2zEIZPjzq20+LkROqUj7dsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
	b=AVVe44T96TWyW6MnID0ZetZjPfCzba1zpssyMJQooEIW/anSoJeTFRZkJ6bC+0lBVJ/S
	 SCFsRM8WD74EEPnFwWjc0Ftfn0Bk5f7OcFrrnUWkYsQihCdh4lU+VcssV0/FX4T0wVweL
	 KPBwGAmRUufE/2+qzxBD+87gpLXkohGLY5t6l/QZ+B3GlW7aaw4TC6nLo6rVg+1hE7LBu
	 XcrNpXhcTN0pXYSWW6ibN9LRQCr8K4ZIeiFeEiWtYooNG2sK8WjiCO1swX/lh5debXxOx
	 pP1LMwxPKiUjRHHvmqGyR5EkYfIdoZg4Yt6SR9XijTjxCsdyzXAusEGvUjvV1DLHthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21C606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 21:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C21C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so4838066eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656286; x=1794261086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=jSFiY5V4htQFuOq1u08r6Qy/G9vfmFL+gWNi9Zov/cX0AtuxOSHykXbgpWUR8GBw+F
         vligPDvpGOytNAl+tBbiN1gtljoS+qjtWY/zqgsd78fH1CJsUmQBtmrUDj52ieCDsmDb
         0+jTbCn+BED+Hm9gUyz1IqdbOe1qK2Jt9lx26SOaL1gglKupCNwhVQ/5bOcIXBYf3ygP
         aOBT/NoW4Jeo+oAIvW7CuKq08AWQhf293gqnRFwbQWqifgMnP+EXtnwzqfvonjJtZRYf
         ULQ9V3f3CKOhUfROm0MxFAl1JDMvmLdAJHjM164mZu2RegECHqeKeadRcBJ3QQTzoYED
         rKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656286; x=1794261086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=qGyDtxsFGZta+QC9Rt+59zbBXe7/U/2RzpgvWmEoxde2zg8k/mvvosykOaEiIZhKTZ
         jSCySn/wJBlnlCsVZr18TWi5b9iqR9tuzWhDUjy+phruuieVmL9O2kmyhWnizOTA3mnP
         fJgMzpRaDorlvGjJGgYM+97BYFhmKtYJLWgOmaJts6+6/bAFdcxdBPZE0Ne+1qGNvmQ7
         HDbioSPc60uGmhyvLAQSbYglSKSqInt7kx87mG+Y/Q+aLYJrSNDamzf/FUR7uclAOdIJ
         cJZveEnrb/crSRgy0pOw5ObdoEDPHp32OeGCrRer16aB9b9J+hP84kaZ5lKoNBKUpSwD
         bSag==
X-Forwarded-Encrypted: i=1; AKwUvBzqsKZI/MkRJOFn3wemG9zvIJdbwNARi+5oUpTfSAES4NaqgUG2OZfpQHRnwTWACBlTmtZI3rrdeRjajCax@vger.kernel.org
X-Gm-Message-State: APuU4Z+3UcFrdQtHXmRcclaYnkB6TOTHBh0kGCuT3Q2g/LzdmeG77EVF
	OXXUGFCOKZ0LEWchiaTIrlEIfHll/yMigNVTZyrhrV4yw+sKjYjfTDot
X-Gm-Gg: AYBFou2OMSyEThgRtdNanruE/MmBA1Rbj/p3xxJko+ieUApfnrrzYI6gAYqC2GLe9IF
	PjzHNbk11vjm8eCyDBzAI6+dkhlLXvEudUenQsro3dVn9kEW9hjT5bColIQcVHfm67klMuV0SwM
	qU9WftRDpFKAKRtkaw6bGghyn0znsx/V32fsvfuHooHOVCv0R9Kzy6ltHpjI3KUXj6gUCp1LZC/
	H6Gl+O4XTKqqVCnysaiA593WCjhKi3m7w3pNkvcIHt4ibDlKCWFJnOkAlMuQHCbP1FQqMODR82e
	HfMl97EJvv6pOAV+FWb8TtSf/Lpa8omA5bwDDor3SDdpkGFALn28Gqq3BDYwSLFXKs1p9YgptHL
	Tx4hhcyj5Z2OSpAq5VSL7Unzy/AsW3YtaeXBStC5xABBBfmZjZx5wqYAcEgxbT4YKtXSr4UAUwi
	WKVKQyVXOHLU9UIKPjQOfOWBp/tpiMOxRQ5lWWAxMkRuhdtHWLXCu5Ucn4UGc2yyCy1Ov5Qo8QP
	Wy/8HNMH/41NXfkzJxVfsryNW+NXHci+8UlUTuL2UQBRnutaNYJYFNtXCTzw7tHxwK/u1AZzOcc
	MGd09TPem0CGTocJvR91fxoACQ/iC1Dna2NamwwBUkSW
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr17096566eec.17.1793656286305;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:25 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 06:51:18 +0900
Message-ID: <20261102215121.738-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..1380b769c73c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch:
+    description:
+      Flag the controller as a USB Type-C mode switch, so it is notified
+      of altmode changes. In pin assignments that give all SuperSpeed
+      lanes to DisplayPort the USB3 PHY stops its PIPE clock.
+    type: boolean
+
   wakeup-source: true
 
 required:
-- 
2.43.0


Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0649DBB7
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050228; cv=none; b=lsj/3ybjXpzXHxl6IMd8dz5MPvEiXJTAGizgdDbH0LYugroC8NFXLlUfe34R6lZCmSvy1sB8Vtyo7+g9eVtHPvJup+RT9Ssi0xpohuL4DNyqRfhiomL98DMVo/DEmlG60qpZRa5c9mh5aO5XUWVBCQDDdi2BulFDc83vzlk9sFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050228; c=relaxed/simple;
	bh=oAVOptHgaHYJzEuPIUaZrEgs391cInOfG4C/drncIwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqlfBM1h/S1lZ81myTtuBS1KoozpqmOPsAhxmH80VApQUfJ0pgUNOIoiCxqfkpfyawfnPXdVCSDGIQVHyK5vJhHcKbFrRrWbyUV6j2pM7kWJBmqNMU1YTutesc2dypjkBOSdvhdQA1Fa6jRt6ohkNgW3gOJx4jIEX32vCc0YQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKtpTJik; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKtpTJik"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53397325663so5478141cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050224; x=1791655024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=mKtpTJiktUBc0mx5QzWhphZ+vVetoYebj7DoWo/I6rEEY522kwGxP7mSjmII+flx5F
         WyYSNF+Y5VNYU7YNVSjUsraNGEP06vP87xQreacrEUcJaD/+P6y2oC6TrF41d0q7ug5b
         iJW+CM13321Sehhc1N0oYthJG5TygZ2yyIxSQMLNFdcAriLHhwTeUX58ubxb+bR5gqPK
         wvUc3HFGHJo5/hT9lgbCSq9+mCb2kZFh41Th35Xx3olq3uNjp7KIgE8HrHbaSgwedct/
         Zu7YJisSuD4A3UlM66fz04ruAYzDmXKVwL6oGHCtjucjS1dKtTztvuQ2CgHLvkz+V8KB
         wnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050224; x=1791655024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=YAbOVSAr7wN00BFf6uY/zM+YVoanzuB64bapWoa7yXk6vJIRC17JIORV4IIpr44CnY
         EE7IebSoIoRypukbQydQJxl8g9zYBltxgs/nVLJlJ4TcZHcKMDOJYC6Fleckr24wJXpl
         GpqJ/bgfoWa1XHprAQZ58cEX3h7+j3bRiwmnOdOoSebJltFj08aJGUpRo/BNgZfAC9cQ
         QG9X6mkjTLGvEqcHtsBG7o8DWCgdlQqRvwacDQ/6uw7ARLeJJMh04bcGXHbRz9BT5LT3
         DKA4fgMTnKtlJqjl/WiGYGqwFxqSp0wQ6yBDEWCyuLCZuOoLm3a7q1xe8qY7CtPeD5tb
         Xbzg==
X-Forwarded-Encrypted: i=1; AKwUvBzlFu9lEHDvR8EgHNbboW4fYWd4seZ88CKE2QSchoipGhlV52QOQmQAItdX63+oOq9R2iYfRc90a42XdHI5@vger.kernel.org
X-Gm-Message-State: AFuF++nity7EGZkH5olqKQlfpBNo5Xaf2PS57FPKxDtnoQqnMFc5JTfE
	DH5X909ZsoPwDRsx+zpESbzpqCzmLaCBHSM2tGSYXIpsqqNdsH2azI75
X-Gm-Gg: AYBFou3bkYLKaiWE7D50GAJFSTJMHxfwKtqS5WeqvPGDC8kCKJkw72o9YFj1Qcz1knG
	45UeVZz4IEvmqaCeveKfrHSbhOuaw0LynoWfEhCIvwErrcdXoe5o8XHdsMGfRO/96lYpODZ/5Pg
	PQLPOr/miXksgRfzAQ7bK/iPfF1CqcS4sBjU+FTwGhSfUssq1CXQq456QjkqkPM5jz1SMBTXTIX
	D5xy1qPk02S7Z4iNjhHDSZAS65I8zQNTYFcIPIUxYd1IQM3DcuEupEw41rena5Wzhtk760GZIjP
	fdIoQx2mp54XfMgZDhevv8uvfPj4i5xhuGG1Qcv65ixpWs5yuKmREF80hHunIQUnorAbrUrzGML
	leKppQHkTNUDmQy7ARLH73ly9juuvz73aYCx5aWpdQNMuLtW0ABdTP2gO025zhHTpDsuuj/a0NB
	6FEr3OCTKaHPUgCOkaVDzULSwBIYlK2pDnf3rdcMQ57iP4G5ehD7NFiCACPCguNJG1GnRmQtUSD
	gtpXF+wECcEAw==
X-Received: by 2002:ac8:5cc1:0:b0:533:3d83:c20c with SMTP id d75a77b69052e-53511e44037mr55541301cf.23.1791050224165;
        Sat, 03 Oct 2026 10:57:04 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d59747sm57605361cf.31.2026.10.03.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Sat,  3 Oct 2026 13:56:49 -0400
Message-ID: <20261003175659.23536-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.56.0


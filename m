Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690359;
	b=pTC2BZtJhqxJLISpKnsOWqo34w//J63mukBp3EqCFF+O5L40CjLlGG+Al1Z7ubmhW5QR
	 8d7Niab8PRh4Otv985+8J/Z9RrHkm1FGOvYdI8MT71qEbUXDSFIyMBEZTuvUcJI7yYg1i
	 31HHmc8RJmfeqHZZcsqLW2606J6TaCNY7oebyh/4yosi6h0Dx5vHl5/20Mt6k8HxpCAjJ
	 ceLKP9AE2wiAVmrf6YZTRN1CpSO9oO5im3HVKOVC23dLifAGEv+hAgfGH9BsZux+N9AtJ
	 7Q+qAG0CbF3+AS+FsLi12potL7pyLizZIJPpRVhGOEfD3QXnm4SMe1DNFQi80RA9s+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
	b=Euv5jhtVrGEHn9b8I1FewWSFSzTX6cVLgqrzKy9dip129P8tOBtN75l94e3vSQalxRvQ
	 58uTRNKcs1IneG8E7g9x+pyAZaex9MW7QU2YNYwYl3D33xXsixE/4nZ5S9bv68/L0Ax4N
	 ZU1WN91N4ODePVIIIk6fR4tWWyT71VfJmNG+jP9OtrN6owVnGyco0FLuEmB5Va4tTM5cB
	 +TeFhZDM7GIhZFHNTiZzwDC61HnCSuOTxw9MaaMLb3fDGQA2V8v/LGFXMeWu8MOfn5VSP
	 yq/zGImGL/3OWX0VFMjpT4iKT0dpPWlr7yYtiTDlKl2zWfawKs2IBD3HzTO1Dei0c8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeCmVCgM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5446606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5446606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeCmVCgM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso279075e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792690357; x=1793295157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
        b=eeCmVCgMegRCMD7vOlGg+I+VL7pQWFbhxv3PU5KxF6XDa0o7ajmM/7XY1L43p9HS5+
         itOL5APh7mnHzuXNFok96uju1BIDvogoYxKs+LNEoP0KzZqKpZB2h4aJiZfAoVBC9rXI
         OXBa64Ghjhyr3+zpRWSioZQBJ0F4UnFDPvOW8xL1I0c88FZETbuvhll6WKwGvxuDYd/q
         NjLKXl/YgtmD82fvvGg/sJb4Rb4nlhHaEawHymhU3n5L5dc4+7NXPF/gaQzxtJS1htSz
         38lzO8YmLXH2ksX3fpjcSb2gD+VyGT3rVqk4P5zdk3C8pUXkvGTDCmhsvkyUpHkOLD95
         0LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690357; x=1793295157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
        b=G4nOU9MHi5zfsa2D9573I3x93u+TNb+7bp49w8W5q/knDJhq+swSbb7yWFWT2tjEzw
         wSkSY+s2QjjxPBlsUOJGipIyaordHq6jiRg5heQHYUm2R5b4PknbVU2RZwPt7wKJNWAd
         tFTKxnnBDkrVWq+r9UM8wjDIrOnoeJdZDIibYJLEJo327M8NHruUUAeYnxfIe6JidSq5
         4OHSAQmgTidibuExxU6/SremzarDqVrvccDEEWjT4JPbthWDTsMJjPApNfOvzDHb5SAK
         uXYRst14FqkqxgpYKakwo37HKCueYtR3dJwK9+TecD6Lx10Ik84gliI/DLoMR82lB1sI
         S/Ow==
X-Forwarded-Encrypted: i=1; AKwUvBx0wkhBc3lRRted+y1cB0cE73Q17Iu83hLl3Dw5jP1McsCrktSFRRRCj99o0cNDWNukQTbGD2z/NyMJEbJq@vger.kernel.org
X-Gm-Message-State: AFq9FYK4ryTOMudwykwOUzKjldAkzqTypXjiFv+EhBgOHku97Z9S//uw
	HAFpPSj5YLAoJ0XECW9XzFlbetWNsUiItrAOIcVeECUSnRLSnB7x5jUS
X-Gm-Gg: AYBFou2xXNVEA4WhZjKKPBsH7QpxBmdKhgHEMRwDgFHJ6W3Le7idDuf3XFN57py72Oj
	S3cwFpkamwttaGEXvE6V8Ls6iULsSRP4pQV3P5/QEqCmr0aMFfZEcRAhcU8Y1NBmg6l07byjYzs
	xwX2C+5o6GYCMV1kVl3vdAHpbmThDLpTZMJmh6LFBqAIYcpNpMQvhxTpflrv7kDlngKjCVvWjEg
	eFDuRu2MG45OLl13C4HIgDIRUzK2GDO/MrgCpCkMbA4i8UDihqZWc5p4NDmyTsRP/kXLmxJ8kvG
	KH1TwD2mczX+CqhU1gSrAPC3xBRR+odbblqfN96F6h0Px+Gr2NiQ47Rz5ZouaTJEliou+MYgn8E
	KS9YLeD+GUaqjPfSV5X2+cywziQuaw0ItfdFkc+umuDVkDOcVkuKWWH5v5fa0DcdINHCmEYq4+4
	70ULBRDRXLb/6n5k1Kvt5m42OSMQNAQnkZdpEhgQ28C5jG6b3lVg/45SzykZQ/gEOQoZYSuOpLi
	+azXWlUJ7m88lY/ea/c4Ln7d9LpV5dyjfCcdmSG/Wu6JK/CBB3Z++f4WYYDthF1sgnrY1YlQ2dl
	jjZ8HTo=
X-Received: by 2002:a05:600c:8b78:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a20cbec0d1mr26844975e9.23.1792690357003;
        Thu, 22 Oct 2026 10:32:37 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0d4sm13857279f8f.13.2026.10.22.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:32:36 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Joonhoe Kim <26rote@gmail.com>,
	Daniel J Blueman <daniel@quora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [RFC PATCH 4/4] power: supply: qcom_battmgr: Allow charger changes to wake up the system
Date: Thu, 22 Oct 2026 20:32:24 +0300
Message-ID: <20261022173225.58-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
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

The battery manager notifies about changes of the battery state, many
of which arrive while the system is asleep, and about changes of the
USB and wireless charger properties, a charger being plugged in or out
for one. Only the latter can be worth a wakeup, to show the new
charging state for example.

Make the device wakeup capable, and set a wakeup filter that lets
pmic_glink report only the charger notifications as wakeup events.
Leave wakeup disabled, so that nothing changes by default: whether a
charger change should wake up the system is up to user space, through
power/wakeup.

Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result. The testing is
described in the cover letter.

 drivers/power/supply/qcom_battmgr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 636d6f6acecc..7a783a3a320d 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/power_supply.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
@@ -1596,6 +1597,20 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 	complete(&battmgr->ack);
 }
 
+static bool qcom_battmgr_is_charger_notification(const void *data, size_t len, void *priv)
+{
+	const struct qcom_battmgr_message *msg = data;
+	unsigned int notification;
+
+	if (le32_to_cpu(msg->hdr.opcode) != BATTMGR_NOTIFICATION ||
+	    len != sizeof(msg->hdr) + sizeof(msg->notification))
+		return false;
+
+	notification = le32_to_cpu(msg->notification) & 0xff;
+
+	return notification == NOTIF_USB_PROPERTY || notification == NOTIF_WLS_PROPERTY;
+}
+
 static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
 {
 	const struct pmic_glink_hdr *hdr = data;
@@ -1750,6 +1765,10 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	if (IS_ERR(battmgr->client))
 		return PTR_ERR(battmgr->client);
 
+	device_set_wakeup_capable(dev, true);
+	pmic_glink_client_set_wakeup_filter(battmgr->client,
+					    qcom_battmgr_is_charger_notification);
+
 	pmic_glink_client_register(battmgr->client);
 
 	return 0;
-- 
2.43.0


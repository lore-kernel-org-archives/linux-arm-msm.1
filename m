Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20A41A542
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437457; cv=none; b=dhOkjhNyDtDfAb+oDYpVFy8YOhHuTALqnelOWMWlX/OhWQ04ZF8lk9jc3DWEJPRWMZyOHjhdUCQHauiGMK5b4AVsYFEuIeJ8BCLX9dBzDUcT8baJUBUT/jQeC0iQhL7SZ/2rAEEsTONMVRqXZlxAGc3cUTPARgriAyoZoRGG5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437457; c=relaxed/simple;
	bh=cr/NcxcTn4m2cOVGIkk87IdfX5HLlJu10qgZsLser0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IA0HOrAhlCGffqPs5Q8xRoiNI06zysT10KZ+YnOop7icxSAIIezBSeTTtMQBW8tGNlluXgwLBTulXr2BGlMdIO2yfuFK7XbP1Z4Myvs0d8miXSkR9RdixEuTnirwfNubZCVw2RlJ3OqebgWhWW5NU2xHxEprMWvlylrKaKlI1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4xqD0bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSJmsEcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4xqD0bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSJmsEcu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B791DU2995757
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eET8pt8EIz4eve4XOzAwqLJEC4iYOR3jpk2
	dxLkAo7w=; b=E4xqD0bz6wBy6j8vgjjgI1brE/rIUbGL+FzeRpjqUJWOhfJOfP1
	Zn3KIV9MZxRqFly5lRtvLoVCbSpnZ+Kv56vtDZy+c5Dp3P319R0HfYQ6Vx1PydBW
	W7t/LMWg6S1amvlJP9Hd6Y13zNUle8lWgNS16xODq6BasDr3gkGqpiECZ6KBoUUP
	1H8m8or65SYlfcjWESubfhcAP7sNtDb6whAE2hNeOaPaktjKp2TMMG8U4mQISj9X
	NIZolv1jzBrkheBWHBG6Jlv3KA+2pcUgVxgGck6jraofU/Mwbnhg8CI918tfb9/j
	pjtOJoY1BzvmAKvIacFTYi3rmDfqog5rEFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyf33r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so35118071cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786437452; x=1787042252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eET8pt8EIz4eve4XOzAwqLJEC4iYOR3jpk2dxLkAo7w=;
        b=jSJmsEcuFc3ipvTNzFu+xDC8eVU/h3OlfdMi8LOgd9pMl0n14fCExEKrXsncVqD4Zn
         k/InLfdo/PbVU+DS/PajNAAT5JagENUu6U+27OG9S2cfLCAYI7d4vfnRiGv0pfIZXkRN
         g/P3bqiMFoIEflS4/N2nFrVQhjxq91bWf51zeJTzxAar1i9WJa9jarclcy04diDViYJU
         2DyKg3mJynXPOWjCnMCeQnE3L3QjL5k/ZtBrdmI7iQUxA0Do8jut2PL6RAqdphgHJp62
         yRXNTFNUuWeeQjGyjDtBooogUwKYSXYRaescPHXLdQaqyUmQ23jhRp8bUd6HlcuehcXz
         iJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786437452; x=1787042252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eET8pt8EIz4eve4XOzAwqLJEC4iYOR3jpk2dxLkAo7w=;
        b=sGxwWKzCX0uBQQfW0BjkC639JUph7Qpgo8Q7KJDQhjIQUGfdhaHUBe98aKf0zxz4Z/
         o2L9gs5iCqnoE5kHrQIJNF1tnPzNGv2eVZSNVRT5BvL4Wv4z9T5TqkGapSpIU/VtNz9s
         R68KQ524g2Pw0FogfXxe6gORYWAXRVGZOqy6YNpl1x20kFwXV4S6dIbPL9rtBGmGSnYb
         OJf8yk61YIbATZsf8lDjNctZcWMr2gVTLY8Fkc20TpwQLEPRzQwGHQekuk/oYesRhMvG
         qAaJfHRQWtjNgeh4zneapjkWHqXwOjlVDNJQU8BpwYPr5vHrjIgKxYc44TewiV1HHuKz
         r0/g==
X-Forwarded-Encrypted: i=1; AHgh+RoRVB+dyiGUsiYLIi3gFg8N19K1ji0fl6UjWQC1Dt60ZJ++k8Y0XLTuJKyRpxIId5ks+yMFJ83WQU6P+L2b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm62E1VPfsJmyj/AvHIffMQPL2ILGZ7dXblCXZ5pEmyC7c2ymf
	G07rR6UlAIjwdpJebqROfN4P0dLywFAqdjtT9I+fFf4R9Sb0y7cSxp/sXYO4uC13i7uJa/TtCJT
	fr0bxTRif2wV68QDBowXsExh4lw7FkoP4akW7dVC5jR4gNuuA16hbEhiL65ST4WoC8qMA
X-Gm-Gg: AR+sD12PSgEA6uumun557O4PycUBWaWeDsXBLrlpD6Bhnv3S917yy9DDkAV85Aow32q
	txcA9XSATztALhooTvSAcRPZtYkyEbFsofdGZgUO1ZB+l535fWsZZ9CWzkyDVeyWiSlMZaPDPVK
	T3n7YFNz/w/5r9+vgZgdKfkINQpE0rJSdylurxqd2y5TaCfkMRFOmYQC/BwAIBtDdSYIDq8LUtm
	RoDJRg+LjoIP1a9tmpBk3NaMVBwxYw9oPSJ2zRXMfgUhszKA/lXOQ+B+xFbRcZOItl+5NkT2b8G
	bcps75t6l+peBZ3k/y3F7HNDrgVpgDrHS0Nj8dUBju7ekeY4d2SXjfyido90nfVfy+hrxAreHyy
	fxtAV8uGOK+ZWYBTpHGShBEXjEJazQIrZl3QXnjtIsrLKSXPX2HW7rwuSF50iCBnhohi+DBO8Uj
	JuNmRyDpK7V9XdJGQ=
X-Received: by 2002:a05:622a:c06:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52d586748b5mr12709771cf.31.1786437452265;
        Tue, 11 Aug 2026 01:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:c06:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52d586748b5mr12709491cf.31.1786437451782;
        Tue, 11 Aug 2026 01:37:31 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a362eeb727sm357208a12.24.2026.08.11.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:37:30 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request
Date: Tue, 11 Aug 2026 10:37:29 +0200
Message-ID: <20260811083730.71393-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k2ar9uUM9otStVA3kzN3AO76WMJ_lHBO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MCBTYWx0ZWRfX7nEM/tY8nwMB
 2Iim3Ck+9/MgvzPrSGUG+7kPxKEE31ZnLvzW7TwwLZfrDWYWT5nBUXR+u9XLkHJICiHl7whYuQZ
 kBsOVdGBqcln0SLkdOxS/EgPZFmBvHg=
X-Proofpoint-GUID: k2ar9uUM9otStVA3kzN3AO76WMJ_lHBO
X-Authority-Analysis: v=2.4 cv=NqnhtcdJ c=1 sm=1 tr=0 ts=6a7adf4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=K8nJeBO14j-BIrTqJngA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MCBTYWx0ZWRfXwmXho1X7Qwwg
 h9ogpGnZAOKU66nMpgaAzYzQ/XbXH2kRS0Fd5c/Pt0yUQ8rh032Bek93YcY1EIR8Qn5Kofb7czT
 6WT+A0/xQpg6pTlFp8gDDOPTlS4v02MgpiOmoTlGkqK9B4P+c8LbmuUwBF62WU0bLCCRhScE8Lp
 8/hcEdSdfvTHZYagfPUJIXdbcZc5q7wWdfbOZWhBk0D3WpjlwRldAsYb0p+4b1u5Sm69Uu/RZ4r
 QTq/vuF5kVA3N5Gol49DIe0h8FmAO0EkrsR1jj4hNsnyv5vIE1qVo9BIDRU1+z9l/Z7jMnQHdXs
 9EA/glj1701LSqsl65t/JJDPLDoWBWG9uhKrTP190R4ZPnw4a3Zpqb4a+ipsb+hRnJT7yAuAHky
 pI45O3xrTkJ6rtFEi2q5CLfRlNm+b9SYKuD0oTm4saR7v7m4BUcqVsv/n8hTDWUZ/P9gN2x1yWW
 oYtxptgP70agMDEotfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110070

From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>

A synchronous HCI command that never receives a response leaves
HCI_CMD_PENDING set: hci_req_cmd_complete() is the only place that clears
it, and it only runs when a response matching the last command sent
arrives.

hci_send_cmd_sync() populates hdev->req_skb only when the flag transitions
from clear to set, while hci_dev_open_sync() and hci_dev_close_sync() drop
req_skb without clearing the flag. After a timeout followed by either, the
two disagree: the flag claims a request is outstanding while req_skb is
NULL. Subsequent synchronous commands are then sent with no req_skb, so
hci_event_packet() has nothing to match an arriving event against, and the
caller times out even though the controller answered.

Commands answered by Command Complete recover on their own, since
hci_req_cmd_complete() clears the flag as a side effect. Drivers using
__hci_cmd_sync_ev() with a custom event do not, because a vendor event
never reaches that path. On a WCN3988 (hci_qca over UART) this makes a
controller firmware hang unrecoverable: the driver injects a hardware
error and re-runs qca_setup(), qca_read_soc_version() waits for
HCI_EV_VENDOR, the reply arrives within 4 ms and is discarded, and every
retry fails the same way. The adapter is left down until the driver is
unbound and rebound, or power is removed.

Clear the flag wherever the last request is dropped, restoring the
invariant that req_skb is non-NULL exactly when HCI_CMD_PENDING is set.
Verified on hardware by forcing a command timeout: without this change
setup fails on every attempt, with it setup succeeds on the first.

Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callback")
Cc: stable@vger.kernel.org
Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 532534bc601c..33ee71c56480 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5302,6 +5302,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 		if (hdev->req_skb) {
 			kfree_skb(hdev->req_skb);
 			hdev->req_skb = NULL;
+			hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
 		}
 
 		clear_bit(HCI_RUNNING, &hdev->flags);
@@ -5486,6 +5487,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	if (hdev->req_skb) {
 		kfree_skb(hdev->req_skb);
 		hdev->req_skb = NULL;
+		hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
 	}
 
 	clear_bit(HCI_RUNNING, &hdev->flags);
-- 
2.55.0


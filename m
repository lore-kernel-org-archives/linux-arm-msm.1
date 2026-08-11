Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769E141B8C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437458; cv=none; b=r1Hdrs+smc7xgHP22wghkjdFUKGUbaPkom1f3YH1Y+liHql8xH9n0OD+Y5+Yt8BrpfpPfa6qOVILdTWAaTlQOLOnEC6U/OgAXYdR+29AhQ0P4bjsV62sYDK8OZ+qUbCNHDbFKkmebYC8++CCV341ssqnvXz0DeRhL4ZiN6zgyLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437458; c=relaxed/simple;
	bh=HgNAwmlfxpIb4zNgtMNr6khvXPPru1hyxswrQIaaiyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xg4hGewlre9u4Ov9Qf7TfQcr49Tl5erktORetqPtVSGByXGipIBlx2CAQMjFU27Ki0XNJJW60V22uw1pRX/b7uB2rJD5EMcxN9yAPavQX8dtOVYkjTBJreeywVDITdbfd6X9N5j73LdUTC7hTXpCdz90XzQOAMwSbTfIsYXdTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMWf6mi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MROGgA9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMWf6mi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MROGgA9j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B71jDl3047714
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHM9GiemhQr
	n2VXgJufhHpHx2busk+G72paiSBc/dcg=; b=SMWf6mi8KlmthzTaDsgkre1QP0u
	5RdA1jXjoiI35g1voswEs2iwxi63iOnSGSdm/3y6itWXFjvYCfWFX4zY/ySGPOUy
	OO8royVMRVgihBaZN+R/NKiePhH+I+jk719AEm2SxJidz+9p56SnjxvYNOf1O9mS
	llpCiuhZ/AAAgC48Ji5juNd7hMHs/h7dZFQdnZwXuEoQpMhYfNyE5brsAAWRhG+Q
	p7Jpit0qP8wQzCE3t6LTcJqhjhZAosQlvS2UsJbZ9BIkWWLpbJCwIeLo/KGPb4Aj
	I/miirAIJyjDT0I+H5NEAnJYonm27A9XY/pCdKBh+MQf5dat8h2F7o9xarw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk238kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:37:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so61604661cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786437454; x=1787042254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHM9GiemhQrn2VXgJufhHpHx2busk+G72paiSBc/dcg=;
        b=MROGgA9jwbKqDkzvO2cCatgMv3Px5OpoaUB5D2Pw0f6QI3Neibqf4Nb8x0ra39DHHK
         4CwiCsZ7GqjlPHAJiZGSe8xyB0TmZSc0L1Y+P6iO7UYfyCrikSr3yCx6n9lgiSJuIf5C
         CUt+2VIXGFj6BoNbsePxO3nktCVcmglxgXwuIbsVLxHocIwgTPxh2hifdILPLTgE+Gml
         ztn39y9c1ygJ/B/K5s7Xe3fvKKa3yZU3ZwHkvJ9pwwHNO0xCFgnQxW7BKiS1YVBw4d0X
         WXic8k84QJ0IVxhfhoal9XG195jRMY8scmVJuNiMFKHUkMqu/PLE7POfWIKAxxcKnr8e
         I6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786437454; x=1787042254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHM9GiemhQrn2VXgJufhHpHx2busk+G72paiSBc/dcg=;
        b=Zx1O/RhmExWKXBhsJXV0NSSQin44Pwz5RFindomcheVzvUizGY0Q6fd9uA3ZJ0ZfVL
         UoKRixw2iiD3snB/XCH65wt/L7nIKJkEN8mBZdEt4hfOD2nwXDr5JDqeZJiX6cfqzo4x
         pxZLMI2SaVhhAFhx2F+DweQCX+G3rq6CYVQitxI+iolar6vLxW+BlMTS/p0Eb17iyckx
         ytt2W0d2O6q0t6AkQt9R89tlpIZsZTd0NecvGkrG6SwniDA9n7FqRmzagkBXtBp32XOE
         ePLBWgFOHiCKSccgN55aV/cF6BKiNnnT38Yh/OOszBmqgzpr6oP6z84Nbl53NvOAE8fr
         m9bA==
X-Forwarded-Encrypted: i=1; AHgh+RoA6hlh0Xr/XW22RP2UKeCmLncEpejDyNJWhh4Hb7f8JCh2DdNRZ2CWCs4xyqtJAFe738tLKNohddLQ9dCc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3e6ZeooocJvn+2/YZNbi0KG/2ZKqIGJr0QXKlil0PLoio+/Iq
	JD7B9mxttcAV2Sz/4pzhG/pk6sADGQ/8U6IZcddPlx8CSrZk2m2UvxK2Y9kOvz7KVUYDEuGPQ9H
	TyC34fllD8H5pWneeVK8iwJd+4HbZw9sYiI8DhPWSmCToZyhDa45CTqovJaPZw5DdLQRt
X-Gm-Gg: AR+sD11BqNktfxGQaYE8seSm8Gnqi2hvFTJg81kmiRQVXCGnnMiX+F1jbEI+cOM0WSg
	cSmEDp/d/ZpkvgbJ46+PBy7sVoU/xocxjHk8Nec6SmScI4/jpYXMN6nl2IzbmgeHXFbZ0e3bwCQ
	/zZS1uxo24BAlypDAvyl3Vg8Vetcnz7k04DvXUwiQ2yYf/lr2TykpbPza0oeJt1XTELc0RdYHCd
	DB9jybdD05serIF40T09GTJTZHDJjc1Tu9Ge6AL1RtK2M8/w7U5S/GqUtUOYmzKxZBO6qo6na9G
	FMmbMfAJUls4r0IdJkuuJLRCK/QdcAjc5OuFj99Ks0ahAsruw6+mS5ObZYcDejxDcOM/FPlxcvk
	E8CEQBCP3Pgr2+rzqETDobMT7Gp9d6BSoJpCAIdfwq5WkgsycOHjSVT/1MW5I1IwgDMeJUbboFW
	4695cl4nYNIx4FjQY=
X-Received: by 2002:ac8:6903:0:b0:51e:aa39:4fca with SMTP id d75a77b69052e-52d5867894amr12144431cf.34.1786437454536;
        Tue, 11 Aug 2026 01:37:34 -0700 (PDT)
X-Received: by 2002:ac8:6903:0:b0:51e:aa39:4fca with SMTP id d75a77b69052e-52d5867894amr12144191cf.34.1786437454066;
        Tue, 11 Aug 2026 01:37:34 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a362eeb727sm357208a12.24.2026.08.11.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:37:32 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_sync: Factor common cleanup code into a helper
Date: Tue, 11 Aug 2026 10:37:30 +0200
Message-ID: <20260811083730.71393-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811083730.71393-1-johannes.goede@oss.qualcomm.com>
References: <20260811083730.71393-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MCBTYWx0ZWRfX7XRN5/pMePtp
 Y3eBaVz4wl0qexk246Q/qaEu1XHRa9ds8svmTF5M49BzW4RH+IlXF9maF/i/CKzP8YiphtiDqyJ
 m/TnYK5xMIq9qnipnLIfX7YJrlfiHC8=
X-Proofpoint-GUID: XN28oweIxCQ3_X_iybKyrEgNGVKRoq3k
X-Proofpoint-ORIG-GUID: XN28oweIxCQ3_X_iybKyrEgNGVKRoq3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MCBTYWx0ZWRfX6I0dsZYT1ogc
 9XJDTinzCbvQFUkQ0xQKDE7czYxDA0ERc3ZHZWpYMXrf66p9MhHUKJYTQ5Cpl6f7yEg1xgmc8SL
 cWaEQkKxStkNHhUG3e3C6LVDvnwOSzNsRoGCUfafXn0cFU6PDlN8/zL9icTLlkKAfRu5hUxf+n1
 SvcuJTyUc6Rsd7GKIr+RTKCW0dTrKnulcmKKjbC/vg6JJAkK1dxKwNVqAkm7CejCDqD1V5xS1xK
 NIGTFfJenpv8k6nEXEdy+HlO8f5Qw9j6w7CBw5yerHkfj3Oe/KFzRk7rCJKDuXWLmGzaUiSz57X
 mLpED8wxVJySfBKprPT/vSz049ctM9+Oa6037kosXwUIWM10mlCxPsgDawdj4064CayaiiHWmPv
 W+1ES5NZOMsitIiulQHDQI1h/QAhdGKTZQuQ618CSmuka/IpFB5yGQy4OF8KpVTiAbxN55W5p65
 1tQXGej4FhtIVVgqE1Q==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7adf4f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=dC77ymmRSLtzYx4gL30A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110070

The hci_dev_init_sync() failure path in hci_dev_open_sync() and the cleanup
code in hci_dev_close_sync() have a bunch of common code.

Factor this duplicate code out into a hci_dev_drop_last_cmd_req_and_close()
helper function.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 64 +++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 33ee71c56480..9e62f1d392ce 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5207,6 +5207,30 @@ static int hci_dev_init_sync(struct hci_dev *hdev)
 	return ret;
 }
 
+static void hci_dev_drop_last_cmd_req_and_close(struct hci_dev *hdev)
+{
+	/* Drop last sent command */
+	if (hdev->sent_cmd) {
+		cancel_delayed_work_sync(&hdev->cmd_timer);
+		kfree_skb(hdev->sent_cmd);
+		hdev->sent_cmd = NULL;
+	}
+
+	/* Drop last request */
+	if (hdev->req_skb) {
+		kfree_skb(hdev->req_skb);
+		hdev->req_skb = NULL;
+		hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
+	}
+
+	clear_bit(HCI_RUNNING, &hdev->flags);
+	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
+
+	/* After this point our queues are empty and no tasks are scheduled. */
+	hdev->close(hdev);
+	hdev->flags &= BIT(HCI_RAW);
+}
+
 int hci_dev_open_sync(struct hci_dev *hdev)
 {
 	int ret;
@@ -5293,23 +5317,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 		if (hdev->flush)
 			hdev->flush(hdev);
 
-		if (hdev->sent_cmd) {
-			cancel_delayed_work_sync(&hdev->cmd_timer);
-			kfree_skb(hdev->sent_cmd);
-			hdev->sent_cmd = NULL;
-		}
-
-		if (hdev->req_skb) {
-			kfree_skb(hdev->req_skb);
-			hdev->req_skb = NULL;
-			hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
-		}
-
-		clear_bit(HCI_RUNNING, &hdev->flags);
-		hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-
-		hdev->close(hdev);
-		hdev->flags &= BIT(HCI_RAW);
+		hci_dev_drop_last_cmd_req_and_close(hdev);
 	}
 
 done:
@@ -5476,28 +5484,10 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	skb_queue_purge(&hdev->cmd_q);
 	skb_queue_purge(&hdev->raw_q);
 
-	/* Drop last sent command */
-	if (hdev->sent_cmd) {
-		cancel_delayed_work_sync(&hdev->cmd_timer);
-		kfree_skb(hdev->sent_cmd);
-		hdev->sent_cmd = NULL;
-	}
-
-	/* Drop last request */
-	if (hdev->req_skb) {
-		kfree_skb(hdev->req_skb);
-		hdev->req_skb = NULL;
-		hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
-	}
-
-	clear_bit(HCI_RUNNING, &hdev->flags);
-	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-
-	/* After this point our queues are empty and no tasks are scheduled. */
-	hdev->close(hdev);
+	/* Drop last sent command, last request and close */
+	hci_dev_drop_last_cmd_req_and_close(hdev);
 
 	/* Clear flags */
-	hdev->flags &= BIT(HCI_RAW);
 	hci_dev_clear_volatile_flags(hdev);
 	hci_dev_clear_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE);
 
-- 
2.55.0


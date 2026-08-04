Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4735966
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 05:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820812; cv=none; b=fDtSC7O5oQxMlO7vHWZFalPY3y4mnQOcSF6YNiUbc//6wgMTdDc31D6xnV0MDxKqGFLGlhBXYCd+4pb5jRWwQljD3l18MiuPT3ciraIwFkC9Hws77YuNlrrEE/8jYeqiOZH8L91s9YUtmCnOoTFtJK0YGyS1ATYstpIbv0+XByc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820812; c=relaxed/simple;
	bh=u+DDBZN+phl677GBhB3ez2mmdcAZBZ1i5uKcbJ9lMq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oHUbKKW032gEUubnHCUWCk61arPWu1K0zRvlT0ttTBFvlroVMk45iWOi4cnQY/ObIk0uj+6uqn4IRIpav7DWSABdDZ+hOPcUd4YkY0vLBTwXQdxhoMOrKXE+ZfoTD5WFIjGAdawb2CFR+lnPy3NFX0rqKANKsjlciJPB0bm7+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0IuiW3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQP/bitH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0IuiW3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQP/bitH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417nti2283882
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 05:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CGhQLhsJzDfPmTj6kDon3n
	9GDIRh3zqxAgHJalW/kZ4=; b=R0IuiW3b4JnDayv6m57CYQOS2nsegBziQmdrhd
	huldtJQF0IVBLGpBdnsPRyIZOPZqYPEvUQOJ/B3Fqj17fJ8k90kz5pXOh0+0IW2v
	jFLedzMdqCfPVDYGdMbtqLiSpoZY8ETWkPYMjsdlvM8m1MtVwxyRD06CXIaEKxmW
	+Tv3C7m5KMWrYP5/lrlj9fubWFy1WwkoUTWzyefg3yoqbI7lTeYj06R0FVOvy2Sj
	712WNcLWI8voG0x7LQibZr4ei+ALXKo3VXooy8vHuR5cEmA00hR+dwSVkJjOgUNA
	/VdSJUC4HWeo8gicrp4/8IAWX4x45VwlNUzZkKATf6Qndj5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqrx65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:20:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so50667225ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 22:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785820808; x=1786425608; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CGhQLhsJzDfPmTj6kDon3n9GDIRh3zqxAgHJalW/kZ4=;
        b=hQP/bitHpH2hpLH4J3yE8L4doDHZhI2GIlskCv1N5KnfPwpQiBV21XyJjXjFj4dhy9
         oSeMejIJInbeFc2H0be87SE5O5tjhqZ2yku487DVKK09kE/WX9Kw8mSLzVNcrUv1ufDY
         yRP1SYh/eGGvNEofv0tgvOBy9+BSM0bhWdUcaZg9KKYDIcA8YSJzdL4Y+kPzL/3x/Puu
         FoKmeBxp5YNJbY5b/tzKl2muX3jBQ5yhxSIXEf0wucBKUys7wz8WUaWpJVUV+dgDqj9I
         mmquSkfr+rPTcBC6qJHEzLCZc9UtDwsdUlCdLOY4mcDn94ctcPK7Cee37FM9G0iB8LAk
         nmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785820808; x=1786425608;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CGhQLhsJzDfPmTj6kDon3n9GDIRh3zqxAgHJalW/kZ4=;
        b=ZOtJ257MJHxbrl++fGPB2ASiJmDMZe5BXb/MRlatw6EtmwFrJNt/8A19TXAp1ueXCc
         Ago5Rw4LtrhnpxXmc7NdC54/VCFCdjrhqbcO+5hGI0B5uyxNueVMM51E63hedzjHs5Fq
         3T+UdL4xLItphASD7v9dfosA6Nwp16GXbHUcR55Iw7Tal383ogdCEY+BRGMcxZ6BG3aA
         leY0Cu0XxCLNUt91sHswmoDrkK9GWPTPtVUtTj68GmERld3aEBDpXiIEhCKX65/HCpo4
         R3Q9qPvONyB36qWUnRJnCzf/r/S8I+xC1sS1g9EiUuKNidQoxHrgezUDRbvj2lJInanc
         CNxA==
X-Gm-Message-State: AOJu0YyPmGvYrOmGlMNd+Bydnd9Yn0qyEON0BySZa6otghS6HAqBBqdb
	nMQ44DuFkunBxAHsjeqVfNfWwGvDbnmR+CLozAoatr9UGi/LO7FNvGOaAwKcEYaMq96bsc9e6bU
	CI2YcTPOuvlwZcIkZqsT/7UeZI/3uIZdM3yLvM0/7R9d1p+sh7vDllaaasuIV6LiZETUJ
X-Gm-Gg: AR+sD13fjuSMxbIrYhjyWocxaA2Fp8UlQZ/A7ZgGFE11pnDdJGVPW3bhGQfquN3Cn05
	fXLn6uDvpyP06ogm0H5a2VgRQjZg0/1ofCU1XOH15sCKp/me9UdJVaWaS+dVkfMKlTOcuWPBF3y
	67u9bbet4iM1NXuqhGB/zAq3uvUDShhgZ2lMdYjNnLYkD9U46FjqB7s7NHAb86PMCk0k0KH8oEu
	Z/4q2q5T5bq+RQplQqKxP0pAUI/lTe6vcENa7BRw+z88MDRcrjODHLkNOQr0hpgBJYyUvQrq13C
	vufK2lZRWUYrquBT6SKD5C/CrekOPF4Dqo7F9QSj8a/eiLsFJTpbjTwoi2mOevmjfkNqPVOjtDe
	343yqmeBzDHLkEqx9j071O5fur7PHNNd+
X-Received: by 2002:a17:902:f552:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2d0523e1485mr121188645ad.25.1785820808295;
        Mon, 03 Aug 2026 22:20:08 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2d0523e1485mr121188385ad.25.1785820807839;
        Mon, 03 Aug 2026 22:20:07 -0700 (PDT)
Received: from hu-dishgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19b6asm47002555ad.15.2026.08.03.22.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:20:07 -0700 (PDT)
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 10:47:49 +0530
Subject: [PATCH v2] Bluetooth: qca: Allow capturing QCA debug logs in snoop
 logs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-qca_logs_enable-v2-1-587d584ef4c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPx1cWoC/2WNQQ6CMBREr0K6tqStjVJX3sMQ8ilfqAEq/UA0h
 LtbMK7cTPKSmTcLIwwOiV2ShQWcHTnfR1CHhNkG+hq5qyIzJdRJZOLIBwtF62sqsIeyRW7KTJo
 zAFhhWFw9A97dazfe8i/TVD7QjptmazSORh/e++Ust97Prv/ss+SSa1TCaH2uQODVE6XDBK31X
 ZfGYPm6rh/cNz7ixwAAAA==
X-Change-ID: 20260803-qca_logs_enable-9b8197aaac09
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        yepuri.siddu@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785820803; l=2852;
 i=dishank.garg@oss.qualcomm.com; s=20260804; h=from:subject:message-id;
 bh=u+DDBZN+phl677GBhB3ez2mmdcAZBZ1i5uKcbJ9lMq0=;
 b=UR2LAOYjgL+7a8etZwJz6w6aM00Cdi/87F5px5fmVbrJYFOqTvSmw0pL8MaJHojV3wQ4XP5Ge
 fYVC9tNyXUUBWfSTzZ0/fVaZ/3iA1zVCSgfokWJLmYf2L5MjAVAv9ov
X-Developer-Key: i=dishank.garg@oss.qualcomm.com; a=ed25519;
 pk=lm0H/+9l8St7S7q6+TGpOhBVan/IAeMACOnINbKd08s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzOSBTYWx0ZWRfX1qa7/0GLobvU
 CULlkbDLZOBclp4a6mHBQBJK3WC/Grmsub84SB+LS++DpmOkdMJw4eQ7ULpAD8XA64s7se9YRY+
 Sfc7mS+n0VUKWo7ApPMBBIFB6E0ZQgo=
X-Proofpoint-GUID: Xa7SqJ1Ms3TfM0qfioAoM8zFdilIqW-Q
X-Proofpoint-ORIG-GUID: Xa7SqJ1Ms3TfM0qfioAoM8zFdilIqW-Q
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a717689 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=llVgCighTJbcILIjV4kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzOSBTYWx0ZWRfXzo1usxERrIoM
 FoU72s2LjmfHHCXoLqlcxGcuxuLRmbayyWv8PJeYZDDm3fv124jXvVSZrOK//GTsWcb+LbpdUw2
 4sjJsm/G5CQSfbrpl1OR2D6ykDqLYGd+xjTSYwVTf8JZxJvPT7ClyNRsT2oIyiyBJIEjGaDqS0K
 vg4GOJPCKztbjvC3GvUZF08lGpgcWxsoR/nDTNuu4+t2odD8Iurqvbciciyhk+6bZGAI5zndzLm
 eUhGaHrFVVlBcUsJCoSxMHAFA+ekdcY4O92S521+3mn/wsGjYtLHoojIpgcMkKFMdpraRD7L69C
 145+G8wF/HU8HO6W6ZF9Q8SUSE+vNV2soTB4j5O/73yMDTyVoRVZq7pKZrXSDdqQp4cUHazSzHK
 J+V9U4iNZAuNJ3f1Fe2YdOcK2FRXzTmYcMx6BWnybbpSaAYU26Mq2b3Yb3SSgXNO+kuJICBuEDg
 XT+/RZvzxJJGovtQnAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040039

Add a debugfs flag to forward QCA diagnostic ACL packets as regular
ACL data, enabling their capture in Bluetooth snoop logs.

Signed-off-by: Dishank Garg <dishank.garg@oss.qualcomm.com>
---
This series adds support for capturing QCA controller debug/diagnostic
logs in Bluetooth snoop logs. Currently, ACL packets carrying QCA
diagnostic data are intercepted and routed to the diagnostic layer via
hci_recv_diag(), which means they never show up in snoop captures.
This makes it hard to correlate QCA debug logs with the surrounding
HCI/ACL traffic when debugging issues, since the two have to be
captured and aligned separately.

The series adds a new debugfs knob, diag_as_acl, under the hci_qca
debugfs directory. When enabled, diagnostic ACL packets are forwarded
through the normal ACL receive path instead of being diverted to the
diagnostic layer, so they get captured in the standard Bluetooth snoop
log alongside all other traffic.
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260804-qca_logs_enable-v1-1-4e209447da0e@oss.qualcomm.com
---
 drivers/bluetooth/hci_qca.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1222f97800f4..6996966319e8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -182,6 +182,7 @@ struct qca_data {
 	u64 rx_votes_on;
 	u64 tx_votes_off;
 	u64 rx_votes_off;
+	bool diag_as_acl;
 	u64 votes_on;
 	u64 votes_off;
 };
@@ -698,6 +699,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
 	debugfs_create_u32("wake_retrans", mode, ibs_dir, &qca->wake_retrans);
 	debugfs_create_u32("tx_idle_delay", mode, ibs_dir,
 			   &qca->tx_idle_delay);
+	debugfs_create_bool("diag_as_acl", 0644, hdev->debugfs, &qca->diag_as_acl);
 }
 
 /* Flush protocol data */
@@ -998,12 +1000,14 @@ static int qca_ibs_wake_ack(struct hci_dev *hdev, struct sk_buff *skb)
 
 static int qca_recv_acl_data(struct hci_dev *hdev, struct sk_buff *skb)
 {
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct qca_data *qca = hu->priv;
 	/* We receive debug logs from chip as an ACL packets.
 	 * Instead of sending the data to ACL to decode the
 	 * received data, we are pushing them to the above layers
 	 * as a diagnostic packet.
 	 */
-	if (get_unaligned_le16(skb->data) == QCA_DEBUG_HANDLE)
+	if (!READ_ONCE(qca->diag_as_acl) && get_unaligned_le16(skb->data) == QCA_DEBUG_HANDLE)
 		return hci_recv_diag(hdev, skb);
 
 	return hci_recv_frame(hdev, skb);

---
base-commit: f5a7e2ae5f0a9a5caf59501457938eeb249a7dc8
change-id: 20260803-qca_logs_enable-9b8197aaac09

Best regards,
--  
Dishank Garg <dishank.garg@oss.qualcomm.com>


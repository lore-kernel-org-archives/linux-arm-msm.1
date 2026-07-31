Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511A43B492
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511431; cv=none; b=pklUoq/pqlh1wxBnfMR6GggsOgHEmx3K2ReUR8YmlG4do7ohO7SUyZaPwK3yC6o58MRa4KI+nsDSK4UymOENn+dh4/ILd0YoAYwXfsX4qj2ATtraKX/Jc1S9F4iFHmer3ImOATtg95Qmnybx1cpL4FX61Kb5wClZSKx+zJlFx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511431; c=relaxed/simple;
	bh=cnvy4E0kkTF4n1Fg4BY14myh4AylIekJztTTht5xclg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbo4UsjfSq+Yby5BFilxtApVyubiU457iBVULXNh/+wIaS4IWL2fXA0zBgKAnuR98epdJ2p7I9cvrzf7cXsMNh8nNCFF5llFXPDS6KnFHLOt4vGnDHLhK5VQhCTT8REFLv2VXeZhWZuOaovVwcHL/TRC8jR6IsXYOKZ3OoICheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICTXIahp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq4IbhOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICTXIahp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq4IbhOq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCSLX73996855
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 15:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hP+UiIP37vVlsHPiW4A3Bz7mZtvCicD82Nj
	BxVHIU5M=; b=ICTXIahpp4ddedo8ffQk6MVWQqi3gNLWCi2XqDbadlH7NDSwmf+
	kg8aYusEFYqzkGoJzgSniI8rDNg8NSKP1qQI+6RISztpKEwDe8T1Np56fzhuP1t8
	/uEsEUTvqj0I5UiTaJQudDn9M5bo+J6k4sV1W9+S7qYNZSTME9PvXDCl7s+7PwZA
	ujZuQ7na5qt3N4mb2exxyzbjd7EiGng+IdDP8v4gc/u/LouaWV2DNZOaIMSucUwi
	ueNtS2DZiRMRsl1sd8mrGWoa7+uSEs+AuGcL/Dwx5NlWAPq4MaFZLDScrTjWUiSZ
	2rSJsujTwgAqoA1pfgxRpZc2/FLoplFVO1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dgyx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 15:23:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso26936431cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785511427; x=1786116227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hP+UiIP37vVlsHPiW4A3Bz7mZtvCicD82NjBxVHIU5M=;
        b=Rq4IbhOqfodTyOqFfD+niYjAwL3y2EVd0Qksct9/izdau4yJKJ/Bc19l98GdZEIkeT
         bQyNnG6mUXY5oqWPuqbopYTxGDCkHT0NrkW2YOi7/mmhyuj1minqBrvlvc0vm6UmY2pj
         3o6yfIDA3kNmzrIsSzmivm3t7d9qeMaC4Z0uh03OuEvHPEx5RvEN8gYNjmgMxDFwFDY4
         Vz2N7ln4/xaGS5Jgu+z2UYO/QlA8poVQDLEf3lTwIUrl2hnFBNf/0v91btqqrHzeWzsz
         CtLiac9jDjkAgEUpt7fONZYS4zdTbCft5uDtcMvJbP9F+/huZjn1564fOo222TdVZPSl
         NxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511427; x=1786116227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hP+UiIP37vVlsHPiW4A3Bz7mZtvCicD82NjBxVHIU5M=;
        b=KYsVz9BFeHXFe+nuNOUk3xmSvX01NfeWXxhZPV9qGsObx9tsjHMC4NNKOBoOrTgeX6
         2ZtK2w2ZwuAH/JvZdnvE0lkOeUMKylQ6LX7kteKRYxdNcmOmsou6KV5UauWf/eVWIloI
         tM2MsnCP/6VQx7f8CKgMZjJA4zuWKxkphAPl1ZieSbGmriNhddvB5atrCWIH+9nWQ7Mu
         A5K952eCShno41QlK5p9FNsee2+KRu0LGyMze1sJ+Ioy2anWSbCzYhJMa8pziwYqpiXV
         u6tIlj2KRze17DQxJOY8fp6iY/4YHLLuo4MS0APM04kHHQ1FSl/zwcN/Lg+s8b9cLzG5
         h55A==
X-Forwarded-Encrypted: i=1; AHgh+RqiWVdJbu01UK0TAovXB0nDnMjoDcdH1DB95B7HY9fhpx8GjSKa93FI/j48pIcTo0cbDztoO/B71DqW0UeT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqdczc6qchsZlxfV0MhwEwxtfxrBIwddgeibW5UBn6sYNIC0Ek
	zwbCxLavig31oN29TZua2z0Be71XWCp7VRS1U24QP/8O+ooDB6YCsIMovgrAeuWZ2WG2SmpT2Vg
	ODDNcMMJAsQYv6zKYrVV8ZKi24bnVOnDppSpYD4gEE/irBm0RFZgvb+MRx7G2CjrDUUjqrvhZEm
	PC2pM=
X-Gm-Gg: AR+sD11+QHyBxjOqHS99j88pfD580nR1oESTlqpQF+eGXpnHaakP/ZnL953OSnjIIR0
	S7PO9V8vffqaZsu8ngBXVThb9lG61tAZzevDS/2wi915rcXWCySO3S4l99LZGZx8gXJbackLtax
	8kvUb+WPbFg09wDxleRjxZTKIgNMvDLMOtXPowERkRu32eX7qkaF+0qZap2L+uTL5wRcuIe46tG
	rIk3ycsuzdzvxCVAzBfu7/e5vFQ5ZWVbtv505M/PH0tdHr9dQBZSw8wDBlkF7nm9EmxyIgjUW4Z
	+ls9fR89mP+CyQPVS5dPvvIGaxEWzXSVRVLq+He/Iq+28rGT7xoqhjYKKKxrOE3VzmIuozy+ceD
	ZQlN9Lpgiupn3fFP5IqUcsLG+S6h+hUS8ngbWUPhj
X-Received: by 2002:a05:622a:181f:b0:516:7a83:8c37 with SMTP id d75a77b69052e-52b4c573309mr31730521cf.11.1785511427184;
        Fri, 31 Jul 2026 08:23:47 -0700 (PDT)
X-Received: by 2002:a05:622a:181f:b0:516:7a83:8c37 with SMTP id d75a77b69052e-52b4c573309mr31729731cf.11.1785511426638;
        Fri, 31 Jul 2026 08:23:46 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm161730366b.43.2026.07.31.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:23:45 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        ruikai@pwno.io, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Address potential out-of-bounds read in resp_worker()
Date: Fri, 31 Jul 2026 17:23:44 +0200
Message-ID: <20260731152344.1905882-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R0LqDew4o0jDgfVIRzUbfMYrhvy7nno5
X-Proofpoint-GUID: R0LqDew4o0jDgfVIRzUbfMYrhvy7nno5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExNyBTYWx0ZWRfXyQfGtdNXgHRM
 1iqpcZIUfBcPhVJPBESsUAwS5QnNUkGI6yllb9HyxjQI+HA01mLYcK3vbDweA9MfanOJp50BjlP
 154oWDMp1qfZc6LmDDtng2AVbelJwyELkmZjgPubZr2OXbKu62KB++Xu/r3/ewhl9xjrEnV7k64
 3r9k/B5oeqBAtIlEdaX3mF95of/F6i+Cb5kmEhnd8v0RHk/BsdaCZ1HaRlN+kSMiOOprCqMeU8/
 6oIu/qv+IiQGM7Qj8d/nZ08LJAA6cjn007TCFUnycjNUkhzvdSESsDW+od6IPW9EWDxHxnrnplf
 evqQw7cuRUxFbvcLsWUlzBfBrG4+8Z5of5xkNDyi1MsYfxC+u3zz7vzgb6QJFbhfJJluUOvf2tb
 ClALE4ipLW0ZKWmgZmD4Chfu/hyypWhKib7/nmVspDO9UzjO5gVLZqQ9AnqWo4fYgFLEL0LXqlp
 4LyvD16ULZgVbZx50pA==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cbe03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=MDliM5Vup59QY3ksz7UA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExNyBTYWx0ZWRfX4Xn9KlPXgJXW
 h2hORq98Le812NxzcUiGHFdrlW6vgZx4u3TtZKstmwprYbpY3JLjsvNLm1Y7O3WvF3kUf6rVy9r
 qhQ+X6RurtDCT7nqC0kunatvwXh2D+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310117

Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the
owner went away")' fixes the scenario it was intended for by walking the
message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
skipped over the bounds checking code that is included in decode_message().
This could lead to issues such as reading past the slab allocation's end,
infinite loops or kernel panics. For those issues to happen, a malformed
wire message is needed to be sent from the device.

Instead of duplicating the bounds checking code already present in
decode_message(), use the function inside resp_worker().

Reported-by: Ruikai Peng <ruikai@pwno.io>
Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner went away")
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Remove references to tracepoints that are not upstreamed yet, which
  caused merge conflicts
- Link to V1: https://lore.kernel.org/all/20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic_control.c | 46 ++++++++++++++++---------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index bb94d3556904..ecbafab7187c 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -963,11 +963,13 @@ static int decode_status(struct qaic_device *qdev, void *trans, struct manage_ms
 
 static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 			  struct wire_msg *msg, struct ioctl_resources *resources,
-			  struct qaic_user *usr)
+			  struct qaic_user *usr, bool orphaned_deactivate)
 {
+	u32 msg_hdr_count = le32_to_cpu(msg->hdr.count);
 	u32 msg_hdr_len = le32_to_cpu(msg->hdr.len);
 	struct wire_trans_hdr *trans_hdr;
 	u32 msg_len = 0;
+	int trans_type;
 	int ret;
 	int i;
 
@@ -975,10 +977,12 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	    msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -EINVAL;
 
-	user_msg->len = 0;
-	user_msg->count = le32_to_cpu(msg->hdr.count);
+	if (user_msg) {
+		user_msg->len = 0;
+		user_msg->count = msg_hdr_count;
+	}
 
-	for (i = 0; i < user_msg->count; ++i) {
+	for (i = 0; i < msg_hdr_count; ++i) {
 		u32 hdr_len;
 
 		if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
@@ -990,7 +994,20 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 		    size_add(msg_len, hdr_len) > msg_hdr_len)
 			return -EINVAL;
 
-		switch (le32_to_cpu(trans_hdr->type)) {
+		trans_type = le32_to_cpu(trans_hdr->type);
+		/*
+		 * orphaned_deactivate is the case where a deactivate response
+		 * is received from the device after the user owning the DBC,
+		 * and the message requesting deactivation, has gone away.
+		 * In this case, only process QAIC_TRANS_DEACTIVATE_FROM_DEV
+		 * transaction and skip the others.
+		 */
+		if (orphaned_deactivate && trans_type != QAIC_TRANS_DEACTIVATE_FROM_DEV) {
+			msg_len += hdr_len;
+			continue;
+		}
+
+		switch (trans_type) {
 		case QAIC_TRANS_PASSTHROUGH_FROM_DEV:
 			ret = decode_passthrough(qdev, trans_hdr, user_msg, &msg_len);
 			break;
@@ -1281,7 +1298,7 @@ static int qaic_manage(struct qaic_device *qdev, struct qaic_user *usr, struct m
 		goto dma_cont_failed;
 	}
 
-	ret = decode_message(qdev, user_msg, rsp, &resources, usr);
+	ret = decode_message(qdev, user_msg, rsp, &resources, usr, false);
 
 dma_cont_failed:
 	free_dbc_buf(qdev, &resources);
@@ -1446,22 +1463,7 @@ static void resp_worker(struct work_struct *work)
 		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
 		 * otherwise, the user can issue an soc_reset to the device.
 		 */
-		u32 msg_count = le32_to_cpu(msg->hdr.count);
-		u32 msg_len = le32_to_cpu(msg->hdr.len);
-		u32 len = 0;
-		int j;
-
-		for (j = 0; j < msg_count && len < msg_len; ++j) {
-			struct wire_trans_hdr *trans_hdr;
-
-			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
-			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
-				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
-					len += le32_to_cpu(trans_hdr->len);
-			} else {
-				len += le32_to_cpu(trans_hdr->len);
-			}
-		}
+		decode_message(qdev, NULL, msg, NULL, NULL, true);
 		/* request must have timed out, drop packet */
 		kfree(msg);
 	}
-- 
2.43.0


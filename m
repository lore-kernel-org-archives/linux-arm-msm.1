Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7737E5C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140228; cv=none; b=pxrpXpT8qhvvmt99WVTXuTvCuzz7GrpBYJOAa73WmQWnr7NwN1aeDIRRzWvzU4OIz1QeGk9J30DCRG/0deT5aS2Pnh1yamfOcqi6ZGrFba0ohqHC4tl93TxLhrxnTlnUN68blM+UGiP1PVlF3gldo46gIRclZwtIui7H6rXMqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140228; c=relaxed/simple;
	bh=cHC+UHnFTXah7PYvHY5YC/sMeyCMkaCll5i3gjNsico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Jtu3QRp8pxd712WRbiJbWXo+J1bCxj1h/5AR5WauadNi156BzrSaBO3Z0q69XgN4PNXuJbtYazESZ3bHYQmnejyS5r2wKQCLXi0eNsHH8eelTPWqqyVGe5FHJKu9+0y6o/+2buZT1Kt2f0+y2o7913V46AiXF1ZOGgeIWtYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suq9KY7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq1CnhYj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suq9KY7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq1CnhYj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmESG3780627
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Urk/tOiIEwK
	LzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=Suq9KY7zVg/VebW6W63FMbrTuJj
	7ap8NNkC4Lsuzv9kMMfAD/4qrM2tl8jxAe/P7CfqHEXFezJMEx93GLLUd4mYXgOP
	MYvLaM3AVLYi3qEn6EHYbpSAoKaKHoydQu5x1EQjM+5m8+FlnmjhShHvXbOb8CeP
	BCMP0JBc4ms6YpO4HoYFpZst5TSnmCXVv0LiCae61u4gTCfHoJo9FzmBcIU1hx6u
	F2hKMEQhv/553GpVDCLEvyMYAhZ6UUsHiQlc1fGGD3vZQQTzfgbaGXGGc/TkaTcO
	QLyW+Io1/xtaBj6k6Vf8sm7/jRYPc4YoowZijbeEXxnHdYIyBdGud2O3D3Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj5rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so248377137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140224; x=1789745024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=Rq1CnhYj/sqKKtosAqiCDmjPSdu+izEnC53r4WfS04tGkNvu3r1y0TLAvQg6gSCllo
         iJK4tUVGMThkFI66Cz7pgafxtr0u3+K6dd1JnqAWNU6GgbIYsogxeizh9dx5N3e683hH
         LdjttzZGgjJa7uqwWjqOEWnwYIIq8avKClkzPC5V4MuOqv2nWXebAr+dP9RxjoW7M8sE
         9YtI844sTPeO5rUoom/VnYSczsJoOYgNAYoJvoappjreuCsML1ss3ubR7X+1LuIVAjw0
         ltVkq/EK+5P1CUQ2HWdMfgIyJFAPU2RK7ZLNSGiqSA9936v+cOJdKGggxtpxHBQycIbm
         X3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140224; x=1789745024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=rFr3a1O8rvDWlpdgyhq5+YfkDwPxKXkLNyLbHlnHigkq5om/Khh0rw+oRSjK7pEKC3
         dHjxwJypgLaq4s2w0PXcKi9mm+cMJ2RvbcFtijCx4Z/QWBuBZs4RhoNmgJnvOyQ/mnDL
         M74hp1e4EbxjiKGx7776OKDmsnP+4gzG5tpiTVGuEKYsWHbEUU+2w8XowFY7ouX9fJed
         Kj8Zc0VaQR7GuLmV6rKjTNPVvHCWkCa4lzUuHkdWbkC0Oe7+qdRMHGJsMkYsZ+sNRE0S
         Bu6chQe8jCYJHdDbjke4DSA8jq0S2AtGW9xGA//2XKGHF+pVF8pKi2x2PSIR/KiThDi6
         4NYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyk+d1s+pNsTc6XNmoCKZnhgdwadLuTNYv8igSGxJgxr6xAP3CXBWj4xzZDYhHpWTsloMswbIrg606zWnT@vger.kernel.org
X-Gm-Message-State: AFuF++lQN0+OPS0bmuLUuhc3DlJKtKZtSmzx0CTrpfgRXZ3Ne935Dazh
	/dD5CjULZ9447yngtW8wIU5OtTpklciNrz1ZzsFer1Z8XmdQ0kqS7YHqVHLkBkQTbAgl8BxcHAM
	O7iR0cOTe74dTDJm5Bw7lv/CpNO5pviUuTpAV6P7fwwQhCcd7oB8QVU5YzwFDZXA0oPLT
X-Gm-Gg: AYBFou24YuopAadd2WK17EHbmMdULo6chmWiGDy8QJtQ2pr79s5c4WSMPOQ5b7TkIW9
	W6lxkif6ptkSR8oDiUVSlfLRTUQuOIPbySUhNMKFmgcb5c7J2dBZV8SkCYDahnEjS7GgpciicB3
	2ex2LW+MlyWO5I/CWhgU3v9V7eSAP0mHGtWBPb69Ew69tHX4V7AO/X2W/OzNEx9d5eu25Kyi7ef
	Ai13DSFVJgW4kJ+VphDW0ZPSor8BfAp1vwRBmT7ZmdHJnC42CwvAulBjuLQbZxODSjl35Y0nvEN
	ckdYo4s//npdLVIU11wOddR9J0drlIA3S/Y5WfYaSpDbdHdljaRgXRnopf//Yz0Keim8vMCqhU6
	WwFuQPRv9wolcQ11+p8pOdBLQWRaNlR7Mos7T0hHZFsRnMnCu5Fz2aKaXRzyeA8euWcIOCqNwNm
	r7mYQYq0qRWCiflHehD9C2Cw==
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941238137.11.1789140224578;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941110137.11.1789140224027;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
Date: Fri, 11 Sep 2026 17:23:28 +0200
Message-ID: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX8F3Vdrcs9ZuI
 e+FdHe9GfKFrT70coI0uLLKPOpFVykC1O/4rEMgrqMeQMuxCd66w5ur25KlypxP1Lw2nTGma8e8
 zCjs6/TsREtoH6xc0f22nr/j4JQZyb52w6hhydJKtMEg4gcTqX41fLKBT9PCP99HnMU2eMqpHEn
 b76d3iWiZ4HOBIfbkK2t9X/KpBUnTS7qQSMAhW68i7qLsHmhm/LOOROY8Rc1lY3svphXCA9NEpw
 aJAMvBZzaWlBBuOXBNUkYcXHGwtUekvNTT3xiA3i00CU9bl51BHdfUB/knlnZ4Kd6fLHfxGDK67
 +6XEymyaYt8+khbcwpyGh24hfBHKjEAalMnJs/bB5Ta2HOFjXn+TtlBbye6auYsKEyNlkKPT1kS
 tPhbaCmWYRAQe1wysX/ndSNMs2pdak6TuXHGh+9UehE1W14mW2V38DRuXeno4OfD/gyFWH1FEzf
 jNn8JQ8L6c1SOl6qiUA==
X-Proofpoint-GUID: gno9MF7vmYiXrWm5GtsNjTV1f5l_uDtW
X-Proofpoint-ORIG-GUID: gno9MF7vmYiXrWm5GtsNjTV1f5l_uDtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX4f60LsqXMs3D
 DsgPWRmDDRqyjoZmEUqJMtHgZZz54L6nN5el3pBilAq+R/07ge4AiXECIXE5ta/zlpw/02CUvgd
 fmyCvZx0uJDzzcd+xuse/FFJKCOBjjk=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa41d01 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=EzzhlMzFHTv8R9URApkA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
the notifier call. During this window phead might have been deleted by
another racing scmi_protocol_device_unrequest().

Re-acquire phead before cleaning it up to avoid this potential double
free problem.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- New patch in v6 of this series (Suggested by local Shashiko run on v5)
---
 drivers/firmware/arm_scmi/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..651d4ba06574 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -173,7 +173,13 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 			}
 		}
 
-		if (list_empty(phead)) {
+		/*
+		 * Since scmi_requested_devices_mtx is unlocked during
+		 * the notifier call phead might have been deleted by another
+		 * racing scmi_protocol_device_unrequest(), re-acquire it here.
+		 */
+		phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+		if (phead && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
-- 
2.55.0


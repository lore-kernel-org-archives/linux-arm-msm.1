Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2593388379
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372538; cv=none; b=V43aLpRlxp0yT3DsVfgqFherM/Hn4SezEP03gdLo3n8hWF/AHczMivFF4L3SsaJSEHmTdGvKejtW9z9Q3snyhHJaoBXtRYMOJ3sQpWrbGJhqUK06puD6o79DNLghpv0QKd1xf02JpEVEIeYFfPoAJxiho1Wqs1lCaot0qQYEgGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372538; c=relaxed/simple;
	bh=qqYzxrvaW33GugN1wfMmttWK+is/52VK42xgNKdCyJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyOWQx9x8heeuLSHxxhwnoZoNzz6sShhhlYVvB8aQdfxQ5hHimyCIiY+rCCcM11oM2B5PNP4oRTe/9OqzRKjCt0a0WBpv32abiprxYyQd1c/tHaEGZ9WASYU1f3D4hTfLBIERevYHVDO2VuEyhykmo+2xe0iTX3pTiQtyazob1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llUct4c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPyvYJBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llUct4c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPyvYJBk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrGQu2976138
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 18:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8/6R5LUyWsU
	dJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=; b=llUct4c580shIcDg73MLmvRVJL3
	rYZ5pZ9DZzYgOKGXpvVH51WqQKdKZGK0PGjK9aV8Hr1J3M2iqjaQLjf2LDMvlBPL
	hGv4+zlqEgaLeoNRQZNR7JIwSs9oQY5MuTyqhkp/X4yGCaDWUxWBssoBt9vrMFl2
	oqayeEXnypFPbNivWamumxlt7OdkxXSXtATWmzYewVhTVTXHt+A25SKtlpDQbpcf
	Ym7HOMI6Hyyef9p04dBmlKhMLPacd8l6gHKILQZWe4yWuE9Mai44qxXUUg1A4UYG
	7YqV04PHb9ztuflJhayzP1qtYP19J4Lyx9oGNlqz4sapzGCUBxi2DPgp+Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn876d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 18:08:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so322286185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372535; x=1788977335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=NPyvYJBkGL5OuFDA35gSYGzmpj4bP9u0QwejJ561++FChQber7HDGvHZU2KGSX9AAH
         j3Kx4Q/4GZGL4PpBvTdZ9GyzP66cRMooRjKJMqPctkpXBMhIMW/TiTE2+852yyhh0mAE
         RYASD5XyawjPtrLD4Suxp6sBY7lhwEhGpJjIPsjcxpKzOiffPS2J6yjR0eKyTS0tBPCj
         8bcTGIm5GcgPdSpftj12fRDZtYxRPLGCTO4fDFAKs4N4z3gOhctLVOqVAzvFwI7nOojA
         3q1GOkXDbFUFSCXdKswKwbvWhGa/oFUtioIRMF3SGs9Oc0TCHEPe+oBGrAEAzxBAuo+Q
         bM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372535; x=1788977335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=GyR0mmfLwsciWCWqQZlZynuoMBa4D3R+cPGHthjjZCSUDsOS7GY6/egI9iPcdDeSRz
         0tpsyHc7+LLixLExWeOkHloN8E/Ec+vKNWOTwY2ZP78ZxgxGhaGNr0rFmlWRRB9AQi3Y
         51PqCZsxyVhn/U2jD9aQpc6sBr7TmB/PTETY/Zyibo/Ui3pKf2V3KqVRw37ZtSfrs59q
         kncl+mut5niCZg6rQQflQ7yqrbeHmREVsDx+tNGxVg66JRR7i1YqdplRv5TbPf0X1EA7
         6wMidjAOc1voDHmAkDgUvw4vYD+rlRM6jFr+fDTOX+G1/zH/rW3b4EnTMGEUTh4YoD/Y
         3BXw==
X-Forwarded-Encrypted: i=1; AKwUvBzNKVMnmHaL0XR6hlneX24Vi51+Z7SF+Dk/TPusAWem2Qbm9JOxXhmugbpN5FuaUQTFdB4xH8QFV4CjeQ7V@vger.kernel.org
X-Gm-Message-State: AFuF++mnXqW78No3foNOPJhA7xXYq+1kYAHAGwyp/y4OUzPB0R/w4gDW
	zaxG8IBt2PKUryP5lw9tJK7DlRD3Zvl7b9XcR1tCKTzb9C2MEIgY0C2aJNv1H09VZFXIImemBul
	A9ArTmbqQd5o5RFeLoI/OT6F6KR5Ua8t++oPA+QB7uM6rpFvQJ+FTphYJvLctG9S2kQat
X-Gm-Gg: AYBFou1RgD++vRJUVsqDzR7FOnl2wM953G0P+1KGaEb7p4VfsUwBeHEIE0AIqBie0if
	e+8nhUi7M1bK107qzmHMzHhK+vrlBgXw/5bxCwri9Gwf8qMksVZDHDWjvuSTLbJSO1tQ7njVRA6
	2WMtZlXQlnUCkruKqQxDicagG5AR0qm6ZCjn8qRdjObrS1J49aXBWX2+zqABaRGog412Fx8CPIj
	Af1g2il9ADP0M1jfXhBmvL04AhD7G3bxv4wjyCSjrcqUVq3LR20bDaHMjQLHe5o3hB5wyVGk41w
	vq9bXfWYS1sUYYG5MbH9PMWJlSjGvqifb5N7u3KtGK//458Po1xtvg86sZShiZS48W5Cx7eSilf
	sD8FoOBdckXUaiKZHfZE1cFkt1fQC6VF1EqhznHcsp0iVKBgtCpzP0j8vbm5rAYk+ucF/yM52wp
	QSE3p1iuKexx5+mNU=
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717703085a.41.1788372534534;
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717694085a.41.1788372533835;
        Wed, 02 Sep 2026 11:08:53 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:52 -0700 (PDT)
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
Subject: [PATCH v5 2/3] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Wed,  2 Sep 2026 20:08:43 +0200
Message-ID: <20260902180844.41230-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a986637 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX+IuSQwHFPsM+
 ECjODIwJhbv0Fdu7MGp8k93aqqyjKE0WzhlGHogc/twImh8RgN1wsHIXLUityLV6A2LgmLnwEIJ
 D7prZIumDO8e2qeh2nCID3LqGQQu0a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX8pIi3YW32h8N
 AA0YmiWXRNvLGJsuH59SifHZ+iGyKabIjx/LKtv1hXY+KWgUglODrh0vm0yL4VzaWaNMWBfzSdB
 mMdsUaAF+cUXHBcxh4i2u8tUD6oIOouypecQbuvRg8UJK6+u0wsxGCkZ8VLi26p3n8fO9GIsELj
 s09bBUAM8tyGivGlfSPP9Ht2oOx/YOx7V0/UkBB9U6Fqgg/ZgA88sWaBWCO0sb/+zAOErceZ+ou
 w9wm388Hh60JWH0CKe0XmOWX4w6pmDF2owgZYG+Y5dNsY0cQDikvI4U+d6DRdIKbn+o8N9YVC5Y
 V+Dr4FKxGo+aURqGVLoNu723wkwpzmEYO0XBNJcf4+6mPwrybSbNM1doKlzVFxBBoyBfzK3yLuK
 6fU7AO5hIu8ARjVnOjvka4ePq/2+9a8kkRNFjITQokPM2UUjGJVVy5twob6dAkFpTeUfzSMd95h
 oxC5g+PKVlm67IlJe9w==
X-Proofpoint-GUID: ye0M7smLfu-oMEH5InqFaX6P7W9sa4Uj
X-Proofpoint-ORIG-GUID: ye0M7smLfu-oMEH5InqFaX6P7W9sa4Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0


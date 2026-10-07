Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB247FAE0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363883; cv=none; b=I7zVGrxaBC8H8l6uOfoLl0jLYKePca+G6GiyYLSNejF/aiWULkP7Rc/sDCFijELxqqTz05exvEacwWn30igfNqGjsNH12jBUE3nJAQdiU5VJVhc9aYodD+E6T4lnDo2OLF2NEVGJvAsV1wN1RJ/3Lq0jQMYciC8a5jW3R0Mu6cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363883; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EtHz3pTVhKTMOqlSfiQj0EgOI5aas6niAjhD7vxvpKKqmg8FO7q70SABMGwrOynQvtpECRptIyOUf+Robb4tljnKMWqUYQNedw2LAIvW2wUeMXTlu9acEzDnnZaYFhdqGUtEsLx7dduBINwTyUF6/OFk5hxFl4DQS8s7Q/Jthuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgsd9qfW reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgsd9qfW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeBM3334685
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=dgsd9qfWx9SnE3hFg8if1gsUaiI
	FxBFQmXS89S9453q1rnYyj5PH4+dtPJfAwEih6koE6l5x7JujH2TG61d4gueOrEO
	Tyz1gygpZXGdKrmbnZabHsnQsmcvIifWzdcsgW88NTrw/WEjHBZWntw8fUstcAy4
	j876X8n6gjyfMR28GFagVdlYMgVG1v/psQ6RqRooLt5OuTYYED+syRou98Ml6RtY
	p+KrOm4DHVDE6FrOMoDKHACx8IpNg3ngHa3IrH+7lF7V5VoEijpXvxGeGveMrqls
	3bPlDT/fp/Vli54tHkaqN8zjhG/ePGimYcDwOYCpv8rTDw/j2ESleM8rt2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623b3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:03:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo614131485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363787; x=1791968587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=udVNgoFVXxE0zg3wHAMA5zY13T7dWYPAXhRUeRlBJoycr+nOEf930qO24dhp8S/HvX
         0qI7OUqr2vFg/M/LYztThmJgCveQyXXLvdIXMn9EvfU9gWIq7mQPM7dMdqzgKm9a3Keu
         jOWeFJ7gWXGd4ntJhTx2ShYrS27T5TG9xAtk0rov2k2fCoI74//n3LHoqEEBjTeBZruP
         UUHtjwwFr9jrkmzv0xoPgnij45A/ykdMWB4/3xLwrtj2zEopVuQCkVki/SrErKBHmrNV
         PZMRnr4H+YyHUmyVoUCxxmSlmV9ttqbBWZ0bf95qEaZPq72r59Z7/ugsxcSUmFY7Habg
         h/7w==
X-Forwarded-Encrypted: i=1; AKwUvBz2Bci3Ss+Vav0xqTIDXTeTBjhvyDYqQCgrEWj2AB3565tKIA2KlipDeEW1tfts24MWxrNvZO2p2E/fJsBb@vger.kernel.org
X-Gm-Message-State: AFuF++kfcqlr8PIh7f8mGPts8kAJxfkmb88LoO8AtP+nPZc5O9SNiMi9
	oX92aSM4roJ4UESAThxZpOw3/jGBfWrnfIydtz/erqumqu/DXpWJcQD5pmw0+5VMvIa2PxprlGb
	7MxSgrcjbWXoLdWZDg9yO8G3dpsmvNQrjj5j5esSQKdKLmrEXCtzDzEbapQKNXfbK8h+l
X-Gm-Gg: AYBFou2MFD5WwzoflTgiipkJKus2hgT3x5yATuHPWNnE3GQpJpuvzZPc0vMeB0zTjsA
	hUfPALu//HP/I31zCZn4lrCbDxJZPdDTyltkU+lxcETy+/D7L6FId8jYjj41OJEQt/sqJDgWv+p
	QgURm2gWcebzB/TvkhnFgUFDJoe6sfjU4ao54QvMvTKPf+uDccBADc45JshLqQZ5jJLHoIfRs8e
	JuerGb53I2aJVxwMrOA/4f8NQzquELr43JamYv5/6LpK/C5MJDQDQjWGQK7LqUyRJW1b3BH7XA+
	vr1t5jS6gpMafavLqIsJ08cz6VJL+6/urIB7+n8WaQaKTIyuCM7ThFLtKZM=
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290687185a.34.1791363786724;
        Wed, 07 Oct 2026 02:03:06 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290673585a.34.1791363785583;
        Wed, 07 Oct 2026 02:03:05 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:04 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 12:00:37 +0300
Message-Id: <20261007090041.3732717-42-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NJnsBmSICTtghE-9VODqeVktjyI09YBU
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60acb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXwVxtLs+PI660
 wFDKCsEE5jvY5axWCMjJDqsaQ5RloCfz1vS6B2jNP506o+7zIIykWRZvsfmR2Z+JoyaIa5AfNGc
 xfbjXRAhyjvBYF/NqrVxn4a6HUPQ7ps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX979mmhTtDtaw
 dEaZ2DeUFZXNfI9X5EiMyGZ7VryL01pYs/6vINmW9u2EQewZDDQBl428FGuWgYvHxoQ96SHIadT
 +YQHN7on1JXPguHzkOlPyjmhBgUVjZfcaLuQ0ycqdTpdayqFldpSFzx8TjisFINdNLtt3kFvFHd
 mehGAj9vIU2BlnPHo4XZLcJYJYv5z9U0FmtwHOM345PRRlQDbGwrh0fXWrVDa26Bq7ywuXnp+Uu
 uxp0LS8fuLZd2/HlmdBx7D++Z45XtVW6+8Ry2o49emLBaMSO+8bGpfFKc/v1kC+f/7Q7eOMlil/
 FEatiqgc6W8VeNw/DKo8VeVr8l3/r36B8E733IX3qxhL8tgzNc177Bz6gSKZetbey2BIPg/CUBT
 MuRrmet+UAGhA/5kPztPT7unGvxlIlxAwKPh4mP6/LFW979HuQXH06DPgs0rOY8j5Se4c6dnTLj
 3AdbLLb3WiXpMPqGsvw==
X-Proofpoint-ORIG-GUID: NJnsBmSICTtghE-9VODqeVktjyI09YBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1


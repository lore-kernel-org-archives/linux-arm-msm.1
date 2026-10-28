Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193851;
	b=JVP8sVGPGAoVuWS+ljxjWXZdstPCIeGQnju4yVNAf+ypu7Mi3zLoBzc7x9zrKFmEctqF
	 5hGizY1bsVNPzoCtu9UD3kljCTX/Utc1zMUPdqayeaghIIBEsd8KtCSw/x6gdkvqsewHf
	 7JWw2iQKgLaYB8SMo28SCfXLCLobL12mu3YTQ8LOpAeyiXswn9bqOxFGXU76UwYJLNU00
	 xLwcV431sqbwe4iY/q43pgO746bb+ip7MvamGYRXSsooarJ8K3vwsdR5ojfWELT/sYMBc
	 8HD3q/zYcyjuzw1r6sFcL1yBSNe4bQ9THRKLyVMzl5Wyifef0lc2TIwHRfLRelvh9xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
	b=qx/eaV18n3Ey4FVYAGwG+bdr0/XLKAU3I09H8SQlR4d8SHVbadTyttcVn5cOPADAz0ni
	 hri8w6YNDYXhsHmo/GxzZn1lHalVvB7OeseZslJ5aj2WmWrwk0PqiGUkWF/ioqrA0QzRa
	 VqJYaJqGanxUE3oVMEet0aIsLdozXEQPL2Qa+ZwJ1v8rufEoQp4yLvDPq5IUU3rBn7ymc
	 2S1RBtqHWtcxhdismz0nkUvWEkTy67ewgTtysJ2JCuNOZIjSIyonJkCzhBpXQ3ZBz95db
	 YtIQT0/F4gpCVfFynZh1SUftA0rznzKrw8ZYSaf1bSWz3PrxxZnoQfl9g29lNRvYcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bl9Ki85w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PADIeGMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F85606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F85606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bl9Ki85w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PADIeGMe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3x84154763
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wv4VOK5tSeL
	NeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=; b=Bl9Ki85wq+18hA6dQKzat3tfbjd
	wsW7kzy63YzuzG5Ca0Nhlz23lHi/asQaa2PPgertmjHGHZePReHzNljvI9U2KTdj
	3FQKVbC7i9Jx4oRKw5N6Czltwh6JUWMybl3fYGrBoMALHnRrhInKq6Fd0IjwtaPt
	HQ/ZwHhDW3Rc6BsTpgluwCAWeEG0trxgW6ShxGxG2MsTSQ8cABxXCM53sRsCkimo
	j8bBceIX8J3wuCO+tLQFhvii0/2m3vE4ixg8RdnuqibGwAP8uxevJZRLT1HRVXtY
	SnTK9HGL9Z/Gf0ekDdgz56DCkSxBmJy6AQ8j8t1f2SyVXOCIKceYjofHhQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0ynx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso131062485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193849; x=1793798649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=PADIeGMeg6GQrnj5Igi6ul/xb2U0MFcAUkwgrnDd/jw/UUcfMxp1Jj8gJPKthItIpk
         GyteDNSw9IHPP2ZBAJo76V/m4vO3Yb9aipJhv/yEy07HyK6Zy/PpgV+e3g+DLxoTV/XH
         3KBOWkq28W7c5pYMl+cQ27iJwgsAKP4LwmB95PAm8Ktms44IKZG0gCedR79OA8d+K5X0
         vmzOWnQUFShHsy/vaHvimDpoJPb/8N6fb4DfGj8TdChm9lrOglsPTF74T4ua8uh/bvgi
         XrAbQo7L6y9ToD63SKMjBJuPRFuPmNKRoOqALmTg4iSccapdsCQo7fKUAHtjdVHs4mpD
         pICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193849; x=1793798649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=QXR/R7ADCA5WA6hw5WP/DC97BHO3+8Q/WMAl/VBEw7C4y86q0H53R83YXx3p4KXb7t
         QqVmV+tTzVndbCUxQInGKQyeSUxUTOcrQTJ3WYAAXUTLuX0ekJ6q/o4B+6g+4sMSGOCJ
         BloyVrRmIGglnb4aqbl1x1GQ2nhHXpkEr88G5aqNheuH90dfqCJz8jvNEpQPVPJ6Wut2
         8yYAIgOYYqwy5S8iheV/ZDJQOy4rwDhkYntpnaNQ8pW4sq9JGjjoBbwM6LC4kmZYfha0
         NE6SP3pCUDITZpcmTRkMUPKLL5QaJO2qezrZt1J6jHfMJfzhwky15LVY54NiLN3W/TzT
         YDCw==
X-Forwarded-Encrypted: i=1; AKwUvBzMSq1CboeUseS4kBHhfK5fEj9zbM+TKS8gRYx4cddqSDAApLiZe5Q7b8K7nyhAMZaZXrc1rABs+hHutJ1I@vger.kernel.org
X-Gm-Message-State: AFq9FYIO7BN9kkB40s9e2i1Tg3Ga89uaghfJs8OTNZETzFjshOXbshMY
	Uu7IfEz1MApKcXOM7WmpOpRz4pVCgutxSy6SF3qidvTd3qFnhwoz0ah2gvyf4MA3OC3yi+hO4av
	dmU5MUgNFCAwnE7r2iwJKzXLS9hBaB/RDvielLI3B7mCN9SfjwEbeOO0Ol6QA9POS42hW5zJmA3
	e35xc=
X-Gm-Gg: AYBFou2arwBzSL+T3qhDlIy7Xwd5wsnObe8+wudbA306TPU/vOHl90z7o8DOGkaFqst
	nO88PJ6fiqdNi5muTRAp0xrhXjt5XPPkaLR2esh13YB/9pJTfxINDd3ZbZCiJyL1hTqAxPoyRYU
	kRMxzHLfOo938TApUkpnOBwaWlLr4aWLvLh1BomwXyVJxxckfME4KJaG/tzNWxHHyHdBY5P1C2y
	5qEw86qItFSIXsj12GdjxtYQjhQNl4qpy6FgwGze2KxLXscDb92KWBEZfjzIWvq7K2lIMNYGd8B
	a8KywHt8RgsQRdC6FwNB1n/87FQIh9oFbxGGMmgVsCy5Se8urQcfbw/h1pTkbwbJ50hgy/AwpLC
	NHtyZCV6hFx48ayzSLP129lMTHFGKV3iA+MqwXNGDfI19h66KZJDEgW4a3XXe+KwX/3H9nbhbXw
	==
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id af79cd13be357-94408a5cc06mr316384885a.34.1793193849192;
        Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id af79cd13be357-94408a5cc06mr316378985a.34.1793193848519;
        Wed, 28 Oct 2026 06:24:08 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:07 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Date: Wed, 28 Oct 2026 15:23:58 +0200
Message-Id: <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: FRBLyeEFKVFfJT1GMOmoX6g8_qutajNk
X-Proofpoint-ORIG-GUID: FRBLyeEFKVFfJT1GMOmoX6g8_qutajNk
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f77a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ezZDx3Tf6p_-T66H79UA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX7kHNFHYjnnWi
 ++EKadWKljmzQqP4CNdykq/ZJm1hZXtHGKD58H4XtS3s5hjd+qkoGEBVITKrrDthaLbaeRcGBXd
 UzFW04/UkXxMWMxH8FoA8RWEoUgIwA6/5REvOsCqTHBOnhdEOj0U8rRvX4WRbJ2ipyxMY0T9eWR
 OgWSCNrHoVpirQH3aY4fZHIYOsT5H3wDc3mWDPT/27EuZi7o5l/X7RwNJHb5ToRk7T9LAvJO9OE
 mSDawy0BtUiw27fgNUwr+OIaC+88EunhatQykPFHN77oYbtodDMG0SD5oVMsGBN6NMzHNqBNufg
 mniTBDSIhjytQnBKATISDnJRnpaDhak+LBeiaHIidCTjNovXkxoLVcGW+ugXSMRPl4SHICoiMmY
 vntuZaCUzzqe5ATEVR4HDA9LwbNs/q4ILvv6VffMOwvcwOPHVvVYZD+LmqOfjvkyKW0LvDzm+4Y
 3ySR71Symbocyv9vKXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX1WCspjm+DXJI
 6Y8SGfij7bVXFtPMIj0Bdv231HMcLGkILPe/5Zh9lCf4CL5DapcQ25lS9i8KQMYQ0Y3A90MftOt
 mllHgvGzdV7aqWT7xiE9trFqM/LttXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
minimum clock rate needed by the VFE lines from their pixel rates,
inside the loop over the VFE clocks. The result is the same for every
clock.

Move the computation into vfe_get_min_clock_rate() and call it once
per VFE, so that the clock loops only select and check rates. No
functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
 1 file changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..59be37f83df3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
 }
 
 /*
- * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
  * @vfe: VFE device
  *
- * Return 0 on success or a negative error code otherwise
+ * Return the highest rate needed by the VFE lines for their pixel rates,
+ * including the clock margin, or 0 if no pixel rate is available
  */
-static int vfe_set_clock_rates(struct vfe_device *vfe)
+static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
 {
-	struct device *dev = vfe->camss->dev;
 	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
+	u64 min_rate = 0;
+	int i;
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
+		if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
+					  &pixel_clock[i]))
 			pixel_clock[i] = 0;
 	}
 
-	for (i = 0; i < vfe->nclocks; i++) {
-		struct camss_clock *clock = &vfe->clock[i];
+	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
+		u32 tmp;
+		u8 bpp;
 
-		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
-			long rate;
+		if (i == VFE_LINE_PIX) {
+			tmp = pixel_clock[i];
+		} else {
+			struct vfe_line *l = &vfe->line[i];
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
+			bpp = camss_format_get_bpp(l->formats,
+						   l->nformats,
+						   l->fmt[MSM_VFE_PAD_SINK].code);
+			tmp = pixel_clock[i] * bpp / 64;
+		}
 
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
+		if (min_rate < tmp)
+			min_rate = tmp;
+	}
 
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
+	camss_add_clock_margin(&min_rate);
 
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
+	return min_rate;
+}
 
-			camss_add_clock_margin(&min_rate);
+/*
+ * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_set_clock_rates(struct vfe_device *vfe)
+{
+	struct device *dev = vfe->camss->dev;
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i, j;
+	int ret;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+
+		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			long rate;
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
@@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
-
-	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
-			pixel_clock[i] = 0;
-	}
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i;
 
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
 			unsigned long rate;
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
-
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
-
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
-
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
-
-			camss_add_clock_margin(&min_rate);
-
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769354;
	b=jckuniGC1hvPAGaUfoFmcurTQOXalmNTimG3pCtfWA79SnETdDLt+PZIxGKPz76o4lbF
	 NSCoYTi9wS+60xtAMd5YxKfmFRQRqqPIDRbK0R/pRCP6lDVbQ2qD2jXF8YuVSfZCT/6TR
	 3pXemFy8z32p75dyXJLyxJMBCF3dKTMwDR8KZAhvO6UXmSXOIiZ92/Ogq3WsN+S8ltoY6
	 PwS+A3bXN7UZPMWEGepBUtLoIHWpvr+H/XHdl4U6Zj1N8aBE4wJ9OXeNJxw1a+/yG6IUg
	 U5zx30TEFsFF12ZCG+8NxF4f49UtZEy8znzXJXco/cgyrp0BpyJVojWXQ7DfFJecETA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
	b=CAAeTCLoFEJRlUJ9gUuMvgeZzHqMGkqUH/GWV+N+q2xj8l++0xlqcxY35+4Lfy7mMioi
	 mCVukUkMw8GWEbRp01CjnkPfVx+M9tlHtKe+cRapZEdnxtcXs6I84RMgiDONC/QVskSJt
	 tkvLQ1bSvBggiIaxL0ON7dfvcx0lwryd8TYtEyeKchaVgX5PD111LvTEFtYieFo6lAWxw
	 En8OKPOBrgtCF2B49Qgty0t9aMxnLd/82JrOhffNLHOZCoRK2ghE5T6RCQSJTOgXKDmZ/
	 W4Nu5RU+antJi6RZ/7Vd1nrK3MgzkEkZuAYXiRYZO//tUMiZZhQB1iPUATKu6Vz6wrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA4606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vfs2109071
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hHHcAQPfZah
	hxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=; b=nAxuM+CWplogxlLs11krXNiOTxf
	BVvteGg5rpja93tkYG/pKKrrkUGHe85qk96aYqJ4NIG1R93Klv+HOAiJO+PiBHnm
	/F3NhUM1T7BbFWPObD33876BB8D/TYuWXfa+l7BkjsILC+mECCzbDvJcwaHw7Uta
	PhS+SPP+7OzAUv7GJ4QWirKVlqajN9rTlzfbR7WLA3X2qodpcGyOaKr/wqphelGt
	k/N9U6PDfZdcm+GTBjStHhrABeoALmonOHdmHxI6mbcrRYabndXgMHZtMmG6ehy7
	o5OfmPzZ1u7/udqrKlJAk3H+XCheovndHw/O4nsCVdGVmGqAn+rycNaMFGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4a38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso253185285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769353; x=1793374153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=fG0RXALBIS42dTsVcBOP+McjJHRxv0uXsfG837XPgl6A7cVM+kOUQX70JIv4OZDcmi
         7+kU+i4pJtmcv29hCHQbZgHJ5Wphgu6LVjqASdvHl9SrWpAO1nKTKxSj13tGZWuK4MXw
         SBZk2YIALp+Bnj6c5yMFos9QxCaTKVNH4DQNYaaajNM3WIQz4RCHdx+JEMfvJ7bQZWNh
         CyQyNxnN3si2VR2LqDJx2W/gRPCm2UefiCO692PdXsCNu10+XM/YVVYSxtRGzvXwlavn
         bHwekqhll1vm64ytpw77F29aas+pgaGcfffMfGtpykHPNvPjcPLYHDKdJfR3yQ3EWS+X
         3LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769353; x=1793374153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=xJiRW2bvYj/LVpdxV1wRqnbCnaamy3PqScsUmSPLnf68k4Hyq++8azOrcLhHAVKWJC
         bI1rDEjXOo6HIXNG0CerAgpVF83kq+SraiBG1oqEHN3P8/0s/hDBGolU4HSR4nmu6Xhp
         vVFRzPlu+dOUVeMsubAJdIs6tbHfbZi1cewoHre7KgcGEgyzH4O0+giE+5OI8bGsPBH1
         gmh+39YuoByQNnpzDfaX8vVO6OBPalSoU8zwfMLZ5eyiBrSwjuVSlWQ94HV2d84iAZky
         mYcrkRpB0s3pjF2+vfmCqC9P5aQ250JhdyJ7q/8wtk2ExFRQ0RrlQVTRp8Apm6iMiH8k
         MrKg==
X-Forwarded-Encrypted: i=1; AKwUvBzrQWmG19tsL/N/bzTRkOKfrZrpFo07YPoDgq4qWCWjL6Tsmi13PjPxYUVwP/OIWRSDt69u2WkPhYV9z/DJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLBiGg6jSMDCeAJ+jg8nNiqBQh+R4CHg9Rkb5eDGRY5AHsw5VJj
	48RlJ3qbTT7gRvKtNruuadH/8fTpF7sYlxe/bkzklPrdgFUtxFwfc/kRNkTkBoCndLWt1towFLa
	Iv2KeqcUg05ErmOxhpGIW31YCzImahHZzHep6U/ToXkXZBfsHYqzoosy71GWdzt8pIKHA
X-Gm-Gg: AYBFou3zWUNnPMD7mjCRMky0S67LonwAuhnNxUN6woFy+ZZ0XLi1foCmV0Z0ZDKqURa
	+F192/YlsPpe5PLi6Pg7zTEWRbdeJRhLqQpkIK3F9ZiWI+dk9o7AzZqyjq+bCM8SMeS3xCjfOqg
	3xyE+yU/RTogDvczeTE/Dildts3zXSOiDsWulpXkbXpZC5w4EO5+vYPKD/QLG5TYuVisg17HX3R
	zAs40xYdQPzmYloFBj/PaV3s2Cwrk3fPRPo3HKGzK8FEmlREvpDdJp5HxWbPKnLDef5f4dvK2AL
	LcBLWjGRvtwc4xy5rSYV+VseaoIJ0NqDwA7UAmAGBvF/nBpjfYi/lUGfD7Y0ad2Lg1XE9UPQNWb
	F6bAmn4iatha4GHY98OktyO2D
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456483785a.50.1792769352683;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456480285a.50.1792769352205;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:10 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Fri, 23 Oct 2026 18:28:57 +0300
Message-Id: <20261023152857.2859767-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzI1XWGCPHav1
 OPyNG0J+pcgLgLagJlcrpitZV9FkI49bQt6/vb54ih+5dsEqI8pGR6di2Rboi7qYJ4iPpzZrJfX
 hxfvLRQDaNc3ejXlc7yn1KwVs4/dCTd4WM9TT2BgONerdtDyockecYF/KPxmD9MyW8LnzKketav
 753ikBkKV146KMluRW/dZbReY0+f/yBuaMJuhEeilrB8oWkQHzQHYLJtAomyTcRU/f49VNxj9uB
 oRQBRXpYulFeUm5/Wxrk9NC7S7zeRd1e6eFL0HdRM9bRWVBAWKDfoh/s0Va1DrcKnC2k60z9QRi
 IBeX+xRucb7YpHSne0eo4TKOpCHDrONwTKBwiRWI4Q0ZqrrzRbEYUsmNCS6W0jgmuLOhe/kioLk
 Pl+mxkFdnZuNGzM9B6IxyJzhcAiNHw2C3Y3ykEM/3iyuo1tVRnM6K2pnjSdr8kibudIH7cB8oBP
 yKojCtCElFKp4oDS6yg==
X-Proofpoint-GUID: GIg1CBSqMY2mtVvTpN3TekScwr24E8X-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXxvGtY464UuxS
 wGQ3BvmOqHnxDoBL1jv3Rd6mcdi/QNHiwRNLaKHRkxWujqVGnghFNRD0FsSclVyHTX8kzcf6Dxx
 BmIHycUFxIodGThDTNqO2TnK1PIvzP8=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb7d49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GIg1CBSqMY2mtVvTpN3TekScwr24E8X-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share its source through a clock domain, so it runs at the highest
rate requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index db5212b14d5a..71abd01a4286 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1


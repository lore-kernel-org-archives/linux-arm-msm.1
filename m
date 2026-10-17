Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDF379C3E
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209149; cv=none; b=t1evV/twbC7cnZhJs3bgiHD3r8zC+z3azY1KDHjgJj+rocYOv53p8wgQRfPO7iFiPVxLlQOsvh8HXiOlHbmp6ki7Ats9A7FdnWW3iwH1DGOPGtEwH4R/nixl0vmm8UN2mJk0G+E1FF4LkSEAxU94W4lW2Bcqrho9E8bALOqfQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209149; c=relaxed/simple;
	bh=zRm2u4LEYc0gtNFHizlm4NMKGlWn+oPcvAHoerFBkWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dQasj0ZSycR7hye9IjT+WWl2YOUCXQVqV+OdM8w5XyH65XKp5TuM7yTnNWn3Lr0ucNiMl7KesbSX3b1nWvnNWIb1ZvPQtmM/PgLyPD4wat+gUjMBUSyzelsSGWyMIATAWc4jg1SEnK8Kd/39SPrnJZ9ec00LCxrnJ4AEljAILU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRse4Mls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS4qyRKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRse4Mls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS4qyRKA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30Ut9942416
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VLDH4uYDOB5
	s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=; b=TRse4MlsgtHfh3tdYuNlJttb2PO
	eAO8rgj+9+84/UPRIQ5jOo+U7IAVkeo/d7/ZPs/Uic1ZGG4fJXxSJTyzzoAyiSPT
	O3PBx1AKQ1oLz0Cc20PnNNii7prwDQhi75pVRrlSK3qn9rKk6BW60L1ETtPi7LdU
	cRo7f8CMVKRFnKXsLlV5/zUcKz/QTZpCqa/p+UcfsH7LEur8ue1hw0v16NAzVAzA
	S0r3T1BohEoQ7j9QFt0YdFxYLy2RwD3oFEupsUDwbUgNOlCRbMNFL1fzVSbSIoMD
	h6NLnW3rR6dZG0EaLVLbvB3SIx6v5o7UJ0dQ2Hn0wZyT0jbiAzkMjvSp04w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys05mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso848579eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209146; x=1792813946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=iS4qyRKAiFg0KbsE7rePVui5qbfWrR++GpmsPUI6ipNuhxkr3gl1glJ4FpwDrZ+9eY
         gH0ie49J/yCHLhWtiIJoMuf1YwYiTpOKj4GqnUzkuj8w69GiRkpYbcPEzTLqEBNypCcD
         PUUrLhKCiKhd3hvqw/kOtgMJ8MOcMEa0iUMEBVTN17S0fswP1odSC2Jmxzy3m+hzFtjZ
         w/vSQiKTj0yB75XyO3i3AgpMRkvDtwRHBoUu5TbJzasE8FJbRH6hY6JmPP2NFzgqggxo
         jaP8sugqmnGVB9aHKVNpr9+tSu2tf90BbcmLkOPAE8l4wF8rl1r7/b2NC3AWHxv9iACb
         tYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209146; x=1792813946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=VStAUkcTSs4q2np8z2bwJ91vlZdV19HrWK3Rw+4EeB0jArRV57qZjJlelxFaJQT2nm
         6S7QFb6SNiNJElh2bJu2Y1kXmc15hRCAY19MQcA5pnbH3vAn7O0pIdbTgc2e+EE55a1Z
         nl0+t2b4XFRqpUQFoHLDIwNz6uK6OO7xxyyn4CGqohTNWpUg7TU85IvTGifqJ2FV7Kw1
         qlpjedJD5fNZ6N6eZXTs0q3bS9pQtvQJ1C4UmCZxHEyVKA6SWYyQck+ZLomUBazfs0Jp
         PTiEMJgHMP54QCGRj6ZnVehjGhHGHTOgilz8OxJtm6K57NpARttBet/v20/25cc0ThmR
         w8Aw==
X-Gm-Message-State: AFq9FYIl/lAHk0w/PS2WtxKs2NbQAPO4GHAw0hJrekvZ/xMgwGiLHWg8
	bXsFYmPoWg5MwetUOk2oMveB6yBB283Yr/taPMx0Ccda2FeGv0oPdXV9k6Lx8sZ7mNiYOXmupHF
	D+J6NiveLbjSsoph4g6hr35RPH8ccQYTvYnUv/rvKs7Q5Hgjd4bOADuquV4Ob1n8aVH/G
X-Gm-Gg: AYBFou3nYkBlx/ptD4RgZr2sc/io6QGbBd9u4yFz0iBbh7bYH+WQ9ovliWKnboDd8hi
	WLfNN93PwnvW4f07GN+AUY1+/O9KhcaEancA7AoafMSUMUPa3/YUH2c1qUNeh0w0mLtK9tG8Y9s
	FrApEXZYe5vcdRuEXDM7QXWCxqjoAeuLkTEs0te6fd+ihg4kQAwiuE9SL3ZKx3PDScyjGhcVQJ9
	LydoYbB5z3MRHBWq7Pxh0BRxn8sPIeg/iB28UV+19uCFRBYo7V9g4Sd9FiWsfMBOc69mdxRDfv1
	8dJ+t2ep9m4pSWeRhIx35xO0zPKmdhj72asWxpycpAcIw3kAJZUclNmrf9R5Y5AhGVJhA5wuN8b
	BFCnXQk+8u+tlJvfvUhTwBX3VuNugaxhaEQkp9FP3AJBZ9tjtXfLf6A==
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584949c88.45.1792209145717;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584907c88.45.1792209145028;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 1/2] media: qcom: camss: csiphy: record PHY type from device-tree bus-type
Date: Fri, 16 Oct 2026 20:52:20 -0700
Message-Id: <20261017035221.3816464-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX2pKvNCjxRHbH
 TEnie81eUUSzF5XZ4P3O/v8LolfC2Bvkz0ezYNeJXcokYTIefy3DiBVYKXfivFu+i9/YRihlLYM
 F6RdRRjPuiWOTjSu7CuKclElI5abQEItXqjXfgfBisDXNV3Z73Fi0+buIl1OcHND7gnPFMDnjIO
 sPwGShnvOt7bCJnNzq4+gZfuHdDImmMoXcOHyy/Ew1sHhRdgyvuBvHr1ixF93RDv/y5tgwnF/ga
 KdRD3Nkc+xKLKOaTkv69VkC4dPImsoZzCdd3i+SjkfFhLWParQWbMe4/Vafo6GdD7km/abbaaNi
 fg6qqduGWiwyMhsrWitpp029hOquzCi6XLDSpNRf+dxay1N24w58Srjj9SZwJhBAc8avpSXT0xy
 KOZvmGgdYKyXOe5Y2iPNDAyGMiH+1T54rDzAevinEAtkEmS90Y2nybeIOBEUbKJPy6cUHy1pFy4
 tkKCekyq5KnrnWF/efw==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad2f0fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CkjXbxflZYdHZoY9ubYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: T54sSjzFYYz6yo_VoLSt5LCx-PakWt-k
X-Proofpoint-GUID: T54sSjzFYYz6yo_VoLSt5LCx-PakWt-k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfXw10xkzRbCFa7
 XRcodggwHoUNYv+GQt78zYO64R5r6OwOjmft+Ujsa33xIUgH/hdWVVKKDs1pp547uAAEsZi5Dtb
 pZUe624SUjcOtsfgL0D0mYPM8Av3kdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170015

The CSIPHY lane configuration only tracked D-PHY, and
camss_parse_endpoint_node() rejected any endpoint whose bus-type was
not V4L2_MBUS_CSI2_DPHY. To support C-PHY sensors, record the PHY type
(D-PHY or C-PHY) parsed from the device-tree endpoint bus-type into
struct csiphy_lanes_cfg, and accept C-PHY endpoints.

This is consumed by subsequent patches that adjust the link-frequency
calculation and PHY configuration for C-PHY operation. No functional
change for D-PHY: phy_cfg is set to V4L2_MBUS_CSI2_DPHY and existing
behaviour is retained.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..fff504d2d489 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -35,11 +35,13 @@ struct csiphy_lane {
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
+ * @phy_cfg:  PHY type in use (D-PHY or C-PHY)
  */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
+	enum v4l2_mbus_type phy_cfg;
 };
 
 struct csiphy_csi2_cfg {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07f7bed9591d..c888e78256b3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4756,10 +4756,12 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return ret;
 
 	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
+	 * Most SoCs support both D-PHY and C-PHY standards. Record the PHY type
+	 * in use so that later stages (link-frequency calculation and PHY
+	 * configuration) can account for the encoding differences between them.
 	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4767,6 +4769,7 @@ static int camss_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
+	lncfg->phy_cfg = vep.bus_type;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
-- 
2.34.1


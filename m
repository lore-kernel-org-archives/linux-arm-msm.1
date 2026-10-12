Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3DD439014
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787533; cv=none; b=tjO+5Ruio4Yq7+1TbBRMFkQAw3aEXatLWRbHQSPgXSeRPnFNsgcWDOTDrD6BLrWPiFAoV1mrPadHhYICW+4YHdBhmWWMfttOTmPkwV58fX9vPz4dvB6e4nxpgBaw9bsnwa7Ex8fVHFl381kYvLZPTWiQmP2ksvhbWiOwItGw+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787533; c=relaxed/simple;
	bh=gj+4ZcvyLGFiNfdHePlCKWvUe6dp75D9P6rXGa74vtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GACLwFKxuFEZsfQX9IArEJxGmrk+UGFnuS5ALVZ0a1i6hbTTbAhl1zRBGObFLNZFfmLK2KNV0VFR5o8daXuHzFvOHoklr5mrDBOFd76CbEai/ghjD4YC9TJJvFvoUIOI973ZoZRMJfG5WLvKZd85VJZvrHzUbMZDkydYPHoUX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMXDbcIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJgDlWel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMXDbcIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJgDlWel"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55lov1856985
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=; b=WMXDbcIc8KpFBudV
	ryIZVcX5CaPbs3/Ujav+lrEs6biDXJ98H7FzUqBjZClC+6VHx9EehFjrBjw4oY+F
	FUyFo8WaOYe4+OiAAQv7+In3i6KZrWWokbcZFvwgO31d9XC/YJ7zFUP2h9HhF7Au
	x2hsa2HNjDHemOcRUVkoa21XJkncZF5vh+QC75HHBJ/Wska1yLOcCy+xtEL1l9VG
	uGZ62w3hmlFsxiC+f4XausKhqmN/KZi6VRpQH2NBKVCrJIxaChuy/VuCVrJrbsbv
	uNqPQnNB82vRfXuJD0aXMMi/bLMvhczTwyeNmA8j4CKAAZ4KroZwYFdTLwKygp5q
	0rZDbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnaa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so2456711b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787529; x=1792392329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=;
        b=VJgDlWelkZwZXsBvq2PNRIAub0GQXli2f7EqbTDLYlkJsPPrR4hmx2Wv0VUcHa6UZa
         4hgT9Mqw2ab8/pwlUvu2En0xOG/yS7xhcVV37BY50WAAHC+NrIEgYkRCzR4+4Zi8G/0G
         +IFNTr/gY3uaFIxRthJG12KEoeJA4PzJoNEcEAhT2pwwOHPZcsbnm8Y6Qw51qx3fergi
         0T8wNj2BSSxbfjPeFDO4av9PueRYGnoZkQ0lannpOfiq4GA8uyqtj/AkKEt18JG4W9o3
         LKI7QOiCPVbuUmI4LHv2ltRIbOhsps+eV8RtA3wo88d32XBL468aBBab1Z4lLtED5hnw
         0BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787529; x=1792392329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGMq8T8n/fmFChQTImLI0/8YOyadttJOmYpYwXVmHL0=;
        b=wklo2w5L2luvRrhXcM1wLoU3YkILtLMOyZtPKYryhrf7RYzmnAHuyQ0HzS4RYyvNFo
         NJ10EHW3B8T34PRHSaIdYEDjub4ZGFNTCMFuBcnVjc5v0DfVKGlXa1T1djx3ftf1+KUO
         Uuy/ny+ZwBUoK8S5wQT+c/pov8GdmI7tX5E3+0EmZk9vsyk0dJczPZ/Q/+AzbBOogThY
         dvedWxVC0HjGfaEaJYe8D3f5LMKx58ko/er8ZecmzL2K4CoHbP2K4Jlga3o9JmcOMau1
         umii3+rlnFJmOO1vGp5bc1XJDKETAAbUWQzsVlrMUaidzDyKVmkNTjZg7uOFZnOiGxgj
         ac3w==
X-Forwarded-Encrypted: i=1; AKwUvBy8Y2qomcFtcF+aosOE0Qw17QDLgqena1udSdhWqNTCxzcehstdNdKmsu5AJhoaRdFrP1+VjipLj3RGlVqc@vger.kernel.org
X-Gm-Message-State: AFq9FYLdIFS5BLuvfxMG6h/Y3YLpQ4DuyyOzPopGzkXK6UYKh19pfbQK
	nypUMxDk/9EqWZ+hhZCDGZYzddlpSyjvdiLLKZdezo3v/wV1m0WXrTbuaO2gMzTdRv9dMp6LULa
	n3tGjfUywxoBMCOO1jnDHWBsumk+r9t363Oy4/ialZ4oYgzAAIJlkUJK1kGuuLEovLMAk
X-Gm-Gg: AYBFou2rIGf/J54ydhBxhi8Isd31x+sqvud0KYcAJa45UhFSv6ZlmA8/A1CKnu+R3Lo
	gdqc5Dl8z/t8Z+cWNa4eioVt3mvjdW6qts3X7/Ty0PRtQZG5sqyubidsn26cE/2QwnFVTLs9mU3
	9SxMw3qCPw9B5zZpkApkjdur5jV94Q0BbboucWo6hjgNPaIccLzjAmU4P19gqba9AhhPibrGwLs
	49fxVbSB5+kKa9ZnJ2QWWQJPAVSZ+EgeTe2BP5R+fnNhP47juTbhW6L/5j3Xmm2XNg9gq6/Y/7K
	Y5HURaj9LBibWv4Z0Jrq5BiVtiOudzKRfYahDhABcti1FxHUqM/i/1BJOGCi+0EmPJ44gHMdiWN
	SWJMCWvLf9kVrQcHaTkqLDwpJ2pJgVNgPYTFvpSaX3j9m9S5Nfeqe1fDFEfRhqoVKQprH7B5i8j
	mO3ttLN+T5OQ==
X-Received: by 2002:a05:6a00:18aa:b0:888:119d:efae with SMTP id d2e1a72fcca58-897c8b899cfmr8312976b3a.53.1791787529010;
        Sun, 11 Oct 2026 23:45:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:888:119d:efae with SMTP id d2e1a72fcca58-897c8b899cfmr8312949b3a.53.1791787528518;
        Sun, 11 Oct 2026 23:45:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:06 -0700
Subject: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: dgjl5eQ7lPfWDp7SJ4U6TF_SP31Mw2jx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX4WVjdvWP3abe
 8xMHLhKrHE6VxrMeTml37sHrI9wo7cW658O1rRCME4T39Ifj5vd/uKHJE1w7uzDBaOmIezDmeUM
 UUekC3xf/HsJbL7zgC6g2YAopwkvYbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX5BNeB/oL8v+F
 vJYcjrOzgRtyx2XnpbGStk1/pvU6794+ZmABRV2cadgPfAbRbFBSmbfOWWRA1YTS1WPDnGwTzvx
 5wiT/ebpgrpIL00tBQ2BSNxXUlcokOOp2+Ow/CrUX+Mi7RD26FkRiwd8zFuW7vFD5a4uZp1GW3W
 zzzgkzBF9Ulq3vn7hF0EYPNhdsVBhZzVbaUtQIXFIUY4RR6BQDhaVfODrs8aq8ksx4FzqyjkOEI
 cg6fkyIqFDtq1vFisZp/WL95wGhAKrMC35QZIcQ4/fa/hWbUcM3JfyPeINOUrhzGs1WbshqGOyk
 vafGgC5HFYSk4352j/jUDDKs1d6TzBrff4UFRolpGIR+gbFgRZdc6wkDlho7H3OxMR88hd4C6hi
 luQ8uZEMfO2dJzuPUs3JDx5yNVdV48qoQZKliU/CJZyG6wk4UPguWMwva214WdZsMYsBcbomAgE
 T8xP0BrYWXVTG7VSa/w==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc820a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PawOzgAtrr2O3SqsEfcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dgjl5eQ7lPfWDp7SJ4U6TF_SP31Mw2jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

On stream-on, CAMSS starts the subdevices upstream from the video node
through their sink pads, so the VFE is started before the CSID.

Starting with CSID 680, the REG_UPDATE is issued through the CSID
rather than the VFE. However, vfe_enable_output_v2() still issues a
REG_UPDATE after queueing each initial buffer, before the CSID has
configured the stream. The VFE then never signals BUF_DONE. Therefore,
the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
and CSID Gen3 instead. The operation happens after the RX configuration
and before the RDI path is enabled.

Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
the VFE sink pad implements the reg_update callback. Platforms whose
CSID does not provide this callback, as well as lines fed by ISPIF,
keep the existing VFE-side REG_UPDATE.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb94..556cdfef6207 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			csid_subdev_reg_update(csid, i, false);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..830c9c818d3d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			csid_subdev_reg_update(csid, i, false);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..16a0b5663fe2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
+/*
+ * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding this line
+ * issues its own streamon RUP (i.e. its configure_stream does the RUP).
+ *
+ * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so the
+ * upstream entity of the sink pad is either a CSID (possibly with RUP) or an
+ * ISPIF (no RUP). Only enabled links are considered.
+ */
+static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct camss *camss = vfe->camss;
+	struct media_pad *remote;
+	unsigned int i;
+
+	remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return false;
+
+	for (i = 0; i < camss->res->csid_num; i++) {
+		struct csid_device *csid = &camss->csid[i];
+
+		if (&csid->subdev.entity != remote->entity)
+			continue;
+
+		return !!csid->res->hw_ops->reg_update;
+	}
+
+	return false;
+}
+
 int vfe_enable_output_v2(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
@@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
+	bool rup_in_csid;
 
 	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
 	if (sensor_pad) {
@@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 			frame_skip = VFE_FRAME_DROP_VAL - 1;
 	}
 
+	rup_in_csid = vfe_upstream_csid_has_reg_update(line);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
@@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!rup_in_csid)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);

-- 
2.34.1


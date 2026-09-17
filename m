Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6EA3DF008
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636977; cv=none; b=F5nG0TbLrlE4lGBUOL3M9lmzd0MOI2vxXVjrp10gplMj+5IufTF4bNlj3n/4g6CnRSntekymYrzhLWdjbCsZGQpRtkfi1jPXsMR83/SmywjOwt8C6BdQkgZfCrpjZRfc+6G5v3tK1a5suZJCMlvC/+/2d093MFE32Q4zpFrQiWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636977; c=relaxed/simple;
	bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hfkHfl4tZNn9Dhc1luga5e/yU1lFtXAfydqzW23OjVpIEUdXx03ZSWtUVos+rAC9V8cwFXqWlv2qV4vNpNJm7mfXCM/16526jHCEh4f3jDxIiNW8x4gUvQOFbnJIPIs7LCpkS7rD3eLInweoxk6GVRJE4bVQMTI9IOLcUCi9iKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAiOK6J4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRPmWrth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAiOK6J4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRPmWrth"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9E9gv2361649
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52MPaQVsK93P9Ci+1dC4f+
	YeRomvaMYMgeuUx6T1Jww=; b=CAiOK6J45mFnFXDR1mHUZIMOiy1RS+Ctq9/FhE
	POOuwgbAbQdoT606283o58lpXYphEoG4WttkEOvn1DkFAp+IzNxxd3GT3AajAoCR
	SvfaAhCBl8XcWj0QwNWI/BsCB7M1Clij8ggvTW3e2lqONM8ZbQ0GGZYX+Jwlw58d
	/uSokX8WfsF5cbmXaEhWpW3JCNGF0guKUY36MNypGWflzwjx4PhnHK6IZuhsSuqT
	rn9uCYUZgZDMui+L9pQpJYgkOTBXdNCNen5LWwTZnyjAA8jzcFEYWUlXpmegKiT7
	XmvCdT2QasBkni6d7Z6mwinQzQ+9Rn1GL50XSqQqL4GB7PGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6g17q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:22:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1038081a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636975; x=1790241775; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=QRPmWrthFByPeSwveISNLFl4abYffpKiUVfQWQR869FL2vnS+ERXiKrHZVGKWPcO9W
         6d3506Ut1tXtSQHw5egXW+fJsHIlls/ju6Sp40h4lFVG0UjQGKH4Moydu/6SBtHLtPWi
         27HSyd9uq/IHCUSx4G5hr3+AA3jZR5ykawidroaiOo4VmJMIWsnAG4nvvdK1SEgdbZm3
         m68FaDRhQZ4xsAEnMxXPg3QUBWix32FElUjQL5t3j6VlAdR2a0qD8Lb7pRpqkRuEtJ8a
         NLnN7UCS0nNO9cxe3CNjuZusVJcdn9MdqOXSP4NpvhR/7Jq0WSpI0M0XpegN6Ta7ej6/
         HBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636975; x=1790241775;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=gtkBA8HV9NbMNKOXOnp+DBHGnVWtVfAH/x0Rz3M8X6tNxoDq4lHMobXgm+BCxdWnHo
         cj3L1bF9vAMl1kB5DJQBETrLSXUbwrRcisNmThMiLfcaxGvaa0jwgT7uwWUHAzN4V3Vh
         ik7JhJU+Ch7tUj+rXUHEQJ2AFKCidO+D0iOgJBXGBW/UN8r4nQsMoL7FmfbPpaCYiLYf
         HhcW/0F7tiSk14pB2F5hnS8/aYXxBobCo3yVmVV6uif521/kD/mtRBhisMTwneTtyRf6
         8WekLOM9KkU1IN5BOPY/kTbftfo9z1p2HXM0ze4z/l/XqlB1drMIelFOWngT0DJv4Sb0
         mYsQ==
X-Gm-Message-State: AFuF++ncjzNFTLuPfv3xKOPWz3x5lqiwyzu4DDIh32uu3Dt4gHhx0Rqy
	QP39uEjn9EckEn/NuEOyxXtfBYVk/OTgRC42S860LvCsPiP828IUqx92A+t/KxU+8Pz1h4Hryty
	3Gj1R68dloHmFxGiN/4G2BIj/wHS+bYUfXKcD0tLEincEpa6jCoxOyve6+i73QUt8JTYL
X-Gm-Gg: AYBFou1HIiOwSzQOLXh+444X1PmTTDhUNMtREk8eTaSSndImn370vT4KxyVnsjqfT8r
	HoT3mLs7YlZkDaRipoIzx9oXLseZ+1Jsi5xDnvbGE1oeIyAdVCatloxf2SS33G25w3DrSkIQRsu
	vqeq6wkEurbPMgmG5CkQbTZ2Ew6u4/FXx6+K8v9vFISMq7C1922Z027K9K6UhhWSsibbRy+tU38
	DDeXTfAW68YI80uYEkdrOHDJNh/UCclwJtDwPxhoCu2RjhB1awAr7oGRQG5BpmpGcdD52txOLkk
	J10N/rSFPi4pqANbt21fmAR0NaJMP/5yg2KbYOboRx2QzhgkTDu3ItcK6vlGPRDKdfLvozJYw5s
	8iVyFC0GD+QBaLJV3/WsC+7WNJbcMoJ+a+HeVCnbEqXfRnV4Uh5TRDxM=
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525341a91.20.1789636974918;
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525246a91.20.1789636974432;
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm15106437eec.27.2026.09.17.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 02:22:44 -0700
Subject: [PATCH] rpmsg: glink: Implement get_mtu callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rpmsg-glink-get-mtu-v1-1-edc9496d0da0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOxq2oC/yXMwQ5EMBCA4VeROZtEERteRRzQ2ZpFSadEIt5dr
 eN3+P8ThByTQBWd4Ghn4cUGqDiCfmitIWQdDGmSFkmpFLp1FoNmYjuiIY+z31B3LeVZUeos/0A
 oV0dfPv7XunktW/ej3j8ruK4bmsD68XcAAAA=
X-Change-ID: 20260911-rpmsg-glink-get-mtu-dbae4369d347
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, christopher.lew@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636973; l=2525;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
 b=X6rwYjbG9fkHKBgwAubKaK2Urs7cuItN31PRv8K3MpPy8RSEEnJVQ134FsMaAz+4F+Wcik9xc
 SsLQ9VA3ODuCCApsAldj3EggHWmJDhSS1Kv77Rh6kG2I8SJ/gPrdkmi
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-GUID: wymXTz2SImaD4a7ledSk3PdwypBtvVKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfXztew9wo0LH0v
 Nw7FuwCFIOECsxi+eweQ1g/r660pWJttvDQ7mSnJ6/LipSw2sGQpAC86op2X1yHhftL3x2gEpMR
 ZDA4FsOjIDYBQ6Cx4eSW9b5EftY5prb7FI03i8mFZLqJpJbyP6ldqUNYCBIg+GHv7XVkfvRl8ui
 evcB84uxk92pOQ/HhwB9Tl9wE6ELSuQyM5c6cHikXLcsqYLfoV2lwOAxA7seknWWW/rUJfTb7Nj
 ZTCKX1faUygGZX2Y2gCtKMIQxCYVVcN1LM9LGRC0t4gNZ8Su0ydDXcIn+TS259iQLg5l/Vxfifq
 iY68N0U7KUt4KY8yndkrcpexFPAQMOAn1veOrm36C6WRoigthFCwaAHiXAeixR3afCOHc0CjV+F
 fM9t7nowqINQ2/GjDwVwXmByYRUPHT0ZQL0LTsp9UzTT4BHUk3Z7IaTob4MUzgLZUjgTaXAfhS/
 v/MczIvKffQcjLSqF6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX+v8iUMooEXnJ
 M22eStgBmrYDwaxxSzU4S6VwbKREjxQEcdaSUabLodBUuqzdphqg34xohmnkl2XV4QjUVKFbxUk
 Tb/XYDeRfyaLcuRQW3DCdwQztvQOSl8=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabb16f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6_0z5GgOHooh7QBrRKcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wymXTz2SImaD4a7ledSk3PdwypBtvVKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170127

Without a .get_mtu() callback rpmsg_get_mtu() returns -ENOTSUPP, which
makes rpmsg_tty unusable over GLINK: every write fails and write_room()
reports zero. Implementing the callback is all that is needed to reach a
remote console exposed as an rpmsg tty channel.

GLINK has no protocol level MTU. __qcom_glink_send() splits a message
into GLINK_CMD_TX_DATA and GLINK_CMD_TX_DATA_CONT chunks that the remote
reassembles, so a single message is bounded neither by the FIFO size nor
by any fixed buffer. The only bound is the intent the remote allocates,
which is negotiated per message at runtime and is therefore not known
when .get_mtu() is called. Report INT_MAX, the largest value existing
callers can represent: rpmsg_tty narrows the ssize_t result to an int and
treats negative values as errors, so anything above INT_MAX would be
misread as a failure.

Assisted-by: Claude:claude-opus-5
Co-developed-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293b..ade9ca1cb9b9a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -6,6 +6,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -1605,6 +1606,11 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static ssize_t qcom_glink_get_mtu(struct rpmsg_endpoint *ept)
+{
+	return INT_MAX;
+}
+
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
@@ -1617,6 +1623,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.trysend = qcom_glink_trysend,
 	.trysendto = qcom_glink_trysendto,
 	.set_flow_control = qcom_glink_set_flow_control,
+	.get_mtu = qcom_glink_get_mtu,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-rpmsg-glink-get-mtu-dbae4369d347

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


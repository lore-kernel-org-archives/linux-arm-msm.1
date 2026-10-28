Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200890;
	b=yNx+caFYEBPtSANpu1NF8wqK9bExLglgJmQlKHYZ83iprncLUTsIBv7GbzUxeL652INC
	 +oxgmvwYeYdt3Qz3MfpP/SWbJxEIyHWkD2hnIXm9Vlrs5mjvs6OdzuXG09xCrP6Isnn5I
	 o1qqZabsix0quEF7m7HTEIJ/vYQSDYCNGeVsQmyPpdtq42QKhQmOLnXEEsNFV5hXLeUL8
	 /YOaYw6/RZQOT+YR6/XYfdAKNgNK/q0vN29c5pWVLN5v61xFLMVkRRxmNAXdjxx4Wmo26
	 YO0pwh2FSj9t5Zx2VWWOQJD719XlehYF6kF/LeW3Qw07rU9UsZnOSQb/uiSbOWBwRMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
	b=gKuYcr/owRXUrE1pAlA1aigVcBCp2GUd/DVc9XuvsOJwQLDe35h1so4usLtRsvcYc/lU
	 lGZ02Biw4qDkDSkC5CEjd5BBpVD10A9AJz+fL57fSv1l6iZlLaj0IzCP0Oe0FrFxTmQ+r
	 6mvx97HABGOexYtx0r/3DiQANUvGhsOZuT+DzVfGZIIjVld+ILZdg/KqTdJ5EduVZbZPq
	 ZyIfkj5/oD8YjH9H8TVkh7pow7GjHfeWfNFE8b457a0X6zZElrcWBNHXOBBQQuS59COk0
	 kFijvfIWDBSg+oRLJGZcrZUSuxOlZ31Iiq7L3pcsu5UcYztI3rkDgOLSuCXUrSQJQ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HuE/je94";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8060560A6F54
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8060560A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuE/je94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFBO4B2071528
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=; b=HuE/je94ZcOYhWRc
	ghkn/2Qmm/8QFtNHdl770cBwJlasdQH27/aw919vM/IrfvXWHt7bbiMi2Cr3l+5F
	nqOgms7g1wpfHGJJpNNehwH+csbph54uH8aEO4nG4Ej1t/lS/Dq3UTfKa7hSl10z
	dfiGUSHwtnfLw+yEC2QvGOnUTpbZjQVLO9dWD5gSSSvkRkCjabxm6E4lYSIHXpXL
	14O3ZcYxOhwPZjVXualqXskPA2FfcfY3EiDrQrpFaWWAu8+Sm2y8bqAr0oIvVdZV
	RnIpqY3U2lZv5EfW/caRhgX5l/Tflc+IfkdFhOpQ2dzD2c8X7U7FouPUMn9iqjUg
	wWtGbg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jvap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679b648598bso57496d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200888; x=1793805688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=hFHBlnJxLJuofQKH7JwhJyBJS2gbVj9sZ1PfWKb3brbJGdXSRopYMr/oPXpl1WeCNK
         XUYFMWaFwJH48dwzFV1CGxHKnIMJU9sy4bpmE4JZ45LQ7zNz0QEGBN/5QWAnTTBuwtxC
         VWkZ2BDPO8lYSm3MZCpaiWBQgxUvfJm4iuYqexpjH9Day7neqLCfj3VuP5EQ8XeuwTsP
         sBDIv6rRGpleWd122AB4DI5VC+FIrhYRV2LoebyAj9S/IUgG926pNipjD7ibHE40LGDy
         ctde3VHh0xEUFK/g6wYRq/NZW2nxVl4/5SQrsZxI4oaazZj/8miO1BLd9G0HUqWMta+f
         GUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200888; x=1793805688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=iXijmV6dRUf3JZptbWNOacV8P5mriFGwoDZffVG+0yjcNRvQmdLcALuXvqTOj9m0Lb
         nMhJgRxMKTK/Q0/VmUryiKWxq8JhtHQJ7U/eJTJF4EeExNRTTan2F8DIbFMGnr3DDRFq
         BiDD6sOqIT4SeeEY4eX4YWzVYkb/bJOhgw8t/eB5dP2VnNyzcL7KRny18eVE/Om5K218
         FcRfGZTQyzYHaQ8nJh9ctBoa61rMxab4ZwviOGjnb5pZKtQCmszsVX5EyYXpYg7re81K
         kJ3Btjq023NxaEf3+r4/OnS828RzqCAazvuHWbfsV+SeQ9OjVmc3bjI5TPfSxrfjNdIs
         cY8w==
X-Forwarded-Encrypted: i=1; AKwUvBy/4gRNfy9O6o3vT+Y22fDiLcP0Wt/pFQHrrP6ULsav3e7HQ6ItdyLGZddcH7wLTnKfRXz1y3o2jnqPdsgA@vger.kernel.org
X-Gm-Message-State: AFq9FYIadfLssB6n+kWp9CDt/fjoFeoe+0Y+vRgqhrcntLT4UgCwb2nw
	zE2H70OeoUR0DF0oIlG/YD2nZkS7FE2bgCDoyhqVsswnwaw/1JhzDUX2Qxla3X8+/06VAvIczf9
	W2FnXJK/E/W6+4NXeXYx/amXLzEb6RdIZ/wEnIF9uRM4HlZT3om8Iauwetb2uPORIc7VJ
X-Gm-Gg: AYBFou1O+L/iTtW+fv3MTFVIkCdX42scZBNIjIdU2Zt+HsHA8xYjC3FraOnsyVtVYvJ
	gNXyyIsMsRZF133ZfDuEd1M/wMlqnWhAcR1ofs8ID4mx0oFnapYjzPLRvM5UcrDK6DBDNlDN2Al
	rEJ8Qt3/TaChCH6tQahMOVtnNwmEtQPlU4WrUBYQqG2fR7gpcRqc1MJSS7IuRZvUK+QorsJ+R0I
	84Rd6C5Z++C53+cR5ETjEO8uLhGahfnzAKlwTjWRJzwlr+b5dB8JjJJqlxE5XrivzdXDXV0p2Ab
	BbZpzfyj2QRBQWP27CNOxm53f1gVZs7Yk/o/oNnf1uZr5YaqQSZ4OT/rX30wWEej17XsoxHHRV+
	AODyTFyphZ+9Ic9Rp5yS6YmCb0al07U/ks8zfFei9/uuuGQ9y81KlH7B7JVWJZpBXZEbLTQWRA3
	obcJFh3ZzPuKYJ9EYV5CYxHlbvKcpmZlMJMNqBOAjL4GjTzxXfqVliRynHGEZC
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623153d50.86.1793200887700;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623121d50.86.1793200887107;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:45 -0700
Subject: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyDNGRF6YlDyP
 2dq6iB1GusJqXYPHJ4LNq8kTJHSOYWsrAiiyrUdPKHGcpsklGVG5Xm1WkDpbjxlwRNoWv11/YN5
 swfNAfFIqOkcM/lvWyTk907wyPhjE34=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212f8 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: AzeKX-DPvCBcXo8fmCYyLBVBvNc0oXqr
X-Proofpoint-ORIG-GUID: AzeKX-DPvCBcXo8fmCYyLBVBvNc0oXqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/nzaMNBfKln3
 i7evyiBj+UOGmPwEv4tIayAUWIGUqT/pVANtpJPzCC1w26I/O6FBABXPBod69gmNa+nufM+vdqL
 16sc+rSGXbWk1Hi4j8XdJFUlNTZkl01JwmEOPSc6ExB4rV3EUCA86ByopyF5J0MOjLwb0EGKIXe
 EBqyA0Dp0jV7C8zpOi+7ZGHvaeFkOEDv0rFhOosFmxzUafGRIbc0QiiE0CFl/jAREQv9k3BD4zq
 SLjkuQ5hKmBH5/Mh/0Dllvt11b0yPE4G3UmT85DNljvwPV+i3fZYpBLI+IkjCaIXQonySMUG0n7
 dTzlY57YJckMXGi11q0hXdXnjbNXBhb1ApWurLWgYdjd0d4jHjhVNGqYXjf5PiEj9V0vWXxqcBK
 hgqG/ki8L1tkYxOjoDn0VmnfEoCytnmQ5vdot0eGg86pHIHjhFMkVS3vUPFDs1NGPTVkIO0rgMW
 eEaA4IekTItXQ0h/1rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 3d90d31201fa..ec56ba85a0fa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -64,6 +64,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6ff82dd2aeaf..df4b4cf30711 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5850,11 +5850,13 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1


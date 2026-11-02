Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616160;
	b=FAbfjlKVaqeMqByff9uWX28YTPsX+6NMZX7q8d0QKCalURsN5/Sv+tBoZsKPmHrak0g5
	 U8O2hXjo2wtbqFu0iAK0ZahiTeDehjuh5bF2iykf/wqUIgNm/H/32b+pQ8bo6ei06+pFW
	 cnsL255BfkmCF20lXQOq4B+ZCt3Y1CwTFiuCLVjyycqDYzD00O/8Qle0QZuJlfXvim41m
	 vHMP0jMvjeYmVg2aJaNRC63aWVdZ3OLkRmovwMyVbtnTai4//L9WTO4sBTacEDr9uYh+E
	 UU1chvP8DZl9KPC4bDib2a2UP6b3rWpsIswltwKw+E64klpS6jjuNVNsytaKA8FK/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
	b=XHd7Q/fa5k44UNcQtRuWrLL6K8eD6fcVq69v2CKa9+3EwUX3pLbhTDQ3QNfutMxL5ZZ0
	 kiC4L5OOaV21qJ2Uv+2oQsN9NEHU5uz3xpB5GaK/30ctCoaEma26LSsiHn95SZT56qvfC
	 C1uw+Bs8bpcjf7H7oRqMC5glwP8jF10FT70SJyzUFVaaSHKrL9Du6jyQCA0Yjn7P/Nwik
	 1ABFhX6s9F0B5z0zvUFXl3B2o28+ib2AP8QtmTtpLGVGramGItYzXPzU9pb2Khduma/DS
	 /Cv9GXVH452OU3DZSHpEmnGyu0l0KtZOcmlS/BbzoEMGdnpApGIxE5t8sG0qZz0PIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E+QysNm/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iffuzz+q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3B60A6F44
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF3B60A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+QysNm/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iffuzz+q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A56L260605
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=; b=E+QysNm/Qyt7uaHH
	EhBmFhYev/i6tr1AFSIF+c07VXDkYZZPeOY4XQf95VmfRnV7Xa5pUwFuEwCFe0ml
	fryMKyuHMliHXzKu7s/E8ibZ9eiWwCmJvDY64fy5tBqFzoqK4UL1LBHjcU6zl0nf
	d9nlGfmrVWtmrYQQuSbm9ziLKf+P6wS0rcZsEg4eZUZ2xFq1iz47Gc/O16leCeEx
	EwYjMUii3pg5Zgf9uSdOB1Y+QUJETc/TP+EIssk5R1kVuG1gMW/on5KS9PQzRz3a
	9yJG2QFFIdIgSBfHu54dPXMhN6Xjx3ONGR0Q0TaijU98M3ZLuivitiguPBjRBkgz
	JeCYAg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrc83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:38 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo5587029b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616158; x=1794220958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
        b=iffuzz+qKvNwLnJHX/rtR3mxejZi3zp/LoYbR0QjddKfxdIPeb8TTLEPcfb0tbfT1+
         kUVh7lpKBR2mGQHelGQXajv4QGHYC2natV3+sIj3aS2+0IYMR9X7zl/R/vLf3DU6dqsX
         Kcor7ppBWBY7xvodBHG8RPIjyJfgUsV8ldzmd/RajmleVjMVZFY+Cl2njUzDEveYNyaR
         FKOIyJFhAOKr8iAGI7PpNl20e81U6VYGk+iL7AMwN+lzdxh6c6goEPx9o9ZSsClT2N4S
         YwpiWQr+OoOw4Hf8xEEAyPLYNozRodLW49RVuj90sJia4molGmJjD3PJWVTDgsNenilR
         vyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616158; x=1794220958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
        b=St0k411mgyuODW9tSiwqe/Ti/n77CtOIAhGzXapMoTq/extv71hs7uHqMKSeE5YfDa
         3MbQY1CUXoTRz/svOKgonYCbWhUenX2dW6F9EPEQr42YiRtKJvcazSVF5xVAk/RDJxR+
         69DYIHDkezpS/POBKO2HEI+Lavu5/aEd/tdRmL9QiC7Jr/8fSuyejS/C5bzZNszPtHGP
         Lfk/uoUbAZGltSFpSB4UFfPIZ7J+nsZLh4VAy4z80f7fpjEfJiHdSg302o6xLHX/QSd+
         g90Io1uCEV6xAImh+XuQ5rs/loG8nwY8Q76L4cuB7kHb5hjg5tujQQqYoLf/Xrewk9YU
         GHAA==
X-Forwarded-Encrypted: i=1; AKwUvBwnv26ofy25awrRqWJQbppOrL6cAyhUTJKFY481+Ogoc3fGD5oA5hdEDHUvfMdZ7kYFxnWPqX+e361tENL8@vger.kernel.org
X-Gm-Message-State: AFq9FYLecPYHq27cFyd5pQtq9EpD8N3bidt6FJ5YyCH1GSTalMm5jy1k
	BVpytQy9knbiAkfTRLDX5JvvfDpFKlBO3dC6uYpOONDJk1yf6B1bhSx731u/RvdpXl3Pyd0gLKQ
	duKH0HcXZpZJPZDPH1Da47A5xKpBy0Xp/wBOXMptwX3qKEQdqmH2I0ufj0v0nfo1jPRE24gQliL
	vT4Mg=
X-Gm-Gg: AYBFou0jhwPBGXTCvjLbpvKxFQo4VZrHUwkGhsc3ITH8uJSP41HP/pq3JVU2O9rr5wD
	8+XJ1l31eztnCoojeYr4S6+hDqgDurkyloKsZyv/7w2dvBxKyOPX3vYHj76hRSAeNQRIwZH57xg
	cEiA8uupRuMEN5oFIr8/z9HnVcbMowzkazNuN49ww5Kv5Ah6n6wKMeMU5V1XZ4bgwDPv+kVTLG8
	DIpKVpC58G9QyuYjm17xy5f5u/VU0jePHWV16Axr88N8JhipCop1USHCURTyQkfP26v9fc13Rrl
	mt68mEmmuxX0gIv3dG9iXPqq9x5LneXPOfJXKreRwXEvRGvtI+MCNKU8TYiujmTH+CQfpg1fyd1
	3PYmVH+heIxLFSk0D267h/8OMnV7/ZjH3uRAjkJf57cQJVwkjqJh8FcmQs8m0drax3/+RTVYyMe
	mt1hFv2ii6i4SKQ1tYKrW6AdlgG12VU3yzrLlm2ypNRAKly1IKM9/rVoYuJvE=
X-Received: by 2002:a05:6808:1798:b0:4d6:9133:cfea with SMTP id 5614622812f47-563efc537e0mr6202236b6e.47.1793616157755;
        Mon, 02 Nov 2026 02:42:37 -0800 (PST)
X-Received: by 2002:a05:6808:1798:b0:4d6:9133:cfea with SMTP id 5614622812f47-563efc537e0mr6202217b6e.47.1793616157279;
        Mon, 02 Nov 2026 02:42:37 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:36 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:19 -0800
Subject: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for v2.4.0
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
Message-Id: <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8691e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WuBB3ILsY1tR9b9Bs04A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GF9IvnsJybyWbicxVETCSGvJMetqcl6T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX+Mz0JZ2Mpz0T
 X78EzyYb35F0vOTSiYvNz5lrkImMcgM6MCy/0SJJeMtWLMmcHH8cTEzU4wFW70LsqDz551LZJBT
 32xIgJPcoqJC4V5iBrryA9JwbYhdrqk=
X-Proofpoint-ORIG-GUID: GF9IvnsJybyWbicxVETCSGvJMetqcl6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/1ilXH12lOKe
 DFxt5UdrZHozUmJeLRR1cKsLIrWhtE77ovE8tGP3FDIjfN9xBml2VMGgk5bQWUWRN1n4FJW3r39
 g95WDsKwPHLMQh54Ywh03JmB1BVZ/C5yEuMiA4RL19U9nWur/EkHGmQXuNgXmpA+ENYgRlJDhCZ
 G/wiO0QPnQo7Op47gB3cvxNKBxhJFPD53H9SAqDOk25Qm1Y6KbxWIYiLJyEraYcKGhp5EQLHe20
 e1gbijMTlkZdCZ5W/Ev+0pZ+KBYu6TPAPoEDyiVPwjQjpNdYGaBm1V7GlVOQaLXLIaUFkbByXAC
 7V8/upc7eftChR6I/rguP8h1bi7bnepVH7pegRCJ5/ME2VGWso0WlxJ5zt+zyQqSQURUwTCTJ25
 KHoezrr1CIDUZBqfkWeV56iMptudt4nbj7N0fRmL4gr2779swNreB5RfH28XfZkXUe8fP5uVuZz
 40EHKKrEyWwIKoI41gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 2 files changed, 30 insertions(+), 8 deletions(-)

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

-- 
2.34.1


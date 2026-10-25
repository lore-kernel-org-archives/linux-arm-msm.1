Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898251;
	b=4d9HI40RdGLSUqEHKxux0lf6xi+ZIxMPpPkPCgYpyqrP5353pgNOssEYqxSczszT4XCi
	 OMZm6+6Iyq9xwKKA4VMcCNdF44WMET5M4m5VUsRDvbgWUqvz4/v0EsMt/lMNMJxsa6XJA
	 I0ZtJbX0cNDTvXEIaBN80UVyr8TeonjxNJ3T5d35zE7MBw0wUApvSb/K99dl1JYWRWRXS
	 QfiQ7p8dx1uZHuvOkaOHcFKdhxIFt7kWvlHME2qXkT7oq2JVGS5XMldeijYf6nzBKf6/3
	 thehP32f5HoOp2RxtCW/jfh+mRCQQuYJDMWzHyFGs4V1BI0yalpk7l1KLDspnbgIa/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
	b=PWqyT0wNrT7WqqSULgxLksAyBiVlFSd0j5uKg/rc/mG85I1XIlBpzObRlW9HCAl4Ctty
	 OPzCtb5AC6neO3aq5KB6r97TyEr0/M/eUbziLfhDlVMX17wEY3oRV1jR517WmdXi33Bvv
	 4WbGWaiAzE1dldv3ZBmmnVtb2Kc/9BTW5eh1lyQkALdO3x1D3J5zA7Ze1I6WGAc4rb7f3
	 /22bSxgc1aySZh50Nhn548IR6c0wjOIwDh1BCczvvkji/T9lUjdNQANEvFnmrx82k4sy+
	 Szxu2UO4kYbU1QmILJAWJPSiVxunW2PIV1D8XOn6bhgFH9wrRGYXtw4yEkuGkhofNqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0NxnS4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAbk7CE7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67EF60A2621
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67EF60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0NxnS4q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAbk7CE7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17HWM3097777
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=K0NxnS4qiKGsicvn
	gO/yo4GACPhn7eiaXAZFRGJ0TsREzYjJjpoG64CL1T0/LaoQBHoIzO5Obhxefqpw
	vmrdlnjPWNIp/QCGMnCzjGTZknvlKhVWo0mjVcoPG3BjpzOkAAMKTgz8woSsRUt8
	HnUwve/FbAPGpJCBm1n60mepHHZfrgSlUy76VUtVkvqKOo7wyTqGlmN5DHu3w809
	4pC6P10vaoqAl2SQ8eL+Hk996k1gMLJwbWu80m910H1JwaThoYbYseu6uD0T0eI9
	NjJ20kKpHoey+5dR1eioX6kaU5tmtcuuLpxE5lzeOffbLrYiJS8IOfrVRg17+9+k
	eIY6zw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1panst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so7350413eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898249; x=1793503049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=VAbk7CE7hC6xcskeyMypExVqeG9wCZpHHdtyT8b/+fwJW3xH4eyxkH/E+eoSiFAc0A
         iOwdx/Mj3tBxIxfFTo0NPE6iyrST37ClVhWXUgxqmJmbVNTJaYroj/7NppkVoTn8OqrV
         wPUHkLYXY/a1UEJPSO1fNvWAtUN2iLc20jQk8jkmeHr26cYIAph7/6rTKOwOPpGWx5rP
         kF4OR1UACmsAaqhzYKytWiharWW7uz7QaNc3TPXCiMuCy8OWs8iLkn31lOWGMSyTD+TJ
         ea0fdZw6Tp2S/g/oJDcGBPIV8jTAMI+Hq5tFDt5dYyxj5JTXhBSzjMBVv+LQ06MmUiCm
         nwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898249; x=1793503049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=ej1vSu2MbIDLEYSyBflvv4ecLJ+rqLsetq5UaONSARmByDqHk4dJL1CYZR9lpl8erb
         Q+7d9XY+xoAKZmZZ8SGyiaAXdEzgTnn5bVMAOlHt6Py2R9cuBCIaT28uKqYvsidnu5ry
         uZbUYG8Bfgs2s0FLdCa1edFHPYObk6BnvF5X771DW9Xj2X8ohFhx2Hd4SRRf+dwt1rUi
         +YeCx+rX4/34dfvWwSYCt9a6NwCFjJyxmEu5tcx5zwX7n4x9F71CTxa8IFTI26DPNfU+
         nsfq4EzW6OJn/Lnx5DCgoEj1Dg21LBajdhObaGeTpyxAA054LwbvgUGVdd5Xz/Sr1go7
         ectQ==
X-Forwarded-Encrypted: i=1; AKwUvByujaLIWjVqNgBJcwdz0BZaJhw7Pm/6GDdB+yhhfVIH34/yiYl7LNL/gDCdWQYTY3YfJPUtqr8NqnHmo4ij@vger.kernel.org
X-Gm-Message-State: AFq9FYJA9VkMRO5lm/T2xE9H4S6g/6Ed+y/6qTl+mnKqXlFc77LhBNur
	U3Od73qUZsAIndxqOiKE6RQE+EHy7jeKjcs5I6wB9Xaw/WB9PEZw8p/WEbwTgTR5p4O9JLmogAC
	znagBnNc82s4LhvYCPNciQSgi6Ey0IIDZYXfw3uS5rt1E2gxUSLAT5k2VE9V84p9urwWO
X-Gm-Gg: AYBFou15ZOn8Ke0WGW7g/HGAEB8MSgqVJU/oPEO4PdroAQb0B5j6LwK2c2qLheuqAfg
	yEU6P55fvww8a6iZf7JSVTvsLSK8Xdm8RvEg23nCC6a10okzpU+nC+L7BO+A3Z0ci/5Tg8hBi8m
	e37nwM0rwkbVjSuDXX7bc/xCFp1qNecCDQppKL7mD8fY8Bmwqktf0W+V6dV7/j1qiag+7FLt0PM
	uDGBKF3759vCT2ZZiI4Z6MP7ML+o8RwBrdx8oJCDKD1KOcDnkKObWiqzWUsDUsh/yli2QvfdhXt
	cJnIeYruWhpV/ChIw22G/ci210BOyBmisArlwSKGm/CtqA11lYxqkOKHcj3tPM/XH83Y/o4IHBd
	Jkws4rgJvTLODgQqXY9XyWzLeBt+IVOzHePs3SNtm6EZc3YstP//zzAFIfGoqytoZrIePhgW5X7
	I6MFBPVNHYkg==
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2491799eec.11.1792898248560;
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2491774eec.11.1792898247987;
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:22 -0700
Subject: [PATCH v22 03/14] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261024-kaanapali-camss-v22-3-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX0XMD28kH4n3N
 IjxrmSRJ/GG7rMbEXBdlWA64JXUVKDxVpCLDMu3vlwnN3aRp9b/gA3Jd5XnZQbKLjEFTuGWDI0R
 XSflTxOxgXZuTHUk7Kn6Xt9wxz3VOyA=
X-Proofpoint-GUID: _3NuTo29I-pT7IrdoiWFT6RHPEe1fuKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX8wsVTFzzfDDO
 PRPutxMdzixxGan3IDu9BrC6I/DuaPYR7m/bHxRXZtqY87QwJtynL/ngKoe6BF4XTBMGr9mKNlE
 +ddX/t6B56IbJTWR2dQFjWl4cgzGl3IOaIWg/RPwM9q63E0lHUHS+uCuuoX/rhhzXvWz6Be/NN3
 U8rFrYetz9+e5+nf0kNJJg2EDMTCJIp3TUzDLKuM8BCBCbRfsNV4jGRRqIsKqXgYotBZPgShUit
 cCwgLBagTYuXjMG+2sLukgAJE0JtrsN3Hb2zS5FPwpsmuRvr0uT+/1OoIxwKWjizYkcJnhYSzBz
 R8SVhtI0MybRG3yCA9mNvk2hItaBg9k96IPgLwE15EHrWx+tRqFRro+1lc6Q6v+NtSANuH6Wi7F
 F2gBfFGT13VqyYYQtQa0BhIgNYRBmz52SAjeUPc2uAVqaUFH6yJ5vv4C2JrFvkf7tclRdKVQ/Bb
 olRRJJtK8s0IXkncOpA==
X-Proofpoint-ORIG-GUID: _3NuTo29I-pT7IrdoiWFT6RHPEe1fuKy
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add74c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14483A6EEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695518; cv=none; b=BpRD7RcTq9BCoqRlengPp19W56Yesnmsh831eihqi5uvEdxOTX9C+NcqDSgXa1b+lFtHBJrRyFzc3qEYWwcd9r1MyLmcEBWpZsurMfEpRFvb1VQJ2jYnVL0h2uqQSs+4dex3cpgmo1weEKZsFmeIHhLP2SjJ74UZApgYOV09ow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695518; c=relaxed/simple;
	bh=I6HvCF3WTYJWcHqX3lAFcpsoSXIqQo1U4Jx/VXr/QWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+ZsestAW1a28+YeUV1i7CZyUrM97bfZP1zZJfdb7R0gBfc3iiBD7xHqMa3CMnK0CypQg7nRhyStw/A0614khOMcnc/UecHpXn+/fV7zA06XF2YnDq9yeYxgftdazHLXBADJWbCA/yyAso8QJpylo22q3tvLZTdxzEUYCESiYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLkdHpne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8ffoYv8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLkdHpne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8ffoYv8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG44T1544266
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XpBYScMFukX
	OqBLbka4EhzpRXyG392JegIU0l2YrNjU=; b=NLkdHpneVkacD1+1a3nvwMCiS5V
	uZwBD2HGytDoarzQat5C44v+eNaCO9JtdbNjjtJYjaKWcxpbacWVD9n9X2F0fBxe
	eeOyPFBcPLNYoOGhMlssDDsrPrOE6GLTwJUzIg1IVV784FX2mXTqoadLT0FCMgng
	yJtixPx5o+kd/wiOhQvHMh7ZvnH50WJjKiEgTQrqDBGvLUeD4gvfFT5odZa08bVm
	4NfBPPNoBpGr5bGXjOsxzWmzOqXhRE0YmmrSgVmXtu9HFSG+2oWmYIAJDTvpJybv
	Ij00R2BqQ5n+/+uSuY4pVIYTM66CScQOl4GtRT7cdvWaDocRKCd+ElqS+IA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjtttf8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:38:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so302317a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695512; x=1790300312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpBYScMFukXOqBLbka4EhzpRXyG392JegIU0l2YrNjU=;
        b=Z8ffoYv8MoGU/2cFyUM7iP6pGw75FUha3221HeVynbNCV7Yi2v8OmLHXJIyKD7lOZn
         RUyWZc83G5GC76zxzkIIdnq5Su0kHvt2An/8J3VZYxmOoK0RoKTbid/t/mnF03/MXHvx
         aucY2lZK3T645Y/2bQ77HBhruKPCET24VGPoJCJebiSIv8IBiWHBSJe4h7eerksEK9h7
         dJKQcX4/nOcWzhOEN6OLhQYyQbEkcS2PYAsxdUlvq7ojDN9+U0ei45y4JfL+Tr1O4tAi
         5CKDlfIgPZzDG0Li1+tfOCNQWQL66DJ6AgvD2QfV2rqL3CBv5quATtcJmAxlyo1pqMrs
         1xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695512; x=1790300312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpBYScMFukXOqBLbka4EhzpRXyG392JegIU0l2YrNjU=;
        b=H5Mhmf167YfrqN+WB/6efMxD3oc+3BGuiWYeiYcIwOKnLjd9BSWxyqsxjhVqfcmUnK
         wpCZr75mJGoA/f5iLGsEULNZT10LKqu7YWuVVeChTxlH1PuE1EL3sI3U/evwHwgSXqxu
         kQ8WuZWFuD5r+bJbKtjkO6jGel13Hpp3l8EXQcdGfv8K+jgZ905dkLrEhiryYzYP9cHH
         vqWd0SAl/vtxT8A4i6LrHhEL4DTS6IVE0nIBMsVQiVzIafjjmCvmwbga4dP+pMjoC+ua
         THum6Iv0QICA7lTIQZDefpLyCzii9S3LcVXtdOxlBK6tsPKPfGRx7IDxf7FUSOXGREhR
         a4cg==
X-Forwarded-Encrypted: i=1; AKwUvBzh0tBXvlhkTOl518vjxh2Iwa/3Wn32eSLEnPWd8nEbgbP9a/Ecrrch9JreOXmQiZkE9vOi/VIKM7SKY3y+@vger.kernel.org
X-Gm-Message-State: AFuF++kILbM7YrD6lNcBvQU+RpN0UgcbomuPz7XOW2nKSqEvhTHgGBHq
	fLkFAMU8/P1F9jDkWwPqqt8agz4hQ+paImA62TdGMLQYA/xCbSWDBjCn5Ddl998BXP1qTL/o0F1
	D2aQU2olGRP46xa+z7rljQyzRnsgbpBeD/OMrQCzrz2FFeqI43eOfya/sCF6/7k+Qrf/V
X-Gm-Gg: AYBFou24iWHPKVI+E4MMZWFRh4f7BhEe9hopaczfbGSv1mownvXdVA+ya6ZY1SDZ8yS
	gZrgIlJOAjwMeXEEo5ZX0RBWcSXZRFjiZ/ikG6Je9TG2YuRmawjBs4AYV2xUVxkq2EoJbg2hUrv
	468MNu8Yvr+MiHPWEU1AwKffYBczHQuDA7u8CWKBdrWk/DWzDWieon11yGKlBgS6p+2O1CcZLZQ
	qbdkdgecmQ4exGodyYDW6VfBgJv++xJ6yVHl3xLVpWTmBivcsl1aVdo1beQcvYNdkPrLPHgTLBw
	PFwum+OuNr30y1YJ4FLdKeUF/9ju/sdQxaIzP85/W7tNg8DFk5x0roDB305jIunmJOR7xJCNZTK
	Zhhk4quFRFCh9v9WaBlHdVjhSH0DrOcoA3TmqLLxCs57FPznGLqoMBMbAfI3M
X-Received: by 2002:a17:90b:3607:b0:39e:370e:2f48 with SMTP id 98e67ed59e1d1-39e370e2fd4mr5315490a91.4.1789695511520;
        Thu, 17 Sep 2026 18:38:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3607:b0:39e:370e:2f48 with SMTP id 98e67ed59e1d1-39e370e2fd4mr5315466a91.4.1789695510978;
        Thu, 17 Sep 2026 18:38:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Fri, 18 Sep 2026 09:37:40 +0800
Message-ID: <20260918013740.1355096-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX29TgD24n8sjJ
 7AlVaSBZ0OYi94jGx7xGxEnkblPvmqw61sbco9uhbEwRU5q3bXT4c0zhbCeIf4CCqZROy0gqjhh
 DE+mMnRbOwevtO0mF93lwmGm7wLUC9To51mNxnOH6PfPqn8br2eQftDmsH9YaRVgHz1DfBT01GI
 5de/EA1ewSprWpg9utPAKG+r+fWjkSger4CvV87LH/Va+O0FvxXw0DUJbF/bj7S/N8lbsRX7d5i
 /2ORPDgRVDyZespSAKnczreH9EJUFgCN94mM5/gPGgwgFp8Z4vMXAMM73W8/1e/V+FwqjMPGMfI
 9emMtDSeiXV7/bF4jhK3XTUin/KNXP8s72yKpMcYDc+ObVWucLSgBNBa6hEwrtX77KN9f3dDukF
 5A1V8jl5C8ac3x9WB/fd4ueNYXRd5CB7BCkOrMXq1H5vxC/Xrv1ywaQlZrOc6m2X8Y/Qtj9+G3k
 nY58NhGB43Qf8LHuOlQ==
X-Proofpoint-ORIG-GUID: qBlTNhc0GALpolPC2KA8T-2uKjQk7G7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX+3xZP4S7oW1z
 0vh94sXgeWPHQ2MduDmlgXGq4+dnN6OhalFk1LV2OgKvt7l/5W6BXFT/IQgsRrM2N1T+ZC9MFIb
 rja4xWQMmZGw5B5V5l6TKuHLgPncC80=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac9618 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: qBlTNhc0GALpolPC2KA8T-2uKjQk7G7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..802987da3cfd 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,30 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +390,20 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -377,6 +415,30 @@ rtc@32 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0


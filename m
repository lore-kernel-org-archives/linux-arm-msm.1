Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239415;
	b=0k7W5UWNde8zdE1g3t0gGcvi1SbIqbPz0XG5O1g3/wI0bvAzFNXYwPixPQf36l1qxTl2
	 7JtjShIGPX50cfE4/X4FM/9AScD4N73kgse1STEuIgUY6rXXC89kVJ2E0WJfQNL6qB9Eq
	 xMNGQogkfdylTKihG+xq2yubjLAOgG4XNUHxckKdStuVndZS4sDyS4mt7IE6FKkoDR5mE
	 9AfCb47USWdH4FX97sYjCbpxux/oWXK45RZCsseptAu9olPSY/SyrlqVywZ8EHdBMhX4s
	 EUBxfU0zp3gWLla8g3gw13giKpqLBvvQLPEQdMqF1S0lfJCac1xxgcT9ZPGCIyk1Mig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
	b=bgZeOk8ttdkrgIoRxhti9iAT1EwYW72/lYz9WRLzUA3I5W7+UbT/n3wVm//RwKYgOXz5
	 dxa+6vMDMkXgkmCv3h04w8EVP4jZLwiVKrfihXCb6CKBQWhXh1rVni+S9XOPhjXPqEqR5
	 hrYgkugrAKFmyp36mgpoZjQVfzr+94ki0nUtfl/AogJOrrAh/5SVwKZBbueOQHlTRf5q3
	 gIICDLpMYOtNYIcFf554w4qPWlHXXLoO6Mjwde4gZEpKuWUFCoe5PRidX9xBMmG1pTj5w
	 dTqAJ6qY7n2DYeM8RhxB7/SYzadrRvjpom3R8kvDxIeYtccqa0BYnMxGOzhmUwIvdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C7606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiBHYSRA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9RzUS7x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFMiA3589048
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4jQWTo3nRKkcSlk9T3WMIv
	pYTuhafOQ8QTSmy5ZtKmU=; b=fiBHYSRAUqHqzge0errBxZkH5J2FZRwrZA+kXZ
	7MEWH+uaprKtNat2yFPqQbZ7RmSkP8xQNE8jL2lMfpLZDBhP00ROyrYJzgr1ZkWs
	u2+LUzpPE3f/podj8GDwC/ax7enK0IjpstR7CmsGpN1Q6eQVTwH0cLsqF4z1LJ3B
	hPd7nWDBb0tqsIbxY6QJfaLeCtKKhGOyzFr2Gp4tuTVj+/9VLhYNMLnbwecDALzB
	+ovdGi1PMYEI5fM/7HhicYfbpz9BGTTGjj/AWwHDODFe96k7236CU4U4t9/Pjuv1
	tb1Wk8LFsfKKLYNHbKxXSN2aqu+Y24goq20vKSAHM9SHu2cA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8vfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:50:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so704591c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239413; x=1794844213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=L9RzUS7xHbdCYbVoBZY2OFsix/5+z6CXimKIQjms88jA5VaSPACVRC34nK/b38X5v/
         VBAzMV3TvHDs98ISzchd4MkabjoHbfOgMQKo74mWQwlBsZnwST/MnqIW2bwCBSI8vOKm
         PCZhoJEJukZzWuTSrRlF/vghz1TgjOZl01ogQ2uTqqXokJzEOTZg6xxEAMAsfhEWc+C6
         lF6mq39EFdgqTMJoPnHC16wuLU8UauBstKj8NlRytKmkZcKW0btYRAkBzHwz4X6PenYC
         vDxWd7x5ZGNrWBViEg8kIOBYohPJgZxMqszQQEkNFlQe3PPZ62RH85FlivArHfxY59rB
         jT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239413; x=1794844213;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4jQWTo3nRKkcSlk9T3WMIvpYTuhafOQ8QTSmy5ZtKmU=;
        b=yOgq39oV+2v2vy4qxeLPAzyZx6s3iY7V8qkWFy1pQFG9/Ac/O27zQ2zycs4nwdXQc0
         l6NYcypUx2AkaLXICQLfGib1oM69xYOnGzmG8skncLGsYOPYUP8K5Jfi4mddMZMogscu
         q7hw9T+n4obgYcEQ32+11vOmPZle96l8e+LtUiXJh2SvcVPphgj6NWy8Damg2poFA68y
         o53PJAChRelFdJBSBTqEv6m1Zkiv3bJ3bRdHXIiB2b0lkHc/oe+WR6WVLwyU+U/5bSI/
         BrTzcHC8bamOGp6frdAh/JiZOyNq7MDoc9IKP5ATJNNsIu8PxSV1Cujyd1WhSYlYDzul
         ApDw==
X-Gm-Message-State: APuU4Z9rBblXG8Z5sknXFep1l726J+K1vCTLrBJZYP1WaLjiPfe4VaU1
	VLa1qSihO+ESUhgth2w4dEAqCRRarJWhiZUwn+YnQRzKf+bUWfXes8zcKWz6zY3BgNxfimdOv/q
	iqborXXrFu7GDDaVu6sn8dY9oQbzILttHMQHWUCEmHQMYANuvNTvAThlAd8nGbx7rgeaC
X-Gm-Gg: AYBFou0j42V0yUpUiEfsyBgso/tnn2zGJ5AU9BhuFwkUok2TUNcnqxTtanUyBxzet3X
	YyPfaSfmoAOfVtjCcsVLBoykgveDEAa0/gb98aPZrwkHyH6XqKYJrpL/XkoyX/KE6LoKD1CYjW4
	OPgIdnljicJzB0T0Vwujg+9vRPWXXhno6MUn3ie2Qr8LRXq354ExvVqJRH7sUo/dcRPM9aUikyU
	vJCkk7zLEOlf+WOkgO0InlILjf9HpHj8TuK3TNnzEleaKIrvsshCsvKUk104IFQw79Lr59gkKe+
	zadETZaeqzGXGJ/9z+ETeY5IIWsg4Nd7yAs47WZJ4VnNwFeFIA8BayVI8Rf+9ejfRRdJZl7Y9z7
	MoHEh99u1NN2QwXFbKuhd8M1y8tkH9ka5RrIXiyXRBICm0B8kNxORXEuqWaJ59/J8cuR0jgNgSK
	w=
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515739c88.0.1794239412902;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6515697c88.0.1794239412259;
        Mon, 09 Nov 2026 07:50:12 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm17671616c88.10.2026.11.09.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:50:11 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 21:20:00 +0530
Subject: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
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
Message-Id: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKfr8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzEjNJE3ZQC3ZQ0I1MTQwtjc0MjcyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQD8k6LhbAAAAA==
X-Change-ID: 20261104-mahua-dp-df2541837127
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794239408; l=1452;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6wTZWwjBv+FV3Yma8YzEqzHEMN6HBhvGW1YgkJm2hn8=;
 b=MDINQfvs9RKhx6vTAoAB2HsxZpqwNiEwO0IZFbr428ixPLDDQ0NgDBhL/+cv/jbHj0wSBSSpw
 qmU1PJSH0y7D1LExap/2BrYyqAIJKr2EYiGEiZwvE/QY/fU0tfKeoab
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: wLHSelKCVd3A1stp9GQ0JYeyW0Ju_Qx1
X-Proofpoint-ORIG-GUID: wLHSelKCVd3A1stp9GQ0JYeyW0Ju_Qx1
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1ebb5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLMusFW7oPKACw3lbBYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX+dzGCN68qHnV
 HCBcLjx14NftiooZrhUL650plnuHVwRix2Hb0fZCwjCZjiSn07sX20OIw5xd6Yp4sFftCqHia9T
 zPb/kkO8ap4TBcYo8FURnGtgg2TrYnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX26RJiWqAPGwU
 kfRSDt12VPifSiGe5vz+ToPPaupRvrdQkJV4+f6IvGy0291opabpQbW2GjN+dWB6B3O82Ns60Qo
 Y0Vo4RqXXVx3OWF5aWFtvEaFDKa7JB3RP0mRLZMgmXIq6mf3O8VA1knGdXMd8fTP5D7IIPc9Kf/
 R1JKD8UntojzngTkmklpmH9quP18Jv1zkfFJHmqmU+g4B9VWppt5X9p1kvgfu8bpBFOveSdNP6Y
 0+QHWKHV5GTx1X3zhc1bTkvXRgBPDSKj4pGVu6mODJgF57fvWnNmG+PwDWzYRMgh0UgpxwLed1c
 lJHUvyjgByLoSiy+wxRaLLrhjx5FZJ6CDOiAyGsTCiPv/xu1UsYb2kKT145oFzdP8G2/OhbgUWt
 /DF2/gzWQh47c3HSQ9IIdedRkQIS/VN7QfUhZZR4SO6sJzpEd9qCUeoJ0Wqw3VuRlJdMfcpcDgd
 eNO8HbSVqeTL3iGB+eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090063

Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
Enable the two DisplayPort controllers associated with the
Type-C ports and define the supported link frequencies for
their outputs.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
This patch enables the DisplayPort support in Mahua CRD.

Functional operation depends on following PHY PLL series:
https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..2605c0e70c88 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,22 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-mahua-dp-df2541837127

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


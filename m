Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273646A614
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649090; cv=none; b=l06B9f2UxLwBuwqwv98rfxKYMGEiWP8q2fKC/Jlt9vDPg0KS424cSkuA6/1ydrNJU8W6R4HIiTEXe08Lhm6hiYqKIhVKhi1u7IbPG4+dasCplge1h3uThOiMFak3XTYRIh9PCLQjY990fWd+MTR/FyNFQ7gxrbhE0drrrF3Ymyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649090; c=relaxed/simple;
	bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5dxYO85g+gfMOMznhUr70Sr/5I+zPYWpv/V80MlVL9OQ6aB5FFv5driw4JR01eFVn8GK5uCs87XX0UpxkX1q77V3IKJ3qoy7IkPrJ3fVJfWPeYkClbX7QjqTCMn4dYwgGeI6oPIoXK5Kgs2vaPgYZXBRQgNSLKL6oCN/8nhuCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBMT5xrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkEfVKDO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBMT5xrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkEfVKDO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwS01912524
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=; b=IBMT5xrFovw8HiDL
	2+B2VhyqEqa92pMx/2CIqXkcEbM98yfZu/kHomQbEabu1fDN09e/6KLKZ4mClFPK
	5PuvNBz8VkqDuMZEMaJXE8slzVJNELUalMiQC1H7hovdETIcwU7L9z/XGPKoh8v5
	xtcULSZ+V4ZuzDw1cG4N2SKxrvsOkCwrXkOIpXXaZfq7TI+A74WywUFkkS229D9Q
	rZ3zB+m2mfS8L0iZ5TVmEiLRKWfbSLw0c84epiP69SItNnbyFpgWUJlJgn5sMVis
	TKFkNT0YPgPVN4sM63WwNvGZNFefp89HojkjpzUXZXQprS0NJXqj7RTBrr49U5Jg
	6/NGUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duk90w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so201887291cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649087; x=1785253887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=kkEfVKDOn94PbLtoTjRMw7R5mLx6DryTtGxob9h/LP/GwbjxrgvNj9+fOV82Dnis3I
         bxA2t5cuvcWyu6YCgWRnm+FjA2JcKzl662F3OTrK9BGLJzHBL9ZBh9PX8JFs0tTyKXO2
         DYHUg+0zj5Dr4WSPWD2wSkxymmuxnvO0pSzx6vnEKR+lVOzmwlDkRynLgguGj2VQDBr5
         5Epv3WlvtsAQidCDyRDaqWs5tzVeaS0kYveyNMGJsupB1NF3jdPHXHyQecY3K9oPg1sX
         VljGTpAFVxPdFdQCekmS3pXMWwVL9KL8UpHiQ8eyE1/f2X5FghqCAP5SFfe3fXzMmAUf
         I0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649087; x=1785253887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=YBpUGxHkn5ZOBRzQBEHW9RApHM46pOn0fXMn5/t4YffVwOA19hboAAx5wMMf/95Ns7
         fB3QTt0AG6JH6tCCu9Y5PaWlqU03FSecbLfuW/toYuVC9G0LiR/QMg5RFMQCF1hyKaMk
         dLLcPIO7IhcUHcIY5qJz8crkYX1E2QOnxwt8XC/dR9+DGvS+o/yeas4Gkqu4QH1jloGH
         IvDerbPd8q0iYh5ePquBXe2c8VWgfYs9ArXvBkgLlDijnu64wzpYE2gEJa1m0d7BuB73
         maMqu0BzXb9uN2feFiblUwFAfYaZdhCj+wO0bAWwprAFQvTtlPjhdBgHx6NXUMEUC7u3
         5/XA==
X-Gm-Message-State: AOJu0YzFIDIHSH6fKDvtNN56tv8OkrbQF8EK9M+9WxXeqicH4hPGjrqf
	MVemoFt38IFwJ/r+njybXhEK2tgKfcVVhY++3Z6HkRHt6/j8k/6Hmc+o/6000zJxgSxL2NsvSsl
	mhJmvf1n+EIKGUQCTMhvQq5Rj+UadZbmK/3KKAt2JLq+cMTX4DS6qAi2U98N3ZhnjYOzL/wlj6i
	6P
X-Gm-Gg: AfdE7clHBdFu3JLEM1F5iklMcJ5WvRHZYNEuUVyKqNXZaTpnoChn8whzM9Ilexh0U9S
	Qlq3PU7cbV9/TeHKCLosjIz5Xv7k12t/AyQmI3k2hU3pWdGOTYdLXoIoTElxKuQVqqzRALXEp7D
	Jl4CbuJZ8vO+y2ovkfTx7+nrFIfdUOUAmIgJxN5Q7ViBnM2OEImHa97gtr0+2kQCphZEpwew4y/
	a4BCCiGFWmmN732lhxVzlwMpGn0uTYZ0yGgIpHRCx1CfN05UIyDr96I/uWfehlECpFIZXqklDb1
	XfBxiG3TcsI+oNmwOsfkFnK8qY4JfGCK593K6i0CI7Xr/TF7Zumdjcbz4auM08sZQJ4K8Ha/nNo
	WKlhzb/1IeWe+SvCcev9m/9yC
X-Received: by 2002:a05:622a:5790:b0:517:642c:8196 with SMTP id d75a77b69052e-5213bb2120bmr200368741cf.12.1784649086512;
        Tue, 21 Jul 2026 08:51:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5790:b0:517:642c:8196 with SMTP id d75a77b69052e-5213bb2120bmr200367401cf.12.1784649084840;
        Tue, 21 Jul 2026 08:51:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:04 +0200
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-2-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5V0eziYT4zo/CUhz2UU7ppCwYhnnQOzsoXjH
 Ou+szTLBfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VdAAKCRDBN2bmhouD
 17gjD/4p1+5bagH4z2jSkAyNbR7wiDtlhMelDsopTJ22sROiMtRbwpMVEq0r/zwDDz1QmOIa/v7
 PKl5H9xZIlURhUlj5/jV34aBB6IfBc8INYbeTAUVb8MKST7EA4gJbhxMdklSTptI5KMZuIfGrSP
 zHVoeZYQ5nJ3ykuxgIczVzRSZo1z9XHKKH7UohxMT7p0hssVIzGWrg7doiJS78q83PLLUXxjtJ4
 GLOCS0fRTFUkpz3Yqlzgc3i47mZs48PIU7txKy2pVxIeIpHEa/DGy2BRV0feHali2dYHhwO45GC
 TGxvdSxX55Pnwo8v1mdd23FW5X5FH1PNS56uTDx5L6VZ3KDeVAlf+Qne3yC5ITjmN+rgUMXt0CX
 GjEAXDQ5u7ilVWsLweGjqEPPwLKdAiM6qLqT/Hr69nKiU6MuqInIoqUundXo5CFmH8wD2EuCNCH
 pOo2ANkYgEFNWOFY++TBIlnEjdxrVExDpAnpx7h6J7PsX+/olZyK628U3KSFeCAuTn3NBMt9zCT
 DRVFPXrblVggyi0cf5ZrT2tFOU/2b7HUQMYpX0oYyMCImC96d8JGuoJcg6pRZMYUHHsyhfj/5b6
 CW+8ZDBTjy75RmVj7qVRqT2cRnugyqMp6dDTE2YqtYEukXwCoSZEvmE7RVZGPrXjZcVd9nvJ8N3
 IB4D1D4cbaD4H/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: UAmlf3BabOEf8VjRY4auHXFKTc_vfUgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfXzClF+kbpmk/Z
 anwPCauPDY/r5+DUZtHzzbpsIa21QOv6mVtuw28UxrroH4gxL//9xCCWV5XGXYk//NdMgQ8Uqpc
 pXUJKITTr+xBeOv0Rucbga6CaP0zYXR2QsbfpnD2r/etm2ukouOOTtP+Z/z5O9/ncIDPNl49Axl
 G67n/BEMfF9g8Ixuon+ShcP6U0PaN4gej1VXLUhEu6603GgH2iJuAqS/e7HwoZF/sYkBqURm95A
 womYyNYYO2v57y1IwY0GrQy3CcktTIupCXuIdZMRcSb9Z3TZrNi2NDPpYpUKfrczio9L2M3nyrt
 2XE7uOoOJfAPM2agKFpItgNoM1Ewls2QRYOHhJZCq1yFKvQG0DB8C/vyEWxx7C/56qWnbwMVPXd
 xF4pTyMzEiOE8ZSK1IBjmqSoAg1beGL7UVflDKwYXYZ4CQz8McojqV8uo7yPiQkj7gFjpnci4PF
 mm+sT1mEkv+h2J9uSnw==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f957f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UAmlf3BabOEf8VjRY4auHXFKTc_vfUgM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX6yaV9lzWnMEe
 XfFMEy+Ky+Ya7kNPPYcSDr+s7Lh7faXOZ5zVX8NXzB3AIbEcBMDqxiyc/cGVnre5WM+57Hm8Ax8
 0pgBlrFlSzUBYa/qUGGrjN9wqGJCQZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210168

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx, qcom,rpm-xxx and qcom,scm-xxx for SoC with code
   names (like qcom,rpm-shikra)
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..0e921633dca5 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,19 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +62,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0


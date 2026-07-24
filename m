Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196B372EDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881446; cv=none; b=sb8n9kH1hfnvrxTLi1YLxCVFajWYXzD4xSawZJVhvWIFsD1C1kxvX2TZGj/jl8kbU9OvID6UxVcI79X3ii1IdOQfJbKzN70k3XdSdP8/pNQEbOHQjaTrXZSNY3UNzCdGI0ucG2JbViYIrv7apE3K0iml5RXXXvkUj76rrVgBSl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881446; c=relaxed/simple;
	bh=FnSf+1AIMzCm3fF2dSRYZoOrK43VW5g2r7vW96mvb8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IiowkeCF3W4oPkhNz9G9FnlHvYqHZ3qvxpUyDmSOeZh6kzrJzRfjrOAr0ZaomghyuSsT0CAoHUVAFLo3/0moSdf4JxeVL97hDqFWmzIdK/Dv6H1txRay65+aAmxeZTpBqedn8RKx8+714mmpw4V68hfGdc32JWpP3+BQHwpw+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAJVsoIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNaviDvw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAJVsoIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNaviDvw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLFx2276405
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FKh+YMwYF3Q4fffnBXrAZ1
	RNi5ZIHVi9Y/FsJfAH4gM=; b=KAJVsoIuuyFBC284Pl/oCpCKqC99+Eg82jYrUd
	DS9FGJZcxdFwSPhYKUXab8odDRy34yPQIH5AmtNYHTyLxiA13PR+iLUBG4y69zmS
	ZarwmieRYRe5oqVS1IG6zHgYW5FvEFnTeQQsTqzxEh83Yw0Vl8GP50NDEkc7SxNL
	2pvRtDlaB6vEnLWBFg0A1Rrvj15Tgg85WmQDbd0Jp+lzg4t/m23PxiKhBtPSqLRR
	7wP7dJ8CIp1jrjS2vx0+wnR9nlR5PW4qks1eouBKjM1lN4rBIEij01/0Uj3/jaGA
	PxID4ta+7xSnN7RHZPPsqQXhu1Nrc6ol6VxHNSYCd/WuK1HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0atne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:24:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso2127121cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881443; x=1785486243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FKh+YMwYF3Q4fffnBXrAZ1RNi5ZIHVi9Y/FsJfAH4gM=;
        b=hNaviDvwhpGMwOvPmRBjsNK/gMHmHY21/T0M1KpG01vIvw5WbU32eS0WaP3vlMGhPl
         yQSJfqm+EXHiyv8v8AfjV1F4AFMld4Za5uXqAcxXf5YbaCJFosidT8qZ0NHZJ9zxv2bI
         YxNX11XrMycOK1fqMP7jdmPD40Mp6S3Gvd9ydzZcRape73ta2HOxYyar+nUgRpKdQ5NS
         Jqxe1NFrlWwiwexchn9ugAkdWHRv0G+allVfErCuPCnLGCsGo1P6lTd4rbXG78+cCJia
         Ttb0+/tTajaOkND0qdXEdwOmMeYDP/7HQN/J/qDcJBxcMVUDYtNq2kYQToyZtdN5J2rb
         bjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881443; x=1785486243;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FKh+YMwYF3Q4fffnBXrAZ1RNi5ZIHVi9Y/FsJfAH4gM=;
        b=HmnSwCSvloW778Qto90zgKD886A6tA5afdkrBdBdczuq5FdNDE4fV2Uc+Cs/AsiDhJ
         2gd3WZiiGX4MltIx+D5gRACwPyE3ULQsGD5Fem0pHpLbLJGYFprFu4s63+Yc7Bzv+ays
         XckBuWDjPLXP5DKyy3hV4dmvo2sI2Ot8FPJOICjJJmofjKOh4G+NXoWx4PhaGsBZjLbg
         KzSuC8ud7V367iKCZbIO4QaS3djHVHRfJL1T+shjeeYpcOY14Ry1M1iqaFoGEwHEkNxO
         8+LifgtGsO3H6ZlTaK+i/oMC213V0NKUeNTUPqHniqIBr1HEc9cGR33czZBnOnt39axj
         lXaw==
X-Gm-Message-State: AOJu0Yx/ynCHbw4npQmyjlRBz4PgGlbKG0eVb9H4zztAmanz76NXBiem
	6n9nPPV/Pjr+oR1EV4s3FwEb2DKXngoLEdSYMSJRfdzeRAFoc07Uvmex4tB6NmI1dswQaNBSY7z
	BZs+ArhMXCciJqxrNu+IRqKn82DJVNTHOF3HqlEEB3wElOVOBaSUOJpNJKMurDtW7DWhZifhrwf
	kW
X-Gm-Gg: AR+sD12zjKYy9p9guR5373JwK1ivM7n8psSvh1pLVL8xHLjA2jiowIgZEZARgyICbp9
	xY0PSiaLNFs4UsAJLmKjwfW7L3sE2emkv0q0B3e+r0SB9Ax8yEBnXcoG9qHBos+wh8VSijP/Ng+
	XJVsz+gmeO0+DmmSvX7ua7aJFa20lvZRQ/2He8kRDKmNIrry0LiBc1U78SwA2E+JKiDVa5qWNCy
	Pa6IIeVvTS4cbtIJOU10KO5KLOEeEWYZRq6HuthpuddZ/3YsDon/mRJFKVwp0wx926bsWk/HZxT
	sx3H7stmSmNfbl3HcaqQX/mE2s1lCcrQnEkFoD5iGCNIGW3jVAc7WI36gjeEn6UHcLkK4YNPyQY
	bJT4zLBaC
X-Received: by 2002:a05:622a:1f93:b0:51c:1117:c79 with SMTP id d75a77b69052e-5283de58828mr62911831cf.24.1784881442764;
        Fri, 24 Jul 2026 01:24:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1f93:b0:51c:1117:c79 with SMTP id d75a77b69052e-5283de58828mr62911591cf.24.1784881442165;
        Fri, 24 Jul 2026 01:24:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm22524508f8f.3.2026.07.24.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:24:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 11:23:54 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v3-1-eadf9da69226@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABkhY2oC/52O3U7DMAyFX2XK9Vwl6ZJqu9p7IC7y47KwrqVxG
 wFV3x13IO2GG5BlS8eyv3MWQZgTkjjtFpGxJEpDz6Le70S4uP4FIUXWQkttpa0lxIlgDMMNsEu
 fDsJIgOUK2DvfIczkgWJwOQI2zSEqjd4oKxj3lrFN73erp+dvTbN/xTBt/J+LjOPMGabH2SXRN
 OSPe8Citu0/shQFXAerLbeRR3MeiKpxdh1/3yoeYvMq+sFvlP0DXzMfTe1Vi61p5G/8dV2/AFk
 Lsy1uAQAA
X-Change-ID: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FnSf+1AIMzCm3fF2dSRYZoOrK43VW5g2r7vW96mvb8Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYyEcuDqjd9ISyUIdyr09hRZ8+xRKnNaJokA+t
 PoXVBWuheeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamMhHAAKCRAbX0TJAJUV
 VnVwEACKt4GN4B4XP6EOdjjeDMBS08vnGWOeeqlgtnpMYk5EsTA+o/AAW3m9/NzjkINim9ILBKq
 4NH2VeIwvvYT0eGAkcqqfPu06SNJU0BuCdwMNMFpHex/6wMSh6kA/VLNqcynE0ia5ZUlyh4H4ug
 8Dwn4634OvL9KkVkDH9XgwW8m9qG1yiV5kAkrXOCgVmo1lQiIArLQrOxsY6dZYm8VZy3gKipazP
 UTkiGXhlIDnfLh3Q+BX7UGz26xCmL9oLPRoemapE2yYbn6boXr1rucEDEqG+Aqcgtb7Bng1Snu2
 KD1hp6HxXd9kDYOrw+WJMZsNpWYSfjvmblqRDEocHCtiPgzgrq+MI3YwreMV3IRNUUrEVCxoJo1
 BuYqr6AsCdri/z9KoQw3XpnGz+Zetyy8gSt9+816Jd1RTjrtx9C3wKaTFWMBZywp3IclXViSHDK
 4x4D+KOSBKl8Nco4XnTICMhyhAgiTKjLITgNlG7KLyGJ1tIJ4/A9dyrCdZa6gxL9roKPBHt4dwN
 79faS9PJogneD7+vBg/6ihiZSXP36bVHZuQyqzOG4py9V9v+NEkMpn40B0T+5+FZwPOWff1E6cc
 AFH0Y0dP2EZb/40wP2egMYwSXZfWiFr35QMW8foTntleVIc54wEZ494PLw7B4/s7d4V062LTV1Y
 lqVg7RrdOX8YyKw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: OA0zDASNMiOmISKt6-TWn-h8r4vzpWx1
X-Proofpoint-GUID: OA0zDASNMiOmISKt6-TWn-h8r4vzpWx1
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a632123 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=NM2xb_1QpfBF5zHC4wwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NSBTYWx0ZWRfX6l2h2kFGk8/Y
 KF8v3Olde3UvAwg/sqWLC/D+TU1kA1gmQbeaypnHQ5Stf1O47hnFn5rW55qAllkZvlqt6+YlKQN
 8kkt7/OfzCL1pAxLGrd4zeKnukdu0QHu5UsZ/z+PFtiqBlP5gJ/uojdKMQn4m0wQ8DCHOYck0Ne
 nBu/97WxoY0/E6KTFbwwdBBmw7WpcCqg4xeN2m2diyDklYciDUivAQPRDE6tnqJhrW9avLlMoqN
 hllRvie91HMUPkUmBX04/QNb9QE8ca2rFNGnWUYdpNbXcd4qVzIjnyaY/Go5CMISEBoTU9Mmg+7
 YUA5jdN1nUPI9NagBgVIblKHFiyLlbCWvKOww0EQeemU2kGv3QB5nxG0G9lvxnO0j8i7HkASx1H
 bXWpk1x1wIEIywMqrZEmD7cqJLEWwq6lTaNgPzHZ4DroNC9HKJwtH2sDv580qjmhEg8DqlM6QEa
 z/rnIx/rX54Kuc13zhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NSBTYWx0ZWRfXwscqUm69vd7t
 cny4HCqSP3S+OSokVNOzuA5jz3bI3EIeDVNdjupgb76xlcg44y8/C2iLl+PblXEVBSZgBC3ibpx
 V5O6noe2BtWYWouUqv2BdiwucS2nnA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240075

Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
one USB controller and a single set of PHYs, which are connected to
the port marked as JUSB.

Also, the EVK comes with an SD card slot.

So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
supplies and enable the USB controller.

Also enable the second SD host controller, describe the card detect GPIO
and the board specific supplies.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260723.
- Link to v2: https://patch.msgid.link/20260716-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v2-1-e53b1fef5705@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260715.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..2fc945658300 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,70 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart13 {
@@ -18,3 +82,31 @@ &uart13 {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


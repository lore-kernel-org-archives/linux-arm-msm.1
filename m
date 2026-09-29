Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFDA525A8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687408; cv=none; b=g3zKBabxoUpP2jMXPgiVyaB1SdO340WIMmS/FeEASSuaD1DQQDPNSL+TvyjRU2M4Ka9yox9U3z13ekBVr0mrekNisgQCDtGH9L2GInLN0tTQIv6Ca+JR2zp33C1BOJ9rERtTSZx4iq9BGXcJXXMs6WxltS2WGG4llOdnIoNSFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687408; c=relaxed/simple;
	bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgBXIekNwvEoGQ/su7uqY55yjxPA6bLhb23qDME99Myoa1mCK7MdOFaITip1AM7V3WznPUG+w9+OvpwTgHDxSpV6xTrC593+hvHtaBwboYVd2SVEX0+nCDi68518nrqMAa1C0P3McRRK1WLzD0FODSXV3xt/w5yNOMbwox66kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZWIUxrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8nxgG3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZWIUxrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8nxgG3d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqg9P4151409
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=; b=IZWIUxrM4xnsa87O
	QrFMCZONDSsjLZCzOUiyFY+vcgcvBoWOHtYZJwynmVXJdFQV0LssWfz9OLcP/Vys
	8ewrm4a1tQy6rnWUYij2VovS0tEISAoApWmkCoNoKeeSXsZK5p921bHmdmvLNxFj
	Q3tmvueZJmAXBCUDla/nc6VkX8zuY63RsbDf+/+ne+zGJ22NFu641TXF8f9z6n8/
	wleZZeFZo/levRVu5VDHL8/KRwu+k3oAgn8y+SN8knO/A7r66pafymopgxsP032N
	tf2h50TPkESvQ2Xm/dszbf1hNus8W+82h5DzVU8F5eItZb6epvr7VPa7SfwuGRc3
	nK0XZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc65q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9123be39eeaso86758376d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687405; x=1791292205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=U8nxgG3d9sOlpOm5trOuPcqzo9gg6GxSoRuyvO6XPp6ApF0XxjGxohKX7GEEWXYzRG
         2B94+tJLg7s5cbKhI18up7fVnUMdnLlHt6Q7+v3Ai/f1PH5z+YEiHEU35w1Oij6pukro
         jUPNkMU2K4dS9uxt0shGspuZU+UAYKku1nGrcaPhc/FFSdooP2+C7QURQ1A1KXw3LQP1
         DXVfgeJ4XcqoD/oEsI7sxDmLZl444nu/rBoHCltiwckx5Ns21zT1cFwKhMMo2ocTcw4C
         CrgritdRQUpbAUowqQGzuF1OOC00019MTE9ojvvBv+PBbbbZuQmCzCD4t/mvqkR3qA55
         IjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687405; x=1791292205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=JXizuvWRWltOgK6pf8lSPM9s4EL9a2wnDLxsNTGtyGEGvgwuqJh21dbNIjM0px2bby
         HZSptn1UeBFpqGnzQupbc1+J629JuIB8JaVZDRU/f2wl1YiSloAZ26gygrG1170NIMRi
         wC7GgYiw3adRxBQIG+/6MTwB/7zKlTB/jc0u1gjxAuZUC+IrX9dQ7jbF+ih7gKTi6dG7
         8OjDzrJ8/eHkbSCZj9k9DLvlf2mCSpEWglu1O56ZAjgjKGojMBN7qZdTyZdiRbOSNFfz
         SghToAaIGvgmIbbDjV2JHhFSMgNcZqAOe7OFoxqV4EjpLTt9eQaJZMG5B0dTBPmdONSV
         NcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh5JnafyYqHO3IwfGdeyQC/btlrYd0AI3VoxwEY0g+b3pVtjdnLeb2cMXfuV8PqaVKFy+IEz5JTEVIcz+7@vger.kernel.org
X-Gm-Message-State: AFuF++nG275aFRexAqE8SeHLnvkv4vSLaIV6zThs8xlimEh155DtAl+m
	nc8F6iKwzpHD8MO7KhPzfsovLq2RnErOd34NQ85XOj+l66/2SBlWl3SYTAK5OQMOWDVV81ikJfP
	pvbMMW6SYoqnpSu0lAFXQoxm+X4LY8uqlDAyvFBQWqSXYBp7Z7R+P/4rfxwaC3DOT1v5D0MO2LB
	LJ
X-Gm-Gg: AYBFou1W3YEXaPx1Mf/IMUzJWqFfVEqfsvEujpf/fbE5cicnTtQouLuADXND0jEYYLv
	7GXRzH0DEhatAppSi2FQXoT1DQ71X93pqrxj2kQ9UIZ5ooeUJKzRk/hd/CZr9bWTC5x1sduSG7Z
	51ZfCKWB3uQ6eiTzeULbeM7RimNoTYhaJK5fdW/XWTwKhn0IT/1WbIEq/kqagnySu1ugZekrp6s
	NhO2VL5uJfDSJOL/ukhYWhQUqJUIMiBXKgClDzalXx9rRrHJQjXQwO0GZj1iVr8AFh5h0O8M0y9
	eOowEWCeCqYlN1+nv9+WqdXVbhMSMSzwPUJeH32gJCQszEZjkSCWgy70oNPcMPAJKmRCSL4++DV
	FoFa9TdmQ4AxNyNEW0x34pFIqmNLqSSChHsI=
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261680746d6.43.1790687405351;
        Tue, 29 Sep 2026 06:10:05 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261679986d6.43.1790687404649;
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:35 +0530
Subject: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1673;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
 b=/vuXxbLlqSAzDejgYnMcuPPH1hXmQ8UXDiYuQ2CgBfgDbCNwjv/dPe+PwPtxF6/U4BN9UwvpI
 WZq/rzboEA1D4vTxchbBlzEkQESYRNsqN/UWKIjeLl29hbOAGNnBncN
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: VC8cMydNUkh4KTuh1CVqF7FoI_BLNOaD
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb8ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4rnOEbP2P5P8
 8Dif/G1sgukEM0Vbh6kMLMiRP9H7s4C6UYXwsPSXRjD+4kd5gWE90CLkAX7G8T90TXGvA9bXiTI
 S4s4kAWkAnZER/PyQTsAhacV2jXA90D1aoE3pjoLmoAellXrNL3LZPPlSqujw++4mY52ZBMrSY5
 7VpubAfpkestIE0Zat6fQ/NbC84KStlZHOOlUbHjjIHyvEbI0Q32gmUM2W0ZvUNGZ6DS/PT7fFc
 3GJqK1KuGkgiUCbUS74vFTTWBnkQtp4BE5P/rCjixKcVKC+mbtqm9jkG9llGfcDTw0I2okFN+Rb
 iwRBocJ/XMVnEglLJ0e5nX1xRsxeIoth98wXmql2ds9L0tqSTLZ39JCujAnZdsUkuP+YKysLJIW
 gaN53BnGn12JWi2Fv1DeVtMSW2hPVFCEAM5ibpgOmfZ/5zL0iwMwO8LZwDJl/9TVzkVU9jLQ7i/
 TxCEzspGgP/k0TSmGfg==
X-Proofpoint-GUID: VC8cMydNUkh4KTuh1CVqF7FoI_BLNOaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2UGo/aLlhGgK
 Up9/3/s+hXCZ0mOyhO4W6KRxiDxzvipT9UcCzKERbQXhdLer7WwKta+QI55rCXydiJS6tNNmdZq
 un/ZflOTAEkNuthPlGnVIu7fKDa3Uo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0


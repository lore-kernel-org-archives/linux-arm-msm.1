Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD673D525F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507952; cv=none; b=HMDP0Ab7Lxj1DaG/g9wJfNMSS6kvsBYxR8k/Y2bnHyWc0oDe7Yx2bBy20YOZy3S4RlP3L1c+2m0bcneT2FA1NTsGVP3T2+qz45IGEFuJcg2rosHvQBlPbo/07t61LIS1+qZNKgiPEHeu1IyC7DCja3AYGFH/Wdo7hFyJeUmRhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507952; c=relaxed/simple;
	bh=nkM2qt5R1/uUPdCckueCKlJxJ01JG2RhAEHpxcPs2t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHIVUN/AJAd/d5nQyYXDxGVRYNYtPVweRzUOxnSgfItTz/dyzx6JWqfwyBGSTQ1m71D8z1tQtsBgluvUtPmp2XM6pegQTe+eiMVpf8+LYuXmtbRBzuviBlSDM+zEFgUmCivSicUTWYRZHC2fqTrQWb0XoqQzPMzejhrSFsNqSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgY9HWDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOcBBkW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgY9HWDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOcBBkW5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462XqM3498834
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 07:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+N
	Y0DIrMe4=; b=QgY9HWDk9emaCdPY8/Bdpc7mHHcRZjYWOuOhaGRv1XPQWHC/pt4
	br2Q1LEEkBaCYgk/8G6lJvjWRHeJeglJDlAyO78yMKB6b3RmnyIj5Y1hU4YJc4H6
	UxXFAjCDddpLEsJ8zjVAwhdeiL0YMWyHqj17BgdtK0xGUVp+v5g57UKh6TfJdqz1
	x3rTXKMpGOCH6A/fp2DQFlL6g9uYY0XGeW/qdIIclet3uqp4163/O6rTBUS7dn8A
	rgnFEQg47qrgkkfAPXB/VUmxzSwLpx/u79syrN0ecSZmJxhQYZjYBGe6oICPqA3V
	m5B8kMWwBFuAb2capvHBWS3XFQ04Qv2eH9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvkcqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:45:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so15591995ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507950; x=1789112750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+NY0DIrMe4=;
        b=KOcBBkW5deB9TO6KYO+KUvV76T8YC4RpBgh7PvxgXrFpGb7a5wp19ciNErfuVLweBn
         vGX0qO+E2vBADDJAkVXUvsdH7BytQnYVMj0cjuf/+mV96fvHwgpCMMfE4lKWl2XohrIP
         ULcUvNCp4yeZIGEq7XGxFdDYFDOHAKshZW93rdHbMPmM0opZGTZwlLByBocv43P2cnk6
         /v1s26tEopk8JTGyWmk8Oi5xurN20dT/8BBzgKdN1RNkBrZCD4vzte4MbbDzAQysrHMb
         LsO30ybIsAwO1VDMplvOLjd6ACjJ860Exw3lE+kb7Vm4XOSYURY8qTqrojZW/ieQ7wzB
         4kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507950; x=1789112750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+NY0DIrMe4=;
        b=bbT11Cim/Lyo0Xzzob90r+Z6DhvRt8KUCSAqdPzgX7g/lrxfwdU+FcdCtFPXDmBHvU
         IeeDhZgbmseb5bT9FkMESIzPXPatQAEJbyg28wqsAxqtKHbG5zIWH+KrG1MFAFXyNF67
         06rCHxnJ5QITZGxhvj24ph7SmV48tkdmhuVYpoxYNzXlou5dpsoHJx9OpdfVEMjGpymI
         ljKFXHRgOyujIywKPrSac65Ym2OuEQa2MrpMvA2tB19qFAus3/kJ3nJkg/ZLPELI7lvp
         qMxK5+BA+BRUQdEL0l9GwdA4D1lTsPdPi2LIbx32HJTdosrSRJNAH/+D5lA49z59yBWC
         pFQw==
X-Forwarded-Encrypted: i=1; AKwUvBwS8hjhEvSrvbAOBuHAhJ0cE31kcr2SlfkTRfzVp57GFLPqqMQjy8KGNvQooEiREUT7mlAI+WpJHMGLYaVl@vger.kernel.org
X-Gm-Message-State: AFuF++neU7Dto6pl1sV1jnxTdJ9wTg8h6upAVHU2vZyXplORb5v9pSaG
	FHQuzC7EkAnP1nh/zOJ37lAoW7kv9TtCW7ZOVFoIJ8M13VosC0u5SBXlon9mhAN8JaJWh9qbWJT
	xhql612rFvPEFkfUnoBOTtkMBVk6M9f9BbApx171z4XMWJkHoFNIkxsKuF85pnYDXT3l7
X-Gm-Gg: AYBFou2H732MMTmwI+YDRpYm2x6om8Q99V57DSvmL5ya3YT5aIbw0UTWX0PYhwdy2co
	f7lFFkjOUefV3mnJQPdxr7RXQbhpUfNdj04m5fImZNWNZKZ9ZSDl7m033czUBf3Vs5ba5gV8RgI
	bHoD2tk8SgbEBkldgMYhSG63TrQDnGRhhM2i5uqGWz1QMf/VKbf01TdN4RRZVLO+AH8HOQ+rie5
	CQmWOnK2hct0gRLSLzhGXLwY14rMSa7MoJdnWT9rLImV3bSbT/30eDg9C74WAMyXIJ+9L8PLzCf
	JJR5usLtF8AZ0RgQIU5Of/eBcGmVn6f0r211RwE4dxBGLHHEOK7bWG6AGkDQhMFyHuoc4syepD6
	11Tlpp3lNVfnIz8dKdngBx5vdesA5uMFLAc5OKDv82IdEj4b0tiUQJBJzgJY1
X-Received: by 2002:a17:903:46c5:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2db1975804bmr37599885ad.14.1788507950004;
        Fri, 04 Sep 2026 00:45:50 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2db1975804bmr37598965ad.14.1788507949336;
        Fri, 04 Sep 2026 00:45:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm5130365eec.1.2026.09.04.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:45:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Fri,  4 Sep 2026 15:45:41 +0800
Message-ID: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VhIFfCJJei5pjk8U2wLTotCN-aWXjhyw
X-Proofpoint-GUID: VhIFfCJJei5pjk8U2wLTotCN-aWXjhyw
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a9a772e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yylTr5QwT-72qLXmsWIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX1HLTqtpZrGg9
 YK5gP1+6QHfKzKEPNrXPy+pMHprCufs1d8ewYtuARXEVuiD4LE5Ck5sLuX1n0s7WjEKx5EqM1LD
 m5A4lYAT6az5ir9OwhcqK4gffdyHX1uj5Gj2qEIA/n9nAvWx3f+5w3DLEs8B/pRvaTpVjfXppt3
 18A9zJSiQEAoy2zpCL8Dc+s78g5SvB/DWvVV2CAPjXlsd/bYhFSMm9X2lefBsvD1hcJ1vX4wrYQ
 0d6joV6Zhas7nh9YPG+TfmQ0S2BokK85BUTXpBWTbFWOlYTIJ+BeZCAWCyP23pgb1pdxYHQm4Lq
 3ruCxqv7z5ycJ/pcpnlGgMXBAOmPTemDESOAR8x0JWOJlphH5gYDMrf8neomLNGaNzT1rZctbyz
 KPKg6IbPJablNpdT2FsT/9IgbfvzoNPNj2dlG9D2tw1vYC//RCqpi09sMkX8HBasZAyi6iQys3U
 W63QULsI3TZ0R9pXtGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfXy9/4kutrSDlQ
 TvukOqwOyel1Xi0MxXOt7XTDzKGbGfw/pb+hzhV2DQTWym7CEqgiiccEgtATe06hu55KO0XtHFk
 ycA+0Iiv6O9Sp0Gs9vJO03gaW1m4bDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040070

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0


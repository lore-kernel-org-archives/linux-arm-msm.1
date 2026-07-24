Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05243B7B7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879447; cv=none; b=aBdsJGROVjcGfeMgtfpr6cBaMXyW943TU/OwTagOnS50IKjrj/viAUW+YBvT9+qht8/Zd8I97fB1z0/o7JWLQPuhLHAYxR7OX+VAM9pVTFOhUNYChRaNNmfXkL1Utb3s6vBM5dne+i17/7/anYYQR49syGLoOk4weTtFwoo8ktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879447; c=relaxed/simple;
	bh=SW5MMRu4oubNMWNTisVS6oiIDLl9Nd75IPB1/2CfQpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NXt8jnLHYwD9cdsmlcyT5NCSzizSnNhFhOPebM7ElOE45nBct5BAWHjFkujxBJrvG05MxGUQVK8UJ4m0In+A2BTf2UTaVDcsVv2LqNwn2fvG8XDeDBTMIuY/Ex/kjxgmVHjBxwvMOdzf3WVpmCaPXmKeljLGD/uS8/kbcYSCJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0n/lm++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxwX1DLV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0n/lm++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxwX1DLV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4smQ81897518
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=26Jfdfk5PR90yRYa9qEek4
	o1mxMwXFZq3fPnw+9hh6I=; b=N0n/lm++qPGV4E1dbbucUQxnrLuiQfsozG4FsN
	8zxK5LYGHTVigk8t7zt50/sNGfxA3S6v2ktAZ/qzD8cBcDuNP5gMiyYF6zBp819L
	y6Q8Y3Eoii+CmH/JnLeXbhpQbEMHIbStSPh1FDiWqwy7rY1P1tGmzf1Pd4RJNQoo
	QPCGS3QvfGkEbGNjJjfSxjPGvuYCRi5ws02JCQubqXK/Zzb75RDrkMqTjJOmokLL
	dr475xpkoQu3lR4/wdpdvZJXqha3I5uPOp8GxfKzhYVZMTbH9wPBsfEyjYRJD4Zx
	5i5dDWU90C/YxVrU/e7I7r8Il/c9c2zuAlKTRBv9SOf3j7Gw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8kak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:50:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so2696381cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879443; x=1785484243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=26Jfdfk5PR90yRYa9qEek4o1mxMwXFZq3fPnw+9hh6I=;
        b=KxwX1DLVHLEw9zJBt/jYobMzJPGcI/9hzSsqVpZMwkv/5P6bFMvUdrBSvaFUk/ieW+
         mZNozOq+og/ldHKxcxbNRlVCWBr7Uo1gSLv3A4mrC/+JPnKcNzx5q8huegEDxUDRC3kt
         LM6YWDIXKlG16Xq5M4iK6iXQiEQVfs7AliOGLDcz+00PhqdDTtGDYHLh2soyGpyWFb7f
         qOkcUr6K+cwt45xY/UIBoAo0kktEY/heYbIIvBB3rO0IvtFnkP0zBm4Qiqh8xaB3nyq9
         E0152lWjSL3/+wFKcHoGfYsU1YK4tYIufJpVjIvTgNUTGHsKTZsvAfcxoEpRk20tW0Mz
         mtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879443; x=1785484243;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=26Jfdfk5PR90yRYa9qEek4o1mxMwXFZq3fPnw+9hh6I=;
        b=AI0f3y8uewOr5sLfzqXHm5OsoROrUH5APO/O43VNmuzMVItp4eDTAyh2iNZpRpo1CB
         UYj8iPGvH1yqCUwNJq6p1v/fdzAqoBb+31XFQzhY2l7LTm1rg9Ikqu1gAqIjqrUuarM6
         vGwuzeL1OfafWN3kTXM5fe53ljTbTCtppDPf48IyuVSI2cqDOOU7chYTQYlXbthdeqSI
         d8CUeEVH4GifR12uO0xu07r8pOXnBTmuSSsqtdwFntTlUbaDj75ZqG/vzdnsBBeOOSct
         9aaOg6hc17avubnfsYuwmO2yBJceUx5obZaYMCJCImd3i8qtVipAVjfR0cbGn/wqMlLs
         XSzg==
X-Gm-Message-State: AOJu0YzsuyvlMdkRoUeuZgyt1QhZiW7a5vLNKF8y4EcQlyQX13VIy5Xs
	xrmlkXRiKNlPHg5cmyMYmJLQrQGC+l0VBYrkqpfnkQn7ElG/QjjixJLaQczRrCMiOIVXBM4fvqm
	1Gud3hC/Typgdj4En4+kW0DDMIQmzd0GdC5odtLtyZKc0chUsI/wP+kFVBSFmKI+Tohlq
X-Gm-Gg: AR+sD10hgP5600WOjhhYJyaFoKLKWvgTjWavkLF3JEY+qEbnu9ivvmrIIerl2ii7KK3
	kUwRw4SqvwiVHGKwNoJe8wYM4Bg2SpsaAYaYkthEnvFRCZIgi9lL3Olex9vb71ZjCod9UWy1j9P
	3Ewq6Zqt823Pcd4OeQsDSDwmbPmMAAqSkh3mFlDGMFnVCaNyB2XFk2nPjOF9vXpfoCg3uZCAUas
	AAZsNwQJ7VGiuhF6E8YgNpXsKI04thplouRVP46DbxJJILxEz/d91e8LWyd8WETHhoxy8VpZiLc
	nwsOA5tS7oEF8nMl2z8w0z7dWYl9hqmBYAj556uCTPfiB9flglIHQYwWf3fReIWWHEWAzSLtvDa
	2ZO7cYi03sUhuC2NCPC/49ek5ewLWsrMkAAmcZk2xCtwmIij5CA91AH4pyHaQiGgtezf5o5p0vt
	y+NzMNmAyyN6QhT6yGBt6eZLNqCmN7y+DmSr7nXL/zy7ZjpOYPDg==
X-Received: by 2002:a05:622a:1e19:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-5283ddb181emr64593831cf.16.1784879442817;
        Fri, 24 Jul 2026 00:50:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-5283ddb181emr64593661cf.16.1784879442339;
        Fri, 24 Jul 2026 00:50:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b610sm2799260a12.15.2026.07.24.00.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:50:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:50:38 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Rework fan cooling
 map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-fix-fan-monza-v1-1-d1c5be947329@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE0ZY2oC/x2MQQqAIBAAvyJ7bsE2Segr0UFsrT2koRBR+Pek4
 8DMvFA4CxeY1AuZLymSYoO+U+B3FzdGWRsDaRq1JcIgNwYX8UjxcWg9WaNNYMsDtObM3IT/Ny+
 1fmBk5fBfAAAA
X-Change-ID: 20260722-fix-fan-monza-7c27404fe7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX2I7AjwgZMaid
 6/1RSfJBSh9Yn6Pz4zBwrJ0LjdTCjNhqrZw7TJa7caSM2DVaRdt61eobj4nxXGYoRoWuEf7LR9g
 /ag7QI9r++cCM0bZFrO+O6Xmhu0w3Pk=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a631953 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JAcnC0gH-uw2M1I5ggsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rvPHLvQ_2mVSOAf9AjX_RkbUYqV8CmoN
X-Proofpoint-GUID: rvPHLvQ_2mVSOAf9AjX_RkbUYqV8CmoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX8i6t3y1u5L0Z
 iTig0xaCmMvLeja+ei8wyURCAlDaScpMaXiI3UWn9TF7uTeI2j12ePOzBE8n8KZPX9WELr0LuYO
 gueUfSaR5Ywhrlt8wCZclaPTrd3FMMQD0nsKESkRlQf0PcaTtmmjb+1mAtkygj0PzvpqjqlUgh4
 AM7Z0+HcaiffzeL/JpWwhNPaeSJnkzlyb51JeXpuD+gg5agjkJrZmG99SWWxHwpr44AUyAnuhBk
 8k/ZkXa2jYLVXJ/OZq9nvlf+KtdKqcbyHTYXiEWlYnW+MB4iVAzhQNrAIND5lOI9hMerXVKbjRd
 7xaaMk1il9HjFCu4+yMOo/gz7DHyTINcAUuLwKHnwEQdYoEsLrOYOHrCidhhPCnIEzyIoXf08dh
 DnxyAYUs3ZjXYuGmpOY8wOk6gUIczA/Nn0tIEjdVLNBhXEIJ8h7TfJU1cIQipXWbSr72Z5nrSmN
 /7lh9N3CgD41AEssUFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

The fan thermal zone previously had a single "active" trip at 32C mapped
to the fan over the full cooling range (<&fan 0 THERMAL_NO_LIMIT>). With
the default step_wise governor this only ramps the fan one step per poll
according to the thermal trend, so the fan speed tracked whether the
temperature was rising or falling rather than the temperature itself.

A visible consequence is at boot/reboot: if the board comes up already
hot but thermally stable (temperature above the trip but not rising),
step_wise sees no upward trend and leaves the fan at a low or zero
cooling state, so the fan stays slow despite the high temperature.

Replace it with a ladder of active trips that each pin the fan to a fixed
cooling state (lower == upper in the cooling-maps), turning the fan speed
into a function of the actual temperature band. The multiple trips also
give the tsens hardware several thresholds to raise an interrupt on, so
the fan is re-evaluated whenever the temperature crosses a band boundary
instead of only when leaving the single operating point. The zone is now
purely interrupt driven, so the polling-delay is dropped.

This also shifts fan enablement to a higher starting point: the fan now
first engages at 50C rather than 32C as the fan was spinning almost all
the time at such low threshold. The values are picked based on empirical
board testing.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 47 +++++++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index d1346ca5dd4ef75072b09afd78e914e3f6b12534..40470286eaf98a0f08ede191957c7f0668077685 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -452,20 +452,51 @@ &pcieport1 {
 
 &thermal_zones {
 	cpuss-0-0-thermal {
-		polling-delay = <2000>;
-
 		trips {
-			cpuss0_active: cpuss-active {
-				temperature = <32000>;
-				hysteresis = <2000>;
+			cpuss0_active0: cpuss-active0 {
+				temperature = <50000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active1: cpuss-active1 {
+				temperature = <60000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active2: cpuss-active2 {
+				temperature = <70000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active3: cpuss-active3 {
+				temperature = <80000>;
+				hysteresis = <4000>;
 				type = "active";
 			};
 		};
 
 		cooling-maps {
-			map-active {
-				trip = <&cpuss0_active>;
-				cooling-device = <&fan 0 THERMAL_NO_LIMIT>;
+			map-active0 {
+				trip = <&cpuss0_active0>;
+				cooling-device = <&fan 4 4>;
+			};
+
+			map-active1 {
+				trip = <&cpuss0_active1>;
+				cooling-device = <&fan 6 6>;
+			};
+
+			map-active2 {
+				trip = <&cpuss0_active2>;
+				cooling-device = <&fan 8 8>;
+			};
+
+			map-active3 {
+				trip = <&cpuss0_active3>;
+				cooling-device = <&fan 10 10>;
 			};
 		};
 	};

---
base-commit: 2edbea82d8edbddb2a235b8f988f17b86f075476
change-id: 20260722-fix-fan-monza-7c27404fe7e3

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


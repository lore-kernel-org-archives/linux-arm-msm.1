Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0223D6CD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740111; cv=none; b=R+s86dXC9fTpxFGJkKifcYId2aJPzW/oRzO+mZPFRnwtUI5j2xCFfQBIKgWcoBvtM4MDUquzQRCFETQrx7k4YT2CHygRrn+0+iHPrv5gVgELRR53A1Ph7qxlgl+XqDLtvsT+Xo53RTCDlubeSgrRKEQTvfzp8t4X5yAo41uB/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740111; c=relaxed/simple;
	bh=zly4axDacz2KGW2LsJekH3WMI/9q2D/SHxkeinrzjb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzC3DuW5uXsZ/KVB46o2CQSPtzGSOq1yJvuPzhKxKgleBvXqFRuEOB1LLqaSCQYkicVufO6bwFlZruM6UD9JhbK8qAn5+lK3iZXEQXeGilNNj9Gboeaui5zYbWTweMJRsVyLdPIR56w56wbGEe+va7e1wjcqV7iZUqLhQMcRhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWIcFXuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSZV35b/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWIcFXuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSZV35b/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGTR51658487
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ei/zFpRu6EC
	G2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=; b=GWIcFXuZaEH3gZFvYCpVTrymd3Y
	iTKsxZPfE631//3PkEPUvqBX/8Q0zN39o3gZE/+dgtsfLSz80vOyAsdh83Y+QkHI
	Qlo8QIAKXhAKVxm5IdRKZRt3Bl4hL3GylWt9Pa/mpLP8rfp0+/UilLd/Tt7gFPxa
	rOs5/pxVmbkG++QOYHYV88LKYGQe8y9kXGir0VziHo4CHkCaU2/lKKfVtYM50vtl
	9SaNt/SQWt4XQUJ5kJSkfmP+XqrTFGob2GnmU5hWu8lbqe0O9lYMxIj22Mhxtde1
	Jt33dXydrfTEgRoUa5q2C8TBL5U5Ep32mwc289RJPszFqOvSipGBG8zxSBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rs3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso13729395ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740108; x=1788344908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei/zFpRu6ECG2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=;
        b=QSZV35b/3o1nwk1D0tP981Bx5HncUpoaJM+WsWlVtra6kt2f5tKAnJ5hQz/0GYjaY0
         gif28uy+jywgovrWHS5YiTFbgSMPxZu1iKSNCX9Lf6it/yrlFvFqESY4KD5iIeEFrmDN
         T3LAK1TXnAfGRH4GxZ8mVYqI0Fluo7/Ty1MRzMv8MB2dHim1DnLD6eKZc+5DgzKp763M
         4IlWLm7JMBgf/K4S4mraR4g6uk9i19PGflRFcgYq0N0qyCGH3HgjGAGtjNTEohZ0R39g
         YaVKLEQe+lEfWwHM8yuklJ6/as7mUvRqVJcPpcLQyjgP5Cnlh65T0/d2fJvcQksOmkNV
         dnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740108; x=1788344908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ei/zFpRu6ECG2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=;
        b=iqazvQC6IcfaBksAD3Z/N4udLcX92yFMuk+IrdvpB/K8E9PxSW+eMTvyihn7+tmXef
         1fpmfUIDsIiBC5jQsLuDlKmbF8owR9pNx1mFPjcvFBG366p+alohV5VPur3ri3uyps4p
         HNKvilMDsaRy38OXrw1dCIWAjkj4FBZ/nYnCjojsV0hPTIM0XfmpyNoUl/XJv95kKmM6
         VdQvgVPJ+Sb1se0uPZmBblT6frY7CaLGWDmXRg/AmolYdJlWmNIe65NVW6QU4fjpPoTx
         fEA1DALLlzH69WLdlveV2ISGVXP1ju+o1PRhrz/Jhfbv5zlR/0vxLbjy1MWjCmNAQSV7
         1yqA==
X-Forwarded-Encrypted: i=1; AHgh+RqBtJainx6nZGAfod2MQIw2sx0jPGEgth2ciy6MvKStyCIfQuL+0+6AifzDBVk+tq4qYdNh1ueLSFfTJN2i@vger.kernel.org
X-Gm-Message-State: AFuF++kpr+vjzllEf+tbcGH9QsETYg/fa0OJdFE1V1tnvMUvK/lpKwj1
	3NzdATPu3YMvU+xhy06QvUbPpOXEX+FM8IdhwYoQ/APL/SYXA18nhkPp+LaO7hOz6Sa7NjiM76F
	R4AU/v4JG4kYDmc9fcV5zT3hGNTnlsoHwi+098Lqpmky8bLhCF335fOftVaBAozW8Sq8+
X-Gm-Gg: AR+sD12YZkar5jA8lgqk77Mb4b3doFZsFisbVETuGFV9gwK0EPDSZQcD4X8TLASOlu/
	I0RJfHEVTYIMahWWO2LBt0E0hE29VW3dJn6CgXjQMbyrYIfQNQ6p3KSabZ3XwSWUV+ykl3JDO16
	J+nXv8TcR5HBiclPtzZhw2tZBVqom+v6p32m/oY1ML/I3Y2aqeo9K99dh11BvpIkCJ1dPLNcbBJ
	gU16uKCvUnKnUAyP51FxhiOxgpKk+tN2wY4gsF/KyP0DxD/c4U5S4rxGAtDHlB1MgEVpJlnvyor
	eesDTj4/JI13WpSqs6Kc6lmdvtzc9meyubuDipPfS4ofa+NarVvNKzFKHEZ1QFIEiEoS/PYVe7h
	ZMZtDUQa3R6EWYzI3LAXlNOtKxotv2XIuPmyxr1R1xKrw4WK+hXRFLfFUwZhg
X-Received: by 2002:a17:903:2a8e:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d707b90f2cmr111768525ad.13.1787740108097;
        Wed, 26 Aug 2026 03:28:28 -0700 (PDT)
X-Received: by 2002:a17:903:2a8e:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d707b90f2cmr111767625ad.13.1787740107687;
        Wed, 26 Aug 2026 03:28:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs to NMXC rail
Date: Wed, 26 Aug 2026 18:27:45 +0800
Message-ID: <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aEnjoN89619Whxw6a1i6JTXqVsM1pC9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX347r3ILFhiwL
 pRZLAEyi940NFMa7F0byoy0fXg0abi2uL8KmhXhvRa3PlAbUEc80l5adKqweEBtwmt1pGNIZlnn
 4ISucgba3zTuouWmXmbJTmEPz/DT1iRgtZREGKlMfn5HXlXDaZFOaDaTdsuwm23jyHVzkgDFjUf
 NpQ4A75opZP8aiYtaMYnR9AGfK/nKkmdGHVdRmb1R/vk5xPluVdt9GNUHfuSH32ut2Jtr/5TavT
 CVzyrN1/eV1RFHZav2tuxsayMYsR6MFldbumY1cLcXTv+RCJKj2/ZkitojCFkpAc50ABGDg5BKG
 kXkSa/HeojpSJ7JVwnA6I1RzFmlrCPpsjJux4EDjO0XRZalDss4UD9PH999LlfRda0RXCvGzZuT
 MRxhjLcBgOJLhBVjY4GJpYHEntSQrEYOypkpM4/QMGqLnOtb3yu1xl15GCn8dksotp3ywwe9u9c
 B0gsQdF/C4f1KSuA05A==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ebfcc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MJIzKBglWAtiuGNpmKkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aEnjoN89619Whxw6a1i6JTXqVsM1pC9f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXwtLcIV0NA3XY
 JHFHYEg0UW8R/EONNEl5snjp04eGpMXqbX08Sz6gELBGkEirmtV/HCOE7sRa60VfB1fOkmp13aa
 gpKC+Drl29sur2mGoi3APU5PZvafP1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
instead of the shared MX rail, so the CDSPs have to reference "nmxc"
rather than "mx" as their second proxy power domain.

That makes the ADSP and CDSP name lists diverge at the second entry, so a
single top-level 'items' list can no longer describe both. Keep only the
item count at the top level and move the per-domain descriptions into the
respective branches of the existing conditional.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..b09b51f26afe 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -24,17 +24,11 @@ properties:
 
   power-domains:
     minItems: 2
-    items:
-      - description: CX power domain
-      - description: MX power domain
-      - description: NSP power domain
+    maxItems: 3
 
   power-domain-names:
     minItems: 2
-    items:
-      - const: cx
-      - const: mx
-      - const: nsp
+    maxItems: 3
 
   reg:
     maxItems: 1
@@ -104,15 +98,25 @@ allOf:
     then:
       properties:
         power-domains:
-          maxItems: 2
+          items:
+            - description: CX power domain
+            - description: MX power domain
         power-domain-names:
-          maxItems: 2
+          items:
+            - const: cx
+            - const: mx
     else:
       properties:
         power-domains:
-          minItems: 3
+          items:
+            - description: CX power domain
+            - description: NMXC power domain
+            - description: NSP power domain
         power-domain-names:
-          minItems: 3
+          items:
+            - const: cx
+            - const: nmxc
+            - const: nsp
 
 unevaluatedProperties: false
 
-- 
2.43.0


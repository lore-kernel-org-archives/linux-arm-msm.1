Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559481;
	b=FYMD8T0BtxBys8DhcA4fhayMHZPHllfROtzD/4r3KASqrzlYaajNmr4xMHhfbJ/rWvjW
	 LnU0II9rbKmjvBAnBKtW9NrzT5bkVDYAHNMrptsFPbr3JgeyDjiUvqVe5b5Y58Dsl4Uen
	 qupTI+/vXzLTNoI9H0MSo0JPCyUUMg1l5iO8w3LZeV9teYmIlD9Uw2EQ1LrRvDez6KBAE
	 d6x6BIzr6b237TFZ1Cr5OX+m02Nc9ALCAn9mq3clN56lPeHXvnkMS9ZEAmbnuRXV1moQb
	 YLhqSr8cMSyH0B715NMsQTC/+gZlL43Jq1q1MycO0qjmTTBhXX6owu0cKevVIcQvgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
	b=UyTgiFLshV1U20k5QgIjkJjefKy81S/k5ezMN6Ms8ZcafwmV+7U9WEayS9QPsm3OcaGm
	 1ObyXxwBoz+y19zjxrj/3QdFIdhvM8ib1NgTBVPk5j9qwQa6j9ktDn5Z3+cwd3l/F4OoK
	 qUQL85iWjvQdsKKXK9G4fJU73TfMPr2qtJ1OaSnhecK1z1dumEZsNRhNz0eYi33Ih4drK
	 UlcwlY8bJu8XO/ECIL9Za0XcuDDxlax8lTeONtsaBCTs6K/kbfahRwqPUSFs4zbpk2ghx
	 ywsGWz0G7CS9F2Frcz2sZngmppLcPyIqhJB0cyTuO5MyRRMazSFmR9bhpamHg6POVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4F60A2605
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E4F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uvpw2181381
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=; b=RWIx79Qb43YpODZN
	UrDLH1rjSOQSUi32mYZnnjk+SsakssXggJllrthJ63skr1a/VT87pxwJAJsDU9rJ
	kfGPzeXBXlk4EN706NzCI7yBOFYn9qzCW20WjNevdF1V2fkX3Jkcpe30tSBffXnK
	av8xSNTJG5xfzV8zuD4GOP2V6x8eCB1xEKdCE/zWC8U3SKXcU6DT/YAPyARnOB4T
	VwEzjqyVulbtUSze+9WUQqebcHrTd909jbld2fOTRz08Y1tRkG4K0aDLJS0VGAtW
	P6dPjB4/CZct+tJ1/qMQUxutM5agPi3StylX7OOgpDZBbqIUdcGPqv77i8Zt/xoE
	KwRQ4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rjgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so934790eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559479; x=1795164279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=iwN8MxQ2nacxBJdnAKNmF+qjSyInIwnHoOk4BS1w2/0xBqOe/ig64jx8UTItnG+xBl
         +tBGE3SQmhVobLUWsdXYTyZRO4xppDjLY/e5mcmRSSC6e02i1JhPM7g0R1spLiTjjr5X
         P9gobvE9M0kpdgO9KjCfEPJ9Slxo6FYkzaqQ/sI23S4H/IicYIX3LROsk+VS9b6k4jOa
         DRKceva9GBXmn2bS8VjW31TFpz/VSCbUAtfhHfw+j1ps1D5GhNSE33VkTLHBuMT9Xcao
         J6JMG9LsDqSc6CreG/WbReXO2FZtZ2treeL+yENT6AqGLuYk05LchIysZmfAjR4ARsf/
         3I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559479; x=1795164279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=tcAmjz2JE+70CV6rO1EJstc+rweJ8+Zf+PcuO6iKVYyNjZM2tqX0LMPq+p91ifM0V0
         23qeYI00B6YuxGz78xwzJyFUW7UbswM4Tj1ibIi0wIuwfmtBaVjKghdqOK0IvesVshtF
         QKax1YA/+yjjxU7m8/JKQsuBzKXHyxxujjirQFabGFFzD09JA9emNsNzNBBCNGWC/Hid
         i8FceQLFO7VAliM+ai6VVKLfAcmMRyow8QMLK8q1zFJi2AgtBRLDBrmCRLQ8oZi9lOOa
         1GQ+PsOcwSEWATxTmRmM7KY458ckQcgk/pA/7QrPRxUkFex0dQuxQ7UoLVoRoYqLnm8i
         NNvQ==
X-Forwarded-Encrypted: i=1; AL+hErGre7NpsJ4pf9aXn7MVIFZ3wBLGqhxz+/YHFPMZn0oWDLXSD3XSAfQFQDU16hbjsyQ6kfE1Li0mdkO2ddqL@vger.kernel.org
X-Gm-Message-State: APuU4Z+r2QbQpBNJDPg0NHugUxXU602tI+H8hY964iqqZRL8qAjGojaV
	S3ixpSvhh2c/jJ6fc0ERhney+q0/5hvdHzGQ/bYhCKswtWRVz/POklFqvBl2V6U6yOwcoK2w7HB
	ynQQ4A2CHogBbUCBYZfusRcy8QTLD0u7MXD2DxWEgZ4Wji3L9bKH6c+sNqDfTtANFzuRCK5gXWV
	Lt
X-Gm-Gg: AYBFou0W1zECAtkaDIew7I2Q3A92t0n6z2KI0LYiTlC+E/kigFqjv7aersWHVlw/kHk
	ONwRVNyq5m8S6zJjvawNQ6xIlhrwqC26UZJBVoNv88wLVIu3WuaLE+F12c/8RevRTOy8br70w7H
	2pp4EXL6NnvSTPS54PEvop+HYmLnCBkJfVnZjRWhPPaEG1ykMZ/puSTJhAA1RipTyUOqytVAe3Q
	OgdEKPdBehtjEQewJOjBt45VsFqtZiJuAQEr4JKJjftNiZB/7IpI3T2NndH1I/VdlAm97BAt7gc
	+0YC3Uq3BF+ANlgk47C9uUZosGdnSlD75QOevwZWqU0TSDXwOmthlEJJpfgzb0SSjfN3SVUmIJE
	xhiHAJsC1Dr7iN2BvMuu4rIGONgE72ljlXtxQzYx9BF7rvRG8IqswY5x3vZcEMDohoMTZPuAogk
	jFCEI=
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914360eec.31.1794559479143;
        Fri, 13 Nov 2026 00:44:39 -0800 (PST)
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914350eec.31.1794559478641;
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:46 +0530
Subject: [PATCH v3 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
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
Message-Id: <20261113-thermal_bin-v3-3-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=1843;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=vwYmeuoZ5lHmVqk80h0qWG19XZnP39VU8XyF/LOm3ZI=;
 b=aeA7dvyrgX7CJFxmnzCADaVvcpgLvAr0AI7xRba8QE3wF0ZoOviqkPIDA4JfSv+d6Cg4VR9kD
 zLlm8CYXaUdBHj7wZgEROD0Gvk4uUyRquehwJ71pl/N8GmAhIHlkjNb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX1xpV1KlGBqKo
 22BYG+vFP8lG6iV0QBAA7Igoh4MuAQRIAC3W5VEQGLIf/Ou7THNSNAWuPfaZB/TuHylNc9NGA4o
 Da1efq9BFh3Z7CB+4+6d8anlYgfh96dnt4zBOHZpRilFRHZT/qbydkRyiro5zrIgWnBSlwMIUKz
 D9I7XPwiBbCijgKAKog4QNaMn4nDcOkVmHeKjVAIOVsKcIpokj7Wg6TO1XIBWKvvRdqEViPmfEr
 JFmG48O/jiq4fW91JLTUvJvAqJ+lfP1U9OrbISX4Wxzg4c+R8lt6mq+0LLdHKRbctqv7k8VQXva
 BfHbjx3cU+6qbK72El6X0FC5gy8mxFZH/617U7Lch8KvaNCP7xUN5FeJj4UQUWsLAri0EYKvvW6
 Vo7C+AWHHnuraOw8tsHIiBb46ldQSaNWV5ruyQVbQkaZ+L7ROL2Bft3RAfDOUfA6Ps4DnOENarm
 izJTKBbYC3pw+J3G49w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXx1gNjHHWtKJd
 2WSrZA4fGDP4K7mPKbh2mvNO0M/vebOk3SCto7cG61wqArfamcq00Dhxp+NQKVlk7Ukcs1Glge1
 V76dcloEsZzNmky6JXK4QXH5A6MJHgw=
X-Proofpoint-GUID: GpPIDuQCXshpa7La3ZrNH92fJ6sD-8Ux
X-Proofpoint-ORIG-GUID: GpPIDuQCXshpa7La3ZrNH92fJ6sD-8Ux
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6cdf8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..e72d6b8b657b 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -66,6 +66,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -245,6 +246,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453013;
	b=TLMPbwlq9zV9ZN8VeCELzRUS1fE1cawBxymS2DQzSnY+Fi177Pkr09pi5EWdhU9XD7Re
	 k9JGSP1z8yqK75xf+SQruLaoag9nbuM2sl9ZzLjTUsI/MIKAHWoGt50h66ZFAmCamMSFx
	 XKEWD+MURQrvbFWzcg/ImLUJrMdGUy+RAmmmBzrGbgsVBC8kWd3KxHkhGxMBbDw2fHfmn
	 QupU+P87IHhLwJHp+I/XzvZdAWn2br9wFXUFYke7zu1FNSCdiU+ewHXYypwgdHsn3xsUf
	 XmLxn5mcYs8gF0WhS/1xO32VKXufrD64d2Qj4OSOTxn2gtu43Lom2BH9f1LYvvbzFoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
	b=fpMXD3uN8aGddPS0Avii+i0/5f0F276HJsuTgBNkkwuSCSxEmn8OKHRP1fB43bobl1kQ
	 ESE72lC8L4aJNtxAxzJJXgM5ZEAXDcTOohmkWvBS2rki5kdnhujtv3AI+XBhCHXslIqmX
	 ZucwXi4hDBNATiupxEUACd2++KLAPP+s88rHCuZ8uRoVN5FN371yQ6MG835ZVnWFhwiRR
	 gT+LYikDJ5+jUO9vBoz5KMxdV2nBB0d7zHKHp4hhYcoGFzxis4koj2Kj6p4Gw174fdwFm
	 MFs/tP4G0wZSDcVTLezGZX7wINkzNgIoS0CFQVqjPo9n8E/Xiq+EJ719Kt6NXDTZ6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cfWAd/M9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FE606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfWAd/M9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD030w3174210
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=; b=c2rYv4TFvpuDjNPm
	KvBMRy+iSTWSiOtIftr04F/V9HhCFxI/wLZ5yRWabtjLd9wLXBAl/7Vc3rZn5zCX
	jXXIvXn/t84nHzBCkyF8HgPNwXnG/Y7eJENNVAs5rwB56+KB4t0xPNB/o11hxQYN
	Oh12Y0z8QJTPo6xKslvcRtLnOJEo+7Bg20vPDnHegfJ5pF+9FSelZliEdrQc3x7L
	bDNLoD0keSOm77meQ5U/l0vdLdSZTm+Yfz1yXmOy6/vcitj6cwse7bR4yP94pwGL
	9u114U59lxpImBxyx/ZkVU0pQhl+OQBFvSfcnNG+L5U47rIkyDvu+aO6N6WVVrjv
	32whcQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsg3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3045789eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453012; x=1794057812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=cfWAd/M9XiKmc0YsI0jZKS+fXOdzXm40BCLWHLhBivjVDra++ShmAjQcCr7slyqC12
         +7slbV3+R8iKXAtcCOvUyEJsgM62mwScqK/iHHtHksH5fONQvEwAIfhZD9uiqoYYFYrs
         xoIjQHA56kH1xiQuraYyXLSdiabtBpLBoRHHruceEdQGH2FrsrKSfaaPDUjpoiwiaUTH
         91PGt+OF6JWMHQ24+FLdOjQi6xDaYNj5Y4WKn7YThB+0ZsPIsTp+5di7pyzanIFvB40H
         1GsLG7NJL+3puyzwmkfIbrbhwv2CHFGCw/t4H7WZt4IYA9+AHvlJc7oZ12BoIUF5l21S
         OKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453012; x=1794057812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=zGp9dNkVDO5BGm53GS2dtHm8Q/g+B5LxgxgkNm7sLGC+VlJaRtPxUNqmXT4KYw+obN
         dfZCYt9TIS+w25RHAyRipoXiLCW3bYgf8+4EvaR5+q5/Ja5Hg7QDLGMTuccUvo1i2Zaj
         WmCQ4Su2CHCleLoVuSFmUiZvlYvYqNyN5F97K6KWEq0iQxfkpTAigvF+kfIwu8yQ8hvC
         28LNcv84kYu9oO7WkdLbtlHgJnZL4xVIOKot/wbdVFqLCmkLV1UNLuk9BsuIAPfs02e9
         utHyeu1PIuvcgcv+3cA20MUAsyHfKlcGB2XDIaL/Si19qZbF7ymyt2rzhNwVelKKYr4g
         ofgA==
X-Forwarded-Encrypted: i=1; AKwUvBwXwBurVC63Z/eyBtauGaHOKEltBDTDI/L9mCyaYSSqg+jGhB0+sUY9/Lfnky/KaVhbF1FgWkJpPXdjX0Cs@vger.kernel.org
X-Gm-Message-State: AFq9FYK6PTXar/DmLPjsxvfne1+8oLIZ6twWX5QXKl+0wect4uBb6vu3
	xyTu8Ui3nwgtYGH6taXny2seWNDSR3+DlKpFdgsvRn4nn3HGwKlrEUn2LiqAL/xck8ntzspbuwQ
	2wV6qIMd6zYLsA4y5kY1p7YiGEodZRQoX+R8nqUevZYaYbeG7eZ6yilBbh56EDiXFHWZz
X-Gm-Gg: AYBFou00gY6KtJ4t1jU0r2v2wXpd0E/VM+M0+Mdt1KKWIQt64TRL/Gi+VdzU3BLRAEN
	gnk/GmdlKB3f5YfwR0IkG5eWAVVBwS1Qf2ovwDxiQo0zZxknT9sB1VWmmKzaPIIcv2uzscgBWL0
	4lJBCaM9nrXNOIJ2XLu5TDtubWBg1OQ1V3Fr1gC0+KM/7McZfVDINnPAHwg3CQp+3aVMx9sR9nf
	btjjqyvm/eT6pSuHJfiQUkN2c4ypp4Yria134xwiafjJj5jjE0nEjrzUgmCpVI5S33xgVAWu+Gb
	M87ro91lLtu7svahZtv1ZUAXuMg7yG62/Df7/UJVEeGJLMMd4aR2GiItmcjZ4MQyuxD7SN0BYNH
	hPRHvNCMAAWs7ewBqGYicaq3oXpIJOjvo/N92mqho9NxS0FylsoujVnsImtAul6LNn71UE31FpX
	KFnck=
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447680c88.7.1793453011924;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447639c88.7.1793453011363;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:49 +0530
Subject: [PATCH v2 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
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
Message-Id: <20261031-thermal_bin-v2-3-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
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
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=1770;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=TcfZeA/waj0J1JOXR5aaLYuqHVj1MdThFVHzlUlOpuM=;
 b=3Y/Y8DbkZHHp3RmsPF7huUN5sZdXxDlrfYSb4AnGAX7ah8k0vgRRAhqdE3cqbDQfR5sGu2+PZ
 7TYJIsaVQ5PBy0wh7txpYwXCTPVpNpEBj0EUwzhS/kiaSbYPtHjVPLc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX5I7WyhMeRd1S
 gTdvgfKzNu3vQQfU5DI3WoeUeh0kgPo4gNp2+S7pIHAdB2MV9cTiP2Mna4XjmwQneot2wdwfvT/
 i1UOA7tKcoWJjmCYQZUDUYo2BhKhKlM=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5ebd4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: O9rGuUuXO9BF2V1Wg7cFA3uF3ceONOBY
X-Proofpoint-ORIG-GUID: O9rGuUuXO9BF2V1Wg7cFA3uF3ceONOBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX03pcT3mkRfZd
 DCFbw2wFVhhhQ1Cd+pI5U833sUIC6ChTHtS/qD1oQeX7dnTU8MnJZ4cO1k6AO68P0a3mILYc4V5
 +i2zjP9T3jhxw0yLc2V9SyAhPiIUNy5qOYz4xdoWfDC0Wf58Wq/fMjQi5DZTYTQ8bboiqqRsdTy
 j79wDynZKZW1u5yzskRG9AG1PhEzmPDWcANfdqsEu8ulcPSS6pH1HbXQuWJCybd4Y/LQePrLyjf
 tU10m2PZgfN3zsy5aos6sVWE4pcg3rSXAbEGrM9r2MDveUNjYjkv3EGL2qH2Bo2hiwWhWWMWf5P
 72wjkJ1vyLiipDR6QE23qglKP9csAEr623IyOsx4DpyCb4X/NwIOloNz4gbjdTDaKRAP4S6/F97
 kKKH4Z8uBzBeF5eC+G5d3QOXwrg8BDIU764Brf7Na91xF0Tm+Fd3HzgtOej9IKb8KYDq38Y0t5o
 22Ljl39Vaib/jSdcALA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f7673e730..6899f07ec218 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -244,6 +245,13 @@ properties:
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


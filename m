Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412630;
	b=0yGPydiUf3oZ3QSygboqHciTXyrXy2zbAyKpyeZbQZ65fZ3nSz7alQ2M89IgvOfSICHp
	 NafCIekosC5zPRsqSe0BswKpMrUvsg6yReE0sCsj4rzJ16zLyHK+JBAeG7OX5Zeo8JMgx
	 pN689xlAUPaYgTtqik6yVjVQ8JQusTfv9/685ebwLt3o3bM2xSudA6gX+aCw9Kb2jXKPe
	 hYZuIRbWBA2gLQ3hu0/rzgkW05cEbP5nK3T/QF4eL/aASVYtksvzOo9YwIW+HAACdEmOs
	 t+FfBDtD71Z07hiS0a5SS5EraQdBEQowp9GkZq5ngs5CahiHpJbFU33TYLM8XqTZhNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
	b=vzzy5wR1eTLEeooz095uZwF3apmLB4wlY3nzBRX1R+rqKBH+sLwtE0l7vEB05Mwsxv8N
	 w4I9KMVvocFYwfeb0H95RA5vbYildmnfhqFrOv+F/94KIif6M11r8p4HVRm9A2MuCKWLB
	 7LtJlCzSfQLOoEoUKOGlYRj0ZhBvOuay/z5WKcKh0NFxgiUlOCgg0ElFJawCL39ZpNJg1
	 8dVkVSHwlU3hhLz5opO6fm37MQHo2eUpG07zy0nAur8zcrPtCeF6Fn+4iRx4WQQbkbmWg
	 riar5xP/o+NKIpDQFC4S9Cjxt2SOy5fuPTvVrpndysJWkUn6B/RXzJP6i09IyGZfXDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gj7PDDGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChALP+Ld;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528A606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E528A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gj7PDDGl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChALP+Ld
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN519bT3780385
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0osmgC1DstGd1y1nAh7cAx
	aZuBJSwuhjcMY0eVtO+uY=; b=Gj7PDDGlAPl9p99rK++oP+UK3dRX6sjFkBTMLV
	cXaX6DSsZLw0cg9OFh47Dy/VuLALtyC7p8RUkp75y1khi/RQpMcSoT86JFTRcniD
	X0pzsztd7V+LjrUzJeXveYNGfX0tuuD5zDaRq4eOrxkTaBzCrAi9lC7Ltkp8JOSr
	ZtAihU8UR28aksVyWByF5QmMk9LQaBQSwpWOUaPnrbuxm9cwKlmtjCWUoHVkn9mo
	MkpEBpCuYRhFxfB/uKd/NFOoXiPZSWvYNkG2jntgMy+os1ctJ/E7uCXqdTZjtcBy
	hlJGTsFk1CTqFB/v+WaxyDyvefuX4nn8izGBvOOms1PXqyHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk56fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:43:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1807923a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795412628; x=1796017428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
        b=ChALP+Ld6MLqOLNA44lAvCHCal34as+RGr3/9yHs+3hGvDDZ1dktE6y8d4o5haLoMY
         Yw5+eIYaGqHlINdchNTNOss+PluUrIg0BsRe3VASBEzkyIuWVYnlSjIZg7/VPmw2vr6C
         08EQumryj+FH1wrrOVgVDxiqlYocyZUhc8J+9t06/a1OL19sd+GZccA/YMCF3/YDHDgd
         2mDAWidGdJUHDLHfat/XINF6TzotTN6SQBff8Z4BQTCKyiJ2jEoZ1tFznMC8jUbpAg3H
         erHEcxVEo4zMzffKtcYe3cdxDkZ7KR6ruL0CxljBu3MJG8qPWychDc2D9soYe4rD62d8
         YpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412628; x=1796017428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
        b=BuDvrJMOfpi4NgFdbKe4Z/+YSAizVz3/gYxtwHu+NQjccJZ0M7EJ3+NiYgcaChV4oe
         TDpG/t6FdF3KVr6Bk1fzInZgy7UZ1ZLcHWQVasZB3WmxhE7E321vUY5lNwxL9kABbNS+
         ZU0VXC8S+9yQNV4MfAcE3m8jJYhPa9AtfyDgOoa4/WdRb4L4QgUatkldmxtVN44Mq/HZ
         I5phszjODXD2eusb4RWhmv7Q1+O1pO+DfqsCaRLcgnqszFFo9KJL8QfMSDGwnbnQsu86
         Zr2PD2vH6R2+rlSrt8t3EvLhRD/+FTuegqh/0pvYLTB046WVy6mO0iCcyFZZxIRB1jXW
         FvOw==
X-Forwarded-Encrypted: i=1; AL+hErEsOmk9xwi0+Ja+9Qh5/jxbXDQVlxqlSCX9Nz+OgtcVGYjIrHJy6W6eN+rtDUlHOKrkm61o73UPuagxlF7n@vger.kernel.org
X-Gm-Message-State: APuU4Z+kdlyublX69ceyYM37h8O/tqpgsfnglnkECuAvKtKXcg6Cq0sZ
	leAcWBmZ2oZNBGZ63JHBbdSui7guU42OKMqHxNRKaoa1TtUSKPqAGgWo5uqk0RZMrU3Q8sxSQa2
	CrzJehJa/64P8bu+/37hiICw05YdjnJ1M6+yVAtb/Q+U9YAFbJgFfr5MT9EUZUU5WgM9w
X-Gm-Gg: AZFdTZezuMdMi2QRvD9khv28vq/eWk7YLI8qRKiX5P+AJRtcbwLpM+WwgRBWATkD/Lm
	qgK8i0etq9yj/h7J4iSqXi2bPhjVsq7aqf6L/vpHhS1nnRDAxBbl9Gb80FzgzqcrIwpMy1asjff
	kFiTJVHHjfsiNOozBTUBV/abh/l22ZFWlmGLpW34gRYjk9v5V3RTEiOadyAAxN9NgVl7kSIY55X
	T0N+pZ/BHcPxRM+vntjt4fT8DAb1X3+4IBr8N+HOZmarIZHT86QSFMd3ENmkxSoWqNfVeEY9of/
	mjPo5ChvqfmlSfqvmyE1820AArO500P+qzIiHuTv9S6Z1UFVJgLKw4o6MsoxE+5dVFSIGy4NJaM
	sTh0+FvXoeCvkP1bxxRzjPot3We7d2ZeyUtEAhHbIF1ZWyPl9o+AzD2fDN4Uwx2EGsTNIYKm95O
	UnCGFqxL0=
X-Received: by 2002:a05:6a20:c887:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-4014c75736amr10292975637.21.1795412628257;
        Sun, 22 Nov 2026 21:43:48 -0800 (PST)
X-Received: by 2002:a05:6a20:c887:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-4014c75736amr10292953637.21.1795412627789;
        Sun, 22 Nov 2026 21:43:47 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0332bfsm4661196a12.22.2026.11.22.21.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:43:47 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:13:36 +0530
Subject: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
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
Message-Id: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIfSA2sC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3dzEzJxM3cTSlMx83SSDRItkc0sjI6NUIyWgjoKi1LTMCrBp0bG
 1tQD4VgG/XQAAAA==
X-Change-ID: 20261120-maili-audio-b0a8c79222e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795412623; l=1797;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=6evcSWnAG6J2rcygiHErNQlDy9pm04mHhsO8vl8iHbU=;
 b=SpBrMNlIRUPyZBrBiM5XIJoS6tA/uHOmV0Ebgj54k2alaQ4B5VJQKSJi49cSkEDW/jd4SNeqd
 cQ6qyMQFTWGCYb3jVCiqxzInNjIigREifwArQDWNZrKzfPoia/qUPot
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: 7V71Oc0nIYYyudh6go3KWi2jrdA3wetZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX2YSonlbBhHas
 izd22ZfLi7nPXTFerxN5501ByJD9SeGz2R4WxcA73zpOR/KufTonyeocUZTIKiY6e2eryZFSDiR
 iKd1m9a7h99v531yMwxTE2BOPLTZFjSQUygaWxg9pIxR5yVzBHYS97+npPJ1bARjU0Ii8xMAB59
 Na2J9d7WG8g1WBypwD1SWfhx6FU/bYsJUEi8HS+TRNloBc0gBEIh483aSZtfAunrzmlG34uFAZy
 ZmX8EBbK8zgkxCdZ1a9UZV/6+yzrvuTh+jfjm+4LH4DYNDyfSknI/Wcifg2E2MzMovtjBZf7KlD
 aPIodlmJl2ReGFbFSGlvf/hkd5X51d4EwV2XR0ANmWfr8rsbKtLbikhwvdfGMAazs2RYWWAhJ1e
 P3tlMuZpd97h1cCsdmNMzy1AHHRqBFo9GHkDuQ6ljXjTHO6A0DJo/aUHHl3Hxcv8u+0g/LxnjOL
 O/cQXLcZJrF9JFiG44g==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d294 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX06dAxGGvOq20
 uv/bOugovqWzb48+pCHbrr6likMV1woa9kVrA+v3FYGnq2qA4RPVvxLTLqqaKAWEnCx3gL2yt0H
 zEgX9v0S9Wy2/zfyAsU4UsYt3pZYjus=
X-Proofpoint-GUID: 7V71Oc0nIYYyudh6go3KWi2jrdA3wetZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230022

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c..081cf052c77a 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,maili-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
@@ -429,6 +430,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@bd500000 {
 			reg = <0x0 0xbd500000 0x0 0xf00000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3917,6 +3926,9 @@ fastrpc {
 					compatible = "qcom,maili-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-maili-audio-b0a8c79222e2

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


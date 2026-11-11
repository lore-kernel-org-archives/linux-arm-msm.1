Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369658;
	b=d90xXVRsnNct+RdeyZYrA7viCjRq+gbWlwlimFpJLvT34g1mBjFbPavtEIb3/aRVUVt4
	 YBB+sDNyk2wyXkavPFYd8xXk/grHeGNHnZZwENjJmm33Qbfbj2POdVEID+xzKMtdTanuB
	 cA4SKzv3XptcRvB3AB/jGz0rs9eUfdejiZepeShnN6qdCNHH0q9JByOaWS6q0FFa26ZKw
	 P06RAqTnQl4G3+Pf6qae9iNXHq7Q9jOWZlb9kSIjN8+j+LiYBmBsdOU3VF06Bj6LkuJ25
	 8GJJHAcqra/GHhSezDKuOrR6etirfZow513+OsCajygQ8sYbkmIzTFvtqviws0bzU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
	b=KIPznqa3qWQ4oUGL2vd2RFGTu9fWmWwxfMtPdf103wEcXE+O8DUMcDBjBkkiqCxzdxIA
	 inGuDun97WDt72JQkOsk5JZfoNKrXYQjz6G4P5owPJIzRq8OpFI3U+Mo1t8xZ4xexDdyc
	 Q7J+ntXmcjlwrc2lAEOgFyacFFFybvKAduNytGk1U9cilTlQZmrUdGHTkGchXOyzmvY28
	 pHN3EEu+T7tRx2kXch0hJEiqKRSUqwWq9lFvz8tdEGegp0hDbpWX3IdK1cTPmtaDTMTnR
	 er4pDOyDP4fXkO93GwRXQGfhzp3AcQOPIxduYmbLywjRsBxDpK7qW4BiFDASuj7WwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F260606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F260606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tEBT605564
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkGH9AI6RyG
	CV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=; b=S92wpA6lJb//VFKzgHhoQ8muAAY
	okgrOXFt6VZMzK61bnNL1MBmogzJ0CtYnGXJbS3kfTPSSMUIRShGPrnGVVbdprsk
	smO+zQhEdnpKMOkEdy6xm/LFyNxrvkq1d8tcVE5cImCRywtLa7XW9RC23hTS4HZJ
	DXNCRoqR0bvPXb+5HA668FyGxiWRSYGm1AAwlZy2LNgMB5GcusSI1x21GTOq6CoG
	w7RO9zL69mvkE/hJJuSx+1ZZeZZSYEjfca3E6tjOwikM4e7KUNaonIkcHq9MROH0
	loEiv2KRDsdVF4LW5wSmii1WtHxMdXWZElCyGcayPAxQFpNacvj+OG8GmYg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh0pf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5682eb98dafso3056594b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369655; x=1794974455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=KojOAPVcu/x5aYHgT41UroPAOQ8QczVP6Y55t89c2IIZHIG7X7FyDWPQfC7vi4vOh9
         nqV4tf/HUbPyQDm7nmA8lL3yywI4d3C0nmJ67PF2pJmmnHtVh+fGz17Nrcarl1zv5YRf
         SROX29n6XSe41Su9gY4T0Lg+y02nwuar4/gGnriHz+1RBIj8BUYqD6m1g+5yP2YXuqut
         9fSSgY4rpQHQDEyNGrzZqO8j/z1G5klfBPdx0rEJqNFb/36y1+Q51T+lIbk+iDMh3/wc
         zQBO9k4fzPoI1hgGFWw4/oJOnJwVgtxErxeCdT7v+BMHRLkbTfNpxf4rjCHHirw8V+Vl
         CrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369655; x=1794974455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=C3wR7T8GTaODZXAuTjJvG94rRXFxkuj3u+m4ZuoFJV2eyTgqSXc8CHJQd0Sh3iIAMa
         X1kYW6RcU8NlNN6zvrwySWOLUK4fQGi0gLO9s4mMIChLDpwZh6JnozjxU2lpwOQfvIAN
         o6ERwZi2O05GorVCqy26mvB0hvp6PwV+/UtqPs9FsB6UPQ3rk1yGZC8nUFVXc0OgMNLk
         9eDBZKxFNDlDT5PmHuqTB0TNUDatCyQjxSJf9Bi3ARFQe9BJQBJS4UJJTtyIaTSIrLFp
         piWPm139h2EqB8feXGW6Y3N/my2L05v2QxEyaIIA1AwrHTSxzu1NR8uCH1yLRy70Ef5b
         lRyQ==
X-Forwarded-Encrypted: i=1; AL+hErGIDbdb3K/RZNLSxTBjoIuZTnsEmHul7qeMZCHJfDa/pHYtnHJlHNCYSKd8eZIcJCuBGRbv3xX5pP6cWkPl@vger.kernel.org
X-Gm-Message-State: APuU4Z9GwrrQo5dM2ZfK1gNyaZfT8AiZbnceFlXMs/9ONHKusQn6aW5t
	bY7KCAJYj3X0s5JSy/DgYC9M99S7Z+ISpo2T1X1HoZEGWv181+8f1zp+MNQg1HCkjyzZkeW7cpC
	DbVRBMFSAQc7/2MAcfbvGu/MsMRPQJSMfxOJxJmDrS9SdULF/L76PC+/FJj/vGJuASnuo
X-Gm-Gg: AYBFou3pvnfi7GaPSrmnwhyYLJ/5ct43Zp9ji4SD4qbpn+F3XWkXcIpqfl0CC1JEaaI
	vjqSKTlRMh1Sp6dULJ4X1tJIq6mleo4UbBn5E2DcA9U6M+jY1d0xnU0/XDdK/Y8NMFZ6oF/Ew04
	pVAaduxRv8eMbGePbyn8RsLp3FSfhbsFZENFPkZ5sokq/kgCqSQPoDwhO9+6UhFqBFO7FDnEKSE
	zzCJ+NBRRmM3z0EsVwfrx2Yxs4/VJO24jhTYG8Ow6WPkkIeaj1bgPhMWRmiEsmMiZvsDfET3/9j
	XtHtPcLBaQNWjudhE+O8Vmk8JUSoJYjrlzUWQzZFIToLdR0peP8JoUsBk40YxL682526QUsjYMm
	op3e2GEX6rMIbBnGFqUV5Cz3jdfeCz+4Pta4e5P25bP/n6XGH2e5m4w8lKW+Xyj7LnmopCAPGUx
	7SCAlvJX/sR8Z3SxEUsHCqiIlBNHLEFcjB
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956157b6e.10.1794369655439;
        Tue, 10 Nov 2026 20:00:55 -0800 (PST)
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956130b6e.10.1794369654945;
        Tue, 10 Nov 2026 20:00:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:53 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Wed, 11 Nov 2026 12:00:20 +0800
Message-ID: <20261111040021.3636059-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
References: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfXzrWenoPBsghK
 ORLo4zlIVfnPf6Uz/JGDcT+Z6qo0p2Qa4Ky61n4AjWQQNzstZXh1QdM0tgtnOQJjB3rXI5bOpZI
 qbhTutqWJo4Eaqcn81DIZNyXuGykZW4=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af3e878 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 6HalNzYYAVceX7kj5L5Fd7yi1hvJd9jG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfXzBxdEiBSH2Pt
 qHLkMGh4qwSNU8SiESiYpq5PhrSNIvzoJIMwVRk3vocUXEIWU0VVe197IMY1ZwB+IhDcY3Fwbgi
 xwp9Duzqv0S+aNpdpIhb3KqVE+mWVU0Cgu2ADPqdVmfFp097f17VUAPaf5TWK8VpPJg4tHuaVrM
 3fXAcWisyxPxOGJY3HhYIGsZ+YJmP6dy6WWjoPc5mXk9jL066vUc82u+E5rYkg6L6Q1w1hfgL+O
 NYUCMu39fzJFnqEkqj00xc9bGSLIX1Jr3K8EAUp9UWRwOJKpvpMq7tMA306w9K1wgIEBoNBQ/Hm
 T7U/dobEP5PeSgsLLxSYFB9mLAEUUmjlDkUYZgx11y/j9vuRKmhvifoQkXCcBP0ESKQut2spo0N
 7PojQ0kA2UC+qOk5HzK3cAFgqR/0NWWoUyfwxUQYQOitKFSYekFIQUgHv7+LIlNF8V7B/zYgQJP
 o2f3yTp9oJhTmhxfZ8A==
X-Proofpoint-ORIG-GUID: 6HalNzYYAVceX7kj5L5Fd7yi1hvJd9jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110015

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..ddea691f1c6f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +433,34 @@ rtc@32 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0


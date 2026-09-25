Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928C46DFE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322720; cv=none; b=QFYjwSlMC3JUOau5wp4qjpgcNZgzxHmONSCSCpxt3SXaPiR9CDjae7DRwEd+QzfTodsF5luZAsVwl+CvC0n6ORXmBWEthGwpjJyMzXSTuCZUvDqslUcz/QTNrQNCvQdBPntmy0dxDT5kb9tNbYYVQLLSc4VSh2RJRuCPjePRuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322720; c=relaxed/simple;
	bh=0auXRGi7BMPtaQirmtNCnRrzSqkes1ZuX2yTNpvvx1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DrsLVtjPW+lAx8W8EGRZ4EblPxI/rkWN0WY0rLiYl8Dqu7iNr2qI4oSfCg087QTK/Cf7v3u7AgEd3JDxmd5bjDzJtd5NZXiB6drflP+TXz8S6vLrbP+ZgZFt1kfC18NVP1Bu0El85AwZc+QUrzJGssICIDUEdDQhnzy+p1oUcxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlzI11XQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drD3qe8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlzI11XQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drD3qe8b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXFs289462
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jjQ+Wd3BPLE4CT4u7BQxTB
	OzgDPlmy4zTCF9SWKHlA0=; b=hlzI11XQkkrlogl8W9KfpSealGn3H7Ya97ev37
	Uvpnqpm9DxzyGiZUD//py/m8Cey2y0WhksoWA1i8F2c+A6wyTxnrysQ6ePQ29DWa
	S/VY6FcGpF5lJGAwhlFTeND0wzOmogRzwwHmv7RTp2WGcbKHBfZ72ZExqNuvBHub
	lTixoTHk1bwwFvh2TxEq8569krrb15XIuruqeKe+H3STOtA+YhkRLO7y7oLjidOX
	fCjmSaJ/ed/6Kj60i2C86lSCdagwlqQUjEwplkcJjEB0/nPsCXlWIjphg6tWyiqr
	X7yTCb3W8dap2Dw3gD0vSwZDDk5bP20KzfqE1So2mDsFVadw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tkd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:51:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso176754685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322717; x=1790927517; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=drD3qe8b9Fd0QbE7lpoiXfEcPdW0RvnLrssJTjlRWxBM1HZaK1dARZcUiJo+YBb3NW
         GPMrch9Axs/9nJvpkpmBh7QjBoJnbfHqqv/allTqLV06V3qMfH1Mh+6TQ0LLWlBSXZ/7
         ilYANpiebo/gUbOoVPW4JOx5KXmAiFDIBmRnZI5U4L0c47yD269JHT4ZXcOudNtDOlQX
         Vp2lbku++4QvWdCvR6lSTxRY2Op3juxdM4im4iZVr6my0i6YQAFKJ+5jn9vOlYg+3gA7
         nhejt8dcyFbtJrP0yl7HBhZoQQXRjTQi5JKGxH07ml7WZDu8w5ZzHxv+TaziTpO8V3HD
         xnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322717; x=1790927517;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=0IFDsvbuPi99k+6VEFwv3H0wZBFr2e2mz6IRWALgw7nsFpf2fOmxu5U4zwU+eUIKM5
         XGjcDjgpu60Vj3Wq/RQyyty7hDOWQMgE59BJNp2k2sMqaX7SAWP959rYUp1KraRH+ZH2
         E03DSvt4CPzedE6UYME3UKY5CQj8pU8PYW5DSkrOT6TvSf5UAXck6R8cH3230mmT8jTJ
         ZTb51J3T6Fsj1QOB1QOsn9h3XTMacFVSEECiCNJ3PxSzWekkzMkOYt0QgmtH5SUzCsqB
         LBaHWBwi199Aier5tK1urSOCAjz5OTs6cIxKKvZQLih9ytMRT2Njfzrbj47BZaJ+zaCn
         udMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTdPkQj2tHeXjcMhAYzsui7+ERt/te83QTezWq+jjNssJk4R7a0QNO+DFmcvBu58THq2BbmxfvMKTnVPCL@vger.kernel.org
X-Gm-Message-State: AFuF++l4Lx8Vxmxmmtp0zT8cD8U1o1gLEuJWbCm63QfVaeXupulaMyGb
	NcokVSi3PJmuWPQusJyEIsPFWLYlfjmvuBNaMKj+dbLaTl6FMbpDrzYHv0hrcGyfehH9ppnXKEA
	eYym69uVSovSK+EZww5Vk56tDeEffSSzoL0bDBV/uXQ+ogM0znvQGUN3WD2lXRKL2YFwU
X-Gm-Gg: AYBFou2xnshO3SvI+2+IbAUYuO+1vKAwBJyj6cvMUiYDTlCsTOvj/fdgTEoxrxd9isv
	dagzY2Df3cLlcZwp1kSVlcoMvhvpDpXbx1kZX8vsyKdo5cKK2VMgaydITDO/f789mbtiQ+QHrcm
	HVuDlU5Czv8CPfuKoSezeQWMQOXqM972/It6OxMgOpDNFUAzaJ1Oghx/IZ+YkPiIhb8xBghzPDd
	xf+hPwmdW7c3zE8qShqz1753ZZTXyjdEzxdvreCDomwB1ahJBFhmh0qocjwSGMtz+ruFpbr90fQ
	WTuqousDE7vOQ1c/PAnIGZkHUrv2jiLBOCXw1tykuMB3f+Xo3cEeRU8fF3cUQDWIcX7pyinmFk6
	MZA6RZM2Ud4kRY4uBGTe2yuZ0Eg3mOzYNPtdT07aTeAavz8+oht8mkcwbdqc6O1/HRnTDu8vsYe
	J+u+uInQR5UK1teM3Nqemvtj40oaEm9VYOor31LsfZn4pNxJfqIFc=
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287272585a.61.1790322717538;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287270885a.61.1790322717113;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm4797443f8f.9.2026.09.25.00.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:51:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:51:55 +0200
Subject: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABootmoC/x3MQQqAIBBA0avErBPMIrSrRAuZpprNGFoSSHdPW
 r7F/wUSRaYEU1MgUubEQSq6tgE8vOykeK0Go82onRkUBtl4V5nkuiWo3lm05NA7tFCjM9LGzz+
 cl/f9APxHsLhgAAAA
X-Change-ID: 20260924-config-ventuno-398c8e9ca9c8
To: linux-kernel@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6281e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=kvZKKbouJESGLE6z1NwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX9RBNf/MlOhHQ
 e03IXDXS8LZ4cA+5x9EN1JbtB/7O1MJjjc+CizYSMX8QXlRubXp3/BWV7a2MBn6oCqQ7liZxWE3
 I7hUCv+7pk47fVDlyRa08rLMAbelsLqSma6WCEfyTLQl4DOSTltXY7MiH9HzVUow0+KZxmk7Beg
 pQg0y53J+IyDYJeDXz4V379IfR2Au4SLBCdHb9SwtSdwgYIlbxqV1PTPPm+1yhQcoYrYs6QbdUp
 vkmgw57vRlyimUvQqWjrELtyVzoZk+MVsM3c8/jscCazLOSfUnlRlBN63lSAe8Opxow14Oy9Nri
 psKJ0J8VFZQq9FMW47+UiSpaUjvOEBu8BLRIwNOFy4zvPuD/SvxFM1gY+aVvyZ6P9/tCU9LYQs/
 u3SrLupyeB3gtRv8f07qjetb/CBJDGPooSXq/JewCrJIgekvqBtRhTISkAzZR+Ul3DlZ1G6TTTO
 sjz1G2ZHzbVF4f1QLeg==
X-Proofpoint-ORIG-GUID: ysRfMlwrI4RjsWBUSoLwkNr4TxoTlDsU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX5oI03ly62+2T
 XwIVjK3+ot/mC2hJ7lG3MYbYpKEuZTdWXA90FxYn3PNAb3KJeKmYkj8fCzCxGdyjIlP19qaWT2l
 pCGIcypVaQHPwIPTuscvczidJ/piQXw=
X-Proofpoint-GUID: ysRfMlwrI4RjsWBUSoLwkNr4TxoTlDsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031

Enable drivers for the EMC2305 fan controller and PCA963x LED
controller present on the Arduino Ventuno Q board.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
To: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_SHT4x=m
+CONFIG_SENSORS_EMC2305=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_LM3692X=m
 CONFIG_LEDS_PCA9532=m
 CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m

---
base-commit: b9bb4134a9583a388704433eef22c82c49963585
change-id: 20260924-config-ventuno-398c8e9ca9c8

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


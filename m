Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5847044B
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203162; cv=none; b=a5E0gt8Gqi4upYrzx1fDgL+3Nu8mO1rB/8s77cmT1Nkz+nbRffX4NKSN1cM4109/T9pw/fgTmJEE9rEXGH/KwcrZZYUy25j9hLgfT8Pa66I0BzgPhwd85mwoaCOUoA68rBUEMZtZ5J6Y9JcyUGmQUzkdHbSIzSoELJwZkAWbdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203162; c=relaxed/simple;
	bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRhRl2D0zRl2Ns30qXHERPnKAzd5sFRlYPgxtv56+/msj9biEGrVXB4OVGqijiFPpXh2KVq1G14p18L0QVcDz9DAMuCUpUUf69H9UOHHvD8rG324o74/1YeoPDTzbMJzQgR7FJ0XRj6z/DXkiM011Pc/YK9zv+8xeAAxbM07s3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGaJAfFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5cbMU45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGaJAfFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5cbMU45"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFRnH1294966
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=; b=jGaJAfFfrN7F68ra
	KPQWVWIDxoFLbcaQ3OM8BtAbkmLI19mxUXW20Oxn6guNcCc+oM94Et3WE8iHxvgU
	N0i9KHmOSXReLTir3S+AaPSwxDf40HmeEEOjb/bj1JW6sq+4hjd4pAG6TQSX5mCA
	ZtxSIToRP+AcuIiVRvVBIPdgT+kV0kjs6/gvj+9R2+Rigb4lIv6QU1BP03nmdtl2
	XvVOx4CRTgd/yUV+sJ92SDMEkdJxOWoObE8EUb806+sQuoJ9v3GEoKWKMojWAAh3
	euy0fe3YD1VU13eaGuJ8h8iDBQls0rO/Ao+3Qe/etML6pgaAiU5hUMia6u7/MGqL
	64+pvw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn9r6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:26:00 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-809f1af7992so3784046a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203159; x=1791807959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=H5cbMU45htBEgFwLg0UT3ML2zPM2R/mjQqUdaFQKLTRdJC9i1HqDlU18wvW8cMozzL
         rs6Jy0gJJ0OKE2tdsGx0ClzQ4oee9XwIkIwA9rrfIZ0BhJ27an1fBqByoHtylXIccJzl
         zaHlSoMmLY7l1VtzMShJ2TV0L3V3AGVodxaggXzqmaqnZVGjzDCasbm3gJPQpze/6Fdm
         l9Z1kS1eEvt71uceUpv6pwrbVSp+62XgiZ7Rl4Sgcvee7E9VhI48vfP7UdWeKc7pWkVH
         NIGcAzB74uv7xfzr7FSb4VNaCVY7aiocLak5lgOayxcibVZtJE40IuNjjCM0lol44IRM
         dCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203159; x=1791807959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=ECNkyBH5JJFL/Bz+JpIaeP8E1Fx4am4TDmbavUkBhPqMwrOPpSAZDkSjra9ky6s4O+
         LIZkalOOUl/jMH8bSdgSWvze5B26yErDSLUbmZjeKduubdb2Lwff9ZDXbZNz3tzxAXWz
         Y82ioS9/vcqXhFyg0eRTEtHPOEqpbfeCsKYcSMxFcgMP5AxCqchrbfYMPmBvUPt9cL8W
         vU0qaTsj4gZQCDmQktMp5YeUfXxj1753NiOC3wud7LthVpv+GLyrdoutPQMr5ZAdLdFs
         5FJISwqILUGMtHrmr37okA+Kktx0c1h150tKBpqZzCI8Bl3moHvb8Vuy/sR0KEFQaJI2
         YXfA==
X-Forwarded-Encrypted: i=1; AKwUvBwnqQj0/vWHnjRoTWd14UF6k675LLDVGOrLUuUfhPsVS+Vm6lPgWj1h0S0yrRgVqdi6F2ZiEBQgGXd3Lsvq@vger.kernel.org
X-Gm-Message-State: AFuF++lByt08jhU3Z+8+JHskDjBCNTBD+hlBwMJUJ75hQKbOeU0L4qcy
	rkM5G11JYn1vX1fqbTwxxISn3kxpUf5JcqsIY9kbTNeFuvLL5UAtVNLIP5UR8hqykY0ek+2wKFd
	BemRDVOAddfO4KxJm1VMcdCMJ7R2qUKbW0pdOYM+MpIHMVbe7VXzf8OQMI87AJgLU+a6b
X-Gm-Gg: AYBFou33MK5db563EF+Onskk4a/Xv6dEhJ1qMgy33qhYG8U2PDqPCGlTBTtnNJ2cH5w
	XUnrIwMS3xVkn6zefRHiHWLMaLUSFjIiz5kNOxBaTWQYfo5RVKo8NvPvvYNZ8jfkW7lnGVKDaKk
	r82C5lAK3dHvSCjKkdTtJ1IxxEDNRQKmmJx+M3kPMGCk/5HsIy21Gl8aAzzhAA+EZZav1a/YXjz
	hKb0rIQ9hntZgtHTX/51KbxpPmiEUTP0qdXK+z4RgTw7637RQSf71tjXXmqwGKyWHj0IrCzE7fF
	KP8VM+FbR7NEAqPbvvOcPmTmXGhWRoy49TZ7cE3RtXVtWtqLoxW2xSwbtPUo8u5fhHixFjslxU1
	8bz7XwpLz7yxBBfNTTcetboVozh6eNdb8bA==
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283535a34.3.1791203159567;
        Mon, 05 Oct 2026 05:25:59 -0700 (PDT)
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283503a34.3.1791203158986;
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:12 +0530
Subject: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1209;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
 b=Z9ExX4EPJmHYRM6OMQlJF1Qw37mBoGoH8gb7spV/BNq+wtv18xJTFrRFw3gSxi/Y1NyHgidqC
 8FydNoUpspIDcgC3Evp+u8MTKYBxkJ834tGf4d61aZdw7CMqwejh4Ib
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: we3SkjNtezMeB9p-gU-R6uSAumQgkSR0
X-Proofpoint-GUID: we3SkjNtezMeB9p-gU-R6uSAumQgkSR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX3DLjbB0orRwJ
 owswHTSN6HOnq/u1TqE4uuAjKLEfCmA0TC4zr+CWZZyGUCgw2MUIi4yYgsoXBdxc2ZKlkOsKY45
 EUbHfd+fsJWHgMSevSBvJHHxksGUjSVl4WDDjOzuhykVWo9RjG9fsdNuDV4OTwDgBS03iVKvdMY
 HKe6ubtlO7VN4n6CgKl7dyKi68ZSQh9ot/yyDNBqjmXUPFG/Gve969f7aVjRCus7bpvmu3sRUNw
 VwaRnUKXu4jbjWspnfR8JaSR/WJvAPBbHpIZDwP/ouz1kqIlO57rV2CSc4KGiUpjbXPd0Wx/YBP
 +775LLyBRHuiODRFNiDo1ieCSyBL031DigALIWmfXEoAPW17ZJn9zaAn/2aC0kKbyCnS7Ji0Npi
 RVffDwSqoJcslW+JSpc2J4zJH+MCgjhsHAiUk9agBQWHF7w3UfPabfXH2EH+xh5GXbTTDFlmmJT
 p55MNZs032qWJx5bLvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX3ypB/vRMYKPp
 tELrFA9JTPZn9F4lSrnv+LnMr7Yza0bRCBHKCFG+tjoM7fYru7jU+N8JNZh9JrNva0wM9NFMqde
 L5qdd9NeLliWdzt6MrwtfFc1ErEhCmU=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac39758 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0


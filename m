Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F53A5445
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521415; cv=none; b=DsvOpSuOTOMNzop1iFto9jRzRo02xWJE8MyfxDBgEOylMoUKHUZZBdAqhuAUWzAdJYMH7fNnJ4hh9fBpHF3PgNqYFlk9Wc/oLp2ol4Q3z7oiYXJj5BYpWayQeb6ZM9ilfoxB+vMf1oyHgbSxafJQ/FolkUQHuh5pC7vhvSgcQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521415; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQV80sXdb8BxtDWcW2bgsKHC0qN3Op+CjkrXRfcyKzAtZ5x+om0CFU6h4h/NlngcrT+S6ywQeKF8h5ogun+lOFee/1lA7Yt1uYqvYXEgIv42oUStkfdnkko5RZhpwnsYtRGhYemiQoPazvFtg17GFIRW0XNrIxFfcHqtI2swU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8ad7aCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZroHtXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8ad7aCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZroHtXo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HPQD3323079
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=E8ad7aCx5vOk7MhF
	nyTqzgsuPnqHMdqH5wx33lE6PwTokIIJ9r2gUItSvcVKgtDgCpu7PMODIyjDo1Lp
	uA5huVbGXtP7f1RT2wtlBKsPx2+o8WxMJA2VxH0k4fnCW4Da4T7UPqMQJP080zhi
	h+OPXgH2y7AwknkkDjMsn6+O5nAU2qh0mLZPC5F7pUp2yN9QCbjsM7J+vSZH9FI5
	Necl2LErujJzuN/KFsS8faxl7RQXnuU0Mz760XtdYtcVFd50sfUp5kqlATINauUI
	vzzigUYmYhu6z08O/IlKA5BPHquq3YtmrlUs4Nx2HOEvbbaGt+NEyaC9f6mq2MiJ
	hWH6vw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5a7cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:50:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e676375d9so6039645eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521412; x=1792126212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=CZroHtXoXKqmCNB2HSjXVfjf5XZNkwbKQJ8b0h9I6ujwTz+oiAgh/ioGaJcO9VAhgU
         t3r92XX9T8LMHpi9Q/7pNNdn30Smd+A9VfHeywfgKeKm95X8XrA2ZWlbJ6kq6oeNvNND
         0e/9+uJ+tgtne3PovWFxqpfGl9HJGdd0rdgOPKK5dMAUBq2lVlo/+I8fwVyh/keMCrnw
         71d87ESgNtiPJZDOQTCWvSXdvSCUMI3G5ZxQFMTiBimPPvUHDHSKoXNfKM4JDhgRl6yS
         SQdj057lGqFdsdNCr2HRk+3NTzOF/wf3OIFiyJ5vHY+oz4vhYea7PAinmipEfn1kvaAY
         4JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521412; x=1792126212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=WXnOdDTpl0t8nH5vZzrkgXTnJ506/kY5+UlRsNf7IS3R7mhTXoG0vgUMBmGqRHQrTs
         gwwqcBc+lgjR8Zbl/jpa7ioa/VAmMFHCk1/yHnS4Ap1vWWpodIqDmMEd1Gzk57CN+/2y
         r9s7WxnkQW22ydFevcaCU/sZieH7tKOt3l3V2zlNzxcGG0OAfs9rTpBGvH1WnHC6WWda
         WDeB+8s4c8NTYuzpYEpXOCg3LdPqavyEHUvWjSeOUQCtR1z0zVaps8t+7vnQn2P9mp0J
         CXuTpe4iNlB4D267MHSFUhxvhOxL8G3KH8Dx5IELQsE/tI6eyvjtC9JF+zg3Q/ZPF6/o
         2Mxw==
X-Gm-Message-State: AFuF++ljniuxlHV5pJiz38RShrOZspcMMAnthvkPb/lIaEBj4GWRDXz7
	xROkkRxuD/xZ3FcsgH1H9YGrgnNaFH/dB/U2y3kNTXMLyl65nkG7mTvFVTFq52LbKJkkrqle/7L
	aHUL8ejuSKWpNUISYb+CtMoOa+Xh7sAAHoeVfl/+pKS/DvJUUYwd/Pz3CQTj9r3JJIsmN
X-Gm-Gg: AYBFou0b1TdUHwRRr/U85t0U5QmARha0i9+wwE0OOjt3XHmhbKKcbET1ejkvuYRX1rM
	p1jLBSnEYggac23zPSsAqVx8aRSHna+9o7mE1P1znDzYI0WWWv65GoYkuxTJz55GEXbsEvGdl2s
	lD1Nf0tjbT0FyHYtcw07eStf/1SO0dWfybZvByK5/wpkZJaMeDd0RBWhDX4T5mTmhHC0BJ0reiM
	ItTKB2hNZPYIWcu5X0ej5Pgj9gNHKVPc6crl9JXpqK7hRqUU1CQ/CkHeW9jdsFUSoNygrIhcHoZ
	xUS2OwrdL08XgcMm9sQYFoCmjKrWghxUGqB+rUuZVrGZB0IY19l9ifCdiAWFczDmGSZtB+do1Us
	o4gmUqrVQbFMo/9f5CMnxeDCmxxG66+HwTE0W3p2fWQS/1J0wePE7AAXZVz0zETDAfLRqi0Kv+1
	lUf1EbCAmkjriAnJEiKTKGV/xUJoj/3g==
X-Received: by 2002:a05:701b:2401:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16a5d63d0a2mr1102999c88.16.1791521411966;
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2401:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16a5d63d0a2mr1102969c88.16.1791521411368;
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:55 +0530
Subject: [PATCH v6 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-1-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX/jntKkRVyw/M
 QG5Uewz69QJvLZOryZmZjNKrhhE3ntQLTGWpx6gb4UMknY4/HL74OJ2A2SU6guTA7CE4SMZUXLj
 ni0M9dwOt4ov0rOd4eauYdbSA3ITo04=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac87284 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 4gpxJV3kytH2RiXnORdoPPOl8ggZWnPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXxEKEGRSir92u
 Zv89F2KoQ17Uk7Uh3O+63KDjNSLDTBqNlfYP62FCOM8GTvpHIZwv5vIW6yHSKYJwWri83hg6MjQ
 SqOZkg2Di+XVI3HqtKlS9K9kPlepdajGr0o81cHgtB8UCDK2rW1xB6ew8UWAhBAqM88h+t2S2Ax
 JRIb8Ke3cdPboWX+DelPkesUjpH0OwU0/oKkoAiDxOw+FjBk87+gJm2ee1qgcnwz2Zf0wRFT9z8
 8a7g1wZqqk7W3cURMqg6LQ9WIPwFV5by81ASWdBLNiuacEreeDk54T4a6ODVbcn2e1e4nERPCKJ
 9b4HVdeAbuupwCiOux0wtKJG0trBiO8MgLL5bZjqmOWAgujGu43nrb8G7UKu+y2UzGsj5CJla+Y
 WDWZsqyaWiWS9Qs2lzIZu1vKm71wF0Lb8XDrDdeCHJkvUBtA5uvREqDWE9U5XU7aWwBJZuXyxYS
 JKPZbSVUVlM5+NJt4Kg==
X-Proofpoint-ORIG-GUID: 4gpxJV3kytH2RiXnORdoPPOl8ggZWnPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1


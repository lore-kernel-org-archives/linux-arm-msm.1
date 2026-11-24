Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517658;
	b=LI8b5i6x74pe3YkKfmeGSneJHMm7drxc8iyfZPtcqPjszNdkl4k5VkC5ono643UnhAjZ
	 E5arjUwlwzI3CbK2WVNG5P1hmo++bilQtBpvWyKsY8yGBNCj83eEM1sHXl26zkkK7C7UM
	 OqfbPfz7Q56Hvokx/AH6FUcBZlcwnnP6M6751p3lc3db73b9qIZcI0v9xA25+Qn7ESCtw
	 YNGLakfcUbPvuVyAeIV8kg4QqzQpsnbgW5L2Vl7cuo1AOL1swgPdH6MG6zNnYPpHdTFrM
	 Emcj3XlgoK7L5nxGoOG28x9mgEridSqXjKFT4YrQbZMKhetAT7PWnQpnA3JlzkgtkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
	b=SuGUKVdpxJ1fDIqZ2BpKeTdwv5VP+H/FQB6gMRmr28qRg/HSerDR7FMGGrZ4i378AsuA
	 GvM0aXV4AcYGqnPOktC8b8G0UbanE/4cgfH6HsD+HXuHo7SCHam2yG51xRnAhyuT3FYVO
	 52elauzAnFt8fw7IugQLn1rh7y9ZOMitUMqhf/75WT+uHPBgSxQJSbh7jPCbUVN5Nhga2
	 s60hN4foM0duXMzobasnWZG7WHe5FQfzURJuFu+FNgHvjzwLsCL44iFEylPXqZwYIM8EV
	 8EkaTtaO+vqyXB0TZWqm9G/G98a5HMVGGuphanxaey6S3HJ+p7pdvoxh5MAVCqQmP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF5606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8FkoI4128902
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdON
	vxhwcr30=; b=f+tYYpORuLxY72FSqHvgd4pGjHoGRDy5dokiCCr6oEGKjKYnjS2
	7hLilPHsNjZH7KHHw8kLkduAcB87ouBCXsOF1ZcPGVAE5b25xbgsiWqvz7qPcVVN
	gHhQqgdLPzHI89Wey76ChcQW6/8HqL/3rDY9UzkqdAKLXarBc01+vP2kE2mVZwoi
	pgkUGalTa4rOVqTll85Mjay9e1tRr0wJdaEqiN4wsELWF+Cic9vgTKXOOsJVNewh
	8SJD2NyEfCs4C3zw1CJiQCVLU6Brl7MaiYl2eSPtheQskzruhFSISV66iMQRB7dI
	6blwZ2r6Ew8YLnmSinr2P+qJNcJo0ea6DaQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2abs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b56c696405so3538345c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517657; x=1796122457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=QqAFPgtLDBEIwB5ZpmLcbSoaXFUNyWdzGm3rpo0DtJe917jUkeS7jNqbRNIiQJaC4T
         g96FoS2Fc3fZHsoWhUCiI7e04Io3aI/3l9W0avbcSQBe7eHCorTKQjonxsI0qbLip2G5
         A0rSCKNXkEznCo84cuzQW2JHEB+Kde4QwgAp4hY5K95XpG4CzRQsSv7BdD7PacxqSOh9
         eTm69k0B7LlvfS0gmcSFy6g1eM6FJdzop2C7QHWy3XtGgzVftvi/jqxYqHGnU75+M4Hk
         Bpeki82pjVf5ObGaD250ud+0yJ2togmjLSjr/J77HzYdJWy1xo+DdikadBR9g/CTjWc+
         zqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517657; x=1796122457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=G4IkrNjtF/nzzGDuIzaFdmg8cS+i3/+72+Ch1HpLKDiXEfMB+uReonkS4Cjz2j83xd
         e6G3TphNv8DRfTEngAwUA2Pi9YTcCtC6kM1cR4xmk08HfUnOu66yrklY6bi0cFzS9Kkj
         HVzgjXoZtQmJHm7qQOkEc74H9iEUQYYQmqdDNyNbEtX4AW95jKoV7e3pLIKhWm7aDNPl
         Hd1D9ooVGWk9PTwPL85ThgBRn8ET9hnSHPl9oaEt95FOYD4psHeZLvGywE8ugyHqS9A8
         lMmY6LNG0rz/LyoKOthWuOoQppi3FdMOBcBGbA3ZpcEruiGEjuzPkbownbECjlWIAVc+
         c7pQ==
X-Gm-Message-State: APuU4Z9VyDgw/+No0FAE0xJQ2KAnIjUqywQEn65/+A8LDvcMTNd8jwQA
	P29yZwhL5IuuNJfiMcgpfla2NGmb1Hc8eeQfcjiaXszZem01GqiWwQO5UoBRBu6BTf62oYGM/us
	vgyaZzHztZQrR4j1jLI9Y8H919BGTVXQS+cY2YOlUexfFjY9Rg9D925nOmp3h9b0vh1PH
X-Gm-Gg: AZFdTZcNrsjoirqhQoh5UQkcQsAuHdp3DTR3Q3hPQTlZtTB3a8mZnWEFQeqpunnajVM
	yF1Me74RN5NOl6QInTB2dpESBs51r5Lap8zQaB9zW40iDJe1kNsUVCLj40BWKUVl4mhli0bMLky
	jHRVgfqT8h4MWJnlU6pDLg6lvxQ/Etu0LCyCnkqnGxefTxQqd/QGsaWGZS/mLK83zcLnfOpNm+W
	EcFjQAZRLqlKlAKFot8tL3Z3nP6CLNB9Vp+03U5J2xn8NPeFnYCxEMIYk08ASaPCwZvmHcFsIJG
	3pp0OPLZxWYJmrCyu1XgshwIsLp16LAHLQsCHW/wO+u8cpf/Zg3aFbRZnt3J6/+uYviedusrZfk
	VToY7R9PdPzYvl3HU5HOuOpg6DUPr8xsiJCGumhdavJmO7fllkizIoamD6NBZQe1cMeM4RWiwAV
	jG6ogwQN912T9hxxGmNSmqMD5iM8GesRLRWw55t+3ILruQmCbFBxwsx5vi
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355902c88.26.1795517656940;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355873c88.26.1795517656489;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm34644018c88.10.2026.11.24.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Add Seca PDC compatible
Date: Tue, 24 Nov 2026 16:24:10 +0530
Message-ID: <69d22406d920bb2ca437604092b22648fc14384e.1795517650.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX2i7gnKSPa3SW
 dMbG3T2odTp/FiThaKQoSwzFwLh0UBTX12DOkeSPQzSmGLz9udDaep6YMXdFazWVtvTTraSPIJA
 0r4zo/XTLPs9bo4ZjNZpoKfaXnVn79c=
X-Proofpoint-GUID: kHqwzg0d_fFISSVvhG7-erhu9p0Oubq2
X-Proofpoint-ORIG-GUID: kHqwzg0d_fFISSVvhG7-erhu9p0Oubq2
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056cd9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5Mxr9Jv/mMbd
 RjkL0zaAMa8TPCtCDE3yzNLU9bpvaf0gMdli5LN6AB7KK/cN8nCRW872zwnLwfFOCEgUabZBnLC
 FWK4OCNpUjgqGCvvHQ0bhbt8kP5fBpVi5Ao9B/2YHBSciIAoCWw37uCQcoU+MxhznBXekXszYcs
 cNDM5O0cs0sIbzZSyXldzz36UPpngug/Jt/4cClm2GsO8JPLMxmXjdM4Ukz/BhPbJnZlppIeqDP
 JzMY1+x4c4/uvonZEHvhua/i6cKi2OgBxgmhxs2ObRsUobKDZtGBTye25A7Qhs6KM4lnSarFGEA
 JLkKXGkUN13eAl5dABGwtXr0QeMLJX4a0WhcrisPHkQARXmMBvZlZhhPGFP+tUwP8CqdSRHb/yJ
 UtX+SRve11tZ2iIqQvoyb0qfu4/geEv7l/3kOU58uQ5fA+jXfBWpXs6htbx5E3rRm1W0ZTQuHVJ
 hfz+DBRw0MmY8lJOzrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-pdc compatible string for the Power Domain Controller
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..e6ff08a4e979 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,sdx55-pdc
           - qcom,sdx65-pdc
           - qcom,sdx75-pdc
+          - qcom,seca-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
           - qcom,sm7250-pdc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0


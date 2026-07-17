Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAC3F12D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289274; cv=none; b=LjT1ID4GXgnqvRoLCNXoy2rX5hMHa2GOwZZnbW59qJwj6i5cOO0A56IqDKf+xxeE0Qg6JfRbANPMAJC5EIrCDUCUZEHmHUJvgNzL3rNIpkZXf7CmqPXCFgLdQz+S045Lfv7s1f6RUFTmVXEN71LgbmhTPCN4NHZoLn8HycRFesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289274; c=relaxed/simple;
	bh=+l5OI6sgS6NvLbeJNU93THRNb7DucFndFxZGDmmll/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TncTFJC+25pnfMZ9YNnERJ9ff5rnHymtyaVKTxgF3RuA/+CIca7mJpiehOGnwfx7L9eJcSmagrr9ekNo1ESEej3ciaWk00giSBGp1HZMZmqVytoFq/LUSClwkbwHQCvedeywR8ekJTY1GYcaza4310+UOqeT25LjHHgSJqGBZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjYAAr6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI2QSqdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjYAAr6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI2QSqdv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HAT3XQ1486577
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=; b=UjYAAr6Yqj0ecQRc
	Yc5s4ZGV3qVMQ9yth9gtJJ4XiSGGN6RuR/XMLBUaaH4kr9BEWSEp1q9dTx6x2g9W
	3gLf1ERTtIDfsmbJXvM6zNMgQnJ5Vsz9E0pPcp6uADlrifECMqEjuiGrIPYMOr2t
	aPy9rExGgdMJNsw4uV4um1TavEHgkrk3Luc5lcfPFw8tvl0JxNa1Tv9lxj/IFMeS
	Lf5+d+5Jo8va4epTlq/iYWWf6iyRZtAxVztPCmJu3voYgiTNn07AphYjhaSapuIk
	b5C16MaX0hBwS45BnLoAH0cwxwYCGU981jLl7hyg661xXDbD//jvAKr09JKN6Moz
	KFC7Eg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2v29d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso12422875ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289266; x=1784894066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=;
        b=fI2QSqdvmC3MvAbP94guv+PYLR2pvWNyUER7/96nRXGp0D9b8SEyedn5dVhfgtV3yV
         VpD6MsNNAiCngQKykNVlSR8DC+JkEu+LiYnBiXpBtETHHBSlOJnJwvb4/zUCyef4/Okd
         dYnWjzfBG13eapoTeP9J9Xqz5RQVNC/tA8ZnNYy959SaZWrwaOxjpKrBJNMIItK5QdlH
         f3te9x15Ma6NLkv1hNNmgyfNc/LT+PUXn1gob7jDCgkCw2xHex5Sph1Z5A37XqsaoY83
         ltyEmTsqdSMVDcChWSPWvCq8C7ji6efgcxDAuXq+89aaJCXlktO42ISvgxnzVTaJ0Akx
         jHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289266; x=1784894066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOEYjx5Bx6rjSqfjaKVsvAP9GEjPTNO9SOwXpNX2H5g=;
        b=hJlQJK8egHd47KqBMC6ccnyuYdFNt8RyhCGhBkE+clhB0uv0UnSFU7AzCKvnXQmj4d
         ZRHHYZ9azQZj5re8DnJFAqICbiEr+DrqO05xOFi9WsiEsqhu/KWN+8tgL3m1iC/mnsXk
         EY+junKjFJfVJMM3KzLZQoLKiCYS25QU8RsWqjxkJBZRzZQ4mMvdOZJ7N/7puBNsIOAM
         dq/nP4CXyoF3JIrDW/pkD++hqsCvg+PT0PzZ+ah9fklgPOXkAyJ3Y9uv+4bupQzcDQaC
         xlCP6wX64rPJAxkpsdQahgZ1agkGwIfIE/CKdjjsPHKTQ6g1PpogYPK/k99NJ01WwOHO
         l1hg==
X-Forwarded-Encrypted: i=1; AHgh+RpUTl3gBaVRyJxfBUyz4FQhO/gybiQ0iu2g2cOaZI8hydkk4eey2SlMB0caP5Kzroc4O5Apcov/Z60bKAm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw488MQULHKYv6K8AK86k5a89RGg3gDrXsdo0oRDHgm+6PH56rF
	T3GAbB5G4398SKKxuPqCS0htAnK/IMDb2E4uIe2cbtMKH/SdMMN/H7fGsi5SAkt+gsNWNWL72UH
	SfSdZ3OsJW9psnRci7ias27akMcmUnG3YrOiXUDuH54QjSz36H6tKCWugHT6+msJT/PV4
X-Gm-Gg: AfdE7cn3gD4fGQflA0NKcm5oWkyAAD2yPPDcPB63ELH7B0kWjruSQqK7zBWbRdlQKcV
	p0CFC/pzhNOzS0YLff+Q76yqee4mYye7BmAleLkExoHpdlTMRaxG0e9nnUiBJv1R+bCSpULrHw3
	hguSycKcYOaZysz1af8p2C/6Zdj9nYG5rmNzxJwjFGWKDG2xX9LxuN6VTqFsEEQuWLcO+CsmugC
	oXR7JumIcm+WJDRF41SKyd175aqlMbcmO5/UJDNVWN06e9gg4LDT5JVWnscaclnq1ZxNUXxMrvm
	JVq2N7C2Zqnl+yf0qc4BjCW+CD1hN6Skj5UfUlHk7H/U25IZFZYYMWKWwiqJLVeqxpAo8cOAfBo
	dHKLmDyLRM1WsS6jDJgCJXADfF8yZvuEJKdh5u0n2gedaSMVKp57tUK+CH3N/QOH5
X-Received: by 2002:a17:902:d483:b0:2ca:f417:396b with SMTP id d9443c01a7336-2cf1f25625cmr71246425ad.3.1784289265839;
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
X-Received: by 2002:a17:902:d483:b0:2ca:f417:396b with SMTP id d9443c01a7336-2cf1f25625cmr71246115ad.3.1784289265376;
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:10 -0700
Subject: [PATCH 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=951;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+l5OI6sgS6NvLbeJNU93THRNb7DucFndFxZGDmmll/8=;
 b=RfKh523Ab0l83ncEhcfdbOm2e4/vobl4BKPY/AaKThLbkKNor3F6khCqXCaW5hScSHWkqvmVx
 U7ON9wLqz1ACdrDx2CMnAaP99AQEu8O18GGNv9qwFGWY0FBygQZql8f
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: Ddz94eXDTbMHEBfea5RLOHDi1eEA6mHv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX9ceFhgk2gRW0
 JjvI3XMHNZsZo8bMQ6uH1L1qYmpHs6cZvxFmFxe8PIjWaU/5jN+dCKY9PBnVSBiAXj4X4jUahvW
 7RRhX768s/FsSB95m/doxBU6yuHJ5tI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX817N1gYHR6/x
 NxHfwnTqC5ACf/OJ6iCwUyh5hL6vhYcjZyw0/MNVivGhA5uaH9FAMwLWNuBVdoROWdhMsjXDRpC
 CK5AWiPXC5puYG6aW+BS81pbl5feNWXMkpCLq4Jk109gb+soLN0XSPlzl/9pedfCze1p2xpk2Ad
 W/7+gXYYiNKzFuiXUkBWmd4bNapx0xJuRfhdFNHvpOX2+Ku0tPeYFvtFoEVMQMWnRZtHYCAKcRI
 5yVsXGf6gUbk2q3lbH9pHc5Mf6Jt6nEfYaBb4RWgFO5vnbkDQ8fPy3WS+mic6ycFvQYmn+9gI8P
 wGJQAm+j4Uar94hxttvPjiFwrNHIjda0vpKkzyEtnpxc8d7HRk+peYF2HBf3P2qrBNDCv3g6qYJ
 bNnIqVHDcZYoD+DuDNys0LSQLlyhxFyrsikMjCb34Z1FkGBeFmmhffWddSX2z5UgUHcrJZ4VDJK
 Kr9d9kUKEQILjglx3Sg==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a17f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Ddz94eXDTbMHEBfea5RLOHDi1eEA6mHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170119

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1


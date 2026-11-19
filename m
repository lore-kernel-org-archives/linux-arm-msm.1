Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112039;
	b=owymxhqM7YseVrUX+VMAVND9nzFk0qjby6xw6RBan7tZ4hVtKa0Tre+x2WPiHyMX4V7x
	 v7y+gb2SyLZGzLgizdfNxMuuTzsktLSMpGlaLGxUoGRrpngrgJYZXYV7WU+SRuGVBz9EV
	 +HF4pJEK/dV0ve8qlhY9WrkjvgnOjYwaiiBiEVeLoKKfPvqxFxB1IND9nJATQiceuYMGN
	 rsnrENqs0aVzOSZiVkNp/lC1pUuANffCXqVUhMnS5UIHwhPWxsA42yMigT4RC4cVFcCCd
	 oy+eRr6XuPSv3kcSQzWTlLPoL/4BNCBiEtDvl7SUU2NfJZY27HAI9xwimeVOUsgocsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
	b=JdEvSi1knGABm0b1syojBH97cEaAI0irOW3Q5ISD8g3h7l8UaLr2YLuJtar5uBVK1JZF
	 EWDyC8cZtkhAqTfW6bKbCArFoNyS2hXjBjDtYQzzoFZaRtJJl3DBDcjPI3J+G8320Mzuw
	 MbKIR3MQBTjXDPr2pz0qizmL4me4jagteUjf+kZ44/AAsmq9rSI9EDgMNt8r8Z3/qNjOP
	 54U6wWF9O0GgCLmu8K1qgJqU6zEEh/5QUn/5lsxTVL9qdpRarZrq2AJ9wWvlAQdo2wsvO
	 VO8vfR6A8V07eJLobQ2rw63uTc/1cuS3LackWKkzzyJO0dusi1HrIRHx8DKA1/fZCBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA23606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGs7K93016723
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWD
	LPYDEugQ=; b=R2P5ERucCv60pTPsDYPVrEIwI4sD0lDM+7KEkHFBujxdN9DW0r9
	Tvfnvyq4g9lYWtUG7a+I5Sk5zDzVQf8Ofsksl+hkcO8dASH5JhhpK/89YZp6DsWa
	4a6h+wXXAqkowlKD4v7kPPGlPmD4SysRbKRxScqJDGEazO3oBXsLGCUdGCQ/Tz+B
	ZZgYPB+gSvVrf8EI5JlCIdWB1lEp+/9OtJDj5lMX0gwqs7RbyvIO3X3qCvvxhv8z
	onVRvjzqvAg23O5mRCGZLOo15q+XO7ptudxc8JnAWR/Mg78frsov7eBGZgKXyVFO
	zhwg0av5AKMm/xPUsPdEso2orJn7uPlo4fg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcvh2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:13:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3afcaadeeso237733c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112036; x=1795716836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=DU3fLrrClcE4Q9S0CJmJyVh1Co/UDhcY+3U38x0wKmAYFxyfoxahSdaGMNcxnla2Vp
         DLgdhQLek9CeFR8eNa9xX1dkSnoA5c4OY8x5oXlK3ijJ6eQerGu4DogG3mcH1A7CfShZ
         BIwZkR74HH8wzWCfVdb6S/YPegjqSN40efaE0FUY0vonb9gUBZVNYha9BowvBbljubEx
         a+fyK0oO0WVXoUQYXRuc/wcPYif6YMtGs6dJrTM3G4gVSSRhhKycLC4vtEtaaO6ByvRj
         OhjOE7PLeqYmXPWQ2K8Ri9O/MHGV3gIuG+SRRNnLQzks0ygPTSRrA9kna9xrBmFBUzw5
         F79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112036; x=1795716836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=gxhKUJ86B9b5KA9UlI26PpFietX9wmi/Jo8+1l2oaXF63XqzLvq5JUVHkLewmumBVL
         eQkZtjKp9aiLoO5SFrLDRdyh44Y+X/VTmcEG4ujNQ/Qvg3LPSNgoX5RSjdePCXDL+8cM
         rgL3bQaWxcQSWl9ZK590/AO+EAseyiQdfjnQNI1qK8QgfImtNaJFYVd974zuTCP9e7Cq
         jWSzavC/Y9cWrjx54OEqp20AkXMuFRpk/FkwfGjtj85KjbIzyzf9jLVURhnAigk78Kd9
         +ohuUqu20pMEIGP9pJ63L2KUZFQzlUEo0xQAuObumzTF4p7OYhsNFtOtL62xJxkG/9mV
         cQLQ==
X-Forwarded-Encrypted: i=1; AL+hErF3ULn0k4xx/jte7Kpzxx0S2fbUU7y3u70zH3DT7nzgyL4/uEtF92f4dswuiEHu7qYR0pRaSe8NxKnhiP91@vger.kernel.org
X-Gm-Message-State: APuU4Z8YIFndTZMd6bcG++e7xe6H16d5FuuglHWwGFN138Bn0TqSDQRD
	Y6gldfibC7JFa5r1rI9GbICPTUO6Pt9Kfqmq63yFH6h8/s6GskimmHeL8K26TxTP6I1SPr0PqHH
	+0h8ol/RGnGQqzfpc/lmAH88egK6/Ewf2TX0GBC5K0u7clyQ+r7ayq3i5i78Aro+yc3+NWDwxDB
	lg
X-Gm-Gg: AYBFou1I4AX9qdujXQat4l2y0U6xDprutWHpaLJGfVMX76oPncyAfXwmGhWtJvbh/qd
	15PBtYb8oI2/CASqQI+kvwh7XC1d3ccxhPC7/t4h6WhPCgZKeBiikCV2WdPqhTF4IvmHEQOuKOb
	wrdBXV792s7ycTuNpPv0srl2m9v/tpzRZGDu/FiJ4mfwcDOmcM8RLBynzTh388S24eJ22Ii2sjm
	61u+DpUFDp0EFmgATbyQAqIVIyWb0g4EQHdMyJuw0LADr8/ahxyzVGl10lIVIUiRP3oSu8sqOmG
	l4olYFPet7ipr8Ycd1Bkx4HY8ShymyiGFWAg9hglpf4wBsCgLseG20ATTIVRT9/uxcBBSfQZwFy
	aBhH5I/PYQlllNA1TuLewXc29eTe3NqOQgDyU7UtmqAKFW+htgXYiRLk17Jl6KO6/jIQFjbbTrc
	C95g==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583846c88.20.1795112035943;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583814c88.20.1795112035257;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:47 +0530
Message-ID: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: IBN6oORmmUwNVu6nnil-Rn0MccsdJKjf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX+2UgDFysHy+B
 3ff4r0q1bj0DLStwqFDCIRD0Nar3+wTmlcamqyBh861UCf96JQGImQ9qK/7xENUQnzQfBCFI4Xe
 KGaL7pxZa0sRlNztonkBCv0MhQhwevo=
X-Proofpoint-GUID: IBN6oORmmUwNVu6nnil-Rn0MccsdJKjf
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6aff3c64 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=kgeSqXWK-NLqBaGKez4A:9
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX1Unv/jjCm7Dn
 1EsxEsjrT4Ernc8w/GbdXetT5miAkUuXopehFPBV94PUqjt6VZGfV9s7Nj/iN9Z0od6J0NNfD+o
 KVWJ6zTVBzYRpqLrpmswtl9JotxiB/1zY2DPo93wZEbjmZthg2BZbi9+Li/OytbzAgrI8l2fPVE
 BJxfIrejbLaBrsT53OY5+RC4I2C3NpUKDLaMehYXrRjsMFHv6cR/sMiSbVVCe7aNNbY5XlEi4bD
 iOKmiFrTBzXlUWRaF4txjlqN5gpGhVovHz8B+8qq/KOJsJEDd80a6n+5UcuJ7VhFZWGtiafG8+K
 ghh62Dfr8iwqR+rIz8ZNSWYFVvTJUQbW/pMS3xXx9iCbh7RXzz9AeGKZ9Ij55Ggp/ytUvX5CEv1
 e/9CQa8dAjDjWXwX+FfumA0Xhg4wZFIrf15OULdyYrC5Giv7XVmJ6ZD/v5MM1UhwhzsJ+tIUKYY
 IMpCW7OmzI2qfzLQ4DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

This series wires up the CYPD6129 UCSI PD controller on the LeMans
Draco EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

Patch 1 adds the shared OF graph port placeholders and
usb-role-switch on usb_1 in lemans.dtsi, and drops the fixed
dr_mode = "host" override in the Draco SoM now that the port's mode
is determined by the role switch instead.

Patch 2 adds the CYPD6129 controller, reached through a PCA9546 I2C
mux on i2c11, and hooks up its two Type-C connectors to the usb_1
HS/SS endpoints introduced in patch 1.

Akash Kumar (2):
  arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports

 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |   2 -
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  20 ++++
 3 files changed, 130 insertions(+), 2 deletions(-)
---

base-commit: 42c51622f624d32187e9a833178830718de18ade
change-id: 20261119-lemans-draco-cypd6129-v1
---
2.43.0


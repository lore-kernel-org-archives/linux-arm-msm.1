Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCC493627
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047013; cv=none; b=IJGkz9uoRuK8lsBISCVlXIheHoNwxR7zvjfrN83LdnXZzOYbNGq8KTO3dWH2bEZMr1ZT94/4TNFC7FkQ+fQkfynkS/fh7kGT05hGPgHxr8t5fsHZENYZns8Bmly7kBzKYNeny5Q3NngqJv4Zjx1Yvn+H+KdStVwklHZOTkfIaTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047013; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+9t6Cek0sSngK7gZ+8JDXvI4l8Gf7uS6Iz4CIBC4W/CiRL8msHp9Jil14yegJgwX1uDZqHHzoW7GahoUL9DRe1fLfFXNbiyyAWCmIRyvMXy3mD8icKPYFxWndXE5lgipfgUL/44ypX3HBqU9g6rIjCYHl/WVwR8NgjJ3Aj7VxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nULGqOmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKiD+91F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nULGqOmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKiD+91F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7qKH1087149
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=nULGqOmWgKj8eo0I
	ZsShDXBraOlH7mhbsD8PNkV9OMxgBV0ERrJg5GSQPrMkc7vHAX6YPTstCyNo2dMd
	anal4fRbaaGNuG2pZh/bez91ZMZtJb1gDIzZvpHvKWk6q3sUWcDihrDHAb6yBshl
	hsZ0k4cusFaRVBfC111Ff9d1BCpXhg3Z+fBCAFWVi+rTdVLPZamYEcUZXfDZroCi
	JAmW02eOd2VyvEyFw4IPq5+ntF0bJIc3dfoJPEjQIkRbRt400b11q8NHVxEHO5M1
	32oGcoPXRUG4/HkTJKFl47DSpre6vG+lFuwVXjH7qAhrrdvHsdK1DIifL4fPmch9
	/xVdwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg43ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso5295020a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047004; x=1789651804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=WKiD+91FNsNP8+XJ+VOXggDcjbzULln3ysyofNdkfbzn7joEUR4UmkoUl1tAqN4fdg
         aIJpDYP3Fye5ZPsPbKoyaHnuFEIpDuex8UuINEQQ2+CnIrPpC2KHso7JK8j9l69fNsQT
         CREvmJTzh5RB8iXC3zO7eJfoTAAHiJWheA+5mi1vQiTLSKU8BWBaHb+tfLR5/hjHBf9J
         0VL7fGv3UH8kHnLRnXzgCyGcpfHTh0xuhbDPfwtdk3Vk1rNmzSSHJA7H9sy8Kn9PKFBo
         HEgxD7FYuKtPoT6vBOhbMmoryKEH/XFMe4vVojoTjnGBle3Ly9aMKDL+7Cg61TXhczWf
         ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047004; x=1789651804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=rapOc3b3mPka96mO+XXPkUj3Rj8wmhSGTbrLVVAc3XNusKbBZ9La9FFIbfj4zq0OK7
         qbSVzbJVI3Bvd56u77nS315MAicYuzHOJITpy4oPAfxCfBklZQ0tmNVOtot0iHoT/IpY
         XGtJVIQH2HIsSEmmE16N9V8CWrJKHzZNv9ieTFShSKwmLfqfQgS6xVt3gf623rua0+N/
         fHaVFhhvxCBWepl1kyk66BGuV6u0+KD9DlzCRiInK8S1fGkvRMGVYq8jsZexf7o6bsKL
         /SoBh5aDRfQemTKObz+EbjPQ2W7mFgvtym8y2chOCEMYR+c2YCZmJk+9k2XuV9BPbBfV
         p//g==
X-Forwarded-Encrypted: i=1; AKwUvBxT/+LIAnA6jxjpxHTVfsdaGeCrxCFUW8dPDJxgh/K8XWl71eRqFD0tQz9zoPbh3THnbFd4WSVAuWAei4DS@vger.kernel.org
X-Gm-Message-State: AFuF++kJyHF26ijff0QhejYiLJnFkMLHEtTlQDO/7+JoxdlqgHYHMLfG
	/AKsDEcOuY8iGpBur5ku3SsFJ3vJIsjeAs4rBL29PYPhePqCx9bHjTT19AuKQ4vAO2/tIiFgjQI
	fRTc/6U6FF4WlKQjlHmmuy4YxqBHIanmRQ0c4DWyOwKzmryuwORhZz5PbDaAm7mLCcIg2
X-Gm-Gg: AYBFou17ZAJ/UnPLCWR4RMgCk58kV5UWnqUz/trchr9lmG4Q0UhhN/JWVeUf92vPqkd
	KeBXj9AOfNLQGigejTh5a6U2MQmHKFy1xj5FCJrfGxu62b2HDqb87s0O2IgC/+OZnOkxsyBDakW
	LPsnJxi8V8PXMgLWa7UbpHioC//phO4zoOH/2x/s0rWKweDwhbA7PyQjZb78ZLEs6AS0vd6oTiO
	WZwXpQF9CjJ7cPnk45gycKPvX3oPMRi+gwbqzo+MsvkNynQa3pnmHN8QezHWuDuSCIc5EGbM5mJ
	RB/I2Djo8qUxhWhFcNNrq1DXNdlFNmwTOc0Nx2w9orIN5smu/j5N8QFv5boYkAEUrS1ebd4hlFz
	ihdMVXTcCTNKEwYUOSqLK3KNXPlxHKZDO0gA=
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893566637.22.1789047004445;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893497637.22.1789047004056;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:02 +0530
Subject: [PATCH 13/34] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-13-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=JdNq78YtfORTadJu5cVFQ/Me8bbut/dMQO2XVya+nkIAHsBjdzpuvgl3xrvqngnMVfe4g3EYD
 u2Pr36OqFOGBLmE0ZCiwpfLlOmcX/N2wRgMS2xvgzzwXwrZIkjFHUQ5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2b0e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YXkAiUZn5TDsyuRfVyPnb-ETthOfof1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX7ccFCO5tRQSd
 KDIiXhpLUxTSbwW/+NAGrBNbUP2pUpH8KtkPEVEUaZWjT9vZlT3Ap7SbvE5lnsRpyeWCbUuqBn0
 VTb8E9wul+AWM4ZlLm5uhUtLWFfTY6YAzc2/hNuffPjMrqIivvFQdaitTZEtTmu7evt/8rQ1OoA
 7LeG9zYXOSw0pS/CZOU9KBgiwu/cJKXdkxL+exSKHK4gZpYT/CFSefxY8gm9YI49oajq1zRF4MY
 XIYYr7n8shFHGI4U16IUuKMs+Afoghz+iklU4abMrlPOQKtLVwAomfEVAGwAAARlAo9ywxSIVs/
 F2IkoqZULO3eKPOH2J5s3aYTONSLmd2ju4kdDRYrXs+X1eeo2TXyPInXp1sWoryZLVim3omxXDv
 De8BflAo5iTRa4Z1n7nBATp6w1LgNl/e9SUJlXJoSnXWeR25SXAHeICfJD3bpsMKhLgLBkUoNGz
 Chsk5vMsAue2kTz36Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX534a1MFibN93
 a9RQ/K57c1HrzXRwDYjs7JDMtZyqKb8lP3ceQGofYWb64a7XqvEEFr6D476gnxZuGg+XpRtgl+R
 leVRCOBKq0P4y3xgXGnB89WMqNd9v+Q=
X-Proofpoint-ORIG-GUID: YXkAiUZn5TDsyuRfVyPnb-ETthOfof1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100160

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191C493D20
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046970; cv=none; b=nEUo62YejTctNYQwFawfJB8XgNUBZC3IBj9+DymcK3VM6pH7vstvycCb07o6aKjwJx70vh9nkkM6LHMQ94QQH3GLyG69xGwOuawg8Hr+X+UhOUZar9i85iOAyAYkJr8SjOXTyvSFqYbH9G6WxuNLUMBLSRxIS953SymemSrYY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046970; c=relaxed/simple;
	bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofRwrR4q1caMJV48mILJmvYDlZE7YsBnv5PbjU8xxoDHiCW9wmD0A/NmJrjP9nR5WetpSVdGTI0fRgEOEWF2ZNFZm23zcKMA2ueK5b2jWbsMbCS8LeOhqvV7q+2OmeXPbAPVKB6qzHPychNXukOmffhzxFhmlZPNEJX5wTZJrIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTrXKFJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFl9bfW6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTrXKFJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFl9bfW6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ijD780826
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=; b=hTrXKFJ+UqnQ+F07
	BscKjQTqrSIDbkEF++cMJ57reszx5WYgKzTfbsPEqNfemBqvCEakF9IYURgzLIau
	7/Uv4odKI/w02cdObwUeZXC93wruCD+JYFmfTaULwhQSiJLhL5fNcN7wpNNd72Zx
	AQdQUQRctTaYN/aDeuJxOp3QGRsZgcdrvQDkyNVHrCTtdMDPA3HFx33FXDMmkwYC
	Pfn4l9zY8kQK2DjpHDr/cRQd/oorFo1/Hr41wmk6zDvxpyaJrf7u1i03YN85IjT4
	4aRIK4Tt8MFkDguE7xK74nboS75UtIoAXGPG/odCson/vvrhCvYZdrPPsMWcDzKQ
	Iq/sKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9at0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so8762571a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046966; x=1789651766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=CFl9bfW61EqqdYngx0828KJ809C06jSeNxoLEcJ0S7/HifLGKHaUSOc2SkkExU/yAi
         BJEdRC2y49e9jIJJFnJ4QrZu6MqMwtl3PZ8ZYxnRxCGwYwdbLGVOCIUNQx0VBjryU67j
         AYpatkAsXrRIF1dUhpFKgj+WnmBoRhNI68sJ4qvolLjQN/CPHKB/q1vwIwf+sr9csZXb
         tThowAeMKM9hM9jYdEj+ieYwIWRcpRPdW3cpQRn72uf4mrnIZJ6cNhRnWYNIXHUAjN3b
         R1/pejro2zGfNIL0sEH+4Nc8TeVEt109W+6v/wfXQtymYn5axBV4D5LqM2Mm3Qvz67qt
         UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046966; x=1789651766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=h2AGP5+ilHbi3JtPduT08inrEZb+uJZmZADDgprhL4UDvP9YbNhLKNlOj2kAMg6PUY
         7Ai53yA2OSrOlBdFBSxcz9YF4o8eJhq8UilsqewAAp7DMxQmX8aL1QCxIAVCMHivqXn7
         TwZfmCc1mIV20It73usptdj1DKceOA8U6VyiSMIhfrbrmWVhesI0WWPCJiYiTcFHPqSG
         DYFWjPhkNiq4y43lTDIqVEn2o6CQya2K2KVjJW5aOpS2A2slH38hfDBlKEKZ4KTB23SS
         xBcS3DGNIunuFCluUNMt190e/tK09kxg5tU+t8tj9qWG2fS2O5XQUWR6NBbs5LHFSD5S
         POsw==
X-Forwarded-Encrypted: i=1; AKwUvBzOV77HuxC1DdCMI8yNp4faPsRr9Y9j4f7Yb2t/nIGC8oh+cE+oGzcg+ESh227iCKcG9f8mfgqX4OKBijR8@vger.kernel.org
X-Gm-Message-State: AFuF++lYcfKJIBlfQViBeoyGW40+LVgsigpiDmUScXwqLElvuRwOnvo1
	97PinwrBQnNeDSCZnG7aQZP7nOC4zMxXZXnCwM3M8w78ehSyT1wMYn/SmIEJtrXXF+pH0q7ufjn
	+pFAefX4C3Qp1RNbNTkc6lLi5ghuV2E87c/orz7NSEdJQuPaVVt4ENs1AigblE/ZIc5Ae
X-Gm-Gg: AYBFou1eWIRrbbvF+F1qtEP1bdQbtMzl2Y8SUFBfiYsvdlQZ4bVE7Czj/IidkSO6Ugj
	fD0Yv9eFQMMNeMQ/qqDSddbcJTbcw94CogH6qxt08MDaLc0RrQ0uC6qaChdFg/RbFYRgr2abtCG
	vVZfJUSgtVu7EOBNT00ygViz8Ar/sUUcO9nqeVZBVrBoU/vt/q8s+xUW1O4LWh4jHRVxR2BnDHq
	1yecDiuM0h8LSyOjBITUWOqYyqj64HbSZH8yN+nJcfLLBDYnjBK82tCPjL9TBzQMb01FX24K5kH
	31txdh7SUfbtEAefy/Iymvp8pPuGtP+9rQkiIHPYoJiYhDp9MVGelbPPBNHHzsx7XZbATbnsS9g
	YF/i9UYKPRsm5vC5i/SQC5WuUvPQwME6nApk=
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649132a91.18.1789046966537;
        Thu, 10 Sep 2026 06:29:26 -0700 (PDT)
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649058a91.18.1789046965999;
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:53 +0530
Subject: [PATCH 04/34] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-4-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
 b=AmsbPYu+6kJVO3uHmK4dYGfOXYNWc9LtdIMyQTfDXH+S0zYXtWGwLmZS7Mze5ZW3qi5/rzqd5
 j3MGYTCYIpQDtTKuMb4h44cCq1Q/rQl+VIenTE1ZvN/v/GKQcYKXMd3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXwKjMkRb57RSR
 9riTIkQrORcLWgUB4k89Ba2HjIOh0/6MNKZN3kiLP3j45jFYnSgXF2M9j33pBRLKzW/Otub170T
 m9ZCpQV1kOLCO+g00MG53YCvpAxbus4=
X-Proofpoint-GUID: A-x7fLHdTmqO0NovGZp56QJF5RSfHjst
X-Proofpoint-ORIG-GUID: A-x7fLHdTmqO0NovGZp56QJF5RSfHjst
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b0b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX25MYLeI6uo7C
 1hXuGRJmvN5J58OA/T8dvzwwStIxtjRDUkX/NtoBa8FbVR4FjTv4TKV20R3sKDwizIuqixV9TZq
 o5JuQqVLIWYr7SQX4iP0QRLNBaSjk5hVXE2M3+gcdV2L8rfiEdm7vh1tmOSr7h7VJIAJ9zfHRAw
 Z5aEZ0zKGUiB971sWtCelaVrnMd2lEnrlBkpeqD8rK/g53YOCRQteF0DovCJN9oQHX3LerYD51d
 D32L8Tb6F5i9dqBvyn73INzajA79zGhjz6EkdpbjliSmk9J9gXa0IVSLj3KYxisDNFgSi+jC+NX
 F9qvCs+DgX4HqtgGAzdqaaQN8XTg4nsCbV62V4keci5BcKM1uBEkojMX0aGR8k5FNZowpveaX0H
 PXqwoU/gKTKP2npGL0wyXtJJ+OBBwsnqulWLYgxNA811UQVPTuRO/1el9pIEeMCGx8XHBPr6irx
 ixUrwFTGrNVuGS+mvNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 565e5a9979b1..e6ab523d249e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -492,7 +492,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index c10a936b320a..327dba55a5ec 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -593,7 +593,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1


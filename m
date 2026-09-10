Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DD343889
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047029; cv=none; b=L1M8PO96az/COBTFz9R7Yr5Z6/hm2u0bJInchb/E+HNqdXeOvJMHgHXLrefBVtsGNWeJPKCg32rf/MFRnDbAhUW9xpjeu1vyAMqX9el7AbRWyTncbj9wlSHkQ5voZB0HHumn7z9geEJFG8y3CZdg2uzCKi2bx89n3i/HHooH69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047029; c=relaxed/simple;
	bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzK1uGFw/NjWrraw4p8dmp6CUsEL55YXi1Cr72PvEQT7MuuvNb6xK1p+otAb/Azt51uItxKdLODs+wvAfgdgophlJ8DDbeywodrRrGJZv69QotS2nGd09kMhwBGMTVxstyXz5m1PUjs99HvgHhcRNQpgGIs4X4xRQquJiL28+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzKyyJ/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkLhGCIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzKyyJ/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkLhGCIH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ist1732420
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=; b=dzKyyJ/wtb+kIgW1
	qJf9g5pSgkAug2gCJdVOEbJiqCQ3odLzYH8XeLqNv9wZ16I9kDnxXTUAcSIlsMs4
	SPdti4IrI91MU5tc21KGwWG8INUZL5A4W0WwH6CCFV4Ktkgs+QcOLPwfhjxF/C2d
	/ZnwLdu+GV7EjpFWwuuvuXLA0hcgw1U443liAnurCsQff1/JK5PB+y0SgsjYQFN6
	I/zThTyUrocZ4Zi0SvuALnQjMHiFggcCdkQshpKIIc6A/XVzhU8ftPrANiz6QwGU
	Ht1yLxNV0V5i+iQzUE8we6K02r4n6HSTvyZ/5/z64CAeFEVjWNVm+tbdh7i1y/rT
	7TG8tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm0xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so3469227a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047026; x=1789651826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=BkLhGCIHm0WV0XYkDMxDNhMHOPyC1iIVnKOuLOmSGJIx3hU59To6/bNDalKPes6Yly
         7njiQLoHsT9Xe7GZt0uXvbsknucIHVja2r5AsmWWV/mh8VfGZpSJT/Y0pXAxQ+JfvneO
         S4juT/wzQ3qHwOvmEZKqzy50otTZkdQlY3i0iOS+fUMfq5MIKXBXIlhOQLbPB5pIgF8Y
         w9637AdUfUa1DgpW8DvnjIy6uXJG7cu0A6cQjDWlmh2PCeXM1uJdFMndo7+vvU0NHTZB
         qmF/2mattPE94ncQu/Y95jOlWs9uUMrko/MXE2csRWADH5B/bMSTfSHCW8TEGlzNfJrG
         FQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047026; x=1789651826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=baVPHBaLCVHRwxKJjQNDpropHSD8LJE2SKCKL0kaXgVXY55VB0OfIBIQ6p9fq4TpM0
         EiiuYnZTcYCE1wsiifCZmvcTiYnbMa3ssMok421nYXb9bhwTm9JxkBBBkQAJgA6O73Kc
         CKfS98aadbXbRCLbS7w5ShMPlRsBJ4V6PAsZe/lnVbl6DrVKke3XdK8JD93LHAORmn6g
         OcPGTrCmL7FREW+Pt4d8kTlJ5Jlx+DMmjtQevG/NN0r3YEtMilFlACzc24XaJuns6BE0
         bsciDb4+0KWeX4TMqP8PFVSLg0fxwJ6uMjXFVSSnHMYDdpwrSEeADRF6RpTh9sAs3T6b
         09Ig==
X-Forwarded-Encrypted: i=1; AKwUvByi+8f7F70ancUpQR9054+CkgS/HPuhOoxzRmfFxYmKbxgVWCwW/OueZoPI7hZPlZLTQj31eeI3EJYB6F/S@vger.kernel.org
X-Gm-Message-State: AFuF++kYOxAhig8xvl6lYOBcr/yLZ1XSXTWaaXj+MBI6JUhsMlO7ClMW
	D5bCzcAI+jsLiQiFSAyeJQ0/078fiJXC1IL3mYgjFBju1drJqv4fmlEOqwYX5Ys8M5zgZbRLTmq
	fCeY/MfZTeFp1sGfVJyQAAfCydA0Nh1WJzSm2TR28s01USHfmhf50FqAXxl1UqskVHuFr
X-Gm-Gg: AYBFou3H6o1Cyte8F/AVvUV76H1pBINfuR/GeuhgLtUFbpNdyMkY36qUOiYe8FwaeP/
	ips0kZdqXJ9r3xvArBAheZIWUhbLiRhA/ZuRSwsf5j+auAOkA+wqLKSNOYosSuG4+kJWYPtBzUE
	kczbWijeAd6Ss9w53OhtyRBZBew9lNQT7H+UbFSjnYuE3I5McupFZcts3sM0xr33ZcpFq285YL0
	xsQnG9ESqkgI5R3xYnoHRPbYwqDqgmfqzZL+zt54mOFp2i3ZsYKL+lpVgLI7M8BLlWcYp2sr2uJ
	9lOktTx+xYDTOPpm1HfVPsRU3F2Q8o52fOiMU76XYgH8JDyevUfZf7+8a2aTUpXY9imA8+pI9l5
	BbH4jePe2VOl1WBuBkKFWEO4RiY7lkYtqYlA=
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263240a91.5.1789047026319;
        Thu, 10 Sep 2026 06:30:26 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263086a91.5.1789047025472;
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:07 +0530
Subject: [PATCH 18/34] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-18-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1146;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
 b=AWbH2geqVWHeiHrDvQWT133KWTzDZwoIXWeF3Vp+xCdeKXhE4ahjNbn8oOmeTrpBNpTf57pL0
 x9JlmzaDR2AAlzGHbKuVMR5f9tr2WTSXAQWEwDzRAeOrlRgjhsnr8IN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyJJMQeS/kD4Y
 VNhbVYTQnlWyorvsqjOQV6g9DP8B4vnpbvv8nsXVqxuCj5J+wimlrmefQwhj45XjvuwYCYg1r5G
 t5Hhimv6Rkj3fcIecWhX8pjj1RIEir8=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b0f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 00maXrnfDYt3cxgkip1kznVT9wOutePj
X-Proofpoint-ORIG-GUID: 00maXrnfDYt3cxgkip1kznVT9wOutePj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5f2ZvmzBJVkd
 YW8hiVgYyAPyqe1rGwE00kIdHNl52x6PN8OAdvgZwLaO+K7QFUcOyXSw6ZO0gUrhdRmI+Ntxt6L
 JnLidvdPfCZjc1cavqe0Sos05UC4vA3hDge7QJHM9IeO1VW8VdaWaPzmde76v4WKUs9oadX6F9u
 hHdX0WohXG4QycAg9RgQZbw/5kETbzGCPL2o9qcjoKes+CLFxjOtd89AFDTfysD1B27yOREimy3
 AyhF5giN6T5Z+QWsHfuZJtrJj/Lz28pvBT/9Y0WchRvzGu6d8gvMpnHK/CpyGSvQkb6+Ncbrjf0
 CJ/D5eHlpqgzsLceIG8V21uIfVW0yDcjagBG3TC9nwz3H75xls9LUjDQzw1VmJWcRZ8WLjP0QvB
 w32zmA49jhcLqSUOAT+9rZY/ULjRb2E4WdT5bxb9Ruq0wInBrvM/Wb66MNJeLBS6Qt+WJTHm8iF
 4xR6k2XgBjfMkzVgGMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index c72faaa0ae7a..e85d78ecac2e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -374,7 +374,7 @@ &pcie2a {
 
 &pcie2a_port0 {
 	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 };
 
 &pcie2a_phy {
@@ -397,7 +397,7 @@ &pcie3a {
 
 &pcie3a_port0 {
 	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 };
 
 &pcie3a_phy {

-- 
2.34.1


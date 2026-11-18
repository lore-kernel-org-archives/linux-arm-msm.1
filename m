Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026182;
	b=gJg0nCN9w1rjvbU7sit3AZ3NSF04trW9b132YTG/Yc2x1GaQBm8COmnbKw72/NbIf1E7
	 7dgWx+GDScbQsgbhMPXCE0avtCnaaU/AyU8fwpfM8xckc+DXUYEEyKUBFokt4Fryq7nsK
	 6lIY5hFao80LtCyFfUhxOJhQ77K/fAGT49BGeERvDQdcGA00wn5OYhZFQQeJKWEGo51fa
	 MRd/+OP7gcxzsMGIBJOZRfkviZJ/hOFnYNTEkkJcLhOdrRADA1yZy5Yuh9wOOC3AeiAAF
	 Ltw+qAA2+IJPoC7UDyqYGovDYYad8WG8QyOAhETf8DnplmHmOTliKqnrm0KX/gfARgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
	b=xqKkcIwdG7OdVlrnFkyVRdO7hSJe2pWn38p/EA2WNsxT83h92xg9SIV2zavEf6Bfigjz
	 vxqYmtt0zplJ5+lb/yEU+yR18c9DIW691yQss8Bp1o1+q58SWJkw3M46V2xJmbmO8ysIc
	 Fz6lEomgk0vLVrihjvnFYSv7ZbxpKd0VVwAYmyLPjRr8vxg7+qTyX/PN5elbx1+V65PPW
	 aEUrd6S61VQueY+35GjmPr+BXRK14LgbTA0eDYky/zKNgBU1zW3NNfKzIG6XE5dQ4q2vC
	 okbu4WjHuvpjHrUgwFPGBLQ/FSrmOAjeHW5GMCODp+G+Yv+2bGsVw906N67UlWIsAGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mN+Tn1Wo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+aqJ0BF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57EF60A3819
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57EF60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mN+Tn1Wo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+aqJ0BF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGgcw1844266
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pnFc81yYYBsCYXdJavDXYG
	u5dz4FnG041s4V+IJ9/+0=; b=mN+Tn1WoysLPHwmHMR0BvMVSl9kHh2GpWUpl0d
	r9t3D3mco9aOm75AZdqiamG+b2KQ/FJ5Pd3oP0EZJDqJwVQ0nbZftQNjuetvxfRu
	oOA9Ql4xrAM/DpTlE8oGJNw1mcG/8CRMG0AeyZDc6o7gEd4CDSMojeY3I26052K/
	UtxQUav7qBCSsHe8CbzepCXU8s/2y8nXAGK3/MgRVMWikBgIrlc3gumS/nR4F4Eg
	DwDO/UpSZO+wLGVSGqOOPp6qNtZuvyFM6V7sHXBbAHGcbKofI+Ye5GJYCILZZzVT
	S8LVgiCA7venIPjPrX1VduBPIwhjnyWjS6lbP+uaw6C+lmTA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrs78w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:22:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so998909c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795026179; x=1795630979; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
        b=T+aqJ0BFyHVrF3n/JF58W2/eNw2aiIYU077/fbvHNzs7YtMNIEaaefeHdqXEcpqt/Z
         L4+5WIGUH9qx/i8AUBXMBgPNN5DzATBx/ECNswhMZs7kBxlmCIbWB0o0hglvs2IfkHGd
         mNnk1AUPG/4q/ACTNBRxOFMCmDKWVBy3U/SQZTMAGdrPCi0jFoZcMsX1ucE6OxqAYyNz
         iRDqYh0KxcTwElcXZq6OuNcwXSi6yVbBnigDWjYlIPBPHzkpgeltirkZGtPobCHt1RVU
         05oiq1RYoV9dyULYGucc5ndZNpoSaYIX/SB0xQg6WwL+U/aJKr4W3DZcu/5rwz9ohgb0
         j6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026179; x=1795630979;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
        b=ADtqUeZnejVfyVxpZfLWv//bOBMPnV9kfTSTs9fT+uJTi0bmYstsiUi+OK7mX3lj1d
         EI35sj0LH/6DhUBxPxu6n/jGPQIvTPKKXyO1xZmIJcAGi7r9mvDuYcYh/ovTXa7182Cb
         SQEDRVDbl5WqLCQZnk3BFCX1Dn3tKHCQDQXolWK3QA8jfdGOpPOT37cvdujSD7JhS5hh
         QS4d5jwQpPAt1zxfEtPa7GOVbngkjAYkdxQoWEhiaMfkQ0eMIng4fCpauTRjVzEcR9ei
         EXcr8vvoB8Q9Z8RxFKSW5UqQa1jL+KSicyjOkS2M7Y/7ASlcl9rexL259qozS8IC/buG
         pTyw==
X-Forwarded-Encrypted: i=1; AL+hErHDwJ5Tfsu+QaHSNlK1bZq/YGTbEKdhldF+FNQK7vEd9JeYHn38ThJknZzz0o5i6+xZb79N2Cl2DR+/QJB1@vger.kernel.org
X-Gm-Message-State: APuU4Z9UFSnwZrtLBIZ2Byho8bTNBDRrl5g0qKS0V2TLQH0fZ4PCr8wc
	iP+CY5gSxBOMwdIpXQRcT3JflXnZinyNmewyF7L7ksHCE8KB56/pWjnv6UD6X7ob/Ix75lQDy8Y
	ha3pGE/Eh46ekhyJxtwqHIgMufA46ZN9eZgqQTRhgjtku876VqVulH/FNtez2dvKb3FGvsVS+Mg
	ay
X-Gm-Gg: AYBFou3/bWx5k42SibShOTD2uF5Rr0PEhWqdLRguN9xV1HSR0MBP20pWf8gn3WA1inv
	gTiz3UsObfPsNTiLNS7qMwmzpK/pT/rQ9TbKcHQIdGyi75DM6XuVWeoBxJcHLtc8BofxB4ZL9+s
	4/fOmffZnWWK4N5qBz/MfrpjDy3KGK+uuZ2V4Uzko14n6JDeSk0NmrjJMYynKOYUQgNnV4JY81a
	sisnFHjeSAVDh4j1cqELSrwef3TxQMhrFwgmigkrekwkcsb/4vnTPitRuvGxbDAhoxznwYvhSe/
	z88GhGYsYxuDR1KDjHZreRs2qik95qP4Gb8O2dfMtRdh8kMQBl987kT7E2FWJrrgFgslzgfDlKY
	VpTLD0LmjZZww0cBPN49s9iMJfqTpdSx8s244jVdAaqy7E+50dfd3y/GBoHldwBFk9RbzFa6V6t
	KhVVP1m4PHlFDHw94RnMEDltolHkwp7u0TG1JQ3OpiNrAIFi5BjvBk9xfA89kDn6PWKujf
X-Received: by 2002:a05:7022:f90c:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b543c1100amr3013127c88.1.1795026178370;
        Wed, 18 Nov 2026 10:22:58 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b543c1100amr3013088c88.1.1795026177631;
        Wed, 18 Nov 2026 10:22:57 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm7965663c88.4.2026.11.18.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:22:57 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:52:40 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for lid
 sensor
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO/s/WoC/yXM0QqEIBCF4VeJuV6hsajYV4lFzKaaRUo0I4jeP
 avL78D5DwjkmQJ8swM8bRx4mRPwk4GZ9DyS4D4ZZC4rRGyE5V65aK2KTg28C5SF1o2purosIb2
 cpzQ/xfb3OsTuT2a9M3CeF5gSuQhzAAAA
X-Change-ID: 20261118-lid_pull_up_fix-123aa8c6b744
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795026174; l=1001;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=Bj5SZGVz9qulaXLgZsHLr9ZZVmCLrQRCE/FtaZlIITQ=;
 b=8zdgu+bPt09BIENQEzQVa2Un/nebimCyHzTg9I3Nrh6iEG/qearc1srrxBg0aLh3MMDAxGT2o
 D2V9PRd4GMvDpVloJdVH9s6SOZeLOLdHitxTmaBLyFG9EVVFub/mmbw
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MyBTYWx0ZWRfX1ZjD59PrpDgf
 nL5zQS/iajEB3TLVBl6jUZ3xmzI0uQ1H7+FFLW4E8XPQNqluMiFNHwQFi/wJc7bEIjGqKvn15Y0
 VgnyMVxAzkt02mDIRK6sRRhKOmLLt6Ws0MxC/NqeAIa4HGjEAOkGT6gLW288/e6e+i/KwqsmhfB
 JKIo/TG1drQ6Ofg7jS8z9w3yc8BqeTQRdXW4RlniZD+XXeaCGLNVkHTBgX7mKkQDxCoA0/sYp15
 FFqOssQf5tsvJ82Pnkl6RKhmtEtSlSrA8ZaOAbgoGghYmT3O0B6iC6RLncCwLykQWQfHJNg/0l0
 rQr9Uw6eMgReviTSOh0MLy5z2oISC4M2jsJwMoQ0P6LQTekT+Jl3cdrajrAaY4TlCVNTCFfD1im
 JdMJDRgU2N3LwRurtqeB0ZmxSvfOPkcFx4GiV2hm2nkILw5GMzCVuoPv2D8s4e8uBVCZKtJlFkX
 4P120O0Gnp6lYA8MPzg==
X-Proofpoint-GUID: 80AobBRo42TOrFSX0aExG6mXfqCbtk0c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MyBTYWx0ZWRfXx/cy6UPIywJb
 INxxYixikUwTuYzhXwkTMgvMWLxYcrW5Pa3SQvjrFRRo0bvdjDdV9T8x6pyr5qpn29dlO5bW9YA
 x5/Cb+qDfVi8IeYiU5Mxq4BrPwVf+3I=
X-Proofpoint-ORIG-GUID: 80AobBRo42TOrFSX0aExG6mXfqCbtk0c
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afded03 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BgWmerUSY5PKo8a-cwQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180073

Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
Fix the hall-int-n-state node to enable the pull-up bias

Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..74588f4f7a86 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -819,7 +819,7 @@ edp_reg_en: edp-reg-en-state {
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	ec_int_n_default: ec-int-n-state {

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-lid_pull_up_fix-123aa8c6b744

Best regards,
--  
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


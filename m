Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2544E1C7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646121; cv=none; b=ZeXCj/VTAV8usnJcnRoR9u9WP6pNP3fdkUbobOGp6AAFuc6E141/kbrj9l7JYTkNBAdlf3W5upG2AqJYKXlV26Tl9rCd5H/lEcqtmWb7AWOqEWpF/Iku9dGd19cvTOOargFFo7AwLZJQAI/0CVBXrPxiHRW7IgmnYwU0WFRTps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646121; c=relaxed/simple;
	bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEipYLpV7fIPJzR2xR4i2lasDti4e7IJl9B9747o487gKrtS7YnI8e/B3VwsxmQ4hhp05Wpr4zx7FmKrqz4IWJQ6n20OPI8ppGELs2gMINM7md9TXI+OlBU/Owzna55tF/5FvvLeiYlQ8M2VQ/7C0uo8iCPhUb9nO6UYdSztYwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8ApK44a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeQVkige; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8ApK44a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeQVkige"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZW3f1257762
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=; b=j8ApK44aOG1Lh8GT
	zRejx49i0rhsV0NYm6Rvw7p7NZCi/Jmtf7BuVAWwTZvhddUcWcUTMd77KF9XM9jy
	JyU8SStzYqIHGlgIdNyMeupF0TAJYkWaFLqtUrjbPLYdygUTWmLjHQZr9zqgD+I0
	iDMUjfuGWICxZXtHBFd2V2+0u+vpgZvE4aGwUi32D+VWnLRnPUWj/Q/rjkLh+ul2
	MApcWrdiZ1MoPlDb6x9dTyoL6mRAehl6LFGYiEbXgXbv4cjfFww8V8Iusc4xkPmm
	/T1tfvS+Qn8JfVvCCWN2uYuBL5sgjX7ni6hnknEb7pEpkxpRCSTq9A79PtgtQy6x
	PHwqLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgkn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1432345a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646105; x=1790250905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=WeQVkige+FaBWjsEdM7r+A3Z8MVJkePvKscF76T2qD3lFp4641b8zI63LwHvFCzKs1
         oMBTf58AEne2a7ScHiAbqGGhfYxXuI79B1a4WQite5gQ8ClFTieJq8WqP0q+O1qfns9L
         J7bXElzOGDjoJh/owmSOIgx/y77GzOOLZ+7kiHrsZ6lwAyFK5Sym12uWSqfZ75cCCxro
         FriG0E4U1Ap9HT12BCmXoGrMbCa8RsRfQ6uQ+9RB9YcVgXHA6BHqpcT3JD8Idf+G124Q
         pRH+7Km67TJOSBs+W8gl0dp5nuRqU5kQ6FolzGQA4aN2Va55GEib0oUfU4OkDyWG1jv9
         XKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646105; x=1790250905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=vZT1C9/EW9RdlGU/IVIAOLZ6HUbYRqwEVOXETewxjYIrzbsDB3S+UN4kho1Ykqjawp
         Tn9VqA1S7I/Dww0ezZbB0f0oqpPcMMFXDCCMZHxZ69BSRQv2stSX3nnJFfTy9UMMWipE
         w6avdXkwZW4uTKEk8Zyf01TRXO4lOl2ShgHc4P3Nam2fJsnRDfUGONcR6O8p/xCF2zUM
         v/2Rg+zQBzovrgKrUYO/9NWCC5P4FJytrDUrjTuhI4D6I63sOOG/Z9PZS4HO7rck3PhJ
         x/gTOwABsQnNMh8BN66DsoCat2tDQTNEMLNhEK1qFlfi9wb0FzT6Dod/oxdgeZzvEC4R
         tCGQ==
X-Forwarded-Encrypted: i=1; AKwUvBys+fj9G3fblC6vhOFXVuEgiCb+FAKP+xXa5SliVlyK+70fElrT0vWdxghgzoMUVzDUzFHxsuAB/q3eBQ+K@vger.kernel.org
X-Gm-Message-State: AFuF++nk4l56uyalfQro+kZiJKFMTGv3PUnPT8Bqo92Gi2dzWwObqfvC
	kJRitjEefRecRiW25hPfF/3siONef2kdnbukbGOt9pgU/RSI26GGmjtxzBd7Y+YJkOdrwbjnQyx
	CoA6YzFe6DiY+4z+SPoE42if9KneLwdvAqNVYp7iFpnIEvb0OMPWRljQUHS7f15kaskqP
X-Gm-Gg: AYBFou1Od1zGjOxKVnCkz6FMifEisKQBH9Dy7dSO+SMfFTqOAVVMgO75MyNBbtjxlqO
	VjEJw1C/c61kzPS7ajJbUjFxmliLHifzL2xB99oshj0mHTusol9rVdlrdjeA1ij+etqOOBXjdvC
	+kGJitD1Bck3zL7LlsxyIZbM+KhOAIktup7JSMdEQQWyRqDhgUJiA1++RlT49K3/yQl+srdd3Vz
	cLFOmBJ48TFkC9zaDHsxoYc2kEuO3fL4puYhVILBYz5f9JPHhPyZcRtcpuEWwLJ/6+0jcw+Y/hA
	ly0RZWDPI7MLYRf/MJltQkRB6uMGRFMOR6ExYnuSLSKEsVZfLt61YAvGpNHuH9nnpW5VagR7wkS
	bqyvaDFm+HkmGgX4bSuWebmFEB+p0JnzH9g==
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr14854987a91.20.1789646104483;
        Thu, 17 Sep 2026 04:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr14854946a91.20.1789646104072;
        Thu, 17 Sep 2026 04:55:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:15 +0530
Subject: [PATCH v2 07/18] arm64: dts: qcom: sm8350: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-7-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
 b=puig+0BmWukdWl8Y9ogPXz4mdKTiHsG6QDjh0p9xlpu8lR8z7JmfHfZ5Me6nodhoy/zvogCSM
 8O48bAaAp/hCmZJqJY/0XrpiRsQhRx1Ur+UoK11g9JhjezNGf2zpzpb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX1QVs2hrkRhAU
 H4qJ8eZomCrbiRNOHcj7m+7EXoeg1EXyJ7Z1TsLeEZShX0ZRPMp5CDOTCrF5F3eNG2K4wGVcGxm
 WvQ9WbO+3rQy60JHvy4P6FstaccJP7lciXIvHK4GmhHAnw56OhgtVMf4Q/XYYCK1I7SdNbMjUYx
 CdV+R1H73/iO1QJY/6pbh5NPPjq7EeBO86SwGdBKNABzobHaueiYv4zCvXM1bPUafo3QG2Swts7
 ZOR58287RKLptx8BSJvnQqTEZRemW8YC6HIBT6ldNXEk5jzBEmy5QoNkdrC729c+cZBx3aam31o
 qeW6CqP2dAwNjU3sShKzEdoeR24rWwuN4Lhp/1q9pcYZL3J4ipFFErKz1fDV1ynqzC1IVhD51q3
 BwUMqgoG8CyUJaO/d6bO6rUdGES+qLQYvYwGPpjwPNd29dtO4Fg4uXYAfbDwsLfSm63VHEXsOLD
 mhAXVEJ5IL/aFnx6UVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXx84ta5gMZbgd
 tsEzCtlsDUEN/TvzLP0SMHJYLhbnZT7znZNqia/40r1/HgqcAGGJuLwc5gwK3tO9xqO1Il+rvhF
 LleiZZgfjH0Pr3K8lAxnC4lgkFY4FBs=
X-Proofpoint-GUID: wrpyeFlI9Py9keBS9awIEWmmD-pl374m
X-Proofpoint-ORIG-GUID: wrpyeFlI9Py9keBS9awIEWmmD-pl374m
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd519 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index bb93c3e9417b..e9b9e03f725e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -500,7 +500,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -514,7 +514,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


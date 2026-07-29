Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997CB44682B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320865; cv=none; b=iBwTKbg4fq35RlC55JrC7QL3nxx+7E3NtvTq7VZI7sHY5lnKJQSQdJ+czp5SEXd5ZznzsBOURFOrjHh/gd1h7TvMFNweciSAVEiMs67DpdduwDnKDIsd4q4dMtZ7xXs0kZgv9erlkyWNMCiv0qa34IIk4Q2DHGV6SGzpA20FEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320865; c=relaxed/simple;
	bh=VA9ryQpuFW+TP/KlLhRrZsh20avtp74GOWPwmq6me5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=og09Gxb8SREKvdMqbe5ukXZRPSTJc0pyVZT4o5nIZSGhvT+bEIUiYL5LjcNXZ8wK/MW5caN0CJBylqQ9B5KbwRDBFuT7Ps//luFLZ+ZL7i4/vFjYxYa8JVv5dXIDAmwBoRPfss1jKQPJpLadUPpdTxUChT2WhqemFE8zh8tTG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geRhkQ1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVLLOboP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geRhkQ1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVLLOboP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f3ei1167941
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=; b=geRhkQ1R/KaRnr5p
	Y6fJlxSyajb2ZeAJwqiiG5lcNBG0ymcbVUJ3+gf9UwKdmhpu2OejScJ1WUZLCpo3
	BoU9w0AXSdedeVG4Y5O7CkY3Oy3Emjzliw8BIG31SfHA6TtR5RIb+0qwHDFLwS4U
	Qz32nf1VWSRoif3xL/uZ9243USFfyfvWfF/X9ioDRNe0hVxcgMN55RrIGxWTSawv
	EY98V3CStxKk5ZHk66N1B9W+/K5MLGkcmhz95k9hSem1YbtGOA+1NHr7Md4Q1xLH
	+XEuERwCnR90NYNK+78g2nRrYiZ7ue9aOdxpzNSEwHW+22YOMuMT0BLU6v88kWRP
	tvEpBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbhj96rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso185830a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320861; x=1785925661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=;
        b=cVLLOboP2sRc7F4lkf7xscwv2KeIqYRgQS9H6psv3/Fzl58i7b+PPl5SQdmm9Rz1a1
         wehwPEPTkDAH8tuVOR4An6pFoE1AvWgSv5dLN2a+XBGXE3PcMjeDPMJkNTfwfLozC4aB
         bJG4wjMgOfTXO0/4Zjcx+AClxeSlT3lv/CSrj6fES0wumDd8w6eHqnoXqGdeBMMOmOXW
         YCpiVRuXdQ+vzdDqlp+WRBb7VsuZX2E9lXK4q+ZlibjmhHBXNxTPVpwq8IazIW5oCuIX
         aqSEjZhSZ2eMsMPas3rhfjmZy1AxbolKQ6VJ+2eKWLmgXPyB4HAKuSLlp+EkCBVynAGZ
         zgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320861; x=1785925661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=;
        b=bvI+VjchZrPJLmOBHvnB0CdxroaWfW25Ftd0fNyq5vym9WICz3j0Y5j5FrLXiiNhqb
         jV298gj/QcM17MvjZXAY9TEB5E8BzESY68jjLswmZ8xr2cY66dj36AH+zT3aijP21688
         xqonEw1OyUP9ETJpNQAhtfN9HQ5+qGZgQg6GxrGimN1Ug686jUZYSTrsNC2TchwzVFYP
         74vvMguLFsLSWk6I82OoWmuO2vYzonlECwzlKRMARt5BDXh6iKdPFADjxS6ZZxKb8GMr
         VIGlD+UYugysKn4Snj/hi+xLVH34MEIww9ekSVH2YGqpcQC065uWsBYn+paRZgmE+MJ8
         mmhA==
X-Gm-Message-State: AOJu0YzUXzn8lp08ANrI8INXW2Ct0ljJeQtkoJnceg2Y/y6NxDwEgynu
	nwsU6F94n+RCneXIxG53ygGzjs0FMPUfEL7eYS35Fqv8WVxiLJ+P98pAibTC8u4eZRZ3XWg9OE3
	zNqjkp0juOaPARwBqbYb+FtdoldNJW6S6g2G/C9dQ5RIX8yCeX6kFNjcVrg0QTVObAwxr
X-Gm-Gg: AR+sD13/HyOzWs+YzeUeROeUvYyFdP9nFbm7TYoez4q8I8VvT3LXmAFjADmMgKSLwIQ
	4aRR8SZ1cAyK1uwR78Lq6GTA3xDgARmgiXYjfJ3pW/m4bOMhmhTSVmxzM7r1qvvPNbYxjNxEpM8
	4HC9qhKsXrjYqbBTT0Q7qFdt9Q5Ym2Zmv8sJT3AHqTy2wnABUBHwZlw1Is/tFgi12GVUB+7X84R
	Jl4IFJkBK3W1pDDQxsY9ty03Q5uvhJf6cvqT4GuiVKJ2o/Q2Ik4bI8OD0X9GdXlqkorUskTx0Yz
	J9n9SNSPkGJIFnK4MVF7OVq7M9az8NLc8H6Bj3J64IAuXrKIv1fcGVbo6BCq3D8k7tUj3/U5JZl
	l4Lr+NOlOTYAAeI5GQHkRarrVDmMfVLzg0n8On4w7wy2j7Xdwr3c=
X-Received: by 2002:a17:90b:1ccb:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-38f6a3796a6mr5651513a91.4.1785320861477;
        Wed, 29 Jul 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1ccb:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-38f6a3796a6mr5651484a91.4.1785320861026;
        Wed, 29 Jul 2026 03:27:41 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:57:26 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-hamoa-m2-dts-v2-v3-2-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfXxq2JJLfbe0F9
 1ARb+q9J3+lDoRXMFztGAEUCqdUuoMTTQ1REytynYAn1l+nB71Fp6KgcGQ/hSALmpvwihnMuK3x
 jjsZVO4VqK2PUIhfycmBGdYRqUHpeYBQOvAAp8Z7rflI1Acix6DvbNZj2Wi3ziUHgYLCa2Lp/56
 /YQa5FsxsXAejUwQE+8fbsbT9b5TcMtkPWdRtptFaUITIKOKspjt36TJT0QYa6GvEhaeqMM2f6c
 xjBPg17899g5MYvSKzeMKYloEshWsxexEljwHYTkry1WzQbRr0Ly0gMCTV84XNN7Spj4XSpHoqc
 6DpYtbN2mb682LBTaCYE2gHLkQt4RYp1MK+5Vlw7qVFiqyQ9ZotoikfSloDB04BvbOqsUoiXcJx
 jNVluO0z8/c4bAqJmLYp+gV9SOTlr0JdA0zX2Vv+29Gm/Vx+sUOVjTFKEBerirfeHI5VH1wm89G
 SNMRAbxqKeuscpbRxFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfXwKHJHQcw64Wq
 6zw5C/8Q44QWAZ/WGZApcAJqsmM7QJXPtwSUeRrg5Jr7GLil0jWi+2erZLcP4yeG4Yvvqp9IwPl
 zAY89E3BCoTNr5TBz1vBq8Bi4G9A7rU=
X-Proofpoint-ORIG-GUID: wnUldhXPTpa0T0b3db5jG3F4UiuIECy8
X-Proofpoint-GUID: wnUldhXPTpa0T0b3db5jG3F4UiuIECy8
X-Authority-Analysis: v=2.4 cv=dsvrzVg4 c=1 sm=1 tr=0 ts=6a69d59e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 724471152fab..767d2fb1f113 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3782,6 +3782,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1


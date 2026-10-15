Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA665275A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058182; cv=none; b=c7N0nlKxbNEQJL9BdcnHmRKgJ4x57BuJMNLW5hpqya+LYs6Do++1B/EA+6fRi5OpeNqnfhF5bGJNJKMEoCLU4ITbpgIKxzlmWq2Tyr+yLJ/pKjjTQghRKn71dTxmMrVrOLfQE+b5NVzMMmwaS11oFR/gc73rmNoVyWkwPwqbfcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058182; c=relaxed/simple;
	bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+75CdJUjUi4lVQkhmp7F/0IOHxx5nYPCLpVzMy38p2wDx8W67ZocWzqGU9NY7gyLflTe06Lbm8tOMwYjj1OjQp9ngnWlpih9D6xJOqSwJz1ZaFgPb5ElOlCOJz5UJCWZFfGCLBAeVlRBQNKRe7ZkrS+wnMxlxkvYHNq6eIo53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETHsZN1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLYO/FXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETHsZN1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLYO/FXD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jS8E2662649
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=; b=ETHsZN1Ob0Wfk/Q5
	1JsHMXbn2Ob49GRZmn+Yg2nCWAzR0J9Vnu77a2Q1m+kSfPNaYUGrT8CSngAUA/3j
	YeIa47ba8qMyW4sRRx9HcaJHAJztba3lgPgHW6zBhCLt+9SsB5SWYtggi5uNwPLt
	3DKNINqjMxBgDaMMsHdEmHzf8/MybxKu4jAKmqoA5UsjJTFSh4X2cs3Q7kLyTHv/
	7t1M1kUe3sZbjT/29cqth8K4CsCMEZNr79tokVnJgdykHmaAI4hNYGnYpped2XmU
	4BFS7hnmD75PXgTXSU5JZvTTOmIeCl5U8eM+m6zxhWJ8XREgMmmpbD1oU5b80xke
	06y4qw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1dwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-155a75f91e1so1405075c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058178; x=1792662978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=XLYO/FXDEuGwNYDFfrAXw5F/ppqeKksq7GZjvbZJtc3WtX5wSYDNjcv1aHaNnMeJTJ
         SgDtTlg32SEwoWjAItH1I1hgCjaorS2kZdxbWCdPICl51FzxfhQNaAp1fBQA4kyJzmop
         q37Jt9JxWeibsjoLBbeQOtyKKeFmqwj6KML4HFlGGvn4FxvaSbqZ8vfQQ3mIlvIt+a9K
         iXSJWpL12cewtb5BEQZlFVOsdWPpzgxaoReU1k1w+/tKmjFbDh8Srs7Sk15pw8ASRuD5
         lYu6nzwqSzzs40f8ly+AUBPr7MMXdHp2uNBxO99pYR3c9JMeeZInXljXZjk3kt1B90hS
         wAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058178; x=1792662978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=Rh3pxTfo9G+m0m9guR5sCDL0l3SUHWXd411K+E/reWPQVhUNoNbtjqyvWT1mTFI5TL
         +X59Di3Ev7yWX1yaQ9DARuHswh79DU0YcuiboOBM1DFaEJFa9FUGxn9fKm/2taqkUnSS
         oVEyZqD4lla2tD+lcm3iZKopBBVaaNQoByDsr7gdXEwf/dU7/NHTx7n1ZSbQEwryQ2B1
         eOYs4jzIaaRB5Ss7uCvDBltf8V9fDfB5dtOQGjbFbxGs/HxlDJWEoNVx1bKnMevrIHvi
         6BqO8uV5wuwC+deHCJ8v2B+kwTCAa9jKFEX9uYSWMMqYLi1BT2ZCmm2OvdxtW+GimAcb
         T5Qw==
X-Gm-Message-State: AFq9FYLc4Q8WcqQb1g5V2/PVk12kJ15uIH0c8kGH2IL//5SyzoIjO2XO
	wiNUXCZ9+HMSgOSTnv8eqySM84w511tGXrsXBWU8LbONA+0iCzP53Cxa4aAgh7rsljL9QBzfd+T
	vKlVTvv2GvFzMQB1AflFt1tUn9hy9cEmY5Jh5vbzBUAOiK1uXVTWvwgTFb4jWOH4vSvdK
X-Gm-Gg: AYBFou3gGVIsIwVqzq/uBtV9y+iu3VUs3H2tL1X82CAMh7V5vqoeVgBdaSTDqQmVmXH
	nNSgFWtQ4yAoX6wSCqBGD1Cio7h5ZJQ/k6mIEUL+idiQWfqS1hMsjuEq5z7016KLPa72cWzn7HX
	m3+2PfXNVcodAUQf2WN64h8e65sRR942FAxauMLwnfZiVMKdcOgzcfnW0hz/gJIRoVtgS9o4Xtu
	R8l7BS8KnXc8HwRAJ4/Xfkvx6yrqpgabwZGQFuVZpRwzi8p67s6PzBpUFkCvfRJkBOMeqeSsbmA
	pLLBrDXbsCo59z2hWrw5r2s1dlRdld3gCIORW+FLvzEs1WNYIXUOymJgT7iTwIp3e4U1J3CuRf0
	R34c2GVr4Ik2KSPhjztwutmvOiL7d
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143288c88.20.1792058177692;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143254c88.20.1792058177099;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:24 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster
 low power mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-8-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=846;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
 b=DOguxFdDz8eXRwGTpwXmM914l69U245h6uQPMgNmIWIAFEd+ABsBGuwQIW21R3pvV2Ov9j9xI
 kT3ddKmka8EDL7zEPOGqasjxQb8I6e3QFrxqvgEBADuzNKOnUk8j7Gt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9Ozrb1ADB04Y
 4a3whHWuUI2P+mfqa/aeeypGQcrkBdmL5kXnsOs4b6MQC92qmF5Rd4+7aA1aSrYeQKU9eNa/q2A
 QSWDer6B041USa6Xi+aKb2a+2Em7g48=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a342 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SQDDdHR85c743OeLlmwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: AOD1-zsRtqvsN55RdgHpH95shUsMNzlz
X-Proofpoint-ORIG-GUID: AOD1-zsRtqvsN55RdgHpH95shUsMNzlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXyr9xo19rta2A
 txx3wtvFgw9RgmtPIUPF+/IfOPwy6fbQkjZZcF6Wka3MoMpQVub7gemkp4NpLqNTHqkxDcPs3UF
 V1PKpkaxnAablnh1hKfEf8mJpDsSd+xmu7pOK9ei0pws77uP9YpABCeMO/j1QGxBc2/3lf74b/0
 K03TOIMjwu3c3EKr/ddIb9jTnI/FXSTLTJRE7DcGfNl9yhn14oI5va8UyVG480I9hzrw62FKXB7
 6LZrmiDEt+1m22epO6s75jlq5hteh/qR6fVr5GIyWkE3EDnsJ/7a+1t+wtGI5BTzR8F83KY1USO
 QxvD0F6Mb9xO0pBS8KQ79lzMGjhEqh+Jewhom5d+mKqXHlmlbyvF+Mso1YbVXxghFpukUuag0Pq
 upC2FDLIMkvBm7v2hLvKjC3HEoOrPxt5DuhVRQeKPWIrDGQ2xcr+wBXhOfbkmMpUiDdTjZEPK0V
 AISjqoDVT90OoSqXKUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

After the recent refactoring of MPM driver to handle RPM notification
under CPU_PM callback, the CPU cluster low power mode works fine for this
board.

Enable CPU cluster low power mode by not deleting the cluster_pd power
domain node.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d6552801631e668f7a43f5ae1c27639fd4..73c53af3eefd31c6b551f83f7675018d502f23e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,8 +244,6 @@ &cpu_pd3 {
 	/delete-property/ power-domains;
 };
 
-/delete-node/ &cluster_pd;
-
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1D5275A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058178; cv=none; b=eo3P94+OnkqLp0LIIwtmOOXNNDbj6NLzBsBjruCETmX2jvx8C72ajC5lV2+IW6Ja7yTYHc7Ig1AEAiME3O6Eixo3O8NxUc+eKMvSRhRqItpL52RbI1nIlXqRLYUSWtWtftOcLzmHpUCeiMzxYy9X4XBCpJ12+9kXO4sYp1l61dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058178; c=relaxed/simple;
	bh=uXma0x2l2wqBjoOcZzn8IVH4sZ/ICl8Q0BX6Fyj3Fn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLFo4uHqpWk08BfBtjyX4coWlcVayjj2ZjOV5jvmZZlTZFMYr/kw1LEg9pLRDoQGMBo1AjEj0HdEym3AKc5IkqDjG/t1q54wEyZalhYslMZIQvrvdVvcILBkrc1f9bDQxaElVJNy6mB8jj4NFS7BCA9Q2xjxDfD4EhWoifMiXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsMR7IJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhFJWdUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsMR7IJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhFJWdUr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVhP2416910
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=; b=CsMR7IJ2TunH9DgL
	cmkQ/e+JzfleuNiIjiZDoYSUvvum4ZNSBcVL5QwDjOTSdn/8x1cw0mXuOAuUbC+8
	wXSgLV5dw5AXXu2c7mNr4+olSuC9VlOY5d8fOkH890RrIuUajL+lD3EoNWjMbkf6
	NBp5eliZXpbVDi0RtSZP0oHZgHjMejfxhbVRm/BtsCVkiK8STjXd/4xnVs8t/z+3
	OKJm5JOSE/Xl7tKnMHXtwzlza6KTL088QApWEmaqfPqjIyu8i7udBDNixoAZ7/rM
	6JYNOUHXd9rF+gnmX+NbyGeT+p5GqkVwraVujCL8Oe876NYuM451GaQoQnMhzSrM
	tdQOIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhfu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso8071036eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058172; x=1792662972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=jhFJWdUrhvzlOP9E3EoqEVOwLjR13D8/6QNlom8+yJT+uxZjCasASbA5c6FgTcnIUM
         O405SWl4BLSKvcYohxi35ZzKueqjHSuFPoMxC9xrOT0eIZzTpgEOolg7k+VDxWhnSdqB
         lGd61fyOqHI6zG7kg2QPKtn5HuvDo/Vw1cmhI1L1oTqBNcxkvB18zRwPNzKRj5hp+evo
         fFWLhjjzAFWc6rixFeglDH7iNp+R5QIeN8MIAwQuaPMvc4+dXH3hBXqH51JKQCHNqKCc
         XCsw1H9/vLC9rEcfNbtlJxnx5WZ50e7QDkpM2MQcxRQOQCIeiR2phJsNYbIvm9X2jXNp
         GAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058172; x=1792662972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=v4p4Im2ao7MgxIot+J0q4dRcAc+Lc5VBrYynJ2vTSmp/opmSm2b2uozWntj/hlQ7fI
         7gHITrWuOUnTYdsiU/3tAyZw8n+Zugz//qlIDr/kWzhq0Treg7T9ob7F6ruRzFiZhN1B
         lY2blAAUFIiaIEF0wNLSmqL0TBVnAmq2ZTAENMjFtPo2btBqHg/Zwb6W/nYSUXL3C53I
         wFlrAM9Orr806fPXBnJEzyjVuVqIWCBk8vVOTyGg9djFUyRrIvGuSH7iRwsMVj8frLfS
         +yMlqWxYgGyYdn7iVBJe+rLDkVIvGXx9WuboArBYDGh8hjAxu7xTGUfn+MG+zTNIfsVA
         JbXg==
X-Gm-Message-State: AFq9FYKBXUfkCcLQM3YPakyWchnwFuvJAXPZz/STmWkuxfeUOXTmjKRZ
	2zTQacBOwQ2DJ9q8F627Uzig9dzxnlDDVoMWKEc3M+npfCWjX8prznXh6VfpW5dFYPAjwBrWJxU
	dq5gJcZNyF9RfPhGeYP3xPJy/7yIqblQI2UETg2sdmanzLK9n5VvraFsjmUukDs6+/4lN
X-Gm-Gg: AYBFou2T+xmQjSyczznTfGLDoWYGWK2FPBr2r4YtMYu/YIX1cQryJKqbBaUx/Ew5k75
	H7Eqmr4mJa3kCe8UDTAjoqAVj4xUdB9uL5Zs+HDHnoHd/XkSvzbAEbxHLQOGXIlo+YtESvxjTK0
	zSfLAHLVp17RVlixoxyyil37W7vT3V7gv4wgg//pIycEojZJFcQoupFUEEo8xJBKGmVSGcSiR09
	Fep1NxUyrmk4Wa/m6iuKhtezMIRIBdzhL2TgIRJo5WZArYaPlNRuhyfZiKzSHOELi3C+cI26VVz
	FqsVTwgTlI5uEatv8+MCfebD8/K7mRpWRj5DEUPH5Lq0d1xDfey4GvoqGFTUGofj+KmN0YiKbPC
	9RWTaL44bg6p2ZjVR+idAWC5Yy5+2
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481540c88.24.1792058171731;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481502c88.24.1792058171276;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:10 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:23 +0530
Subject: [PATCH v2 7/9] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-7-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1132;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=uXma0x2l2wqBjoOcZzn8IVH4sZ/ICl8Q0BX6Fyj3Fn8=;
 b=DREdCntyDkJs8jeJyOQDvcGfxG3Sw6cmfGGxdznbs+Lih9GzsyrTm7LcSVxLK/FhKBY6SYkJC
 hfE3EZvvdZGBtKf6kDZOv9zVh3hAIoo3VLr7+MzMGM9+Ib3gb8Au9/S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXxDo9oAmxCX/2
 l83aziW+uMC12P5Sdn9uW2tLoHIYMimUsuhEhQyy+OYTaKCs5/fChwYag37iTHQ7iE8cTJdSs4L
 /OWWnpa/t493Jsy6xSinAXDx1idIb/TOaq576y+DrNtSmSm2JuuSbtJ3ut0r94DAQfWAfH3T3Tb
 pQV9vEQZ1svBYgcisC8pS4lt6k2Ep7L5MAQZtpUQqUf0sMjQD/BP47o+4exJy6+QbxQ5mbvAMMF
 bXy9qkHCPIZ8AZDHV3dD1VhOCfiQLtiyIRA6UL4I1YAjnZuJgqeQ7F+4Df8rcBOLGMuXjblCSfo
 KVhdGnUaXPhgm54BYPlqgSRUNZB7BSgVY+G+K/gsR4hWJA6aK6NEMQgnLJ5mCemGx/JTKV6AQ+Y
 Zky2mz9DzYKm0QI2RpVzXBz1vxYHbjwNGjIQA2v6i5B8qUzsWMm1LRmCl0WuEan7AxRWZwDRVkM
 ZiCY0zCzRxBvnn9UIuA==
X-Proofpoint-GUID: ekJjrlhjs2O9iMrZq-PcTmxLXUzHnoS_
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0a33c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RDWDdWZ4iDCRx9RkWiAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9KLAdmrXRA44
 TksQIKvKPdN0yiRil0j6J0OzD5M/mJMKxQoTIM8XVNCXrjC3iQ/VEjgvwbwOOvYXDt9K3J5KE2n
 YFJwQz9stjZfipJ6P9usEDbZHojWO0I=
X-Proofpoint-ORIG-GUID: ekJjrlhjs2O9iMrZq-PcTmxLXUzHnoS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep>;
 		};
 	};
@@ -281,7 +280,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


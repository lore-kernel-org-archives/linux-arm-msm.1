Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F24499BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434098; cv=none; b=s8xXKxBgOozr3LHigckL3R8JbA4d15pbt+6Ra3aUxz63qyM4UdF9ynNkMY5moVxHNn8QSU0747EM8nClNLrNkIcS2sIyNcfYipdWpOoQ3IS2PGMWXZl/vsfFpGrDhcs3CZtCmtzZ+lrVMqpxB4ZJGc4UuzMwpalsmZnmnOdq5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434098; c=relaxed/simple;
	bh=pHv1LIJ/NnzCYWyu6B/xpT3QnEB1d6V5nBeeOY/0aR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRVWs0nMQkjDR2haSt7N4K8DlN9L4V0ORIwSb6pku3ugMic6L6Ys5zIYpzU6LKm6HK16KTsgij0GRMqHAp8LLgjUq6kCPz5f1gjwKSJU4aC0amraDRxGfvO2WWAfqdk5oj0ztUEvn1s0M7jtuGK+5eiClx4n9crQSY/o0Q1Wst4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITG0MG0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKsF8Jox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITG0MG0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKsF8Jox"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXI00886121
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJHw6g0PS+qFuv3pxU/O+U7R7A+GdDIYmHXwaDVRWME=; b=ITG0MG0FzLre4g9B
	Rx64+gheJo/kM2INSUom65qAOW3hepBHWSLVSN/nUFVeUM7+Jez2ZYZCnr4/l08v
	pIfqvjFoBvJbCOrroUTW6UdJXOp1Q6RS3CI3+B2GNXYRNrm0ztEHrrkmzQ1HoQbX
	jFsxr1AqO4q5sDt56CAIU/GrtzasX/N8BvaTuiZYgY3uNjD5+pwbWCWzeOd1h1Gi
	klu14oGVnNZ0Ww6dZFPvhOAx5McCKRy/EQivcBMOe2tzrYa6wu21/qR8EKVZlHqp
	LVTvUnNpcClv3jy+eC1pE4/WTSZdyQhiUXV6wvhA5pDiKYiEJ1hn05eVH78W9mvo
	LheCdQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7s2rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso143467a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434095; x=1786038895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJHw6g0PS+qFuv3pxU/O+U7R7A+GdDIYmHXwaDVRWME=;
        b=RKsF8Jox8F0SyGqQaS/0UPSzwC8a3QxUYKZbEk/y6Y1e/6okoEfjr2z0mjMtitjVIk
         V++ps8ocjqNffF4LEhLMa/dkV+UahQZK9wxVKGPTGaggvKcqae18fy3sTrD3Nic6bjV5
         vo3B0Lha46+IsK37cRuV3Rsc1Sl1T3hoqpkWRrG+w1a/HxrIgc9oOIpbq0//ChM7l4SH
         bgoCmsmnRScTKhYMn3a3AGfK+mTrB4vD8bfD1bveOBLIINkcHgrkILVCzX3zEzSRfLmG
         Dkx8NHe2kCxAbOQbc0jgNPTqXDMGRJkSIttr91pECPJb3qHO5EpLV/o2TRK3ZL+LCeB5
         LSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434095; x=1786038895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJHw6g0PS+qFuv3pxU/O+U7R7A+GdDIYmHXwaDVRWME=;
        b=sIjZhD2UOPGs83jSPj9EschuY8YgpcbcPSavRrHQp1wuGbDrrMdTaBAHmZCBdX2nTP
         ZnSuI/Pe1vqYnAhnMRZZx0dRqaAkR3SfFI0bqJeSZEvcFak/tMauKWsmD/V2qjisB68r
         ZTOhghl5wi+6DVdmxFKWbfCPu/cqPi5KBIBukowxg6zz6vyJ8Mn5z7xnBqL6Mya5QkPR
         t2ASH8VO/pF3iGBirQEiFgxjVuyVHZ/FCttSZV41QT40p5iv6ZEPsLZYYScq7Q8Kfq90
         y5CAxdfgSLs+nm2L9EfSQw7c3e5y4IELmbEmejKEBTYJoUnGC94xrU+CCxvmo+fFrZCd
         tuvg==
X-Forwarded-Encrypted: i=1; AHgh+RrFx48EDdkzOFvJoRl7xxigJfg7gwx962VSukogOC8P3XSHSwTi4rBCRXvmHHe2Ho0Om+1Dl6AFZ+4sHodf@vger.kernel.org
X-Gm-Message-State: AOJu0YyiB3iJm40FLq3E7ySgVUpvzgP/MbfGUxYTOruly6RyOjrzC2D1
	ROEAyDKEKRt8OSSIf8UVMjMwsG6dE7KWqQTczv7l1tgyPverueb5uN5QfdTn3WVrl8wI66ztWdc
	i08n6duOgRVi2/WTO7bA20zMLUDea49xkFOqfu+G9AuYuwHerWoUQS6hxvvmTrK37OcHAD9rpkS
	Lb
X-Gm-Gg: AR+sD11HreF4Mpo9oqreejaXxjLTqC8HGX/lrDZ1cKwlDAaj0T6H/Ky5cgd46u1gkKu
	MZTFudyFS7dk/1QCoaq/1iGvd8QfZmM8jOJ+xBRqkyWc0fGo23q+S5lDWJsmKWexL3BwB5IeKZG
	cVs3DPpVl7hUC3f5RuU+LH6D4jmw+7lux8KAzQ/y2oCTnBVIuTEviti4glQ+oeEGEpPUnzO+LvW
	felNS6c5Sl5OBfocFpllNbtP0NQrToYPqz3k+oHN6nt5E1ZulMlxgT2fRTUwb/y7PxqslCoEYVh
	lJYKry8WZuG+ahUph41NyZPr1mTmM9AD9rwjrCJvoUO38w6JnWvxEUclYLJMR4YWjt1DG9rTG6+
	yEo5+ETOAXfZFWNNPO9h41vAQ
X-Received: by 2002:a17:90b:4988:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38fa7efe9d0mr772443a91.27.1785434095201;
        Thu, 30 Jul 2026 10:54:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4988:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38fa7efe9d0mr772419a91.27.1785434094769;
        Thu, 30 Jul 2026 10:54:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:35 +0530
Subject: [PATCH v4 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-2-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX2JBIzDVVdj0f
 jL3cUMBV6Sd5X+l6sx24YxEF/+HWHtKI1YIMUmIO0muo22CFseWH7Cp6FKv953evVLnoyD1LbR0
 zJo8asHxA3H79gUy5CtKWphTwOMkpsasfZhb0K3iWSBnPsd4q1AA/X7tdnFVDs42elMdU1j6+i8
 lf6nxr6Rq3FnVCjxXLUzGoMON3DNvHd2KucmQMGTWyYIruW/A2ZTxMwguMInI+dhO8/A9nrMofC
 dxNeLuNzGDx0IRFx7yYjBYc3YHnkQhy+CAYUQM3E8yQI//hWzjfavIOOHvIYS+IJlBbOGbVQPVe
 JvLt3S4WZP45EmwNMvQxLQd3/Pi8VI1e8LfREfkXgn6DRgvdzC4Wit2sMgdGb/c/y7v7xYrOSoy
 YY2NI0TjfdNuuk6QfEqfdDhPv0ksgPHgOfW619MtgHBkFYSST9EajM9vUlPcluAKCXKpce5O62s
 OtJ/o+qSpFVtrpuRLQg==
X-Proofpoint-GUID: DGgcRyKcqVlTjxmdKVClfxxrzI33WlxA
X-Proofpoint-ORIG-GUID: DGgcRyKcqVlTjxmdKVClfxxrzI33WlxA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX7RLeDPCQwNRv
 wzX45XhWWILATFYg0RFN9iADtv2G83rIiiq5ooKPWkl5MXGcfzgh4QgDL7xbS4KLj33lZi2zWIB
 9T0rC2Dix//PO33Ud1zScFsGxXYXAd0=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b8fef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P429_X4V5ieZ2URlJ6kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300133

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 32 +++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 19ae0634b922f2b6f6ad68aeaa051e0a6482c635..1f3332275c1728b0318c905975ee85bdad53780c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -24,19 +24,25 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,eliza-tcsr
-          - qcom,hawi-tcsrcc
-          - qcom,kaanapali-tcsr
-          - qcom,milos-tcsr
-          - qcom,nord-tcsrcc
-          - qcom,sar2130p-tcsr
-          - qcom,sm8550-tcsr
-          - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-tcsr
+              - qcom,hawi-tcsrcc
+              - qcom,kaanapali-tcsr
+              - qcom,milos-tcsr
+              - qcom,nord-tcsrcc
+              - qcom,sar2130p-tcsr
+              - qcom,sm8550-tcsr
+              - qcom,sm8650-tcsr
+              - qcom,sm8750-tcsr
+              - qcom,x1e80100-tcsr
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,maili-tcsrcc
+          - const: qcom,hawi-tcsrcc
+          - const: syscon
 
   clocks:
     items:

-- 
2.34.1


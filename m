Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8848593C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946204; cv=none; b=i+STO/L0gkFKMZLRgTus1kxwkk2Gh7zIEoEFyez/WlfkZhWQ9j0fl3OV1FuUzTEpb79BKXOqbtzJFQMq3cbc0tfxKj0utJ/F3EKNop3Eg13WJZt+ClpBkh/wdlS9NjsIdGHGNNzaU5Xr+yiS8ZEcOostZ9nNrHjsnpsl8sc8cXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946204; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVtcBaDcSSyymPkzmJPYfXqcQkO6WI6GZ09yGdBp4iFmfqa1NPPQqJS+OaETW0ti0HxmFPyLPX94nGqXOk4u+CyW+XzWOrGvV/yGnM3DWNKM5xM/2BKGLb18bIEfMxC0cfrCdVyynQptno4xI7lwpdcQ2yaDU9b5QgSK8lYISo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+q85cQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBk2lvUe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+q85cQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBk2lvUe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZaQ557471
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=c+q85cQauWQQgjvc
	KzztgxhxEZehiSS+zIJNvDt2Fi31aOrf1h3fV1hXug+eVtUSGn86w3LcydzMEzyc
	z73aNlgz3dWv4x5PQOvqiPRnRpvnJ9qHVf19jBnOfK9Y5p3O7vZuB7eaqm4vYMWT
	5g9wunBaEmEPQMN8ZWq6jSzM0m0VnVDz7/Z2nNT1I8i0sTwYKiZOJh8XJJdTyap0
	RANbexMiFxanquRD/8GUfLsW1AsJ875JHbqFMmqJ/xNfu29l+PCQrRHTatMgdP2D
	4jSEVDn4QnBECulI00lX2YfmvwqGVHZCOecOHHi0jnYbhZ08crvCuwptOPLVMtJ/
	E7c4FA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgc1t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so1620218eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946199; x=1791550999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=EBk2lvUe+YroAfR/LQXtXNGjW/6XeNM3Rx8Yxk4DXPw4u8dTPQ9CMRwgL1//vRnTuZ
         xsHaoo7QLNqOlxeg9vNGUdAzVTE+UyZGp1Nsry1BxHZp1wls5cupBZfDwubY+zhvQrEq
         BOzm04BHgx8GRPYL4B+PljqYrSbjlzSDT0CHhYlsZeSGinXXNq9XQHN3fYoXoekdJu+6
         5erlOehS8c6p9rhwJMJZ76iwWpxXW4Sodo0Nw4T2w3npZOn66c3rRQ0nIp5g1kKz1EY2
         RgKBjRHNCtaMbve+qxyXfS14gFq09s1X5oVJ9KN8jP0eZQe+oqMjQYQnZvA2tUvJKozj
         N2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946199; x=1791550999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=zUOKGefDPpUPFAlLS/fY4QgK56NdZEQLMB5oZbwRuvS2FzzI8DfzmVwzcEvc6rkZii
         7xTK/c+v/D+F7Il55x80vnDthG/Ck3fZND1fE7tvnoBi6CDO1UEc7PL0zj6khy4Bc01E
         621zTBg7L69rbG9+Txl7Fb2U70jLOLNNt1+PFzqmkl8MAvpEw6ChORZaG4PfhjsZhoR1
         z8+G/+daloTzE9F6OGUqw9RkL9zz7JtvbEmw0x7S47I3MU2RxZJ8EGFTrJ95p/5JBbTB
         5kWhjV3edbVtI13bOJ6N2GJATJSRqeBCmoA2e70exv9CbvNnbZ6RtC13FYUEmLzmEeqm
         FbkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvh1Fl9kHdHP/69YVY+vmJxsxFMVTBJ3WKlwPALXF1q50b9H1LvBgODWoOMPIZP4gksaJo4PHOWVFNuJXB@vger.kernel.org
X-Gm-Message-State: AFuF++mAz4QXztmU9/zs1Tg8BZrvVOk2M9JX8N2fjg4dXoEoUzP/wwRw
	zjeNqIDRcoVuhf4TCZagse4F23ayCEpJYoSSaHlXim8rafHHajg4XxqXri8aDfYnfXyvPuOljF9
	bHXSTzHaHJAQuxiaSosthrG45ndnmzOJmO3WUK1F0Izoq2zviSB7H8yo2WvsTzSp2Tbeq
X-Gm-Gg: AYBFou0p4cxYsuTxSgzuXatwG6ALdeqtGpDKsyMqQkKWZY4iTzc2J66E8deM8NB2qgp
	QyPTebuBh7CLoFXaFxWVi53ceNBrXyzKx+Nnai1P6dQqjIzvq2nswyJ7MTYepoCDEi7bMNyo+9X
	tygue/5aXltIZqu+zexRI7h5rmpjfC/cImAs281PGh57UwvRagBjiqmkjs3hQi6v8H6Zc+A7SNd
	oppZ5Sf0IzfPYrGq+l+hg9UJAMm9csqCfJidzMoHTq1mnGL2c+O6FWFxHLr4Z3qvbl5GRtQKHXh
	xEPXD+eSS0S6hhzvDMuCVGcuDEidleG4RCOTJCLVGPSJ3oAUb+o5t5OeiwMWq+xMNZ0n3SCgkJo
	5TGnTD+M/GTZNIW3+1vDwDAZ+JQTtbfsTR/AfuQ0s9MJbqFdfn3UnUQFFmDNCRQIZIopJnUEtl9
	Dc7bK9HrOb4eoXTor6rPMCBq50wb8f4m4ZjQ==
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2759022eec.34.1790946198997;
        Fri, 02 Oct 2026 06:03:18 -0700 (PDT)
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr2758880eec.34.1790946196812;
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:03 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-2-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX2RZK/hXu0Esv
 rfpn8QLhbUOPiIdcliQb6GPccRSgJ+xnRnMjAI0/d7kgxBxV1e2k8nwHX4XBBZ8XCQihqz7GIs3
 cIeliHMocpcDeWG5SswISTjDZqlgTpQ=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abfab97 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX9ae9czFMK8KL
 IIq9F+U7RBMyxgu5qChW2n5DbhIxwcoR4MD1W30nN3vfPQ+3iEuzM+FL+zRFH7Cyzgo27sU4N7B
 +MYk1kY2yC8YVEXBhrqV7gGqvGQddVrBd/vYQ83fTZuKNlS1hKYCc/bD8LtFzFjnwchcHdkzZOb
 wKC2qvi06xNBKFJsFbA2Rz0thEu/xVF4ypBa4PHdArlehVPMdj4VO1tOJgMhSx9eYXuHVhmWNHr
 1HdnT0bnSBKlAe27nvNk5zNN8YElgw3e/DX8PhdpYeB/u0gg/8xFBIqrwtDhed51uPFD2zSxmGB
 xkjqg+uoBVJD6NPixOQmuw9K8PMtb5H+VQxIPbqH6s4P40+pWRHut6xVElP6/PpSvi3xl6NyfWW
 sgO003OxVp7TaoCxbN6JAGr2oELDIh97z3eBOmIckOITMFG1iPFyRO39aFyVXMTxlhfIkpNjkyT
 YXIDIK79u0H1yRCmICQ==
X-Proofpoint-ORIG-GUID: m7KrdxnClym6Pyw5IwURTPvlmkTUsyEz
X-Proofpoint-GUID: m7KrdxnClym6Pyw5IwURTPvlmkTUsyEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


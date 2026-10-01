Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558275275AF
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867494; cv=none; b=Gn+x9e9ZUzx0tGX+YLiQAzu3N8bzRGpjtSprX9xZvHsucfEeOPHSJQJ6CzCaa21fctfuasdOdxpT+f21flfcJSfYUYptmdVC3oxp5cEAPR6bJM7V8YFop5sjPUDMCJCWRQmPgvC+1ZPiVGepfZwc66YZ3cMBWgzho5OZ/YZXgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867494; c=relaxed/simple;
	bh=vSBe8LceVVKpPMYgu4L3tld4R2oYmbP4ywIrrausTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqVUEmuAhSpuMWy0gumsGftcpzzT+DezcXIeOCvnElGd/TGbob08IvE418FL+V3apzKAY4KsaBX0Fz/xRro5Y1vLpHTrpKkVIfKL6Yr/nI0jUA8byCukTmypPfcKusPxtG31A64qs0tszT9BztMRji84aheaJIZlM8VWbXNi+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAYDpwxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDfIKtyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAYDpwxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDfIKtyy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dk6P31857016
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=; b=aAYDpwxbm12RBMyN
	PGp6usachhNQava4MNLnJcr3KYoEo9HcN703zCxZ0EM7goiT8wv9uGxVG9wz/jVS
	aIm/E3nlYMsFzjRo7jbO9E/NKRJCFN7qDOFqnvWy8IJOFJelYPutuodza7U9NgP1
	bM9x/plsNOGpTx+Kmfugsv3rkMqh6lt1eyEIDy8KXWop8sveNXj6F4K+9LZTcLjB
	vmWXvG4l01K3hhDqO6ylwlSpDSSRWCXUG+AdMwERClAvlkVIRoPv1LUtK5fDtWds
	o2swiNxdHC3iS9ufsmck5qgjL283YEgbviLYcEdktBqY6yXOmt+EXHoNRNECLT5T
	Jx0pQA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcvw92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:11:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-149e8e8ad71so1188295c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867491; x=1791472291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=UDfIKtyyB0BeT1eCW1y0GRdhaQaTU6cIQ6tE9KxvuSUE/pzvMSXd7hjaMgIr84eE+D
         zM7dNGvdgNEVoAbvD4KM4iw/0ErnthNdmkYC0JbfrpBb09hZgip2cqvwuDBJKJIxnTcQ
         FdijJi0hYMQGwP//9u+YVEhN0fWtqk1F11qlkGKlYpk3cmCR3cV+6s6ejvok2IKAKwjh
         3tmANOgxtesIQhAZ4YRK7p+0JRzagirovNVYyLcLujw+v634fA7R9+MC6WUL+enB0lDC
         cqACuYF6swdI0hXNgv/sAGBRaRGZl/3MW449KOwyX1qvHGbdqQeltpMXbZAm18kTCSaF
         aB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867491; x=1791472291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=ZDXnSKWQY503ZnVj0Cyn/OC/ZHo9qYN77nap2oqv/m7u8nLMz1GfTtcsbwoPxETdxN
         EnG2TcbPe451JWDJ33USevkjL47Z5vPoXDcNzLkD7wOYxrPTLcfhbK8KZNHWr85Cvht9
         jYHFQV1GWB66Ifyx6M64hK83/VCGG3C4ewTms0htzgYVgWbhfNQVNWvaxlQdxITzLdAr
         zNGDL0stxFz6BOZwOu8YCDlpnMJ0yj11JounsS+Wle+regHiT66xm0GV9WU4r/5c+EjZ
         wX0uqsG5oImEcKRaCyb3FaKViB1TX8yofZ1/8jkdNtjRqqy3gXIVY5m0gp0ezqW1DVIU
         pN+g==
X-Forwarded-Encrypted: i=1; AKwUvBw/tW5jSt4tw5pdK+c7jEHevY48BogRYYMb//e3HwrzhsTwH4qWtWO4EKIxP2YonQce+TzxL5INe8l8xB1o@vger.kernel.org
X-Gm-Message-State: AFuF++mM3t0i5PUtMgdIXU8VVAQs2hneoAYR943FNneKEdPC+SddpS0p
	vrB+Pl+eX+8FgYgNn/fi7toTu0Jz4IgBwTScJ8jOD/4lIn7uG6xobs/B8fVp/Tqyr0SlHV4YNAA
	cTqcDOuAg03rn5trzTt+yP83RfFnRvmiZ+hQncMppdQtTJDawdhdB9T1WUfNdlLIosXdHNG2VcE
	4C
X-Gm-Gg: AYBFou2jc7mlQQzrScrHg4tOjqsWObPMWD5HcuMYd+hNGrJq2OrSPKnRcUbFrOkwbH0
	PxHrXZ8QkQTK15Siw9SUCwa4UmT/930EganVpxknjM5da08hFEu9e3r9eoDxP76y33tSK/akmR2
	WgzmU9BJXWpHA/ro6pjJzr/OPvuthpazSH6HY0tvmvxih9t4X8sSe8WAp0kI2QCBU784KbVXtKf
	PH8tcbU8C5yW01oT/D57GvuMVnU+J2nC1D4K4E875RyS9Srsd5dVTrNROhz75yAIUPBpdN+Htzf
	H0cngORDWda02+40TlayqvTKWSh1Dy1uED81YXWGaVEBhkYRyMThfr/gFNrhw0dFLUWhHt2qNgh
	ErAEgSQXRo+z1QZ6hVMvTsSsENe5wCEgwIB30n+4hhALhJRYNNzIleXLKqkfPi6LN2Af3O5L/zv
	vINdKPv3lcsPXNFRsdgNjG8imBYg6mM+mm4w==
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917849c88.5.1790867490996;
        Thu, 01 Oct 2026 08:11:30 -0700 (PDT)
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917808c88.5.1790867490348;
        Thu, 01 Oct 2026 08:11:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:11 +0530
Subject: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+vOssOXSdl0e
 BE/A0IZAg5ClRdoK7yO/CdmVVtG4h4JMrjnBXE9l7hv/e8x1MEGtNSDengpzPJ6I3IpI2zZmyXP
 bF8Cd/7RUQK+XJ8v2I+xOhlVbYs001lJRhAEAAAGZ4LvwRgVMaJqSzVihojd462mg/911sWat41
 wm0OY7FC3lzH5vsAz5eAXxEMMjZdop26tSp5Z3eaov/NCXFYAPGGppCnboLwFCMIrDO2cPtgflt
 CGyCeaYE13FT9KogLFbttDlb76ioREfg4FkqXgPuXRaCmmist8bkce45JPm217q6CZc0TwX37t/
 b3G9tjn7gN2ImI/dYIM/7Nsbe9KPgDYC/vl8wfRGDTcYTSjO3Hk5w8jIv41QKP4aarjbkGYSLJf
 1KUCxbnRxwZq/qgmfYpJjBZoZapXMFv6z7f0VlQOrUM5CYFSwR871lm3Oc8sDVyb1jDUOx+SQbz
 aBI3bKGkkV2NCnlEWvA==
X-Proofpoint-GUID: E1hnkIydoQ96S4eBQ1y7nJEAoKJXExpp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX66PP7ZEu7h62
 z2zFrPSYIj1zYbACmqqugDOrtv4+Ru2cN4vTvSbCDyh3150EVLQ4zPuqSAje+YRlfdL2FhU7gab
 8AshdmE+L+A01jamd7iRj9jFdkSAxhE=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe7824 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: E1hnkIydoQ96S4eBQ1y7nJEAoKJXExpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..d65696885e6a 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,8 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq9574-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem

-- 
2.34.1


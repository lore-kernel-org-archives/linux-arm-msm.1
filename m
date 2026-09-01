Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9746AEF1
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248505; cv=none; b=gLosNdChazA//K/VQetNg7yBt4EWdAeB6AUqci7Xg1/VE4X1dSiNUef3GL821YL9RPvCP8svS6WUuS2JW3SQueR8pYX7+2lZfpTfuDc8j/1bv9dt4Iw9h7X7cJGTowcSi6yyB2Ik2/kniYuU9mSNUL2WVjaI7uxESGnG7QJO/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248505; c=relaxed/simple;
	bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d3GAsRNJF3RYSIYRD7c2s4Mp8p7uhlig6RP3Lk+EOQQfiApPaPAX0Wxia3GFw3B+3kLq6h9syv5Jv4DfuoK9sfrSCucF0G0RkBq1tqZZU9hMRaVvOYSVzxkHpW0FfhexyTOa0sLJ4oLGVJDNkI9CXrQml0tsV6Kvq0Y5ijvrnYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdY5cTsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLpGYi10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdY5cTsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLpGYi10"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CKt2061527
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nnUNgIXtKmNalo4SOMUEDy
	v7hRZV28dJ8kqH+HmyC9M=; b=YdY5cTskCMzpW4N4kEBkWYQmFZCo8yibD/YSWY
	agJ7X/9MxI3Opgj6tAP69fWzme5x+3N7sAZ58623qdBmdEIWIDYxm1x5p4ye2ZrO
	/BZ5W5dM0hZsKyknh0c52WEK9NhR1HBqNsGqmfXZKm6dFL99WnIa8f8N5apVI2rj
	cIXeBni4Fim+SBnmvNqzVeYkMmjT4Z+51l1zqgELqrc6B49G/tHNlmFXZ4tccEg6
	2pa/7oGOomg1QShKtdPpZXIaAElHgVQeWH21YnJpQvQ86D+hqcVARTajOw3lYOIx
	HV3qcgVGXUXfMF9KD9eaTQGlRC4dx5HlAO/BrPdO9Lzga/XA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0ta5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:41:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so6886600a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248501; x=1788853301; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=dLpGYi10ymix9+LhzbUOordnZSM+xGHm6J5wpEwQGk1aG7oaFBKLENttcFb2GE990e
         XmeAFjHGVa36oW6RlBkzVz052ol8+kYzTPrfDL3zt8QoPjiy4ohC0mtb9BFEcdidhUaq
         1raSpI2N91n1gP6Zb15SKFyTmYzcQ9eXu1WIChsLbv8xfI76nnRXS0QpfF7BOqo77Xam
         dgz/PTYtCui4ywd1T33KKaMT39oIvTeym+70s/hA82Pa4w+FGzcOCaZJcHArJrNs9B4j
         EoJ7XFMPtdU0noTN7G2xe1BJ9nLO0AFzPAP6y8gX8OLei12O8IeNkWtfgw9bBqAePKTy
         MOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248501; x=1788853301;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=Wvi746EgsGS04JW5bjHWD9hC+OfUqiCTwcc9NAsxMFpnLpXRrOm3YPXTIgnTVXU1Ev
         RvXFm4wE4uz11DOoJQeFjx4hQbMcnU0jX2qLOOqY8JlzhstY9/kb8jGc+HjD2yshIScY
         suiNf6Nyr79f5CaQ9xo5oZ8LX+CxVKiAAYP+5j2tiQWw39P+OVPkgsSDabDU0GDa5hQC
         vlM9T6tNAZ60NlBsA3czkGgTg3DOkQdkrvJEgXphak0TpR9IiUI9fUjvbSLoObZawlH7
         Jn5Jhh4y26YI+fegwKAHqg/O+0zKJTWcf57MZ49y8AMuXaMJpNl+fZ/D0SbTyrrX+GCh
         mkWQ==
X-Gm-Message-State: AFuF++lYCR4ztrVzoiknOcKbJOA4YIJTIreI/ztzeCUymXlWLoWpG5+2
	Y5z1jjPZzpb/fdF5nB4Jq/Q8+0fg82pwGl2378r4SSehSXe1EXm3OdsXFd32HlhVi8AHsqcgIKG
	l+gi/AxhLUIAllQfU+zQ6T9Nbep6p33+NWS7Asj/wv3ugGChXjL57Mfr/NAVtIweWMnV5
X-Gm-Gg: AYBFou0ogHiL3qrQpVVwJP/E1OHcfjpy4amQQd2PhXd48AfbvjMs3RT1OP2sHWyPxTv
	2AIksLLh5V5e2EA0ur0E21CKGVtHh+9MaypmgdfFf//9MGHOU1hQG/krh/PEgesqAkSRJgJMz3e
	4piayqXBP17YMeeN6u3hV13fnROFyVbBocH/Xv2Q80v/6HK6PQIwXwWFT8ijPHd8IUkqke/kC2x
	zNPLK048ez4ktxi2UFbz56SNcuzOOASUOw+89Y9ZYAbuj7edd4Pxjow8EBVAAcJ5wgnX6jW17Ut
	2X9gdQ30oNQSl6sOWJVEYaDi5fXhW/sIA6/LseLOXTXHnOIdK6HWjNALiHNln3eX8ML9IOyqQej
	Sjat/tc/6PAn8tELLW1iGucnZy+kZhPzlIc8=
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102114a91.25.1788248501273;
        Tue, 01 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102052a91.25.1788248500815;
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4f1bb8sm5348784a91.14.2026.09.01.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 13:10:59 +0530
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIqBlmoC/yXMQQqDMBRF0a3IHxuIaa3oVkTExG/6pI2SWBHEv
 Tfq8Azu3SmwBweqkp08rwiYXIRKEzLvzlkW6KNJSfWSpczEt8MHrZ3RargezopHoTOlh5Jz86T
 YzZ4HbNezbm6Hnx7ZLOeIjuMPqAToiHUAAAA=
X-Change-ID: 20260901-maili_gpi_binding-37b12bf9e5c4
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248496; l=1133;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
 b=QU1D+HH1NTvIIaP4M6LcF4kHhVq3AN88zrlvq9ubeNwxKCWBZZdTGu4CHHV97vAlhBNi6z4uN
 34Uvq+LKPjjCZ8dSvEV34LyNVfQgGbShuTu9yKQrRfJ/RRyKrTZYxgM
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfXyoJxLI16F23O
 m6VDYkBEJw+4KMcpItstr1fCZHGb9xPap8tp4hCokHX2HUnqRXRgnW7IUBR007TwAZlYljpyJWF
 pFbZbyZIKn2Xzu+d/NAQtIfEzIOgEYE=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9681b6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=THIw8Hy6Aik7p87rLRkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: oEqbhTNJqbpaxWB1zf4cv09KOjfiTkcl
X-Proofpoint-ORIG-GUID: oEqbhTNJqbpaxWB1zf4cv09KOjfiTkcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfXzrGMSWLRbZ8m
 dvLyJrZJNgXYUc83vuqiIVL/ANia1+i5mKU6cuO2iutUcuVLSkhGRuMiDzBCtBR68ihmmFnmOIe
 AWgE1E3ABtxW/6iu2VpHVhB6TbY1vhcdXXdE6OhFJJVoZdBZS6LIhmhZpR48/6USilcdwjNxx6f
 TzVQfjCIwuKZw+q/MYUb3xOK8Lm3jk2/NlASF9D77FJXs57K/76shFNK/LCV0bapGb2casFMXGA
 W18OpXABMAxDePpj56jYNZ6Pl8B4U4rZqzhPI+R48spY3rhtK6KQdMRpXnQ+PadAc7jXIObiU+f
 zBGqrWWul5tOBebAvAxXZfEE/aGZujpOmCKsGiEZSKvkvsG8XZUUhVhPIp0bTpWQ7os7JmsV09x
 ZhBC+igOps8JHOuT5bRp5ywqGju3d4K2fA71c2qd/h4PGGI2T3haoSB668nIBdnlegqPApHuC7H
 F6aRqGK8ss5icVO7JYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010068

Document the GPI DMA engine on the Maili platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d..dfc4a3054b5d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-gpi-dma
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
+              - qcom,maili-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260901-maili_gpi_binding-37b12bf9e5c4

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>


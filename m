Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621465;
	b=tTjhGrrV6QCCKOuhdj4sP/GPCSdtQH9t6EiwlusvJDQMUmywijhpnlQIo3dVhXrHQyvW
	 kzk3a719Co8iMWqR7jEDS4H8hNnyfTA0iZqdF82l4WI2Dwrjz2wqk2tdCJckvtR9OuwaV
	 /nrbVGyRwv75JHHymHLeLXwFjskGgyZAV6xn78ZTsGxpBc5MizRIy7MSUC6yMUUSe7vJ/
	 b7VJGehvX/1oWBuAtXaQ13ybS5dkwxQtK3sRsFaYlgRspdakTpv2eIWOUpH6fWkR9RQ7h
	 0mfAoWyt800HOyvjSLWHhra+SGk6tA6nOclWtk19c0tavqeFyc9ruxr3Tr6V7FnmqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
	b=HufFzR5HDEaFo75kS7esbiztAM3pUZOo7DYrQ2b5b0QduJxVuWluhmrRMqyb6lCExxg5
	 FrwMh4v4KKsB0GzIu3Xl3VG64o6eX3kERhOdCif6mK/F73Lnb+Jkyi8z6rXqN/qkKQI+A
	 WnGaJ8BeffBmufYtG2R4V8B68MUZEJ8OSvxWu5GizPj1ft15JYheMaJgKCHe8o1jeoIU8
	 awaAaQyoHvW9g7WWdAawNBkMTvsTrK4y+QHqOGVoSRWd29HLfoc1R4Dn561kV42B5ZAzJ
	 4RGS0s1ZBf8BXhQNw7mmFiSiC+XHupKl50XOI8je20MVAHzUzq/vfZAcSywEYDa/YBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PrhIfmFB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gphbckcZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA860A2631
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CA860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PrhIfmFB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gphbckcZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7XX2466790
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=; b=PrhIfmFBScL1Iui0
	pgEKY7pe8fJ2WxCEHP94PPE/CHghX2z9PwTyOvaOmZPe/lBdwXvO3RJ1k8cc8GNZ
	gPw8uVNnM0deStbn1wzSaxAm/bjR62Q+6bktlDSvr79S36vZUPKrOngYBFg/ZjLq
	00ldwUKLO2GeNxmTn8KzdrntjEMCrqdM75tTXELc1PLAJKOwCdAZ9VXABhQ8Tr6r
	lmslRM50yoSUusL5uNEGKDvQr/YFh3kZ4XnekIKMS2kqrZ0J5bG+imIxSYSHLoAK
	0b+X5W+nA3AsCLjncPcRcMz9AX3a2QUqrpmvNK3eyiCP9eF/SOo2vII7E8eAqxVJ
	vN5aBg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhqq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:11:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bea8fed6so2478304241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621464; x=1794226264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
        b=gphbckcZBYw4mfeTPs1eqpqhxhYQspCNFYH+LN8D0EuetEEZeKVpY5xmmphuOdCmmb
         GQjrSq/BmxK8pbaY6pNQ4bCF5YI+91OFFuvYP2P4FrJcLSHPUFYH1pv4gu8KqE7GX90z
         MTYN+ik+nTeeuAi8ciRCakueOPQcYCffNQELJJmiksxpmtnOZKycM2uOf4ALejNSP52P
         OvM0jvifKAAVMKzWMzGms+9ndQzX9n/JmAXDDzyOGjfrSReraSWVadvvKIdfoM3lA/oP
         sIG05VAdV/iMRSZJy2JOEfATyt+Dditj8z9aTuP1w4xbhaFtBkQDW7HWBdh3+2tFPqa/
         0UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621464; x=1794226264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFt9Gp7t593Dt3xqwIEF/MymtP/w9kZCYAf3WxoQwpU=;
        b=VSnBI/jiDTLB8rVXyMsFdUwW1jTQcqp4rLSCoZA0rLZTuV6dqinC4qsdNmLyBkkImj
         szf9uS0k7CnrOAmEi7o/5n1LV0x9V9IOWTkWMOb3RHzex4By4/kaUOldLqJNX5fmW3PB
         rz3LhfmRaXl3vDHuLwjDmPuMEs41rOEniMtLD+ZIr+Js4698vqH9m0RTUvI/iPWdbY+J
         69iwYVrBZOGSXC2DzT93WbdfWP8stJSrvOm0WvFZA6ccgeg6yZAmZ1tbL3+5VqtxyJh/
         XzNe19rt+uN1vlL4zsyKFrgNXHK3m73NdoENruQ0e17LUS4IKqtMxScsAs6mNg0xopm1
         3nbQ==
X-Gm-Message-State: APuU4Z+i671tdbu7+rPx+U+JvAVcUKds3R0JNYbHwspYGttweW4isFAI
	0SYqboV8fhzZrEETmm+mX64t0HxD1b2k9ScBpojJ1ZPNL+qJiIU4mov9IiSE4hYjcrw9rObQIxv
	doxdynNBradmQLSEUL5KcstwtuI+vVaRIgPmqMmYEQgJuhCutDzQbPISXf8g/TS3XqHwW
X-Gm-Gg: AYBFou26l0puAMjSnzvd2XIhvWRDoH+RDkRvr041SjYxxG+Uwru0BJKezlmpSYsIK/F
	DnTJBd8Yqzd5nfJZstkurfCPE6z/YqwHjqQ/qIAkTh3xXk6kY8Ey1SOI5jaugI+52MBslZs1oIp
	APfROy0olzf3Sa/oSR6JDGC4II7i1jou6B1TEzRMrwSnXDt372zPunu+EF1C1WXi7IXcApAKtuw
	t0+ge41UiNN4DZBJP2pOOzPVSzAu53UHS+VzBwLrs2aG5XUjRN31DNn8UYzf2zjPvWj5boRAlGF
	kEWTnkZ/gXxdMWUuKakGfjgdkVB6XSpJoUTeJhNyKFvZ3obgN0wG+q1XiW60yrPMjaPF9r5wOpy
	7WikN+GAkZDFMGisfdOnXRPUUtRQSF2bfbm4T9oFHPwX39rn3yd0Ly1xT7Q==
X-Received: by 2002:a05:6102:c13:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7d072247a9cmr3560787137.4.1793621463549;
        Mon, 02 Nov 2026 04:11:03 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7d072247a9cmr3560781137.4.1793621462886;
        Mon, 02 Nov 2026 04:11:02 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:02 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:47 +0200
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Describe Eliza CQS eMMC and
 UFS variants
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-1-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/p2RYwE8qlgn7mg/EOxuBv4tDucnsUtXkwvRj0tEfg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3PL/FgmpzuO2ttwzCe9HUeWIjFpcMyi8c59
 POeNhJKGmiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh9zwAKCRAbX0TJAJUV
 VuDeEACHLrqrQI6LLulP2556SgJhAuFF0RXuaxpio3Xrf7E+/yzPTCpZMvCdr/s0Z/as+P2l/fX
 YIZ1npu39ZQ9xiHBquroNBCkdeWGfcw6aRzjfSgEmWoUrXBKgaDPVyzB/wSJEbNar5UaY01BdnP
 ibN7q1ZBd7liHAjcD0eWGmrZ4JD8SpHwp3OfDYIuj0hfG7SGltGr2dbAAoogiswKk1Z0NT4Imns
 iDkXM6c08NwUL1qeV99EfApmb3KUw+Sfsrn0D16zQtKzOwTGw9py3J369csfm1OjFc6cSWoXnpr
 i+02gtLaJQuDN1vTclbMICaDKlWHXyFXBKmP+esMDF4Ev+gjkGtWexRg0k7G5yAMCFQP56k9Yk9
 mjeY+lcqxFwzy5f9k8Qr+rbfknKUPL614w64xD/gb+Z0SNKotudWHaUFrqqfB9U0TfSyOGoFiTT
 iY2ogQSUR9ZHlXr8pBJMKZQSUJqhZ5eTseOMR3znJzpxk6JjsgyrZQ8FGatQ8+X0nE0yuezie+K
 B/D+4tspFA2JeWvO+ds6xcBSUBpG/1keUmlHOYUtUQZkrieMvGYdE5CxNncsRW0NBKq3z9jwh1B
 ClxJ/U7HeeG8DfVdHLkDn3MbW2iGbufHTwUBe6djmTHWPfSk4Zcb8+GzVkX/0DTqzttijMf5z54
 aiW6fgMgzT/cTuQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: uDO6VQCQslHMRcBW-1tYJlLH-S0Qaj4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXyv1R5bc/TRtM
 WwtfCIY00NtC8foZOTtbecx/3dlgXMZOnOD0O5860Dhh21MtTJvRvnJCTl4PQuidZhGt66nB8WI
 gJzNRMgdilSCa8eDc+3zzMirRH2nTHEwlI+NJgYVXRPf5k0Wl5VIpt/W9/mF+SGDxDy0OEHv8DH
 w0JR2TDxBvAMegjz2UHar8QKX6V29uf9peGOWzLYGkcNpyChKnc+mr/pFx6Yeuxxm7ss/1t1TUl
 cp1AOnuUt44OspJxdZYB+GV1pmUilxEPpptAZ+hgmK9DD/QdL7QvPVXLk9lUJrkt9koxcmW/LYI
 7ZYt32t5cOrdsgZ4Xi+7nTSheA4tDvhcszENvgqAR8dB8GyEcjRLPJQ8zsMzJJ+CkgB+L2b7Bg7
 JSZnDUu7rN2BRXSDJe9T3d7uJiatv7iYz5HWqrATq9dDwjJ70S5WQnKaw04YJ8Q9OoIJMlkNppH
 G8kvpxfqVEUmE3zUM0A==
X-Proofpoint-GUID: uDO6VQCQslHMRcBW-1tYJlLH-S0Qaj4f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX0hv1PUAzg7d8
 hcMRAWSgQY05bhpwi/PFnIjNc/e3YogpV6eBmqV/38e3YL5A+XZRYz/oGwdvGuIEEILhC5eR7A7
 hRFThq3ganbSv+2AVzmMxFcjyw9PsIo=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae87dd8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-EGYiVr9cHPlVdSX11wA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The Eliza CQS SoM is available with either eMMC or UFS storage, but its
compatible and the compatible of the EVK assembly do not identify the
storage variant. Both SoMs connect to the same Eliza EVK carrier board.

Describe separate compatible strings for each SoM and for the carrier
populated with that SoM, so the two hardware configurations can be
identified independently.

Neither the CQS SoMs nor their corresponding EVK assemblies have been
made publicly available. Replacing the storage-neutral compatible
strings therefore does not affect existing users.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..a75963b30186 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,7 +56,16 @@ properties:
           - const: qcom,apq8084
 
       - items:
+          - const: qcom,eliza-cqs-evk-emmc
           - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-emmc
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
+      - items:
+          - const: qcom,eliza-cqs-evk-ufs
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-ufs
           - const: qcom,eliza-cqs-som
           - const: qcom,eliza
 

-- 
2.54.0


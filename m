Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC0248489D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988328; cv=none; b=CJll7+8rXJdT60+GPw1jZ4NM17l5VcQEhIgByj1RrW6uuSmm53ZsGEUuhq8b5nFixccwWYzlQEvTyq95fWhly6u+w+wmAlXIorZA7+WTc2+OLxQqJW+rEdp1lKOL/Kt6xYO8ESvLQE9H7IEmtrXAoIRKfOyzDKrNZwoBBg8zLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988328; c=relaxed/simple;
	bh=y7UXgCIKfxY9NVUCZAGjKAqUsicIwGreJw6al5/G0rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgBzaIE+P67NbQgAjzHELzD7RnO64/26Ekdo5OpL1XiCFqlMVJvJ9XgB3jmxGgqKyIZ2I8BR9qZCpLwNo1AA34LGB5AC+JXt/SRwXgN0YiJc/g23aqxk3img9IXvNbm8F5VMwUP4g85ijyIjF4ZJafa6p0jBkrPxd2F5wvyVsCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLdsjBnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hrd6Z5RI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLdsjBnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hrd6Z5RI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0Qa1414004
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=; b=gLdsjBnT8JEozPlp
	ARRjPFtotDc+i10OPbTg9Bq6dnZsZXaBsv1UCCh9II/uFDb+LcgDT6KzoswXhi3C
	QYVvDTuAcZnc3zi0MS/NIIWFglD30V2/CoNYIW9+NCSFVoJxDNBVBL6X1+eRqsmT
	2aS/JS+qbHgzQIhDsW14uDM8oPcosCKyZy+yc3BOJVaBLoo/24MNSyV5i8O8l8m7
	UgR0jOU5tINmshi1fmOyNOQEWjkln3ZVlFyL+J1LYfJENGApfKIq+eWPExZzDxZO
	XBJ3L+nIetYThBlcxNQdnq/pnWUpTgJEluaeIpJWvIUlSvcOZfiKHRrN667SIack
	jgr9tQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0v2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so2017234a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988323; x=1790593123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=;
        b=Hrd6Z5RIQTLd1vZu6/TYggFtXJ9HiQhygXsDAGSTnbQQPrwJHatndXkS/+8/nO1Da8
         gD+W5CEMlIl0gXR+JSDLKy1hDF792azxkmu8pIeJUvGXQr+cp38Tg2PXOCPLcLCX8+ir
         PjrKmfIaAtiXqJtAdHrBX6WN9C6Ben3tC3AYdwAmGhB42ikqFYDoc7NL+OYpxqQUkcDK
         u4cLOdFqWpONrnG6hpmSj/phINuZNigQqqt6st2Z+m6KpVJ+ZUWOTvmZMng6l5jyVdAK
         vzn8GyLkMUdVJjAbjC1GzrBBC5J29BRI/JL1lBmMPCtKrY4DbcHTm8b85JK05Ngaqpfx
         Nkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988323; x=1790593123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=;
        b=dYw+5YpyqEBfvwdxo2xMTCFMJMN95+TztkKrsuZfGqKYnlCRHYNjYi/IesPD9jE/dg
         dMgW9vAWrKfS+K/SzBNvmf3GDGsNzzMMZDSwUvIF3/HN8EBxL03bl76g3ARZkCxK3F+7
         +0fzOXLy/TgHrNFGMX7J9Ln2HBxk1F9h7ASVPqQu0u7HDZN0vEz5HP0b8+ty6VYg+s6c
         Rx5g0efS/MCtrKuOcyk0FITBXJho1sR+I23fxaqMOnkJJtKlBJOtzI/qICxYrPZveLpS
         dSRI8k1JFxUsrql2Ew1uw+KeqIbpJ9fJpFtbUQ485+SbU18zRDMVwDWjveEnHMdqiGJK
         VbBw==
X-Gm-Message-State: AFuF++nyKtmUnmoK0cM0X5d+3BPra/gqBYzY7+AOS2KH4qkZGBw5iJF7
	V/Gcm/I4g4PflNzq2uYDQGqMz1rARGZ2tmnScroL7Uv5okyyw+hTp1To5BvhrZ9bK4djaxxzvSd
	aoJy3I0tm0KE4GESawvVFAkh+VGNR2J/DPfPLnSKBjlZzMo89mC08zqfK7fQo3YFjuT7R
X-Gm-Gg: AYBFou2GikQ21AeFPAFle14qBhisDQnWFx4Jp7dzS5O+AGqTh18LwFYUNgFmBqeJRQ8
	+nsPwi1eESSWl0hQ51qpFnZoDcz6drciyUj2ZoQf3lgdCV1eOd1wNFQisCBMfME6ioZYdqhtHcG
	l4rPfihhmhkuJekvDTIoNCFSrRbjwTMDnO+XDRREi4v60E8S5xAMUYxxzeESV3jvajc5qF739ud
	/QTopthCooe97Sn1kgUahzSRNBqmmnPBXKPqY8abuVgH95MKt9atbUXoIaLUqozqTxuE8rMP7lz
	ATjuk8oK2Qw3IyU/CtWIEENEXWuFH8A0qfYhX2MUwiiiTyqKU2wwH3uqC8OQfKV+uPlxPRlT1bD
	k2bPjQgMEBcYg3xKTBEpKHOFxfk5VgbpFgQ==
X-Received: by 2002:a05:6a20:7349:b0:3dd:a195:fa0f with SMTP id adf61e73a8af0-3dda195fd49mr10891306637.52.1789988322645;
        Mon, 21 Sep 2026 03:58:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:7349:b0:3dd:a195:fa0f with SMTP id adf61e73a8af0-3dda195fd49mr10891272637.52.1789988322187;
        Mon, 21 Sep 2026 03:58:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:13 +0530
Subject: [PATCH 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-2-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=1181;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=y7UXgCIKfxY9NVUCZAGjKAqUsicIwGreJw6al5/G0rc=;
 b=p3AYYDk6246yZdu0F0RMdyRce/9hqFxR/O7xU1jhZb6da6nFAmFgT5jmXnQzv3KRyzVQsTQtH
 4BivyinDTthAoQxrZZSB9wiFpIVlMH4CvtXuZM96SJgjjb+BTZEp8DJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: zqYw1Ltm9h3bNGSvsluP2b62TlN-f4sb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX4nJs02uoD/1A
 0b3dQUnH0o9MwMTiwiLIa1docc3+bwQTjbTB5kbCi8rU0idtgcf+SrEF+SKsBvK5tQKP2MqkMII
 qsTUucTgfJeIk3zqd91AqMIrquP5rqc=
X-Proofpoint-GUID: zqYw1Ltm9h3bNGSvsluP2b62TlN-f4sb
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab10de3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfXzN6jsQWBMA/h
 Dwz/9oDd2qY5m4iiqepi5CKa3h0HbEkkFFSA3bRq/7JjCv8J7TCop9jqPsnbPXOFzhJMoh9stjz
 9utpQojgIKaSs6uj9yE9xjrdZLlpnMVx3VJF/wMFH0ppzt5BpiCQvzdwEDGCDKX9+ewLsSI4hcE
 XQ8f2z2M5ARth5UPvJEVMM1SJDq00e97mqiLqHYjfucKEdDqFwbhxfnmHP+j6kV7spU8Va7zJ2u
 VJXCnC9xm4JSHvFipAIxPf/pqvPV/tW3XTAwClaH7heEe6KhqjEMdAxYf5hub25puEEB3LcH2Kb
 T3j6X69oWxrMeOaC+Sv8FlJbAbHLovVQ8afBE5sOfePJF3uvcicRsWj60t5Z4kfUonmZZf9ZfvK
 NbD+4Gw2knsV9/BQX/FpsSFFZwjE8EEsJL2amJaEA9p44Lb6MHf/ZoR5ofuzR2SHyX28GFTfp1f
 Y8WYJe3XgS8RvwsXzVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210157

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..7f9a0bc958d1 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -13,10 +13,15 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-pcie-ep
           - qcom,sa8775p-pcie-ep
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1


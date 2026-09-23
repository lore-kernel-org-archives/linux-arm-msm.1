Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D13C07A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121890; cv=none; b=UlqwTuh3hkiD/actMIq4WcMdhopdLcDBQj5M+086++bw6UdNKc81t8+lLVIRdqHq16czE1h7sREZV23pPqpgfCTdJ3WwBCNLRazzw7mKtoeLTo7Xxy3D2VAUIHh0kXaCPFbdtlxodztgmZq0eSU0FKPeA0fkIWm1kWlXxAI+Jl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121890; c=relaxed/simple;
	bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JflLI/ygd7kuPnh3mPSXtu8oECI3LhWE+P1sCu2+0eNlqSywfaVkAbQdgrzvbNZG7JCk5V4Mjw6Mn4NwLW4qasoQMP2GJfYhRi6FewInrOQlSczpjbh+RTxkzQXzkSBZAcvRXnIlZYeqDxU8h0hVyAnxkPlEA3MhjbfMivoEqCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhMkegOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADFfYSPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhMkegOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADFfYSPD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6qVa178644
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=; b=UhMkegOzOI5bhW5R
	1yYQdYMcv8rUEtfh+Am80pt/4D5PqifybEkyffSzZc3zfx+QZRtIFASzYa4m+0jn
	gBFiIpIlD/GBs5i08+NR4a3zv16iRywD7ondKFMkL5M15F0tBvDSiz8cD/Icv2Mc
	yWAST4vsetuIjEetnk1Bhm5c9fhM1KEJ/OkxfgU/Cm/L0kIUdNSvpE35gqAz88dK
	POxC2OXtPyaPVGgjnZJ4IYkmuGDM5c22aUFNuAj6mA65Yt+q8WyM5d1LIeZkM9mi
	z+EnXcZ08bVGFn23835lT20xKR00/GO8Dbqtdo+wfDqkwIHRBHCp35+H5Xm45U/Y
	9KBhWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec2p58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:04:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so715360eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121883; x=1790726683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=ADFfYSPDfHmJYgE9KZ0Vz13qDBMSWIuvBBRBWA4DXdYQ23VR9VkX8MsP9kLIqOV1My
         OyWG6bH5xh96gfI2TYTqaNZP8MkNjSm11VkNG0or9+57CguiTqu/wnNFKWlyTkQOisLU
         zrW9DczGACltSy6mLRcqsz2i/Ng0ptfGSIktcGYI4ySVrRDyG/CikqYImqs1D+UhL51+
         JyQNbIbJkU/hhSPChKlk7An2FqNvMCrdXyUAU7DwjutDH97ZMC0Ez7FNDH6FCtxfL2Nv
         EvPBds2T4WmJFYBpnlISnxz54UPJ5jpAVz80S3malkgMW2jbkRE5h+Wft657oH0/Dj/R
         lzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121883; x=1790726683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=GJwguMTdzbAXcVXV032vvhUOt7eu6yvvnmYoQz5uw7u71KVEpf5n5H2k0wNIjOrKMw
         g3hAjYyffSgyno6Ndq29cl0/kSzPdsa2JNjRODxLKpNFFOrfMYV1YLWfnjSwNdfpxj6Z
         xV4Qnh69NO4+L1XiBlJm0Lv5E+5faBUHOEvv340v/9y1wB9de7RhHSOYJJR/lnAbJ4ZU
         wdrE91a6EHu0GcooeociUlkiUbJeQUnk0vTWBztMDjhVyuM8O9Z0me2StnL+0Ohut4y5
         plC05I29BhFaOacNPFg4HvEaCh7Qqhi2MWEa93K2LCvv8nu0qTVKTaxcsq/WbDtRX/65
         Jmxg==
X-Gm-Message-State: AFuF++lGH8BcvfTkiD5hsUleWVmd6ifijg1QlsdgyglkFJ/r+WcohF+m
	eZQ7kn5WZ/Zpu1GQSKveJfp4gVpsWCIW/rpfzqJQPNXYPQjjHkGEgXEB2or12mixip+ZJvsp7nh
	yFgVy4WAvUMBUx50KO39dDSMd6l/pg9MzYpsW7/SFonKquZHcnhQ8ht5++bgSenUCi5d67xKzRe
	qv
X-Gm-Gg: AYBFou06TqZD9smlvkLjpvrE7Z/kmutjNhUHcBTifSkSFuVqkuLZoxy4o3f2P8z3fH+
	maNbX1sekADKhrfULVmWkxqa66Yi9o2jcEVOePo60k1ecb7dO+kG06jBhSb2rgHHVpXPkfchHC8
	aGtZM+Ygpdq7TtFUxa2fu2PvwK9u5nsMW32CfSccnNO+ENidbVMWRmP/AjnJuaqgDxaYpO2EHIK
	jJvhbSt05/kl2cNQj/DnJgboMWnLoubc4h4p5vqH8qbLLwiHNAw+AFxkZ8lD3QHoj7La5XZJrj8
	GmUqrKYt9E1Hnh5XGX2kPTitkJ7dWu1urt0YEhHr8GL6cMLICDX4xt4YStcZjbpMDlNCpJD6ct/
	zEEYHBcOyKFREOHJgeu4hP1CchXWV
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796342eec.40.1790121883265;
        Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796303eec.40.1790121882596;
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 05:34:17 +0530
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=945;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
 b=FX2Kn+jl+X5pwVuFZCTvtskk5LbsNnyDitlqPOfmvcKw071Q8Ya70PFZqvP7PD453SxPhliuR
 1lDB+jVAN+mBWEmdH6JsQF3+wHs1/nyugj7yYV/oThE2eaL69ep/Gh0
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX1R7cEICgKAOb
 +Cxm30OcUHddgC39vgkqbgkeWxsUYN3d0ZYviVdvQt6dmS4unnLXbxn1sG/DhgwaY+7VlMIwz8p
 HvffKxKQ0AhCc/5F0InAWpYwKpFj4SXnwAwIO8BBpr3SDmuig20AD/dqpCHk7t9TC7NJluoQere
 LMvicinII3XdFOT49ODarOqeKMgHgMhl8fg9OgZECpN6VQLlFyZjlaCJhfUYn7sfVSwsoXhx2nQ
 m7f8kIuLHpZ0B9jwntQR+wY+xh31XJysCWb6W1qUe617tVuZiaM74+58Iirj2RVbvMWoDrItY47
 bfiLyF5n6LhVmRUuyJvEgYCR66y6VENlYdYzu3j2Ttqf0k9FZ6RLs8eM7DPpHAk27mSLrEw01bv
 /WSPE67EO3DsauGcw3gZfMS9DaeH2UieBIQGFg0mto/qevUI73a8iHkyQQWLYaCPXdqO3uci06V
 RfTbl4I9KbWoqbiALeg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab3179c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w8Vq9JXYIO6u7lRZDJsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 6sl6CCwnkx2qUgdUvyS2S6SD9_L1ohD-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX7lkvxpAi0B75
 WGWr8L+4YD2oOEZd+hYkvFYhSggJkClTnXnpvkn8HesOjx+PjgdiS7uR/SuZYmEzyRKsUMJPFmj
 7b5sDv7xzMtEzmOSY7iRPdoIVgUXNAI=
X-Proofpoint-ORIG-GUID: 6sl6CCwnkx2qUgdUvyS2S6SD9_L1ohD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
SGMII PHY binding.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e1e23b832cdaea3c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,qcs8300-dwmac-sgmii-phy
           - const: qcom,sa8775p-dwmac-sgmii-phy
       - const: qcom,sa8775p-dwmac-sgmii-phy
+      - const: qcom,nord-dwmac-sgmii-phy
 
   reg:
     items:

-- 
2.34.1


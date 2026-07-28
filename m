Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCC40F74E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228046; cv=none; b=JkKNbv/vXwe3I6Qe9OVmyK8fwK8ELcT7VGEPN2f1WNwt3GaQyKo2wsan4M6ueBX3x0VPa+8Ho1+ADV333R6bnDbS4ni6SPvb0uKFG5VMXCUdWvBWmHVv05eJFkJfNHxK/T9Zz2lKGhvthzWn5CmudbzaiEGErZEgZCkHIfv4a44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228046; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bl46msbWLJ0kmohHKhZhPWi0EMQZI++OaUw0EhpCjmPIrYFanrwq2pry1WEmBSW8esG2BLhl96RE9FgnfVMi4v8unYudmKxpLsZhchyEo7F7WZWnwCt3hr9cbXTZl9LxMgL+lTAiyd/FfWfqgzZNf6F7tlse6RQH3j9KL3GHYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyiVAlhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Elab3RL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyiVAlhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Elab3RL6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S823rm2071378
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=VyiVAlhEJfbPgj2JXw6Yxs51xIn
	v0huU0xmRSQjWR+D3xfKyrVZxbFidOobNHG8uAgiI+A+GTPdJ6pi64WmSOBIQBLj
	BhuZSi+9VsbLeL3qXESAicmifGHSnIsGoR6v/bGXq5JGZmENvbzVqMmqmZq1QJCX
	T2X+hhsMzIlx1VsmoxNtprlDt9CMG0oH1fUSiWDH/kiH+3FdMyIvkn3v2WS8FxjR
	eIiNKpBNz+yY4S7IhCTHKuH3qaCAbUMNoDIi3QiZo7ZhFEMo6SXAsX51XVwoS5be
	dcFVaaoD6ScGPw31UECaPtlbBE4wBu28U0uTNz3GOaQLntBHCtEUPps9UPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgab4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:40:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so8740287a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228043; x=1785832843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=Elab3RL6A3sEn2iP6E4OcpUJ4ZrGYeglSKBnmE2ropPrwcOzE8FGr1eoL1aSSD8V8X
         XCw1GIIS3fxT/ow1s6cDBo0Vz7Rn7x6l6KNhO3Ijd/1m40yGFWCAIbk9k69hDiOR0/EJ
         oaOOwWW2EcqI3pNS9Ex+7/qAyQDIQ1Zvxy4BLQNLJRW4a/j/L9OUwjFtBrM2KuKvyjqq
         UPOFc+VI/ZDDC3Fx1UgSa9rJB6GmYVoTBpBZ8oAM9Vs1JbnpxOsDrTPcMGUGyOEK4nF3
         3nTFbX7pkQ/WQID7j4Yb+PDu0xoK/mcuVg1QJG+97GbblNYsjziBEiSl7SEeXO+0Rmf6
         UqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228043; x=1785832843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=Q1s4iSyfj7zZL0U0VhfFVnrxO2g3ZGsFBOguE7iaMpuzkYYsq1nhhvWRheyV10Eb3P
         CQKP91wH55cUcvi1nX3KI6+mkqQ7i7nD34miYVeAEvOzyXki14awsgTbdp9EKtRan3nj
         n2FPIdfAffDiOCLOTNJJzv069A+VQHnTERPpbEISZQLIFYLFsbgqwEF6zQXNTljkfDy4
         4eJnpIiay/i+VkUvhM8S49hY8ayT/gfgGar0DA9NjfE46/I6i0fcQy907TPfCRzt7qv2
         Vdte6K3kfIUN2uKY/9rj8j8hIg/7Fb7Lzj1pWKKnddA3q9H4jQ/fgc9ZEnpahuot07OR
         nA5A==
X-Forwarded-Encrypted: i=1; AHgh+Rqo45c4Ee4JDTTrw++o0mBdLhbc+zmfgwXdtnRvHCcaSbUelgGl+BR+3bI5vEIKreIpuoIuJ2c7RaC7aXk9@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEy7fkkk2Gd9kdZ0MzgE7bls21TgbDeiqK5YQrVhznLLey4z6
	2qaqBq7NcUFlwIRCnEhq3jzbq1mh8SGFXUst1L5bUMO1bkfQnsogQf8JAiNo6K5XnkDH+bjqg4E
	aLvXMdv5X9PpYHsZAaFp4IDMU3GC8dzRL0nr1HmUI4nYZ2qdnlTzrWxgiRLdFQRbEwpHB
X-Gm-Gg: AR+sD11Vop+Fo750Ne6JJqky8SEiKJdpDPxqusuLhz3gYVetl3C8jEbOw5xjpfI7eGA
	bsDRCKryElExxukWS3oSYdFeq9b0IGJUsGgl7RiDvTcJtdIaNU+OZHVepS/ArK5KwLYvnbzd52t
	ai5q6UANW4UjGbl/lbhSaVy/SYutQAw3HT+kCWllJNwMZu1TQsshDK+gFau6FZnQCTbIqiQ6cCY
	RJ4Bnbs4HiNKh68oYQYlvJxuMgWMcQ7EOMonAwXS2r8i0f9OKFaPeTrIX2XqnZ8839gb41N2jkM
	9noHbPdDGGyMr8xSka6dG/Ax9ccGxBPqDgjNCDR7bDThX5s38gCFy6kN0T1d0+ipe4NBQxvh3rz
	shPM2RrM2QLspxRfPuRutdg0Nc3cng/w7ZDgY6C9Jhm6KN0ZI5s5snomz9bBM
X-Received: by 2002:a17:90a:dfc5:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f6a43eb79mr1603214a91.18.1785228043370;
        Tue, 28 Jul 2026 01:40:43 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc5:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f6a43eb79mr1603192a91.18.1785228042873;
        Tue, 28 Jul 2026 01:40:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Tue, 28 Jul 2026 16:40:10 +0800
Message-ID: <20260728084012.685036-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NBSK8lXSADYRXIUzU8l7eThUjAnbaxw9
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a686b0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX9ZvcK5ib5GJs
 Nf90Km/cv+Xd6ryF9Yvlej2nuzpjtNeu9OoJHq3opm+4UI5eX8P+WI2/12l3lOS23j+3fPpTyEh
 z08EHdk43ZEVK6AqpAjxPk7rhnsdURM=
X-Proofpoint-ORIG-GUID: NBSK8lXSADYRXIUzU8l7eThUjAnbaxw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX2SlMCA0NTwqY
 vdZIBHShQYDoxBvuoAHH8YoLkjNhMz8siZRfDazJ7YdmAnS4t71mMoclQYZCZHTF1m3WGLvfmwj
 +I95eqUgCXkxioc4vYOfTRdiBBVT9B0k0JHU4/hbAYxMgp2Ima2Vkm6K+crucNGdfwQk84jmn1Y
 m4dFUHxZr2oUN396Lkp59E7zczJrNegwBsZitdC4O2pA48vuTwAE1uDoyxXRPpVFGzeFQePaAdr
 L6YZKSTUizsuTVhPhr3uMDsye2LLbKKRGHTOZJmLpqrKYJ/Qs8cbRe9l5MkdV/YOXl453XLvCS2
 6hkaU1g5mPe5sLXh4pgNwW7yzp7bk3/QKfCxqdcEaT3nHiDPYQ0tp1YC7dF+EOJhW+eP1b1YPUB
 Ta7sbWi8nX6rDSGbnLMLMG9XPnkSWCdhea54lmQ0GrcrmUD2VNj9aZhMqpNZvOV4l9fgG12onNg
 t/4dLQR4dtwhkSV2RaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0


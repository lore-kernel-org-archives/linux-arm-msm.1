Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5141F5FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006608; cv=none; b=SSzRFj8TN9clXXr1mfaKF9dMUkY9dp/xmFQZo0Kp9xTMrtv3JFL04QZUC9NBhrEhHG8xZcK/C2gEQByIYkx6wfWa1W6r+niTkYplNDmTXz9tFqQFtTuPBgvaBdCPOtnjaKd4SA4mJITzcYFox3rda/XJkl/U2tHwHph3qXQKeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006608; c=relaxed/simple;
	bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJeSREBFXeEzBX0ykGDQ5pvL/9yo38o541MZ9NEXeVgf92Kj7GTV0gOO/cpfbbPKRgk4fczz9vF4Oo7Zw9Zk8dazSH8NvCfim7aWyQttMI44YgKjURdL2tU/J2gQXMs4E0LvQ/RgVuojeum3DZUjNXqNYYnCvbBLn/mHrpfqUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTz8hSjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBqVBq6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTz8hSjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBqVBq6b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wiqE1070733
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=; b=OTz8hSjs5zCMIfgm
	rAlqxjgbgKt6d8zW4l16kqMpV7cpYYJ12c+G8joC9JMFMdFimdRxZMiwKGFKVpdv
	9gHS5LsAnxB3d+a+TcG8xv+/CJHoBXvG58ZNJNdmAgG+yBzY/S4fsSnzvzil3Uhv
	q4pbmVWTXOpXRUatN26aMsbqRGzy1sMDF0g/CaZebzV/dSMSnfQv3/BYQOh6D5z3
	4uMejn62eEc0wUAHVXydpcnlb2kSaFvxFOL7ZgB/Wp2ps5b8J6QCPaaIwbwu25is
	IhD8To9GWaGvt6pP2n+8J/oy/akYjVVq1kM7lIRterlmtrERIg3YHKlCMUp9aTfK
	Egc7TA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuch5by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:56:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2772799a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006605; x=1786611405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=SBqVBq6bcVR0vsFaFyfju3n31yIFWC3apeUsADcyQMglBxqsYX/arYyuSMvj+8anj6
         8NWOEKhuOE/OEmyn5BjvGkQd6LwBI26jiwSPTSln4gJ5PLu1BuDi+FNHF+D2M4hrmlPd
         r+NMOayakALw+FJcWg6gJFrTOApGXptESC4MpCBqJUGEeQSLTY6sKoAurdPIOy2Phkof
         M0i0KZCX5xtloqtBisCOGlrMR/e5+kL2scFMuODSWxjXD7yEPOtzycFNpopdXBZEKh2/
         vX3nhtv9MvqEd4n2kcS+F+ktKhn0Wxrud0J65/78FQudylLDaNK+QPfXnOrsLPr5Fn25
         2aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006605; x=1786611405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=jGOVshwtrNJ0y4s6YHuO+kaBU50pO8Q2mVWLt69EzZVAoL1LWuZ8kJK4ENwsCzjrfX
         aUkPg8M6TXQjhi7X9C7LUkL89IIFE5EYEKCeV0HEKw389eZxSVjfSNQnPAF6MSHelvyK
         AQLH7fclBS5r/i5xyYzvnIvlq+27HGLsx1dVT21TiGTsKhRb832jCluGLTFcKy1h/ON+
         EDh7HFN7QR+JEFGihitfHGEisvL+XjE7/v30KgcnpAnOHSy3hGfGJzbgvW3IltvrVq5U
         vMofRZFDtd9mQJwd0E1ZhaBUotC8FC+/EzN+RG09+ouyxUZTq4rTzrDbYPo3yHYnGMxz
         vJVA==
X-Gm-Message-State: AOJu0YyYc/1lXndpFrh3ci5ce+V3hPapW7EO0o1CzfO+lTLCgrNBF2cP
	7EQCrWhkXXTUuAwwxA5aeTNnVMxe8pc1GrRGqMIwddCevUL1J5SxPQsK3TGOxkx9675ZybPCHe1
	LxjHcH6Le/XsYN4zgI5k0Jb3EtD5uF0XgaOUTWWtn0SlPzo7VzuTYBddNVlrS6Ka3P+xR
X-Gm-Gg: AR+sD13kIoDfbOqb2CUerBR729DP1J2fxy8T8RYiCwDcB2qXLiLKJi70d34/oai1Nbi
	rwF6dVdm769mvZ++8ARxmtfiQn7bGju7TBhzmJpwR9mVn31gkgOYbx15AsZvl2uEQmuh5ZuCvJX
	EYBuKkla5a2DpPwngcfv8OLvXHErBL2DPtlH53qL4y05p2DkFwLwzfM89OR5X/ZeTOgW8VXaHPe
	+bzpKKQBxoli79IBjLDN6G46IyZl9Tuzb95yqk7YidAzZeMIOu5QY5oOIbllgiG39DvdZ6fXXb/
	vnIOI6veBVc/uIm0IlLxN1FjGyvQCnFYiXca6BCEx3iPmI5cN0aPX+7g/mMgBIEakImBzOSQwqj
	OBIAq5g7D3EW/+m1KVORlPU13T0Cj
X-Received: by 2002:a05:6a00:228e:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84f2e026437mr14537010b3a.19.1786006604733;
        Thu, 06 Aug 2026 01:56:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84f2e026437mr14536967b3a.19.1786006604331;
        Thu, 06 Aug 2026 01:56:44 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:43 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 14:26:27 +0530
Subject: [PATCH v4 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-purwa-pdc-v4-1-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=1238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
 b=tUFUVVxdfQxTULfnbFmvmioDbrWm4544ON0t/Io/DThD0gWtktYNxnL4gOz5eCcuWJMZJo2z+
 mwVNDKF8hUuA8vZDLeN2M5semtB4M+T0wZbcDt0D9m/bWXXx+dcAnY5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfX+7YbphO3FX2p
 h7/k+ohR6RK1d8DyFALAKVrz+CGbICQ5OUzYsGgX77BZ0QbdIsxbbFmCwmdFvta+dnl1cFepX/L
 pfGXy07Y/urDTo2+Ei3865bZV4lTM6s=
X-Proofpoint-GUID: m7VMZ6L_-Q8N8piWdcp2WG5NkZHrjjYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OCBTYWx0ZWRfXxKu2S+oRf6wK
 DlxKVLtt/wM++0drOZaEqNdJBRhNnuBJB8z06wvupIZBCW2D6PBN5YlQMECy2kzZHZiUC95Y5lj
 HCARmEc4nhlroM7KSUVwUylAJltmaz0FxzDLjcTRmbC3uaioJRP97KuGMQ8y6y/SRfIJNXRLre9
 N7T/WtDhBZhDOZrd88ZW5HnH9cLEnw3GFVxPBLmqwgtmIigFS0PGQTGR4swdrVCcRWfOxXN6fXR
 DzXyEqxym1J8KBFIUhosuJCBNHC2yGLQByN3aC7xJKdKQJG1OAiNR4lr/DjdKJ/sidJv9SyTmN1
 0Hy1vcFdvR3WlrO7ybgmfpRTQ6Qvi3yhMjzjJI/0UFOWGTKuDosrgLUTpvChrVeTXkd8+j7L0Wg
 xvjNmrZAKI/wzq4cnyo6rdlt0F3Ou1Wg/rcppXWMH5LfHa38OkMuLXqTjRW7urQdg+hJuadOu6Y
 aWa3nZL+YchUGnRh9Kg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a744c4d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: m7VMZ6L_-Q8N8piWdcp2WG5NkZHrjjYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060068

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..b3d19c86a240 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.43.0


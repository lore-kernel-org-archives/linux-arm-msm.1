Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779858;
	b=FXzQlKbMJdONCx/d6J7nurSmfXcEc08kz/cMnpN/8aQp9MM5htwqCM8rH3xIGFm98NwC
	 bBhVeEWcyN9WsnX1gi8LoZU2uBffnC238ivASN9BCt1gPrmuZaQz900kzsuxqat5B9NRN
	 PQVc77aWION4zKgEiKYBd5tM7guTOnAp9rSAqXV07q5Svm3Kdda6F++Hkb+nKUkrWjn5N
	 c08z/lBvJXudvHIlC0jNDwKu+g+GKgoXqJFewlJcv9wE+9SeAvPtoywJ8saORQgXHGREL
	 WpsMeOmpENvlLDNKhu0EyhDVutFRvduTdKypUc5A/X2P6R+pdI6kjlGGguCWWNlTK9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=D1T9SzednKilbTlcinftuWKFYLtbStb6SE/HujUmbvAkE0K7cIUWaYJESEYqICM0UqUM
	 CpHJTXoRpCKmj65UTfBXVW5pLXzSrKdw2Z1f8WTQnej4TEatUG5aodyJOqPaRtjlpBL4H
	 ex/ac5DGtLnHWo1TCsZnjLc79ja2oAdTwfRdJe5Exclh55KrUNolxzed5oCVMOyhkg+pL
	 gHmB0qPW44GqzxNPIkguWPSs5nrZliRsm7JjHjLJL6CKACA2srnFB8bNr6pABchojUr6Q
	 VQhsJKxNd/IC8geKsFoF1G7rO3J76RdGyvTW7Jx+VB7vkslvliB3CYANuV7Or8L2flw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F2606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7F2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp5Ic2268577
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=dBJS62rlsuED/DG1
	i78emq4hKj8H6+mhm64WNWUuIK6yv3k5Q+ImF+Rg1xgdvNYWi0PqHeCvH4O8JZgJ
	wnyeneyFKDJkmMOgbK2Wa9jgyPbn7KZePKZxmdvaayGeKvMyzIjCXpIahCEOLfua
	X58GM2BzgRtxltYL88RxBMUY5LAs9FgqM/zD/DQmEl1ggiL4NEJOJKkFewPr+v6I
	iB5moLuw6cO6naPdIrzRUkBVW6DqK4+SMLJCR7jv5j7qbHbOxYOaVIISZvi9+fFU
	/2m+QM28yWN8Xk4Pe//kqe0Gh+yR2CD4rKMr3AGZApUsK0NnGXq4v85QhfizMRSv
	E0875g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhheac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so8762113a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779857; x=1796384657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=PkAODmPXjF1/fRy6BgTKi93BYrgym+VcinhmQMsBJvJrh64GgnBnYrMFNP5q7xfgqN
         ZPpAcyff9quKRKLYKb6VyjKdtBScyPaggeWnP93xQ5mGqAknYUgVkR1aSFdn6MCcJXLy
         +LW40g2ZQZd79AtTrqjLtVRgPGmFmO5quMKnSONUMfmjLekPvFFuik4JT15qB5XAlrQ+
         uhTXJQMQ7Gt9SdMBkGNiC07NQieaZQuyxiR3pVdR5qJTUT6xLP2UK+ScxNYRL4Yo+5R8
         6FuhatIIltTUwQ8oPR0XarKtWy05rs1uMW/rkuhQJ1OqQsPNzx0FiL/kwGe1QqHqVbA0
         SSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779857; x=1796384657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=CR/qhrRAbgkFhXqSQRrxgg7MeOq/5F9Kkv5tC92AT2SjnH3GWOGaYFsdldqqfMtRmg
         4DzdlCjcW4MgCyPsD5FKz3x6+vQoxUVgYM1DanNUQ31HrSeA0s7fbthQrml/R9izk4vG
         aQ9uH22HNTH7plM3gRFe6lH36k1DEX+pWgM0RtkL1aQbSUcFqysIpkOIkBA00Z3VOppu
         GNkDOlPh4ugp5fdMcZOJVZ16Av99nQc4uh9Ac5JtF9WW4SpXBf2GRihdWqRDpnqS2uTg
         qXO2EVCT/UHn6RT++v0/7aAKDDpz3s58PXRgevFW0zhQyC1wWC1yFVK5CtbQ8LlqUi1B
         ORqA==
X-Forwarded-Encrypted: i=1; AL+hErEpHnsRq+h9dGudNokrpr4QuJ36GlKlE/nF1C4I6XiE9ZA6fcmkH9LmhrVSBcK8K8OEWhOIxi1xaknJb7MA@vger.kernel.org
X-Gm-Message-State: APuU4Z+aEbmuFpWIPuV9E+rDObv+TgXHMGoKNiJ1OkMSEQ+IsZ2J9X/r
	Und+xJZT1T3jguHQrCtIM2LtBCrQHXZYvDQwk07j87T/0yZzZlHvLg8nuFZLte3MzKjSXPj0bJf
	b2DqyB4BUrtnVfspXn21+vigOf+uhFx/kjK8Onukdb/8z8EPnNr/dnrkzKAzDie+GYsrp
X-Gm-Gg: AZFdTZechpA9hbW3CAleq2Z1Lfdh5wNuiK2jG/JGjCKtpAIgy5O9sZvEnWGetND5UDX
	A80IwuhwAezjbvRa3yk9AGhleVkI1QuDRG7wR843m+FW1E0Mw0F7FdURbCwAIjesW10g0MKr8XU
	HEox1IUD+NTzz00piqtpYjuOYr7fWk6u2cgC9BKGSBV85xDWgUMmYqedAmfdggzr10PAUYYsliq
	h8qtvTz1fRfh2ViHe5dkhB6xHBkDuu3IY86HOmhlI9heFfILmESvG8KOeUXEykuJ73hpdd2ymTl
	0tTH8HllNCAE8LiMi9WsQmrJimOv1hRZRQF3uvQpFJFCoPt5f1SJRRYnUv4TzMbUO7tnkMkW8x4
	xZTgjmG1LbybH+ivv6tDG0ndXlE9rDq4b6a3fa0F4AGlVAZ3Ea2vR22jxPrXrXfUCS5JT3dJLex
	wSyS1Q
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643531a91.53.1795779856726;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643480a91.53.1795779856250;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:15 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:01 +0530
Subject: [PATCH v6 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261127-hawi-maili-camss-v6-1-0f4844eb63b3@oss.qualcomm.com>
References: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
In-Reply-To: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=rZ37/Dykad1gUgWkePEK4ua5jVhBcm3T2Lx5wifTU22AKkzobNwh7SmlpOFwcEJqJsLvINRXJ
 qiDvisd2FMKD3dK8zMLrc/vaoMNTITRU+1dVBsO61/rl+XrMfL5girf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9XnY4Ny1qjyB
 LL0pRyAWOfMa2ZsigHD7PXvv/w+DUf4xkSUk8Hn+T82ZLvIV6x3DaItWv19+QCHKfLf7X6YbxgC
 ABAbObwOcQ38dNIPP5W5YaR/+5D//vk=
X-Proofpoint-ORIG-GUID: dl7pSsrH8um-8BkTy9ZDijEvoHOTPoBY
X-Proofpoint-GUID: dl7pSsrH8um-8BkTy9ZDijEvoHOTPoBY
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096d11 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXznsxNd9XaHYR
 QNPJ2LtCGtP2yCUOw3OvtvE6T7eqNPIurT4BNsa/YcaRfc0f3sQYjAi29znjpN6JXqgYV1ug3k1
 zmfrpU3KUlHJ9KytdOAxfpajJu7TW2+WIwWudcg07G/bVyzw5eTceWhHeckv5aT545Ir5v75lSM
 nyG3zauCqKt39r4jZ7noScF3MTlAJbExIPqQE8OPI3XvX3olDT7qO1WSAMuVbqDRChlPGLGMtVo
 UaFcyLXkd9PyM4CB8Q2CKWVCsNVNVjj61HDmznVs9FHWYyDYEA96jklobXHfOxisTHvSLs1VB5/
 kvR2Pc02EC/DaTnUCiIaUGy4URPmo6Pt6//IXR/AaP6hQzJup2pU1JUwlclyTmPnzZoRdHqAcKu
 rn5YIwLk1rsyU70zCYMBGZ1aW5JgJuXTcd3sUZx5mXggnatgrjjP3iTNekwuN6mlQyFJR3Ba9pM
 PNl1iUt+XheUMeBlc9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1


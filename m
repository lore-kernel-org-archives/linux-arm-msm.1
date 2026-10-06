Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A023D9DDF
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280238; cv=none; b=uGn9xSqYQZ8ffT8raC8HJqy5jGqE3F6L62EZ720M4VUD4vytnE/L4tG0TAcfDqWXt62H8F43STWycw52px74a11oEy4C/OxeCmPClr0RXb+qEVeOegzI/tAe93TVvS30J0ek7PJijny6fZLjyL9vGUtbJ2wVSIrje3mW6OeKNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280238; c=relaxed/simple;
	bh=qsPzPjmVY7cJFQqS5S+8Iufy8k0Jcjs1HvjgGJjzLrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZBm2QYmLlNUbYLwKDvt3LCwfcjdaKApWGIx7kxSU97pWgeW9L8PZZh6UxNWYzAdQbNqhi+ywpQvj93Cs6ItPLZehXbFALiF+VvGC8+a1TDubDbCv1wfQ3Y1Wh4simPQpQCzrxxhzOwI+rv+m2cW5PXqGtn5LOQCjbXBBZRaNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogjUw7UJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfmKQII0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogjUw7UJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfmKQII0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6969Xa3J801238
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=; b=ogjUw7UJxOo7z8/P
	TllZBRsv8OaKMfawAiyVHrzrteeKnXuOGTELF7UHRgrA2gmkaHE7KE4BQ8Vae3EA
	CKbK/xmt0Ex+03JcpNdBbyB3m2HUrQNdzC9DN6sCWZdRTVrbIm75O0wFV601d6cK
	A0EJNHShUESBZW3f8N7Uajl7ewMGZ49Ac/OUwUCqP8BgxBEuAL86HYucCXfx7ZiR
	zQk2OfoTknWmHR7fASnJ5uKe3PPQ4XhZvJpT8j1jQHH1nyD+hJBWnKhuCksc3H0l
	G8B5NZI61zb7DAKJJSVNerbMu3TzeOQ+RGqApjL2HkB9/V1a4Hw8kTgltod3rJ2i
	sNau/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbg20g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:50:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88b59692e0dso2520600b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280235; x=1791885035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=;
        b=MfmKQII0iAUSpJJRMIp/wLXI2uWHYt04wcX1foRKnGJSQPydNq74dvB7GxwmyP3ZRy
         MmghO2vNFV1CCECYc2YV9cgdA/7uQRFrWbQ3MEOtGu0ZmG4hkdGJbR6SjLxNHStt5KR6
         BwArNPN5MyxyGHrHZgdJ/9pr4ng4WNsBwzZhYQeJQiqZuZR7fffUfvQ01u0pHaMT3yBg
         hCMXJqQStFp3zSpRlUweBYOkB2rNlQ2oXE2sfyouhg9GfSRXi171IBQLTc5NTYHD1DrD
         iEhQgJM6/KmjxlXeMpB+nYMvsx46+osxTSn8gpgshnuQMF62VH6utpiD6YksNmhS1MVd
         UiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280235; x=1791885035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=;
        b=Yl8nvVih0jEzMYqjnHlUxDefGfA0rKOWWH4or10SO2y3X3zgDEPBzxgR7ylxiOiZGm
         /Bv+qnK2HmE5dsrXgWNby8w3JdqzrKdQkRSYH1Og/37DBMY0CdO6q6N9Vq0VLtKVCbRG
         Lk7fFwg8jRV++I8YI30QlE+UZLueqKKu2a0FyEIyNUJm1q0e7WcTUj8yBW2NF23nOzv8
         nJUw9eilME69JGLomsMPt3YEFbA05WsziPc7g0yqGZzeps2I6wGTh0iNBVhXFIScwAbH
         ENX3RhhR8RLi3WsDsJcy/T5bTe/xiZHuY98INlzf5zJUyhko5UO4Oy6KaGE1EPe1WRSL
         dvIg==
X-Forwarded-Encrypted: i=1; AKwUvBy4rfBrlZSAwRN/AJPrcjYiOOTM3WCCnmxdV8EAiKE0eeXUSU99gkoDamQdjvvdooMFzHMtQjuD9S7lKIfE@vger.kernel.org
X-Gm-Message-State: AFuF++m8Bjieb/LeMmEFR60pZRXkRpyyskywN1K4j1pb+sre+13th5Hy
	M5xbKjHmCQwxKm0W4gULVmRZiff/eFXFVgXV5UwsfWAXyTth1OiKaxrBAfSxxwkPIodH7A/5a8m
	QCJchf5EOM7QBpNHSr5wgY07RgZXzIELHjyvuRP6aaQ6fE00S6oacTQMWjmr2EoV1r2SC
X-Gm-Gg: AYBFou3j3qi6ysD9plLI8b/mgGBbvgCSSvv1M7tiOwFBBrMJ2NW7cCbDT7meu4LZnRQ
	orpp81VpxA7H5kzBjSXTsYw/6NUWqEVPnLdBmr87+yZSQEPWcbA+NKz89xmWZiYfxwcsa0vR2x2
	NnDpPEwqn1h6/N87pgbkt/UREBurmfJ6vNnWpYUjdTY1bQUqrCVogsp0la6dbLub3SXwwqVtWlZ
	RtkjMMJf8VkDE06Ux2e/0sV+PAMJ5EkPGS5jiGRMZHSM7MVSv+RaLW1tqyV1eqv3N672qBkxGOW
	RopsUSx72tJ568yJplaTHkNyDa9Gg0QmKFZtKlrIBy9f8g0KbdiiVG+bm44ojnC53pAoGGyufRm
	x9TwQ9SGqK6B4KYbtKq18Fyu8hFprcdZmtzap0xdL7RyTmTCx8tKZBGDS2isRhfKV
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr816095b3a.55.1791280235125;
        Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr816040b3a.55.1791280234490;
        Tue, 06 Oct 2026 02:50:34 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:34 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:27 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=712;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=qsPzPjmVY7cJFQqS5S+8Iufy8k0Jcjs1HvjgGJjzLrQ=;
 b=qvRzKuir7c11cUWFzXRoyjqo/4wSU1zZUU0UoCbRVzYctYg5+4INWLYVrNQm4gp6+TNPAprsS
 sxPPAVGvIAGAHKhLZ0HpahkYBg6HolxvON21g/jb7/0uVJNV4FEomIg
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4c46c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_byYVBOMx7OMby22r04A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: C-K9m4MXCQL1e31DKMYtvS48ea6A1yvp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX45CIvrckb09C
 KM95kAD6aiQoii3TRUSYxqXxWaYoBg4MU+yAIk1Giy3z4ueSe/SjpaZz+fEeKM/R6fB6DPueoPZ
 vdlIhl6ya5LmuAfVrNWIwRFlSHyAxUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX1rYKUeKrvYjt
 ABU8ql8LfRJ1mF+RpWGokU5b+KBOxHKmLHkad+Qq+2sHhdkrRIZE2GPmg5qYdWyM07ridJIzlbH
 hSfXx+TJ1FPuBOsBURbQdQ6IgGWGkJFmfdcgKdLx9SIAx/fyKxSr6ovL8P7+1vBnqs+v5FCsTHY
 0I3wyHaHgQS2sKi+tNLzu4nE3ymmxmm0exmOItQCRz71RTX2dV0LjdDEx4HpMfUmGMNw4rpPeHy
 zdyA4Mg6cKL/Q6xQTyHFgW8z9VUKW0nQmgQeKIh0ra2VnJOmnarGFVoCsUBJ6zWHRqDR1fSHzpC
 4eyS34j1APi2g4mluIi2+0YvGqMz9V4JWvwbrLDxO+slE9w6kMBGt+CEG2QrcIRsa8vakxPskRl
 X4hKdBWrUD0vzjnZaDIejJs0ZRATSpwsmAGlqvpJtwMotVktVFdVIJ3ArhVsmWNwT6RoFsGmWL6
 zAZ81ir3qGRti5FpZSA==
X-Proofpoint-ORIG-GUID: C-K9m4MXCQL1e31DKMYtvS48ea6A1yvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..eecc00e2a718 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-laptop-8-13in
               - qcom,mahua-crd
           - const: qcom,mahua
 

-- 
2.34.1


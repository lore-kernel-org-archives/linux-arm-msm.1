Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AF73AAF52
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260476; cv=none; b=Wo6vr4GHbPSMLYA1Oi50JcZFyannHaNnfH9QGqiVopp6GObME7h0n50eQPoI8z1DyVJTIPMk1le1jXXfWf1S67om3b7Z3JkcBBo/nBEDCXrPo2Ik6/M6PsuofddQoWGEt5vk9VM8YjZikNyMicmhFdjqIMTaJAe6bCrI0Hw3CLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260476; c=relaxed/simple;
	bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moIdJr7Bnlj+iuhryh6OIhM7iDZbe/OfAdpLmiMByk34mfiss0By4SCeQ9LZyoTTJ7Hf86Q1ygWzEHxksM6c6njRyYxZ1OQJqJeDGd3LoeQtsojKBni6rjtqfG8LsqHe6DsO/Suwa6AOATMZ/KkfrVnNkUySXUGqZBWD//JO95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQaAHxuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drJ+8Tzl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQaAHxuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drJ+8Tzl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795eV4N1854813
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=; b=WQaAHxuSent2Jsyc
	u3xpRYhi8UdSOyk2E6gBPQiR4iOUOQr6zojvtxgJS197LWZXIfaVhNTuDeTvDHl6
	wzqrH8HRmZLsPUjBC4xdccOdFSgzU08ekkJdvfuIwkgWgDk91M5bjfwAtsmj0fAD
	k4+HqRvBcWsUzC5+TWAwI8uBTH/X31hewTEJxUoFuWgKK3iPUrZDdIRWwTCPcTE4
	Am/Ik20QWFLzsqtav+uI0kSxJvQBqhTMJzo13eFM4OB9dgm9xYh2v1zmWE5tNndG
	xqDTJhEi7cRxuB1hvchGmBasRIh/jKITLwEyanOX24gJluKVkbSN/cNDp+6BMPWa
	SITchw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush2j3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:27:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d122bbc621so28930745ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260472; x=1786865272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=drJ+8Tzl2zoLEL+os2be8GEyv8qE6ZzGRtfGGVHyJ77fIPAGtcWFwZM2io8pAorLy9
         wN/+Gq0/u+a5m7sF0J6fqxpzQt5KGPVdNjg3zSX6EnbPnyPsmpYAm061ccctiq6+xH7v
         OnjzrcthBKLmmHls4AkSfJyEkGwvhc/KIdO4VivLJgAfiFW0jdxK5Ko3VrLE5nhvsTCR
         K1qANPBZu0ke9M9rJoH0kWQGzrXSjklC9deUDHEiOBjN6UxIhZr/52D/2r/iXfAOssVu
         K0fxjfFJdJf8JiTZHynlbohdNVxFNgTYZmP8rfokR/o9uX02XD+IHOXYpKO/IhqblNdt
         xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260472; x=1786865272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=DcFCXhX3qUn4Ibtsu+akMtScTi8yJNQhb1cMU5fyE2TRJ64CH+EFBznqWXsgfaV1nU
         JU1yFI62XsYCBHQw+pWChrTxP30q/dUvObEkdqUvxablj6uLvIXxiIPuV32Md7/Kj4z5
         kQg/Yj++lsq7OhF3kAo7+OUzuBXqUAdff5PtJo67eUGma80xDSlrWcmBi6hE8jRWPF4Y
         DkSuRpaVmlhHjCtm1+rii8rj0gSjy26Kk2gtO+9I8CwXScRI3OApWkmoH0DQs7LTBfGX
         7Nhre8vii7G93Z/nmNfjsiuIr0AIBU8voaUVslbsrhHoRaL4iSd961Neppzj6Ck84ZYh
         8cTg==
X-Gm-Message-State: AOJu0Yyzv82GbhDAOktm8m5XNhnVSCvswqkFAwWl6/YEn64UKUDC0CzH
	0wYT+EqfTabAxm7TewmVLe0rOS0+d6G+sSiZ0kME83JrMeQONpsDgi9TcBfIAWDsirWHO/lRg15
	DnwtgU54a1zuHvMbAop7DMJzG2m0ECHMSP9K90NWH30Ec7M9ENG57fO6s4PHClUeCp7Tw
X-Gm-Gg: AR+sD126ivpP7+F6ag9jbtbZJ21FTjoz88RHF8QABRwMjLW9vxUSHB+/P6xACS9gaFu
	ZjlMuR1lhyoVzWR12AntjRIUfAUjMcbSGp0T8munXa+d1hZOGzXvUPwYlXMDhCXJjCs1hGZoMNn
	L7agGwBlMTw7jqkYoDuOhzJsbUkr8iYoRLCyV3DshLrnpddKcjiwQ3WX0r0LicOZH4LX5DXQXKZ
	EjAqhVoiJVYnhZpHokR9TNA55/CVPYiK1cglTMoh7qn21G8C/6l3Cy2dBNu11p24NwuT6XpjEO0
	iIJA3qJBy/cjoCwwkmnbvs9in+f9ajiIIjucAZIX/86yxm8+msI+iKrFAKVGnbeYJLRYpCwopsq
	B3Mseu1O9LKu2fa49U2E1F/yln9XDjvrPWG+cA3yloU15zqOqM3d96EH610g9F2+EIhqSnKNv1G
	tMJcugVYJfoUrBdPaduIqhuME=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623796637.23.1786260472474;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623755637.23.1786260472066;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:03 +0530
Subject: [PATCH 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-4-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=862;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
 b=qhU7O99SDlfFR8Z6z4Kf6lk//kHxeS5D+db7xUfMIC/OxSBf8i8E3N52EXWsiRBWNVQrND6cW
 vhQd68Gdn9PCZzv27ywcqXlAqhuAQfcYZG3McnmiuRemmqvrYz7QiIc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: EDK8zdgJSxbf6thAU6oS00773zGQW-Ml
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a782bf9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jfL2y6gmHgFrDZrSC00A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EDK8zdgJSxbf6thAU6oS00773zGQW-Ml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX0Xwi0pmWkHJG
 mGIfL1tOcCtcJgSZYXKlCngdBLvW16d6BON1HGskXwuE4zklFAPom2Fh4/IGjYPzEOF5fVAnmBc
 5JJEqNYeMUhbdi49UG6sW2zYc8T1lHVRZa/PPnEQcivKiN5hkNsk89Xj1ia4V/jQHXXsbIuuoTu
 2TRox1/NLPXp1xgoHul+sFq1DQpfXQx58PSPtGA5AJOie0zrnmO/U/hXc5nM+NfN/mRIUWMFYis
 1ddoxErfVwCCDuCcw5Bi4xk5fnmoNhAb+TpYooe/9wDpt6ju0kxI6m8R2D46mhE1n81H0nxGm4K
 I/qiNnM55LEHbDLCdTb5wPkREb/zeHjDkCCyNsBSxCajxLtFsgnaQkSFB+56jqPdACgZHZdCnmE
 A+TWeApyn0dmRD+8slJlYT5hb/5w+z2S1iRP5/FIFOy2ZDU/SSH7ULrV8G79e+YH782lyIKw+Xl
 opHke/YR5bJk6v08dpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX0RZcjcRmALgI
 Pxkp+TuKy1pAZDfzN3K7b57ekx0rtsNFdD8AvYGIdjp3YpG45SD62wgtOu5RpVc6KJN+8PPvmlB
 va+08tYeECLwgfxrR2C14LZyqQ5lKbI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the RPMh clock controller compatible for the Qualcomm Kuno SoC so
device trees using it can be validated against the binding.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386042..971464c63ed6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
+      - qcom,kuno-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk

-- 
2.43.0


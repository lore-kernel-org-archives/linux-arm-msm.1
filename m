Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FE3AB29E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179239; cv=none; b=Z3L2WlEyf3hQRw47P/Msnnrity7KulNdM/qiIKzFYyIYTYo1q/0Z46Qz792VH+yFKbsbQnUR/SVQOwf+DrabqM5RNW5HVEKo703kX7J6COAI4FA54YkvAdKY+cNk5FbIJsvI3EhLg2UbvzIscULg+ZuAcwaTAeFbT1uPkKIsQkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179239; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwWKtpKw37CFXeT6sYOHPw+M0WHfpvMbNuYvoB0paBmjUKcPoLb0iUDwHogLPcMaNyJiF2dW7bHqhXaaeV+aPPDa6IWSM95hMNQ3r4Zwecp73GyUsW0YD2rq0ErG0J0eoQfOEsdLcIzvBSVZkc42LsscQQy6HYtu+Jsv13Ccbrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5kXIqbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuOCg0wS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5kXIqbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuOCg0wS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKgWd322188
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=A5kXIqbuPJ0A34H6
	boo7mLoML76S9e+io3dj35PspePtna1xhEzhlcIm8Z/aC45JzyCHkNaxpCL3psRI
	7j2xyeKFax9lIVZBXrhn80sFQPiQBND4BnH5xuUkJTg0SmrDdEZVS6n+RTIxikfE
	M5qqOShV2McuIQYw5pROuqgHIPbCcQeuYSh6s8Nft9Mwqh+CFNcCV1R4pdlFMYtI
	OKzGG2RmPx4khe7raJ2hyN+/w7NALGschZYeTD41wOuELJDvUBbWf46lgYX0zZAx
	zr8mwVSnbUFyGeO2UmvjxxK4H7P/700iffUdTvtS1piTezM2kvT9/oqOm2FpYPrG
	aeqGPw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgr17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:00:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so894684241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179235; x=1790784035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=BuOCg0wSGRWmBIuwPa5GHy8ewSClH0Oz+e45acgCTGfrouHHh2GA5LORuccWdtYXry
         A3z0/wMPZF2Lio5yNS3536dajhKZPPDh2c2c8pc7nwoL0ylvOetSRdIHRA3HD7gy2VXm
         gCQJ8rfo0F9TLKYftYmalYnHmw0dUaFKP2D60S2PTLtEPcqw6vBHET4VbauCtS3zLV6z
         RqNLxLTgNo8jqFlO/R0JJOGjDTZ6d6k8NYtEZ635DEUe7dkbT0LngYssOPkVAdW6G1Ql
         d0T/0qEDwovrHZNRrPnJX+9m68lAkiMaoX63MvfQpdgXSBhiXWMDZxHgczLGe9sm/Kip
         NLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179235; x=1790784035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=z6nqIw5yU06Q3AGm4WFj7h7qbirgHZpmyE0bmX96gAVe86zX3kL4bU1QjCguK9bmL9
         Cli2J655WTF0orr9ucUHHvQVyoJ1txbZnVkc3g57Q7sGjeijWNNGD5k9KT/kgN/IWpaR
         FbAvYW9zHmjtTkw6VGmV9v9ajiAWbmb1F8OSuCmvSlhQpurZtDYZhTe1wulGc1uIAlfG
         xyta5d/2z5F/qbXHmT4iYzHcgUTNHcZYtEbYUFm7rRU715ZEvaXgf5bIwISRo0Apavqb
         4EgXTkt0L4GgIVIzUvOfOHWOqrmbgE+QmzJGi9QyoZrERVoPe26e3UYQxPSF3EuVI3XT
         2QoA==
X-Forwarded-Encrypted: i=1; AKwUvBxSNMROJ1IkNUnMrWDyRUa8V1f+2MGviEtIHZ3GQNykqBP7S795GlB2vBFO8LFXKYf02lk6n6JzduypJYIf@vger.kernel.org
X-Gm-Message-State: AFuF++lNeO0KKlgS5sdxA4FChDx2SfA96i85b9U1ucqHUS2JnEe0fx2i
	ZoOYM+k08H7Cqts4yONt6plz5jDsanvmDGkdSwkjj+aTzCxSqiT/wCPN0q6DJicUpiKC32P00qQ
	sfm2Yvq2UT3JNZ0i7pw5P9p8eGNQan+R2OF2/BlLOTQEDm5V5c0VmrnsiiahIjsMFU/v0
X-Gm-Gg: AYBFou0jHjAMYcK1fzqxHeecrnO33taqEyX3qedcIuTYvmh2viau3MS/gHV/E+typCA
	k0/SJY2oWgD1qYbEB+FyxK+h3mc357IozRuNmgGmg+AKWm1O+mmZx1tiST91pHgzTIamIYYIcUf
	yjs/ov5fNLUcQri4AtaBNNxxVgbQg8TNFPRTFnGTzzhks2Vdh8GgDVBro0DG6yAdvebulPg3wS7
	IfjBQjeBcaMM97XPwb2woK96bY9hjjbc7ar1XEmzfMJy+ODKR7HeBU2dGCryZvrJNymd+9gXRJ2
	NVdjjKwH6gA5WFIyTEVVcXEX99iSZ2X6Cgnos6T0MX6jBnPYjm4QwP0eVSuPaXYfvcojw/7KO5n
	8ohCQlwwRXsyzVKekF7s8Ph8HokMNwhYhC5JiR4uO8Z0xYFsOvrKnj7EQ+ryD9MGZqwoxBPuUAg
	oisnaHKmHRkdV/w8042QBSmLiYDbMXWdz4IkOXVLUycwI5hNEf31w=
X-Received: by 2002:a05:6102:424d:b0:7a4:ebdb:cc0c with SMTP id ada2fe7eead31-7ac1a8b6edbmr2871911137.6.1790179235343;
        Wed, 23 Sep 2026 09:00:35 -0700 (PDT)
X-Received: by 2002:a05:6102:424d:b0:7a4:ebdb:cc0c with SMTP id ada2fe7eead31-7ac1a8b6edbmr2871877137.6.1790179234906;
        Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:24 +0200
Subject: [PATCH v9 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-3-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfXzaI3lYQ28ki2
 O2Z+gBLVZK8pA/oQkxENtsO8eiGeuxgMqfe+DKYi375caxhqvQO0ilSbRU+uTtZXZNvdh8Cj3UM
 rKKK1ldBtctI3htm8JgV8NCHsYNS7nt/fbQTUJD45wBKzXPa5qw18yOuM/eAzq+q2kZhpKMuNvm
 bkqaEXw0KGKCdpg7F6TnvcHmr6H+KB88SApoVKJ7EzhQleUQFqedjjqabFvAt4YyNDvjbTORjOg
 hDOdlTZPvanIcadhtKY8tXIiXVDkTcMcP564RAxTnsNTHzf3e76ip6zoGvv/UC9tdRkKnszm9PP
 BHwrjAzOwLCU83AE+o6oAk21+nEtIVYhll9WtPYtuQUslICC2rAvWg/lzz2xldzOPPtEUunF2xh
 jPa2r/YOCYkyCMQsO9EJ2Xp+aM7F6YU0Qr1W2hGQSM0LB4MZjPuMYLp3bHGYC3QO3hy1ex/pwRe
 NnzcZnY2F5ezxklAYKw==
X-Proofpoint-GUID: 3yLRoswgCsRn6X9BT9VEpbcFCqMjsKBp
X-Proofpoint-ORIG-GUID: 3yLRoswgCsRn6X9BT9VEpbcFCqMjsKBp
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3f7a4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfXzNVELrS1zXbV
 XQUus1U8OLNcYORhs8dd0+uO8sTyXOLZknRPZD1UEPHwcysSKeWW7B/HrcunqIQ2FHGsEhjkJ0C
 waZq+G5OOX1xM3oYPLt1hCNGut9Yyy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6323E7BCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553486; cv=none; b=FklX2BznA4GTnmQ2Ar+704S5BLtx/Gz/l01WkwVegnKaAvCXU+VNZAqqw7dPT71nVRaVxHxF5ACF1k6XJmqBfj0O2qeDsvAZpt/fqyrr9zto6tANX8dDUTieeAaZoJeXZpR6Amee8ANjXKZyDnni8iZgehBHnq7M9KgHTAGMT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553486; c=relaxed/simple;
	bh=S26FhUx2s+8ZNZOWrhcwvRmp6V4Hz9aYqj1XArv4MgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=appcdrFE/p6oZLPQl9GMqLsxcFccemWoFgZ9lRDfdc7fHUeVQMEDqGmonpT/EfqWq4txtFsYjMaqfAkKgYePSI1PfgRB/jMrnH7Ru8KHFM7Pua2ofVXzwg47sD3CZ49fkBlqAV2xfxUI/g/J+c+kmIqohauoP0nfekL5cxpgNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUVm5xVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP2JgGqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUVm5xVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP2JgGqi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6ScRB1982465
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=; b=JUVm5xVbM+23rmXs
	/Jra9God0d8OxWilAVpjT4L9DA6LmBLAFZ8yHo5AoK2IAt0n1Xt8Qhzkl6YuhPsL
	lsl9RkL6RQgkIx1A5eDvIL9AFO4Ivn/BM542M4fTiCK3FdmoGZc1XshqDTBN4Ip+
	cuAZjoh565Cxu0vF9ABcPcFWEhOr5b6lvp9vLNguxarhgQoBLxw+ABKa32As98jj
	fXfxtsdDJTZE2lsarmA3tjIbdexjMT8tJXv5nerjSlRFDkLN99cGFykaQZF7p2Cg
	+eZaUruAuQrztPDBfPD1Hg00mK968de/OjmpEuPnvkKMNaLTDOVa8t/4TQ4NOGcz
	Cw1/mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8199-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4965243a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553483; x=1788158283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=;
        b=OP2JgGqiSJH/UD08at3tvj7ex+7mcijfabW2rP3eK+BvBjVfkxjAUfyz9wZtEo6/wH
         Pi+3NZg9DIQEsOiqVUfXN0TtZRoMBBvy4IEMaZ1g45zNkGHksTpFvwOlpY7GjOXcVdDO
         sTKrJpHKqczgm+SUUVbvWXqH7K3eGK3f/fR7n2vtocdEOrkURiv1fviP8Dav5hEikXZV
         2fAfmA7btQ9Z0JaSTMQ1ORrXcnkSTwIEjgKlYu69m99gxptsnxsn7vaFLcFn8GMRqj/N
         uMMBphXOC86qmza86OiqbL84Tg4m/7wOdPd9bwDLCGs/NIsCftcgL2CO/Ox2MBdSTQOj
         xMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553483; x=1788158283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=;
        b=ZucMGfLl3Gyj1RwZwInF8r2J0VzSkwWf5Y48jas5MD76VH25P3sjXoKlT9TYZK7RdC
         qamHxIZqzwgSieb0NY/6hUjz7VNk90/qk76icYWcWoYe3ZL/VJWLSLp8q82DGhBXVP/R
         HhQbQmiwONkRqCnMrZ4GLeiQ0FOY9QnevaR1qh87M32ec8VKuXGnBKeI3+WLiK9mpU+w
         TvPCYon2pFdgrGqaEI6Zl0jjznxBgrp7g5gIufwdkaPoQ3MhwRLVn+PMLEbhh2s+zg5+
         XPDBEmsj9MkGB0pg7Dneth3H/kr3Yy1cTdKdzEENBcQmUpTV7DP4RUgPzBh9jHoxJGnC
         uaDQ==
X-Gm-Message-State: AFuF++lgQWxApL0yK/inhHuywSjjYLlW6PUc5WdnlzAcgVRanhjsGuqr
	YHARiRY2kFZZdbW6sLfKlH5JJn3D3/qXAupISEGt6BhM3P4HGrNecy/s3hXUvEDBjfH4iXQ+gVE
	hZYVrM+rLS9y7+h6jgFFhR/pgMbWzyUKPiUVZI7jvF+zjHf4ogG6UU6lZFOH07MYSC4Qi
X-Gm-Gg: AR+sD12V5JwGpZhVezAWyTVYwoPlqWOmvm3rHOaYo1vVs37OgigztOsIOh+85t8HhBM
	yWIAEDanKs8iL+S0FxA8cI37yTtdxCQdNjJ08wV9kOpHIOgK/5eEukobA3cS/h/WH0wzYu6KL1f
	lfSa7R/T/hH5/KIywrXXIVG/Wyzaz/RBZsXc2HmKt+ymK9d0w6w4RqdVbB2oRfeDO00ORqVjP2e
	7/4fh9iPhJCTHljxY3ubH0bJlQEAQ1sCNviklCYvD20Hqmvup5bwpkGt7yQINUgLlDEZiqtVwCv
	nyuegpIIi5dyuR8FDFcHz1PI53c3MFgSzF1d/G7DKh5QZ+9Ydptbh7cR3qq0bkhAvVuWyNbxUgO
	kXkOv3XtwIkT8w8pymJe9wVvx5x7gFUqdkpfaaa55UiqqghO/jAnXM9yWa1zU2zDYKqY8PHdcjU
	ArnS+epRVviubhc2xJ7yXf2wXkM0Frag==
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25815334a91.9.1787553483026;
        Sun, 23 Aug 2026 23:38:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25815270a91.9.1787553482634;
        Sun, 23 Aug 2026 23:38:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:38:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:42 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-2-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX6BFuoIBwC3Jp
 FnAGfaFXIx5aGHuqWscFl6nSZe9X7ArUdJedE5pyuy2VphzdGSxjb+BvkVKFJxZEiO0aSwf5NYH
 sStBcBIFXEWLHWp/qZzHxbAmtfbVPFs=
X-Proofpoint-GUID: o4wATF7i90pD9gao8ExUWhu759Oj26a3
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8be6cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XzRahJapldW6eB5g9eQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX7JLTNfPC066X
 xRG7ixwtvrFheliPN0HH5NNdGp1beieQcQl4E9CEKlqVdjDANENJ840L/LRNJIQ+lSTscT2JCDu
 W7hS8J9wgtsK4+cA7JGedR87WgzXMlgXK3UT+0FlWm6yeuOMpIgXu+9s+RpKurdYb/qqyxrJ+bc
 JX2p+PMnTNHMxiR+Ys4aO5r87Szw9ZrN5QL+fuubcz0md7ejI12l92fHFb5JEPCmFevgJ3jTUSI
 BjoygE98eX04lJX1iNmTrkRYsMwXbaQIrPqZvUNjvaAj04BncGhg6sABF6uUvgMwMGHz+90WE3h
 peTuRBhwneN1KN8Q667QsHdDVhdH7iLzQc6yIaECIdX/CeXXoBVwQBh1xYv0BYDqC5+Qr7ZPaxm
 XyOsaFtNlionRuYENCxru2bTSMpj2vQrvXBwRjcH4rnw5fvj4HCIDALYkshaS/UvvGmAfMBn7+N
 oyJSAE+w/Zrlva02jkQ==
X-Proofpoint-ORIG-GUID: o4wATF7i90pD9gao8ExUWhu759Oj26a3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

Document the IPQ9650 USB high-speed PHY compatible. The PHY uses the SNPS
HS 6 nm PHY fallback, so allow it in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..405bfad2080e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -20,6 +20,10 @@ properties:
               - qcom,sa8775p-usb-hs-phy
               - qcom,sc8280xp-usb-hs-phy
           - const: qcom,usb-snps-hs-5nm-phy
+      - items:
+          - enum:
+              - qcom,ipq9650-usb-hs-phy
+          - const: qcom,usb-snps-hs-6nm-phy
       - items:
           - enum:
               - qcom,qcs8300-usb-hs-phy

-- 
2.34.1


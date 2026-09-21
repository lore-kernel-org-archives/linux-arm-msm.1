Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F371B310645
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005007; cv=none; b=RWz5CrHUud+/OG86oDHfTD53D7mxxSy2+278QjZ50U78raQiuK0RqkpuFno4nRg4cCqveWwX3g1Wqckw1m3GdZSw+rIvcMgf7MOQhSV2LQ9QMFLL05oNq5XXIg+UoCT9djvWM2C2zYSLOC5CSRqw3wwxU/+jT4NxpsHRWZVNvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005007; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGmY0SG1CmmITBmZJHcABmN25xcEtDlOeBsx5uS6GA2NcRgbegwtUsn6JdIxNTLsD8IyspnI3tCbG63vkNoL5Vl1E1pP4H5Om/cxb7TuL/BHpdBbGWLavNtq4b/VuGrvCnuxyEIbxkI8bav/82gfkYXTYkjnFq6eu9Lu0tq2yx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWbQ9jUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeOeX011; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWbQ9jUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeOeX011"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAa5O884560
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=dWbQ9jUezQSJ1tuY
	T1FrdwSBXPFscE5nNBotwR9KY+RQClgxdJ7Eh3nKsIpq3uprWwc2VT6riLALZKFN
	JZ1P0uO8FvO48KBuda7CqQsSIT+c2HFGCqHtSKceCNYH8vkXs+2hddrAtmG09shs
	5dWoZwkIHt7oR7/eVGEfYJXBhjiCJP4U6DH/j+PJMIJrWsEWjK+F1eBP4ob0wlWZ
	4RvkLCTKxq4Cp1/Uj2Hv6yOFvCKpPnjp/Hjt47H+gZDunJFDsKJg181+8W/XIQpe
	WsUOS96FjyptWRBJi95Gn6TdsLaCrgm8EqxUDuY5ukXDXyohRSI9nnwnUR5Ruj+e
	e3js8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1vm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-788e076423aso890932137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005003; x=1790609803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=HeOeX011pehEoSKLv2ZUhMJpfX2NH9XxqoWkEZAZQDUtvFxSBevbStdRwxF/lV4pjG
         F5i1U7YclRTyxijPBKhDHsAYdezlJlWb6t5XRa/qu0R+8qKJNSu5Cyb/z7tC3gjgx8oT
         xDQEmyt1cbBXgAI1DuQt4CgOKE5GdTj/JOCD3225SWNjYww+E0DrdUkhSnPi4nKklPQV
         n7fHROSeDvaEdDRAFfhCXDy7u+IcUckSoNbGyWA+c6LjiOybDTwFzryrFMPPItuIkEuR
         jLhLgozyxhTb7L9iTuRG+z2m+fkrMQvbfn/ndE8EZ5NnAlnx2S4Dpb+CdBq8ejl356qL
         Y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005003; x=1790609803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=zOkY85eRQgl5HJtHOg2QiTAj7o38viWPetzyBG95ZxyhB1iiTxkKkvkBrYIuz9f/38
         BlUrfR1vKcrzttcSP1iftHHNrej0X5m7JNURfnZBFmonVDz3dgL9rIRI8/sZDpkFO/8O
         0JRmpPhuvbqSa8HSrKsJqy+utDEHeAwTv4u2MoCb1mbZ4OYJqqskbDXbSspAu+vW6It6
         R6nfPqjnnpR1tcD0Tlp/qLsypDfJJ2xtaJgZaMBCAhieFzDTBMolf36kt89iB+/lzZjb
         +bvt2rHu8WaP3NzBR9GMEs8YMPqXo8C9oyTFOwf9s9uF8cw6PC7O5mE3FN3q0BMagdEz
         xbTw==
X-Forwarded-Encrypted: i=1; AKwUvBzCGbiIZ8JAxc7SW8twGN32VQpPKeAlpl+IN1F3TWZWX9ErCQpVBC63zzmvx5wCHQa8h1vbTOSP/lieFFfB@vger.kernel.org
X-Gm-Message-State: AFuF++kBfu7GxRQ2ET79Q4eEbpMlhZfvRAFZJ4AS0leU8aBs/Gdtsvme
	2cQ8elXZKNH6u9AWZI5TqY9JaIq/QQbzoF5l54YkvD0TUI0Nv3/oZ+sZFwJSVsWiBDKe9Cw36dB
	HEzuIWHSFDqA5QFADeQ+UwQghpCp5K6kjobS3+5S57e/l5xkp/ZhHt48nJq47Irj5vB/q0TFZTC
	eh
X-Gm-Gg: AYBFou3kTSr7R9QQqe0KcHsNV/3QiqHHT5yMV4SDfouzwM5Y7TMb1dkxFvoXkK8r5gT
	zEKANIbhcB4sx8wI9KFR66LKVzpsrnSMMLB1+6sYqaDMtooALUYfHw6rQlNni2AgCyXD6tBJGv0
	O2QgsvBjr5YMM9njowlDOhenGUSjwvR8Ua++q+SzhJ5TNmqzUtJl7EK1GucGuq6JK9wjRssAPN0
	GHNNFXIXbN3SbkzsIe0Gv7AyfUNAotPhIdcrMTlt/Q5BvmHTt6ZZJ2p9hgBF4Nj85HYZYOfmOzH
	uh8YAQBrBlGrxxjpX5BrxJ5yBNH3xS54jcyjDyY5c6Q73yuaGN8oGzlpcH8jUSDdzOImxSU2A/w
	CQuzSPA7JETlsqukPBDrvHUAXXZaSTif5xX5cST2juhXoQEkVt2ROvyXrVJYrHzY4URPqAYHJVR
	q3VqXcz7acGY3hCee/QxxAYircoabZMWm+cInvF8wQvU4fDjw6B34=
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252341137.20.1790005002787;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252292137.20.1790005002356;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:23 +0200
Subject: [PATCH v8 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-3-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXzaMbASQiQZg2
 PCdiHVz1bEH8DPbkJh4kOzcUMeNv17XSbKf9xWECfVfVZYZo5VwlrfHqcBnGEG6Y0cAK/2y9BvY
 07iy0ClJC1ZgfkIxCXx9L0if6NVQzO4=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab14f0b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 25j7BYNYtf5LTZvatLHst-Uowz_Q7PfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX9v2lvpU/NH73
 cPy6s3JYSwcIpQAVBX0uItvaM3BPSdHYxSUc5KFnBD4u/0j6cs1aZQv0ofDfIlg3PtoTXI1GI9O
 ciNxivqgkzc3Z1aBk7j4zyHSwQml6GLY+hk1DdScAGOZjKh3lTLkd9ext8wBREPNl9jln6g2pEm
 DDCz39BlfhuOWldkdFDY8xh9+pL394k1jaTq3hzMidb0kD1x3FKHASbpo98kwIcc8WQV2wkFrtn
 z9a+8BpGPsIm3X7msoGadCT3ipwmVZloSHAYjgVgK1OaabTAY2u6kFSr5jQO5mi4o7f5LsEhnzB
 SONk9ERL+zajWWqbX0xFKOzvx5tdtq5UpQTSPCvLNfvuhGuzxygwSOr95gMlZ6CiOwMIPZNIWi0
 UQOAc9BC/hC5i7qcwJlkHZF4JUBwfO4ubJh65aOMC9O546dOG90Up0MsmLhihuRkHHZvqW/J/QG
 FFZjQ2lVFl0ZP06JqLQ==
X-Proofpoint-ORIG-GUID: 25j7BYNYtf5LTZvatLHst-Uowz_Q7PfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

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


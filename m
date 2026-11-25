Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587965;
	b=Ne87wGym39kQd+/mdPFAs6a62hX4OprInLFv3FiMZf3473i8WTbXOYyZSe+ZRMD1PYte
	 Cw0zStceeyy+LQoLT697YpW4wbpVLiHRvHkAQMhK2J7X/9McFuQGHpJ5nNZeZLnHU1AbC
	 20G5UN4QRVN0vYXa7xPTq4m+jN0TMuZql4r0XpSnQMKUdr48pkqOhQvA4mwxWyAjayCeP
	 wof78zjP7ZJRgkn67WnOLj7xC6i08kimutVp6cKm2dbnYzQeaUSJ28PsZoJ3/QKeisyK1
	 +1kXiMKEsuZFC83zaXL17yCYmfvkMkPhuBktW4yEHMbw9Hy5pW8yT4JyQLoJFqGh0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
	b=a83M/Vg6Z45FvPcNzxiNTQwT2inrgA+PqUkQQBX88zRECzCKW5NS0dvEveb9UFCEn/s5
	 XuikidBBuKgrPbVxsVYJHhMItrzuuRFF6gTKEiBq3dWl5JVAlgkz6GGF98UrSaCp/E2kJ
	 34EYHNWHCf+oZNkwi50eJS5F70elE1j4w1oh+QL3A0USJ+6kHW3vzyb6dBA8Lbtz2N+Dz
	 1Xpy8jcwcDUXt8vjVOWDBxdmmt3/IsbsswTZ7Q+LsdJwkOGwkLujI/+q+CCP2PZ9jvbNX
	 OpCbq7hsFBAvNYK1HZ/I661tqHe+Ib5eFZS+OaPjsJf1JI9GkYZhvjA3GcaWYgFJa9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k9k/1y9/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZltZnwe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7724606A337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7724606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9k/1y9/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZltZnwe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68drU3142874
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=; b=k9k/1y9/scGSD5jT
	3WN+RtahfOXWzDXTqjN2A8K6ArnqV2qejClx7c7yThaRV6T3bPacjxj7S4GTxUwk
	/IEedcfwm17JhioUL6GBT2y2BwVFGLpNEQVk+Vl4RP1Q4DNrk3jwBvwRBrhHePEs
	yaUVVhHvLcDV044yf2b+C3UODQIjufitYttABSM6CGW1GoqPCIRxh2GjZXAPkj/9
	H36BJbvzrPioox5jHi7ugTHEZ/wv5MUoS1zNHGt3hgctjhUdvJWwlhcNv6jGEZHS
	KFBH7kMo8yfFpHCwBAwKsHh8Lgs+ZiZ/0sYnTC9EqgWxFDCfOvDj9O/dmtkMDOXB
	zENvjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc298m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:26:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a073778890so4245905b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 22:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587963; x=1796192763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=PZltZnwenFPle/3ZeYb+xLZuSFHVK5rPZHh0wTugriQCllDMg9cRfgoFoNIsay7hec
         flB/KYwSdNt/H8upEQM/PaQresTSOBrK7W+h6h2XDtqerRdxAUYUy2IOsfYJC4S7Kwf7
         onLh2OYxmbmKidw69tVs0KQJM+EpS7gRjIVm0A0ojfd2DU9XeHbkFtwNYEKxk9OyWyQm
         +gijsLRbUQph+RHyRWpMiUERqgMrJgF8ZW4e7B2TnTp0x84yGO3YWrE+FXR//F9W3Rh7
         s2kP0HTy9hW8AtxmcgSFXWQZRcwGB4ktyOYh0BT0IjsDu/uOe8UGevk3ZzyQl4heSeCG
         0BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587963; x=1796192763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=K+LHaiGB+YyegdEevgc2NP9eQw7zBHl2PXBGRPUpbbJrqyxg+PD0qpKI5iGeEINC11
         sNnq3TANW6xG9CQ+xFUsXilxnwUe/R8C8KX5KEFhC/egcGoyVbUZdhguGRN1yaiFk1C9
         g6XwtnuiGjWmmlt40krocMol3/MWsUZLfY+fDCfDSMTZwJq1DbR0Qf2ncWvY8zDEDRg7
         AnrwrqPVC5eKiEuYef3AZZP80soTq1yvWXs7J/MHxczgiL320Z+MmjNW17p+ID2r2YEd
         PlB0tYHhwDK+ZFfSB3cpR9H0tNwjsKuFd5dnP5rrao2lLlalnAfVvE1Fl00tGI7KlUlR
         ksrg==
X-Forwarded-Encrypted: i=1; AL+hErHtjPzFF4DrbLbp3hd+adE1YZYp/NKPr9LRJEMEnav2S1YDIu3m/QroVzdalFTEEIAOW6OmL7aGzKQ1klcp@vger.kernel.org
X-Gm-Message-State: APuU4Z+QhCGf/hrXVq3yovqb1EHzatydkKNuFhKCASAvkjSd3PnyLqjt
	oSjiReYGyf4TUceu/N8xcYZbvxhDwJBeqcjsTiNB9HEY1+YOWwlBpg/wbQqPW+Idnqwg7vyjO++
	R+SsjzzY6zk4QwU9uoPO8dLX6wonw+OkvpCUdjcqjb325Vh92MEhJ7zjCZYfFKYyQ+b0q
X-Gm-Gg: AZFdTZeU7DFQHXBJY1t2BMnJqbSbyLqDnFpvw2BGMtyCcm/9YrIVRYJMQPrHVeZhF0p
	9+r3tbqqgdBeho7IOOHqmv/gIqDpTxMYl8dJEdIIs2aRj5q4qRusi8PwWeYhy533tS7hXhA88NU
	aAJvkk6R+TOKHCFWgVokLryMV1gmOOmTA0kEhfh5mv1iclMxFuBOB4HWlXCm70rLcQupbxr38c5
	F/wa/s0JhbuW2ANyoeVb8j8BVi8CIj6YZ+iaX5eSVuEcuhtyn1KnxcmlfAe7C8Sspy85eg7WDb+
	VtT6VUo4CBhyxaVwE+JFzXpQyx9v04qdBfOMBO72F0BqFP0TLu2Hr+JgPCvxfi+fZ0jqGKASk8r
	LQ7A4DfbqucoNcH0QZi4CyK0SRjY1LztHI+LnuLSpR/sRgshV3cl9Djx3lFSthAN7OEhaAwPxEn
	ErTdfM
X-Received: by 2002:a05:6a20:244f:b0:3e0:c102:33d8 with SMTP id adf61e73a8af0-4014c253b58mr17766990637.56.1795587962732;
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
X-Received: by 2002:a05:6a20:244f:b0:3e0:c102:33d8 with SMTP id adf61e73a8af0-4014c253b58mr17766970637.56.1795587962325;
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:42 +0530
Subject: [PATCH v5 2/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261125-hawi-maili-camss-v5-2-1483b7f68dce@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=1527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VrCho42XU53GTqUrn16AUx0FovtMl7rE/ickbc+QQAU=;
 b=z0AQLIDcrEmb0ZyhtN/DXrU7OlKamWSznS3tZAfWhcgeGbzMYpkrP6UHnd1TOfgA7nIQd6dgp
 +tkoDTZa8nBDptYhxqQy+JOmHu0E16q0Wl05A/mRlpvZIx4w2iBj/+J
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b067f7b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iIG0a9kXuraf5FmvvwfRpuZF7LcBZDx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX4Mkos+AYe6+8
 JLmRfEikaPwL8sivhV04nMN5pqsh+axdBNKeKjhwXPAq+KpaDhbiyF209lFdiewGZbt+DAqVrch
 HyPe9N13V7uw06bW22NLAX5JeZv5C/wbAdzBdfPkruFXSCWZgn+P3Xx8AqozhaJvGiA5AOkkFC2
 o4u49AP4qU1fJj4mtAjxz91Hnuzh9Q61+6AW82X/5NYq8miiDC3EPoK8OpnpXA7BxzxPWmivMwY
 +R3RY61t2AaysUKokh0L1JPr4MWR9PjgurRola7i6DcmqZhs9Ey92B/V6GolfSsYsRN/2Fgj6NY
 v7F6+ufQUBSEiuxqEiR5RZ3osEvfwyaKMgDUVdEwdxQvhs0Zg8fWrdhBDvvIuTCzVZcMM4CTrQd
 xqi6GNihFhnYWNGx4tk3iDKnnFwK/FoU43JBZZlGj2w26tFQSMIpM15g0Hrms7auglHeqss0cSe
 mNGoIi/eCuf/iTosjxQ==
X-Proofpoint-ORIG-GUID: iIG0a9kXuraf5FmvvwfRpuZF7LcBZDx8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX66vjLTIId8ly
 hwCgZIHYa6dCi3TfW738TRKCX6KaGeAyplXa2zMuAjMnVFx1rSMpUdCZ3l4KLNdvH4u1SonGWnA
 ybmtI85BSmgxc827Bxq+REiqmu/Hv3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250025

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 0dc8b7859447f378282732813aa6886bdb1ea4b5..40e9a1725d57644e480c2d25a5f1c0ee7e1f5dd3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
@@ -25,6 +26,10 @@ properties:
               - qcom,glymur-csi2-phy
               - qcom,sm8450-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1


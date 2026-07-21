Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511D46C4D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649093; cv=none; b=uMF8ZO/YZnEbeI6rZEmKkuZjpdao0ZbVD7yzas6fTFRcRh0SJbOZaAitgOErzAtZBme+mEkpt9PfH3e7mKoS02Qc+3+hjmE+fuL//y2cl0WbLK7zUX0bZSZBiC9llu8/wjXaNusF93yYIUZ5a3YD+soUb2pCh9dT0sb9UkgMJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649093; c=relaxed/simple;
	bh=NBwC4NpfPry/8UlEyrp01sZtR0mecP3JsuRaB0z99ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoF0ytTWbARPMpByQlvTpn74Lg3CuY7lXhZthiq++QeHCn+AjJK+RB/btKzv6TQeSTRPGvfkizXV28BPlsegluEEntVLw/D5ujEBiC3R1CUU6O1xU7SLwVpcH6dc5i1+9WxbBvxVJElEuw9ZdrAKeTNgi52AnUGUOyHJGjI807U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwjy+Jaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SH/5LaiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwjy+Jaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SH/5LaiU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg3dj1958685
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=; b=Zwjy+JajO3/H6Gmo
	N+0eAlYcp2xnVQpvYYqAFyPu9fEYIiWnbmwBw0HFuGx7kK33ZS3jIv2no4lbty3q
	VI+cBtHlJG57UUkoJ9oGofc+VdxZYCCxx9JDGR7JbJLSsAKlLzzCFDwt2qFIVkCE
	qhQLOgHvwqb08ocX07+1ykSQxb++SdFrKwWf6ige0Yo9a+INRXlDKuBbEJFEuudI
	LhbDa2eAfXiDb8xRh70/1diqf/tnQ/g/cQaODHkSbEaTFQfJzdINsfS9x8yKgzn4
	HaTeiwuLgYONZ7Dn8lJOx7WJuAYjLHzZIDFA4n8NpSb/OXDPrYzN6tCnhF0OCj9H
	zr0bFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvub9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:51:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8db414c7so197561591cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649090; x=1785253890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=;
        b=SH/5LaiUrJzQ9/e8JYuvP+JaIAdvNnZ/5GcNuiUWNJyJ0c7qrIvVP723wzP7uqph7r
         lxMlaQPbh44zEtQTEvM6YwEGTUdPSUXdOgGo7p/mayLn1Ah/LbhTSylZb6N8n7kHWBoW
         iLulGaE8v73OH2Cf+f9zl4bcLG1YndvI/GhyQB2LISkQXaN5Biv2Dx/z2VLBiOvZHRLZ
         bAQDyd477uAHSQheECdGHh9jmZXByE1dfu/u5ptI4xvotpnEwUx8mHTNOLF8mx4p0tEB
         Rk6S8xvFmun8VWiVG6Tqd/RcROFVkzK1oSQZpTJnbr6/ox0BEozQsnYo7CHciOXa6pZw
         Z48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649090; x=1785253890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=;
        b=T62pEO+/vhxKX5B6Pa1iNSClVUx8XijQwL8/UpQmGP/In+LqytmfjCYqoN1JIr6rXg
         iOIRzfkLlJBh60D4HdLxnOqKkocSKO4s9RhEXZsZs4RhdaL4h4QDcxXbqyrLzzqVhC4X
         DtfajBqJ0yM5FqDF4jBKuHcXih4zafV+rD4mSWpmVViII6zMWPlFcy+0B1B8YoSBzawa
         6dFRMjScUtOBzh3TqYMO1mszh4ousNAAFS8ZARTNou6Qlzt5Raa/HP4qdNvstbnte20a
         lcSPSpWNGc0rWxzXpheL9ayq01Cfk4Ccj9Btc+0REOJwL7uxmXRWc7Sr0jPHOSX7UTgc
         zlNw==
X-Gm-Message-State: AOJu0Yz5232fpPH6pYVHukqWgp/m24YViEmwGyDRkNcLg7CP1idv5CXB
	ehu6o2w/llQwUlDIN28BfbC7z6BreXu815RPG8e+7FJXlqaTcZELNF0UCY03b4IQGG+px+tMDAS
	WgpklXO0fimFNqKuSbFdRYz3IfcSrWw9Vt32sYZujaxSW/v/ex/eoFXl/uov4gWATmh9zAJhgdt
	xv
X-Gm-Gg: AfdE7cl5fAIJIeWHxEE6ua63n26NwZ9oeNQP9m71NeRCsQBCfMVQ/sn2lno59936S2t
	Q+Eu7L3JDWbVYFCn3oeWlrG2gjjNJ8LmhDhyD6D4gV+MY7Cpk3AyZcIb5EB5EZLaTnzbejP0lvj
	DS7rTZkyhpocb4qPxdAdoDucMvRPy4QyaZhIaGy0O0iRdrFIoa2FD/yZ5CeObAClpibXnLwmhUK
	UxFC8QJkEIpnnLbZunQFTr3HjElyx2T3eTrlyQ6UtPZzObyba6gvCm6Vmb4iZubDR8V+eQAR9Ho
	lFUZlw7XDzbdltym1/CjzSvbGabg+aZfx7Ji0YP33dG++OeBjcMGWX0yqWH38+zlowYdpzYYHDy
	szSmBFUaVQFeuY6DjXD7DeX4m
X-Received: by 2002:a05:622a:3d0:b0:51a:8c9a:8fb4 with SMTP id d75a77b69052e-5213f2788e9mr175126881cf.69.1784649089889;
        Tue, 21 Jul 2026 08:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51a:8c9a:8fb4 with SMTP id d75a77b69052e-5213f2788e9mr175126521cf.69.1784649089405;
        Tue, 21 Jul 2026 08:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:06 +0200
Subject: [PATCH v3 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-4-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NBwC4NpfPry/8UlEyrp01sZtR0mecP3JsuRaB0z99ig=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5V2Ww7mqXPgZwcog1twwPXbLXCkkLie89Esc
 VrC6qDIKCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VdgAKCRDBN2bmhouD
 10zjD/0Q82PyYzvmXW8tnxLR9JwOhhU93BqW0b71MWddgtHRQ31/cmr4YNkq64+OgTTUPxANpYd
 fgldaA8g73H5lUCvlHGN19Cyg8XwZ18kRDfm0cxpTvSf2UIRsnBYDlzzN64bpCYa9dl+h/mDllY
 PQ/soJ0KtwzKuxLx4buMrnj0c90YEjphjgHWaQYWDJMTlegk+dM0AVWl7t2houUZND/qI+mrZdH
 dL0f5rv2Kd8waaLTIGxlVwbF9ltW9Rl49swQEYpOTnqA6Sa0xSyIgU+7MLupl5Y+Krn9BrrnNM8
 7+zg5w4gP9CgccIXe/ve1vrloE2T49bId9bAGlAPPXuj/Tya8Gzhmq/Ovdcp1n9cvWs0dOzP4hc
 7w+HfT5g1PSPKtBFepjRkLk4EjkVk1/0ubJyMdkW19fU+3udc74MrWy2UaCjVQGpEX1XBGS+SKF
 Xeia3D9YK2S/+pTTYlAGCYXPNGG/UkrIKlwd9Iy1kIsibTfuXvpuZU3fcYxWD7DMX9C6V2MOUKf
 4Rr4bd/HrnMwnQ2h6EkEe3XOej7SaTV0D7Se2/UgAK3BV066tnMhWLR2kYNTlGr4vPR566pMvdD
 OZQWVyj9zcwnCdm5VwPAwpfeK0JkGhDMVP2C9U4Csot5k2CN9JAparpj/HGg5T4FoGVvBbphV9w
 SisXSD5I/muDuJQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vewg80_viHmFldPLhIjXmhwrraCzPULW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfXxN61VHpl3t4d
 WSoi32Q6oqoWl1ElBYHSlgVvxRBfWGn6FuPr2NilJWNtu4behgTlA5WwtLXkiC9fkbga+n8+twm
 VcKOpwQceBJHAKMVIf13FhLxKPLWLJE=
X-Proofpoint-GUID: vewg80_viHmFldPLhIjXmhwrraCzPULW
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f9582 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_rAPsDrPz3teXUbocaUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX6B9M5MIIVCXn
 Br1v2gWRhv6HmTFZ24pVQgm673svcg2JClFlbb1QHuhcWNzO962vllENZKicBZKPK+xj99fu324
 +XkTsmkA1pIVCM+Y0cKDbT8kb0wOvkngasn+NgqLKZ0viiyOvNN1qZQRfd01FrjI3ErMIrvKq7+
 +nlOQ/ohkdRiCePGuwvY9XF/Ol4SCio5cT6jNFedwAP/Ajb+po2oYwTVp6YVTSxnLQbbDG2m+O1
 p7ECEGlbJKJgVqpMGopnVjUFvhUo5zBEuyKdAa6PsKoYA4Z5CsInw1AIYLJLkeK/Ox6IKmyr5pM
 fsFZggK02+gTDEf4OAsLObwYxZ8ggklYsr1U9Fn5irh6Xq3nxH2AXsoaYers10smRIuABd5c2Qc
 LcJ9EunSEdRHfnaRhafwqNLaZcwRAxMqwzfl4zYZlSJCyecK6Hz7Wn+czqGTCPaHHjqFxhMZqAK
 m8RVPFEYpCxKwfi5s7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210168

One selects in this schema captures "^qcom,.*sa[0-9]+.*$" compatibles,
because there are SAxxxx Qualcomm SoCs.  Unfortunately there is also
WSA8810 and WSA8855 I2C speakers, so they need listing too.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1b0f2dfb024d..e7160b63d814 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -83,4 +83,8 @@ properties:
             - qcom,ipq806x-usb-phy-ss
             - qcom,ipq806x-usb-phy-hs
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
 additionalProperties: true

-- 
2.53.0


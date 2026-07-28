Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710923CB57E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223571; cv=none; b=SSF0i5bFFFe91jQubdYdYVvnQMXdPBfheW6qgNUMh4BPdAScLF/F/bxs5Y1C+PB//VwdWZ7ryN4QMRfv2JVuP6S6gN5rBZBhwn9wnuDDmtMbicVpmoZIu8Adod6bov9Ko529EtNOvFrJ62GKH9AwIAfiVGWdamobp7oLjyL6WFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223571; c=relaxed/simple;
	bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6SI8YUszSGHQ6vPjAsDtgrv1KtEaiY83/HtGkjYHDHwn+qhkR6wIXVh8+aSRJyLINufTtHB8IaiAEcQ3cn64yqZC2gj/RMBEuLiDNmOW/qsyscB2CANfQdeHVftHBqTy94ypJG4YIK69p7huc3WuUaBn6ca7c1Wvp9h6WemOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFN+0UEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZ2K+nrv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFN+0UEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZ2K+nrv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S40ipO1594057
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=; b=TFN+0UEEgrt/Z8kP
	lQHeGrJGF2Ip7oqjqqksNieZ/ZogFebJTvfLhOeU14kibkggoFOdhzp/KfsZgzp+
	xIcIbvoRc0BYVl9Ii4p4ursTNXem4ZuDjr1ajytYmWr2madpBxVI7DeKVFD6Ekgf
	XC7QdgTwFeCVHcXZ8OzXqEJF5T8NMtiVQIzOzsR6rQzef21xMy0GhAnpepGJA7cc
	2RUBrAKWWs0dYXbJTvPiHoaHnijZS9ORVQXnOOx4lhrrZ6ehVxnZSXunTi8ZlUR/
	3Pqg7cv2lzC9hGG+q5T7dTmt7Bqha5AFnytRw/QDUPb+HUYVQVgch36ejzuZoIUv
	7u+8zw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19gqtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso42631031cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223569; x=1785828369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=ZZ2K+nrvh/c3mqVD8QXF/4yX47qCBNsk4Hrlkas3RrMm+8r6ZI90iJSQOjZL1PJkwu
         IsYMeOSQXC8b9wBAx5lTUSGOH41JhkumVE8VXdtWFios/wY9g0Vdt+jBk2K9NT/NjT8k
         6I8BkofHjo3X9BxzbDdi17H2QiInJAJC5/3l9cvqZjKdh7gZXQ95vLnyrfsWouSqTK+i
         wRyveNPuk1zxXMXX3S9ef+uyf8CqJPtfoIJOxRYk6x4cowtLBMUdPxLL4YiXxcze0Pfo
         Ib/XNcmwlIcCTeUEni4qobHo6yrwbf9gH7TdzMGEAo8+cDzFQ8ALsN/oTzTVqfCUkvZS
         c1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223569; x=1785828369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=ZMJ/oBU9/Yd39F8ZS2Efk8bCg9XL7ITDSEp8gq9nAyYXd++6W+Yp5IUocqJ7o7ok2W
         YEiYIpQVvL2MW81K3qIwFgednoedhHXKmwCdthnhmCtRt+yqRS4eCkgdRcP5Zx6ArVKc
         G8iVzeuUeVkHYK65winYlxb7FfnMV8hj3KUMmXoaak8+CUz8BoqayN7J9Q8Oxe1ySyvA
         FEj1nh+L+8fxybkuDunN1o2/zdAcH3kNin2cbcNageGE733aaPWSp9RQiXXnMq5P+lEG
         ruT0Tr7p7OeoytVqqOsmkY71HQfbZDUOeJyBkVmBq2qX+941tKd9a9IAnvZ93XK0UehI
         63Og==
X-Gm-Message-State: AOJu0YzoaUlGrbknMJtJ02B2TYYcgDtvqS7utx2XeRbi8+rY0RnKrotg
	Ul5MFwxfimiK5bdXNVKIK90kjtskUxyAbbR4QkqV23qWz01DLcC7487AWV9joYutVaKPPp4OdFU
	1ol6JvX2scwrkvysN9ZRv/NwWpoS6qywl/3CWFadjhOTeq4SDBVBWGAEhSydJHwtF7ogp
X-Gm-Gg: AR+sD12u2jkn5Yt9VezlCnCPh5UZ85ospE7lvpbCsgoxee3rWMimstYbrRGnS1EXYtr
	xLSj6ZzqiUb1zSjC9HOwkGOEnwcaTXPKj/6+zrQJallGM4H6+qOR+uRUKzlSzooZ2+ArivddqBb
	cTDHA1HbPsmo2Nb+Boc2Usbv/rbj/DwZ7eTf9xzBdPMwf5nb4HjbIMkKn9CXkQSlEIgeWVp/KY0
	TPClOAJf9mIOxP+OvXhBZ+0yyUCamMhBV4zsPuYnUSzISEHC7flsQBFm8xYSPOj0wTuVppG/iNG
	upiyRfGDvm0EvQzMKGdIbC+UNTJ3iZLpnS63f7JVH7z2JxX+8TbHfshagzDn6Oejlo++n6JRPQN
	7XieVK9p8XJcSY23AhtuaCkj0
X-Received: by 2002:ac8:5f8a:0:b0:527:1f49:85d4 with SMTP id d75a77b69052e-529d7222552mr8887701cf.66.1785223567122;
        Tue, 28 Jul 2026 00:26:07 -0700 (PDT)
X-Received: by 2002:ac8:5f8a:0:b0:527:1f49:85d4 with SMTP id d75a77b69052e-529d7222552mr8887521cf.66.1785223566290;
        Tue, 28 Jul 2026 00:26:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:53 +0200
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-1-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmGWhxGatodSFjJEa0OI+6BH0WmxjcMaEdl6
 8ryAbp7xTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZhgAKCRDBN2bmhouD
 1+uaD/4jnPISWhqgVgkRaiwku7hf1NNNjxksh5jGj0XWeWys8MTCDlLd/y72jLbiJ2WfSiaAWV0
 haL34yOkOz5zuzaXvxhJmF9q8Xwlw+Ny2Upi/6s+Jo0xaZbB8FuY/02H4zGRyaztKkDsneTVjJE
 Kq0JRd7XmLnt/DptKPLhnfwaooO/UJ2kJ/9nIpSRSv30AIaAdjqXegtzLkccOoVKRMK6g44QVb2
 cCRVkWhuJxl9QtLm1tHyqp0e9IlGBZCEZo3/W2clK2PzO9PJBuM+LKx/bMMOExC5c177IlCQqj6
 IpApaen1AcJFFvbtPaJGl3/ir4+4GUL4G2neYUDhPh+9Y/MbZder1NGnNgP92h/z8E1wW95UoGg
 n3iejuqy2ViymtuQyhrIf4dqC0+H3SAScpiG3kcWCe6CNCcpkB7aIhXFvas7W50oqubTFjjHuoE
 zS8YD7Urn0aFL+npIZrOWvjZIXQCadWXfW9sbAtOSzsOjTbH2ZruwokVwQLEQN90Xjn3sQfYzPe
 9j5yjvBX8wOdEMWvxCFVEw757SojVO1/Q/bnfH5+JqxTN8BjgeUStWK1MuWkfqIIVi8HjP6ENOE
 59tloSumHeyTRoqs2fALJ3e2FQiE2hcKW/P24FL1bWAJnL1g/BggCZQ30wy1sUZnRP1dZ+CtyD8
 Q3j+RfQigunO3xA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a685991 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ujLjCFpqU2tUUBGeNqAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX2bINsDXU5Tvt
 r836dt9IC8+GcI+xCtRfLWvMejlYJvJ5ZEQvycXLHpjlDyg8ITD1mUdn5syuggHhkYGxM8S8+AF
 Rp1nMJyrtVS9KENxUTBn5VGwh0Jcka8A4u75kSBnvQ3g+zMSxsXpcxNVWzmpl+6KQX+4LvLIAJK
 hncIQjRMMT9jDlaT4W1B7181LrMASateyDhsrhLe5Csv0uhVOLNB9BqduKv/Tl82VK4Ev1AwBoE
 2de3IbPCU1mbOvhym5JrchKSZVoZU7wSv6NSJNzE/Kz8hWt9nCDW7RxX4Kt49OL2qrP9/exKxT6
 68Oa5FDC0g8oOAo+Wsuuqu5W5uSr3tAqO4OFBxGSmBvFoB4gBFICk4ojoVf0jPJ4OwP4QDzwJhb
 HV3z5NmFOSRoS6ri609Y4MWyuYjFzwTzUABuv1X0ZtMQcdtKE03gIVJRnvuPkIz+iYHniGAyZtG
 jfSyK9GJN/iCOWk9DFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX3XVoU5If3Hgd
 l4Nx4AmvW5uUaakoWElNKLx3/KDm2QHlAo579P1kkFpAC/qkq1raU3cNlbV2XDA1rF+GnUKpqzg
 2Y9KxVSQNuEVb4axCbf04nUpAIyk8RM=
X-Proofpoint-GUID: 8MF3XS58GHiAfaFkTuBTGO-WK5bOY4h5
X-Proofpoint-ORIG-GUID: 8MF3XS58GHiAfaFkTuBTGO-WK5bOY4h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280063

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
Hamoa or Talos in the names, because these are codenames but not used
for SoC IP block naming.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 37fdd5a080b7..1f9e52d9968d 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.53.0


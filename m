Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088648;
	b=yDnTAw3TgZLWTjmhWcICR4kqMNGs1h2XBjndu9hyZ5//43IPM402rFixHK2CTFeTCeEo
	 t5D+DmL8rlU2M2TeB3D6Oxtcq7P8Zvh7WjK4qx1R71WPubAp1Kzrfy8ez+IG9pcLixm3G
	 e8PXJ589yvDAynRYE3lAQhafBK5jR9KuG3V5gu5gVas+yljZdjjGYF+t8O7ln7CFmX289
	 aXzK/W+0VumYKGJ6jmRR47YkNeyPLeFvMjkNC46zeconsS3HoTRb1CpXeIt3ErIrJhgIg
	 DqDzILHELjVUgvD+NSOkP8nrmcHdnxcyTa3tA2Jz6mHjVmWx+XkYZpNncqBE6j81O0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=dWOO9WhzpmWRAX5+zLFPgQ09eoTKlj9J7w9Z0n+VjVj26AKFEdEUgXXeBZH4Uo9tpbuO
	 fES+0z7NjwpfOiHtPYemN0+YRT7DgbgxNeaQOygYl4QPoFfojnffM8biCKWfYEM3U9njX
	 njkIL2ZdCK6+XwSR3YbWhgHCGiHc3AiAtIqvGJGF9FhqEIWAM8vbl86AV3ojYSv1J21ms
	 RbkoRwzzKiRnHJav/dvadFae5gG5svaIv7CkKa9nRxgAh1QuYDlB6tqcSizM3uN9Nenw+
	 MGvqE6aPYDhCW/RbqD3LvO7UsrQv/7Dunx5FyOQUdz7y8QrbdM898vfj7eoY4gBJOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563EA606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563EA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuRKd3211696
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=A5sCYYsQVb1DNqvV
	vFsx50HM1vd3ITwfbBxEsGwBAiOYFsCU2uvrEp+DdC6spOpMDidfYb86QtHKIHWZ
	r2LLl7ZDVocZA+C6rjeMge9YNRiBBeh+RroNOmURJKnU+8r5y/zC635pxImWYM+A
	4VOhM4lRol+B2efgLYj4aHnmS05lpRbjzQZH8AHHd1LkXFqzpO/OrJqv7xf8bJm9
	DkLXXwsDkVo9xlJTdunAlTCYuCt+kN5IgFo66fsH150Wk+xA20Qm50NvfiZLdIk9
	pkhv1U3f/iN+ZTnKtwWgOSbIbC2F63bLvgHpiFD7+lsfDLMrbpeNskow1yyuZv1n
	Wv+KKg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18de0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so2362953b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088646; x=1795693446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=TLL82cif6SOGxaUyXGoZAifpZwsy4mG4vAoldoH5msOjQUSZuoKIhrhtEqwaHhi1gA
         mMDidnPxkbwyF1/TA/vDMCrFxuE0dclTBeZMikNRg9kLYCpPn7K5epOtoI5yo+7pnE0F
         PASIOLF+vcNo61aC8RkQvILyEybQsYwr1myQTukOBIdedKJoxNg0EydcZJyRq80EfI2Y
         YY64vBCLfoaWnHMcJzPbEBw19ZcQ0l036Xf6KcnTTeOssHi1k2NdZSQssGOdgOlVC47o
         lE2TAPjiT9w5msrK8DdvLb3xUA6vUWtC1SpMdUB7C9o3dibY69yT94FdzELw21wXHTdu
         NV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088646; x=1795693446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=vuscclnaI0YKkV2ZUTJ+RYuBbm5SrqNUm035UJ3Y8ZCrTsYZE77QKdsVXRf2f1nJV8
         1U2UiJ62pK5ZSf5I/LHUIO9+WCu82+em8ARBFgDRkba3GMkLwPct3mlLK7thIC4vP3Gl
         LBQYNwo0uw/Q5udv6GNy2BztfQfdLyG70T6neAuCZfQNBTzF5U6FJnJtGfuCLoj6SLrU
         yDbx8t2fQkZFG06lp5HW1SqEcuVfNWlPUH80n6Eh52tNDK5/g3rJ18qT5DW2GwSEP2DZ
         bVXh/Nejf+ngMM7XPzZ6FTnDt7A4TQ9rlu2rv8HfowfcyHzNGQR0h7+Dhb8U+9P9VbId
         Mb5Q==
X-Gm-Message-State: APuU4Z8bSxqz6F2YLG9T1FugI2e2PNPZpItRZa1SWLK73kjfFzaHT33Q
	O/LOJB5o9Xo7YGR4FKbaeu24WruH9MQFkTcYHUR+37X5dioMqQrj8ncUFL1ykC04zzJcRSfFWdQ
	tfAfNlB1XGHvk+1+7bB96ERgPO3wnaK7O8g+LlBHs8COZKGvwVstIcPqvFGA1JNaqFSEk
X-Gm-Gg: AYBFou3jJLHMI2ogrmiu3T2EyPL5uvhf1vUPbp0cE06k/DkotIqSSi6ll4eSnCg1Rux
	bY9MCyfH0RjXOU1P0soeHiPDgIszxX9tz8IAL0jKI6QEyix0rGuwstDvJtxxKy16fHsTczDJ5FS
	FQrs0SLhQ9deV5wxBl4lVd6whVG8u7vxWd04tEV5et9ZlpfIZHsy0nRP8w6moxzxB0Q7zh15FBH
	CaKLlQei2ythUw9eAPZt5Ne0sWlapImPzrY2sS3rC5MlJll0A4AWIDYqoOtPx8wjKs79YGtHMnE
	ko4Z63B0YBTdzUYJU7ixvf+uKHHZkgbYuLHQx0+Ft0cYojXcmJtBOtK0YxLvMSUEPD9ZXrEzTRN
	7cQyw8ptyJKcwxbyC2SwasibT+rdTeyYOOPsUmzLo8lIN/OTkceB8II2oKl0ValBJ
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557846637.50.1795088646027;
        Thu, 19 Nov 2026 03:44:06 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557815637.50.1795088645542;
        Thu, 19 Nov 2026 03:44:05 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:04 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:45 +0530
Subject: [PATCH v6 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261119-shikra-el2-v6-2-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=14GnXtGRy2K/813485mEdODWUgO6btuabwiyjWVGZg68p/AfpYrPmoHzijlBwUBrSg/0LYDRi
 7th0L9r9OEeCkxB2dZyIth8kKfd2HVMOCmNXcpJHGPCZmKVIyhTMmAc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afee107 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: uZzgvhsPorV-6GF-9AjDCKT82KAYbAbY
X-Proofpoint-GUID: uZzgvhsPorV-6GF-9AjDCKT82KAYbAbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX1LYDdU+zr8az
 1bx3gPdTNHZJTF8MXh7c9x04Dc44voQdlKHMVcsucESoZutq1y7va6MOOKu4celZeoBY4cgyJV4
 4awjv4wCjCjTtIQpvX7VakQetmauSKGGRQXFFwTuz1ikaKQ/HXNw0XyiMZJmVaEDzSO7puSl8C6
 BglMCrrWVlCAabQlU/2ze8V7qBvYGzlKaEIEAYW548o9Z2gy/JVqEn/WzwpqzSZgLHR30oDQ6X3
 cU4vMtDbdaiXWEMxhz7mq+j88Zbf6Ne3oP2AjphlihezwIJBW3hGx0fpCRCylVVzhD4tb7dLnmi
 7ysGM01a/xuCCQNmAg8nlb68Bb06AOIM1KNQ7N/CxLcidIa2y8Jpgq38ZVt3U5ZmItiuTLYbrgM
 fEWwjYLfjxmqzuUqhjnjj4Gm3Fx2o4ol6CqvM3bd5vhhAN0wtQhZVYUzrL/X7gca09hCqmCH1me
 NPimOwSwVcljGjaT+Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX1HC+4ADXq/fI
 yBKYeYSl+1E7qDpK726kBvUpdM+OpL1DojOlj6Loi8/LrvHjKOSU3764lpRgFdsyfVNpo44XzBc
 diGV6ls4WBQG0yiG7Ic4+S31TkBq93E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0313D6662
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 19:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169560; cv=none; b=sAsaTcIW+o66YG0eBN+qCzCdF5MvDfKZ0nxGPDX9GTgRrAwlbSX9zERkbp9vdECqGu6ciWsJVlXF2DdmMUPjgpacxz8v1TWg6xOtYlR5UgqP0xXNJ54YorHhwgLRDkaR+jsI5wHNTrGXRBTmUWWNVDvSVxulYU9PyKhi8Z2SIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169560; c=relaxed/simple;
	bh=1qVowGtiVUIEJw0ntnaQLeDXoJ3RIl03cJ/Nr0ZHP3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GEBCM2BBa+rEK38RI5Jftj9qkHCHMqzl5aDmaL4q8fZ1e+AroIbIBH3kqlRV2zcQluN0OncA6/A5YFoxaBVW3DzdHH/a8KFdqzBpDUisDgYtKnSEPiQG54nbB6ZA67PttrYZBTJYJEtibCKZJ5UmpspAGSqr/lWdF+EVw9r6Ydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhQlI2ox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9B4P6fc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhQlI2ox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9B4P6fc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpvs8508000
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 19:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6QgQtl13uPa7woVd4lRX3B
	agmiTN8o+XXUQKV6jz0+Q=; b=fhQlI2oxzHYIr8aM4dryu47r/aJlQyerTZqv+v
	rIBhCFGeNDR3yAlcDDzGFy6nk8AxgUrOzv8fiJ/K9VcOY6A7yOTACXvyoMpm336/
	B4mlwrRiEy4k5hayr5DcGh1xIjRsMmViyvM8S+72isPAzpuy5WpDq1+GigfbSuQK
	3i+nDEpYC0xSsvyWzVGlyd9dW78L+8xYYctM7duzuKTCvob3bAIHJ2zv4qgb9FVX
	f1jFwqt8psRZwYH8rzYFz1SDicGHFFwxrcnoxqP/36gHsvte//J0JVU3VBb2+dFV
	QGEY9xXueDrnX6W6lJSdqJJH2dR9pwnl+vQCtrgc05ZsEzfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d1k9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 19:59:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso139112085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787169557; x=1787774357; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6QgQtl13uPa7woVd4lRX3BagmiTN8o+XXUQKV6jz0+Q=;
        b=Y9B4P6fcGgOxVjdNpwMZ5FYVb6wPGx1mNIzOzuLW9VLuDptxEpuY4LV2zEzenAhG7q
         l0U24FBujlUuTu/SPZyAAIAMthklMftau9JgT9etyjMqWDcdfxE7rgA8LSXAR3BacDjr
         miX4rqvI/CD6SbpaIrS8mNtRt1DplYLoD4OtavqN8NN9yRjxoh57yN6mLkPsU5cUyq9o
         fTrUyuUKbFaOquQuAjmevbJl+3Sh8UKBbP8hHLixXCqves2i82IWNGddKjqpclTNB7HG
         +IyffinJnwLKK0q1tmC1d9E0xJt5Wg/3rYtSuJeV6UCdKpwVvYgyoFHNQWpQajsr8CZL
         8+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787169557; x=1787774357;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6QgQtl13uPa7woVd4lRX3BagmiTN8o+XXUQKV6jz0+Q=;
        b=n/pmWpLNyweolCa+6WufL8ihwChvU+N+iBrRjFQAvOlVE0ll/mRbZ/ACobaupbloTw
         djNDKLiHRqgVCnmMBRHn/TRNYn0e+3PSDo6QK2JZbho1uShVEWTNOA5N1PhtxG9K0kzq
         UGPhg/cESnqm7F8pkZhOHY5Z+zpFtx5QrFBRQz857mREejKsTh0d+n/DqokaW5BP7YfS
         TMwcrBzOEY4sZQUqy0iYma0mnerpWlcsxv/fF8/89qXS6so97F7gKpmzCezJitAO3g3p
         avcDK0LwGmHZ8MGnc0pm6fMSCnLfmPrSFHopFlp1oERWGbj1WLKbyJhQ4kc0mj6K2RAV
         oP2Q==
X-Gm-Message-State: AOJu0YwSkTRTt0EF1eXh+ytcto/dzkStQeW0/f2cgQ24MHLLa5rpXWt4
	97A6CHCSolftZuSMslmYzYDOi51cSgH6Dn8QoDDpY99AXllt3K9FWjDV2c+ZNXz1sXLxwi6Q3nt
	/EZKcfvPUQPxJZDsZOAbd0IFQINqbzPniOBXpP4NnIQc3QPlSujqI5E7GQZFWRAxajwuc
X-Gm-Gg: AR+sD12aUHAwY0aX+Vaa+BfQnhwVr7+xEJvtqpVL7IuFDVhzhCF/yjadYq2hGOcgbZn
	n1Fmb9Z45tNbYe1Verd/3seoYuMLpm2omW5z2d2gG5ajBeJ7QkV7tUcUfuH3WLrP7PGDReLm/pb
	zg3OUmhkVlRSc/fqR+Jlu4gzvVI7k/oHBEEJESk2fV0piyrcMOde4Kg9/MqQPpgy/dLq6ZE+Kkt
	7mzNpaZ1ESQHgyL4ObkJe4bYxTwdLHoOpBQERihgyLGBisqLUj7PvKVWMmD807idQtji7TpdfhK
	AE8mNvE9QW2zxFwf+cACtplUWHYHFlf3juqIvNPkRv8mq8YdiazMgAi5M+d2BE6Ld+jHixBap0t
	zoQ7sOSR7
X-Received: by 2002:a05:620a:bc6:b0:92e:8734:b721 with SMTP id af79cd13be357-9371e2d1285mr702969685a.29.1787169557400;
        Wed, 19 Aug 2026 12:59:17 -0700 (PDT)
X-Received: by 2002:a05:620a:bc6:b0:92e:8734:b721 with SMTP id af79cd13be357-9371e2d1285mr702963285a.29.1787169556825;
        Wed, 19 Aug 2026 12:59:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm93057325e9.8.2026.08.19.12.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:59:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 22:59:02 +0300
Subject: [PATCH] MAINTAINERS: Add Qualcomm Inline Crypto Engine entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-ice-add-maintainer-entry-v1-1-60fd2a7ccae7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAULhmoC/yXMywrCMBBG4Vcps3agCRirryIucvmrIzTVSRSl9
 N2NujiLb3MWKlBBoUO3kOIpRebcYDYdxYvPZ7CkZrK9df1g9nyP88QSwT4lnrzk2oIyctU3O+P
 DbmvdgDFQe9wUo7x+/+Pp7/IIV8T6ndK6fgCOlOuAgQAAAA==
X-Change-ID: 20260819-qcom-ice-add-maintainer-entry-61ab75268efb
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1qVowGtiVUIEJw0ntnaQLeDXoJ3RIl03cJ/Nr0ZHP3A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhgsLK0FFi4XRRvSZp0SwW+xCUDrkxqdzXXnRP
 6P0LjuR4l6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoYLCwAKCRAbX0TJAJUV
 VlVnD/9oognnqiJrWYb7I6XPAVC53GAVmTHYdy0vbBV0qBj+OMibewlj+XYVb6xIm+KhzLVhS+c
 lgJXErds0S6BSjg7d6zSoGf7Gs/kteJA/7hqf1xkl30QieqlP293uoIkahUmClZFgdrYquAKqWD
 5EHUvokBtAaiLOtLxvX8aJ3l4KsPnTX+fMwZZV8gi1f94xDVSAvq5UxAQkNyQETtON9fA/4Toin
 GUT2T7gtE6QY243G72tdeWPgPDcBANczKXp6CD0637KtxuxYJYTXzo/qO2UdyMZ7AXDkmbY96Yh
 1Cr/JEUSb7Bey5YNjf0j8VN1Ttf8/074M/pzyyKg7EbH2EkZ1IIdXKB8SK99QIO69m1JPQKYRhP
 Fhg794oU+xU6MiCzVYldIxePqksrOvXC0Ul3t94ncZiV1aUrXHHQTUTxZ/qhYwl7BMeENcKayKA
 BexZjWy8TgdpFB/uwKUsY97M+BzuVUfkOWhL1RLRkZ7ntx2+xuwEH/M+zhfp/glRXqaX+MbvYSP
 trqlaRjvPlf4o+P1nLp+MyYGF822+uHLG3MJ07Fkp9l9Nn/OGKzgip3baPYzDLhGNUuxlZXJL+g
 eQPOlo08MsnDp1d4OonuPXekXLP9XCimKGZgsppMPGLBNNP4ZlSC1mnBz/jDxoJ1gv+vsoHEYyo
 yotSD7E0e19SFDw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE1NCBTYWx0ZWRfX4bEVlohZKnNP
 qFFEONtcIbRmuGhU9XjlkgXQOSf58bUeCJ7/V53Hwt38TiVrJTbxMiq0EcjEKqGzCnZqYr5eSga
 TL9w9dttq1SQxAgeGOWJOUNhJ67xiV7DIcSm/2QdXAArFMDAzyUbNoVxQ0NmIHcM2CA7mibOg+S
 VGzENgdOWd/OVMZuiwvVk+8W+YPokOjhbAPh1tMOQK+iV7qPaHh5jQUwfPNTnDQ3296ZgmPl5FH
 xvv5XLLkqwFLFHcvrOaxnXduJboCbgRmyQLsQzD3i4mT5ia22SJm3gsVxJpz9FPeBA2WZFnW8c6
 az3Ji5W6zUqaUMFcW1BqRLfQId7L5qqfAvxPltouxrGN3ltpYbOs+fSPOigCvxl3SsQO8irnthQ
 U4Ct4wTpVG4BD4abFN2Ji831N+SBv3+s1jVEqvzs4VPF5uxr/npzTffmzcyne9yD1D0x0Gg3Xku
 JdsnDH/VzHJvgEsQ8WQ==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a860b16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=i02AfFIdIa_0KizJbpYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qNkA4SvI_IAwVy9vk9eIcnnZi9MuKxPx
X-Proofpoint-GUID: qNkA4SvI_IAwVy9vk9eIcnnZi9MuKxPx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE1NCBTYWx0ZWRfX8/JrLY8AscyA
 IyMO4e1q2ZpsZ6VRSWGF/m9yq1fe+OqP+M83+hAzfNVP/KUxqNHSF7EFgmxuJZTDb/J9Mtuu2Up
 cZSm7gu4M93Jdxe7PmnHYSVn5wUmevw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190154

Add an entry for the Qualcomm Inline Crypto Engine driver and
its device tree bindings.

List myself as maintainer to keep an eye on it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e83d0f51b97..6be571dc87b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22474,6 +22474,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
+QUALCOMM INLINE CRYPTO ENGINE DRIVER
+M:	Abel Vesa <abelvesa@kernel.org>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+F:	drivers/soc/qcom/ice.c
+F:	include/soc/qcom/ice.h
+
 QUALCOMM INTERCONNECT BWMON DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260819-qcom-ice-add-maintainer-entry-61ab75268efb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


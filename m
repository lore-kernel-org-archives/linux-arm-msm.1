Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF06C233722
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109432; cv=none; b=FVlTBunSjnpMKeBz5mMIVbnjJFBjpirVcA3hRsx/Fq2iUm3+W+DQxSeDxtDxEcAVllXBmDxK6MSad7yS9xfYElTgEOCz7+9KULWmznkcdPjjAseHfxpvUafTYOn6nXFcYayJ4NPgYTFil/ICg2G6p/bWMxLO6OEtljR7eT9Qy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109432; c=relaxed/simple;
	bh=8l9FICuqx3xAftYZuCNBhQ0tO0pyXUYeoBsSa7D/2xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEwS3j3VjKoIpdwAAaplKesWdaysJeHPBw6IjByMtbTzNOXU0whg3dqUjaZG8ou52+Xkk7gJ5Ulm1j9KFt/4+NW+P0d6rtHwbiLW8lEcYncBxewx+/D1XxaneQD1bZi+zqTdAOCSxO2lZcxAioA4SJhusSyu8jsxrRCnBiX3978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6DJEGwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBzS7VUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6DJEGwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBzS7VUX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kQ463229952
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=; b=O6DJEGwTehAljadQ
	kALDcn9OkSESpJKrLF1P2sgW1oO20gQvhteR9S1hbAnZSlI1vLEM/gqXjPXNbrDy
	eT7tZ4Q9MDPQZ3je+yPsFAZBvv6T1FiS3AXct5Cz3rLy/DbaflFghozMA8oic6Yc
	2PWayjP4ie84CXxjUJpe156hgg3UPrSZHIo6SY9rWCFeZaWvZ4wHhYmGF/RySvzs
	UgKxuy+V5Ibs8el59cUkzAYaj52SxBFSL3XJbNB/JQDThZE22LKV11xa0BQb9cBM
	LHp0Phrw1LB8NX6pphxdrDNWy/9VEmj4WVExu+QAUZ+YkcDCsJMpmHmR5iBsJsoT
	lpfFzg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2afj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso742500a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109418; x=1789714218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=;
        b=eBzS7VUXsyilltvltyh1rEijWPHUYfln+YohogKTncex9aiZxM8E5nlShzjfvtdTKu
         hL7jK0ZpGzt4b+u+3Dzg5RxoZFLmKN44cdIax/8QdNVuLa7pKyaGX5na+CWLeLI4D/tL
         mbr8QrXHhk9MivsuLwjSkuiqeFSvKNIiyXgfaCtgT7XBN9ZmginoE1193F4tOzpXfLyV
         plaeKMBdd3hkQbxf0JLUSRoN78PLIvkI4P6F5+wubyuWheLfRngew5MmZMpY0P53TsAy
         sYghiLsv0SC34BujgT4tmonD8Yz9Rd9JkSRdSo50V7CvDAQIyaWWMgrwwymuxfrT5v+r
         Kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109418; x=1789714218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=;
        b=O3/XCzjoL1xrdYtSuXxKWfOkuxueEqq8zRe6sGpMK0uAqe2UpkNKACxIr51KyKToGs
         gp9LoKpeat9RIa8z5lW//2/uHsFw9D+WUZEEx1JBFLeFI8jyqb16H4mRAkYmnHFcKzNp
         dTuaKLP104ItD8ZRoUAcKz5te9nWlKI9bXpXuTDKB4odQ+aKXEu5aatGpJU5XUn8TqM7
         tH0UeAvE0srnxkRnj/aVpYWYbsBEfkqicEsLBAovBCwq5zXFCqbeC+gX3hm2ZoucSzRq
         KdKbl8i2Dne4Lid0xsdD0OvGk4l70UhbjhJop+Ea+WfnyB7nxYA8TVme61PtfwHsz3Kv
         /3xQ==
X-Gm-Message-State: AFuF++mlMr1EbpYZxgyfMP5A2RAozAnerlGnLanbyfqVubbMRjvdQTpH
	cRL/ssuRkC92FUQv18JXNmPvhSU850MF4px0kP+doNiort4sY45lpWHbEq/7rXIC81WAU9SsEWK
	HdUvN11pgcT9Bu7DWu2lBzjL+Hv0NouejR5FDktErB31FJjmNVO/pXBbW6LgcNGOB/1g5kW85o0
	fj
X-Gm-Gg: AYBFou2RYTPcsighASryaIdE5rS+64ZYLArw72Ixq/xT85nMmfrLxAbql26YAoe/0iE
	XLGk3wL/Z4x7/z9999eber/N0quWBZVzbxXIxDJI5gFtb1ztmMYViek5TzE/OYb0FMpw8KiHx0r
	kT1lJdpediNWuApypZiYEcEQFbvV2Mny1gm7OJv3kW/MyzDv8LdfSMl4RrIETr+WqmRVyzVIcmY
	MLv2nGi/3ns+VpcxmqmNsrawwC1TOuYGHjk6oDDlmJ9zaiM1HNCpwb8lrcNbt4q0KIZBpKvdq2u
	d+rHsyaUOWZPXr9XgIsK5CHiKQ3tyREfdX83Qdsz8n58+lAxWIeIwSeNDdzu+M87rHqi1UiQVYm
	iV5JzLobwiTx5EydBJjBKG5pUwN6Il8hqrys=
X-Received: by 2002:a17:90b:2dc1:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39d9c21b2f4mr4360369a91.17.1789109418110;
        Thu, 10 Sep 2026 23:50:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39d9c21b2f4mr4360337a91.17.1789109417662;
        Thu, 10 Sep 2026 23:50:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:03 +0530
Subject: [PATCH 2/8] arm64: dts: qcom: lemans: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-2-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=958;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8l9FICuqx3xAftYZuCNBhQ0tO0pyXUYeoBsSa7D/2xU=;
 b=X+8s4Ze+TUzWl5vGDj0hfj1xnJRFejwe8GWwH8iWSFJA+kYTDEOHM3RiVyaY5N7izFY0kubQg
 gJET0qvdblJAaaxxZqFwHIhILbKNWBX2XBVBI7xWsqwNMqASu3dWRZK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3a4ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zvkr_hxBZYsxfNca09lrod4hSK9qj95A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX9SgUdrKGXftP
 QvAoL802uBchQg0SLqDU+BG7wTbydrZDl9M3d4sWI51Zj4o25zKqQVu0Fg2F6ilj4WEIO7WdfH2
 CeoFQig2zKfZHdyYfWqGFSOH4NWoNHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX0EFu+W89bgAC
 6fWuMJdxTTJEzZZGjJ+bg3BZ9N5w2qE5JZg251Iv20MGrMJJ5V4abmGyjGcvwZr9HGx9EOOinRG
 VrNzhpSfsCYOAW3iClOB9mZ8pNJq4u6Oprmc8GG4cTbuTDJcdpQVU8/dfwx2kSboSZZkjdURz3L
 4dRlXMQAwazUH6RtiuzZGEmwqK+K7DaBzLLaXYM9H+eiy6UsXtlFfHjO6oID2sH8Gr+Nkq0ciDd
 ptWo/J173N8hR74pDpLYlhPJOWI43mYKI57s1FIWQXPDmqPYwKUuG7f5GqL24h7u6Nq0+f5CGvF
 k0oO156rOirwI7wyyOheGCqSIn6lH2W1fmhUSASfmb1M1wtJ11WU+9qTqV06DCGuwJ7gmi4b41n
 BGUcmoil2cSHgbR/ZKE1Id48JF0zwGZmFKBa0W4gojKiE5hwl2usAoDRCdi7/lDia3SDQdXxiEm
 NHC+qH+6vB0iEMF+YCA==
X-Proofpoint-ORIG-GUID: zvkr_hxBZYsxfNca09lrod4hSK9qj95A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..615a9bfda237 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2770,6 +2770,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2943,6 +2945,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1


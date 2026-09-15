Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2683E4AE8DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473840; cv=none; b=ZAnzSuh/4imRqtzXCik+LWraNl2bJbekqCQUe8HY4iAr+bzerVho8GnSXy1yLnJ/xkMG5hAfaRfyZkUAR+bIGXGamKkE5ZXj8hsLFtWSYSSzVJf7uFYKTPCU6QhQ5okGVcl20WiyJqmNTa92Ye3hQ30kQLZDJqnyatvOjZTXdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473840; c=relaxed/simple;
	bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iq/EKVsCb7ndvhNeQQSwhwgfwxLqQgrIJ1ofGlybczXgdcK3lwVSKcILlsgptNWggYawJzcOiHm6bW053fHWp6SR9GMcj6Qb6Cuxp91QdbvG+lvQB2S9M59NQ/sbeMe2J4glQaf0JRbuweT2BBdhe9ltxSCM4qfXo1Ryjqt0f8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8wIdKx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKVziCM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8wIdKx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKVziCM4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJ5v2674910
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=; b=i8wIdKx024r5m2Wn
	uvBiW96saVARSKX4g/+7mDXSq6t3YAap4DInCduHNF1+SollU/O2eSyKFddmHuF1
	Y4HQsWHYTcglYuCs2d9WdXPgUmKMx+3prub7NJVzjL4GqhiTLXT9s9k5/+xenyBR
	uQDjZauI5vd+XDgeFBumbZwl2BqsN6+WoThCc4yymyDUBaBHwYRYStSWEu9Wmjk9
	JxSCRYOdOrfOAIFrcWjf0FRJVv+iFSYPk5F4YFf/2ihDhpuUu56MdpLgb48La3aA
	nq0voiGbqkFiOI2azwrMO6R+AjoJBeRMDACRdAR9TUGZxf40UKT1PMOaTPvXe4Bf
	ZSSjfA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71q7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:03:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c851df59edso1665096e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473835; x=1790078635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=PKVziCM4GA1D2J1+qBtKiZvL/92ghWoi/P6SSfsnIYpTnuGHl/S4Vt+EyJgw3FGC8O
         aCJZPpQVqCYx5vvPsCiTk2FiGKcaZRp4ChyiTGQKwwRmJYgWswoBYTeY4PFDStPqsfUq
         J4ThwU3YFzY1uFM29FX3SRYCGqmHrXeHfHG6qChvi5IxowCHN6MsgxMPnBoMzB1EVbJZ
         BISapUf/EbIbX1HzggjblctTZ5dIpJjqynVd1XsK1qsIS+CR71UYNxsgMvOUpRzHrwx1
         mBuY7+wkF6QaLJo49G5JnCS9j7DabySS8H2W7CehC54qw7TH+7plw4itnk8/VOdzQ3Pe
         8FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473835; x=1790078635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=oslKNj0Rtrm0+oHLxvdig4azgrGS/ddN/68YtVcvhqPCrPn7QjnaFSrJ7ogILQQDUq
         n6HUkDM+R0D5UuujsQbZmLz5nQN/CMgUPMLNqhdm7gqpV2N/wEA2HoymqxgaG92+39Hv
         iBWj7mB+WseVlQD5OGnhgEc8amnl1ZrcP7TlGGtvs2MAsXMP/qy3hMpo5TtSgTbfGOLB
         Ks3oannPKowOcb5M58gKFsEQFwxQ+tkTuNZT1+ZAjC0sT7V9bRKcyppYM6ycZfH7aBth
         gYpoJWsyKS1TI7/Dv7ftaTj9Iv583XLJcZnBwSDErsA8lF/7us4G+KQgB2wyG3fJVK10
         qtmA==
X-Gm-Message-State: AFuF++l5rizHSkm90JODclQ55wNlU2TZErbsdFBVoXWXUg09KMgV/9z6
	yUnJ2qNmMMKNkWeqLQ3G73Gs8dkaURpNBT/nmyVUzI26WhNmJOdlxRLFfeorlL3FdL0XWrRiUap
	l9sGjkyAgQCqXWDKYLeGu3utiljykygk7rztb5F+37HcOk+4T4Cj2LhBN1uSamY5L7k4uG8H9vN
	vO
X-Gm-Gg: AYBFou0EL8F/u4z7ccWqeltbbOxwtrUvd5OIL5ne9fph3CIUpttt0Bhskx0WLbrMINQ
	SaJryMSkvZcw2CE2BUhXjR/B5cgb5oQNmU4xZKiVsazcPdY/qveNtKJ0AuEZXNG0WBbG40n2KY8
	+7jPIz8lVLwWkBdbN5a/YS7SGfTQQw5h8rZQ9XN4UOa2j57T+eabmho9BarZOJhf/RRh63cxvlP
	kC6CKVPLQOpbwfM4k40cdVhWgBej1Lpmokvif6cLXtsrckXtIyS/USwpJgA7pX6+JsHAaCK8g7x
	XoKKD4HeoA0u4a5DHBLbP6t6umRPxwFelzrWWSLDW4JnPGxBKsZyWCBNbqs/tmmMSLVVdi1g6bU
	tzjr03ew=
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr7358772e0c.1.1789473835051;
        Tue, 15 Sep 2026 05:03:55 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr7358692e0c.1.1789473834386;
        Tue, 15 Sep 2026 05:03:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:31 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-5-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQavw5BnbRRkVDRDBWWffgVxkj9DVNJ/4gMo
 9K24DEnsGmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0GgAKCRAbX0TJAJUV
 Vg/vD/sHOywkVgPXUZSBOOsBBf7u0tIsNNiowAgV/MFFGAIRtSMCNkFn+AoGmKxcwrlA/qQ2xE4
 hwu8Ezb7h1dNzyUV1fhbTLWJlJdXaTd4sTAjKc/XMsiMrvmO1yVU88RKapBk9hRm6R62ZgcV0WN
 In8ZeXdBbyUOwxqXUNbgKecH84Bh2Exo9knge/sF9m6M36nBl9CKB2CPg0kG3HuD29g/R6ic0/P
 GnzRcvBrYPasFgsYD6WlQHZbWyPh9/w2ynMmhjV6g5Bc/cJv61XTNu0vqdCWCtiHxCV5g494tQq
 CGTULKG3+SMgRJ71YLpx5JzuJc6LAlv02UsSm7xbVzP++xLBJhFdxVmtW5+j/m2GCjM0UgKAV6M
 2SF9HlfNRSIDyCEjwKl1Iqif4lVbm0dBbUzLUu/SxAbyJe0WL6mblAUFVv1wJI3qahP9Bf6kMpj
 sFS9wRegFNRK+rWEDsszvSnognonOBZdhVJukxcFOl/azMqQkQsA2GDhjV42LKFgUAGdxW0cMiJ
 yLf9IRRre7jYwv52A8BktZzCsG1UxHzcDbkctX6NCkHPAW11MPngQ6ZrxlUAWDW9stBSSE80ql3
 KorViy3XlCebW2SM8maTaqiIg3oMs2GwQDkMxfgbQAvwqXpIh+sjcJNqIAv//L4HfSgExjCXm2j
 bfsbK4IxmneitJQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfXztoB2jMpVNgg
 7awtElNfQOEQvRedc/ZEvDKueBVf76r6pUji4LFmZWY4WOtOhVJGdv1Ghat14bSJxUsV07FoZyi
 TTcSP6ek7wmaWrnVMa5EqRdganQIZycIdq8kl9Xt/nR4i+9c9NVrROMm43RtFHw8PCjXqYXCJUh
 e3Dbqp+z07ZQL410afxsqke4CQuLIY1IrC0sDJZSTjaV9kSqWolPkcb+NJ1cUwUZ78L6yng6rM4
 ZBtiStMCuRW+14j8q7HC6B9o4iXjRk31t7ewqCNhTz5EAzX5SDiN7hpsPEfq5AYoZ22Po3WbyeJ
 p4DD0lgfpqvrbwaRp5ScRDZ0yy8klbVtqm/vTxr9O/FtKx3G2eWMuqI4GzE3trVY1X1uP3rXj+T
 d5DEUA2Kd8YBB3rRQpbayb2VqD4D7uOHaBxwQuEwN10WHJHUHQSkZdIadSbfhx82+4/lKnPf2Pd
 n+tayIlUNV7XzRK2pGg==
X-Proofpoint-GUID: CQSce73mvF-O0xcLL-9Ox0e8nI_xXq1d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfXxEgVZDFkZ8/1
 oUERX4G1zt2O5hHEpUA8akGR58lCQUkSDVx1pr+MuoQYGWaVQpCRCfDd4CuNEeeT7YbdXsUpCFS
 9OpbkMDfAGyhNAA9lHDJhxUb50dWnMk=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa9342b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XdqwL9Qi1ApNGgobcvAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: CQSce73mvF-O0xcLL-9Ox0e8nI_xXq1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

Add new board dts for the Eliza CQS EVK that uses the UFS SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ccaca98ad4c8..f44d7ec94216 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..f5bdb2526429
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0


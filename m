Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7246283FCE
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812645; cv=none; b=RO7C5wCfJEXuKUai3JpjToxwPkCFr8D9WTap5Xol1/6srPw6OpjVbzhPZhy4CmwjJ1+66l53NFW1c78NZFnA50x8aHndPhG+HdQ7QfN403Ooa6AaQR11wlcrrZpJfjAh7R87iHssp4b60UOwdQoy7u9lRaa/p9biI0YAZeekQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812645; c=relaxed/simple;
	bh=jAZUog391waib5poEaz5VaRKy/HfMl4AFD+Z9YWtswA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kn9/YTyApzrFWDij2bvfSzJ84B2h0axvtCibuX5bI5jNw5hjb8PfyaEHm4KlaJLyxd9GBzT5ndcJ4RakdPuuv12gn6StjCbqQLVxSxPDGsFtunXA1SLJUejWuddgv+a4hGFQLvmGucYOwaCfJN371KSlO+XekGHfRwCtlAaV9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yjo8of4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsPAhY0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yjo8of4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsPAhY0W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H88NE4183556
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 20:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=; b=Yjo8of4eO3dgkOiY
	3Rn9v30BZ66pdFQUKXMgX8BAub6xKgb/nufZWLzUux7OPOQLCLCC/TC6/AGgKfOz
	4reUvEh/QQE9hU+83G6rTyOi31ty/YJUCdOLeOMRalgulqn809B7eCwy+E0Fe+wB
	/dXpmAtjUhu8yN1jzsIznLFwpUeD7s4/sCgAD3auxPNjr/7Y43/+Qv2Nzf/eNLHl
	7YzYHI/YJJlesEAnUutY54DoMf+rGAqpj+c4BFpKDlDdU1tQagWQZAbTl9E4EGMi
	YgLKX85rPgpXT+dixMPAwL4qyPCc6uj6rgM4jt2lYRbugqda+9tTKyXkQ+6UMbvC
	+JrMVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx28ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 20:24:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so3160306a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812642; x=1789417442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=dsPAhY0WdCwH7TYaqE1xKKlH3xPpSqTiheVEpaauVU/vHhWICALYLAYkfo5C3aBpSz
         uuD0Y0Y9XxcFiaHBmr7sCkkZqSkO+HC/YzlF8cfy1mNoxkV0ys6aIhR6TDPU4ZHNxziv
         9Ufu7fIYkHowAiJkhMHOQFUpPnfeIXfdQwWu0ckh3P4q07Se4csSZ7q13o2x51UUuhgH
         IYzMOK3YyNo4jdVIzZ7S49DDjPOHxpkjQr622hphmm6lY55zIe5qYgJxGNAszJM2RyHg
         1rHyj/L5ZJHhN3XuvdUk9h7So33RcPh8dIR9+GWLf4IWhQCem9V/ShuGWfldCClV0gG6
         iNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812642; x=1789417442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=XOL9IokE2oAkXT+1FP4tYvRgLzKSD2iZQi/ZToUvXds0Kh6lxdS9Kk9RrVSI2WoEF7
         62QjnBqZ28vfIDZ7ugQuXrT13eFltTEjE8aPV3aJsa0cp0r1g5AXe4i9BS8ihPRPAkxH
         fek5tK6ulC9EHzdOKYnbPUvIV639R82H6kvDMQv70dA8uGp5eAAzJgM0CAhM4kpFlC3f
         AZaz7L9HmFYhSKW4SXp2deVK1QuashHJt/CnqUueVGnJoJsDgxPvsw7gwXlxvpWyTEbC
         clLi4P4BLiAGEVn7jc1+B9UQDEVfo7crQM0BYiaSZsUvdaoZ4ryLdl/nk3vUQ2UorGAv
         pd6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzubRyo3CSDb+zpwkt2RdF6AbASpph7/60syaUDudtCe5kyOkIpvEcqYgQd3ECaQ9rqkI9Sq9uesNve8spN@vger.kernel.org
X-Gm-Message-State: AFuF++nTl2rxwQEwMWQQs2wQaj2Ehqrqa9SDBMjFAu/Mj8V+OsJC7BdL
	PVohBl16XyYdmDZgIeuNc1Z8Ap4UfmbxVvwLcI/CxbOWT3pmHI+a2tmzaUrC274DSGs9niAcCMS
	ldtqWG/rNzHnACuL0mTe1uI7oLLCFb1FkJhme5E/bQJPci8T0ZvhfQldgVSWPEqYGbpST
X-Gm-Gg: AYBFou2IKCKSjELmfk7GmsJ0vYS43/cmIceJ57dJ1rSw1zI5QmbGIZf5E/D+a/HaCI0
	A3hW2U1rtb4Fbz10FHjmYsk4Xwkkfar9kFZ3JNHCgLTgKfpGKCr3qkn0QJBb9cXqXdzCCcpj9oy
	k8IrWz1rMispZp+J1S9LlVq7SnLkZ4Tk8H6pYXML5deQXUt+1MQwV87c7iJkvKqCn6j+ZKw4dSJ
	gE5z0JBA0caaZROUPnRTzZFaMPbNBwZvhdF/Ojh8sZP4Y0HY1VBv6GwwBuSid1PewM31B5hjoFR
	mNVbnWzbbQ/WrPhRH1i+xKFxQDHZqCFGrsWTh6YtSKwsBq9gJp8daNB7GaYDqaOT6r5r6ypXd7W
	CC8JZFdAxmNQK1ND7cq88aIAwecw0cg==
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39912018637.19.1788812642090;
        Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39911964637.19.1788812641662;
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:14 +0530
Subject: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=2136;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=jAZUog391waib5poEaz5VaRKy/HfMl4AFD+Z9YWtswA=;
 b=DHYLaLQ+gXL49XZqtb6eATiMimarC5O+tgQ+agl8xwwu1/xxfwpt8n4/qEUHFiyLy+f77rDwd
 TUNDQALem7ZCzzJx56lUODiCdje998TmLDFIHjtXVqoGFBNUxXf/UFH
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9f1d62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YFdYh8yeDX7w8CFmzsL2GLl5lyeT1bGR
X-Proofpoint-ORIG-GUID: YFdYh8yeDX7w8CFmzsL2GLl5lyeT1bGR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2mkAbHiyEgHV
 PXsTmrOWEVa+XvmRvWum+A6j2GVPkmKSaQx+yfWeDv07HqoQYYpOMX39Z7+AU1WPZePdAAvUMS+
 JWngNBdmnQzpIPN156jMHQFyiR5CaXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX0lwuvPvIvqDA
 6ItDKCSEJOdv+jhWFkbnsiAxhw7WnwFtTO3WhC51kdAAaPckChsgC8sEVGtVLSSTtj15cmEPDXl
 vZa2aXMBbvUz3CuGG8IGcE8HvKBJKmABrWVyb973aBQDHdwJoqR4CDTUqlgxseHSVAe5g3+rlQG
 PHnV31y7PPcLu0lyoHfygEq2g+MGh08CK/OFHhbIMowEKUg5q9HV+yx4mIGsBmt18N4lLSaNWCF
 OUeNmMLh4PBaw4QPobOHvo4RTNqr0oMdLh/dItQP2V8GfHK58CSbR6zDqL0ztUCc7pdH31qJqGy
 DDoAEFZFH0GluJNU9wKoZklKzqNSw8q/OfV0bz7wGovUaxzwj4qcnyBm4sGzQZBu21pbc4zDfGJ
 Zi6EjPUbz9PKMLXOJcl+TtF0UMUwGN3fxXISOI8J4Cpxh1H26WN7pYk5YL/qH098Tu2+1fkLwl0
 yFDA0tsWQ3SEIms+PNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/dp83867.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..dbeee7cad6f0cbfeb127bfd28f43ee2a16c78879 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -15,6 +15,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (count)
+		fsleep(200000);
+#endif
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
+	int ret;
+
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
 
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);

-- 
2.34.1


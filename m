Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE34A4EEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068674; cv=none; b=TVJdYyUutd2AK/TtKcTi/xoPRjeO6oUIMhU7FeE6Vil1QNZyxsRw53gxjJVFs0xe3dNRSgWyQRc1llz9al5ApecjwKszg1+gGNeqv2geyids7CHM6Ar+TDWod6L3VPa5/NRjZ5IoTcjv6yl5bwkvmQxuPmpPnbucFxKk0ZulyYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068674; c=relaxed/simple;
	bh=wJBG6mE/rST4drs02F+VqgHDWCr/2TAtj7XyKJ5Alvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRvjDLN0g8F3DmTy9bpOB4r1Xhj7Asc0hqflCNyx0D86QNUGiJ9iAwfBGFfofi8Rp52RzzWnnqZMZWppfa3v+Gu2FgrF/zM8+2c9ityZzb115xZqOPvYMN83P+9nSUi1K4zu6kZvpYswCfQNf2whEpUe9tgVN+UCOMNgm6H+Boc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+vBvQZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beaj5Hso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+vBvQZO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beaj5Hso"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MaA23382586
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+
	da4RYtgs=; b=F+vBvQZOjAjwqirZon0Hbk9Q6KGoFWC9jR+JGVLfjACO3vsOIMf
	368gsWza79w8HBmkJ9EgpicLePtmgZvJiJjqwlirYGrUU609Ra9gT0iSQLh9UuTi
	EyRPJjg4aP4BZ9bDJZgNS5t3UBwrGzicdGfbve+Gaf0Jv1qw+uDiU9c5d7j7nzMF
	thV3n/GhPgRAzavkSroQB9JuA5RmhVZqz5SGMMabdr/rk2fUlVtkOOxIS2x97Kt5
	RhX0FjnHHERVjeaDgaVkAVHD5ZlVjd9Ff3O/Mxzm6W+OfG+OHZ9CyvnX+VeEw/2i
	HnqLs1fBZSyVx4jWrAC6U2mxaYR4YCtFoRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj949f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:17:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so716874a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068669; x=1790673469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+da4RYtgs=;
        b=beaj5HsoP+h28ciFiPwtOOfoiaE85xslemP+rIJGl1ULkuXggJal9XmpG3FuJpWx5q
         dp3iU9LlzJyzyI8T7WPsouHQL3A9aS6u3qFKvID9MD9QRQa44jVaffJPqmSh6Yn+DjpB
         QoYKYoJSc7SBjMuoYbTkzoqHJKdW8rxsA6sDAMY9gE6j28X05RutvtpNnOMkNY5CScTs
         sJ85bNuNJ0M3iX51NlK6L4oqWX60PF90fnty5dY94uc4DDXLWbLDgU8kU6taGuzAN4tx
         AS5csYjSdW7cojxtVBYFeGObhM6jzUzc7+z1erkUYQLFz1p7bI+lUy8OcsOal65zHMRR
         Bfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068669; x=1790673469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+da4RYtgs=;
        b=GUDbepD2bIBbemGzi68e4w1RN2/e0uL7oUgHzFgI7js0M8UBt1KweEsoog3sXF+vR2
         dJQL6UnjS7dhYHP/mxthvukPg0CyN2/0uuNsnY1GAhBerZmCKWU09q3gYjEMYn0CCcaE
         thyys0Ejn/YktMzLLC/mn2AhK86i2iBF9Midbe6oep4ZHcRrJ+cfDTq5u+l+Ao4nN0fb
         7x9gWd5FtZ+QyZSpsW5DnVC3XeL09RV5P+Ve8+Y6Cnpkfw8n+1XRQEbQEvlxPaR1KgPJ
         yHGMxzHdfqKx02EILWF26nFV1ud6ifFNWshdmXg0GxA8+zriCWJSCJ3CD63hq4K8Uivb
         3T5A==
X-Forwarded-Encrypted: i=1; AKwUvBxbdO3+eLqMnNOQGEqkQtBlEOkRv6NolOY/vkrPNBFEn2ftODiPkNncj/qS8MGQD7XX2Z7aPSaDiOnYpM7R@vger.kernel.org
X-Gm-Message-State: AFuF++ldMmEdk4xC/3LijY7IsB6mlEFpHd28nMustggHPr52IdX+2Hz8
	sgv5j58CdZrG7VQocEsbjkq/kUrnzdE8WtpQ+fh9DT1P1lBqeQ3Vz8A3BsnC/zl3pmG3j8MDUzc
	aj0QhfXj/nmmLP3oo0wdcZOw0K7n7ydkPtpOobkTAsqj8zxO9DYYKEhm3I0TaeNfirYmjCoBDWz
	/v6ag=
X-Gm-Gg: AYBFou0muprZMEsWlKk1BDLRYHHrcUYeYv4KpkbDecoioQqNGiKIFUF1OvPCrSt1YdM
	p698YnFKQr3T6H7jwla95OH/GPkmgnnmBG4itN+3h/ee4n0RirjQe/02sQ2e1bLboSi7xRZH02n
	rKl/Ef7COnaR1vdJt9NQ9T210TYYfPfiL3UtYXDiDy9ro2UajPSwi+FgJwMayF2+ph2bbFnynVc
	WwrK8t11+PxrmYfNCUXOy15+haHnV3cIgTV32WIaFtBrW8M8Uc8jhOLibmCFLC/yztNt8z9p/Uo
	E5RCkeW2Z1nMhY6vVXm8jjwDkBE6QC4Rku2MvWoZYzw+H3ESFoAu/YCKyP2ceZG8ZHt9xyVgC7N
	uwuZtD2iY58+rgX/Ub4kBqF6nfiDHWZMd0rjFmE4IzsxmfFbZoRZ0TT/DvDE=
X-Received: by 2002:a17:90b:3c8d:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-3a07320a6d2mr494442a91.43.1790068669287;
        Tue, 22 Sep 2026 02:17:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-3a07320a6d2mr494413a91.43.1790068668832;
        Tue, 22 Sep 2026 02:17:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm4595857eec.3.2026.09.22.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:17:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Date: Tue, 22 Sep 2026 17:17:35 +0800
Message-ID: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -L4d6XQnorMrtkhhf5ASOkD4rNJI1FXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX7IZ0bWbCxN2M
 N1FrDx3s657B+q9nwPyAQh2ZsJxPblCdVFo4KOcIcgZMsoc6OtAOcxTWhBybLCCaEvWq0ntTM2M
 HAqp6pmxVeDNjSyZFXI4KOAnfR0QN9KQovdZ4wG2C6ZO/AGRaFfk23Glc66314zQ5R5zMflW4ho
 1QrNF8hsjl9g8BCGWcXW/gaZS8QebcWQm22CvVwWHrfz2CGp85zlp7mWTJVo1MWUE496s4ooL5K
 0gIhBjy3UssalmMdIORfRkzW/sqCN3eoq4JuYqwwLr5cpHiCxD6Qb5RatMcTSUKFGh05uQu4fJX
 GsEQocUBe4hGv1JEEFBEE6d77i00gJLVSN/q/hphTZXGl4LOGsCGjFp6A+QS6EbhAO4T1VpQ3xU
 NEiW2A0zkV/Knyf0hh4HA0N0VTHAUYbW8x6CbldBwoX4QIVyaFEL046B9TLQYClNcs1RZk6JtDU
 K+mVtg2WWZh5Rovzg9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX1CYqO3LhyZ/f
 2CSyY6CYLTUkewc9JtYj5ITYkuLgKN3a74mHWbcZhvzn7+SFdOA41ydtwQIDkQOBchQKvEp0ABk
 QPnq0DzD2HNiE4H/iPeFperkTX0ZIPw=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab247be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=liGA7vQCV0veY2hd_ucA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -L4d6XQnorMrtkhhf5ASOkD4rNJI1FXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the system cache controller. All sixteen banks are listed, four per
DDR slice at 0x100000 strides from slice + 0x800000, followed by the
global broadcast OR/AND regions, which the driver expects at the reg
indices right after the last bank.

No ECC interrupt is described, as the Nord interrupt map does not expose
one for the LLCC. The driver treats it as optional.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- LLCC driver: https://lore.kernel.org/all/20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..6896bda14ef3 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2071,6 +2071,46 @@ watchdog@17826000 {
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
 		};
+
+		llcc: system-cache-controller@21800000 {
+			compatible = "qcom,nord-llcc";
+			reg = <0x0 0x21800000 0x0 0x100000>,
+			      <0x0 0x21a00000 0x0 0x100000>,
+			      <0x0 0x21c00000 0x0 0x100000>,
+			      <0x0 0x21e00000 0x0 0x100000>,
+			      <0x0 0x22800000 0x0 0x100000>,
+			      <0x0 0x22a00000 0x0 0x100000>,
+			      <0x0 0x22c00000 0x0 0x100000>,
+			      <0x0 0x22e00000 0x0 0x100000>,
+			      <0x0 0x23800000 0x0 0x100000>,
+			      <0x0 0x23a00000 0x0 0x100000>,
+			      <0x0 0x23c00000 0x0 0x100000>,
+			      <0x0 0x23e00000 0x0 0x100000>,
+			      <0x0 0x24800000 0x0 0x100000>,
+			      <0x0 0x24a00000 0x0 0x100000>,
+			      <0x0 0x24c00000 0x0 0x100000>,
+			      <0x0 0x24e00000 0x0 0x100000>,
+			      <0x0 0x20400000 0x0 0x100000>,
+			      <0x0 0x20600000 0x0 0x100000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc4_base",
+				    "llcc5_base",
+				    "llcc6_base",
+				    "llcc7_base",
+				    "llcc8_base",
+				    "llcc9_base",
+				    "llcc10_base",
+				    "llcc11_base",
+				    "llcc12_base",
+				    "llcc13_base",
+				    "llcc14_base",
+				    "llcc15_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+		};
 	};
 
 	arch_timer: timer {
-- 
2.43.0


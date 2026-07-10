Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1A3B27C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665594; cv=none; b=jYrw5pljJy9t91FiVKjwTU97qr0d0f790IENn+sKpdOVKBP/IL3Mfvequ0LCAD8UfFX8Njy4EH6ZL4kXCfTnyHN8HcNDQro4XN0VZpfYTFM+yblLqbYfc2bTqVQyBcwg/4B1MgFFqdYIHlbTe7pB0Ea9OtqbkH1FFFfbXYMJPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665594; c=relaxed/simple;
	bh=TNDjHf72eISjAnYEKoRmCJwrMZELxE7thLNgJ+GKkIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvoE+b7b1Zh+PdYIMplHeQJ3sWskIJN9wxUrncbqP3asvKi/lInJsxdqbRB6lisdmAii6a5Yr5V3tDxAuZDLFMtfYqyHp/WYqtBqaGCw7frBeZtxo9mObdLzkFwoGgIVx7UZAaqSTrOj+Cr9DK6P9dyCwvSZnRn7khV/xt/Fbl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZTFp1Iv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeDVzBTb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZTFp1Iv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeDVzBTb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mrfl3721322
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=; b=gZTFp1IvrZzl05vf
	uGsK7rLvuZzj6RpVt2TM27INOrnzsTTB4BWi7X/Do0lDECwdwp/vjDwMD+BnsPea
	exBXG4rU2LHRJa6XYjRXPrkKD0nmql7p2jRGjjvnjXchyvycUIIikCgRpNHcmKbF
	uX4MGscAJ68Kuc6BXWJt/bLV9jXqBxr7gcREeVQYncY8WgoeHmuc6A7mr+SzJHr8
	RAjDCvI0R1+Z+Q9YPNR+XISb19t1zrBq7kJQbGkI0X1aDDKfwiXoaJd9wwRTBLga
	i6/lN6ou8uPvX89G9e1yU07H01vQ7zpNxODBi/wu6fiTCyJB2RJ4cT62nXVqn8yd
	1j8mvA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt9r2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so447174a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665591; x=1784270391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=;
        b=aeDVzBTbSHP74XopMuKBn7g/sA/PNy7w+e4cKAfmzxjCHESvPWmKtYXbXwg1J6LrjF
         qa6TYR8GZegW+M2GhmTcp1gO5oRf1RjPn/h/w8a7JEnoyaf/tY29WPR0D0bPrzTQrwq/
         BbQfMtSZiY8XQ2V/2Cy4kD7ARjYbHhxWhGVbrLTAINbQYpqQ4qIgRiO173zXV7KvGp1T
         oF+Ma+jbRxQk2VsXbEAiwgq1dKk6i3PpYpfjnIn1GmSobHNHOq0rQeTfVL0UCksyabuT
         x51suJUacBqsKDgwuW/B82TEWPEOYnQ8MyX6rK1+yR3AcIJvWhZMcWsNYIz8+2ulJ8DK
         dSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665591; x=1784270391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=;
        b=Byz1kIgF7G6cV1Z+4QARNGU5H9oO2sj77B0wn3KbdaBclnfD9L1L9YsZ5nXDgpP2Bv
         75Bscv7iWUzLwQNYNoErBgFgI7424Pz6GmeuGLDTEjgoLK0YT8CxvNo8igseLQXKw/5M
         f0bILShdMi+sYnWEOj8n3MfIyqIl5ke45rvSEdyhCiljaJFwGIdpvcwK8KU5jo9p8fy/
         qR84aZQztKCaZRpNRHWDDyHm/W0p/+MNrViJkgtzWNB3gPosRr+AVBTff9Om2UC5xLfw
         NFFuMvAosneXFGLzVlJt2Gx8tXqiNV4QB8TvIe136g4wm5FeaMJRz+n3RPVPThtPC2ig
         ZVWA==
X-Gm-Message-State: AOJu0YwVYz9HHBwR8W3DOVPTsCLocxT3SNHY6gUnKh0s3v6rY5wvjq5b
	FCd4kvaUkfNK6LAMNJU4LIO9J+KuznUPR3jCkvLeA3WKoa7/ubosRLRcCfZCdVolrOf5s0L5w5D
	Pys3LcL09uAATt8Ci6pmIGUTsX8DEMl6/gmisDeAPbTclbcp+bMsL3NEZAAGjg/hFo2Hm
X-Gm-Gg: AfdE7cn3F83ako4n1kk4+usN3rGyaHNSyYHYD2+NSVN0/sYX4jLvw35beZCiuSdOcQB
	d47I9jzrqeJYcbaiMoZqydWDsYWyVH52ZunK+jU+MGjvtVnGVniXMo4+zNcaumCS6n1dXSQ20x+
	OlROJHaBoLjPqfwXRamcMWAZ+Mkhg3IuWxUIL5GkQ/9YuidCSl2BEUUHv1v+CPWC3+6xh1HBHqB
	Z1pO8wpAFFdj17zcCcvN95DjOLgyGp9TrF75YVBbTPWDV3Gh2ReIlUyUIKfRqbiaiqErWkkjNff
	vXu+ZEGGE9mGenCztWUf/2cYYLTWPZznBa5QpdCkDyyPVq2MeiDCGIqmnuLbwaoRbDpM1pTPUI+
	+nQcKLCR9+FUicJ6nYMQahu/ldk1L/uD8t0syol7CVVUOmqhriL/l7ksQ+fcb
X-Received: by 2002:a05:6a20:6a24:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c0bd0f9e23mr12570906637.35.1783665590737;
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c0bd0f9e23mr12570855637.35.1783665590233;
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:44 -0700
Subject: [PATCH v6 3/4] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=1207;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=TNDjHf72eISjAnYEKoRmCJwrMZELxE7thLNgJ+GKkIM=;
 b=nTYSLoBrORkvTjxlyrSovaqsBDKV9aKIq6/mUJ6OImquQW/C7l2zIAW0N2igzBG035v3RGL2P
 b/Fx8Gkw9TrAbZCfi/CofNtexbsF2r6olmX72R6XWWTr4EFoti9SwDE
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a5093b7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cmxGNSBqaG227vPgA-oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: F7HC8g0HiCZd4lWBPJezp1JC7mlgaYWX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX4AgkfvoieOe5
 zr4r1LbR2NM9+SQIWFrfdb+v4gTRqW/JJEkDbznTgO1nPULqhn83Gjc38ot8/QiQw/fJShwie3A
 XlxNSzXAp+4dr889xuWbxmBHNoTfUVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX48xULlaUU9iz
 OzI+WxQZCWXYc5QjNFDubdVFJ919rJvY4M2xgb/E+MzFs0sBqeZy8NjuBDFpJNqsey6+iEM++zZ
 6UbfYnx8SaMkkzcS5rEW88/F9ddot2VDuAC9+iiHAuSol1nYruypSMdKg63wGKub6SKsmQGidNg
 G8J00FQhBQfwaOtN8XuxYgl+jDV56j++HyeB787/jQAUEg9CHibQ6gB81GzqCFpotfyExodvHgM
 YV0w2zve9g43ahNcvnXUYwHq5Ee2l8c1kENjcF7S2sFTugB+ao26+nrrqxvIcx1dmZdd9MRwxrl
 LOBuADMrWZutiK1dT0bJe+UQgE2P3J0bspBJXWNLePiMcn03KmscP9ph1nUGxwjo8D9DfmhJC01
 TuknA/3hQabRBKx8BptNW+4TUZbaR4ca9tx62D5N703gK/NEdZ4qyD0QFGGFcCWVvJ4x6mcz7B0
 74Lpel9MSQYzW7Y70PQ==
X-Proofpoint-ORIG-GUID: F7HC8g0HiCZd4lWBPJezp1JC7mlgaYWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

The currently listed SoCCP and SoCCP DTB reserved memory regions
don't align with the memory requested by the SoCCP Firmware. Fix
this by updating the SoCCP/SoCCP DTB memory regions to reflect the
memory region requirements of the SoCCP firmware, as described in
the Glymur v21 memory map release.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9ec7c256b80a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 

-- 
2.43.0


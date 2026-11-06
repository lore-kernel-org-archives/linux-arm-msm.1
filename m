Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954443;
	b=tW46t23k1YBo/yIIhdiITagBw6JS2kAWpL9ZKiNrn1d2mT9bLZtRVPu656QRqG3dceQr
	 zMHL1T6lcdTc4hDGDfeuRjp9cjZZdkZNuaKmln4//oZi9umCw6WJwKzceQklWoDXD7qJA
	 cGa9VdyldOSrT4VbUoQALHVyeguDgOvgM4IZzSeAtE3VJcJEE6KiV3WjYkrnWSeahSpWZ
	 ZHgruqaF3hSMcn0rPE9SaO82sGD6tPO73/9qBWtHtwPaMLXGPuxirOYs2QifE26Y06u8d
	 sqzaQfZktHEKDcZCdZy7OgaE4vZCuUH9VCn+ppVB2qjIWxP5z3kVZU6KqLGIGw4F2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
	b=GCbY8WI/Xt1YVI6AbtjL+/Z6/RlCkXTJmlfBQmHf0IejKCWB/2ZVU3e4PhXLD9W7Mt7D
	 BeZi6HosBlVOInN3FSyyjxitaJiLlNYYC3S+kyrXzsDtE6UwZwfgDPd5cQhBE9Bz2gv7C
	 nt1S1x0cSxVPbsmL0q3d6t9g4Qkuh0EeauL1wyzNGaIjANmdCvegttkCOyQ+9U0FZGjXs
	 wVI2ezAgFCF1hT0kL2tUoCLb3JhyEPVHnTcqMacGGF422MdDfzgxYLxh8L8fZvjatputG
	 JFcm0X91CirFYVHsmR+Bm26UTts88y171li1RRjmstpSeoOtjYpAAYb99we2FXWk7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BqZGknVY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B76606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B76606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BqZGknVY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R4Pa129039
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0J
	V95jdOhY=; b=Y6WAJTZd1u/Qf+XFrIvyqrGeuo2yDlYMsDHmlXYf+5EyYBDyOtB
	NRvOvt6gIA1UEqyrDvmUGOoHBU+zqFZcP68cg+hMiSX0y1Tk8fkwJx/xY/5JFHVL
	Bdzs7Sk4OZFW+j+huWxv48H9kfx+q9B0+JdIXzEsGf2o1Dcfo8aElV0OcdLwSjEX
	alGvU4L3CciY5s7lMS6y26b1jCGdFDycoso7PhN55cwEOFIUh+yuy+gcL0ar1mNP
	AYPk8kE1XyTJVdrxnmLsaM8ZWIts9Xp+TmptqgBC2vxvuIT1M+TWOCZQ2di3D4Kn
	b6d62YkDUNJtl9QYNr31+PBMbd+uYG9trqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sxb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:40:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso367061a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954442; x=1794559242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=BqZGknVYRjEm9TzEDe6VEMgIR/B7wATyDVnKC1bRVvoRM4snJq5BkXG0QMr/XsQQpM
         JhljWx75ENCcLalbNARC9BNAlDioJ1KtU2LaysPXU5SxgxbxaV5mmvtN47GHah4Kl4sk
         J44NQQ9oTYicJOMKan7M3AzP3p9chRNyhupp88XXzw+Wj/WB8NkHgmHBivhKUqCB/bth
         6M5qn3ig/1IkP4cnwEnYkhAU/t55L8UOgew6UL3F7ofNxbUZtlOwnhJYe/toZdurSeah
         KPgq+dzbG1ZfyMDCa7wHe7FqzYmbuynTPvVQ8j/rQdq9563HdT2h47yw7AXmnemQ30RY
         dLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954442; x=1794559242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=CZUTzP8UtyS/Qqtc6uZvBlc6GZAbCe5mpoA4kyx1dkJVoPPBlJbhCKpNZb+wOfTp2r
         5KOs5oKOB3/2UK6+z/DuCLVzusykaNewy1eT/efxd5YIgbEZFlOXSKpTMXvRariqssCd
         AVztQm8QJPxgI7+ZFX64Kl4ygSUkIa/LTzeWaCkYZgM4cu+CtAI1oDXMm7/vnwhHb5Ev
         pj1WSZKm1jgjlb/b5kX95f9YqDUOOzdV1Rn9Y+g/s4105nazAmopInXsQ/AJ/8Uv/rKI
         U6mYcC//nbe+ZJtAuT+eQhIAUW6vmFN63yEleiBgfMCu+5q0kzgVJFEnTDrbt5Z/Hcbs
         PquQ==
X-Forwarded-Encrypted: i=1; AL+hErE9V6jbYB2DqD0f6P7pCL0dyG3PZ/EDpi1GuVbbynYh2FdZZUaY3JNXmpgp4f7dW4Z4y3mlVuCVWvrNroue@vger.kernel.org
X-Gm-Message-State: APuU4Z+56bCyqpl0t7CBWRBQnD9OfzMBJOdOTHmU6C6PxaYovxvsqTxz
	Y9eO71+Z5zL6bkvgJsF1wgusy0dzrN6FEQd1UOF7ZMjR8QAJXMlfDD3uRXKRWyTnID7oG0OMw0E
	1MU/6DJJ+dSVnpaEMQFmxUo07H1iANVPqtmmJsKYWk9HK7L6bnuschZUHCIt5+GEVKL/c
X-Gm-Gg: AYBFou2O6C66u1PtquMGAo2pS4z8MM1PmZpN/Kxkc7HXayl+8m1/LIKuMFiZYh0jYyJ
	ypGrSvQCvcLYDr4++OPu6NEx76jPywsNnkp5ta11zuYvL//A8EwxxufEHwKASYoDNDIx7/0Xu8o
	6wwx3ys6qxSM0z028eQLOVEuwhymo1QaO5REqaPdZiogXCKcDDXttmPlSJOErQHy55BjVaoDN8d
	TS4grghqPHBLB9rvSleKSH5o6fblwUwZ5YbSM1mYCjS+Vz9XEroDrmtx2fJuD2jC3drK9Fk/YMH
	DxTb/tPHIvmo8OyPg6yG6ttPZAd3eB3cI6EBCwgoDGALqOT888888HJT8dQ/W2oB9flY+2RdCTJ
	W2SllnUp32oIR8S57BCX7EWjxRf1e/+E3cX8ShBLD2pe0G71Pn3nyQdyBKLcRJxzPLH8IDBgJc0
	h2ztt8Azs=
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894996a91.11.1793954441537;
        Fri, 06 Nov 2026 00:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894959a91.11.1793954440903;
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e253e9bbsm683947a91.0.2026.11.06.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, songchai@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)" message to debug level
Date: Fri,  6 Nov 2026 16:40:34 +0800
Message-Id: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX1pdqmj5wxcaD
 3H9tD3z+rwVfNCbjdXpW5hpnfGc65jlUpvOjNZ+ykTejb+6Dl7+I9SEHlvYFwXHVwbxKhYqf5MA
 7IoMftOrNrRrxpFOa5FMlezYBCQDweA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX0T3o8obaP6lQ
 l+XWv0HRt4BJC7lZKGceU010QZa9nUnhqnldxyb2n/kU+VkaER5wElMj5VUwumYRlH1bytob74A
 eLxi5ktNDX2hvHPoCXwKPH9TwomZMOLh9WLBtZK/OTA3bcPrIK4akpyPL2+geWNsW7u6kYRvkX8
 rBcibq/UuRmM4XbaKVro4dkrhiJ8XlIN/tmBDiclzzwoCjN0o1kTFH33i+F3Asfb9JNOo93DTQj
 smG6raYf1YKhrmJ9/XiPFcI8IKcYCSK9+7cRbCfHDt5H0Xqdx8fiEbeR2Ndiib+JIwY7l77xjAO
 HRTfkg05qTO0Wwqh5SIp+8V+u0znA7B2RkM1Q1OgTbhMKs9OFARPtmtaLeHpMMmOXs1+eArifZB
 8AHhgiC90nabeVnaEIXCl+/56HSnAoK6B872kk/MbfpzDdXSbntzlVTnV62PpgJFCxAXcGdgg4g
 oZQLwnHEZG+toazBA5Q==
X-Proofpoint-ORIG-GUID: 85iFq9UVicCR2KWJNy5AMky48RvcK049
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed928a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EJ-oiV5rZAYrcyJa4SwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 85iFq9UVicCR2KWJNy5AMky48RvcK049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

fw_devlink detects and relaxes dependency cycles automatically, so this
is not an error condition requiring user action. On complex DT
topologies (e.g. CoreSight), this message can fire for many node
pairs and adds noise to the boot log, even though it's primarily
useful for debugging. Switch pr_info() to pr_debug() so it stays
available via dynamic debug when actually needed, without cluttering
default boot logs.

For example, on sm8750 this produces 125 such lines in the boot log in
total, 80 of which are CoreSight-related, e.g.:

[    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..da4f7ff2ebcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -132,7 +132,7 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 		return;
 
 	link->flags |= FWLINK_FLAG_CYCLE;
-	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+	pr_debug("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
 		link->consumer, link->supplier);
 }
 


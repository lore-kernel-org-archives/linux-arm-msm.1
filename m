Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423083;
	b=xio+OkafMNDZinyfAFm6kyrVc9CmjAA0jdwR5Cs+WeOfg4zueQRNcxGfjodNLclognx/
	 lRtZHFP+UtAHH82ycVuXt5LH5XUVuuwrzw2fbfsXOW1NEARZLzU9agvqlWhCf6yuzt6MO
	 PeQz6wAxI9EP6W6XiYMPEIsmA9P3Mowo/dmbwDSNMljWjRd9dR69ckAkCT68Prbjffhxq
	 GJlW7x7uQ2l9eh8LtkRmMRPHGMtZ5iylCuc/oDTBNJwNwd2oBdp0QuD+85KyRInDI0swZ
	 UqgFSye3qrR7y+RQfNTRzxljwQMYGrgyP82op5QfuQ6xoAixXRqp5fX3gcUVGu2N7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
	b=cpbG9WG9xIYrz17kxTfCU9+9jPS3mCr/apEjBgq4HZx1CiHERl+f7TeGJIRL8m9QwCRd
	 dicaS3QF5o46EKBU92UYUqVV6G86otu61cP0vt4uEP7cQYLhTvX89lamWdv0WYi4/6Ca9
	 a1zYLlH9n+huiEWwcbMDY7s/HiVc8RWY8XnwCIFBQ+topqRQp1azHWWBiJ9NDz7uzC1cn
	 dkUDrSZ3tD4n5sNk+NyhhXCMAzNDANOLDuCOuQ6V2qPbzeEOHo+PFV8CHJNEbx8h7YR2t
	 mwLN4U36T38kTvs2/SERKE8i9uf8hR8/dnOBdMg42IJPGNea7tXtJMpYayfS8FOaLAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PtTb7PKR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VMu+/1+j";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0139606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0139606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PtTb7PKR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMu+/1+j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN683DW1126608
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X3yZTqVhfhTylOTclFsQo0
	9RDsFxnkQ8A4AY0jGF+zo=; b=PtTb7PKRhn9sVvT4kADANyQeCiAyHA7Vx492PB
	MIRIxGfxcVTOqHzywt6F47WkaRCnlno5XmC8A8iIHGBl/K6R+xrpOyIssNnAyml8
	atyr8OrZWrTe8Vaf0D0hewuGXOCsqmbmBiC5uX5WU/onWH4ekQG52eXadhbIxagr
	gPOaWgkXmUldIv09Js/b/vaY1ARSg0pfXZgCFXTXYL3HDIKuRcdIeID4NYcvGRT6
	7b86BhwcUCYK8Hbu4lJAhaUfwaHsnMuAZJDb1c/XivAuOzogjlAphQ8b1q0fjIba
	yqFfHj7hZ/BQqFp/k9UWrU7Z7MyosY4PDPf3mXrBTYvADNYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy00h22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:38:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so579929785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 00:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795423081; x=1796027881; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
        b=VMu+/1+jFqPdREbp0FBZ7GwsFBCjplWzCMRXgI6yqNTXffetPIY13r/c4CdqydmrRm
         l6M1KE0rodkbPvpwaTb17L5lp0xdJtP/1fY1tlMNIhWFOoVkqEIwzCIka5OKI9VAfzte
         MDgZZq85oTG8wxaZfvX3XxIA8Vnbl37LgsqYT7vuy93Qu1tpYIWScZY0AjQWiHsCsqfG
         ZIEsB7J40AVIwahsx4hSsnHhmWRE2dsHXUUS6jNQ5wGSYMOz/Hvy+3l32mbE7nFvVazz
         q2u+8m/Noow5Fcz3sqqcQpJa0QktTLJ3UhCY9X74HG2w95BJ+I3sqk0QLKNvGDRTMyrD
         GQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423081; x=1796027881;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
        b=EUPZbXSopdMIO1EvhgPIyXF0E3+xHlpmeBx0GZ/zWkT6X2UkVBbIFLfUTUcLDuJvVz
         g/I5sqbtLhZktMGZospZyUee/LrbW7PguNXoHd9bCIlLB4dZPrjW0QZdIBk326azeq/f
         eOXWtVInOP43rOeAud28faNzPyvrTZaab6Px52O3H5E43WadLUnin5ZQuK9pblnYLqjV
         Da/8KT4C1evy/EVV6w80WAdd7vdpDtNP2vRnb1VImPBVyDs/wGYn16ABux4E/pxiedxm
         nYkKls/rfGsoyFBX2FzKTO/xqXmbWsWUZKUsex0uWXy/Ib2wxvg/TWPJsrLRaRpDs3oQ
         5KmA==
X-Forwarded-Encrypted: i=1; AL+hErH/qSiZo5dKghWZ/H3S2eRg+kWVQtyhWLOZypWwM8xt8vkHjvfcSU6VeNKMMqxGxyTXx4/O5DtRhy2JYZrH@vger.kernel.org
X-Gm-Message-State: APuU4Z9vbPMUjgjkS+CwDdDOTLSn16KR/WC7VeabFybDnrI0K1A7DhF9
	tvFnkbf/vATD8sX+V8kkierw4K9ahoMWlrRdteHKt2W2dAjvUu2YDPy3xzhvlInU4qfOSgnrCLK
	0LhVCMI9hb1P3QgYEjqfLp+W9a88I8TlGpK/7i3s3Swo1eRAzL4TBeDcxOjahnMIc9QMZ
X-Gm-Gg: AZFdTZeXL98eFYs57Wf+salYW1/9b85DIwY2A4ZuO4Uv6rsu+xMMl46MO7CjEU7Ze4o
	2CCNRvaVieBcN8YMwZVE/XsH/cbTdsu4a/P/pX8gPK34ZYJU8RyRFrN80pOJ0tpDT5dgXJtJDxC
	4S9rqsZybHakVI+lomMjlMf2bpynCeboY83k94A51h3E6hCexXHpe7SbGwupi61luoSwt3sv/UX
	1YJNQVlVNkQgpnf+3Y88iPIlsX3Vj32ja3oQE5657PxrksD1OmnnGZAeC3DIbIZFvkHOzKTKgrF
	y8EQqXQV1g/AbLxiGCsxiNmKEdIRSxVflSu5Sm7UIvs7kvcvkq8va1UjwPMDLNdjFPm386ao9sn
	pxDqwfFAhU7IYtD8pLrIRqW1Zz9n0DF1HmmQhDngEoH1JrN6/RqgBWG6hfQ==
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr1877513085a.72.1795423080946;
        Mon, 23 Nov 2026 00:38:00 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr1877510385a.72.1795423080246;
        Mon, 23 Nov 2026 00:38:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm20690616f8f.36.2026.11.23.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:37:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:37:56 +0200
Subject: [PATCH] MAINTAINERS: Drop David as Qualcomm SPMI PMIC Arbiter
 co-maintainer
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
Message-Id: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGP7A2sC/yXMQQqDMBCF4avIrDtgEg3Fq4iLmEx1hGqYaaUg3
 r2xXbzFt3j/AUrCpNBVBwjtrLytBeZWQZzDOhFyKgZbW2+Mdaj5yVgWMciISbaMKeycMETXNnf
 j68Y7KPcs9ODPL90Pf+t7XCi+rh6c5xc59+rafAAAAA==
X-Change-ID: 20261123-spmi-pmic-arb-drop-david-ac3548160463
To: Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=y69+DrYJ+CVyZoH1f4H/avPo3X3mEsrz3vm3g0pjzB0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrA/tmWqM1E2MuoSYsD9SIVmMc8/dYUCFf9AWoZ
 1/0DehYYvWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawP7ZgAKCRAbX0TJAJUV
 VkXVD/4oxX9lNWk3tyQe5Ps8fWxkGLVPXePhM1s6iAMJ1Z0UIWxmLZOTaytHzVYbDX9H9UGxD84
 WC7sxvxWebHP/Ca4H2C0Zul5/RCf2J7xmkW0dDExGyVhDHDwKUO8T+5s1STJgGVZrqe4zWminy8
 I4dSsY9Nc9w9kZIyGweI8WaV/OlcB4aERh8sP7DRCt0k1olW5DeGmAdvZLXVq+vKK4nS4u195ka
 XNW/foFg0n3cEGjeIZSWFnHox4xGQq96zGE3hYdlm6v4PNMDD2BPpu5UHLqtknOZvqR6oOvLU1E
 PyR2dnZwLb4O98l4OOwyA33yuuh6blEyRr5AwjHNv8brG5iSg++z2p9J4KWRiIpDdrTLCBe/ylG
 lB5F86IMkRn+xE/dEN049nSeD68VImoj3BI1+m3hXm8j3EBmdBKcQ1CeheHw+dfUQiYijuWUPu0
 8VXN/e4awUW9Rqn2C97tODmlj6TpTpehOJmBA2fd6DD+3V0+wT/rW8tFzOsg+ClycyMOgUKlbrZ
 v0kb3CHqTxxEfwEwqW6yRhbZbKVeQWkQ1S81x18hIzehxraNHrT/X/8s/a1ngtX6G2y5XHe1HGb
 cWrUyz7SqaoHpS3ZV1eZMGXGVs30sVD/HKiHaDWYV5ttUVfcp4NW/tVw88lIpcRzOvvPpZY92u7
 xMtziYus+kjLPqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX00ZShd4DC7Z+
 OngW1P3FjmuRUWxJy1Vk3RvGHOgEPRHlAZQLtkT/gNhoT3+xtIfl6+qCQB7SzMQPV9+SZGa34Ki
 ce9wS4j+o17MR+ks+YsjQXflVBWtQmz8yyNrmCteCeeZiNOYUm5rsi0MVBWhskUNc0+pBHG1ktv
 lC0BgzOp5iv9tqs8dErsbysewWe1JSUForiVDrWqoruSS99aNAIc+sHDFv+v07zx4d++9HlXccV
 6T7HIYA0GT00Ow+jfTyBNZzFC86pS0FHipIEnp/3FAw0Gsq9H30ulwxw+wQqGqDRUuyl5nS5TeS
 f/F53+jL6BH3GHXyO5F32yx8wrZRqWR5mX9kPPjqUGcYXmslSN4Zexvp8pR+PIj8ZzR8pxHXLB6
 eXqnT9zV0YbYO31Lf0vVI0JcfEiOQAqopocoJTsmw+2obIX/p3fjwEaz+neoKZhWrJW5+VDnqQI
 cKUr4YiChxn6zs8AXrg==
X-Proofpoint-ORIG-GUID: nz9TnZ005BR0wABOsr7lhDyhGG83iMy-
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b03fb69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-jf6-IQOuiCzVN0evu8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nz9TnZ005BR0wABOsr7lhDyhGG83iMy-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfXzJewV48d3kaE
 tgNz1knG7GOoiicDghjT+mi/KO8342pfIp/wYyuiK9iXsDhQQTEp/K6tSvChQtTzE4+NlClPYIr
 zyBBuAAY/KE7qBPV0IOGOPBNkXlweKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230034

David has expressed his intention of stepping down as co-maintainer of
the Qualcomm SPMI PMIC Arbiter driver.

Remove his email from the entry.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9ac..fcfc0c95e793 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23434,7 +23434,6 @@ F:	include/linux/if_rmnet.h
 
 QUALCOMM SPMI CONTROLLER (PMIC ARBITER) DRIVER
 M:	Abel Vesa <abelvesa@kernel.org>
-M:	David Collins <david.collins@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spmi/qcom,*spmi-pmic-arb*.yaml

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-spmi-pmic-arb-drop-david-ac3548160463

Best regards,
--  

Abel


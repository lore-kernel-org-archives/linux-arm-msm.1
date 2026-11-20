Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172043;
	b=iKDYfMWkOjM69NV1EiICgAvCnffQGOXWwSplaCSP4qWD/2YII8qcqq1Ncl+YZp3D0nTg
	 nXIrQJuKOrHXTHc06Jr1NWJkhI8q+KMFFrx0N80yuwAd2U5k+vI//3lX6vR7aRtLRxOS3
	 9QoUF4jguJ+nLx5jjEBes6TH2FHc3xky+aN965npB51htCKn59OfbhUneFI6muDq/msBf
	 ezAinPRYaXnwQZiu+Valmv6Bj/fN9qQdFDAQ0+27CJnLizFr+oXAmQ1KJ571g7IK0xnPi
	 pwTTY3w1hP4sAKNGlEC/Aw2/KqMv9FdIqt1rWhxnTLXi9Est58bmRu0uE2ggBvR66kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
	b=x+sna2A6vrU3tNA5yRBS4B7eRM4zeeRx5PpVJvXUW9M//YZTMcj6FZBO7CBVlyNByaDA
	 aSuSq6LUgQkeGWUcKYM8at/i8qqHFIA15kynST/V3LI09mx3MK53QXeo5Syx4nKS7S4am
	 91Jk02GHNCpMoQW8WbQ/VqLde4vXI6dk51jNWW3D2S7mBfK8+PrnUI2Tf26FQOaBsnSMf
	 ZDKSjfMB0Dvov5mQl4wpiXv2Ndm6SNZvB2V3XSQqVP8nqW1dH0wGowRHanwqIOdVweBe8
	 I6+1zUBIoM01O29wEoKQYygaZsS2pHpujQ/jINlmBIGmE55guEBsY6BOkqINu5nKxLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cen6HUbP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNugXNor;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFE606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEFE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cen6HUbP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNugXNor
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxKo556462
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=; b=Cen6HUbPI02arLjb
	pxF8ifzkAJZ+mH5QwSnReeuz1PFDh7Pi2WJZKu14LG/Y7PQxapT//KpZAAH8qOcC
	JVAZ2Od7N879dZDBaLK3EEkrza6jVjIFq1AFeLOHNW2/RObqNi2zOirxvPCv5MKZ
	fisSgG32nyhGSteM7zUCzKUD+zBLFBgQNUfoB8FwU825XylQidGyithQxbR+hug9
	HaiqaVGTW9jdycB//UD094P6TpkWwVOuxM1PoV6/k4tcut7quInMURNpU12ArA86
	2pebd22Ijvk8ZFOrw6kQvD5dD9AqEtIV3D0FLjmo3c5Sm126agQ+66wZy0LetMo5
	bYITgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhcgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:54:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so1528115a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172041; x=1795776841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
        b=hNugXNorJmt6F+SEiinSTWkAzywc0ACXmsrtvVsMeDEssWEa35nzaGP7KfiaCVCQFv
         KytgTwVhI3cagvosQmeSC+snKOim9wjL19+ARWfq1Wo2NrF3UgLHtwtvUM580buJh9Xa
         iHwydpzbByR2RVq24/J4pB+QovyyW094mQfcdMtczVB9TSau6f1vhfteQjZ1RIYU5gWY
         5oQvcZK6h2mTTFJ6nRBcD94Mr87Fyf4tY0cBNTyaC70dg6+ny0vEUSaEMYlG2w7wnB+F
         3Wa3wmshPifoCV9mOa1cr/U4rJ7bAcMm5PsOZ+ZAgZL1gLGOzq301Xj3ACnkC01uFkoZ
         FR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172041; x=1795776841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
        b=VL511t3zUwvSckFxKs1Mm47/XxrBJHJTydNx5Mo/MOgDNY7eLCP6j/1BFITZev4jJN
         ZUR23TZmL6iSwQT4Q6cg5wWgwRgyedfMTovmyqeyHQIPhNJhTiCcYQSpBm/KQqDqnw85
         Bp25WUMicUG5KcEKmskTsikSqRkjt3E+McZagHOu/8+4bPMaLJlz04fru62KYJ72BVLb
         dH6YVtalI5zZ/wtwxDHpa9daM+SlS1iIO2gaoCBKUdjhR68QuPgdM0CSC40pepmtZNcL
         Nv6lLYJ6rJWvcucmPrU0dGfcOHPXD0t2tP0SC78Cfg4mxQKPPYTtFpOnXgRFG8juHHuI
         N24Q==
X-Forwarded-Encrypted: i=1; AL+hErFd9zzz+Z6TrN82pU3hw7KguPTS8XBb+3hXkJz12hIG65cT7o7nKW/OUweWUrIb9JcZ6ahM+EDXx8c/sQUb@vger.kernel.org
X-Gm-Message-State: APuU4Z8VzFXVB97LjBrTquKL23HzDgv8GkPTbqIaS4yjmRT4k47OTvA/
	ChXh8HZsGU33kI7LMxRJuOcgBCf9jFBN9DCMOwR515skjqh2QkMVFTRdB/fq3HmjDJI9nM4k/h5
	uhYGmkoouxdVkAQ/bnJTKMH9peL4zpX9kRKpCepGlyyK+3PAYxJedDxudSNl8Ktad/3jE
X-Gm-Gg: AZFdTZfW/7XDiMp/ncT1M6oPR44Z7bm6uOEy3ZpkPz9JLSnHiv3ExlUxBGQTN4TCwYX
	GjnkYQDrlqnwugMeeurhRW+ypAyDPISLW5xXYZFXIs9o9/5XNATrvKYPCfP78JDJN2NA1b92dhz
	YDebtnU3Vw4Se0Z02amtvihCBR575ATmi1oxCk1Yj6OO6mqep1fxGgDw1FADm8r1ogj2SGuvLP2
	71W0q7GMT/ggo0inbXfl06ClR9TfDwpA93e+306t8mKeRoRFlc6NPWICPJ2L1rHWU2ZBE46P+Be
	saEanQN06N2kjKjaLAn/7YyzHAaR9tn9VO4eIpxABn5/DtOC0wptKnhM1a8mjBV959p9MpcmqaG
	H0T11wC+lrNBSCpAfFGvO9q79tdgnf6hRg0PFCtN57RFgOARHBVyPMN8AvHF7eA2gpEewF5hqw7
	Xw+Yar1cU=
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b704:118c with SMTP id 98e67ed59e1d1-3b41cb4f321mr2403010a91.65.1795172041407;
        Fri, 20 Nov 2026 02:54:01 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b704:118c with SMTP id 98e67ed59e1d1-3b41cb4f321mr2402997a91.65.1795172040980;
        Fri, 20 Nov 2026 02:54:00 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:54:00 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:23:34 +0530
Subject: [PATCH v5 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
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
Message-Id: <20261120-tpm_qcom_driver-v5-3-3d9321ace107@oss.qualcomm.com>
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
In-Reply-To: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXw+c1jrydTHz0
 tPwFGC9j468L0xYYc4gXTIQh5+0PdfzZZAtrxt9fnA4eDvanKT3g+fohMJF89oixXfSZwdNTtPO
 78+/7Gidmkgl51R77gRI+NhawEM8yUYD1qKOrq82BTyHDhTieKPoKRPdMbYh9QJIGUxXsxav9T1
 gtgqLnAxaAYuDycSleSglzJmmVXzoNZaVlI05qzkcdqSY5x3tq/3ko5eJoAwskaIQIZdW0Gruq7
 JbHrciKH7ziAO5vfKFaBkWXmUXPDGFbvwFeR3KXNLwaogx63/NYH/g0IWhx9x5AK/Df3HHEQQtW
 sZLg9U8llzPOo67xIyo8TLbAJio+ds02hlfMXynhRHEWkrlclEMuvP5397ZalUX6MNYZytdi02T
 ULxJlxRBE5P5ohSm/CdgCJxoL2Dfom4q7bEiK19b4lNQgQYkKKUT8FI1Ga5Z/edrK6eKNAjNoVE
 Cf2JtZY/P++qq8AOwkg==
X-Proofpoint-GUID: O5NyPaXpLjU9e1XZmTXKOZ5SW0uFt95i
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0026ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: O5NyPaXpLjU9e1XZmTXKOZ5SW0uFt95i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXwGKHtuuNc+oK
 VxhLF0yCh1hdGKHs3SkqJ0Q6t/07PWR4K8cN+v19j+UKEinU8A6kySE7mr6xIf/w6fxTRNg1Dm+
 U3NZIpRTSz5GXaCGCEnn52W9ynmINxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 733719f400b3..bb80ced07840 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23435,6 +23435,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1


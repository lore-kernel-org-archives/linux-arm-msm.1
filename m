Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538323;
	b=ystw5UtbZ6MJdeywHgBgoP4+l+FUuHzrQtO5olJP6WQAEWbOCpd9Vw+9YNrCuFLDbX0A
	 OrDGudDPJoHJgMbIncq8mHesoKNo6KRsHfgRWZWXMRWoF7H3wCzCvBYCK0qm9MskwiZgc
	 ETHQmp8j71dg4U3q9XU3PkrQsrpAfce7Jq7OlErKs8mNIP9DjfdHPxUGUBjs3Pqsrg8mQ
	 u3SCA08ZhGipK/p5q1H63W8w9AsHABEeU5ITgrAACdyz2yEVTOUtePLQi4TXAOHmHm5T1
	 Ky99cB4WHadZaO/1frxzcLcjxJ9D7vYouhNRDPRdaPGOrpJjCdWo8FcUdPu4KViM98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
	b=aVIiy07RLeQViFJeUYvuRG+kxUIjF8KUg0r7d65eCsTgWgDsj2cyf+rWGcXgcrM3Vy9R
	 nLhnqLm/jj1PoBuZ+T5wk0qa8pSQOBwGZjFbJaM1H4BIgwCZP/Z5qvg8NEtGLZLVSKuaq
	 uWp9nVsCkQ9Zdawm1q3M9JifjkGuDIpfJX7WC6BEkI5Mn83EfocW+RvKjVwXB/Xzo779T
	 YGZsUeY2oqsZxcQrUnTNgFWLdtkpHJW/4qekfRfsv3s8XMBp0eZc/okrABxgwddd5uNYb
	 /gkph01/8RFfrMFmI2wzXcV51Z4B29cRb8HtEdR1tdjkUolLlK3xGakCAd4gJNQ/UfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5826606A33F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5826606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K1IK4120207
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x5yFA/n9nxv
	Gq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=; b=Vpp+Hz02BVWXrRiiEbQnuboyziD
	ZbkneievJBqeDJgMqu5EI4OFJ4zP14AMNOP5wxl6qW2GmCNbEuav8Q76TywHunH5
	D+latF0oPT5M+S89PNtLQlPgDSAI5U6Kiz453JIVCSaHc/RQrVY9pFQfxW3Zhv+3
	5DhiOquiTN0HU6Y6JMksegrh+LnKtpXL0+b1Vci8AJZaSWdUsXDM4Z1UMhnerl4a
	6rJRLevnZrSg9UhOTzzCk+jBamvb/7EdsSVTVO2fQ0me4hFqIeJtBLd6htksPNGj
	+7QQ7yakt4mt5wEjCE2myu4DWlAxtA6spbOnnG/UPEyEto9PJy3LLGGHcug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso3343035ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538322; x=1795143122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=HEYT+nQD2EzC86Pa5pVS9iFRD6YAOv4oTrM4o9Q0TS4munC4UlRwl12HWNto4SR4oV
         mFWNt6uvIQOeV/R9conTnpU7LIPRHufQ+gykzi3pKzXcjKJ5dPx7HReHUDLyhg3x4Ycd
         hL5S0ON+VLlS7aYXao+JX15CCpBcwyzaMnieC+iXSOxY8GJhM3mP45SDQbf2cQNQ2zrE
         cHxh/aRoToQckgF469V1BmIag9xkxiZGJamHiXTXsX1SD7uWOJvRmbr+xUCWiIjApXUh
         tAkpjcDlQdY/FWvmNALCIjwOkeLJez8gbANcky73i6CweiFE1l4Ix5tXv/As54+hJKok
         dILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538322; x=1795143122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=ameBboTBuXi9Bw/UVF5+GudkTBx20PzJwOGDR+hnAoi2JgVRC78ylg+kX6c5JHurbT
         DFvAgpUMoOv6b8Oi7qz3ot8Xhmb3cfDGGnoqj1vD8O0zYx30sRWkX1BL7o2GhrcxmR2p
         7uYafmTwWDCbXGLjV1PK0ufsY9sFft1d3tSnGjGIXUcVtb2bM0/Is1kCTqx00eSUorKJ
         cssfnlM9SvnN2maOBbiAhZWy7GqemHTd32plfL8QUrISUVzmiKPpMzeaMN9Ftcl3QtiO
         9D9mpKhRttFVVwr+bCXpQOhenLt+aScJIlxDOVPm8drb0jHqR2vjUPSRW4mYJh6nbvNW
         CASg==
X-Forwarded-Encrypted: i=1; AL+hErHpoK1C5ET5j7MUh6LY8QuwSEayfFdNO9eTacHFoW4ygHLE9OlEQlvZq4hD2kvkUiSJvlUvwxgBZI4OWRmU@vger.kernel.org
X-Gm-Message-State: APuU4Z8k9d+jljQkQgFOXAKCy3JdCg64kcOJLHADvN5ACmtSinFhr89t
	1gAav63ZcNmlnEdnZSwKa4fwAGAKXmoa5RsaCrygfkdM0InIf7D76hMqXV4B/yKEgo5EBKUY38W
	Jn5mWn2I8BfyyGMUy98GTnEX9NLwXT9eBx/I43E3/xrurFGlM5iS37ZNR9HBT32WcgkCi
X-Gm-Gg: AYBFou1RD46wYO23UYowxRJc8lv/LuK20z2inniDSASk0RF0ntINQTmHQiRWl+0PQtT
	H3o4FmNFWXCjURoeAylYUrnxFIQwJJ4nPx7dIF9p+YM/CkuTOVZF2Wkbo1mUpa890JKLPpWUDwC
	acsh6d7Yvb+edwrje0dRHBmnXeEFBcbQ5MPXLPOn/P33A8j+1xykhf7PkIgSnQacSYjkQT2G23D
	ShafPOtWY+J0E75QrJ1d11qSYMM71yoMqUOP94hOdedmqi8IBkmrWXdjXFcpbH4RgPmeD7Oj3Wp
	5MlleqDRjMUx3RXMUSNZf2VVo2P4K0oZVIX+uuV+N+7xWs3r+HgENIS7ant/SvrcCWOi/ZS0ze1
	gC9sU2zH0D7S//OFANcey8cZpGcOgDLvpuHcdpcC0eS0QOr5DcoDHQZtWS5UFMIbWHxybUuzODy
	43y4nWNvY=
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325685ad.17.1794538321710;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325425ad.17.1794538321253;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:33 +0800
Message-Id: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67b52 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wQ8sKV_PtrUBvD2kYdcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX7IQdlXAkW8tt
 0/152YGpYi99T76A6RNxd9Pq7Y0dIlYK8lCzJkCWh3gKXjIPy7GeOpLJLIh6Bh6PPjiL6uocx58
 IBj9mwy+7IbRnqybOilto5N3vT9F3HTEm7ueLBFioy439how/mahdYxjNYp8LKwdysvSIZQK7Qf
 pU9BZt30X/VLwsKacX0XF2OTdyHmooXbvrdyM2JRJ+d+S4FCJVsbxEUgFG7eT3dZJyq1d5AdT/s
 EadpPxFwFGJyaqxMNYpz9lDWomGN3hfViOjbpSiST1vV4pTRZw78RP3e1EKjQBQuvWyZ21BZmQ9
 am5V7zpb+wtVMW5MovKxXZfjOV12eTyWteOEU7G4+Ofs1vdaXnb+3A8jCrxqAI6BMzPqcrfSjJy
 +6cHRmK/q4Keq3D3CxK8eTuk0IIc1g6CtTwuSuhsspXbFivrEhFVaJg/MdHodUMuhF1Tlx3YobU
 nyNLJATwfeqCV0Dzyyg==
X-Proofpoint-ORIG-GUID: AdqCEptFqWIGKIt55BATjzz5nMFGS15n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX6n1mrRRQO244
 fYH2xt0tfuSZU+o8jqrkOI0kli/2xDkWeppoOOK0prap/AIjdk1CxKXrxXnTIwpYG6DxGHQZ4+u
 ePIilPjfh/2Nrl6clcG3jsUCc2KPrp8=
X-Proofpoint-GUID: AdqCEptFqWIGKIt55BATjzz5nMFGS15n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
(0xfc0) within the generic CoreSight management register block,
immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
drivers/hwtracing/coresight/ that follow the same register convention
(e.g. the Qualcomm TGU, which uses it to detect its timer/counter
capabilities) need to read it too.

Add it to the public include/linux/coresight.h so it can be shared
outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
CORESIGHT_DEVID already moved there.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 include/linux/coresight.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5286b3606581..7ce0366c7c70 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -37,6 +37,7 @@
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007374;
	b=cgFiEmpciWBtJ7n7dvdvtDmNAXrZm71dRiveiggwF7cgncQ9q2KprQB410GoZuw7Au5+
	 HRIQTVYVo79gbfgBBcobPEdbZm5/7fHk4ucv4ayGdidbc/c2+l0gA1XD7PluNHLtLO57P
	 +7kPfKz9NDCrRxrPrcy0oO0EIcEier0o88hTrCF0QgnXpdJuF8j16r0ol+zPCDBkejlXM
	 3iGhcID3VgfYaaAqIswX4nwoLmcIfuqrLdJZgP+gYRIzg7+J+yItl/Er3uMfusbEsf4Fc
	 grLR7r2rozzUtxq6drvd6q3t6beeg3yF33ymo5aCKFWuAqryrcq2yY6iQO3hOYd4h6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=mT0C1mQ0nmgFs/l8FfvbSGn+yJ/4hA8XpqnJJjo4S4jzl95LK3yZz6ovhleN7aH3QKkC
	 r2U4PlV1VcEcJdShi69GCHsd9nu532XEgbDZoX96hwFvotFdnFbmBvoi4FVBPr2PbmoXv
	 3eF4nq/NOLcenNyOZMIvAR2dbsuQhj6yCgHNnRtgn1pFOxJ6fCdMWV7iYlA80BF12fFyB
	 1eI0Et4Scl+hOX4OIbO/Q7LOAgf9ZiXMSlH6L+//eLiK6ihj0br6OgjmWIv4mfdk0PAKA
	 eWu2c6EFbFaAfb1SKi6qQCvnQ5u4QNepb4/D16vCa9EUmHXcl9+JKhJbwdidqhuntAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdnvFZ5N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8TrjHhT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93889606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93889606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdnvFZ5N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8TrjHhT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo3RI1064693
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=pdnvFZ5NNh5JpRIbkvzKkmuRAF1
	5dWEByr97pusP8voRwwuJ8oTU47S6O9wCGV9dAYqR1lGVFr9k0sKh5C+/RoSbmec
	+ZvEOCNJhvQUO7wZrI3e99t9YO4fixPO41EP+l56+SkPMUGuUSRGkmv+mYyvxn3C
	0lbvITCUswoKqpO+DHRxEzwdNe1+NofcjGHS+ENjHuEOcZv3MuCebtByCmE3bBDa
	geq7o7i9XkUlu/KfuyIcjNDJDowlqciKNbOeNRhumCGcOdF+wJUnIOiFpn6u3Pqa
	u77afprU3oQBukkN9mhFg/CMnhLVGhnmtRdazH0kSla5BouWOTMIrmeXugA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0rb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60a365440so707968a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007372; x=1794612172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=W8TrjHhTP8U+nitBoApHGM66EyJYcPNGycfRBw9wHuWOs0Cf+Nz+qHp72ekg2oBOOP
         N2blE4VhaC2igg5yaXYzln47egZrUss+kVmnq0qEN9nddSZvxx6EbckseZRxtIiDTE5v
         QmsZvaWtKlbZjGfuwpo+4xOlagnhuRZw8fIy0xVWhITJZd5lx7nBiBhw1sSTTQ3yfZL9
         qtYR4eSHFxhzDCQp8qOe5QIgo2G7KftAAeuN5Pd4A1RtOc4q+T8XgwOD6cdL1lPleswQ
         bqq0kVhLXpYTjqc0Us3kmkFx+MRJBR5WnPS5+36uwInG9iKXYKQI0kT3G+3aS963KlgM
         tMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007372; x=1794612172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=OwcHiur9M08RAOMjUkQeiskRzoY1j8JWqAekXvj1YzJOsiZlGMLMaBB4j5DrNug4Va
         rm7Posg4wkVUNekJMhzm9HBRc4szWZG2ujuyIsdl4S1Qzs5/Ninx7i0qQ6BOUWWDR01E
         ULws1UT5LW4VTHSnwukUIQItJoYtf2f3jZXbSYt8XgZ5ItMszpurTWYP5jjv2w1b1oug
         lMXehL1vCG+OZEnffJ/iZO+0E+tKEDU9NPLEulxnccwuX6JxDPvoUxTSxnHr47daa6Ta
         zmv/bTnspMCc5FW2JRMI4iCGe2bnfZQTr4JDZB/QFUj//kBcXt2NCRs1BlCA5P6W0XGD
         PJDg==
X-Gm-Message-State: APuU4Z/tIx2RBMJRtmaJqNl//zw8/15t0b3RJwpMbpHE6qhTWJVoJ8dV
	H6YHeKdsecT29c4pTxPI/IdoR6WA2YNlcP2WYWwYYzfiSOQrcnbqkNWgwlVou/3+UdGFM4ZqjxF
	QpuOIwsD8uGmQYiXydQH6+ziq+V63cTD/JkmzlAGzfbTrxwvcOQ5gqpvxJ4zuFSzoXMKc
X-Gm-Gg: AYBFou1R7pZ6wo3znFk6wcZuXcg8ghI+tvEdTPLEr8mn72mnK7OQLaw29uA1zaETPlp
	QZRivoRUSzQTwofTz8LVvpS+ma0voo+M9YVrRxEXR4liXSCseER54aUanxlRQcO2OgS6YnoPktb
	eFXKvEG2/8HDSR6Byq8KMwLYjgQqxkMwbaigOyJZz2ZHa1y0zIL/cXmX9yCmZjGlF9YtMk7SqYq
	4q/0FQG1tRpAP1CEdpCEXlRYSumWzAS/EztK0gaj1NXfSFU4MOhAD0ll1jDshIgl15dTl+eNvsv
	Q4JNCYOPiAVtqzIhOXWLXsYFy3SUUFgMH6ri/vyK7ThrX6n+BPaGxLOwhPBFB3OBPsWmvcxBpmJ
	3NaaqSVwj6Ee7MJimZLchsrGsvod9SeI5Dh501Z+LVzmSZ95fUYcOFVdDrvkRC7Lbh0P76pleiL
	r3Mv6T829my1619k1mZ2IiZxsbrFxZA3qz2LMilyq4FunMPxbVf7ZbndxCZAYgbw==
X-Received: by 2002:a05:6a20:938a:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3ebb2a24b25mr3767360637.42.1794007372265;
        Fri, 06 Nov 2026 15:22:52 -0800 (PST)
X-Received: by 2002:a05:6a20:938a:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3ebb2a24b25mr3767342637.42.1794007371878;
        Fri, 06 Nov 2026 15:22:51 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dc9156sm1003773b3a.36.2026.11.06.15.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:51 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Fri,  6 Nov 2026 15:21:01 -0800
Message-ID: <20261106232220.47602-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: d1U-RjqDsrHa8uNJKGaulJQbMXa4rjJJ
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee614c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX/GEP8ljuvvhO
 ftt3LkAx1JHlMWaDS0i0FijG3Qh06ij1nE304DLcsOVU+wzFRcK3jjulEotZHTpHSz9qdnQ+bTe
 rh2+fZHjDAPauEbIxzAWMUBaG7KIdRM=
X-Proofpoint-GUID: d1U-RjqDsrHa8uNJKGaulJQbMXa4rjJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX6QoosBrEHC8O
 pIlgi9hQPTt6XUZloopOYOY3FE00pa+6bmO1po0SoOZh4EI93t++AoS1pgoB7Tg1Sjc1Xlhz71W
 0eAWubIwqVYyaASTmQX16dcWGgwOvl5nUC+LmBYqoZ049/6pmmKLU3uFHtqUDi65VYIylDx2hQN
 58zTpJCnNBZrijVfmflVVqAhrlwX42QE94V9B6PUhFTUCE2unwuU1GF3rnS5RgOxLSbbRoaZfEW
 zbKtyH1sND4eDCUtiplvD0UxLYjMZ6MX0CdLIgsjWeEaNh8j/eXKQslQcMlel8pzs1iBy8sFQ1K
 ndaqpJss5WeIATGkijJmL9Jm72eCXu6qh+ZttrbB4JAQ48WqfuSW0FjV77Ld77rZ38W4sKUEFiA
 ckqnPAJUKlcFPyj78FAE88MNamg79NANjMFWg5F4SwkeuGz1yBisA5so1oBuURSCJrwAXGrbNYG
 w6ZkB7Mm6nJOBlvn8Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0


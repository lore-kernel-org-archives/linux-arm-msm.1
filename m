Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632180;
	b=QmR+jL4f8QghH5BB0zlH+fG6WF9ILLQ73U/5q/Ys3kCz6NaJwnYRZtoYULM1hcNdIdyI
	 E5B4aCKG60D4dAw9wnB2YYZUhY92IKAbu0KFUmFS2VcGTmZ4UnN1NOdgJ2w7TbWOq4fHz
	 ZXb2Q/Fkpx8X7hFBpZ7PzzoKbJpQ2Bgpai1eqGsCJaWSdfwlWXjHVoqzLJOaGuaPzSVjE
	 XNlDiCafcSTUh4jXyhysjsgqaWg/ItHUOWwZqT3vjamdLFxfiA+7rxxZN2OSOkr3qo5f5
	 iURlkZt0EbgFqScBmMNPlcWQR6KV5dDl9yfVpnyEqlKo0KRntDOlWjVbrscM4hRABUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
	b=FtHX5g7ZAGKodUeiKj4HQISK1SQQ9oaxNBfcfD2oVeA5vFiiqLgClUth47GzmJHLxmf8
	 JFM4PbGVDcMLtOITKpk9Rrr7zgS59enOSqLDeMA/tI6wCfeFgMU5EpiZ/9/S7WUKKOqwh
	 k6R+dUuZmE+kC2O0Pt6Dx3EMFs3ES4vMOc9tN4B7+1rMnk0km5mw/wHJ8A3mjLP1ig+Li
	 yeFvbn3puTWHia6MzkDK20Ql5JAOmj4EFtbwCjJGGdzr41uIJJTsLdMbfGH7Y+HdZOphn
	 Pw7Wje647sE9dMVnuWfJ1m5QnLcQUpgwYz7CjIrZzdZPdRpq0lvBWJWpu5s0gaV02Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ILDthXLY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHqiQBlo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA9B606B1EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA9B606B1EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ILDthXLY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHqiQBlo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJrH4070437
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0A8W9k5M2r
	C0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=; b=ILDthXLYJ1LhmQFFWuryO+lbwwW
	kXAyEALMj/DhLWPiIconrjnpzwGt75OOn6IkOIL/mv5X5jRhm31lY7LZxeY4OrcI
	MwHSb2JYjvRDZYbdtopBaqokYNVs3syQYwLuqZeJ3A6a7jFwSLaZCZPtdOIcKZOK
	+P9/0b31mDvjE/CBmybvXP2j/nbQOAd7CzwcP4fn325dKXNsqOTupFlSllo1j16p
	8pU3rB3tmb09GnHfEdwsKgCCJVqk0RIZ4mxmRlXAz9BMY9zeoaQSZgByTO+HV9wu
	IJUqExdyn5rcw7c48/d2+UbnP2uKB+UmPubvulM2DlAVCbRL7hhPBL7L4tA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5gue9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:09:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7b175e38so65362266d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632178; x=1794236978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
        b=eHqiQBlooEObyeAmktbviqdMg9L9+0AwupENSwNxb7l1fvUtvDttCZDPzOjAkGPXm1
         OCPIIjZuJo4yV2clO1VK/oX9PM2oQlwC50svb9P9rFVcts1ilb9kuPl1LNrapSP4CddY
         mS6b3dwDGIZq0Nyl6hw4B+54ThdVIbMEPLTo+QaHOUV0w0qn8jojEqNY0gWYoV7Vgg+e
         jJSw0zt/TGMUPZkJTUMrJe3fi+9CwqCL33eYHsgDVdjiPLG7MjWDOyQdEbYxYBUhUoVP
         GmlLrTkyhmrZKiWzga7VcoaVPLhgbW6iy3E07VeGQ9bquyT315duTVl+sfz5AfgVpLtm
         GeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632178; x=1794236978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
        b=tDAIAv5ik90ZagJmG6o8g5BSUM56TO/dJIa4VwjrPdItw1HA+0P+/Oqf3xpjoATE1K
         RUTBbg2iavyDQShaDiweHrw+RaIOwVcMGlyobss0dkgYr80uhbTzLUvQFN38b2oXHZ4O
         CgpDwnS18ao9JkRIKa7i/95ArgzCAVcriMZ+EumUMEVTJIVDJeoq9OFz87Mbwu0bYysu
         NKYzVNbEje7yCg5JF20AAdiZrX1Lj8n0Xhf01LejYPUwyOOfZjqqzeHh40W9I0b3gsnj
         CsvnM68jhrSpgFDo4to16jXCyVkiPlr9LI0D0HawU5M9xpET225VcGkZzm1LGIFhL2Q5
         lZMw==
X-Forwarded-Encrypted: i=1; AKwUvByVSa3Ka8l+FHj7XvikBOI9xYZD+uz24OdKjACCwz+QQVHfQhkYiQCrLK8c3YNjxhc6c1HYLyYfKIkkmN/u@vger.kernel.org
X-Gm-Message-State: APuU4Z90Q15HXTr7Ho/SRwTQdqT4KYuIlC2tA/SLZifRNABxbSVTxxUQ
	FKUVPAbm1tRkSNRB75AQkZdvcsYYjr7cwOW0vhNHOLOSFkly7B9dbUz3O5XJYjscmgl+xHbMHs4
	oGl/CGNkJeZLWE9qD3s9aAkzy7ZZL1hkJzmdQ0D9bYIp8OKfjmQJkoM1hylvdb5TkfiRa7ueXf3
	fk
X-Gm-Gg: AYBFou1jEwNHRoVBcOmV5bJ6SNG6EqYrY8rN5s8z3JXyb2BqfGQZcGGrYxVBdD224RU
	zqPcf8o/ZM3mrevmRVt/HyOv4sS7BnyanIeGl5JJfbxR1HNY17ZV9p/om+08//IbocX3g4SWMJW
	WKsQdGooonIXXmHmd12QggObrI/b/7dlu0JKNPvNn+5PDxp5Ojp4MCnE3E4/VKjX8nQq+c7agDH
	2Yz0yl4n5C+/Sf6oxilZtk5NHwQmAzIbQIYlw0WB/CTaW91xNRbdHppwFyUwEWX+jQFJSSJnPL2
	U1cx/MdVaGAC1pL2g0hiWLpu9cKRoA5goijsK4hZ2EvRrFZZbwCWNOlW+c/qQQPdH4180BNmq/A
	pLGh6+oTMchTjTrlLDdfsAkvrooMw2QKZu2izmQ8H4wNyEB8lAowzN8jJw0WvUw==
X-Received: by 2002:a05:6214:4689:b0:91c:7a3c:22ae with SMTP id 6a1803df08f44-91ca4a0c0d6mr175403596d6.1.1793632178469;
        Mon, 02 Nov 2026 07:09:38 -0800 (PST)
X-Received: by 2002:a05:6122:2087:b0:5ea:c77f:2f22 with SMTP id 71dfb90a1353d-5ec6897bc06mr4078176e0c.22.1793631679691;
        Mon, 02 Nov 2026 07:01:19 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm279827185e9.2.2026.11.02.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 2/2] firmware: qcom: pas-tee: Fix purely theoretical out-of-bounds read of resource table
Date: Mon,  2 Nov 2026 16:01:12 +0100
Message-ID: <20261102150110.227479-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qLzdq/l3FCpuzwGztqy7qqwNOzx6wUZeD13FV3iP8dU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6KW3ng+OmAg9FvAlryl47/287Hy3gmJ0Hvo8s
 CJF9xNx43qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiltwAKCRDBN2bmhouD
 18dgD/4oL0GeGT9G4GLwasi9cAQOMH5w/KawkU0/+6UHTWdId6zyvcDzXvwzb6SFYotztZUjWRA
 VyX2Kf5lZZXkFhLUmNrPnDm+1bEEV6L0s5PPfRn2LT0nmHRxCIq//IGn9T8Rd118AU3TYO5af+7
 gWK26gS9Q8bWHJLikmFUightnMsdMZ3m3utioJHefczKNXH7UJogYX0OH6j1YVXdppnGiXa9S1H
 V1zwCHyIg/FtYeTvn9NU0ROt1p577UuTF+AqSgDiCUbhmFuDMpcBeVTpG4myyq5TNnROE57d18X
 j80kE6C3sy/VSiEjVHkiT8ut4BlR1vh0JkzNtneYZTyfzLbz/jLteIq7qKeseC290AuTRA5CHfi
 C7B/riV+lPxVo/GyHuBKgb11o9mkw6O2XRJrH4wKyWiC3+VH+DAlflHYohvSwJYTWKSqayNff/0
 pKVetZiITDbI6CLomA7l2qId48CJRR+OwVB7Z40HDtF2vT3e5A+7OGczXxiwOcoxiheXW1YcO9y
 uj952h092gZf3/ZgRGz8jPUipVjKTVWWiyzIwOjyPNoKmHi8aC6FzUR/KexyQwzjjDwwgeSV+5f
 +ogQc5qfD343Ibl+qaCRJSlXwTvvkOaVfw6DTI8gzXXinU60duivGPUgeFjelQ+9hqSDGcFyaWZ 1CXanN13vRoAevQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8a7b3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L1n7qZ-GtGzK_Ty1_EsA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: UPVrgqk_Xwiv0ndxTNKimLJ4CiB2D51S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX0VbZyB6sJelO
 GhQmGlHq5FRs8b6gVRU7d3rTJ+CS82uvzgCZt09+Udnee/AvFIDab4DL89y8IXkID8f5Q2TRlBO
 JC86ekHaTUCbrnhw+K0Reau1ETZGt63a1Tr94ydDKTKOGYhww/bSESs0p67Pv2F4WRpfOJY6ZjO
 hztpg4Y+l8P3Yngkmr9LX6qftj3YXAm4zOJOlDtXO1fAwMBCbf6x8e6OCbBi2xHTNVsiByvh6X4
 Ifh7uMRTHgoGAC24eOHpwh6XQ+UWGbN+u6n1ZtNDjhC6lFAa8TlTE0pC5WeSIR0wxEYwRE1Fl9h
 4+6TXKGcN/1Kv2t+M1l0xyWgT47FlOkO/XuSI4XxkKV7IL6Kr0vKWlbegSCUEsXQgA2OIK8ANSQ
 tHvdWXJEbrkhSJNyXSfAo97gh4mYEyiLPl4PXQxA1TBw2gsCnYX/898GEy5TyGoY5Rn1RQ4DvpJ
 3sjzXYSiFHpG5i9dGRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXyl4tDwAYoACH
 LaO4rYozC7y6bx5UzkDoUjwG8UGPxs+oNFiLUTWqlWJ/b+ikCy8oD6rL/h6mu79pV7UDG9p8PDG
 K6XizetjvfZ8NYwYIQ4zaiktZo3vcR8=
X-Proofpoint-GUID: UPVrgqk_Xwiv0ndxTNKimLJ4CiB2D51S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

qcom_pas_tee_get_rsc_table() first queries the TEE for the size of the
resource table, allocates a shared memory buffer of that size and then
invokes the TEE again to fill the buffer.  TEE can update the returned
size, but the driver does not check that the size returned by the second
call fits in the allocated buffer.

Theoretically and unlikely, some erroneous or compromised TEE returning
a bigger size leads to kmemdup() reading past the end of the shared
memory buffer and leaking adjacent kernel memory.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dc984fcd-4884-4518-a98d-9490de9ffce5
Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ba9957023ec8..cd84befa34d7 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -244,9 +244,9 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 	}
 
 	if (param[1].u.memref.size >= input_rt_size) {
+		size_t rt_shm_size = param[1].u.memref.size;
 		struct tee_shm *rt_shm __free(shm_free) =
-			tee_shm_alloc_kernel_buf(data->ctx,
-						 param[1].u.memref.size);
+			tee_shm_alloc_kernel_buf(data->ctx, rt_shm_size);
 		void *rt_shm_va;
 
 		if (IS_ERR_OR_NULL(rt_shm)) {
@@ -270,6 +270,12 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 			return ret ? ERR_PTR(ret) : ERR_PTR(-EINVAL);
 		}
 
+		if (param[1].u.memref.size > rt_shm_size) {
+			dev_err(dev, "PAS get RT returned too big size: %zu > %zu\n",
+				param[1].u.memref.size, rt_shm_size);
+			return ERR_PTR(-EINVAL);
+		}
+
 		if (param[1].u.memref.size) {
 			*output_rt_size = param[1].u.memref.size;
 			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593611;
	b=TlFLXuqGyii+kv6GLKXAwfmLpJFOPPABNFNJI1pe8/3CXYAaoQkBdGlcYZjG7TJXrP3n
	 FjtiRgt60+CUFuJGJGVtDH8M2tT4Wi2B+FWvbmHx9jWv4/QYzsQ1fOJp51ITCvBVc4SDw
	 hklj4h8ezsbc19zymxkWvkKMpfSeGrVvwIopmSBBlORCdMtRopYwHoL/SF0DM04tkX/Vr
	 N4oBFOL2dyq+H5jMr9tzMlpeYn/XEfYC0r64hzVlfIILidRRTpq5fbGJc2+pcAfTv+T/G
	 vsCb3e8ShyidJ6tMqJw7hNUfPuo6K7smaDYb9aD4jeJPLxUZo1LsrWgCh9FROKnjOfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
	b=cJy4XWfY/5PPrruWP0rrmgTZ2M65uInNL6HVGZXUJOYxYSMriQcyyzn77xmtqwX15f+C
	 HXtyeDxoHMHFm9EcOxIddXeXAD5Yt4OpmmNh8GWYEG7z0p6DFrEummWZgqBNfYFPEr6vz
	 2F3ceMnr1rB9zMPNz5asxCsjfcxhArnKY8M6eVYA4WWMUcJKbvHjV6GZrYb9KvY3LVzbQ
	 RUGXKNjs+iJPZitTz59T65OPhdPHO8ovz8xOiaXZjBetVT/LizUIpQopHtQK69TW+H+T4
	 MOUwWaoOgumT8D7APOXysHA/Kuf7lV1ZtPtyXxfdGjfYNkRnA0tAoAFOkgNwEpbROAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BD606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53BD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68g5X3142891
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yli3tMIg8YY
	gE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=; b=RTMwH1lY9MsoGdN2QnMSuTv2bcw
	L8q6DRmrYYJVtKTGsFVNE65QE1u8aji7Fc91nS/6uRWK4CrUtQEk+8XwQ5foatnW
	GeNdUPY4fZS9Wxj8V5aEVLRTDdkF0WhWsCXSz8QZ67kpu4Xrd7aCqLwLCnXjqTmO
	JdkMvy5LowrYMbP3zcDcKAUkZYd2EclJRwWei12UtN6fqBlHvS+VaoLLctq0C8tv
	zING0c6N5UnJBfEOs5bEytpTtYhulJspfTKK46vXOCXOn7GA/sI26Xyqb/TXOv2O
	j5/nVyyz6CrPbA/CCw9h13Njmuw6Sn2YVZR8M3CsQjCQoNrvS0zhJmd/Evg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29kxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so851968485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593609; x=1796198409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
        b=uDfy/x443NUkFZb5CYG5Q+CS6+/aVko09ubldf7jEj18FDjjlfEwdjqoqvuOWQt6nm
         qQYFLov29pSDxGW8lWlGne2TFF52nJn0NyOdHyT2umu988h7gf8/F3MwL2gKEma9/Bq8
         yrDG84LNZzAdvJm6HOOO+9BCRWX9MB1UjJeWE1dK0LMEuuHN4zl9C0MnkTB5+/o7RlYC
         fw+zrtas2VGRgVFSjzYn0Jq6D+jGKWaus7zzCTSgfRB2BYl7EvdE1dA0C2tPlf5s1cI9
         chITHfv9iV/j1kP4E2TvAUVo47OVCdsJCYT2s+L42YFB5MEjTuDczLKHQhQGIDnXE9Le
         agaw==
X-Forwarded-Encrypted: i=1; AL+hErFu7K7yGMib/0pVUQKEZE7/uIr0B1MgXiBGkyjXFU/dUef/fldMF7YwN0L3LvNtzKxDVrTS448rJqh4/Yeq@vger.kernel.org
X-Gm-Message-State: APuU4Z8W/QxUmZDES8Zw3BNYB+dU89AqhOoJ/r6Dix/ZdX50JXbM/SH1
	vk5R9xIeo7pnEPtqvaAzIFR4hP1J6Jz6dkIPqs5ygK+fC9p2khrIWDysWg1QStLgS340/EU6f6B
	1oaqe/L3qYrF9GPRaQZIpysX8r0vdpToJya5Pf2qoAwc0vaD7b28QimU99m44Z7i31D3Z
X-Gm-Gg: AZFdTZdXrExcv/d+A4ni++UBDeG1FJDmjUeEUQK7rBBC/jx+4v5EJxSDdjm4/29/GAl
	c1oI3qI7Ryw43wmWTehxCtENvH5i3omzbp+awCG9vfpPm3NLlKwmoF83NauClCY1EfG83ISZ2bN
	YEDL5dGOTRbDLH+4Ef5VbqIQ7sgU+KFKQ9V5d8MS9DOiymOTK5i11PtQ+4NNMHzd3lXoKeHh+RZ
	gIUG9j7EKNmD/NSqDp22/PunUz9k8rZVA80uUfl5CzeZy7vhRGPRcLVP9fez3bZ9gU9TMmKSzct
	OIHvGKDg2cECTXkYHZCYhWCkiiOpALfGdskYAIRCzJ6xZ/2xZGry7KoPukl4LleUZuu4heP7K09
	x2jAGPtcYpq95CtAyXCCrLi7Ts1QNi/48
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058993485a.31.1795593608844;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058990885a.31.1795593608386;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:07 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 09:59:50 +0200
Message-Id: <20261125080001.2540101-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069589 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=XpAv_gt5rlBVVRiKzi8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -uAu2wsINd_KbsHGT7sMwWXVl0lr_LG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX0PD8oL9qvsjo
 Fv4LqJ6TnPkM1J3ikslGK/DQ7XHizA31qoz67cK6U22lUjsuciNPsSICw8gG44TG6lH/jDiddYQ
 UOolD+mI35tjoPzW0y3xfRZZ+WMys9+ymcdwuIXqHyoX7CRUuF2YaXx/KjLpo7b9F2IdhhNE5F6
 6Z3ScTpBDf4YisuVTA68HvcCka4gsVM1riCulQhZNabXqqxdZ1qjhxTzJ/fu6NQKO2uP3L6ZaJn
 LZlh2xZDm0qTEgB6gfEnvOYvhh1R+GWPu93ol4t8uuueH6TcrIYVGk41p1VsHMENRB6PcyNr6uX
 aPFB++QLC4FHJlAkJdKU7KxZBxAjCRmMJQvcjjNpKsLjQH/Kz71vE7kz+NnuhX8pyAYQEwHbmG7
 8uq06FUK0UymJKLxAumzki9xCt3y2hRdT214/6x0erpuipj8N7IstHhPhEO0aSJpkniuXgxGRju
 r0ZBLTXUI3MbKAjGDhA==
X-Proofpoint-ORIG-GUID: -uAu2wsINd_KbsHGT7sMwWXVl0lr_LG9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX431htksBCfY8
 fqgEezIoCCA6+TZKWMyjwspLZ3+YzNf6v+N+FYhyZk3aZyQzgvl30KqMpdgyIJrwHfTIvyGaqZs
 F+KzlCJiYhh9bvLXvvwwfxq7hk7vrr0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1


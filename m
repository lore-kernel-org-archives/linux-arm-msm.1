Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134133D9DBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401212; cv=none; b=O78+oHd2IZjGIKgEt7js0tQUwEeob9OlhwBa2PfD4iw0sWMMdyYa3vaKzeGg1bjySij2SPHB4IPPGv6XMulqUzB9owvWXYgA1ruzoF4Qw3jmWZYIxQwFFSGzjeEvNFozdl7ioUa5B7uT9MIsFsm7+ZFt3/Ivp9ckpO8rAsWCZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401212; c=relaxed/simple;
	bh=kEpT7JOAcpBu14vBhrngIbFyf5YMRB8P1RnhvDcMLKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0mj/KiSIzl/8/02mNMdbgv0TX1/sBjZjmrhb+zQ1ysURujJWpTq1NPAtXTmqPai6+FjvJRoVzhz9ps8LGHr85D1fhOzTm2iozoHE5dvU1pM6q90uDuLS//YGhzyNPAvGCLHwo7W3xfTJtOUr2fnDyVFMsA67vv6kXBUAMX11+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHVm2o41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUV2b6Rk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHVm2o41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUV2b6Rk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8IUOG506213
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XstywuzwXoUprWLZaDNLg8MpdzQ+R40uX6Gdvhg/RSY=; b=hHVm2o41pNsG2Kaw
	lXFofkVi6D8JZMbV7jHfzQmxIvDmO+bRcAWrbFY9EMIpRGRCoalQQeMKkN8toFx8
	0RlJgMR9MskGnW2Aa2E6em0yvGKBKRewV7+eBc+4ShfcturkgZa+dQiviEyGmaIB
	iQ9+PPb1n+USLvDMHWtBFwlAWo7CGLGsX37G00vU1Nd2CjuDXm0bQB7qvAfoRNh4
	KU0ww9uYsmuSqbHbvbORzA6BSBnwCJdAjTtXVYOgyXik0HZuMBpkzsPPGOLmEe6k
	rlUWOoqh26XbJEdVtv5FO88+qKygVMbcA1aA348y+VLPyhdSIxEGeyx/zz8bdDBE
	g9VQ0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3040419-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:46:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3342578a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401207; x=1786006007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XstywuzwXoUprWLZaDNLg8MpdzQ+R40uX6Gdvhg/RSY=;
        b=HUV2b6RkoltS4T2B+N8SoBEEdJ1/b306+a18VxQPGZ1Ol8SDASluaDdVvpwoq5f3Af
         0GByygL8ljVP898CHCtSYAcsH5O/lbDsVUFo+MSVTVwgXya4lcS+L3brdVd/6+W0EG/C
         QLXXQYGh8kZXjoONkUFV8YjdZiijZJ+wleiKKNJ0I9KPB1qEiPtqgipVd1Nk2Mtbz3sk
         tbqJ2jHRIaWbGWCLpc1JDFXKraFn5eUdEbahmM7VzNDJzJRFY4Rgfoqdqrn5eLZ/j1Ym
         L8e9582c75HCq9BA0tG9ucQuVSmwZmuzt3gLb2yYZyFEljmrzg0T6DvMrD4OsVBvSToO
         7d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401207; x=1786006007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XstywuzwXoUprWLZaDNLg8MpdzQ+R40uX6Gdvhg/RSY=;
        b=nD6aheNCFGmCNBwqixickGWufIPMhSVO2gNUDLfImMDj8dtenl3aCq6WgO0CDMCQIl
         ohjvRHkCKwXB+v0lSLyOaNJxtW//21a28QRXljQJFEKjNdTFD1Vgye7STZDfU0adzt0d
         oQ9ft229gpdv9TS4vw33m3mAUk3HkwMiiu2Pa+Us6f+yaxYrTyZKIqwuMGrEzy5VPq1U
         KYu5FHWZ40b5++vPrVxHOnrziZBe2Bj8e+HjHmpNoeo8qChvFO8IvTNRXW7Jz2OOgdnx
         l2s9td412zM8H9BJhtxifkk/SQK99N6RWkUT2aC7GfKB6b32SGTl48VO/CDuwIhLrxvS
         WI9Q==
X-Gm-Message-State: AOJu0YzPTWobJXHfSzG1Ol60kOCs6Pkf3swa6Mx2ts5/ST+VUa47kcP5
	gqvoeRE60EqsQNqCUMTP2vuSlNim4SFCcOTnwPaZUgdA3pwExwuqDAdlFeS8ZpAaZKprhH6pB5T
	4jdgISiM3Gmj4UKmJQizPNp6kNLRy1WQcVuvGY95roA3Au8KlZRAzsfYO4L1Dl0Cei7tN
X-Gm-Gg: AR+sD12YhxZT/KKk66ILIXMO3cPS/+rDcKpeqw9ixZnSJqB8ZMPZocXfy3VTaJq8+d8
	rY4iWf5hw9HpjRTu6/+yofA7dCWFt5IHGmyKnEoHGz+3ae4GFEUe70PCLkZ7eXHRb7uUMflKcbu
	6RI1lmTEGZSKtZKXmiVILAeBG+qstkUyaEKhHdBz6RWChIpV+qR+WH2i5Ovr28j7rEZd2Dh+dkO
	GlIaAYttVJ59t91WlHd6Nxa6C7pahs32DGwVFqSBHA8kmUlkRfiCv7TO8Bh3MQopTIF74ibwbzS
	9wtdcjrjFyzs2UK+lKtPazZpVz5iu4moSkg9vlh3+RvmggD6Vga1mbJNyc0kYGRmSrQVX5Yq2kE
	BPj01Vc4JHtF1DMKosXQNxFmpR8iT
X-Received: by 2002:a17:90b:1641:b0:37f:9ce2:348c with SMTP id 98e67ed59e1d1-38f9bee60d9mr1570901a91.29.1785401207423;
        Thu, 30 Jul 2026 01:46:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:37f:9ce2:348c with SMTP id 98e67ed59e1d1-38f9bee60d9mr1570864a91.29.1785401206817;
        Thu, 30 Jul 2026 01:46:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f8150f674sm964480a91.3.2026.07.30.01.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:46:46 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:16:24 +0530
Subject: [PATCH 2/2] soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET
 macro with sizeof()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4b4-removed-unused-macros-v1-2-2883fecb9e6e@oss.qualcomm.com>
References: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785401199; l=1324;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kEpT7JOAcpBu14vBhrngIbFyf5YMRB8P1RnhvDcMLKk=;
 b=Iq4896AQEqduEzNBwaHC+DBm1Lh8xyL0ZiSayEMSpR22s+290V56ie2cxUTykfSfwK8/yinhv
 lsbYSk9GuGbBp+OkixPALAm7lWk35bH8I9auRhwiuUhlTgl97n/o+mP
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 1h_R1epU4m2ICiTtonaH7uPy30ospRHE
X-Proofpoint-ORIG-GUID: 1h_R1epU4m2ICiTtonaH7uPy30ospRHE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfXxm9Ih1jVlAdT
 rkaBYUGVzHZJ0t/ZsKkhuQw28fCny3MOtOHyU0KXyTpS46mH7uHTGkDdeCpj/RfOwSNiW9K4Ncb
 esyUmShCpKz9vQwQgspgxKVLETtq1PM=
X-Authority-Analysis: v=2.4 cv=PtGjqQM3 c=1 sm=1 tr=0 ts=6a6b0f78 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Krqn9PN1B2jsHjIjwrAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX4TKEQUiIEKWP
 tbQx/eGLW3oqSCREPdJzSQZfOcw7xO7xX8j/UCIgPgmUiP9IlOR6dU1DkIemqWT/iVfQa4dci1P
 XeoJSesEssw1Nqvc18xxZ3N+V1SzNI2xSr0lWSTQC/EbxisqT4yGlII6qbNhJSA8NkSjJQWg3On
 qKwRR4n2Oh7mqXa9WPM3Rt2YzA/W+dC1lOeFD1TIduzsAGnmcUFNJ0AkaR5twIwuvqO2Qq237GF
 GAQrnGCViVeZwTC3dIdcs5kbqSwgGYpd4zhTRT+glWbzn774xD0GA2dcEyBSMimSWP2P1bBtD7n
 tUF7uV8PQ9A3y98bFklfvXPfT1MmjD2vly8M0IMQ9rjkxhXw2hc/FQp4U8C4tBXrD/b72ug7Oj2
 M23wAHvu/SSVjq1XGNDmt3a/LCIRnCWVSGyG0bFSazy+r6hqoniMSbLR1UFZmA4I0jNquhIMpJ+
 O6mZIsLDngjndKtDZnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300063

CLIENT_VOTES_OFFSET (0x20) equals sizeof(struct sleep_stats), since
appended_stats immediately follows sleep_stats in the memory layout.
Replace the magic constant with sizeof(struct sleep_stats) to make
the layout relationship self-documenting and drop the macro.

No functional impact.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index d9c811cb9ef6..06923408bfce 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -20,8 +20,6 @@
 #define RPM_DYNAMIC_ADDR	0x14
 #define RPM_DYNAMIC_ADDR_MASK	0xFFFF
 
-#define CLIENT_VOTES_OFFSET	0x20
-
 #define DDR_STATS_MAGIC_KEY		0xA1157A75
 #define DDR_STATS_MAX_NUM_MODES		20
 #define DDR_STATS_MAGIC_KEY_ADDR	0x0
@@ -135,7 +133,7 @@ static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
 	if (d->appended_stats_avail) {
 		struct appended_stats votes;
 
-		memcpy_fromio(&votes, reg + CLIENT_VOTES_OFFSET, sizeof(votes));
+		memcpy_fromio(&votes, reg + sizeof(struct sleep_stats), sizeof(votes));
 		seq_printf(s, "Client Votes: %#x\n", votes.client_votes);
 	}
 

-- 
2.43.0


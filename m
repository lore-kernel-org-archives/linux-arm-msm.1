Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006864756C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846921; cv=none; b=SGeAvUu/yLFSNXVERCaXZJtKcZ6gEN69mX2eFSwgtDbNE0ODKtUnH58nY6I7yVhWTczUimAWutMpVd0P1sHtf6YIkCxVBre55e4D9fb65mIEwKVSGt2tC/N4cS/4F62TehauSEPaEdohhV8fLr3Kyv2dLU3pNFvHfdFybUnThWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846921; c=relaxed/simple;
	bh=XzVRSJskkXzsRQMCF0q2XHzItKnQaDkIqK2bV/uMi6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOqMKEMRGb2l9g40lQvJbzfjPi+oJcS0ykVIIAVklF2ZmHpOlJVFFt4RDJ0xcjcz/XjUNUgikwXtcL96slUUSjgK06hDJsTOmR4FKvjwddz6VV4xCDWS+9oVpg6RFI8L5OtkMDcFNivD7ceD8ntE3NV3pWW+dxNsZ1NEnvnN4RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFwTjd6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AA3FoCeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFwTjd6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AA3FoCeH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbw1d866434
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GQuf/V68eCT
	XXH2b/XlQO3XYqlyP/kTHk7utlZNkRig=; b=oFwTjd6O46+rn3wQuhLnjLfejRI
	JzlkxQSt3yFeu41vHuEDRwREWQb/MqlkNuVm1K7rXRrb1LnCdn7kasEpR73XcA4I
	0RUsK5WYrYHBR+ekT3kOuxUJTj9DvpOV7EJQJZ7kZTPydi9vTE5SM5FJFJaM4swO
	6cx951RiLv1XwxTtlcUdL7qyWC83c9a0lrDN9Ro7St3H1fkKn1PDPGNdgkyYf+n4
	0I05RdmD/c3T6KmB5Jo2tG6ZNq9g0uOiMJHwGomEX1zaxpZNwDz3WJFIzCPUKQC5
	VUHQzo0KHoD6lNydXTaSoa7h/p4k7EROq3txUc2+bYHsHO/xDvwP/N2vM7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8m8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so142843a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846917; x=1788451717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQuf/V68eCTXXH2b/XlQO3XYqlyP/kTHk7utlZNkRig=;
        b=AA3FoCeH7dxuQJ48+dwosFA+BhbwWawGmWUykTFGQBnzYWVC2BXXuYGCoMXzIdHMAd
         0O/krdfMjswvRM4U+AO20cSdc19SAEAzLJ+xIjSevpq2iApNamWMn2whspBAQTs8SuWt
         sgRFrXb1uQ9vV0hlxdzGe+2YnAMr1Z6X46wrwWGw4WVCJt2Y/prPiVz9TY0zHTAZFAgK
         LlMG+swC2MfVzfi0ZFLDucLt9PQWfsUtfMzvz+VXz/P5BlYj5qGkAnGtF1f+Blk2qtZy
         h2EIAo2rxky78sUCVI4/pmVuBU/3v8l90oQRugv1ILx0vQ5qG1caB+XZizNX50Ts7l0z
         KrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846917; x=1788451717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GQuf/V68eCTXXH2b/XlQO3XYqlyP/kTHk7utlZNkRig=;
        b=QuftJGpUlFABGdyzJ5tEqDw8fc3K4B/JSgAjLdDcNeEUzUKypbbkZnTUXJnaQxArIJ
         Y/4Yk6zgyzpUJITaso7s3UHwRUmh0EIWX9/KbCoh93o42AP18yfJPWtOA+pZE00uemDC
         /SH5HKGUFALwH46n7c1NunH6wfkrpF4Ch+xb+eoSY2oJ47D5/mq+y6/2exnUY4O6eMSf
         RnpBw90s8vgeqL9oqlW1hbFf9AfolW1cSOwDNVxYCRKMwIFm3vQdFJcEM1S4cxkA74zC
         AQ2JJf+XYseHqt4Be4/wEfeAbwRZdJOh7pCFiCgnTp6AiBz9SSw/q44E6m2l7pG1Fbqa
         IRmg==
X-Forwarded-Encrypted: i=1; AHgh+RqiSKWPsaMskj3a5VYPHLclq7QI0uB/nCfzyb3th5Lu7StTo800arVGSWQwYKNOggTposx8LGzrniXaMtIV@vger.kernel.org
X-Gm-Message-State: AFuF++kc0T0PT3zFpyjcDi6R5esZK4nhcgJGiFMRpv7sKp2gl681xsRz
	MO+v9G0bJhPRtP3EOWNWQO9Ii4CZCSMz/zxyQaHN5WDTy/V9iN54y0UPJs58tmzKp5X2Dieo8Ib
	Y6HGm9WMvNTsoYNXKxysbfG/gamlJC9VPLM9vElV616oncp2YK2il9mn4s8ynf8UQmn2Q
X-Gm-Gg: AR+sD12XMJ0m1jE70Rk9OWV/6YnP2X2BbxPvF8rjM1zytUxkEV/LuG3yhjBJjX8q2Gi
	5qdNbIPaYB0TxzHaMYEQi3K764IzuDOIYyJ4kkUBofe7LsVknzLC1JrVJoOGovtaFfGeB0Bk4DJ
	VO8NIAQ8oaH8jI0rjquwWQLaB/z6VxCCnxmbt0akv/SuXbg3eRX0pnB3o4e4CRNmkNFrRry/bDQ
	/FNlPdVQ+1kroFvE3/bDqewUiH9IPHDPmWint68XSGA2vY4/bo+D0aOYSu5k8Wfg9I9cUN1Tu0t
	5fl9Z+bf1dXFNRyc0vteKzSr77luRvjpxKlcbEtV/Hq3UOeIN7yiN++6Dq0KpaxdYOtC+dJwkGz
	0I7T6aPR/LceKD+g0PpUglerFn8uLpvImpaPY0xsxGcrSotrF7oKLoKHRRw0=
X-Received: by 2002:a17:90b:51c7:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-396d0f52b2amr503445a91.15.1787846917350;
        Thu, 27 Aug 2026 09:08:37 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-396d0f52b2amr503276a91.15.1787846916655;
        Thu, 27 Aug 2026 09:08:36 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:36 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/11] blk-crypto: move bio_crypt_dun_increment() to the public header
Date: Thu, 27 Aug 2026 09:07:16 -0700
Message-ID: <20260827160806.1295313-8-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DH0cw-7UCah1n0IgJJ8Yyz9lnZ5Aa_IB
X-Proofpoint-GUID: DH0cw-7UCah1n0IgJJ8Yyz9lnZ5Aa_IB
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906106 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Dog9NmGJ06mbJvtOeFoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX5y+oZ9RefV4e
 LuEpnWB+tUf9uQckz1aV0PX2UyvnOxvk0911y8+g5QsNDQ4RcCf3dmRA3dIkIc45FErbSVOCXjB
 NbXsj0deJRYvT5LPoCuVggErZQKp0mn9+bgXec/nmkekLhcVJQk8AkXmE3yKxtul0q70bqYOESB
 n8E69RHLZX/kglT3bf0++ZRPs1r13N7JQdr02e6hptPZNPlAigMgZ9afJ5TuqdF7DFLTfK0g76y
 tTDvsRlXpyWqd67X4rqYusVrZKyGiZh1WeIBa0XzdwcJwTc5ho+E+TQo87SphPDY9abagJJegZa
 U0zlEfHHj4b6vXAt4gkG1MJh0+n5xP7uhuRknaUxGQik6rKtr3edr1yIbpQi4KutuPZDZRnGeKo
 fcifCQ4R41fS2ySLuifgU/hjCyEfOhvxp1dWaNaG0J/eGitF/NVwhxdvXbxKBWL1wKoiiHqD4GO
 QK3kq4rw/FckPP+nKbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX3CowsUP27IOt
 bVoeyQspBN83B+3eoo8izg0FBt41pG/7gvR5SfI8FU20W4FNNc8yd3Ai/lHt3KWcz8EuBDHwxyh
 u5HCPAs/TiwEu+7pvKVB/Y0zRiEcI+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

bio_crypt_dun_increment() is currently declared only in
block/blk-crypto-internal.h, which is not accessible to code
outside of block/.  Drivers that manage inline-encrypted I/O
directly need to advance the DUN across bio_vecs within a bio,
or across multiple bios in a request, and have no other way
to call this function.

Move the declaration from block/blk-crypto-internal.h to
include/linux/blk-crypto.h alongside the existing
bio_crypt_dun_is_contiguous() and blk_crypto_init_key()
declarations. The implementation in block/blk-crypto.c is
unchanged.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 block/blk-crypto-internal.h | 3 ---
 include/linux/blk-crypto.h  | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
index 04035d237f03..32c720aabba7 100644
--- a/block/blk-crypto-internal.h
+++ b/block/blk-crypto-internal.h
@@ -26,9 +26,6 @@ int blk_crypto_sysfs_register(struct gendisk *disk);
 
 void blk_crypto_sysfs_unregister(struct gendisk *disk);
 
-void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
-			     unsigned int inc);
-
 bool bio_crypt_rq_ctx_compatible(struct request *rq, struct bio *bio);
 
 bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 33ae52b77522..c9f436b6b2ef 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -181,6 +181,9 @@ bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
 				 unsigned int bytes,
 				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE]);
 
+void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+			     unsigned int inc);
+
 int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 			const u8 *key_bytes, size_t key_size,
 			enum blk_crypto_key_type key_type,
-- 
2.34.1


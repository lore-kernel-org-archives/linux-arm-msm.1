Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A63B9930
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602399; cv=none; b=WvJ+Mh+/Q+NMmJ/jGMjQSdha7BH+DbfgAHiwD0lOqn4nsBCqWqa8iNijabxG6R2N9gc6wd1ItCmz+mnMeUx+Z+8Gc6WZXxx0/m93QPWISZZirWtc05ycuDPffOK0tMmuJFBq6tl21RZHNeKJse6kQ9D64KXpRK2IcCEfnVb74hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602399; c=relaxed/simple;
	bh=m+S2Wb/GQM3li+G+nRy2TZL7nsUJI1fXaS5AK1540i4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lWKy3GgODW4tZNy/9HTuF8J8y6e1PPzaylIe9og7ol1NvoH6UAq85GTTEsrrqWwU21gPuZtdv6kHOj9eDmvau5coCn7HSoBQsqewhQMlg0DcX2gectqeowvWCPA/au/e/zp+v0VqgWrS8iDwYAg+yzryOnVzqX3X29qSU5t0L8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4R2ry/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu3copte; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4R2ry/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu3copte"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2phYJ4150800
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 03:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2zlln3P8lcieIEn3wRf+R
	ryqjGxD9/bf43zUbyP1Zs=; b=h4R2ry/bLzd8jXCsFZ8KF0trrNuQjNvTJJrnGw
	Z0nw5LFGzOgTU/aB+5C10TnYXHR8ZiTkYaI5IkZI2A04pwTOZl6sns/xXI2NQW9r
	j/5bx27q0uJwLBKqTO7I6vsPXYUasaGzIRYYpaEOgY9Knm18bzuFd4Jxd7o6flAg
	/kbj7ynh7O5q2vMre3Ccu+RtoBk//eWwPxS6oo7uzx1jvMORq2lA0eAgi0W1LfeC
	rK1t1WNhzKQMvzsriOI9LNwdjjvQM9PwjRAoeZNN3adELMkQUhgBUd3hHGRVO8WT
	SH8/26+T2CMhbo48VdmTFqP95cgc1Zy5AVxORWKHXN/yBcjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxg237-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 03:19:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so654527eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791602396; x=1792207196; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2zlln3P8lcieIEn3wRf+RryqjGxD9/bf43zUbyP1Zs=;
        b=hu3coptedlSjZchKWHFpJxOvpPD0Ha47PjT7zQviS3HLRQEtvAjBkRUaaApSvwiBIM
         KI0PtA5041Nw1fz3b72hMOPXWF5cw6pxnX0IFaGkUdz1dalldUE5SnQmCisDXIb1xpsT
         Bk0puXcl+0TOh7jujiAepPObAgAeX2nOyYm7FqnAAy/t2SXmeriT6POzFLY6wQY7Mhrb
         MtHVe6R3fHVTVwudgdYgDhvh+befjQfmpBukbCScI5Zpr1A/3poZVLfo2rlXJpp3+oy2
         ZO6teY999nLW6nsWD1JNIZ7VbIdJGKk912f5FPogMfD8ke074PMfo40G7dGzAhxyTOkC
         ghYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602396; x=1792207196;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l2zlln3P8lcieIEn3wRf+RryqjGxD9/bf43zUbyP1Zs=;
        b=RVo/3W8130gikd/PL0deDLLjGWJXh4RJZUdjtUS/XgVYLU+fsKMAxklKwGdwj7IlX8
         R+7ghyqHpMK1G1vF65KwZpI8O+S6YR1nktox5dAIBCj5KAflijnH6OiamSBjflK6npAh
         O0wOdP7+oPPiLMRqs8sEpMS7oYJrZhISnjUzLpv6QgXXaltOamKFQJKARcvFQzUAlR4D
         10v8dbgLZXEQr9lSWqI0K5AuCt2pLRkT3s2rkwnbE/nCwdSREeVXb6tZJp0m2AP9qvQt
         vBI2i5fc3UGHLk7re2q21pyIGIyWwmxrfpf+q+4LFOh2JgxzOyRqsILl87MlsJGEcrVV
         7ZWw==
X-Gm-Message-State: AFq9FYLIUbgRDS6SByJJYItLx43tVIKmprr831M4M6Zyzg5EjxlICCew
	qYBq+bOWGnmrWfznF+0OGCt7ForIL2BIqe78wL87Jjx6qmBRembcmEfH+0NGppkjAZBmarbZCS9
	7CdDGG5rMSsB3o6yFRBkjuoMpEZB2bRCFHvA6t2KCL8cnINZwSzwC9HCQDd0aN/qAyNf/8chjFw
	8=
X-Gm-Gg: AYBFou0BsAGQuh4UYcw6MmD/o/1IeWvxJW7DzxwummsRNUs3aSSyV/EKB7EswBKf9BX
	v8j99ZSz5fJbRuPEiPoZ8ZwDIqef/bI4aCrfvehWjwKhjgW1B3L885bHZmX5+410azkh1qfLYJv
	68uvZ6t4e1ePCN62ceQ66kOzDewc9qF2RkXvOxxYjLFwSDCpBaCjTKVDD8X29IYWOh7Z7tgGyEe
	LsEphcL1lU1iZg8FR2hCWnlMmKVRPejURTIQke2L/P8lg1FPX2Q6K4B9EhsT2N69GTAnAmEpejK
	RSDObLV+Mmx1ghTeKHfpXU+y/3+klOYHUX56kIFf78USq62GoUOuXTIUKMI40uVvre1oUgVgjzX
	fnumWtcZtnyAYfuK3cTYJNDkVsOvrnripX5/9tC/aZlaxl8F2pdje8+IJKBk=
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr5090025eec.7.1791602395433;
        Fri, 09 Oct 2026 20:19:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr5090003eec.7.1791602394879;
        Fri, 09 Oct 2026 20:19:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm10127579eec.18.2026.10.09.20.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:19:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 20:19:48 -0700
Subject: [PATCH] tee: optee: allocate a bitmap for all valid notification
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANOuyWoC/x2MSwqAMBDFriKzdqAW6+8q4sLqUwfxQyuiiHe3u
 AwkecjDCTxV0UMOp3jZ1gBJHFE3tesIlj4waaWzRKmSB7n4AHhpL55xezZq0L0tcpvCUMh2h+D
 8y7p53w/LrAnQYgAAAA==
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: xOcnl6Wc9LR_toahwDCotW5Jti9AGEbN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX/BaRc1y9xjPp
 CQkNP4sB2UXnZfFWIX7WD2wsEvRA9hz4eRGO6+G67/kcV4WGFAmOyR+K8L8wQDOZNuFBH/knMv7
 5vxeLoDr+7XOEjuVyjY26WYsVEwL6FI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX4foLdcEOSqRI
 7hOEjyqDnBpXNVolBx7MjgtpWOguiO/H9LZv8Ne2O4W1KmKOSKU3ACsfCTfyQLG0/PXyzpXYnW0
 989yZxNCQPPbNYw8aMKZkYkhfqFSOGrWJru0V42gFPGPBH0qRfXE2RAF5kq4xiD779NBHtDdBwE
 pNAk636HXOdDGRO71GUvAhrXGHZAbPe/1TPJe88QO3r9E4p/5VWjoZPXvDnoG00iZF1kNIKY8ML
 pB4ZlYdM/OmfHUh961munqZqtao2Dt4JFlk2r8TyCAwOESB95A8jVQ0nzwX6FmLFgfzNj0XCsuP
 2nT+w+gES1ZPl2UuFh29+/KlDmZlpJl5ggMok/lnWkvt2+nlpGn8CtdJJoc0sQynmpwvkks8HsL
 2KFUOPNBrw/tIamHy0VD8aNK5ZRhhbUqGITelbT7dXys9AExqSQN4U4UcX6Jer/rEO5k68rrHnV
 yLdZXFo0Zv/0PG6PzXg==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6ac9aedc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xOcnl6Wc9LR_toahwDCotW5Jti9AGEbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100012

Notification keys are checked against an inclusive maximum, but
optee_notif_init() passes that maximum to bitmap_zalloc() as the number of
bits. The bitmap is therefore one bit short. When the maximum key is a
multiple of BITS_PER_LONG, accessing that key reads or writes beyond the
allocated bitmap. Word rounding masks the problem.

Allocate max_key + 1 bits so that the highest valid key has storage.

Fixes: 787c80cc7b22 ("optee: separate notification functions")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/notif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index 68014222d7be..2bf5ce397233 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -114,7 +114,7 @@ int optee_notif_init(struct optee *optee, u_int max_key)
 {
 	spin_lock_init(&optee->notif.lock);
 	INIT_LIST_HEAD(&optee->notif.db);
-	optee->notif.bitmap = bitmap_zalloc(max_key, GFP_KERNEL);
+	optee->notif.bitmap = bitmap_zalloc(max_key + 1, GFP_KERNEL);
 	if (!optee->notif.bitmap)
 		return -ENOMEM;
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261009-fix-tee-max-keys-50f2db87b4e5

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


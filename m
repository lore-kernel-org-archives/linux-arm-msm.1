Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12849446070
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362706; cv=none; b=PTtoDelX7EktoCnEKD0Xc5NPtV6G7EhkzFQMw37ASuJQMxmaub/vH4snywrK9iibjbYideJaO+xoWlq2EoZ8ZjEkppRr8WMrN/MA7Krh3OMFADrPiAA6bV71Q4fVlieYzhBkk/VJKLU7ouCWKJQVTF86zJZIAOcKjaNqA2+KKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362706; c=relaxed/simple;
	bh=roGZaZ99uCnKKTamWoIkIriGwomWEy6esyHVfz1dG7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SpFEGBMS9xh+8ylR9y3o2Lu7p7tjEGmd8uGF6Ow1KdrXKRjzCjmsiM/9WRhqt2w+eCr8stVp+mRTBGXj66ys8wctTLCP2DNLVU0fBIn8Z6H1JCiYGD4akrFQjhxdGYJA82eJk8Z6p2MIw+M4f3mxVd64vOWe57Aj7vKbMd4qDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogUkvGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3Mt0Rso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogUkvGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3Mt0Rso"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jm0d3686144
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlccGoJu5Sh
	8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=; b=pogUkvGfEg948zlTB2IBNAzfnwn
	aDMDoyAAnvFd1u62vcpjdOQQx0m6pcBiJjA2nZBQ7+5xkexUKkUvowpaD5xBwDFZ
	AkiKgl+f4Zgp6Ja2bIXyrC/t6t9GtZ3AGYClskhnrndSqa9QusVJQHgHtEjQL/tq
	Ivk5xTjhdIRY0rVM/LP/smG2FHlEK/8K/eQwjx7RqGa18oj2wIwwg5SnzpHakO6y
	9UI6TU2eCVUvUm/jicNt3gjP092A7GsT9OcxefOlXkJH60Lz+FYdmsJoSu4CjakG
	47b7Wix6i/xB2+8Q0IsqU3Ae0ycARKwczjHVBNzLhU4mS9a2+BezVmaS8Pg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609a6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:45:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6078116a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362703; x=1791967503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlccGoJu5Sh8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=;
        b=D3Mt0RsoqJKS2xjuOcpAaYUtwzofRwRzPfzLE5SaXFwCY7AnSDFl8FUqKBA91ZL+cq
         tADRI5r83LdE3Pm1KCtgbyVQob9Fuv/1GXU6IpD50ABlp7c4907WCv7+hbj8buomTMTo
         Dky6lpatEkrGRiJBG9ZkDmCzME5k9aizcUzP6G1QyK6EV9EjAq055VxuPi3slocPgp71
         SXYllsOM3g8dQ4/r5BY5+2IukhrUdOFVHJHVhlo/HjjAx2HC8+yeSvFqyomn8pwclPNY
         93nUS9BEXUaMq40vP+cigZlGgZP2pPz6Aikn+SCBbyMYJTGTu5tz9a1Pv82SIUHe0y+L
         l0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362703; x=1791967503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlccGoJu5Sh8UcW87OTOUg2Yc8FQiJCvyD7DYkY7fd4=;
        b=WnXQgr/y8mEnFSXDgenGgZhY3sJyq5PFi2zxx34vCsBMYSF+wEIxamxqBW8lCrJMG7
         lP7/3YZuymfobf9IRqifR+0lxHrOcl5vXK7aF6C0iOUcJPCwPPLaCdqBNBCIwRStFnAo
         4M4Er1rzPDObqHhEvc1/RIbRZw5/2KsTUClWEMNgb9AQbWW1JSgPfM6DlMGtUKNzVM8K
         IRyvUIx71al78r+LJ/nJ/m/nfZRs7aoR4j5mTOPNx2Ynr4KMNSsW2s+0hyPInMbghoF+
         ooYBGWR8CPHzgCvQgr3tGX59iQgeimeUsG/nnqTfCvidSlFhZmTVHeAhZXwi9FtUfafl
         Vxyg==
X-Forwarded-Encrypted: i=1; AKwUvBwlm+qJ+xNdtozNQIFP6RMhXmsHHVUdQ85i+RxAqC3D6F8OA9zVZ5DLqXkkZvazmDqfMlJf9juNdokDYdLE@vger.kernel.org
X-Gm-Message-State: AFuF++mDrNo97nokETfl3o+Z6u7pdhXJ6fSchxPqlgXTTwfH3NVmbYzr
	ym+5H7B6p9cmOw71Uc+K1MzQbg4XyvSDnKKBkZBePqnvAe7YoiKaf+TuD9/+4SnZonQtecD8q2i
	V/9ifIUX8hgIFrcHGfCVuVaT0MTVbbKtXS476TYBxuS1gArI3qKpGGgkgW72eGSEo9b4H
X-Gm-Gg: AYBFou1HOV5AlTtnGyWY+0YBQLgb/JWfR6cPMwvi10KzCT4n7QfnRy2QZ8lV+T1vs0G
	eS19av+ecimBS2Xf+I9La8C1SwoMSqVEurH7dtyBC/bHXv734raw31l7NX8nGsjr1WDIsgdBv1f
	vorAxnEhafhN8ndU/L7Qvm++Ovrbr0DnyBTfV012e3Tc8nLxo7gfvn24rocIin1qWAbth3HuIZS
	9mBRZpheMYJuih8AN+uRyKQzQLCgQNVB4xvxI2/AOYnT53/fDuq71tj+8IAnbI3uxQktSoNfs1K
	h4lFimsmeilhfjrzOnyPefA3TTdDEDd1BrPm0h3EE1xk9aYDdr4oygMlZd9+W9d4SMPI0Dt24Xk
	cQqBiVe8EB9eCjB62UPFv11rbgOuak8iyNaC3Q9DuAUcnXoaME/6b2PsA9VNHbmOmbkfWLjg=
X-Received: by 2002:a05:6a21:32a6:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e1340952e6mr1635443637.43.1791362702884;
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e1340952e6mr1635424637.43.1791362702508;
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:45:02 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 2/3] misc: fastrpc: wake poll-mode waiters on SSR
Date: Wed,  7 Oct 2026 16:44:46 +0800
Message-Id: <20261007084447.922-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DNIIEmQlanTlbPmD7RcOiwooFNEEpe8f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX6FwkDX17jIfT
 HdqxmI4DMr5BqAnRm4qMmChJC0jx7R4ht4EnrvZT0bXJaRDDdEmhw5AvedocYVgIgJByQD4+XU6
 lOx9TSMT/rkS/LcVQMPsn6Qf9kAsOoU=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac6068f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lWAaA6wL40FgRWs9ITUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: DNIIEmQlanTlbPmD7RcOiwooFNEEpe8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfXx0X8d5xUF7/P
 V9yywo1ZMSn7gDvIN3tdj2eOqhuds31TWa8/QgZ2wpivXJYC4sQNWrzIbg6Qm7CVmpAACXF6zmc
 A4fX5M6gSaYzfrbAmEdo8PsFntYShH0Hwdq2JhJzX21veN5qni2759m4lBJbyTWgPpPV1LFCBY7
 TxnM2j0KrNoZpLC1aUBNBEzaOUdKYhb1Y6rYD8zllciQRK8lT5HzTdGKGgSQ1dHcycY8bJuiz+e
 p+AqLOu3JuC+x06AhTk4SktF7wXYA2PEmPWnETx7iJuoCL9ENIiXpevAd+sLIPPk26XGtItQgb5
 ij0Gan/4iRtzKhqvvk29WLYUSVtQDSvCqCF7qxJHDouP67gNclFWmmSVGLb0ZDZ5e0jrhcMeOAf
 +6xMRdorWz4/7hf4WHsKRCGvzlSPFg6HMUW+6jaRlYm1mhWAPtqymW0iDOAE0WBi/6Af4r/439x
 J+Vn0WK7c1P7dUWjE7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070034

fastrpc_notify_users() sets ctx->retval to -EPIPE and completes
ctx->work for every pending and interrupted context, which is enough to
release a thread blocked in fastrpc_wait_for_response().

A thread using polling mode does not wait on that completion. It spins
in poll_for_remote_response(), whose exit condition is:

  (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done

Since the DSP is already down, it will never write FASTRPC_POLL_RESPONSE
into the poll address, and is_work_done is left untouched by
fastrpc_notify_users(). The thread therefore keeps spinning until
FASTRPC_POLL_MAX_TIMEOUT_US expires instead of bailing out immediately.

Worse, the poll address lives inside ctx->buf, so a polling thread that
has not been told to stop is still reading a buffer that the SSR
teardown path is about to reclaim.

Set is_work_done along with retval so polling waiters observe the
termination on their next iteration, exactly like completion waiters do.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 05b2e7e4ad3b..c54c450cb571 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2663,6 +2663,7 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 	spin_lock(&user->lock);
 	list_for_each_entry(ctx, &user->pending, node) {
 		ctx->retval = -EPIPE;
+		ctx->is_work_done = true;
 		complete(&ctx->work);
 	}
 	spin_unlock(&user->lock);
-- 
2.43.0


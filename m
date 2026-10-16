Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C9459ACB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141124; cv=none; b=QoO5DCj86OwKD1lSQQUq+rtqLnChJ6SbSCgPii6CWEQjGwkiU2pfZPzQZ0bL/LBpSGDhbFRYb5JZTek8etfOJhJVap2RnvUf1SiXFOK0Q+BgmYWwzPVd6PlfvJ4sQ6t/MCTBbhRfQ5MTAG/eOBsqCiCJWQmp1K7FRuV/6nu1DGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141124; c=relaxed/simple;
	bh=L87IvdKKix8xxEq++XK9yFC3sWWwuRVFN6B+KYf48z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0aRVNrDOE1AM08ikVRcZnAxhCOjRr2+7K1MBxF6xIqMGFSIFf3XFNtFVrQOw+Zhc5WukU/eC39ppdHleTSqKzCmmkjW9Q7f6xyTdWdUHPOcc/Q2nhSYvgc7c3ujLJKFyuF9toCkvOqqKIPp0pnQfajMvxjbWUcP8GQUlxnN1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Md/GAUNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSFx9x1p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md/GAUNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSFx9x1p"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lEC01761574
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=; b=Md/GAUNpyf9jOctn
	AiUv3mTuiH0ORDXqTAotgtpjCGy29F8DN1mFQxX3x23gJUqiktNtR4eI579vGuqw
	LKnVgxHljfVWymvC+WTGDubSECw2AWYO20jomfDob9mWrL2LJX3Xag6IdEOjNxSG
	B92ioiHZYr8J8pJYhf1SwdkgDH6qnlBlePEkoZdW+E6eG+KYOW0Ym97a1n/hD6RU
	sBtHSmRzMjSzZ8lXOtOG3jER443ly9pFgr5ahTe/+zaPpEsx/eWsGqJz0j4k+lMr
	3/XsTGK6ZvHzORajbqWZsrzj14XRnmBnlCOK2dDsIDcD2PggzBdaSi12zVxVLiY5
	Q4sy+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr638-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so8188511eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141120; x=1792745920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=;
        b=QSFx9x1p9ADiPNgmA4gZmr8Cw+DFfwCCuo67DSHXsekNGnklec7FuymWdPJulc5EBC
         V3atq23l2c6aKqHtQS2TOzYdl+UE4FaRvxjljt2WXwJrzqErlZi8RkYtJNJt1kf1OFQ8
         PTl/LuBgTnSYyksS6TzlKJkYEa231xxog2umuW6eaOqyCmVU33n4vQvaCr1gks0+o6rV
         TS7OjbkR/pKbDEUfzr847dtLqEhrBSzV3VbKalOcO6o75Ym9FXHmSNxHcTOHOV16rWeR
         sSedGRP+5jrHOY0X0ZneXGqL7Ehkoee40wPK5xpl0qA8EYbeO5jaKDwJEtTXMR0nvXus
         Wsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141120; x=1792745920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=;
        b=l2XBP59eJA9ALBBfnr9UPHCAAeLyT1rxALQhMm/kKWqwAYu3eQkZLn9kVUhsTSuEHZ
         nSAypa2lw9xecP6MHal6Noi8a37b2gfbOX0ZHYkUZzq4KV3IDUE4Iu+xlICQMfqbe3HL
         1cqB7R0mkmXAFj05PGEe1ooX+nB2h/XH0dc+8FXZQQiFe9UrFMW7jt6n9dQDJEKNQx1w
         C42gRO0rRDclAyPWGxO4WTzds2xO1AhC47Cc4kSFysk5o9W9p/i+vDN863u4NON2aZ9H
         BDyyfqBrEeFglBAg1pzAF8Itxngwf34pu5aZhT/uEfK6xxhGjVCOFjOLF3lZEe1tPJKX
         Q5ug==
X-Forwarded-Encrypted: i=1; AKwUvBwEiMEWfoBApsEMnvxikIeLhwDlx58gLC2zUowQdjsXzzHxZ4lrrg0nGptSCFr9RTT8Ij9c2dDxjUuQHnDU@vger.kernel.org
X-Gm-Message-State: AFq9FYJncTPiC76RMdTUoYhuAsVGmu04Rm2fXkjbuz7qzlw3QpduXi+H
	v2R62Yf4Hya7cTZj4HCVsUlz/0vPdGvUmr8PF0EXHyz2lJW6ZudzZqJAAo39NPVj1Pi88YX0LN6
	SAlMPMYSLO+mtO20hTw4EUt7a39n64XWeGSlA0j3BXUoNehRh8/ZXZbRfLDwszaPRUe6QeC9v9G
	N36bo=
X-Gm-Gg: AYBFou3FXN8hkOSLyi+3vhrQWq7EYEkjWaJdaLrfd1yML35X+pIV/2r12r47Rl+PUaH
	51IqxPp8JGtvpHLBeocK/846/R/ARzdny4X9riB9VA/52snbaqapShm6Qmj7WxlKFk8UaQOFOVA
	J22iOedojw83qqOc9CsfwyNUJUgsnVsuUY91hflyloBDUNew7jCWqL05TtRqxaziJJncqxFisam
	vupR7oKkuKIEJ8AQmp/qxMaHpEs5mLxfCzJwg0ePLj2VC8fd7v397iOPWD2VX46bPUFhfzhobvT
	efXg3Q534QBnZBIzHM5bs97dKklA+eGLY2N+gudRjLnFd9mzQWJ/8iCgDJeu/GOXhSj22O+8Wdw
	4o8UJNt9zYFofSDHu+P3wxfgDs0ZbXXZRmHWtVSCMXH4cwGI6Lt8zWBQ=
X-Received: by 2002:a05:7301:5414:b0:360:cf7c:269a with SMTP id 5a478bee46e88-360cf7c2783mr1463850eec.24.1792141120391;
        Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:360:cf7c:269a with SMTP id 5a478bee46e88-360cf7c2783mr1463828eec.24.1792141119875;
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 01:58:19 -0700
Subject: [PATCH net-next 2/3] net: qrtr: propagate sock_alloc_send_skb()
 errors from sendmsg()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qrtr-add-shutdown-v1-2-e1cc01ca5919@oss.qualcomm.com>
References: <20261016-qrtr-add-shutdown-v1-0-e1cc01ca5919@oss.qualcomm.com>
In-Reply-To: <20261016-qrtr-add-shutdown-v1-0-e1cc01ca5919@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, jeff.johnson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=1185;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=L87IvdKKix8xxEq++XK9yFC3sWWwuRVFN6B+KYf48z8=;
 b=VYxysI6Kfs4V54IcDWHLy6FoJ8SiSBtuZxlA3iNQbC1wPqucMUHYaEJz4S4JCcZ2xTf0b1hCb
 qnExs+GYA30DquTCznBtZypB05coyeelnMMHB52UB3eiRjdlFAnlMLR
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: runOC5IRVP70-fKRrINffvPe77eYPQ6M
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e741 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=03LRD2XWm70np_qM244A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwIvDsTYOqP3m
 KAJyFgJCfMhJF/An9qhTOpy0WFR8d1GB4zZ299el75rMSTfJtDG9YdxSnF8oybXz9GSy2Fw9Tky
 Mh5S3T+V30jSuHzauRYNtsDpK+VSXY4=
X-Proofpoint-GUID: runOC5IRVP70-fKRrINffvPe77eYPQ6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXyTpWKdFR4IzH
 NgwH0Ec+RlnfQXKQMCCHiIWTuRO/87Abtn11wjdSLyllAamigOyIXedhc38BYQoZsEom11Zsvyk
 ndfhTlEFB21xB77EUngB7ccn0X4VwCaxwqq9CRY8s+EBbTHkN1946uFsWPvc/pe3BldIYDtYsFf
 aZDhsgVvq4jTTqV2nxcv8Msq+X/e11soOAc/CjoGGj3EY8VKVTSNZxF0eoPCpT/Gv/sOCa1aqyC
 N0M0PYz9dzJyEeJV8DxlWzDHhgdeGH+SHj1Ejxv8H4TTLuvZvu0ix8Q7HHphotT6suD5LRmroq7
 650YbWKl6+wIiFCgMTfQRjT16koHIlehuJjusSnPldlczbBreinyfj1YjTxmlCUQkfednpb/fgD
 hhRc/AiWgNJd1SmHmTrUVByk1LvRJ0+U/fjsWcuxlFwTvKmsfCX8WO8nwZE4FIOe7PkkdP4y2o2
 99xEix1AN4wginLzJWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

Since commit 179d0ba0c454 ("net: qrtr: fix error return code of
qrtr_sendmsg()"), qrtr_sendmsg() returns -ENOMEM whenever
sock_alloc_send_skb() fails. The helper already sets rc on every failure
path, so this overwrites the real error.

In particular, sock_alloc_send_skb() consumes a pending sk_err, so the
ENETRESET set by qrtr_reset_ports() is lost and userspace never learns
that a new controller came up. -EAGAIN, -EPIPE and signal errors are
hidden as well.

Return the error from sock_alloc_send_skb() as is.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 2d7339338e460..09c1cb443f5cb 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -959,10 +959,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	plen = (len + 3) & ~3;
 	skb = sock_alloc_send_skb(sk, plen + QRTR_HDR_MAX_SIZE,
 				  msg->msg_flags & MSG_DONTWAIT, &rc);
-	if (!skb) {
-		rc = -ENOMEM;
+	if (!skb)
 		goto out_node;
-	}
 
 	skb_reserve(skb, QRTR_HDR_MAX_SIZE);
 

-- 
2.43.0


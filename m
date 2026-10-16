Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87964455194
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141123; cv=none; b=FuohklVAFTfpLCUAl9qOOYsvyZjFNhhZmwoRhN/v9w/CzWCN4WYtwlN70SJRouF2ToMEuXtmF/qiQl+wtciItO5I3tXXYdIQr0xtkslJPXR248m3UVtQTKKCVNq7/wGzH1n1mkhtpVkarnRInQG67eSssqbmbWYfrP9kpdjS1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141123; c=relaxed/simple;
	bh=gdjPnOQrLSM5BuhfTWXU350XcrToK/vEq1DOpk2BN7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnrJuc7eSeA9+yhGERMUNRp3/+lVwfg6zgf36kYBw0AB9OlA0ubwrH/Lrw2kL6byrKQ+PqDRf7u9uzR18h6pNi6/Z19uUu5Ec+1qmpzfsLX7bU4BUWX4W0gA06TbFUGMmAYcn6WR4vEFymdVCVsuMWLkMdAMyBxWBEwPhlwFoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU4a78Lm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb2NhC32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU4a78Lm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb2NhC32"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lv6Y2219128
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=; b=dU4a78LmBGbUPN1o
	LtncCJ7NCJGLOKarUsGDTnLULo3/SFSvaejA6QDPCa5gv8O6sONoX/DIwiMgIAgT
	W4HDEIxFtkfIa7X0um6uFF7R/BBOzGDNXW99Xv5ZUIwOtSW7//ggNwoEcw6Wv02M
	Gpw7m/t1HmLivL7anva9svEqEDf2L5omYK9jO6K0Du53HDWH4ocf7cK7qRob26OR
	G/ZjAKrAObVY+T3/AuiEHIykO42TKsBPhLCweHp6wC6GrrRLtieUNtQhZR4ERrAs
	FIvdtg9hkZKj20LjW2g8AQNgpEEW0L4qgh6l4ZNF4+ceK5fl4mKCQSadlr58USEj
	d5lT5Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3n3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so8188452eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141119; x=1792745919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=;
        b=Pb2NhC32ruTwt0D/PWgm1MVoYWeJHqPQKsHGWs7PDL9Epajbp3Kp/rgHx2gZvxZjTF
         idbogUw/gmgo9jOzAYRxFoNxPn9fyEduBH08DzknMfxxm8g3w3JsK0rItc9meRQgKjWv
         Nw5NJMGbn4vsUnWmORxHGIsrsMLyfeytxQw9pWHni+1tbRdXU6gtuiu5WhaQsd13p2Ss
         ooCm+1JNx6DHXxc7ME1qj9E83Ik2cligGL4kd881ugrfhelBacLSp25XKarpitaMc2QH
         /poYbx/bRVXFdX0rV+V9K1eCcfqm35/pej1Fos2Z7n0VJcRifEhznsu4ej0714ypkdRr
         3Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141119; x=1792745919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=;
        b=03x/L8drbAvPDWi1PFUKUTcqq5SN5vFUt/NahiWBrd6g9dsP4JjlJmstQ9B5wHXsEz
         mGN8yssq9iXj6WBQPdJzaIw7x55a6d6MVouTOH8F7N6w3Y/rI1NXhbEwsy1Lq9OwNmXv
         EqTKOLsnAMPKKJNzA4/cz8CrpQGl5Y91LY48DBll5X6s8ku9/vLXM7uc/Q6w0ED6bfZ1
         ZDOhPjTefqE1Uw5AARglmxhKBbq/dYZI+h0k5sXz1bVae8SdZ0ar9BbJkP3SmR5ItSg8
         iaaXElcnTnNq4vkismtrJRi7tIqOihvfYzWsCXV4GsgRwkYBfDPkXp5J5V1m5Hpvjzrw
         4cew==
X-Forwarded-Encrypted: i=1; AKwUvBz61s+q9IahOPInYa8UzuswoVZuWVMtc4CnRQQFlRXGmSb3ssQUx+yaFhiX0RHSr1B37lCOcq4iGqWskPkE@vger.kernel.org
X-Gm-Message-State: AFq9FYLbkj2xmCZX4OYTOAWr1EEUBrLdt0peCXDeCvvHD24mwlsjIuU8
	2yE6qaQ6RLuxPGiPoTlJIqTsEBehUf5afcmnY2H6H7SneDOGDhF4u/MxFJaKTNr2mSFDwGNfE4H
	vmYfPb64XT7HBRv2s2HBL64+889csNAyV+EIqgp1oK32KM5wQcPpSZfrE1sjBVBXniThsn0Joo0
	JCEvA=
X-Gm-Gg: AYBFou1nJrtdeRfUfiwL6s6OXu5iYFV/ppoGa5y0oEr6Q0LAiNZqjVWxoF3iuopvc1N
	kAtKYsygN7AqaxPOr4Q0rMY8gL1KJ5rnwIdpJ6CVvNH/nFlbeTGi9B12F4Bjt2fGhrwetyL9Dbc
	0aErOzTwP/Q7VirUQu3bn94qizWEwmHvkMrRH1/uNhNhirY55qIu0nIsceZ+swNxLGK0Q0JlP0e
	fYmAxYZdoAq50bToCeKvvdzs2vfs//0SAVyEhmYRfuwQorpmWeFjoZnimhuRvnFvnaJVU2vpGjb
	+VKAGQpa1MiwWWx3q/iAlz3135RpEZqJCGQ4Jz1Ays4D6xUzXvv2eFb6clRPKc5GPyB5YVSoJ1B
	7f1QGrZcuQCQ2oQQnaUqlFuRWwvFHQpbFR1lxZDBpygb3nBxEttsXfFg=
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr13853992eec.3.1792141119372;
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr13853970eec.3.1792141118870;
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 01:58:18 -0700
Subject: [PATCH net-next 1/3] net: qrtr: do not take the sock lock on
 blocking recv
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qrtr-add-shutdown-v1-1-e1cc01ca5919@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=1467;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=gdjPnOQrLSM5BuhfTWXU350XcrToK/vEq1DOpk2BN7U=;
 b=qz+Edq/z5T4C2brJNUdgaVHrcSfqDlWe0eu9Ie9ggtGNVvGh3Mg0QavMvXkIRBK8g7ZeiJQ7c
 kFbAnm7MnB9C166sRYrA5JMtc0Ho2OmV/gLORKGCJjeczGNIw0teJPs
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1e740 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k-Ub7f4L2iafiF0gtMUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: jWfbH1qXjw42aAHTSxQWmGi1lwdpgxLi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwd/IUhdyIhCC
 rZ0ER+JP19nw/HJ/qdQcyK5rUeyg3PZZXnOkKjIqC15bORfqtmRp2bWYNsEqt3L35r3RXXppG1H
 hs0jNPu1i3stRWJ+DEgLwoBpoRRhB74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX9+BuFgatHu5B
 HCEQUjMUx5esUwB+70pOiHAy69D4vjrUVSQhEbkM4C2n7LP53VVi2F2USHKNd0Yj9/LfH+MMEVt
 j0jZ5L0A8A3fcjM8BqfTChwjQtuqrhUB2zsAG0Gel6ORt9hHODFUNQZfprLISXUuodssfhXyoP8
 p8b6Q6zfMYfz6U43oBdTA5rqIW9DF5ap2Ocbuls8sUHb/B/DUmDU2A0tfXdhtgTm+jDg2sDhyCa
 BWJKjS1Dg+2xqYCNpf7ON8MY0OcuAKIvC02yOlLrdt5UCQfkrFnd+i8PmavosezeKbM0X0IgYiY
 U/K/blcQ7G/jG1PMpe4oFoBUFzkTgbCgh7aUtR2+MkjGjXO4VnvHSu6C5fvfOC50+xWeo/pVmTu
 uD+wrC9UAzcWZQfaPeCyzUro7hVFGZV2YSzV8B/k8A1E/7nojmRcCyjhZpsRi3gISU16eoP4tjW
 9zMOEyZaxpyZmoRsH7w==
X-Proofpoint-GUID: jWfbH1qXjw42aAHTSxQWmGi1lwdpgxLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

qrtr_recvmsg() takes lock_sock() before skb_recv_datagram() and keeps it
while waiting for a datagram. Any other call on the same socket, such as
sendmsg(), bind() or ioctl(), blocks until a packet arrives.

Take the lock only once a datagram has been dequeued. The receive queue
has its own lock and the enqueue path never takes the socket lock. The
lock is still needed around the copy and skb_free_datagram(), since
TIOCINQ peeks the queue under lock_sock() only.

Testing SOCK_ZAPPED without the lock means a recv() racing with bind()
may return -EADDRNOTAVAIL for a port that was just published. There is
no ordering between the two calls anyway.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index d02ef9a74c3ca..2d7339338e460 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -1034,18 +1034,14 @@ static int qrtr_recvmsg(struct socket *sock, struct msghdr *msg,
 	struct qrtr_cb *cb;
 	int copied, rc;
 
-	lock_sock(sk);
-
-	if (sock_flag(sk, SOCK_ZAPPED)) {
-		release_sock(sk);
+	if (sock_flag(sk, SOCK_ZAPPED))
 		return -EADDRNOTAVAIL;
-	}
 
 	skb = skb_recv_datagram(sk, flags, &rc);
-	if (!skb) {
-		release_sock(sk);
+	if (!skb)
 		return rc;
-	}
+
+	lock_sock(sk);
 	cb = (struct qrtr_cb *)skb->cb;
 
 	copied = skb->len;

-- 
2.43.0


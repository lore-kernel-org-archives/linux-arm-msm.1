Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3E4E1412
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408404; cv=none; b=I4N6YBycf5uwWNOGUxI+Dd4Ztn16H+UoWZcIBMPlUZeut7OHYF4zfaypIfuXTw6u5WrmPRI4r4+REf1BePXG7EeP1O0Ns3eNBPR3M1GH3r0FI1C4IF8WS2122C9+OxeL3M80YTQefNvX/CBQRj4FIoGaR0W8W2G7p9t3p+xOZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408404; c=relaxed/simple;
	bh=1jQtpsEtEICvGh3Yep3pp+FRxYcqaumWZOyoe+5ANU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3N05P+ZbyKRFRDpCkvx6idAQ7AX9wq7jCjCukzfnyvl/Xz5RGjc0JfKjda9vM33EdvCz58rUa2mrf1BLpQtCPzL/sw4LUa2IJ8rBF5SEkXVHMm0PUCTYjl7wFXKVAvxLpRXzmK7VV2o8+nvT0aE1DjmYlx4d+1X00BcaksWZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psGNBQOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyeKzh0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psGNBQOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyeKzh0P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5Bx724621
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEF29vIt9xM5QLqU/ed4ueS67ZZlqFfU3QmCvBMWkR8=; b=psGNBQOiz7j3hZGx
	ThTcwT/zUy3cVY95owrtwxVin7BVxTAxCBLux1nJNN0mG0Fsoi52TeyS5vf0ypnR
	a+Ks3kvLKIC4K5c62BmDLZLnJZeDfivle9dpdkOXkejkX0HspE/k67nGZEt0OFoP
	lJu2BXxhMl4q7kNXoxhMzuLKLPilkCeaPxUAlh7k8vJmVfm1Gq5gkrwE7Pd4NlwS
	PaajMHQ752p8w8Lj7BmTXG+sZQsM6EDKm76ulOYzFksJMFuKYp2MzGIsZ+OTJ/L3
	K0HtrzXYEKghOYUwoAn0mRkGL/hSr9sf1dma+9bmA92r7NyuM47kfxubgf9AbsxD
	yM7UIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65grp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:13:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so432378685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408392; x=1793013192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEF29vIt9xM5QLqU/ed4ueS67ZZlqFfU3QmCvBMWkR8=;
        b=NyeKzh0PzbTA7FHFo70vhgueVMp+6a2z6niEQRQ5jfqX56s+q0ygZ/EjcI2mG1Fta4
         2ozlixZ7RPQ9pwvAYAKGjf+U8mK4KFvVxzqBdp1lgvVjO5nCbQqpIVBfySp5iXWgndRT
         RVF7z8nvuzanQMMcfXrdCpv8G28AFTqlJJZsYq/TcGSPqNETgLSYE9S40OT8WbyHS6pF
         wKSiwSyBILyWS4TN0sEn/SvcjWFsM3W7t9rpygMdixY0GD8HsP+WElX7Cpevhef/oDKZ
         N/Ifa+5+TmYtReAcOiXXKxKVes/JQwNYWgVcXoM4P4pfglCiw6iacuGrLnDqC48UqvBB
         twkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408392; x=1793013192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEF29vIt9xM5QLqU/ed4ueS67ZZlqFfU3QmCvBMWkR8=;
        b=SKYpmTkLE5W7FzHq6rTK7awlBYipZvBX4FiK9l8lUjl8AD4urzyaY3ZH6Ru6RvJcb2
         c0yUqY4xwGfS6RjqmY+EoxnOTuIFSArOGI4fERxJ2cS12I0GajaUYwrZELFpmU152we2
         Ntb8bQw/4ySCr/E9f/HzOUTRm4YB2fGp9T98DMb9P7dtu0zCnthasWzUFVY4BCRXDIRL
         EH0PUzk+APWp7xzoJfF+frdS4AXgUh2GfO9vaSwWxBgvW7TAPtGsli3AtaKySbyyQUbx
         dBAwSW3fLPitLuV9BYwYtEJFOuS6jbFZ2CKn35dMmUF6oQs7nICPyE0jPOfRT5XkCyR7
         bRZA==
X-Gm-Message-State: AFq9FYIRbFmHVMKrdRRGAvb00OxoZp6YYTvxxmnLv+zL1QKnG+ij0z2u
	k43UxgxtSipJoeBdN0ZqiSHR4xymZn9witlS1jAoAl+uRr1ogRI4RkK8m/1s6ssGX7p4DEPtBRh
	++IFq8/qjeyAOHCLgWxQsZ6n2yXZSRIEtW1tf9SvIC08p/7gMMD2vXbdIWXa3MTPTeCJCys1t+s
	lt
X-Gm-Gg: AYBFou1J6Jn6jtetYiKjw/CRbScKUH3f30CXHp1FypJWSEi1EsE5SMu6Bi3QK6h4Wdt
	zCVPEBswF4z4dWdA/ncPsR2VzPezaicme+wvFaLY5v6FAiKKM+baZkcFKkCtl934oLE6ai2vUI2
	QJPzZ/xrQbBicMrpyht0A0t3dSr8VuGHQ9gOBzNtpQyKd0C2DNS6FWpyTW7+XsODNtShAmNl5ag
	FE+aihPcZ1/tQyNVxqt595v3Rzlaz03LzTcGFc3BUzx0gi9i7M+GCbKUzfFe+bpV+COZlySnEbT
	9fIC3Yp8g2yEqsa6oJMWna+1gv/dJ1HgD59pmneZayxlBH4xw7Wr7L5z7Ru8svAj67+T4UXvxIS
	2fnEsZJfsfIfR9q1jy2UkwL6/SRmZAGtqYn8Tf9lIVNAH
X-Received: by 2002:a05:620a:4402:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f29d83580mr1246146785a.74.1792408392326;
        Mon, 19 Oct 2026 04:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f29d83580mr1246143285a.74.1792408391850;
        Mon, 19 Oct 2026 04:13:11 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4256c790adsm211472266b.31.2026.10.19.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:13:11 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:12:02 +0200
Subject: [PATCH 2/2] net: qrtr: hold control packets behind the HELLO gate
 instead of dropping them
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-2-bd420aec171b@oss.qualcomm.com>
References: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
In-Reply-To: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXxa2zHH7Zr+WS
 J9iVX4jrVkkJ8buOsCS7l25FMzlgUuGWITgBLkyjnXHiX8yyZBGzHOZRVD8sbpwSVTNJpmjNI75
 FgitjcG5qCYr6zEni4xLEHnA0xR5ldI=
X-Proofpoint-ORIG-GUID: LrcztpgwgDxnsDykl9vIrLyLJmeHwgcP
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fb49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o-VfIjT1-S5dX-TKpQEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX72Eeyq6wyPTM
 uw843+jQovuEELLiQ+kbamlovvc60yO9wq52gb0VIJeJ6NvxVPqzuZuliRr1UbC0+GEKVsgzm0K
 0FhTyD6HJ4/wF/2seZS0OI/bruwjtKKn9KBvh9ydSSlRtIy6VMR8yc6qWzwKcai6HBbfKVamPgB
 pkhPeZNhojjFxfwknwwxN9YLom6fQHIR+Q5H6mpvPO/0IZQGqRKEQSpocMiks1ux4hJy7xz0DMe
 ukccMyX2EAnw2ckP9Lo+Da0/lZgBiWnNM5vH7XPDds5EwUUfiOV4iQf/6eWVz+JNFzqYI2sWM47
 w0555UkdP++0HCI1eiJDzq3tTVUkC5iY5d/m5dm0mcLpm8bB7XoNq5Jqd8a7VGuLUVaAgw0AeSi
 AhOfWTbmM1KwQ8tWwCHvTqnIngKNkQQ2mm/GR7GUUi9LNh8gXGZMdefuXBl59+JS2Z62fAOTDuU
 2DixswtpWGWlYVORrWw==
X-Proofpoint-GUID: LrcztpgwgDxnsDykl9vIrLyLJmeHwgcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register") qrtr_node_enqueue() refuses every non-HELLO packet to a node
with -EAGAIN until the HELLO to that node has been sent, and a HELLO
that cannot be sent yet is retried 100 ms later. The name server does
not retry, so whatever it sends in that window is lost: the replies to
the remote's HELLO (announce_servers()) and the NEW_SERVER broadcasts of
local servers registering at the same time.

A freshly booted remoteproc hits this every time: its glink channel has
no rx intent yet, so our HELLO fails once. On the QCM2290 (Arduino UNO Q)
rmtfs and tqftpserv register in the same instant as the modem starts;
when the RMTFS announcement falls into the window the modem waits for a
service that exists until its watchdog fires 40 s later ("DOG detects
stalled initialization"), about one boot in five, and WiFi (whose
firmware runs on the modem) comes up a minute late.

Keep refusing data packets (they would count against the flow control
window), but queue control packets for a node whose HELLO is not out
yet, bounded to 64, and send them in order right after the HELLO
succeeds. Purge the queue when the endpoint goes away.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index e7b3647424b8..071fa980fae2 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -122,6 +122,7 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
  * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @hello_sent: hello packet send successful
+ * @tx_backlog: control packets waiting for the hello to be sent
  * @rx_queue: receive queue
  * @item: list item for broadcast list
  * @say_hello: delayed work for sending hello packet
@@ -136,6 +137,7 @@ struct qrtr_node {
 	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
 
 	bool hello_sent;
+	struct sk_buff_head tx_backlog;
 
 	struct sk_buff_head rx_queue;
 	struct list_head item;
@@ -195,6 +197,7 @@ static void __qrtr_node_release(struct kref *kref)
 
 	cancel_delayed_work_sync(&node->say_hello);
 
+	skb_queue_purge(&node->tx_backlog);
 	skb_queue_purge(&node->rx_queue);
 
 	/* Free tx flow counters */
@@ -340,6 +343,26 @@ static void qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
 	}
 }
 
+/*
+ * Control packets for a node whose HELLO has not gone out yet are held back
+ * and sent right after it; this bounds how many.
+ */
+#define QRTR_TX_BACKLOG_MAX	64
+
+/* Send the control packets held back until the HELLO, in order. */
+static void qrtr_node_flush_backlog(struct qrtr_node *node)
+{
+	struct sk_buff *skb;
+
+	lockdep_assert_held(&node->ep_lock);
+
+	while ((skb = skb_dequeue(&node->tx_backlog))) {
+		if (node->ep->xmit(node->ep, skb))
+			pr_warn_ratelimited("qrtr: held control packet to node %u lost\n",
+					    node->nid);
+	}
+}
+
 /* Pass an outgoing packet socket buffer to the endpoint driver. */
 static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 			     int type, struct sockaddr_qrtr *from,
@@ -349,8 +372,12 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	size_t len = skb->len;
 	int rc, confirm_rx;
 
+	/*
+	 * Data before the HELLO is refused: it would count against the flow
+	 * control window. Control packets are held back further down.
+	 */
 	mutex_lock(&node->ep_lock);
-	if (!node->hello_sent && type != QRTR_TYPE_HELLO) {
+	if (!node->hello_sent && type == QRTR_TYPE_DATA) {
 		mutex_unlock(&node->ep_lock);
 		kfree_skb(skb);
 		return -EAGAIN;
@@ -383,13 +410,29 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 
 	if (!rc) {
 		mutex_lock(&node->ep_lock);
-		rc = -ENODEV;
-		if (node->ep)
-			rc = node->ep->xmit(node->ep, skb);
-		else
+		if (!node->ep) {
 			kfree_skb(skb);
-		if (!rc && type == QRTR_TYPE_HELLO)
-			node->hello_sent = true;
+			rc = -ENODEV;
+		} else if (!node->hello_sent && type != QRTR_TYPE_HELLO) {
+			/*
+			 * The remote may not take traffic yet (a freshly
+			 * booted remoteproc without rx intents). Dropping
+			 * here would lose name server announcements for
+			 * good, so hold them until the HELLO is out.
+			 */
+			if (skb_queue_len(&node->tx_backlog) < QRTR_TX_BACKLOG_MAX) {
+				skb_queue_tail(&node->tx_backlog, skb);
+			} else {
+				kfree_skb(skb);
+				rc = -EAGAIN;
+			}
+		} else {
+			rc = node->ep->xmit(node->ep, skb);
+			if (!rc && type == QRTR_TYPE_HELLO) {
+				node->hello_sent = true;
+				qrtr_node_flush_backlog(node);
+			}
+		}
 		mutex_unlock(&node->ep_lock);
 	}
 	/* Need to ensure that a subsequent message carries the otherwise lost
@@ -657,6 +700,7 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 
 	kref_init(&node->ref);
 	mutex_init(&node->ep_lock);
+	skb_queue_head_init(&node->tx_backlog);
 	skb_queue_head_init(&node->rx_queue);
 	node->nid = QRTR_EP_NID_AUTO;
 	node->ep = ep;
@@ -700,6 +744,7 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 
 	mutex_lock(&node->ep_lock);
 	node->ep = NULL;
+	skb_queue_purge(&node->tx_backlog);
 	mutex_unlock(&node->ep_lock);
 
 	/* Notify the local controller about the event */

-- 
2.53.0


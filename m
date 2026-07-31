Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B682D595B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540328; cv=none; b=O2v7EOVcqxP8nT1EzmEzIDn+PhCi5BYwdutY1GoX5r/EExD+Q3e2eE6FgKmhSq6099Fdf/wRjGkUj05Kz8Me0R4ZjaoD5Bu1fSvaWZGopL7NRQvH1g3ORaw+3XGwhZUDa9e8XRKhwKgVDH/F2fEXK7UfIJCFxGp8bvE65T4iXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540328; c=relaxed/simple;
	bh=sfPRiBtyHFMBTeeNxOWUQo9luUB+U1Jina3Imhlh0Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZcqicQ8eANuJyuNPko73oHC8dGc3RIcwFH7ZGjTt9Q9t678n4REtWies1O/iCXNV9WNcOBNm401n60iqWExhOyl4ZpBa5wUk6Wpppt3Z7oZFC4Cfqph+EwjskxIAEsWXzzXcikKExji7bOZj7N/rX5wPYj36jxWoiYAAavgFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmBNT3wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hfkupkmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmBNT3wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hfkupkmx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0W4G1376197
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L3P6WaXsgAY6gWBzoSO5hWBP
	20Fu7HbsfL4AwofoV5A=; b=EmBNT3wFITF0WNesExgrcaS6ZmHA4ntXk82Jr4y5
	MCXcqBRS5uTQ41DSgPRJCYepLey6XY0ONY6kLyp9O8QHABVxlByJ0ywEvxXD0aTk
	Qkvnm/9O9SsV6OmPtmGhSVkFikRCp4mvdX0cBz1WiLKwcVUMG6DE+wI8tk3NP18Z
	pNB+YPfYsgN0RsOQvhQj2PVQUL+NsR2q5U43NNJ6nenPt3ldIndvJqUHEiPR6ci0
	QxXFSyZADcO8AUw/5xnOngyQISDE45+3vAcNqAyaBac8A5KlmniBWJ6G24ZUrgKU
	TN6+SXwwQRksdR0d8+L3f+zXWWT6fmUuY1sx+yOYrgjiXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8tug2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:25:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso21591095ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785540325; x=1786145125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3P6WaXsgAY6gWBzoSO5hWBP20Fu7HbsfL4AwofoV5A=;
        b=Hfkupkmx0z6AqkI/KHb5IPJce0kXU0+VYjOS/eK0Pxla72VGVpwTb5uKyUv/trSPM3
         eSDvdFaCdSRaPbayT58RKuvvBfSql3UYBY7NLPwY5xPTRLF+LfF7XZjNpHe2cWVsq25n
         LyPtZDXvjtQXw/PV1lF3qhEy3MyHLt9aKSEHE3yVzgp9H22j0FinNvs4RzWQwSAm1qaU
         w20lq4mKvweniruckfS3eQBaIr2w/oO4So/0NMgWJYssx+0ricw1z22tKYLADAsATBfD
         2yPCguYZ9JcQl3VyMsF2qEnsjxkYYT3kWcFOOocBGV9zHEvaitR6NCqMFrbGx2AiT5gc
         lfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540325; x=1786145125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3P6WaXsgAY6gWBzoSO5hWBP20Fu7HbsfL4AwofoV5A=;
        b=HS1L2aptbYXwPe2+to3ttOBZ2kteMPnMRTyAgyFFDOXsJgNFPE4tRc/Dkh8BaZNKE/
         rqowLRhCj1v1I1ISZdxDVBNEEup9h0SrOOP5hfomtWyYWqmYRASop5IiHWLLks+o0Vnh
         3UkH8U/It40AnmYbwZFT0aB0iIYpydlI8L5JJK13La4USdyKMoIRZXNzG8fTpPYGT8Uc
         2X+CmI1nvxizyEpTQJgSw4L0jJlLisigpx+deR1GmpkUVTL5iszljowBhz3CQew9UfRi
         ZwuNrNtmRe6XYj1zzf9CLNzCZFrxCg7fC5yk1Hto18PHknZh2bvF38ullNAL1OvFitg/
         Dihg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9bFYwxyHPnAH173E4lGUnPCQJ/dVrohUC0kvyPI7SzYLxv7hyRNzFdjNDePOnKUS2WyiIjCoc4uUWLFxk@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaz7MKhd2On2t++Im1YSL1vCIdfslN49j5aOcoeGOIsCuFvfM
	BwR8+/BCGSP6f7XQMOdOHwiaBacigIWNeiRQ1y9Din3QR8L+uz9NvLRT5MeVvSgRSGUZ2KbrZp+
	pyA45/kW1U0QYmnTklof0nwQvOF86hjM1MCd5lGtb5eX5TGsqLj3YI5m9Qw03yUORO9ah
X-Gm-Gg: AR+sD13x+z5jIqZClp2CGLBAMz7j6rGnUlbdCLbZygDtAHyYvsddrKCzx8FBzTCW91S
	a42DWZ2a675AFTzPcDgCcEvOUmIIjVe1VbxBgfMUF86AroKh1wF6lmRbZnAVsPHNR/pniOq8bOb
	ZyCLpXoJZpkC30eXdjK03+J7Y8hP3GMM8lebSg4jxI1pobw9abPOX7pNyEdGbPZzL+kjPtvaQ3J
	2p7AAeVZWfafo9sZI927kYGsijUv/u7s+5/uL/QNkPKO+d9SzUh09K0KEMmsJPH0EhEfez0JG7d
	rI64zVuuHoa/nEamjpnkVO7vXeilhCUPHwi19Pl3rDDTqPNm8auviEdyxQkCpsDDqf/dmC5pOPZ
	d90jo67a+4ND2tuY3jqSFFc+NcK1eqaqaG2ylvGY=
X-Received: by 2002:a17:902:f64c:b0:2ca:f417:396b with SMTP id d9443c01a7336-2d047d1ea9bmr33082255ad.3.1785540324736;
        Fri, 31 Jul 2026 16:25:24 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2ca:f417:396b with SMTP id d9443c01a7336-2d047d1ea9bmr33081915ad.3.1785540324249;
        Fri, 31 Jul 2026 16:25:24 -0700 (PDT)
Received: from 058f6326d650 (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f0f9sm9472688eec.23.2026.07.31.16.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:25:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 23:25:22 +0000
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] net: qrtr: Send HELLO message on endpoint register
Message-ID: <am0u4vGpLnQK4Yjx@058f6326d650>
References: <20260731-qrtr-hello-on-ep-register-v1-1-ddee5b1bfaec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-qrtr-hello-on-ep-register-v1-1-ddee5b1bfaec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6d2ee5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=IXX6xhmyHek7Xcd_kM8A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE3NCBTYWx0ZWRfX+H3bC0ydxiTV
 i3OBivLNdgtEhWzMe6tMGnbPoF4lVLs/cQ3NY3TS1Tyb8u+5KjCInBjl0tC5kmBBo1iyidR+rdS
 xbBuhnYASSV7mvthP8qNvGJKg/OiW8w=
X-Proofpoint-ORIG-GUID: PqHvXQjVVGsB8XWzUtx8aPRXjPsA6Q4n
X-Proofpoint-GUID: PqHvXQjVVGsB8XWzUtx8aPRXjPsA6Q4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE3NCBTYWx0ZWRfXw79dbAyi39Ug
 Ead1tOJji5gMzUqoai/6qzqozUFWBZRSRtNLxi2Uyd3wqQrkKJTUo/7spukYvnUeQpPtiPj1vCE
 AsUzJq0COeoGo0URH/uTUspKg46mfiAG8KP95uIPqLi62srt/z06GJ6kvL91nG0gMzvJSfDRqdt
 TDPpSb4TaNVSaydXKAo/wDQUu3Vn+hvSjKrACqafnuo7+ityPWvtOJnA6FMvEgoQ0TA2rvLv4j8
 FBzAoWEgK8hdmZstnMGBJbqEKhjZCXeFphMWvdm5kmkBLmHDDNl2v7/hvUnx7cgX7UsEr1AXdk1
 hTIXAqcSFIm2CQSA4CYK7DSN/yNiHODy4eLKMYLl0ZEXpSawOFIBQ5+sHQOV+t9pRq1kNsezhzM
 ATJtRXCu8FROYoAQHSAcBXmfNiKVDWqErzaEwbfGYu2LCQFIC9+7d37z92JwcuvLY2J1KGqfGAg
 ZQU4Coi9YavaizinNVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310174

On Fri, Jul 31, 2026 at 03:47:29PM +0530, Pranav Mahesh Phansalkar wrote:
> From: Chris Lew <christopher.lew@oss.qualcomm.com>
> 
> Hello message is currently sent only by the name server in response to
> a hello message received from a remote. When two endpoints operate in a
> slave model, neither sends the initial hello, stalling further
> communication.
> 
> Transfer ownership of the HELLO handshake to the core layer. On
> endpoint registration, schedule a work item that sends a HELLO packet
> to the new endpoint once the name server is bound. An atomic hello_sent
> flag prevents the name server from sending duplicate HELLOs once the
> core has successfully sent one. If the initial send fails, the work is
> rescheduled to retry.

Why would something queue more than a single HELLO?

If I read the code correctly, qrtr_endpoint_register() will schedule the
sending of a HELLO and then as we receive the first incoming HELLO we
forward that to the `ns` which will try to send another HELLO, which we
per our flags silently discard.

But why not throw out say_hello()?

Then qrtr_endpoint_register() would schedule the HELLO and
qrtr_node_enqueue() can reschedule the say_hello work for every HELLO
send that fails - no state left.

> 
> Prevent duplicate HELLO packets from reaching the name server by
> tracking received HELLOs with a hello_rcvd flag. Without this, each
> duplicate HELLO would trigger announce_servers() in the NS, causing
> unnecessary re-advertisement of all locally registered services to the
> remote and redundant lookup notifications to observing clients.
> 

Why sweep the problem under the rug? If the peer is misbehaving and send
multiple HELLO messages, wouldn't it be useful to put something in the
log?

If the concern is that ns will call announce_servers() multiple times,
wouldn't the right place to solve that be in the NS?

> Co-developed-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Chris Lew <christopher.lew@oss.qualcomm.com>

This isn't right, Pranav. You're the sender of this email your name
should be last here, because you handled the patch last.

> ---
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Not sure what you did to b4, but this looks wrong.

> ---
>  net/qrtr/af_qrtr.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index d02ef9a74c3ca..03234bd1fe54f 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -9,6 +9,7 @@
>  #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
>  #include <linux/spinlock.h>
>  #include <linux/wait.h>
> +#include <linux/workqueue.h>
>  
>  #include <net/sock.h>
>  
> @@ -120,8 +121,11 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
>   * @nid: node id
>   * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
>   * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
> + * @hello_sent: hello packet sent to endpoint
> + * @hello_rcvd: hello packet received from endpoint
>   * @rx_queue: receive queue
>   * @item: list item for broadcast list
> + * @say_hello: scheduled work for initiating hello
>   */
>  struct qrtr_node {
>  	struct mutex ep_lock;
> @@ -132,8 +136,12 @@ struct qrtr_node {
>  	struct xarray qrtr_tx_flow;
>  	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
>  
> +	atomic_t hello_sent;
> +	atomic_t hello_rcvd;
> +
>  	struct sk_buff_head rx_queue;
>  	struct list_head item;
> +	struct work_struct say_hello;
>  };
>  
>  /**
> @@ -187,6 +195,8 @@ static void __qrtr_node_release(struct kref *kref)
>  	list_del(&node->item);
>  	mutex_unlock(&qrtr_node_lock);
>  
> +	cancel_work_sync(&node->say_hello);
> +
>  	skb_queue_purge(&node->rx_queue);
>  
>  	/* Free tx flow counters */
> @@ -341,6 +351,12 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	size_t len = skb->len;
>  	int rc, confirm_rx;
>  
> +	if (type == QRTR_TYPE_HELLO &&
> +	    atomic_cmpxchg(&node->hello_sent, 0, 1) != 0) {
> +		kfree_skb(skb);
> +		return 0;
> +	}
> +
>  	confirm_rx = qrtr_tx_wait(node, to->sq_node, to->sq_port, type);
>  	if (confirm_rx < 0) {
>  		kfree_skb(skb);
> @@ -379,6 +395,11 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	if (rc && confirm_rx)
>  		qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
>  
> +	if (rc && type == QRTR_TYPE_HELLO) {
> +		atomic_set(&node->hello_sent, 0);
> +		schedule_work(&node->say_hello);
> +	}
> +
>  	return rc;
>  }
>  
> @@ -527,6 +548,13 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		if (!ipc)
>  			goto err;
>  
> +		if (cb->type == QRTR_TYPE_HELLO &&
> +		    atomic_cmpxchg(&node->hello_rcvd, 0, 1) != 0) {
> +			qrtr_port_put(ipc);
> +			kfree_skb(skb);
> +			return 0;
> +		}
> +
>  		if (sock_queue_rcv_skb(&ipc->sk, skb)) {
>  			qrtr_port_put(ipc);
>  			goto err;
> @@ -570,6 +598,35 @@ static struct sk_buff *qrtr_alloc_ctrl_packet(struct qrtr_ctrl_pkt **pkt,
>  	return skb;
>  }
>  
> +static void qrtr_hello_work(struct work_struct *work)
> +{
> +	struct sockaddr_qrtr from = {AF_QIPCRTR, 0, QRTR_PORT_CTRL};
> +	struct sockaddr_qrtr to = {AF_QIPCRTR, 0, QRTR_PORT_CTRL};
> +	struct qrtr_ctrl_pkt *pkt;
> +	struct qrtr_node *node;
> +	struct qrtr_sock *ctrl;
> +	struct sk_buff *skb;
> +
> +	node = container_of(work, struct qrtr_node, say_hello);
> +
> +	/* NS must be bound before we can send */
> +	ctrl = qrtr_port_lookup(QRTR_PORT_CTRL);
> +	if (!ctrl)
> +		return;
> +
> +	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
> +	if (!skb) {
> +		qrtr_port_put(ctrl);
> +		return;
> +	}
> +
> +	pkt->cmd = cpu_to_le32(QRTR_TYPE_HELLO);
> +	from.sq_node = qrtr_local_nid;
> +	to.sq_node = node->nid;
> +	qrtr_node_enqueue(node, skb, QRTR_TYPE_HELLO, &from, &to);
> +	qrtr_port_put(ctrl);
> +}
> +
>  /**
>   * qrtr_endpoint_register() - register a new endpoint
>   * @ep: endpoint to register
> @@ -595,6 +652,10 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
>  	node->nid = QRTR_EP_NID_AUTO;
>  	node->ep = ep;
>  
> +	atomic_set(&node->hello_sent, 0);
> +	atomic_set(&node->hello_rcvd, 0);
> +	INIT_WORK(&node->say_hello, qrtr_hello_work);
> +
>  	xa_init(&node->qrtr_tx_flow);
>  	mutex_init(&node->qrtr_tx_lock);
>  
> @@ -605,6 +666,9 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
>  	mutex_unlock(&qrtr_node_lock);
>  	ep->node = node;
>  
> +	/* Initiate HELLO handshake from the core layer */
> +	schedule_work(&node->say_hello);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(qrtr_endpoint_register);
> @@ -796,8 +860,21 @@ static int __qrtr_bind(struct socket *sock,
>  	sock_reset_flag(sk, SOCK_ZAPPED);
>  
>  	/* Notify all open ports about the new controller */
> -	if (port == QRTR_PORT_CTRL)
> +	if (port == QRTR_PORT_CTRL) {
> +		struct qrtr_node *node;
> +
> +		/* Reset HELLO state on all nodes so the handshake can be
> +		 * re-established with the new NS instance.
> +		 */
> +		mutex_lock(&qrtr_node_lock);
> +		list_for_each_entry(node, &qrtr_all_nodes, item) {
> +			atomic_set(&node->hello_sent, 0);
> +			atomic_set(&node->hello_rcvd, 0);
> +		}
> +		mutex_unlock(&qrtr_node_lock);

This code existed to handle the case when the userspace qrtr-ns
restarted, but we will always register the in-kernel NS so that use case
doesn't exist anymore.

Do you really need to reset these things?

Regards,
Bjorn

> +
>  		qrtr_reset_ports();
> +	}
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> change-id: 20260623-qrtr-hello-on-ep-register-7064b66ccd70
> 
> Best regards,
> -- 
> Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> 

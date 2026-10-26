Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050494;
	b=2wEU1U+FLuw6ZjsPDAbVs2kKsDDbVEbcqZyqBcrIbBjcwgj8/rbXhIKwA4951Y+LNB7Z
	 uXB95HQ2iCHytrRq9xdie7rV0amXIETA2zzLcbIVBFuL2hHapp6fnuI6jHDF0NJOrHbzy
	 /oVqmdi8t6wObtUlJBav56Hfp36dthrl9iZYdefYe1Kz5ZgZ8PQQ3fsnaj0l1Y2UNBHgz
	 Klo8eUjjwOeH60yAmVwkOimEU+VTzkEwZ1/DqxQxgyNNPK3HMrCmCWvHxhKxQLPVtwMYI
	 bRmHgVlILKOvaaFGhYgXWjfNXoGFOdNNYuW+5KVnc/mdzItshWbD8Lxy8uzeVt/3vlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
	b=tV8/AJKItQ05MGhLj2S/9a9IfwBl/s144jEwypGY3tgAkxcqGGN7yBkWOoVyTkxar4sW
	 SAfMzrqrmPtJL+v0Z6rsIY7Y/QvUZ0bqIgOMgatcMD1dD5CdhLV76FS1xKrGf6QdrBro/
	 UsWsa1xZ6j1TqAWh9Q+9uyANmNuTV4o7g4vQE3JpZji+WXJSzsa45WwdU/dVkhPJ2I7Oo
	 UPqejaFJuwAwBilRXm/9X9V9O6tiZuqjbBBZkNEBlyuLbLhSisqxHc7VupqJHYMYXz3c9
	 DYKrV6LrRnmYOvuDECBfjQrCMFyZrI8aqt9Abb1fSJi7KTrKwN38PoMYjA9GuKg6Ftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoIsvugY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N2kH40/0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9D606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E9D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoIsvugY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2kH40/0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIo2Oo3585133
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=; b=HoIsvugYpfR2kurM
	7moKV8A6qIoWdgk6vO62Y0XvO2l47gFJR1mF0uNBeuvfXRzORgBKfHL0XK/kqgJv
	g0zMTPxc4P3OOV32SQxh5Hw/E003SKwOWH4tii7T984lqbzRljK3qWEyL2efPXVF
	mLAo1yJWXCtMuQ6phXfb9kgT9wsuVpIH/l4KHx53iuiGH9tIivuVKCCI9WkuA5XZ
	9zmROKtzWhd1nItZuwG92blqd8o991q6HOQ1yu2dVTP71Es9+R1OSPlJTexdoHih
	UmVmpzCColCzIwREDs6C/4bq3eSk4tjNCiYrIaMAtZ2c6bX5Kdhv+AdwfnfET7jz
	ibpUHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmm8qx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso3181367eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050492; x=1793655292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=N2kH40/0lXNgyn0/nx1znHabA0rrQd/JY8AJmXwDNMkxf0d1ZxwxIgCyNGrVH+fhoC
         JwupQL7jEsmMLAtELSfuXFkm1Sd1hTaGip5YeAuewwfBh5dGeytogq8je02dT1C7ro9j
         accDQ0KhnTkvP9eanvBDwtgdjL2zlS8mTv3bjHSSBzqScuS13fb5qNeB5Tbw5iWzGch/
         Si6Xf1QX1qlS3ckn6Nf/c1Sbh/23XzrJlVdfXPu6KA59RXqkAFKUm1LPH9iGWczcHdFs
         bqIwekfKmklbfSNZWYVw1Tj66rjIOU2Jjydh5pe3tob1UpFPy1QsJZ3omm7BuTshS7zV
         LcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050492; x=1793655292;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=isF1oLZek0a4uzO9Uh9rhg3i0ZQk5X8/rYwFz7/cKzm092QI7C/5woH34Mtldc8JSt
         rlJYEIY6J9gjDrf4omfmSGfWY8PQ+L2KzlqM/+pdO/JcnGomB8Jw08yK0oehH4qnMIOO
         mS7tiKS3tE9c2y07dXLIEQBI8Pf+fNBZXrNyRGS97pzMoo48llMhIeaFeI0YyWAnuhEx
         ASQs0g1HAs/y5eGul63GIIk3FSjrV9xuf1FbXY//06fJaSw0HVWw2IltUqocFpgYIZwR
         wDWhHcme7OeS/pCxqf42batm1rqbw+s8oFicN2W6/asZ7Hrp47cb1jpd/F7a9sTvVXWv
         91QA==
X-Gm-Message-State: AFq9FYJEOrjiEK69a80DM4KMETCw6aN7X+VJ74wHDbhAhDmRd0yUhihI
	noFcfj5k2iOQumObVc8PiJTWK1MvEzv5imxj643Eey5VfWyUazH+s0kYrGQ00jdrPysxdMgwbGA
	+BHTqOdwWEE+G7xR4C/UOIqE0dsfq8op7l0U00wq2tOGcg1Epz9bs/N4jwz/iIRvoWiAe
X-Gm-Gg: AYBFou0hWNzhtV+Eqv+1fZVx74cAu4VYjovqRlCqCjHcO4gX30sQMnjgr27pp2kVTab
	8w0uMBbD2FZlZcB5CXwCNquaIq2TcDSK9Kq/hp93zSnU+2CMKC17b91M8fXrFk8JfH5S4BkoBVZ
	eK+nYP91HHpKhwNL2oEX8/LqdkUA1peTEzay8gb6avyREPFQGcw0AgygOgW0QDD0EhQhEJjTbsp
	Dhg7dlecAo4q0bEN+QavoGAt5jKqK3AMOeq5x/e+CGiiCtV/HdQoEa8ndwJ9rnwnlZItcYMAuce
	x3Emfecv1wMb5PFbCVnhlAPlJBexpssb2A4EkWpE6ophrbdfPNXzkH3PSa0M1OzgCp7BPS9otRM
	ld3weA5c608Ur2O/aj+OkjeVs0aUbjJyy17E0XRUIs3EdZO0M0uzfsmLjkw==
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574876eec.16.1793050492006;
        Mon, 26 Oct 2026 14:34:52 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574790eec.16.1793050491179;
        Mon, 26 Oct 2026 14:34:51 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:50 -0700 (PDT)
Message-ID: <4e206a12-1796-4179-a72d-cf33f0864819@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:49 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX2NGTjK4+avaJ
 eNxkRcbi73xPt/DfPZr84y0ZulniprHifHOEPxo84qyo5A+tAhwLMmt5NlW9HaGILj3QhQ9Y2NE
 SZgWokAIrpHuBa/8IqFKpmpGLU897mg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfXzcHyeJ4xkNos
 OC1nePqIuOpmGL46GIrQpdT+d4uYkvyEgcdvSBUa1b7yAZ4sAn1kIeIbsliyf9prrXGmi/V63e0
 0rtnUOfzj/nI0u0pfYxHOx/4cTr/UkW2PFBYxmokmoBcsQrgQji0pWfw6a6mkI3nuXZNh9y1LV7
 r+PSfNZfXoqqwjX1EcRdzev7d6zdwuxUPoZiDp4n8m28ITsp+qNA5H4CkGFP83LzFzmL7LiexwJ
 6EhK2nS0tMaa/GgACB16X2xo8rjVCvNkzuqVPPOTStJFNAIXLzl89qzxKBd9lR29PGe76TAXjgp
 5yxV6BUyhx0XroPl7cXGUu3LHufquBtPiDMk0F4j9IyzQKIAAmLW0N5htGPzvcj1vn3IGnQ3zUx
 m6i9hEdVphnS51fUbiuvwmRvQ5SyqnOQOrp8K6poBB2iIDi4NWViA219qABDP+fMhcE3JBaA5qQ
 lrRc7RXgLzXkTDrLaOA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6adfc77c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HQsDcwHZmgEkHUxyrjcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: UnH36SIEZ7jHten-ROlcExY3x7fIVIgX
X-Proofpoint-GUID: UnH36SIEZ7jHten-ROlcExY3x7fIVIgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260086

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 6441927b5382..9b6108c1abdc 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -10,6 +10,7 @@
>  #include <linux/pci.h>
>  #include <linux/time.h>
>  #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>  
>  #include "pci.h"
>  #include "core.h"
> @@ -1491,6 +1492,13 @@ static int ath12k_pci_panic_handler(struct ath12k_base *ab)
>  	return NOTIFY_OK;
>  }
>  
> +static unsigned int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
> +{
> +	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
> +}
> +

note this hunk has a trivial conflict with current ath12k that landed during
the merge window since the ath12k_pci_panic_handler() that is part of the
context has been removed

>  static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  	.start = ath12k_pci_start,
>  	.stop = ath12k_pci_stop,
...
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 280e50a1f31d..507062068f8e 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -9,6 +9,7 @@
>  #include "qmi.h"
>  #include "core.h"
>  #include "debug.h"
> +#include "hif.h"
>  #include <linux/of.h>
>  #include <linux/firmware.h>
>  #include <linux/of_address.h>
> @@ -3940,8 +3941,18 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
>  	struct ath12k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

note that networking code no longer uses this block comment style, so it is
preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath12k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


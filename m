Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050489;
	b=ThlOhfdfMVR6VZOYqP7JZlWb6k91/w0WUSFHy6wS6D6ZhtGe/a4xYCQa2ENCMgGsD6iS
	 wnQkk7EaIlm8iAb2ELh0wEWNHMHFnug3Zd1S3+Qynp6uZaZzqr5I5Cs9JlsIRHUNK26dK
	 Cc/HR3MQFhhbXzFW88p87X7oecfl/S/FtJrGrbt8Lr8beqO+p08xo21H+FgVTmds0zawv
	 k9oByAZSisZP719PrfLW9mniGR0IqfUdY1izoOc65xXdsMbsA73fZOD1qk6YOI7aGwBfP
	 ta8LY4IMM0VWmS7oubduqQmVFIYPf/s9IpRlbRU66tHOmLRCDxPmH8hD2LXWZwWxHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
	b=WqcXQWU0qgpvb9LhU+HeXrMXJgeUuaIecjCBo3sK15AnAmWPnA13INiI65NOO+IWG0cw
	 TgqFb/6unDz+XUCYYcepDH3mef3dfysaYXxes5r9ZDW5gIyHMBDG5FBDHdWfww3LY0xiJ
	 fRjJK4QeIPro/2EX4DzF/vspuBXOpNGfVqMMORjjak1k6sQgLjQNwbMMX5qXFHBM//lZ4
	 mplF0M4UmvfLFnZdP13aDXehOqnXnDDGoOw0K7jWzFlZ6dujUC+9gyQ7ZtzuvQRloTywx
	 mvoXhhSbNQWaqMvEXI/Sne3MacrgKgkIG7uaDL5yY5o4iQLTf2m86RQFsNOtXx7knrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWj1g++T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jkn6mb7P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A8606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76A8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWj1g++T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jkn6mb7P
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QKdjTx1210213
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=; b=SWj1g++TF+yDUQr8
	ywP/9IqD0m7ocatSpMQy8Q8jDT3oOj4l1AKnxfYt7NwDHVSn7oZo922VNeVKwesH
	SCmUvdRkVSjj5lrCE1gqiQ2SkzGRynJOJpV9CID3rXqh8xs6btFZmteeIYKeopa7
	9klJ900DpTVcKDxhNly9YlPjwrvCMjExoMwOJjr2q90Bj3DEP47t1k27rzS0aYLR
	BGUzBjh7atVnRzw6c04Budrs2hCTw7GbfskyWYrhrl3pkIfpn4ddnwlfrPfMq9qG
	vsa36kdcj5yhOhBRDY6Z5T2l3WXxX3ylySjHtiZvmAH5vSk/T4qCGEKeFnDC/wER
	7hBolQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d84y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:34:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so5542353eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050487; x=1793655287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=Jkn6mb7PLfiXNftKzZLoZrh8nZjG/G6KYD8SBkYZB4Lyhnz6J5jLVWnE/OIdqFEgii
         l57H3SLBVyezx15LQRSJAvsecejHHnbu62wHXwc/0g7WBJcic0HcFn4iOCy97L6DMV7w
         GphViXWThKsXNU4nglk0BMT22kZLH9doo6dt1s6eGao2MdgmcXrN/TbzWD47TEOhYpOP
         F9xdXGcltXMtxN7VHu2FDBIorM0S184a0LBMDlIl5ZI+yjIidOk0yrHrb3ct0k2do4GS
         sbz24SnVChtpzJjcxLZI8v+kmSiaPCGfVXP83RdkgusSWAKvl2E8jTarSs7int50nxMy
         hwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050487; x=1793655287;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=FnloDkoCF139eRtSazfoCOZv7dhqvOKJipAFK2QPbGUOuWoYxDY48Wkfc97NmW9l9s
         SeCZWNEYVQRLmyyoMSYV3qE3QcLbWeK87S9SefKGyt5RE4M6Wbvy7tnJHacJzzQw7ygq
         o+v5hYf1NtfzJVmFlVNjd1+XrRkAGQXLwD21ks2Sic2lNbZRZq/wjsb0R/h3qI1LxPLC
         icfR+MiJOl1olkPJI03rsvqQBvWGpZI+YuQTHt+qftLO7ttr697Ky273qKmHNtO25qDI
         iek21YW3KxXpMLkKOTuDa4ZJoal6IP3Ux4FS4W+ug0r30AqM6/JypP/I3p5lb8dDyNTT
         08cA==
X-Gm-Message-State: AFq9FYKpJk37jBzhWi02waH8ayQxJMu/x6P6efyEcpUWv4GwRHD7K61J
	GdLj/DaEgyX9pFkrWnkjcZ9qlSafdYiA7gSR5rtyPo4X9E+XhME6pVv/k9D/IP2w4FNV9Q9CfQV
	f3OnrIhr3RW/UeSVFSxKQFsk25KYiO9B3c/ArmlqMK4sUDfrlOQQTQ43GipY9bZjUvs3t
X-Gm-Gg: AYBFou07WEt14rdXQkcGLHB+Q/MzTXLutiQocIuoZeEXVlD0jFbOa5IW3DwntUj3XYR
	8ZwUjnILfUjR9to7DILo66lUXrmJQc5olktMLqbZZO2fRkB66GnJdr3cn9Q6uiVILvsQxX5yLea
	ZZoQYYIPKcWEi+e4A3ZPnjVZMAVuQyueJWTvVSE96bB+tZLPviWeZ758Y7+vxgkERZe8NVM38rR
	9ecC1PLRgcieMItkrE/wEIpmjYIynCVTLjU4VmRFZUk89GDqAKwfZxvDNXk8kMzaHn6p8CHq2z8
	zhvRnVSVsvbslGYkFsJanse80Oiiw6mFENCNacfGdwSw/fxE4Faed3f3QEzUOKk7M8nfgjWv18m
	kx8KukzmGG5zPtgjgCrQbvJ3Q0YxPNcHckg1u3bZJRlVWhZTnAs64t4++LQ==
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787582eec.8.1793050487044;
        Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787520eec.8.1793050486424;
        Mon, 26 Oct 2026 14:34:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:45 -0700 (PDT)
Message-ID: <5f6a27c0-9e84-4314-b221-6bb9f82cb1ef@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:43 -0700
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
Subject: Re: [PATCH v4 3/4] wifi: ath11k: Connect to the QMI server belonging
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
 <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX8qqrjyBIc/e1
 mgDMPYIaf2Rfu9iYNHaH0rctvfnY5X/u8aWRCsLvDOnbHe3UL2KIfxRA7NbV1hVZ9BQiqoGH6Hk
 w3OPFKyo1rC2ym4dZpmXVGMKO72UjJ8=
X-Proofpoint-GUID: skswmEvQh_qDTKVcYL_-V5T5xTgaCtQc
X-Proofpoint-ORIG-GUID: skswmEvQh_qDTKVcYL_-V5T5xTgaCtQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfXwVxoxflmRPWC
 GuiP+fQ1xAmDMwtFzxbHr76Ga9eHXJM2cwxLl4TIRgVdxsgCKxEuGGj7z5GkQmErKAMru+SRZB8
 cXLMcptBnAV0sQvg/bTdyKGi2EkFlRn+JDYG+Uz6s2F7kxkzw/QPEAhfzN7yOr3nHgSfdCZeSG9
 gThNXOocNWIAQ21viPNqV3+Nq/ROJo/+MJtSkUX6lSnVKHlXnixgZPzA58N0B01HgVSvZGIHDes
 E5T9VsJuKyTsOh5IPrs44GK4KuEPw5YELTM+ONlQiYJ0WXUWBqEx/4MVPwQHxNpQ+pWO8OvDSJs
 1PTQ2vQY/58565tIeYpWfNPaf3GeAFA1iI1W//YqDx7p62BnVTLb4aj2R0FXA9VdWM2aSBcffuO
 z+T0FFp8NcTdJFiQbJ2Kdh5lj+5yloiExVEO3w5/wJJj/a3RThZ2y5s4P8lOrbea6thdF3cuPzm
 jtSf30y0k8CLfdd+iAg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6adfc778 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kpOCkfKLFM9ZImtyOV0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260085

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 7dc07339b957..6d86e552038c 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
>  	struct ath11k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

nit: note that networking code no longer uses this block comment style, so it
is preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath11k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


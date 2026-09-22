Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A245572661
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096898; cv=none; b=cevf0XBavX3rWxDJahxZVJHD1qu+IkXYQsgJPfth7t55a+9pxUoN+NknXg1l270CrvxVvWU8LXGwxXVc3P4aA0HXkiYK/H4pCzZoxnbRAE9WxxXWqShG/NATo6ytHuAastnVSHL8fKCzz5dde17iRbnglaV3TEjLXLVYfpeHVBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096898; c=relaxed/simple;
	bh=iD/zzZgmRhJW4Nl5vQPx14/d2nileWoW87yndp3Ml1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J08TBk2Cv1ud+cQSdSgqiK3FwhRL0TmVwkFC9pv9u1i7+chlArPAeKUJqIdIQgjJdbxo8j9OpWvvfymS1ZwnzANzhBc034CXnYdkPLDRjpx0vuCmLdwTxghjwea1VSaXJmgHHTwsQ9+J1ylJmFSMg9dVKhXSI5203cPcZhazlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Svvt2SmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqtxHqxZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Svvt2SmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqtxHqxZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjgA8898632
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=; b=Svvt2SmY3+ymXzIc
	CWQFf9FtmUpvg7wLbV3aChiv1BvdzWYKR/XATRtCRlgqY2s232oIzC2ikWZSnQXu
	vKmpSVO+G+nqMkEI7Qt5YfXiDjx+htW+pI164UPoJdMlFp3uP0aLazcfg0XJhp7w
	gwPTVTV8fOUliKjD0nluzlof3bxyI6pEtCzXziTVhi4N3kf6Oi0E2dXu7Zon96Os
	ZVDi5Y6Y5T+LYGee5fJ0vyUlGU6kCeTfIQCLO/hTzJUFMgKkvsIthosPABrg3MK4
	8e6z3f8/giPGT/MNioYR4oltQpimlJdnMNmZa/7pbfyFqtxo0UAC9ovG0zBojsOe
	EJChxw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkyk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:08:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so46601241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096895; x=1790701695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=YqtxHqxZQbhoKmmMaEipVx19GlMYZcqpSAUTjC6SMlWIoGF726grZESiZ2VeAbtNN/
         HaioNGT0h+vGjVu9t9E92XABA/yYsvneaxz3BUvmBvn/Mujm44c5EjJI7xRdy40f1r12
         hVue2LCl1Yp9zsJgh+6FN4BQ7isFSc0XCchPOuxt/GqpHINhw5VCy/NLIlxduZHUiL3t
         6zGv8p70tNTfhv0nn8T5DFOac7BuYNr4kyTZcU+w+BBc6TU0UpdP0G9lgx7jzqQPXXp4
         PFWJ64ndEh+sM0yLwCiqGTmJ9+sYDNcCP8UPZnEi3pPVNRt3bDyiRnjBQQmgDwkWjl36
         oGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096895; x=1790701695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=ZgpVteFlnRnEVI7kVQAxGGULj7hRKDQP0A8EAZnDKBocOYn6MVObT4/yCm4YFaScVh
         FtBIbpwken879pCSAzucScbc0N18RBmURza4ZfAHzDsRwx96ht8n9N4POzjl9/IXxxk0
         uCf1bQTjFl/EUKhf3vOQ42SSAS3rzifW0rLNOhy0P9UzT11CJiL5a0eatG8EtpVtt68M
         jpNQMPPI/Y7axsgyxtePPzUoegYgWBVcDdrz5tWBHypymo9h9Fz3kKql2U7hqf4DdenM
         3/vsZ4xUto/G2sP/1E7bO1o9oQeb7OPz6nNL78vjfIgAokSCoS9k5+YJuaNSY1sDRM20
         yx4Q==
X-Gm-Message-State: AFuF++mj2b7unaVaAd+8FBLVL0dOQ2zMEGs8kbI5dqau9eJqwjRoD+tl
	2Xu0lBEPMVnTANocfOnEAvjgfGwlET1FkfqZcup3sR/LyqvbGim/SPnIy5GHA5pkQd7zyC9OWbQ
	LQAJ26Bh6GjWbxBC1ft+wVX0VMNngSxKxc8lt4sXB32/gPTKHkYksCqMyabRk+vizS/RY
X-Gm-Gg: AYBFou0V1hvhwAwZY7LvyiYTfCjDRFmNW3sf3gm78hwQTDt3KE3xhFjio23axo2OarW
	5vZVOq7fNRNP5GCsWIlXQtzDKdsCoFRAVxhKF/LGHzWuH6FWLudU7aLLA3PFmli2bc4OHdHeP6u
	zYI+/5yBpFXA1DmbhOOcWHko+hxrjFBjJRyYge41MsOxWCQfH/gnTgH8R4etDIZ8uys36P+WHEM
	6I9ANl4JCcJ4Hxvc+l/2FU20K0E15nNqzDVN4oj2p49VM/QXb+p9q47NzEI7lU43qpp/6Imm5tV
	k3NYXYb+AYoe2raJVdus+Yre/FU9NJ2zB88sg1ns7QZle2QiNgIGCpGgh9HnrCYR4+ZwzDdwHQx
	cOulSYFImuvt/HXJQ6xLprptFbivKc3FaEVQ+iY0=
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105791137.32.1790096895156;
        Tue, 22 Sep 2026 10:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105724137.32.1790096894617;
        Tue, 22 Sep 2026 10:08:14 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm5359905e9.3.2026.09.22.10.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:08:13 -0700 (PDT)
Message-ID: <3f5da6c9-7394-4452-92f8-b773cd34aecf@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
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
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b600 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JX_TeLtU1EXCEf5LEwoA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: qscWUD9F5-_BG7WDAongAkYGu8xbfvRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX+vUd16pkPrfO
 aYXcTwUjMCpA1xjFz7qEQDnKwo/YSv9OyWUGC8iS53fir7NNBnhsWI89QL+/2LEhb080xmrG58F
 0TVGfk9v7uG/LWAzUP1Lz6NNbjjnx0bDX6WOYYSOp2HqoN21hFjdRNo40JqovS2o4MdNsQJcw5j
 pi7jEScUCl08cl/q3XIpS3VVCXwF81YuGO++PM23K519PQgamQIh+BBR56vfz3yzoopz+FX/8Xb
 wga2s2DkGaKH+wbuq27QgEClC7Ydy0WfgGNfkLxYGWwLKEieVCpgNAj1e8mqPZJbDBYrfGSOFXZ
 EMeeeAWIiaHZUr5/q0ynlXCZMmXynXL15xcadn1BAweBFuW3km8DjpELQTVkRFCQI3xBkTJcYIg
 VRaCnyhPKrmJHLgokOee6ATFNVzzel+hmsVwm7vG6j9UbjFsi76ixqMg3KnJUVhi17+eKUlIrC7
 9ze7IxnoWvR3Y6Lmk1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX7BbmfuedzKb3
 A+/8V84qKvmHHB7DuCi75In7YmBWak1nCI/5gV2yzVYOBA7g4hl7w9Rk4vBbzWe4wz1mo/FUgH1
 u/5M0yJPR++5ucx5ijYvJnlWmkkIUMw=
X-Proofpoint-GUID: qscWUD9F5-_BG7WDAongAkYGu8xbfvRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220250



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +/* Replace the node id in the control packet with 'node->nid', if both are
> + * different.
> + */
> +static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
> +				   struct sk_buff *skb)
> +{
> +	struct qrtr_ctrl_pkt *pkt;
> +	__le32 *nid;
> +
> +	if (node->nid == node->ep_nid)
> +		return;
> +
> +	if (skb->len < sizeof(*pkt))
> +		return;
> +
> +	pkt = (struct qrtr_ctrl_pkt *)skb->data;
> +	if (type == QRTR_TYPE_DEL_CLIENT)
qrtr_tx_wait() will create a qrtr_tx_flow object keyed by qrtr_node->nid.
qrtr_tx_resume will attempt to retrieve it with qrtr_node->ep_nid, which
will fail. This leads to the HTD path pending packets reaching
QRTR_TX_FLOW_HIGH and block indefinitely. QRTR_TYPE_RESUME_TX should
be handled here.> +		nid = &pkt->client.node;
> +	else
> +		nid = &pkt->server.node;
> +
> +	/* Rewrite only the endpoint's node id, not those of bridged nodes */
> +	if (le32_to_cpu(*nid) == node->ep_nid)
> +		*nid = cpu_to_le32(node->nid);
> +}
> +
Thanks,
Youssef

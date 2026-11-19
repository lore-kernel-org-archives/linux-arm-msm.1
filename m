Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795079121;
	b=p2mc9/VnpfKR18f8XhUv3sbivhalx3BfN8P22lOApCr1NRd5tAsKTqDRWm3mW7KMiQhn
	 w+Dk4wnLbenapl8VBNCC7QemqfrCbzzBZ2+JsDz3YjirFsYs8sREr8e+IfL12qiUGMDZY
	 ZRyqqeMmRSW2UiBPwL+6xK//5bnWzQ2TMcfyk/p2vv0yFjY5qQqXHPcnHvR0o0Tqlh8m4
	 YQgBtkpwWyiH0uyAwL58e1yaj7b4mn7At4wgx7PZs5NlFj6Cc/175xpiZ3Xm9OF+7/ehj
	 kBeIPFW6kO5nK5QuAExG8VJ5SVkyZgcxQP0vFT2J2EQ/aKjF+kgtJeBB0VKN2LhUb6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
	b=iP1b9Dz2WiEVxBg24aPlip1qmDHqJ70Y1TmMMRUbH5Kawf+ip8HHAEfXSNK5T49Wr3+Z
	 73kVayxPcG7UJqua3jchBaAcuIjDnM9fnsVRADz9HXZlNVGZq4mHXzjsOQghybykzj0AI
	 6rkkdpNirVxJwdyTJZkmM83BE55fwYglYP0idIXqDv5QYnfOxJht8NxN2LpKFxIjyylIF
	 1CRL2Yqvfjn6kxIohNvW9UMpymg7zcjlTD1QSiCbtjQy/KkH1J9fZakIJW3gS3ojCZeJ6
	 0FLhLomauhcAOGdIQ5RUoIScGIDpi4OO3Tf5UK8NIkA0CI1pCCoqZsRB8/xMMTFzs+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2183260A2616
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2183260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wIjS1534949
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=; b=GaL5S0Np/e82jLi4
	2RnY2BBKkZLVSl0AtfjZXaJBeSIt4k2eoFEkdNZoPRRQCcwuHR2je+CbCCJhjxT2
	qFEtzE/ytpmE7E11HwPkc28KETBPXZW3XSFjFGtSWoVqIRx8HrAJzh3AuSwqxfCb
	oaiQNQv6UH+BzwPw52PQhrm+255XGNyw+/yuYOWQ6lQQqF2TjxskrgiYEfLLxpt+
	SaVZlJvGbhAnvv9KIoc/jaV8s9xzBCXEwpn2zDPceEltTUS9Fnm4AVbxCokA8GRu
	PaRVP4bR0d9mQ4nMKe1gi+1xCRBDTYg9Xoqwoxws7Ct2B4ymeZnSCnTPhMJQzFqm
	Gg7fQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpccbb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so380845885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079119; cv=none;
        d=google.com; s=arc-20260327;
        b=Mxkt4Ne90wrbjLdZcgv2A1Xu8+jPfeAJCTqoc0HFhZCHwyPLZWkqFEQPUGWsHA9FFP
         CZzWrxRuGknGvbxFKPTDpUpu8EsNAv6PZWR5BqWlQU3fRuHUXWue6K0oODb3SiEkSDBr
         gxHOvCaJMq3adRJ4NQ4QwerIsU9QvyzysmKtjCZT4nZwc8qkMaPM8VJMhIVzmWBjs1zs
         RSuTBeI4HyIj/lpdyYwLBr152lgTG0opks8ogP0rGLF4nN88ns7YNTDensMKf9wphvty
         GTGKA4B8IA+0gT1xwszsvAB30AM3KsS3lFsCs/fI9c5EBsTeVXqepAgXoKP9wKN8xH4r
         rupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        fh=6Pz6Zsacss0/MMjjSucW7ko7pkOt8Z511HMQTWnVAro=;
        b=RWmibceJKbgC+Xyowpo5fHrey3AAthrTJNPfXADS17kQUcF0gf+OI4+JKGcbH2A3YU
         Myv5MAYDsq/Rtt7I8YsIiBeDsv5/XIrQHJr9o8sZKQRCUwp+Eey5d3ygRCPVe2q9thmO
         1+1jIcuAI80x2/Wk1zrqu46IGRcZXKFPNCRvLaG5GzuZ+YG34E1sRb7QJPaYZnefxnqR
         9JrsoSmgagSCLICS7p6o1/+TNC1AZQVqc40uWR3F+PkA7qwQKqDSA8LAyz4vnpbJ6w+v
         KcpUI5GRp3P9NuPd9zAkZKY7fuldPgIj0+YPItwfPnvGOv7IwScngqo6typSL1kweEfJ
         bD1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079119; x=1795683919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=Zhrm4Co5VzIAgsW0YSam8Q4E83eIf/guf+XkHo4BJi7k1X/P/uUwk4LhpLN+hL82I/
         /LtQXFGg5HrvG+hPp0a0z5GcgLw5gII/vC07zAux2vC8NRfe0BcHacdoZTt+LjwdNFKS
         mbglau8/CZB5xd35WLf0PFAedHcygwHhgMleUL+BeLxKUlDVPg41W2PMD8QPz49RT61Q
         oBJcnLeGMGe+r4A/TTep2OWimNcmk62+5osqXvDHS/b2dnwwnii7GRZ7DoncNoiExdR4
         Kl5Ny6uWxsvYVuBaOEF8L4dfCHJzTdQNwT8gzwHxvZUxlqtigTAPkzF1SWeoIg/mm+qc
         HPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079119; x=1795683919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=ZgeVd0959c47V527eWy+JnUYn8H6ONT2Zzigbog2Iyux0vaQ+0do14R1BU8mRkBfmu
         uxCtNgjEJsiXedpCZU6qjq3NUrZOX39rza/1V4v8+LnClxnAbJfzuzv9G+zoCGLpGEBq
         Ew6Pz43f8K8Vv77hM3rSidKX+AsyGIYIKFIf08ynuz2mNkJNMPDyk6vwQz/qpnwJhckE
         W2gR14lksAsJN3xpNUknWoyjBVxdiStDlKH3K0lO/plfdraKL5shqXBxe4aCKcCD632d
         XMPyVISkpK2ZGHcHAeG4hDAMfRpk65mTia1Co7NIX11TvD5D3vKv3FE6nOZjW9KaTvxk
         OLxA==
X-Forwarded-Encrypted: i=1; AL+hErF021uccfQSqPrWh2vKa79g++DDeeQVv/eJNvQWW9DsiGbo+MjOzGQJgJjGklUuQ2SWEhmqElC3UxGeUCiY@vger.kernel.org
X-Gm-Message-State: APuU4Z/xSAxhGzVfmX6LMafaILGauBGAycZkFsPWSbRnlcb7QNItXpEu
	AtDqXNX3JOaM3dR+pdhmUDw8i8GHPUeP+2gMQfrRWDHuEOJgOxienUap7/O/MDe384RBujzL0my
	9611lFdOgQgPPwb++TrzpU0sMppBJ1uZAdtyjpIuoFwNIm68vJ5uVnhWs6EtC7kaTg/iyqMM0Fe
	y4+VeD4Q7LxXEXm92Nc5fmEeqr9j1aEJmLl9FO1EF9X44=
X-Gm-Gg: AYBFou3x/hqXeSrgn3XykxVVO5kfuKOgFfLebhcNNesWwF55rSAj1knq6M4Hj16GnZX
	Fn65KaKWqpISBnTDefSK3BtwRTxDcBhhE3eQ/Dw82kAMhlseBGBHJHqt4UGa/6ZVhm8/0JcWHN8
	tPjB9sqFRYETSvBa4GOWpCQ8Gvg8cR3rR/m8+6tx6TXGo64Xk1c3h8JSIsW+TN3lGcvxc60sypd
	+VdLtymDMPOPfmIX0W+zqYtjAszAlqHFB1DLKYR8Io+H/TmCV8vYc1wLq2etyW8PcdFKWIu4oEf
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id af79cd13be357-949996055a9mr954536685a.68.1795079119351;
        Thu, 19 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id
 af79cd13be357-949996055a9mr954529985a.68.1795079118704; Thu, 19 Nov 2026
 01:05:18 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com> <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
In-Reply-To: <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 10:05:07 +0100
X-Gm-Features: AclHuK-GXDRQYMjZzNUPKgixOWRkc2SFP2WEVl061PLLQkCPbkUsldWxw4HirwE
Message-ID: <CAFEp6-1AWQg+rpnZy4w+4khc7PC8CfT7drcL4j+upDWniow=4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: Alexandre Rapaille <arapaille@atlr-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afebbd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Knk3v0qlAAAA:8 a=s-NlbNPW_lAo8gpM8kMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX/yRDmb0LS1J7
 8XPD0DhfmKZbQYcupop1wGtgSuZZh4UjJ1lR0hng7rtu6ohLgSPZtLgJb3aYqFL/xxkPwhnQfgI
 hR0PossHVfezUY1ze47ytYM5NhZpjbf8knUuDQjfMB7nk9ABas/yaisP+ti3MhVAJGiZD+IY+R8
 L5aljLjM2NuW/0Rb7lyNqNQGNcteOz4xSgy+nrGkAqa5nUa2wQrNMDCaao1tyHmeQBz2W2LXJQ1
 TM0fTVZQ9MyOjD629mblgM7QmISWoIQNN7pYzilhHkBV/JwzOyK3TWY38BpQ1inx43wJYbHkA9h
 xQ+HW5XqAop2j9osvZLtcCVqR62c1QsQLNCh1+6HFEe4CQpZzmhlKM7W1fy7O1ExjBozZePuU7g
 D4YAWOvgIqUb5G7D34kWo6gJSWUl/Nj0NFk6/GnmpfFYjcdq7k2/wEh9IqLQmlZMzOr38WabUG+
 DmawhW5gcJilcZG/yJQ==
X-Proofpoint-ORIG-GUID: ueucgCSmJ23P1PBCDn_3Neaj6u2bUyVw
X-Proofpoint-GUID: ueucgCSmJ23P1PBCDn_3Neaj6u2bUyVw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX2tR7kH/vlkg5
 MLeQvdXt5SFwFJT4gGUdM8VCIm90CzKqg7v/CXio8vymV1YD7XyRxHxHZebeWCfsMqfdL1dqiek
 l4+WeQe94r7Auup9HTP2MXnG9lc6X60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190035

On Thu, Nov 19, 2026 at 7:59=E2=80=AFAM Alexandre Rapaille
<arapaille@atlr-engineering.com> wrote:
>
> > Can you explain why it fails? Is the fix at the right layer here?
>
> On the first probe, request_irq() with IRQF_TRIGGER_HIGH overrides the
> DT's edge type and stores level on the mapping, which outlives the
> driver. On the re-probe after a WCNSS restart,
> irq_create_fwspec_mapping() finds that mapping with a type different
> from the DT's and refuses it ("type mismatch"), so
> platform_get_irq_byname() returns -ENXIO.
>
> The fix for that is patch 1: with the DT saying level, both agree and
> recovery works without this patch (30/30 forced crashes). This one only
> stops the driver overriding the DT, as ath10k does; as Luca noted,
> every other qcom,wcnss-wlan DT already uses level high. Happy to drop
> it if you'd rather keep the flag.

OK, then it would be good to include that information in the commit
message. I'm also wondering whether the actual stable fix should be
limited to patch 1. This patch could potentially break out-of-tree
platforms with an incorrect DTS IRQ trigger configuration that only
works today because of this override.

Regards,
Loic

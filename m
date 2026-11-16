Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841170;
	b=41K+kuQpX9zzXqUhfpTOGWvsCc8sIE7aUsXpoXn44r+He7sHzDpAeR0yq06ricI6HIJf
	 7y+RhLsws2whtTcCI17pSXJJXEbVLp65+Q70AonVjtjURJSlv92ozhe/lwbeykRn5afJa
	 HZcuF507kl4pdWfXyNbr7OgOwYtwg56GOw+0Tx57TqyoonB24uKtcGWA58d5/p8U40Xtj
	 Eg2+cXd8C+oJwvUPpWyzITFFMGY1o+vdC/cN6vrJ3N+6xbeUuWljWkI3UvH9q92B13DJH
	 IflC4sD311Mm9EbOvTIQ5OJQCNbG+BrDOZlMc9Qc26wnjwf2xQThJdqtem0d9teFzyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
	b=cU6Db3yTz9l5J99awpWz7T5AFdySuj+FIcL+F4PRVNjflxhY2XAehMOjXs6ttDBagGUc
	 9FpkSoXeBAj0qhIM/O7Ku+W+mYhdSPldJHaQfRFMuUpTnQ/Ytn0PnfM/wwlt1ud6+1l/M
	 FzAvpFNLL0WtRIO5EGXPq/rmOFOIfhpcaMuLzHaoNCqe/q0YzI0za4BYXFVqQoRFVQIIB
	 wU9pg4uUbhKzkI3oNNZCsVDDjzYE0t96ZkIQoTxGLSg7nEhf/Lg/TI+6q5UrcVOGfVdqS
	 SdXjuxSvWO09esBR0Rpu1NCOe1Pmn7R1RKDuRHbRtPitNHn50SSZy+xuLS00DHaK6TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XuN8VZj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5924606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5924606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuN8VZj/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDtCQ7125545
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=pb3Il5lDZV8XGrNM
	LLuSfhhHKQPYEpZyE2g8CuQhGwpdpOranpBfGH1z+8fL+ZQZ/4zejxMicR6cySfq
	+r6sHKXKnN7agns5niIC4xjpjONWkOfAsMiYqKMfliPwOXoRbbAV7w9At3uB/Vus
	427D+gGFDDbcofjwFNB6ce3Vd1GCzumfUG1OFkKTAflqDiel3dRJksLkMR0TVO6l
	LbElOOEr1FtIjMupAas510Jt5Plv53gAlcnLzXFyGIje1TwUxvTR8GWmH0oipLxU
	GEEiD/+VxcFy1r6aeWzPz51l6VRk42qg8b0iX9UTS/VRYY3/9FihFrDxaAowT2X7
	PudfSA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y07nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so1265043e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841168; x=1795445968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=XuN8VZj/tZIZ2Nx/SXm4kwnVKxoJ1G7KRhgsU+aUzVXa8+OHqowI+ha0wnrEyvA4ug
         XcjiuM5S/tVoI0wfhtDpZd5PIhjiBxUTjdlI4A9U7E5vqcXGFr41XFRD2diH3SOwGdgO
         4pmpUsIcuMEbkvwS4KECrKs2doPrQ9P7/Ih1DnnOclG/Lb6chzI21ar7aw1S0Pajr3WU
         Z5Te5et87AB3f+0v3+h6Wto05rR3vIVK0Z1UeSCZDgayA7nDSQUoiVU99RUyLJUASuAp
         qmBtDHuGCtsC0soFtB0kB8NSW3hV28o6Cbp58uQQy+bTG112fTTx1webFWg8vjZ2vUST
         JfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841168; x=1795445968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=RnM3fMWN0P9hbodxaykXKBt2QcAw167SDOKz+zRdY362navjkwEc7awvtsbibqjsYz
         c0DDwjTHMt6qK+Lvh0X6dXDnd3j6mjjNkeE050qTm7VksxESDnevYyKLzxgxbuFjpV2q
         soRjHsb0pIBJOfP66UIHRzvO/k66RvW1MzlOUaSXcD2ProSa3ced0t1bubHJ3PodY7Cq
         dktnk3aQSoIzxJG+N3VexUnnR2A5ZUeGVVXEg6Qa3LOWsb36Gsz9eOnNg1uuEdiveiHC
         St3XjJ0hmhoor/naLwVMj6fgUxCaleAA1bqoRExCMcw6Q/Ln5+70jQdAbE0dDq+1cbq2
         GZwA==
X-Forwarded-Encrypted: i=1; AL+hErGKaGCoz2umUlhuZcPPV88Q3Ub2uRli/vdPKrN0W/MryfRFCu6EOt56EVhExjYLezmPuP/ZO17zhBtoZGs/@vger.kernel.org
X-Gm-Message-State: APuU4Z/wNhMi/EmwQExDP/YYAG6DxOedEUU2msoytyCj4AOVH1YRUW2L
	Bi3KAzHDnL9Ffh5glpPWDMrEpqdp9WQKTTik0A2h975JqDL6A++ae6FfSFKG/nVorEbiC2t2Mi+
	qMZEhnLs76nxaUWO6sxXC0dvQkdb5DzuR2vEcV1x3ejPOIU+5FGPGZddVRLb9UX5ro2Yx
X-Gm-Gg: AYBFou0p8c6+GPQzgds6YAesV5Pos1HOosJJJ7Ww28ezjQgRGGSEEMTsXu47mWtBVHu
	y8QhC4TLAX6MpLIoi2z8y1QAJ8p3NQjmk4a4EFm4Fg0WrEUSfXPdwSt/Wb6hctkXHoCP6aeXqcC
	hCdIqr31SMHvqf6oX79s80D+j0qslqXyxYJM/GeMGnK0bvrB6nryUv2wdS7retbL7mB1iEEfFhi
	OoyZFj+nyigNNlW1kmrQrvWsRZ53TpFTg5pBTP4ESdlAsdM4WNW4Nk3YuLosJZ8YYMaJh7aeiTq
	KW8ah7rNX2A3PTVoRAfHSaW5hXpmUSyVj3hlZkY62ZYpaseVggvAqA//EGmV+sx6WeLvntUhxOl
	T2pDe9QqQ8qPv1XuaB37Ijhl4KEuoTxIVFIuhu8cMfXBBvsStGSafoiV+dGdFsQCiRohyYKWfXY
	B5kDfa5H3evq4h+Q==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834615137.37.1794841167913;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834597137.37.1794841167423;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115882.1191469.10273528779891181170.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=1115;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=nmf5XJiuMoM64HRXGwco/c9sJpA0SyP6SEfhcFZLFYg=;
 b=9OoXP1d0ITEfI+QdrBZsHqRZY/6c+avW7cSbPIi5eC3sSr8f+QRUh5U44OWYLgl3pZpz1Hx0h
 R+wI4GlIC8pCAYQa37AkKg9OACfKCpEBiEpQp1ES8HeLcaWicxZn8P8
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-GUID: tz0f9c7cKURraQwXjxBcO8_hwrHsE7kv
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb1a51 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XPvbEF_LEuHnWTr2ZGEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: tz0f9c7cKURraQwXjxBcO8_hwrHsE7kv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX5M3NIfhsEWqK
 df24/+NUzAdESPslsDTzc5CgTNCZoQVT71AEmqjCY1/5vrm0rd0CTMk29RIttqqmwRGOHvffcLf
 kOuvrB17vebsU2WVxlaLgdYlSzQv0Ao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX1WiMypx5B6b0
 RbxTo1VNIyYX3XpkwgifiAaRNUG6zNh2Hm07njWPlP0jmtDYPL6jKvEF2LBGZKvZiw27jzFZbz5
 MMmvx4tDj8os7u2VYACXYomRtDRz/ZqU/EgL9OU8K7bKoUZ7Hj3UKvSHPVJ7OuPIfv+TNv5ox3L
 zR4TOptfKP2+tsaHMaAqM6xEvxtCh/uFsRhwRAfDffCXnStzvMzdIm9+sMEo9sPN/tADY2LNFcn
 Xom6LkQIupEXUXnDQ2b8xuPFL9SJCBm8WgGlcVMP1fM00gBY/kST340K2bAqWQmHtdF5zlqxJhe
 76+gjRXxq9NFnFulHRcMakLhv3HC3VzyF9zpW0uXvvKkZPLvKUqQEuwMA3jMps9VH6Y2rKtz20h
 LnQM40LF885W6zUrFtpmVF9u71kImfwj8ZZfrE4FAA0SzZfisC98xdpiRh3ZtykVu2CNXHgLK5O
 B+qsPma286vbspiOOCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160059

On Sat, 14 Nov 2026 06:26:14 -0800, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The index comes from an allocator, so the host assigned ids are unique
> among themselves. The base is chosen just above the 16-bit range a v2
> header can express, so an endpoint using v2 can never claim an id in the
> host range. An endpoint using v1 can claim any 32-bit id, so a collision
> is possible, but unlikely as the firmware assigned node ids are either
> smaller than this base or in the range of 0x08e5ff85. Such a collision is
> caught when the id is added to the node lookup table.
> 
> [...]

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

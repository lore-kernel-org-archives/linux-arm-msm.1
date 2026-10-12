Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B131445AF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789949; cv=none; b=P28GO6HshbAf79EXq+PJ4XEkKrWbAdFVrA8/Mb8zXiEFgvYgN15TIb3LDE7ViDvX9Md9q/DWlKmIrkv6+8o3YmPTGKDrFPnzu+E4BMOPCcAdwYMuONxEAfab9qE40V4zNJUS/VnZKJ966+0gH+cv6666dlWWDSCNgfz4K6pdSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789949; c=relaxed/simple;
	bh=2zyEq/VgBCcszsUxIMduV8bFDSXymxQnEYZbjCF+dpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQzRNzNNKd89WIGeflVFgNCUTWphdgXobt8Y67dkUN2VJ/PCs4/0zCjviK9obgLJzs4AOXl9DbCbxkpFh96quIquOI5Z0vJHvtFGyA+R8HKCjEAldEoS+BOkjbhCOWiG5BjCSkoU9t6xGsXbYI3k3S4cbOTobm1r+ThH7oxCH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN13EJaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fn6AMDbV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YN13EJaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fn6AMDbV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hhK2355038
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=; b=YN13EJaIvp73y27D
	Zh3me5UNfED3vH0Uxz/8SyqWMwoEJj6KnD2XLQoMmAJ5BI4VezkUmO5BwgUDnSXU
	ANJBjSN+RB8Yjt/0CnOD89TKVnl095sjcE3vpUbsz97Om+pg7Xw6fKMdx8dxlGKY
	Pycw7YF7B7aFQujH1w17S5dmkPvzIkxwzuP1/U/ca51JOfY0LZnPZKvKjKFyFy2d
	kmQ2sMYa4cKe+tnspfFXqJ5QFR8g/CmzNjKf6nAH2qXjo/d9xCFOTCzS+s0SIqVf
	/X9y9LyhPGnV5M8xvpTK+ScWcKNqB/hN0kEY55pQ8OuUwe1Z7aA07RmoDJ2Ra5Cp
	sWefBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casdhep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:25:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so316798885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789946; x=1792394746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=;
        b=fn6AMDbVjs8D6KIImLZCQS/QigkBG4R6jZ1k6ARKZK34kfGWNZEs/T46uvskRfC/oC
         yHgG5HnERcqvgLm+U4FNimuf1u4ctAdL4swQEi/qLM1rqLXltfdhz71JDu5ARAnRLm3I
         XdyiN/HbXwaDmDQbIPGbo+9/xUYH2F7MYmuB8SYLcSwxlvYTcHOGMcmOEPbGrEQKM6rm
         6g3j8qq8oeBk8Py4K0d+L4OveI2e153ivAJ2NpZQMLetMGKf2pF83bWaYKXviz91/yoI
         fwm7Q1Tb2r4cXWpIsvmSz8RsPteGJHEzqUUyEJ03IAQbJuIwQYd/k9KYeZkQABm5wMdT
         IWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=;
        b=bybs0OTrtvixJ7zNwu9HbhTmnxnVhN3vb6zU90cFjZsFtH0eFxPoJIZHvnCySfdDFc
         /Nxdhsag2m4y2BFZofbe+kkIirHWF15VMsd2erdsGYXnXxn+0H33qONoXeYI2fgtYsG8
         84RN7HOrLwxKslSYM+DmT1OtXL98CGaz29BAsjfQwLno70Y1ZZp3QwlNFX9IygAT30zC
         95pLre7a8XAXC/2L/bkLTyMmJSaTrAVq187B417WBepC04wzrjreNRRVJYQHGCuxn35s
         /VLQTxlG75U8bs3QbNfz/PPwhLypKdf8NiY3sLoN/2NZGXWNEKt3DoO7/WR14G8RuQP2
         3EJw==
X-Forwarded-Encrypted: i=1; AKwUvBzoWz2pXtf6Dx9NYuRdggPNJyL90UUcLM/YCRai8FRtrn1Rd8RTW8kiX8AL7Wxktr75vzauIcP1NVF3/NjX@vger.kernel.org
X-Gm-Message-State: AFq9FYJOPuZ3KjyhbZumwVz1N1FQCUYjuLaQ2SK1jTBm7KnhsBuGSfvK
	IQ10aB8W4C1IqUmVPA6WABq517nczTLmBBnqgVi5fiBQIJI/fVfYSlKwGHWSFs7gPWOWD9jql5a
	LymHavzbnaer7lDrNcgmtVDal4K4KNS+HrlKxbaUZik92l99Th6Mc+Q7HR587qJDOLo1N
X-Gm-Gg: AYBFou2jgSdXCoQFbuR5kF/oaawp22KzDc7pd+HOjmFsVyv8VrQRhng9GC92U/ge3Ef
	VN872KooTULJMKBm5RJa8/n6WW+oySEVxgSPFy+gPSrKC7DPTSeCmyhal41niWVe54xEJ+UgYXx
	iWDXzWVRk0DEXcWNgdPkfQFc1T9FD4Z2HyQUwxOz7FrA2OX5rLmsNruMbjZJPipmp/XqXxTOUSh
	sB+j8seeBVHVb08njiLLsNdUV+ShCPumO8E40ChOohQXT/vNWmI9VQJyYAJ6JfTkDKzrw2LNzID
	57fgLvp94bLzVXwIAws2Y761kC2j5CQm6oiWKFDmn9eh4XSu7cYtb20IC4iq7ArvptFky1Aa0ye
	Px/mmVwoW7213mqpigIzEz/aY/kopGz8SQHHG0Iw=
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr1472632885a.14.1791789946178;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr1472629785a.14.1791789945613;
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm122840815e9.3.2026.10.12.00.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
Message-ID: <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121515.17207-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260915121515.17207-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX1gK+9K6710nt
 /ryQ+PsQ6TZEjZ6H95pflVyCpSCNFPPeelaYfyQ0YtqIE4Ft3rbl0o2I7ZP/1l+68IKRBnZ5ab6
 aylbQbiemEGBUjKtPaiW8SUC6RrdnpY=
X-Proofpoint-ORIG-GUID: rjGr1U8ihRASb7oGw-w4TVCGg12dRoKs
X-Proofpoint-GUID: rjGr1U8ihRASb7oGw-w4TVCGg12dRoKs
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acc8b7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ZovgdgjKAAAA:8 a=EEfcIT1LpWLEK3Zwr9YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3S7guNGNfWIL
 HWFDYm+ijJbGe5ezvirAxFu9O0vS/PKMOks7fzv9fC+ECyPR3ggHp+zfGGbKe923Y26ZlQjOB/5
 jzHDyZHnVGN7bC9NNSvub8uqh546ZlyP59giMzrDQRal8SRq+coqdrw0C131Es2Asy43d3E54XE
 m5tPv2dinljd6KkDZMuIKrg11xfOXsybKNZKgxO3kRsiydqLav1158vSBn94hPaow6OKU+niFMM
 z26bw8ySvCERliVALs8BlemS3cldDsDw03Q+6jeG94T9kMr0tazD9EhXsXKq1wJRx4OB4bZUsSR
 BgKUpN57p584q7K6BGp76Mt8IaANP3xLuZCGatYiaSdyHZ6JrS5AiEnOTRh8S1O2Ge8qwSBrmeU
 gSVURtzZHNsuA1ljYZfKDDYdnHWASxE6NNGbb/Xf+TG6SxWwnSvdSYIev16uxI+K1GZPTm37qSp
 1nLEm2H4wrvJ9hcafBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Hi Hitesh,

Thank you for testing and verifying this—I really appreciate it. 
I don’t have the SER/DES setup on my side, so I’ll rely on your verification.

On 9/15/2026 3:15 PM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> I tested this series on RB3 Gen2 (QCS6490 / SC7280) with two GMSL
> cameras behind a MAX9296A deserializer, one camera per CSI-2 port, so
> that the deserializer subdev heads two independent camss pipelines.
> That is the case my own series [1] patches 6-8 tried to handle in
> camss-video; with your series enabled on SC7280 they are not needed,
> and I have dropped them from v2 of that series.
> 
> Results with streams_enable set on the SC7280 CSIPHY/CSID/VFE
> resources (patch below):
> 
> - each camera alone, repeated start/stop: 5/5 and 5/5
> - both cameras streaming at the same time: works
> - the second camera started and stopped 8 times while the first one
>   keeps streaming: 7/8, the first camera never disturbed. The one miss
>   is a sensor/serializer settling issue we see on every kernel when
>   the second camera is started within ~2 s of the first, unrelated to
>   camss.
> - CSID test pattern generator still works.

Thanks good to hear.

> 
> One problem found, fixed by the first patch below: with the streams
> API a non-lite CSID registers 4 pads, but camss_link_entities() still
> links CSID source pad MSM_CSID_PAD_FIRST_SRC + j to line j of every
> VFE. On SC7280 the non-lite csid0 is linked to vfe_lite0, which has
> four lines, so it asks for source pad 4 and the driver fails to probe:
> 
>   WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
>   qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22

Hmm, i need to check, thank you for catching this.

> 
> SM8250 does not see it because of csid_vfe_fixed_pairing. You may
> prefer to fold the guard into patch 4, or keep all MSM_CSID_PADS_NUM
> pads for the non-lite CSID; either works for me.

Yes i will take a look and verify with other boards i have. Bryan has comment
for that as well and most probably will be removed in v2 since the 4'th line
on full IFE will be functional soon.

> 
> A note on the test tree: the series applies cleanly to next-20260911,
> but our board runs the qualcomm-linux qcom-next branch (v7.2), whose
> camss-csiphy.c has a legacy/generic-PHY ops split that yours does not
> know about. I ported the CSIPHY part by hand there (a second
> csiphy_streams_v4l2_ops carrying the legacy core ops, and the
> enable/disable_streams helpers calling csiphy_set_stream_legacy() when
> csiphy->phy is not available). Worth keeping in mind if this series
> is meant to land in qcom-next as well.
> 
> The three VFE fixes in [1] (buffer done gating, write master
> selection on 17x, VFE reset with another line streaming) are needed
> on top of your series too for two RDI lines on one VFE; they are
> independent and I have kept them in v2.

Maybe they will need small rework afterm stream_api flag is changes
with list of SoC's which support stream_api.

> 
> [1] https://lore.kernel.org/linux-media/20260914133416.1030231-1-hitesh@ebytelogic.com/
> 
> Tested-by: Hitesh Patel <hitesh@ebytelogic.com>
> 
> Hitesh Patel (2):
>   media: qcom: camss: Do not link CSID source pads the CSID does not have
>   media: qcom: camss: Enable the streams API on SC7280
> 
> (the two patches follow as replies to this mail)

Thanks i will look at them.

~Gjorgji




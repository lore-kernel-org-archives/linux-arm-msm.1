Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501379;
	b=XSpttfrMKG26xuTFjWPYJ7aO7PLKXZ53z2Gy29oIIC93iFesOG0iYa5zPZRFWfFuM2pF
	 gxuvttqocZ21N7bUmYuKSPISCRL+wY5kDQ4ZAPIp2QxWmz1xuIjMYvWGVuSRnap6PtKkI
	 1R28en5vaXN9BOm6eKDAweejp42D5VZN+Tz6feaLd6IOhpCJzSU1pKuYWMcFBVMfe+7aq
	 VXdcRXq+C/wRk1vqndIZsowRTvTgDAXG7sJAP+eLU2wcf9G+4cOtbWpt9WkgBL/RrngXo
	 DPlpayx8HOBsaEUFSZqzPVAknCTX9mR7PDEfcM0XYAqUKXti3Oqoi0+2Wqyb4d7iUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
	b=lZtlCG8rCt2n+PvkZJVPpLb3/nfJWVH7PUVvbQLpYHGuEk6W3v4WF+rvo2Dg5ZA51mLm
	 93kLqi59IR69jWPDWpIGLUu5xNyaU4dI4KVl/FNpS8j3qmxTMRQiHK1GEMu6kt5DbhpZG
	 hGve44qAuHpTGFMRNgmrZP0/oCIkPXbREvV0J7kkMhKexO1E+0nl0a/mijPHGwE5jI9/U
	 6yO383VG34Jn/oDeyp1YA/MtLJPAhkdwTfUhPmgWZqdqtgzjN/HLhjSrJkvJRrCHfmVyB
	 5fknSug4DSwueLYnv54mFFs0/jPAEGi/Y1RyjNUMyoFwo5P2qnu33skEq7YMaACzUXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DE60A3810
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3DE60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx66c2524247
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=px4pRxwPG0kCk7ZExiNp1R8A
	gRsYjY9bdnbQlLC4dRw=; b=XrtP91GN1YmA1JntTWsZNBgEH9FPP6raZCo7X4DF
	qiN25o8diN9ekcIMUCjA7esWlm1+AA/vVP1KSguAz4uyeWfIJQEVAL9fyxp9VUZg
	wfehte0qA+RYS0wzkSDWLuylZWsG8AmMK+SD4IfL9UPZeJBQwckWSlHaqEeTTFzS
	mZjzRUGJcXC12mq1ueTpuwdvmQUeo+t2fkfNP0eMUfQYoXZPcmH6FBJyc5MiknzW
	CA0sQPsaLAuuiBSMvEoXmM3CXxSKukDeAtaFfD62LVug/W+tUASeZHd0nyJNc+Wb
	ajDJXojgAFcTTSMxCaPqWe9hdpsV57xk/2fIi323lyB3vg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2jxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:57 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ea71263f4dso582696e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501377; x=1793106177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=VfL7W+H6/39ZjUqtvmvLnG4f3PYJNs3YHcHJQ8CrcgpmCbadEKosqtB6QEKN3N1GSA
         IF8wheBOE5MmQGQDuHW8xzdF/MF0UTBLWchkmj9NvY+dGRBdKZGSeNzCdbdXvHnOleTk
         zZYhnkXzRtsv1RVmgWOXqRapg7Ri3nzdQGZLkQzyuaJamQoylOSdVsCoIyKqlNkssYbd
         Lu6skJQJNjMYc0vHWbXmEg6J9OocUmG11QmzR0wBsZwdCs1/qTqYX1uHZ+mHDmS6JO4B
         7jaVuxltNuOfNzO5qlN7LHHI62USx9Yg6kKzXX+hymsqP6PhMvkVD3oLSWlvvx9pZHdz
         yjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501377; x=1793106177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=ldsPQVoGDQEsav+zN7domGsItihWqod6Q8YR4a6yAbGv4wapEVXBwI/nVNGVqpEwv4
         PKIKVz/6BUfn4QdwI3JesIAz47gvLyLFjtC7pBY0PxqUTjPCzFDklQDjCiqc9ii23W9B
         VW6yxBDU1+lZg4A4MjKGoCGbAxRARDBsIJ8sx40ok5/KKsfsQB2cOmuJ4+woZkhnG7Gj
         PcieGLsIsHnHHF0hrqbJN+G7MaznEewYw7pjetOE4c6GIQ7EIedcsFbh5oCuJxcD7vCn
         lPov3TCHOEWkXxNaaoSK34c76JkHcWtQHxTL8ZC3Bviv+nZUwn2ifT/qsKapkyXRPjD0
         50bw==
X-Forwarded-Encrypted: i=1; AKwUvBwenwkjqnadrY4pWU1uWIt3els+Rr4zAfj0VDg1Sp1mgzqVg0HPKQQ3QruVSE2oeBOMRWyY9uFXuRSRYB4k@vger.kernel.org
X-Gm-Message-State: AFq9FYJ81wRTecBGpTQ1BuZuz+SQHxVS2w6XeJW5XLteljc9YtNCXVt9
	t0JeQ70UGKaF+a6xqujDLr+R2L2ZeUaUf+6or2tyhxZ5PFqGzVgYHlZER+JW24ZoNMceSs2frvZ
	0/lKSSheIJxZJDvKkqh5kklEgnCF8vQDsVt6Q2ox+FBrNf6CjQyjc9NNEYeE5ZoNUVste
X-Gm-Gg: AYBFou3QKW4u/BS0z5KL7bqKL4RCe0xRuOnwIckF6WO+g9rLYMnqOyBjnKAmHYDeEuH
	BPMM9bnmZjdmvI4D5Oc8n+elSi6kjFJkj0LrtTGRXB0zWdXYWqcqwdPSwBPvj5fobHnsVcndxzM
	VfwNyCqpr+WEWnxdqXdhM24mxKWQsfU1eyfeR8PLbSa0cc8yjRYx3U+5Q0uCClcpGBBSSbUJhEK
	RFdLvJWcntXsqBGoPf2eZ0Nsbmn/DTTqLDw5RsRaQd1pEv0mPp4P5c73QFOaeShwbyAHRyj3HO7
	a05zTB2vnEPKU5Gd88+OaifCQCCWTSOw1b3kLNvzUy7qUxT54IUZX1sb6Q8J+vH20hjn5uxz1hx
	o8tkJSvgACSQ8K1Y7
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663485e0c.19.1792501376573;
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663468e0c.19.1792501375911;
        Tue, 20 Oct 2026 06:02:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm253748145e9.0.2026.10.20.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
Message-ID: <c7kpksiq6y3riziq27gogegfcybzhaxa5v5d5z5ajc2m3o2dwf@eebruydbwutk>
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ni1nTn9Wn_LcCV4Of6f2R1FRnf8u2W9A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX7dKcfo2EDMAG
 /jyR4Jmq8Xjq3g58kyIg9qJyNFXIrCHWh46O2vfVvpSLlj0v0Gm9cGJPfUM8tDWwL0t4ybibPkA
 +3StVESD+dDD/7HDEjhZ+JukGrUmKwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXzhhVdZK3/nyN
 0csa03V4dgQfsvIbHYY0oSkPlUIQLZlc1pNtl3RrtNFIxnd5IUn4tfE3JycXq2knOhl8Qn14rOV
 zLCo9hoGllmxMmi75Hy5bNjmeQ6OxB32KnhmWgypYSruflQhYio1qXVbFvrEhFuq2VU04SxKPkf
 vogecrdABA/OdUeKMz5f09Y0KfTiOpwIXkIKnJQt1nBqvSKgsoOpHgzpvf7Nq4CF5HHorh5/YUS
 /X7rNLxQLdOMog+KjMnRZvRlngSUqpcu5xrf4hNf7hXWrV9sbved4nQS929QiDszlm1TcnSoM2a
 1ucPvNCk9x9Mpp2CzpTHN3iKUWFUdOyk36HXpgpPukDikLJONW5qMHbn54KbKWHrDbjaFuz+E0y
 dTks6NqWqxCDjJeC+lo+Bh6oPalWkTnVmmFInPNBbwAaPoJMwLdTq/qycc0oLj+QMCEl1mpOfia
 16KDrv4gtOX30vibHBw==
X-Proofpoint-GUID: Ni1nTn9Wn_LcCV4Of6f2R1FRnf8u2W9A
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad76681 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tEwKlQtQ9BOrozrowe8A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051

On 26-10-19 23:37:18, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

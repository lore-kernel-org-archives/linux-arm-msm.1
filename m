Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995777;
	b=c7LccYqv3DOJj/SnJLvcSFVZ6gUlg3XMPPfKM14RGrWHU1F/YnBtWrcfCoQV/ZSfLIn5
	 peg8vuNXY4XEX1rJrQKCf9AM3RF8KtIQcfBx6s4TaAgjsdnbftucoyGFiLllHvse179Q0
	 KTUZdOW8g/7Vpg2+v3l91fqMmcG136TJrWcjCAYT1JF0cjiRR2By6UD1PE1yZ4P5wBnf3
	 Sjfz7m122Wk19d2Vu2IeMIBc7ZFIQy9eTK3bTKek+rzaI+/cK+0uRrVvxVPkEcRr21lF+
	 YQoyZ81Sql80mcqSpxtwhfYTeps0srKb7cUW7Mk5oYT0igBELJnxwr4yojOvBoGr4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
	b=Y5F2KWV4qd3REe+Q7CygnoLPqZTdqvOdNWY3B67+MxKV1/w+Bgv2pEVdRzNbpTAkcxga
	 tnzx2uUtie8KHH2PhkI9eWlJp2c5P6mPXOBl0gJkykn26foomjUbK33myQ/YO6/BFQB1r
	 xDZsGRtsiLqjwJyiB8/oDBkHQdeetXBZcaXMiezv4Ptw6q1JpWX5QMe78s8iekBEMVUfq
	 6T1b2vVr9uHeCKpOLwTW4tmDKEDzvQkux61HxZVK7SS3FDiPa/RvjHIqAxw7VU3hTwQAZ
	 3Jw7sRsuqQFCgok3HlospHtBx6j91p4aU1t/FGDknJjTuY92Hr5lfwJ8oJ3o/Er5XdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjep0Xqf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A69606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjep0Xqf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auAF2255188
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=Igk+3iVGlbz5b6tB
	V0gA1Nrz0Jly4J1OoNE4xjoJzvyRPSUvYvWw5qqIicKvSIFMpsef8xt0gCj8xm6u
	m+3YAe/99SqF4IOPJYeMV3u2Ko1V4qRB6G2Y+eMGuU5FssFwDbDQYNrc36fCvlYc
	O0BbhCKv3duQ+abRD280UU5h5nx3fFj/1/w+yVP+P/zvM4xQI18VQikn4VPcPZGP
	nNEITFedz13srfsp0fnhIfkYyy5z5Y8hYyDCG8prtOzLpxBgNC8oL06RDGX2Qody
	DkZl0Q1IRZ6f5nDTmYLGJMLnUFa7PLP0gfiyQh+/vS/XClLzwNAIG136J9NUOcwJ
	xlMm5g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3n14s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18eb2616974so10200551c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995775; x=1793600575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=Yjep0Xqf6bdTiKRuVRARy9CvCTiuRZ2d68nGzYVb6CtG4BeVFbiGQFvJ9WKUU9ekGT
         nnGSyKxquyu1S7mZnNDih2yW6IXTP7Kh6T0SHWeyx7ynpHqYBbWk9JUIRGm129+YhIAY
         LFiMHW1zLFueThJ7ANwDRsCUFW54wZlH6AGpbEe9Ga0MTKfoLKSYL/mQ/hEnyeKg0w7p
         t8n3Rbw/FbH+4BFfZ/6jc4gdCYd6aCXQNWOLxUbMmC86AbGd6UBEdn6iwvGGBjdl8dvB
         TogHWygR0R5YLouI4QlovcHdCbGcUVJKo8Y4iFmDpxhhW+7NNkJfAWz+oac6TsTDd7JZ
         WSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995775; x=1793600575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=gAEXehsOq9htV9d+NGW2DUk/kCX56QeWRVVY9kvuW9KNs9hAIDvbJ6gdRAUwnYTZSX
         mIORN5/fLDN3rDagp359NuifN3Zm88cbNCz4DAWc2IXLdsTCJq8Cj01uvS4DY5H1EtWt
         jBukbiR/QaWjjT+ArsuRHdoDk4gbU1tSTTIx+fA1Asoc4BHpfsAidcVYUPgAnNxf60um
         hx8Z4y2//mezR4O+3oKJwl6AC5HYEHVX27hS3pmGV6/J3XSQCX3NCIisxVk6grI0p9LK
         +RJVYtn4F/GNgx6GIc7Tp/Dj4GoUJhB4L08rz6sPtlqq77F/IISQx034G85xKLkrMgqh
         JKgw==
X-Gm-Message-State: AFq9FYJMVk3JZuNND2uVvpxtX3Gux9mBHirzc8nPjpWdLOmsNM7UgzKx
	2K1d/TzpWThTqnie3Rdb6REZCaa1Z3OezzC5CEctjVxBkEdWSTOYYrGHwx5LJ3q8sFWnhjNS1Uc
	jFlKcZlDNp2IWkZ6ZJpSy/QRJYEYKxeLIwCg3E/tXj9OuYtgLBHOJkeLCTn7xr9NBf3ur
X-Gm-Gg: AYBFou2SgQwinGrodcT0wTBKrouEBaApmraH3thg7ZxqRYyIBFHfbwa0A6bkdINeguv
	k6yJc9LNldBI95TAjBc2lqWDwALajk3Ogr2yyQg2Oxx4JunixNNC2WJEKNsnBIZPkXKS8dGH5Xa
	CeeOcQ+KXM0FuIrhvIq17isnQlwaeoiOQdY83x9neAbaNV7YKDH+nfUgeOjQOaiay+k+Xq41K/l
	2UxIW9ECcmbzmzxOhUsZWsfNuX2nSgiwdEnXMqw9Vp+fUhvXE3nUXu73yiwZekE+tQdLsO5/C4S
	D2dXYnIOxHhwu4sGahiLGylOPzN/nQmJ/PBjRYO4NzZfljdiegyvBIzQBggfOBjgdMvGEhZVvSC
	4Jw+OIW+AJddAssdc810PPFWCMfg2xIIQ
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204930c88.1.1792995775116;
        Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204894c88.1.1792995774577;
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm19719783c88.19.2026.10.25.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
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
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging to the MHI endpoint that received the packet
Date: Mon, 26 Oct 2026 11:52:20 +0530
Message-ID: <20261026062244.2875432-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com> <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ityi8fgXoBQ_hIoh8GrH_YQGVNKMGzVN
X-Proofpoint-ORIG-GUID: ityi8fgXoBQ_hIoh8GrH_YQGVNKMGzVN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX3YohMg9ilTY0
 cHJXPncdmH2eTkQ+Qv972s8w9VsvKtNfikN3HyKuu0kgJUVwPp0nd/EpvKGE4t8Dg8HeuWcQBoX
 mIpnCXGjEdpeuF+pR8W3ze6DEjNCUME=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adef1bf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zDojY5Dqmkyknr1b:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nUn8ewCANHEy0S7HLBYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXzlXED6CLN+fZ
 arPlJUtKZRgurdylF+ZTb/7v1Wz6xoTMFoq5sw2Qw32d//VIppdCLvBPaiFNNWky8WTtxH6iDKC
 dEMAtROdb57i9nV/4pi4kovUBq5FGzVet15xYVgKqc1z13ldiPp5ykZHbGDjRf52oaNPqV/6BiI
 OMpLLysLXVy4q2+QXRKhBNZyrJbcoYw4vZnIbX9MmBchcx9O2kWxmpWJNvLMZJ/ugjSO9q8aY0J
 uII7qTLQJ+R3nDIclOsxHti++QKPdwINlZKeIGaIwnkSmdmARH/CqNtAVAfJg2S1d8/Zx9LbZRH
 QNmVpfo/o5qpNM1QWeHeYXVYn0kCIoM910zYmOTLRiyPfD/kkTeGuV/j4awB1C8JjqZ879nLLzg
 U3EeedQl23BveacxAUBfH3NDdwvsdnfnJIkBUqFFifT+PKwV6s2191vGf9OnI0LSHGXo+Z2NzeC
 CX6jtCAKwEoNHJeUn7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

I took the entire state of the QRTR directory as of after these changes,
on top of 6.18.44 kernel, and with some trivial changes to avoid conflicts.
Then I cherry-picked the ath11k/ath12k changes, which
had no conflicts.

Before these changes, Cologne WLAN QRTR NID could conflict with CDSP QRTR NID.
After applying this series, the conflict is gone and WLAN/CDSP QRTR services
work as expected.

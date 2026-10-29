Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262953;
	b=dKauc+tUpxry2n4GxnpW51DqgK4t7LpKO3bd8Rb9ax7CvzUKBptH0LVXv1vLPTqVfKny
	 czBJd8gI56AAqtmE23gHQi3zKtTvtulS/vtFJoZwz91skAsaRyZr8ByuUSGrx3O9XMAhI
	 bloeOgNDn74xSux9n7YBgSwAhTfM+e9wpI/n8ejPe9idzD/2k77seK9hKUM+MnAXOjik3
	 ZBoQIOMNasSVgWj+AHruwUf/yF42bg0E7vzqr3jRwWcCSyogjs51RLqCl4pS7ku6kQ+Ek
	 nxgSHKxdMs6MTb84fzzHhk0INj4zrFwORc2CNoHF4np+IybhC1kskddTj5+4Wzc2lmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
	b=W4QSc3UHAKNkA4pTG/C3qeudh1qAh2v0gv+fwFS1nBALkd0M3fih0yONEHVN769jMEdb
	 3zbjq1VkUTuK6y19LDd8D8Ud1ohM9mqiYIewzwr0llxRQv+HSvix7+ogeoqKBDObuAv2R
	 mHSt5e5iiwpCvD1kbR019rAPRDnfJ52joHQgjlVvDF+PRp2qOw2ZKdoWVCf8v3NbXF7I+
	 6xspgXkHO6IQV6zgPVlSRwB5zGvvPnGJ9wn9BEwLDQTNDLTVPLCzFsYBLgXDFjRGYhdOK
	 zv4+FuwviVaC2rZk/YkLnnTBEZd2SHjEy8MkzcrboGKHL/i5ESGtUIDZI/x7GKiUFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEZY79ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRZyUOR0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F73606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F73606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEZY79ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRZyUOR0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H7kw3829254
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=; b=jEZY79ZV/fojEjnu
	SoUOqCZjpsye5YRRG5dx0IaAKHAVP4g8s/ka74kpzZRXYqnjJtaGM2rJKLhX8Je6
	8cxvDeuWX+4NtunRmn7P6teXZ6avB/MS8nDYT22j9HdtkbqT9uXlT9jmArBFUV2f
	IPmNYR/7ycGUffWbB8IiwMEGmXzadQQXQzWlb1xkkaPsTLCx2dDxaW2PXSo2/SUj
	DqrqTCxMhUiacdLQd14m9QrnD/nA0jRun/Z1PTMwhauHNqI0BlUJWtvDZCD5m/RS
	xiDN828HL1QgVPO3A3S3MEmJexm0rZdXuxpZuk/8WoHJttBpVFgZCrwfNcFEB7hG
	jbxPpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp9qyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:35:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so311143785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793262950; x=1793867750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
        b=SRZyUOR08RR4nqNNbk2xJsTF50L71KqZY2alYoV9xP4o/lOkyWBAiW1J8k9d7juInW
         Oab/ZmoOkKiogmnwGi0X2pLGOdfATOk2SQqp/NQz41jMM6HxhHhZ6Zne2epoCAr74A6b
         /KB88aZUtvImgyw2MaYPlZ329q+2ujWs1bvM0y9s6Px0u3IIIcgI3fJzZZlLmaoHgsHp
         le9+HvQGCkHtUH47gnfdi3MPKJBra7rJWxoABiFlHL2l+v3C6wOaaI5Kaoio/0p86BvW
         0BcIDVKniGjC1PyiueW4SP08csHrXuDzShaKyaBgIJPFLFpu50J/km96MDkjfA6z8sP5
         boKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262950; x=1793867750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
        b=nNjVy800ZsLiWpnNekn3PhSztaGT/t7ov1q29vYJyTMmsUH6vMWy+cmwhmPoORWcPd
         UpKLQsa87khu0Q6fox6FZzBo5P/27qtc5WQdilVsq06Q7HSgYNkkuD769x7cRyMSYvn8
         qxHQlXbUqKRQN8zx0dDFE3S97/GlyG7dpj+122VTOA36TfCPu2JgbBUUusOzVfwuQHl3
         j4AJKIuVIc3ZCusLl295+gzRkYGUhrOHtWizh/DL5v258IYOxdK9tzEQ+/HNgil0S4kQ
         FibKcAJxwMmI+9yNTT7gP1Qn1s50lcvGTI6Bx0fY4tre8X59hzamGXZCk8J45llewi41
         CiCw==
X-Forwarded-Encrypted: i=1; AKwUvByRErpuBIZRriznHWYG3ORV3awr3jf4rck0yx4SPPV6QmdB4inLOflIbtvUuwbe2vq/xlMVyFFY/Tre5gni@vger.kernel.org
X-Gm-Message-State: AFq9FYLYTH/Jp/LYRDaeoTpKq79J7RQ48tWYt05FB8dknGbJO8iYrpV2
	xlJ+6FbQNwVl0Ez//Qa2XQpazfqgZFIOg3prhVNmJpBgHQyM6iGU9caCAT2CSQEPj2BoWIxuSwN
	lIj4tErKSKSFS/s1OSwUwyU6Edykrx57aJZhdzmSi8KVu+nT/jFuNhnvuKLYCHwLgHj0Z
X-Gm-Gg: AYBFou0C4XDz3Bk3ZMh6DcyrqyBsJVIXMTbbqUKT++L2zLVzJVEij6dTiz1KsfBxl0B
	NljoyQ7aC2oP1LifEUHSOGDaR5tTKb+XY6q/a8sfP/wjfoIjKrtknpUd887NFEgvSNTqD/KaEg3
	PHbkfhrxNaLf0nRH4XTsA+3X7L/flfVhe7s/1O6+Wu63GdIv/3QnrRlB6HzEnNM4dHDUQrd2c/3
	uAYbJbW6ernjCNSXG0w1OEArtEMgsSgppTbD1902KbFRrk++wtl1lTkBTCr6EKhSMtDdnIbxilp
	CrozODBscM6aBMZ5adNZ6/WEeIhsijnzIcH3YZmRBWzFCbsWCpumynp+vdTaJE+vFfLFdU9okTo
	d+18RLZMJZajgzzz0rjMsvV76SQouaRaDtER5hXQm4WNZ3uvWBB7JbQnzg/YUG/aH
X-Received: by 2002:a05:620a:1710:b0:93f:35fc:5266 with SMTP id af79cd13be357-94408cf77eamr750027585a.44.1793262949982;
        Thu, 29 Oct 2026 01:35:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1710:b0:93f:35fc:5266 with SMTP id af79cd13be357-94408cf77eamr750025185a.44.1793262949364;
        Thu, 29 Oct 2026 01:35:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm29614657f8f.41.2026.10.29.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:35:48 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:35:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
Message-ID: <out5ml4xkfvizxenc2yfokuxzprha2y2p3e3d7pnhimtcntq7w@uholls5kz5q4>
References: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1jnvZKL1md+I
 WiMRKCsHMMQl5mJNd9aJYx/HUhYI4n4NEqLN1xYIloVDMF8hsiUTtqWFJPmbCmM8SU8SR2QLaFf
 Kgk/NraOlL0pqv0hv6QzlWnyylNyusuLWXAF4unmbdU/fizhiyV/H7sDkFr0btZVU4L3KQEbYET
 L+xiqBJ/NQhZFudzwHbW/v1AWKeF1aLm7F/4DYKW/FqewiueAxnRLsFJ/aYhKddEO0N2kTMthMs
 gqejc/YUARoOy/JLkav/TlmoLgXgOrb7uP43pA9JTWWMx3M5l0hQAcO/GRVswuDH/dm7MML1wlg
 bfdCTQuYf2kSBhTxPjwqYZSmbv4Ogk0nNRmQtm5FEBDhkzEP3AFE0Wz7Vkgh2Ur/jjxje6xZ1hb
 GRIjkYjRdeG6k+GHC76acaHKXEEG3PAmyv6blhhXhE48HcOAmmHMe5tzLwxtJ1ehgRaxgba1PeO
 6eietqqkOLKo2y1eo4g==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae30566 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=GD0A6YLuM76K86w4iVUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXwXkHTIzPoaG2
 +bco2yaKZ1Z0m3pua54bFATTaX78WcPDPd+Y1+zI6JMG4ScPIpOUWwQibxgIvUygWGKvqSj//WO
 kSuwMzEtOZOiJe0OxjHvEZ96dlrUbJU=
X-Proofpoint-GUID: pf-kpPpUjxacWk8iMIpZCJAJOKLt5ZKL
X-Proofpoint-ORIG-GUID: pf-kpPpUjxacWk8iMIpZCJAJOKLt5ZKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:20:41, Barnabás Czémán wrote:
> Add support for the Qualcomm SM6125 SoC to the protection
> domain mapper. SM6125 shares the same protection domain
> configuration as SM6115.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

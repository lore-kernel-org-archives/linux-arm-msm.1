Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782532;
	b=MHemhS/svdSCokt/ANQyxLqGZAtcXnXiy77zqbK86uv4ot2Fsa4TBm5gJZENCC3ABP0V
	 VFUydolRceDM9cVMgC0lxZ8gtbXNs6btA6LTL92/4ZdIXfAZSoWy/mFGI1PpTmI0o7CPt
	 II3AtLiya5QJG/Ap+jldhQG1Fz+Heocl0r6nKtlgd+05239axxZXYj1VJPCD8vtVzZkCV
	 3Ydha5aA3aW6QDczeIOiXJnMHM5ryPu9V4pOO9K9Pe9yw1KdS/CYATYFdCXJLa0Jrc4Xh
	 F2jtTT+fAIQEG6hn+wZBcsoaGKIm6FKv1kSJqUwoCGv3bSFXYvqzV5YwjRTv6a3Cp7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
	b=kBRTWsaH2kiuXeshVgGjATjW3fm24Y3JhvReOiODpCHR0yLhqC5pTdVBijqqy0uMGRZ6
	 yqfDuE3EEWWtG/y0h4EaXBbzayhEPozi7/jFe4wfraoDXZIjZD1/9pBG1SdRVqjtGx2V8
	 5gTtIPYZ2iLh0Zp5PW910spEtcgUEdJ6NpFSHcGJqbWu8Rg0Qp8rrDtKEDx0f8XwVVdg4
	 P0/rVNiSxLf5xdqGcaK+2xrZab9DskaUcZKERcZcw5dgdxCqKG8RVRXD6KCQY43TyRIJz
	 GW3Hd9iqv7qzFO93hud9yeyyIzem7hLNm/hmLwir4EJN1YOy2lCW1aX1/2NwRiES+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="glmhuuR/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602C606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0602C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv9m3Clx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glmhuuR/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp6sc2268585
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=; b=Zv9m3Clxqmz/Cqtx
	Q/IVh4TuzILwMSHl6w9U+e4JyLLb0nhMGMiwPozvnzrTNXRTHyxRWkzad3zWnhjq
	soPF3+oMqjhQzWoYm3GYgpKZSQOEVH7QBHAL60LNkOQCzQLZPq2BuhgXkmJwp8U2
	Ox04DHwNmQD/9Lem8Vyl7ziOZo2CoLAfFklsfxXnQNoCTM3LKPRAs+wd1LVz3ry9
	ilvtVvqfAYY/oGD/8D4yR4NmDMV7jWy1j26M43MmcrLmlqYh9wM++97Hd2oW1aND
	afkSdVE4QeaDMXMBv+0EebupUYt/nFCaeYtqF6W5Z0pEx93uXktpd90ID71XADy/
	6xQctA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhkf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so336757e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782529; x=1796387329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=glmhuuR/7laWGTqjj6FoQsqHJbVD/biTGl8qIMvq00RB3VCTxW+HLcE5Mb4umKjqL2
         QdRXMXCwWhkMRT9D3PqQh/x2lqSG5Mznrqf/pfi3MctIcmOFOp4qTV2W/VBp1Kj8Amgf
         KSTjCarTSne1NjBO8vRPkDap2PhWnX6ycdkBbtbdCpz6ofNcLzyw8YnSayGrbhGEjQET
         cq1cavPuozTA9d9mOUZw5hqCBoxSpWxT7pfMj3T2T1KQZj/ymzuyFHNBs+up81B8Kt3I
         aeiDgstsoIMpRJgEgCM4OUpASoluAz3FbWPgHmVurWLnlcxXhxnort40/eB5Z+Sj0Wh0
         B9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782529; x=1796387329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1mcJVFc3LBFkwpNjcl6Lr7eJPs7s5utsPTpUn92RiU=;
        b=QEMHn70EMmRKhVWm90Qdd/oGkfpDi9/CQS6MVZym8DXt1mICxxQ/iuh2jRBBpfgd8Y
         VPevnl5Fc/XnTdCe+zaZHrUYK9umqcPylDAjC8tqEEpiLCosATZ7zfRSSfKZjqC+oKuu
         fwvFQBwxV9rMVr48OEPrF5o2Dv0sC/dfQ/9cFPf0fBCR1HjDg37eE8RpYtCuyHDipxAm
         8ogVHdPZZNXxv6ChrLT/VtcQ3KSTcrkLiF1x2Q5j4Y/zREKME4pL5Bn8YHQTy8n7hOld
         FGvdv8rkn24MEMgJMbPMUr32H96C+vD5zqpGzip6KNWUIgP3JIo0z9otZeq8scKbY3wM
         GZuQ==
X-Forwarded-Encrypted: i=1; AL+hErH/WEtmVdlOB5uUBNg+FsEWLPD50aH5fkuCC/AdChtiIRlXQBtVa0VSZJKvPA3uSTJOvCuDeqMdKW7Z7dro@vger.kernel.org
X-Gm-Message-State: APuU4Z/LjVRexxAJnB3QdQw0I0byPl84qE9OBNcyYcylsRolad7K/veO
	l2O/PUhP1qCneR9qRyyq4/DmDKVrdjatNr2rDKL0qFgMwP30iLsxy1c4zCVQzWjHT6ePdbhlzbh
	OvosDmRVnMypht0xfbUh7pXnQKLeHtD7CfIhUfIPXTCCe+dRD1F46OCYqz2zugRA7KjOX
X-Gm-Gg: AZFdTZdMbkQ2J6Bg8Gx0GW87Jq39GemQe0Gr6OSi2wwbPs7WeY4aPn3bDXIO4dt5DSO
	/HOu2SjIbDZY+VQPtfYTB0Bm5e6+cscyuPlmOGlmCTRkhR1W5K5WFfrbzVpbcxcmHRzZSFRhyhf
	z9IklyNVA95cYVBb46zg7emIEbuve7jUjhjdqV+ajkMTVqnKnwYru2Vck4pvvM9fBnemqG16UCj
	m09IVxvOf2urY0G9SLsa9UMYhMQZyDyLTcvwbwQzGSMix6dnfjznPO1iNOsjUjhYR58a8DSwrm3
	TKcGRpTl+DA54cnlf5sIDGuF6oMaSnkZ5AlrvpzwZ4/YHVbeaO7ILpOfPdmuni4RIxknYbfUsSJ
	BrVQXadjhdPM2wNTr1mw9Bj3tRajtdOx6xC7V55naAf0qiETqorJuV6timMgp6iIrIJWOdN8=
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223753e0c.2.1795782529257;
        Fri, 27 Nov 2026 04:28:49 -0800 (PST)
X-Received: by 2002:a05:6122:650b:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee8ae6b2a2mr16223725e0c.2.1795782528834;
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm840358166b.13.2026.11.27.04.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:28:48 -0800 (PST)
Message-ID: <1066c962-089d-47f2-b658-76ccc627f257@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:28:46 +0100
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
Subject: Re: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
 <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX3JTcPbV2+sWb
 UyPdgAcplf10gH9c444zNAuHYAJDN5RqmPR613MtaHzGxuXieTg3dnCqmcGlJ632Bbe0kuDJFLp
 M3HbHbZvEvC8dPEtd/m5cXuPgiL7v6M=
X-Proofpoint-ORIG-GUID: lr8lA4iDpoUdBcqpqiiv5KMHDNtoX6L8
X-Proofpoint-GUID: lr8lA4iDpoUdBcqpqiiv5KMHDNtoX6L8
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b097782 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iSz2WJSI46T3I7h2rz4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX+6Q3x/8Jq4Kk
 bZeHoYYOMKe7R2l6sfycAyworBUan6KRkXPDR98/MkImPgeD2+UaGT9KwtgVoxJcGvFxIEOKt+y
 TP1zmtuxBPZQ8w+06ldkuTDPKUXQriC1DfnhpqUu5RqA4Yr/sbNE5Sx8LZyG0GUcCWmIdGbxmBL
 QXqiFAWsj1TrLaoPEXMIVYaT+Qh2VtVNb+2aQq5jCyCbvQXZ3oMzIcSzPbydbDN3qu69R5w+sAg
 hFvfU7BY5XkSvLzxrw8tjq4CTRWbwXxdFFaSTXby8tcWqvbaVtmVgj0rDXyXK47/yVfJv7Y4ztp
 3DLzcrhSlYsDhQXmkHCdW2ol7VmV9UBo2coFq+BzGi+0S+8gZXtbOD5d01OPCbFjt5ZJeUAyMx7
 AseodmdTz9Hd4Cv0E5wy3zPo5k5OROq9APitISjUz1lXdPp1ADb5+tanRWzhSA22a0TUkWybEGS
 lb1TIoYki7js5MGP3Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 8:31 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Besides the audio and root domains on ADSP, Nord has two more ADSPs,
> each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
> msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
> all share the same instance ID and root domain, so a single
> msm/cdsp/root_pd entry covers them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

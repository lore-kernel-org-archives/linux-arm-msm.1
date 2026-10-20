Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534106;
	b=tcdBj5ez6eGjMEQCH/Dl+5ORhsO05xn4lNwJJ0cPDcskeco2FBxDpEJu+/GU9Aj8j5vP
	 0Zu0O40cSGCk5Dmr0KmkI2acmhPHVoJqIYA6ZBQlBZwtu7xEp1PsFAwXqdJ+PzX2EVcAl
	 I05fChGq4mKUIcgRKi6fYPWLhiXyEs+V7Hr8KE+lVps6NP7A88KPX99xnuAwQigEtPJuA
	 RUGNzbw0mNwr9i0Yyzd5tFYGXDE9rIM4VQ2ZUaiL5b7VDakTF/3L1K+GIdMxwhJM4pqiD
	 0XZFNO0fl1u/dmnAGl0HIr52/mXfu+4jp7MNKR0LgmxHCX3IkVqUKJDLzm6P6++8u4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
	b=lDlAgOjUqSTADBvqnj6g7474lDUu33UlkP5rcVhU8kyqe0lxdJPWnOgMoXG6tjWMSDgs
	 CcxCy7uXVYqhdwL5h+qXCCTKyewqYoHBgtmf3eEHpt+WoPRavCQJ9pAAkmeIAiZg9uwFO
	 vGjSBLYiagguxL4RQn9MeDW9wTNwbkMSJ6JRB0dS7dI9qZ9KZiVO/NfF/ujhMdpGtLvmR
	 kTeI4gUxoEsf7H0WWhaUk+aWZhCsbQQ/HuPeNwQmCEP8cfZLmZj1YDOUYW0KgnIOBiX6w
	 29LPS2Za+nHqTt/g1gMLpaxtODagNG29ziqdyIMqOkf/mBmDTELJXcct9GMWzCmTc8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905D606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9905D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtfTP2222577
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=; b=YlaRjfcqXcboaVER
	1sRzZAh0HZmehbrFy3UhCVu3vYTichraLfUUhymZp7bS8WmM+1ILHlTWUJND9zH1
	molG1kOsh5qZXu4oWndIDWnLZYCKH5bhpLi6x7KTJOgQfqirofxKnQIxaeQxDMmZ
	T1ptdo6i4RT/9PpAHw8RWDrJA1UBA93lUQ6EvzTa/qWKVJrPqHe/hpRFmntVORul
	huURSP231+POlZc8B4gHgfOJibHq2Z+pltWIDWIcz0cUfyUsdLmvtm8pRMYXLrF4
	VPqplyftx/lioIukz+3RRBitIdinjEeC4elRpAXXTxtCIBRQwUlcOeoAROSmvKWV
	sCuQtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0gt0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8e16d22d8so777475ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534104; cv=none;
        d=google.com; s=arc-20260327;
        b=BMM67JU6B56PrPaURot0tavMW2BJFxuiLF/dZsfECn+IAC6jn4RawNPENwQ9uFAmrg
         scBtx5gM/axhBOki4WRDSGu3+YCsUYmrpxoqz3NJ1WiYSASM4/Eve81m99a7iRHFXDLP
         F83I8R0Qs5KVfzBl/qdZT8jMSLRg7EODE0dULxn+I/k63lSAYxDnMB0hMYq6I6+9T9GV
         gq7DKd6shhMUbMutQjlaMPHryVmOVa1+iSH9iD1xlrrZ5LNBYn0iVSVDWOEtRUGHlLud
         JnsBTZHOrjkri/aExYOF25qIA5mZEVJM3AclJBr1WhKF2ko7EImOa2nyX3m/5bSAAESs
         vfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        fh=56ocN+VDde+GHjsd6xdWR+qQISKhClLCs1tctxe5yuY=;
        b=F+a2BpA1mWoMm3znfAYWU0cxW+z20UpxbH3td4iSJKfBM/i1hkd71CJvaq+rTjbZHu
         qeR6Zr3bpYPgjXN7vTpsUvVfmD6arMyWr8Sx/8mhnaZcwXZ/QejHIBqyNEli1rozNCiK
         /KI4KyOVoxqDZVyNDf/3tXAYOQ/N6mIlH3HCN1rwsgme0cJLZsn+XwwTai4bHsJ6ZVQb
         Jqjk6O6WUGRWDrLU9zhKbvvIUJPRXdWHZBnw94fxB4LrFOySJnEd2OsWVo77yY8FgWS9
         36rnRQxH2Mx3wEIK5oU/guWiy8if5SYVOsYhlgBuyhRsgppxv6yHVoxxsCUlClL5zuhL
         Tswg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792534104; x=1793138904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=VYJvx1auuDRH2wVC08tOG9Z20YTD5JPjYHPtr69HH03y8NFtkUZcpGNLud3yPWIP1u
         miaymRq2HtxRfK6hs/X4WIkzzAYxIt59HyXwmDxmKCJlrES/2eqUjmZp4gjJXWFkTRl7
         U9p0gygH9rfH/75K96YMOdfoTuHvwtYJnj3rEFlfT4os85Vjb+hPG+qrDGs6u4Relznb
         tKnrZ0kK9mQmeSZtDJLi423qdZ8CuVYqdOIHalNpruqMDr1Ji//ryJZKdzwhsGDwbmfE
         IeEt2OKM/hBAcXFo0hZ1cSjnp0iPm1TUBzAgiqHOeqwkrjIMMMTeilnuummXGM4wtwqj
         t89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534104; x=1793138904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=ZFTzQ54ICR+G00YjjLrPAxaw/8i3RNeRYHfNWK5POQvxeK6ywnqhyUq3Tv0diKg7zh
         pypwkuhGh9Pda0BcX8j9vNDSBL+Ppeh14OJdVHpUL9wtLYr2YvyeVw16c+jiAoQ2ZQJk
         LVlOwYDlowa+3YqUPd6Y7qjh1h/Lxku8MyEz6gjB34dJbEC1D03lVBDwWT788aPL4qv8
         nhiofwA5v48c3OfxBkISuJL9cZCmhMvtZwggOrt9mTp4W2gy7yl9x9f8dmN5dOou+Vrt
         80DEQIOrSGmliTdn+xB4xmdMMpUDMX+660dc3issdb0OXu/SHymKfnpj4/X/lHFFAIUG
         xIlw==
X-Forwarded-Encrypted: i=1; AKwUvBxHJBVJgYNCQL9y9ita7r6nTdPNNR8OtrSroeZUR4eyOElxr4DSEvmwm3kBQPJDo9CgSgGUQaHleRBhJQrm@vger.kernel.org
X-Gm-Message-State: AFq9FYLZgw7xmH78JcuyMDKZbBQp5oTsz7ksnbx4YqzAGAsveWPEN4VY
	GnemkYdO7OKax7pb/3bp6ybX80qlD3NW+WYvWcsYixDr77Vc0ZJtg9Cr/I2zyOX11vxTTDmR8pp
	FBsk9Q0kh/Kv8OVRniQC0YSTvE1UKtfhy5gsNUySoY+7Gzgd5P/u4gxE4XMCOVexxqlmygIvQnJ
	1R+I4mikSoA2ApPVzhkojX11wJybz6ixflG+44bop7MTA=
X-Gm-Gg: AYBFou3f1iD+pp8DRri5l3DScM2W6P39ApX5X9o2sXX+mYyzWwb/XsKjJOSFhPVqOzS
	l6DvTI7tfa0I8bEWnzbwKMZ46iK6I+QYpuwYaTplW9tSPkITDaNoOzRHiE1ClxShxLyylpfsz94
	QVMJpDwVVuu0JZnl1W6lUvdV/AbL2pMJA3V6T5fHUbB8uSlP6FXZRTqxX8fQ8ooxvLeIPd5J7Ev
	Wi9yp9cIq1JLlunijSQMCPnVtlfrVwVBxobfZgZMxOqiPI=
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2ea43cf0d3fmr947255ad.57.1792534104151;
        Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id
 d9443c01a7336-2ea43cf0d3fmr946955ad.57.1792534103541; Tue, 20 Oct 2026
 15:08:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 00:08:11 +0200
X-Gm-Features: AclHuK8EIJ8ZjWBQ6mFXW1Y_Kcn10ejjzpfnSn9R3N6EwnixFcyxmqimJkA2vVk
Message-ID: <CAAwKf-ftxr5fw+1Jkz17YCROjDB1G+7aEZnDyD-zs_d_OrWJJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX/zg1FnCzf4GK
 D6VbIMRjG5CrRNeDBNv3BVC99yuyVrB07SEar/28N0J58wjnYSLkQIVSI+oNTAhdRBOe6rIPYeK
 zQkhXyiBaFcbcb3FAuFl26BrOfGbbgsIcU4e1vVJb6HfIiaLxZ8czXJ+e48LeSmIo2SyoXSyZOV
 XjsSq8BsVKm2QAwGONYwobMgCZ+7RilKVm2WHjaQQVtGZ0YlSgU3r2oXuC027T+uFg8eppWOSKi
 /gkNSaRnIHMuIZwLh6lsU14C2cXhwj+R//zXDx3HuRnnMuNpXggZ8VJ5TB33ybTQ+Pw0JAJUueq
 Y8JiHVE53M4zIEWtTPfJUPbPeU9p0P3Mk/gdvBCF3RycCsM1nMBp0jdg6FecCj+7ml1P+u4DgD0
 7/nD2c9DDyIoqhAAuE8PUwJo/L1H6rd9lz75B1oDd+1bUkxkSF2NLkhtwS2BQ/OYDEQ5lLaKjWz
 nvrNpDvAtIN1S8vQqeg==
X-Proofpoint-ORIG-GUID: r90PLOCHK2OhfxTpugSucS-vgPPandbL
X-Proofpoint-GUID: r90PLOCHK2OhfxTpugSucS-vgPPandbL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfXznwathXVloZn
 1YJO+vJDBs2s3wnmM+82BuXsHZfjz7hHpE0ZTgNdHviWejlyIXhNcsVmIUw5ID4rHnUn0BXCJ00
 4QmaCZMUbityvf2nScecB6oci9r3JN4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7e658 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bO4u5d9499Dzb9AJ53AA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200088

Hi

On Thu, 15 Oct 2026 at 10:59, Konrad Dybcio <konradybcio@kernel.org> wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware [...]

Tested on Zenbook A14 UX3407NA: hwmon temps/fans update with a
stress-ng load, keyboard backlight levels 0-3 work from GNOME/sysfs,
suspend/resume works.

Tested-by: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

Thanks!
- Lo=C3=AFc

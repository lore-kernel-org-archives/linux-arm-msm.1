Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9B4AA3FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820314; cv=none; b=BQpnCZwt5Eh2u1JLCQmhWK4hhoj6IKULsxVBDBEeGLXhAjcyKXsiAXAmnavfXfHwXTtEd0bvysgmwg+t6mrSXuoh2oCUG/CfPsSt4ipG2R5/w1sXwdJyIPovSrgjX2nr3K0EC/bjyJkJsp+ZFNzHzpySxkpX+L0H3yfjxSHTgIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820314; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n89wNbKVnFMaFEPT/wqjWx2cUO6NKFvB+VJNEIOti9MYIEyNuTog4/XRf3LYOvqb7twjBTc9VoWYbDXIMckIuwGa+k4CIo8YsmMLnwENBqkgqQLIjr4QG+xWvXfx7AZfO0IWbuXasynO/KmauRkNjukFA5cLvrZQH85BhNRZIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q98yynQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXRK2Q8N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q98yynQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXRK2Q8N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf0o11290983
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=Q98yynQ9QOXrgvdA
	POQH1n1OZGFZXbkbEWppMh4KAsnAmbtXlQ0PLooYbd5mNmdVUgBN/9+cYesgRnyS
	zsufFYtXPejbBZ7IXqJNcwF/8GTeFpFe40Db2I5v49B+3waSilwD2NPNFhg7K5r+
	soT1wu0n0BNLwLUxJS/x3GvkBV3s4LOSiPa3+Ya55F0lvgEXtXdjK1m2TH25uTpC
	KzzfqB98+8BRL2dvE4gaB67xNW2+DUwB2IrE2g7i+5hbLuMjHP3PZXgQgiqZhU4i
	pjRDbXfNxIFKNwJZRm19TQanZsoBkNbA8XagLYsfhNiSVe9Ei7RYaRX+BcVh41cR
	/3u9Aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsgkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so7691741cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820312; x=1792425112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=FXRK2Q8NRcaWDkw9LnSDK2yd/6Rk67HL8LTG664Ssc34tgRe8iGjvCIRWBm73aK5xr
         CpuBBf8OSTw+Y4MstbXVnZYyOualiC3gcF/+sGyWtL5gBNJ6OZ7bzzqyY+iCaJFh9ayX
         dDwepKIXBrkGQVLg/1/MbuQlxK4hC/c16ZSYy0/c0lezKZIV6PlF1f0sFzvUJwk7IUKF
         iKF6/4aw5N29nLD1s88WcsPedcgH5XCmGQv6L8DqF5uB+XAoq/TYg0HEhMiMqe0KUCLt
         /OqC2HDpBaAZRnolE0eWVty9pG3XSiMWKNncpTiIHNRKTwikHKQrjrpGzZExGcjyatJw
         PboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820312; x=1792425112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=isKJV9Mi05A/7eZSiURqiBy+xsEGKysBeKUwxQcwq727Ls60s5/RJAInpAhWXBa5NA
         IBHHdXhwhBCKuzyUp+qDJ9hCibG11Lf4sjPD2brlhvWXyLaaBG9gj0sn9qZrv5xPaCf7
         Ms5KKMMfkqmAm+Xb5g2ecfdKOWH2Rsr7wuM8/El4ahVgjQ4CxEyE1EGc56S1WWt55BtR
         MfXslYO4YrNv0+rj1leSIPSaO5ppKY7MbQiMRQQscGuvVItdynVTIsHQQ1YCjgbvcKZ4
         F03c1dwOImh5rznKYwcgpynOxIexfr2B4c9JvJUvrEiBn/V1IB7LYiOWL+wOoxA9cjAr
         g+xg==
X-Forwarded-Encrypted: i=1; AKwUvByd7N7U0iBO53DghyyzN4ARfMkXLQ+VNacHBTXCbZQkaHUOTP5EFbgucQW76eCf0BMkLFf0nbqQlKIsiEgM@vger.kernel.org
X-Gm-Message-State: AFq9FYJCyMuBtcJEBBO0qNj904TuvhN7FTDHfzmANA4esAhFk/WtbKSX
	POnCA6u8Nnk0gOuARm1hd7qrzfhCyJM4XLNpVb45AgbnR1iRY5EHr/IO3kBRaKL66ZTxpzy23hv
	LiZO7rovOXTe5WQp19K1N2cu4V4TdjQZ8fdgmKQ0f7+Gef2JPPFbDUyYqpWQqw4MNGAEf
X-Gm-Gg: AYBFou0Bu8qN75IASQ1vTghISn1yPBobNa5GCbWfIXcTZicT8t2ixcSkU588vAZruPW
	bpUvqdXCNHeuMGIPORlinLsuRAWriP98A5KhEFrBI1+pv5jx59Q8DwvKg0V1YJSbxm65vxC0ndO
	pytZbYQt6uqLhrIkO3kunY5E8mblm8S+ODPdRhgtv1ZIMMOy1M/FeCRFTsPRBC5vL652RslpgUf
	teVA4DEFXE+OWSmmHraf1hfhgjAU6tFEiaS/9+oMz8aaerV6B8ITKe7hyNtCE6pFGo4eJ66tEtL
	SLNjUHmur8RKz5CM3rkc0Pq/n7XntMBQeAHC6wgFwEV1dbG9h0Sv/dg4s+dteV0mDGurmnXNH45
	IDUP4wZf92vh0PqZsNPstZw==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr203770201cf.1.1791820311764;
        Mon, 12 Oct 2026 08:51:51 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr203769621cf.1.1791820311332;
        Mon, 12 Oct 2026 08:51:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm160389366b.51.2026.10.12.08.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:50 -0700 (PDT)
Message-ID: <6ece9a94-9fa9-443d-9fc7-430585bd255f@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/38] arm: dts: qcom: sdx65: Remove empty line at end of
 node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <fde68bee2c3f884d149682161173287ff4cd7d8d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fde68bee2c3f884d149682161173287ff4cd7d8d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R0FweBv5hT8nwA8LxgFPhAgOE0Xdripg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/XUjYp/Q767G
 dF4ONFK4OEOT6ShyHvojMyUmRcfCrSi04K+eR0JrgqXSU1i5pWLiS8iInZQSN2cP982t6ZrFoQL
 BDJDRUlJ4oHmRzt9T5rEWjhuTDhNs4Q=
X-Proofpoint-ORIG-GUID: R0FweBv5hT8nwA8LxgFPhAgOE0Xdripg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXwO15SkGgheEM
 Duvr1rHIeDguVNvdAxtfYZmrylfDsZyfIABa/Cc1mKAIhA0cHhrA8sZVhNpwTTWEyMhgu9stSvr
 ptZcHuvoii+g6+VMMJbQjb3X6+/DSJjUdNkbgea5bvUxIlNjL+KDmAg9lYdTVvvdcC+1TviQAuT
 HDVjKG5/UyLmVD/5jKC5y7r0ct3tengbwvzMOmTQgPBlr7HfHbLvPu1ps1Je7NHgWwjm5eJjKFl
 HWuOOle/Dplk0gUCtpnOlZcnNGEbrxe0HcmbOdrHPgTwD9qb0Y4aAN2Y9lyHIWLlQ7QAgbDhvu0
 6mSpJn+TMAxhVwmMK5i7Tcn1i9GKEkx3NBfBXymKctc9yAE1NaPVUgleQy4V9epkvYIjSdfo49X
 pEN5h3ZHqw3cg2R+vijB0vNtTU8LKMYPKsFzlmOwUO44Y9EYptAjNchBgZIiPnZyvJnY/yjcBpS
 KGxJm7WW2XLN6GMSbjA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd0218 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

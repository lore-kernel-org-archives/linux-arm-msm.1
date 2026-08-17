Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219233B6F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976668; cv=none; b=TRWepnyxmNn+06W/ej/QcjVkX0UU+umxoFZWagi9Pw/j0Vyb+zClFRZk9w5+hSjdcyuRMKyhonOCVRbfeB8IZKVLmgH3A6dEQSYNFXT1FlXQQb2ZxK/vc1gUKHmYRJfNRd7OL0HfxDxqSUc+N32Xdw7M+OqB+yC4LbaxrTXSF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976668; c=relaxed/simple;
	bh=vt9ALgB7zRXdYgGjTVd5rztD5SJ2uAPS4XaDRIwI7yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEQOGdoFvB8nvRkpy7Hfcd+cPq67xz0sdwL8uzvaPju9PDA6QAroaYjJfWpNCUyIwcP/ERUshzmsisJthxKe1Vs/qu1me5UfSfOaXzn/lqQimMnBX4N5tt7t5mFKl/+9tw/TtsGr4baUQHscDYvs8cYvtj9NGFOm7ZPfEx9ZFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZcqnsed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUdIsy7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZcqnsed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUdIsy7i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD64wS2329914
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9D1bbBL7ay9C7v3oWCRuwM4AG2Ia+l2/0NDTQOwm58=; b=VZcqnsed295tHRha
	8Eiff9pd+J2lxfKAlwfUn+NMofszp80jW5i6Hx7llJwDCqzHDXKHNt2TJ2xzCPf0
	0dCbQpz86Re31pegmod0Og2V1ap32Rnt7qHde19+LtSz+6zEyaABbhW0baW/sIVy
	/tQ23VsU6+WZLHY4ZEgLISdkZZ1pEKTBhZyHNM3jBpBwoInNk2B+vfhNU2WhW9Cw
	CYgTFHwla5dOdATucZJnDShqovBdt8CtNRz/U0ceN/WMzY3eK38kG/Dsw1Jiy676
	pZKOUh0f/tdZdavj+/0YbsWcXOFDJddn+yeaVyDwu70UZmdNdZ6Xh6zaBdpgRPJw
	EqeYQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vght1ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:24:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9058a836724so12687776d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976660; x=1787581460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9D1bbBL7ay9C7v3oWCRuwM4AG2Ia+l2/0NDTQOwm58=;
        b=RUdIsy7iPxRbf4CDaEgdZ/csACzavEPQiO2cTs3r0navR2zKf7nIQ3Swb8TXZBOGWX
         vUMvm6I7f/kE0+9DtagZX1T8jxy/nmZEF+BCFI1lXvswL4n4vOpidaOiqHdhqWkjwg4R
         D2D1WROiNuVxjU1kG3rNQkosMhHMS4KWow3BVJ5mNEzP5vX/XcUne7F/JF4pN3N/JUeX
         2aBejj48C9oA3Nyqr1fig2VDTfkUpm23kfSk+8W2lj8zOChAOPCxt7VlcXy1N1eMEdP9
         F7A5QKXBUf/ceB4i5uUkw4Yv+rO8UhqMRrahweXE+0ZmKSHoTICDcIsxAVbec0tTkJhG
         RsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976660; x=1787581460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9D1bbBL7ay9C7v3oWCRuwM4AG2Ia+l2/0NDTQOwm58=;
        b=LjuNYOU4E0IoOfNPUsrenxqdGjxPP75rA4D3AxZz0JMZ29yAWb8QmVOhDKDr5zZX37
         rUAVbNwMKukxP23mYeGYGI2Zrs5RgrtHJJc2knXK7UUYmTF+/CES5RZwE5xUf+ssMbuI
         C2gavgCleaSmRKgcv2LCbOK5vZm/mETt534J+mfcF5wQBLW8SFdhWhHiOeRyJ98VYf4i
         mMplv8MeSWlYr8LsOYLpCuxNkD51j1kECfaHyraZknuMrOs3nEU/BQh9HbQmh+S5VRlD
         CLWvmoANt5RXjEgtlwYE1zAkK+HIN5NlSQ+jiRJkBCwutwKtG7HFVbirNEPXFXAPQYiU
         gjCg==
X-Gm-Message-State: AOJu0YwWthy7jpS3TUQ6us9I+itHrNsnNyJ5IuX/ukiw9vFHLyhMV4mU
	mKKL0wov0j10HucuBEeVfkxBNnCIE/wPnvRCIPmGTBY3CKPm26V4iUnci7B3HMps8A7YCRPYRu2
	2+LwMhero6WqEazSI3LZtP0RnDNy1+dLk1ctwTC0atA7UWsVSwYeSRvJZd4wVOz6mt2A4
X-Gm-Gg: AR+sD10KRNK9mtjgB7OEmMt5lyjaVRzfTYhsonnuAVkoAtpoYpd3p3es/FC/balotf3
	Nb28Tcwi4h9dLDLUdmRvqhO+ZhmXsAYRB0bq5HiRp9KciYwct3U1sUw0lA0Ph7l8KynYfhprzhZ
	CnkZtVvMMNzZxEkXpbO17+2hSCSCl4WvjC17Od1c+y/hwLx2SK82vpmz2sf7e/EQ6Y6oAu/yZ7K
	ZgcBgFFTafAtvIpBC4Sn7W/8IMnGXevzkvMIfmVDVaCE9BC8xxqwboaGXyogJgcODzqEj4io3MV
	vHOs3+rwmKHosZsZusGuwCJh9JRvvSGR+uVdyvyagqnJ7kGfXkj7XH0xeM1u4l2HDh0s0aEtmnb
	fv0BozP7De9SFJ5xnr+foQoXT
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr204840011cf.4.1786976660533;
        Mon, 17 Aug 2026 07:24:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr204839321cf.4.1786976659938;
        Mon, 17 Aug 2026 07:24:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85884b7sm767097a12.19.2026.08.17.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:24:18 -0700 (PDT)
Message-ID: <e89ac447-803d-45e1-8107-f376c28c5299@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
 <20260812-rpmh-timeout-debug-v1-v3-1-68c0a40dce23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-1-68c0a40dce23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a831995 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S180665jWhtScyE4BKMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMCBTYWx0ZWRfX0h6xV09QuI0v
 TbekAWVosoZDMuUlOeiHC5lodwERZBBhMm4Nan4NxQ8sbMmZtGWDaEGBcI4W3hjGXzr4QhhpW7S
 nlgBgJ1IkMP2TtwRAFfrXy9bEQsMbwg=
X-Proofpoint-ORIG-GUID: BgUbT2mSsGSSrwHGW9RQJ3RUfqN1ZHhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMCBTYWx0ZWRfX2uOio8CSKzxe
 TEZ0qS9Q/cLGdw94g+MUDBL6NXf9YQAQDC87zxCGU77uQRLy+frkjK6iqKvwHG8xPGkM8gH8qS5
 jyAx25cJWmtzlSD368nnYIhjRo8qon60osOrr2uJp7n79R06Ji+v0hteJ3tRTplVF0g2t3KMtqC
 ZBNojWt/D79oHNaHyg1mtx+HjgHRRLHSAY3TPccKgTIv+7jkKKDVfkkVsuJK4kdw/QNS9h2P5ZX
 m28x+V8swxLoy2ZtVjFo6Zw1Fu5rheBSQ4lVTUeEJ/qZYa/pzVUf9oV+2i2gMc34r7iCnuzJRaB
 irHYZorXs+suGUiGVjb2M798XASWBwJOd5sR9S5TVM09KUxQz2lQZAYoxMxVQd1/g2Vb1zu0RPW
 xN/5AJhVueji35LZq6bh4ST9E3JGnzJ6GIUpTiyr31U90K2hObCgFNzhXFEIl+MxXhNvOHBaSbt
 YVsE+cALydYTpgIlVZQ==
X-Proofpoint-GUID: BgUbT2mSsGSSrwHGW9RQJ3RUfqN1ZHhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170110

On 8/12/26 8:12 AM, Maulik Shah wrote:
> RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
> in bits [19:16], matching the cmd_db_hw_type enum values. Add
> cmd_db_hw_type_str() to map an RPMh address to its accelerator type
> name string using the existing SLAVE_ID() macro, and export it so
> drivers that handle raw RPMh addresses can produce human-readable
> diagnostic output without duplicating the address encoding knowledge.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

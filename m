Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D13CBE78
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166015; cv=none; b=ksjSle4ULz5cTUidpX+zog4GZt1LxPVfgVryfcMr4GQ5bSGCDQD+355Tm/K28VyXuY0MN6KBkLjnIjERvGjLLunZ1Ih0dMjdwYQQ/Q5jlEpOUaX/S8bGezs2JrWouzKzkdFyHFXKoOvJcEqa5fkOGx36jXnWXI1LUXGKZ9MnekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166015; c=relaxed/simple;
	bh=hExccF+WH6nQV0fUgGSfQ2Rtf00rZIwOMaCH/wzTNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcXkzEfwlCs4QiXFtvYoWu/KbVjGE8/fgngmqNPD0O7xdq/pE9rXjjLubtP9GkE4iZ5O8LYhWgKT45xBptK/xEIpeBsvo+1LdsicDqW2GeR3BpU9lEj/mSSUT3jDYcjJsZJD56zTb4qxK6ex/CBxm3+pB6z/CGc5fooU8lXCVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBduephy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UheB686t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBduephy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UheB686t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsFJ1844173
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q34EOEOHDqhYS8JW/JGnDxv8
	icYMu4ByEPIuxJYSlZM=; b=RBduephyQ1PxH45U3cscOkY9uFLPUW8h2eMzJdQH
	KgWxAUMamlu0dNLe+QMCWBCmm9vhtuKURc7eONgltJgc+Ad2ueprNwxnco6vO1Wr
	jau0rmlQ/ksBHmoVlf+kauRipWoXb7d0a/8KLA9TReMVOv/wKuwbEexv5bo+Y7H4
	Cxy5rX1XZEhcO61l+/0DOqxpxT3yM58tBxGrTeXOiXnWe3pJkv5thkOeZZoTwrg0
	vymKxpQBZn4zKS3GZ/wcxff7rhTOK/haJQFrWAZmdGlDmanQ5uqha3Yv7MBLL0ku
	g0dpiAvLE8mL3B4s8jNzM8PlnekKD7MVosfUO4BbEXnhZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgwb39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:46:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939187562a1so782109085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166013; x=1788770813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=UheB686tHLl1BvUAHdIG4eCOp1YNv56HhkK0Wq5uiUpeK3+GS/4tawYtcL0zSwV3VY
         OCGZP4+WJ7jJ9fUEhxY4kWLjy6nMOtwa5SXWowIyRKGivM+bpy7K+6yRcbzeSq1OTEBy
         NkEzfnn4IYD8PD3qNxYcT9bW9MU+SEjHTKYNlOtqacy3xJ3x5mwUDYTgTzwCU9Vvn4fd
         V7ZMhh7NcWL+iTAR88GW7Un2HI8/kcT2tR6pve0l4ktoBYwwAS7EHdSbNLD+OqU+n06J
         cO3jrBRDcQOr60A0EPaAqWaa0sEbP9cgidn2jiiIOmvmoVwRTs0ueKZ1H5vXhOkOoeMb
         meHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166013; x=1788770813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=mQ+Da1pHDFIzIKuyhuIKF/c+PJc548a8xo/WzYNCwyiHIoVlhrtfI2jcICCmxdBDcP
         3to+Mxtdrj7nI+hoiCOyaZO/6Qvhsq0RLeN7tXV7cCk+datv7EcySsjgMrTrvileYSo9
         5Z2sJj2hQi/5K59bMCwOsN9bdwqGg9ThpApVmMXujSdONyuqVFsYSbnyA4uGqyuVuxtn
         Kh8YWnD+mPMoQP57lTbST3DrbExVw3MqeFIvUSDgoyiWZSfVL/WzwE0II6AaSmNw1y6p
         ZTfpKlKe61fuTbyuD7TDMoW2a6tDHI0Hn10rdrnYddDIA3he6eYuYd61slTgFXkFpvtK
         Zr2A==
X-Forwarded-Encrypted: i=1; AHgh+RpNqks+AfsRGkwhPVhoY9jtuPfX67hU/BONq1UF5VWMaj9/8NTyo4fmhIzGgnJ3VUeEwkco9zmdwYGryPa6@vger.kernel.org
X-Gm-Message-State: AFuF++l4slWegWOpyOOUhXylCy0QQaUEny5tebnwTHWBHaLXDfnlwN7E
	Ba5z4T0Ibf5l2hUl0nS++HE4HKPEGzn1xQPy/AGB67Idnd9N9b3jxDdX+vIZCkKQC9xhrUalv53
	OqrpRvzqhV3Gu6trDIK5XQlJ3cYIVVWrWVq5y+jyeJOwv0o2M4LdIsFcEr0GunN25al5A
X-Gm-Gg: AR+sD12mUBadWIZn9wOowodI/SEDi3CYMpntysJv493rl4giu3adwyJxrRQ6tB7DbrG
	uAjgU7C3SF4AeCcDOKON1ek0F6cjmIgKQC+niMYjgNUHL0aAgQQTByPd3YxIqcF8Z2yEa7FuZ8q
	56QDhZhuSBOMLVFDeSIvnXPJtByDTWanLC2mVzPK4wzbwQvi/qNz9uCn67lO+O7dgxGy3BLzb6f
	XdGlKuBo/MaWD1yAGzYWORu49N7pNjJ9A/S809K1XIS9XMNDA+Hs7WnvRJjDtxwczNyWS1iHZ7Z
	HL21Nmtp6PpKtcn1vaX+DMKg0DK3ipk5lBLI89Xx+ON3JbM1UN1BgAeZCi5T4I9OmJHDIK342w9
	OgyZD8t4QO7ZIGw==
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720210985a.32.1788166012723;
        Mon, 31 Aug 2026 01:46:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720197885a.32.1788166010299;
        Mon, 31 Aug 2026 01:46:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm160390655e9.2.2026.08.31.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:46:48 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:46:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx
 to QSEECOM allowlist
Message-ID: <yig7camoooy2pcvhuqlmwbbyxx3qbxyvr52jqeem7nbwoo6npf@nv2n3imnjaqb>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX/FZae8SURVq/
 4ksQLh9oTzkNlhtQMxvLzHjm+FCStHgwHWiifoHD9i3aT4hsXiFoUZtc+cedzCU3FHZ+o9k9r7c
 z2xpYGQ4mJOuDxkvrwlcVcYWT5aWKexcMhJaXinJtGHGoHsNtxYVmuyp7lAk6Ualx0sCcaAKQgT
 K+w86LOG8QwKwWnwUKGcYZORakvyXofgFKoJae4JzQWBVOH5BDJh3rikNDgpY+2y0jgHcwmN77V
 6YMcAOLopU7hNQRO1E9wL/TWPB1BvJNvhwRAZMZM6Om2LSooL0mEkiVr2o0hqI8yxKTc+ng9w3C
 SIdFAFHyceuhOswsqvgw70KZQ6Kv5KYxnyC4/UDkdS//16OKRi3KSCrjKbIVkcwkbQge1j29Ate
 uMWKKUSN1/YyLP5m43wLE6Y/gxtXBsT/PJMS3x18l3hsPXgyFES0ebO1k8Z6IH+VHMdgyKlJF6W
 pBI5zU2llGMMgalpn5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfXxW2sLpi+tIhg
 9VWNu8o8fKPJFD/7ai7WJDvfyCmd5P0MNNQPA/HD03Mp+Z6ecgmurVOVL0qqrvoATf6gZH0+wWH
 QOWfOP8JsyQTxSfnSrfWxKqV1uD6G9s=
X-Proofpoint-ORIG-GUID: 7I1PxXHrS0AWNN81doo5VZl0TN_UzMhh
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953f7d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zrKGh6FZpyt9dfM6tdkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7I1PxXHrS0AWNN81doo5VZl0TN_UzMhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310075

On 26-08-30 14:56:16, Jason Pettit wrote:
> The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
> (Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
> Add its board compatible to the QSEECOM allowlist so that EFI variable
> access (efivarfs) works on this machine.
> 
> Without it the kernel reports "qseecom: untested machine, skipping" and
> efivarfs is empty.

This statement is kind of obvious, so maybe just drop it.

> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

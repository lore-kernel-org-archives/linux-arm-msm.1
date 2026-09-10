Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D33A254D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025528; cv=none; b=kaRcleQEUxYU5pktVReCTKyKZhmgG0QD3EmNzZc5X4Hu8AGOOl2ONUXg1WOP2YZM3qsUXueLy/hoMq+IqapIqL3wpwouh4bpKwJvLCINKLUYqeWviY3YMOUXaPu9kpIZH1mCGYVCiTOPyQFQfpVSTVNfJh01bk3DXwnhkrx9lG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025528; c=relaxed/simple;
	bh=eM3CqgBL4woW3uvSNQaMJnpyezKNnY1o9BhD8Hdd+3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3yZnRUx0hw/PmeCBv9Rik/LLxsnpbuyZX72FuDWJA/j54BGA4dSEr7xzSlwUWsfkOAEqmcB4+oqx4HHty4zboaUvJ04vGcrT0PZVmLZK44/r4Er7KUrQnGlsOnEpdGlPBwDt9YDEM9tDIlW+bzDd+PAss67lKesRP0P2Q0hmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQddMCG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCPE6aJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQddMCG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCPE6aJf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gw5I4142689
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ScjaRXisa630raTeVAXO2NA5
	6DeU2lojj5oSTcac+p4=; b=nQddMCG24aHiOxH14YsKQxQveYr2cCixpJ2/df8I
	eZi8z4qjC+Qtw58AC+E3EDilx9xjtIEp32jaZfNVmoQOWQw/RF2BqrCUVmlD7QRA
	MCQfhgqSGkGvc5jBciKAh3jLb+NhZ2fyIDQapwuSnCVUpsvb3EGXfcQJnZ65D13I
	dn/2eUVH+BP+wYY3OpzuqPqJV4D/7QiokrHGqjZ8kwYOESEO9kurZX9HoWdaczML
	7npESgPByKoDYe4qrkI943K897uow5nW2cpmWH29ms5tHLIFsrQZ4KxywLHRbdKa
	Bg3F7o9hCPVZxXJensMAO0x6n3uUA+ZXwrYE6SXT0Vif/Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2kyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b120e93so466307e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025525; x=1789630325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ScjaRXisa630raTeVAXO2NA56DeU2lojj5oSTcac+p4=;
        b=HCPE6aJffHVNWeTbETggkiNIL6VZIdRchzSoWnQxf2NQ596dAo/UMKZ0eMePA31R/0
         NW3fe0C6FVoe8BfH0eFyH8anS8hyp5x4gjsBBH4sgBASwMamVcngad1WgENzG4ylol1W
         ZrcrgyqXiTTWTYnKekiDWwglMD5XZi4ASJQ6dLzSMZb1CnNl5tLnEBVFsEUjgpYd/Wxg
         eGLggRWEjHPAWAEIHL29XavaZgbJdhRLJ1dR2ruiJOtmbUMktkKXR85jt3LKBjU/dXKH
         o+N3NyBIbL6CfD7CNvDaA8A4gBSWX9IY4FlWb2pGegUVPjS2EodH+G05TBnKxcCMUXjE
         ZD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025525; x=1789630325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScjaRXisa630raTeVAXO2NA56DeU2lojj5oSTcac+p4=;
        b=cEIolmTxi5+c70uJshja+7aDL+tPVvn3THe4viUyjr8ONbdzavatXuGQ7TB7p8hUA/
         Z7eXZlf6TAiGK5kPERYbqCkVWRaKOq5qnPCA1tqYPJw2y0uuEfZ5EU40W/Bu0cRzD+Zc
         FMpQuiLDNiVX+2VobcZe/pYcA7/AYeeYXUlIm9U38XToP7CzCr20HYbIg4nWq3PcsPnT
         B9J5TIhF1RuxiGW5b8c5GY634R8fonHzzS6Kna0FGB7xv/l5bLgyi7bOTC3BH8WNK/ac
         xtCrTCKHSCd4ILLrgUjPQI95aLyLknKQLxCM1WzpoFnHAhqHqDeX004CdYeRfAOqFbQr
         DYXQ==
X-Forwarded-Encrypted: i=1; AKwUvByYlzFZFm5cmrew+Qfj18pdBT3rkZ9DVgx/mMvE/fG2Y//BlVnodW1CS88XbIJtwzfuY9C4ihc+uoPI7tVd@vger.kernel.org
X-Gm-Message-State: AFuF++keUFT62gxSWqm6SFxvTonkz7grg6vrzowtG2aUot9IcDsP/6HC
	2D4Dxv/tbfeeyD6PBzv9NZ/eX7iMn6z2nJORqMCHqqbsBg4Ch98pZvCZuFQNhB0wcslMnvfkpOA
	VI0VqB+9ywgL9XHZLhNBQ9B+2pdX2B78fr51roaN/8N15aZEGDlsiqOAiltIUCMXww/vZ
X-Gm-Gg: AYBFou3XKe5HIKvCxL9gyxGSFX8+WjeTlyyYZlRdR/YspRIlYooaQXrN5039PrkIa6K
	5jxmBvzqX8iZECgaATbAgCSGNnUNE9mxf34DPe+XxLHO8U2OZhlwpcY0Ny4wPKsxB0JM+1+l9sO
	xnNFep+UDqP5qkf3ct8hWl4cbzhYMzuR0TfFaq8Oa+Q1ZEPzPAG3wFvOS6/mZcNuQb8CQrFYIfb
	CpxjOXkPB4V2S8xPuoOtwQ8Z0D3h66vWcZbZa6wUkwPPsc4JAJf7R5XGirgWSSSUybdxZkEYkqc
	TlLczRWD77gMyemlABBhYJZPhJP9YQgSzuAdMY7YPqgmky7wL4MeiL4j8WMlzWuqJ3Cl3iei2tF
	OCQZyYgMacWU5
X-Received: by 2002:a05:6122:551:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c7ed4087bemr17567173e0c.7.1789025525440;
        Thu, 10 Sep 2026 00:32:05 -0700 (PDT)
X-Received: by 2002:a05:6122:551:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c7ed4087bemr17567156e0c.7.1789025524876;
        Thu, 10 Sep 2026 00:32:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm52719385e9.3.2026.09.10.00.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:03 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] interconnect: qcom: msm8996: Configure auxiliary
 Venus QoS port
Message-ID: <swtgayqrm4lbjg6ayd6qovtweqyutjbtjx2ymvar4rcflq5hrq@k576b7geg7q4>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: PrPQ7TG4cl6qubGsa-C5h-_k2c4JCK8j
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa25cf6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YMW5T1WhuyZJOF4bxVQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: PrPQ7TG4cl6qubGsa-C5h-_k2c4JCK8j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX7/QDYwiq9WF1
 ho0+DngeZfgkgsDGBJ7h8sq0RWDTRiXzEff40kRYdKGZzIpoDpJ2ESWP/t0D047uPHhZi6xoTqA
 xabCsVlBwfKOPVLFV0fDpchbH+40ih8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX3jkdpBbvIiE+
 w0cto25HQtvdwQo4K4OY5B3VoJKz3kwTulFJ+U99l2I/j53w9NIJ/UR5io7knZYICggtoZwFa+G
 i8UGuBxW2hNEWGuuH6KiseMkFKnh8CkMlnDOAaRlcYl3eTk3jkYdPVSbhEuhbBSqx551GgAyYzq
 UWdrImP9OE8xwoRy91UUwdcCwYAcvr7JHTW2a/N0V0IThAwOPAOlYzXDfeS0qMt8inZUOapmTzE
 7h+JMO0gVp+5Fris8UJVOwPl+47HfKuS2dBm4f95nrFZvjVvrfxkESLYM3BRk85CG76Ny5UYEDa
 crS6lN6UxVB4QAPEgNcRh0jUkDKN7GMO3UrAv6rNvi2OVpSI8d8ujIAQVG7lfbFcm0Vqu7KHf3q
 9/T/mcFIEP6WUWP7p+jNiXy+JTa8T5lIrxbOOw3ay2AH9h8W13eAEZFjAvTjIQkyw3Dr0t28kvg
 lG+mIJj81omjdMBbBMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 26-09-09 18:41:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8996 Venus node.
> 
> Assisted-by: LLM
> Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

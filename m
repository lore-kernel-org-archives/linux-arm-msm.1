Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAEB4C6EF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447692; cv=none; b=kdk1qstalFQp91U/zaGEHqdCfYRWNYLKmzNaK/WE5AcDdjU2Z3HqFGsPBzEXU4jiyT7+jjEGm7pTh4nbuz1Uf8YXJ46/BUbXTNXWmp1bCmOgJMwL12n91ZgwALhstxiI0218NgEWTE0VLeXN2Lasb3NAZ7OjnLaWaoogVrhoKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447692; c=relaxed/simple;
	bh=rxR8MQA4hEt2JQIcclBKv/p9XrCLjv/c8S8prUWY1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQkxH6FIIC9RkIxwP99djj0upTPsjUjreO3//ZXRO0/rNQde77Vw5emNN06XxOH44OoJ7htUFHysbF3v4IEb/+WGSIt8ATm0Ss6mVOEs0mf/S3vTgnP8SwSJDNBvWiIJYkSZQDe+pQMhHjTemNMTQoVl+AWAUYXDpwsibF1K4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U627fj95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7NF2vxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U627fj95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7NF2vxF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAFoC4093530
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4U04Gmj8MHmOKgzajdN/vYqN
	FcXfl6+LBbOXXMjsXhg=; b=U627fj959Kh6nJQKhcOV4OQjhCyTFkqGwcMCDz7V
	u6RIVKNgeEXL8dBP5tYHele1OiO9Add94ybQaeNtPMhpNYAMA7SeE2/YIP2wLXtE
	C5YErqpa2crw/qtPuvL55NTCdRHKrjv1llRu6JjMSkldmcHrVx9JZbQ4ufIuUBJs
	tUAiIpwiAMO9NaYhNichZ36IWvyiOO8gcRJ1+PfZuVHCCtCMA+EckHKhXD152ys4
	YhxqF5c16fwgY5il2knM8OCvPXaY8xC5ZFSUg98zoZN38uUZP5LwBcmSsCaxasQh
	WOFeIxmJILlqpCnP+fHc0HlHRYeXz6HgLXxWmgheajeScA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjtqj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:01:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77bc38b37e8so457013137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447687; x=1789052487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=W7NF2vxF+j326thSQRqNyEEU9tvXtbvFmkwe+WeUCqMQgcT6DGnUSkgbeLBHfZvzHK
         nmP9YhPGWbLJvXSyl16F4WBvTMafCE/jFiLXSOZR6jMdFeBodfpMlSgiWsltqyRzG1iQ
         W9XhtgdecwWo3Kgy9WmmH4JhQfyA82vI/BQEsZ/TOh6pbc4uo5XPKGe5heqfUrogvgF5
         v5sMu7d/hZY9tjbZkHQln1PbnfxoE0gZ8RqNzKVwX8OfostfA7Cdk1bEgTJ/ewkEv77K
         jvpHj10Ff9ID440cvOWi3nCNqCjF/AYWrDI2qfZ6i3yv00MhAVeRlch90xZqSUJ7OV+7
         IKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447687; x=1789052487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=dYhqIx3P7Npg9ctJHSymGLhO+4yMLqpeM6TzTArlKwxvd5IwFeeswQiz7drz5UZ7wM
         nd9FYpqhMDAkrT0Dc8xCOKJDg7+yxeAeYCx6kmHE3QhfE6yDqyYY2bk55jFE/WZ3RgW+
         1q+1hRKI4qYzrJzjxDuFAKvk1aZzkSHJ/Rb+0bdNZQbh8Ttl2hOQcYpygKLp07kkkJxr
         8TjENAlsHAAtAc7pAoTTB+kF77FyAfhfEvZFmGbbdtF/vmsWi50+VIPfikRmN8rAZrHi
         uiYB0Sq/a0qeItpRnvzupDcCF/BWTWzcBmMnkCesmyKvAz90BaBrT06uSNowj+2J4twj
         CaDA==
X-Forwarded-Encrypted: i=1; AKwUvBw5VC4WrRuyu4sQPGyniAUcsWxnl4DVttrEzU69bM2GaTzrDMfC3dh13d96Fkx1HFscIX6F9tCkGQFEgX40@vger.kernel.org
X-Gm-Message-State: AFuF++m7cKq/uqIw7k91OxO5tz14X8/L7Spsvis5y4bXwav7+na1fEpq
	fVdbqD3Nrk0L5LjO7Wd07bRXeims8EdSlf2rb9Bk7OC9RxGwET2eZrPnDPUg+Ummh/EqV09MVdp
	C1nsETfcJtULRPCP5OpkMvtdRmWFMs+AnJR0Y5KqXT4mWdq/IlciNNj9JjYhGcLBm1xkf
X-Gm-Gg: AYBFou0DCb3QbHjKswud+cdDUNExF87QK1qYle3xZ7KFu+CyCSLleurMwpfP9H6gbDj
	fjpRtruSno75AEYJW0Lvv+Knw+xf6UmZoNCPsWp653BddriSBpkWjqsL7fDg6swsY4tve41ieof
	gBN89MmxC5/AgCh0fbFeQkePqoGUOnN+8sn6bj8qk/Kp68bN8pyXJbqLx9iE470hSGau0b7G5JJ
	NbIgZ/2SGcZUd6DVj2yW1u0yWCWJUdLHhnHfx1eGkHqTIWEw9IIVeBW0sJpwh76LXQov6A6lxTz
	k3lqFt2YtJw5wSTKcXn3RY3FgdPWYzjNZ/w20Enrcapnpx+thHVAaP7kuUNcU7hAfQ38BzhkCWW
	lR93Ubf7GW/nlHA==
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868123137.7.1788447687368;
        Thu, 03 Sep 2026 08:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868060137.7.1788447686604;
        Thu, 03 Sep 2026 08:01:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm79144745e9.11.2026.09.03.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:01:25 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:01:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Message-ID: <isf7ngdhk2iffcs2oallgrpdjfoiaen2htjneu3f7zms2a3agm@zz2nz33w27lk>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXzjTnJ3XBO4Z8
 HUPqwxOcZ4pqFHXIHHJVope2jNLe/q6CB0YTfT75+XUEeJw5MKw6vfFd3nPhQHCZ8nzfgTw2y4T
 Pgx0bcZD++oiCFRT39GEyzZTfPSPgcKGIUHxVtIqY6L+4/N13TSXtLkk0Rsqwj+zuB8u5GdlQnX
 EJOFp8rkF8tPX82LohexsZwxAZfaDgL6e/20lWzlDk3G/njrG9/sKHiuap7Bv7ccr9KyaaXmygW
 hVjeYSCa+9LaEcwpU0UstRkVuylvfA+x5Lb0PbDFjxydGVfS4ThYpejiVtEkzThWYTEIkXm4n78
 LcoBFdkPxbaQ0TGtQEmbnQjNrjCJFb1ZPSOJq50FHkhSZKYo8yn7hnlKh2AJz87OUQqWe/Umcd4
 dLIfgLNuIzpCSYt1hWG5/EmAFwGzxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXwScJhJmg9lOR
 ihuTPB4+vhq+IJwiCrQwyrdfK6gfOI+5jl0FZmnOK73beVmX6bWdhhcOFxLI79ytzkmm7PSKGuh
 9kzGj4VAsCyO840PvgXjapUzyQRaH7g=
X-Proofpoint-GUID: A4rW_XsO7a-TK1aCj79DU9IR9WxvNqqA
X-Proofpoint-ORIG-GUID: A4rW_XsO7a-TK1aCj79DU9IR9WxvNqqA
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a998bc8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LZHrLB2tbJw_R4RbR5EA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609030130

On 26-09-03 16:25:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a couple issues with the current description:
> 
> 1) The msm8996 compatible is wholly reused, without a SM6125-specific
>    primary compatible
> 2) MSM8996 has a different power setup (VDD powered through a RPMPD
>    power-domain vs a regulator)
> 3) MSM8996 uses a different init sequence
> 
> As part of fixing all of them, use a SM6125-specific compatible with a
> SM6115 fallback.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

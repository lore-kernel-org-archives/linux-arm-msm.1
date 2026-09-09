Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E3351C25
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954332; cv=none; b=acKOFaXSXSVnnK+qIQjHYOmjQjeMrU4CdVj+R4FeoTBp3srqbwD+/1t4w/YwMfuHoZKj1BMH3v4y8QtlN9refI7OtXWrt8LWcWh2NwRgbfxUk43l3OPJbh7T+4xxZA17zJ1Cz1V/S91q5rGNby80zrBLesxw6IZDLUQSJT7P15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954332; c=relaxed/simple;
	bh=w8t0PcgJAx9ctFVVcRI8rM3BIltwafJlxl9b/hayqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0wLIP8SqRVb9S4DFvZZhByDcRdgkC3Yo5sGbxOChgV1BdzosMXg/XkgL7i+0nXrXHdOGzfMTysgzdaWUhvpC8Dhj9EIwuytAVIVNKYifoxyV40ZNVS+0uoryOXKCtryjeldx5rusSJK5cQ3B5kPKfmLOwcLSlgFrvJkGzxcPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVctFaCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixEgZfy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVctFaCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixEgZfy8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU54I2653464
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZd03ZLm04N2hieg4Jz7IpXL
	9lB9dSQLJ9uFkAaXkhQ=; b=WVctFaCMOilWNlc2G3VjyRltEj9cnMnJrXHG4PRE
	3iBbZuR2pwOkRuoowtaf+axjvSB1gbBmVr3VJh4xugJ45VFFezVSEZ1NfqxdxpT9
	1hYut6M97u5llEel2Xtp3bfqf60yRduELQqSPf2/S8mNi7NCLJPQuhwPW7JbliFB
	8SvmZjpWb24yxcJgOH2GZgj/LajfuywIoc5M2XhyO1szDqeqT03H8MRNrPDgEcay
	SFeg5kxiQOyGstsWMB9caO5BA8a4NT96/HGJlgzMcPIN8thesYIf/H+tlQgc6L4n
	wVy4I2iHyXFCpdERKUB2USqbyxczhJCiD+22WHLjpBHv1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3u7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:45:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso535841085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954329; x=1789559129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=ixEgZfy8ZG1nBN5YCsLpH/cJyvSVrrUDv+ERdViX2A3t2BJMsE0X18fjhCxKRI4Ruu
         CoAnWK0ReyiDBWJJF20Ox/KnTwOMoCXEeXmirlt2OlqJuZyoqGXOxlpu83pKSlacn7Vb
         jD5XdFCYr7bgPU1t4R9MpN4bDLr4GONzWWAlWJzB1zh+QyiZT9nfoWQlEzUxILnbGpC/
         R0Y+eIxGXXwO5RVI56kYHfbKleukE6K3+HEkEozmtp0v43DYJQksEgu+dYURgdcJ0Y/T
         z0JUPOSfmmQnR4vpxMfirfvZQR+Hf98a5ZB3SLIRjX8usHANKB/Egv6wJ1qLsHHcP4PX
         S+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954329; x=1789559129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=inUg28NrRujdPZvZH1yx59uK/LljQj8M+VVTwRx3ZuXG9Z/7R3lRj5qfL1Y/zHHkvr
         Yzo6APXQcaafKv/nraqtC5/9RbEcaHAcDihz4Rv3DENaZLDShSDbGajtq+i12IIDdUqN
         u461ci19RoI5Xfu/rdYflvu3Gyw2BMkXfCEQbSzPZZTHqy2mTWzhGi/5DGIaspZyu855
         sfzzimce7B4idw0yVIT/oKKzckzzBfN7KJVCtscfevdz0Lo5B9MDg9Z7/eQFA4dqcLv6
         CVCtBl+21GExvMpDrsCNFA1Cr0BVq/QnThn6HEtDjHszQuDUDvrDtgoXt9enqmjiRSbx
         s/MA==
X-Forwarded-Encrypted: i=1; AKwUvBzIKTslQgrk30wleu9vOzYsF9y8ljT7rbnL1v9mMhRaRRDTrhLlu40x0qe5cwnh7p+gYtFfVdVuNI/GCmGp@vger.kernel.org
X-Gm-Message-State: AFuF++lxfjUXTtFoE25ynb1fzqzgJKYtc9rEQ/v5kPt6c0ihGFr9BFQB
	KZKyJL7o+BNShDBqh6UJ3jY9RSN+cozNUz+WsQKMnJIyOLCZkuLWiRkN813zIqPrumm6LgdwuWb
	NvVfP64xALlRud+A+7hG0hFPMt+BsxDyW55xzF8LDf1ivTsfP31LvGvZpGiYOEx5gxgru
X-Gm-Gg: AYBFou2JgvclyPae+Qoq0F8LtF1GHy5YHqO4qh3KzWyovBlDFH4qU9je5IcfJU3Eh6x
	xSAwiffXkaufJfwl5wZI56HsayUvU8fbb7tnwIGlMzjRNtUHaViOceMwBiniBU29IIMiIheKYoV
	xU6L/1SjZvTO8EtftJ/4mB/z8Cbxr8fW/orweSh3+G7pz3w1Jv15Sl4k71aBXN9kOWNUDzg4Oa1
	jImooBv9QcLr5FjyBQEyqslQALJW9PxGmpj6ybHAqKqH2rCN6Sn+ta3IUhEb62OsoM0VBkqgdmj
	1ueQPP9HHkvZcJWb1Qn2hQjk73zjyjTj3Y/DHDrZ/FJjcwUHmP0sSMF0yEoFKFk+hSl6/XKoUmK
	pm6Q2spItqWU=
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721171485a.40.1788954329035;
        Wed, 09 Sep 2026 04:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721115185a.40.1788954324141;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm412127415e9.2.2026.09.09.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:45:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:45:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXwOehHhd0HY1d
 8ct2CCt6G7WNNTqF3d+x7+A7uoREaiMMWJazTWqhTciYoC7sJz6wR10kK+ngrtZZQ9rkA6Mr8uI
 ka0HEn/HyY6u/TY1CgoMn4j9qnbZRqDv9Av6jD4ODx2Eh6eKdx3ucZ02vP1L3ZrXT4EJ+YDTC7C
 nLKQTn8dX5A3JFRg4mbtxZRFCexI5D+zQsOvWHF0cRbbAAtccqGKFjZgUyb38HYVn/TU2PLD3bQ
 QPdghlNlVeaqUNezOMVT2VT95I02z7kpmPvP19904yu2tCABxcIOCpG6vo9nHk6d4Hn7sJMC4NN
 6MUuKlUprbLvU1dy1JVVtAa6jdVr38dDnNdcGKYvVjdaeHFQyzv+eV7gxnciR8iIkM3T7behNwz
 vWTep8lOrKjdgoJq+oLMQrM/+nY8sAtd5Zh7xDEcFEp+fwwm5WkLKdrD0lagRh5m3nDFEa/13SN
 aDJ1wFVlY8G7spbUD5A==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa146da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: v6mXfC2xtHaZpxZQh0kUumhoxTlGKtrQ
X-Proofpoint-ORIG-GUID: v6mXfC2xtHaZpxZQh0kUumhoxTlGKtrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXwyzGv0wI0Zjd
 y6QO8kMe3cr5MHuTiyxST0ZKzngRZfGFOzjIBk38ybnMPWTeMqO5Ty/J38oz2SIQGhOLeepSVR8
 6vKy3mjr8MhbqSmP9mSNSgyWWtylbew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:20, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

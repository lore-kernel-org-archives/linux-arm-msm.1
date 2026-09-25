Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107041F346
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329424; cv=none; b=qWUQD07X2b7DmIP6K71P8obPXg+jKQFcKSiY/rstcWZR2rrA3vW5LXxDQ6clSD5o31khfeBWZA8OkAacT/eDHk1MoTvfSF/K3ppk/uP/4amrFaQzpl3dT0TYJ9pxYaKPy9kA5l5gA9HQZUbffsVkvhDY7f/K1VevgQBEL5UX96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329424; c=relaxed/simple;
	bh=l6IRaI+dV4k/mMZV5b601pyccv3/YeQyQFNvf/v+a+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiqmOmgEPb1+eJAfsriRCeBUzs/EqAEEsb3lIaznO/xiO6npLoDBtUvOH92b6ZHmbG0A2JQJG/knQmaTVJFIVf0XPJBGcSOcaoJY3k0OCjvwkBa6jL3dleDqylly/5GEodK3l1sM3jjyu4UWtbVYNahFxLwegyKQN9yLF+oXQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1WoSacp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUfE9hGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1WoSacp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUfE9hGG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YWLT039595
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p7f7+UakoQrWZBiD+hsXHAx4
	mws2Jt4zSWi3n3EVJlE=; b=S1WoSacpazV92PtqOVEedB/xrZFnfrlvMNyy4AQT
	TehCC+ri3g/BSeAYtPM3z5CQW9Z2oSrWwuUxNcN4EJm8dWZV7NXUcZ0fujf8Svpt
	enX6gw6MJ3O5jsLo/DccIuczEjmrnFniJLG8pEZl+pTrKApoRll8P2Avy+1cm1zG
	1psfzUC8v3Pat7se/vyqHRRKJegPCfXkA5UrQjIMLCkIzhhse8BPzBMDM+rCajFs
	7ar5nU+0CnR1hnfvMvtNdlthbnS/QVS69QYwiBZMx38WkqBAe3IoMJrpf8z18ruj
	rSqCTH9NfXWW3f85mRuFEmjEmdaVuZy9BteknIu3cigKIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46544mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso138336085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329422; x=1790934222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=iUfE9hGG/cT7iLnwxhnegpwh6ewkjQKtKYm7/kGt/Pq02J/At183c55HuDUJ5XqyLA
         e2V2dcMRgb6N5w+kpdNYsrLxIE0lNgGd7/KLew8o1v7Rt6QUs74hHhnpC8frb3NmFldP
         qqJlwFydcocrLRuTw4Mjz3YnTgSumjbkRqvSewZ76uRlobLVOYKKAQQUn+UT7vX+3B3B
         dDXBdvhf3YVOQCFcPUGDlW1XziBTA8UxyiC7cmRFu99a7E/q3VGINMT6nvKG5vitlvqv
         +YUubGg35SYQeNNnl6Uy4E7Edm6wS9jWfktImE58+SoqNdiChfLsRPu5lC7quYcRjk/4
         9L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329422; x=1790934222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=tHHIMwHSNAgWJoYdVSy6w3vTP/EKy1LyLICf512nDmNz8FAMJg213rZKwubEBuG0Mn
         M4l3HcbCYl6xE0cnTLfxcSe9WqOlopB+bWxLD0dv+wVugltvOWXOxY7uMq7SCiJBwlGW
         FOVn8ypr6hSlWlEGoctHtG2mqZUgXN/CV1B/aOXC/EKFaZZdvFk4NpUxSY5zEC6ITTZD
         KU0Z4oRfGAORb/4MoxK8tBJBQ1Jv0g/hWuL991Lm2joPx8O3Emx+F9jeG/33+YVrtjjy
         NK+xyOCkQgouUwX6qKn7I8NPAvP4u+9VfABxrGDyWzthTngCIVt6YsIX4EY46++3zyDj
         r+xg==
X-Forwarded-Encrypted: i=1; AKwUvBzoY+aJNoBUitvwKA/df72/46RmiFqUtvv8Q4gcEOP68yJTrUglTDRXmiyvcqde+s7/KCRYT8+r4yrGW2Bc@vger.kernel.org
X-Gm-Message-State: AFuF++mSTYFN9Vj8hQPqzgZhrP7zfZvdHsaX5yDmiYt9r2v5rje43Thx
	goTUUmuq7LbzcLEnMZeJKvawlSNmXeOl3pwRH/cCjsg6FmIQGVVX4p9qJyiZRPP4wv54SvbkrTz
	q6pgmtoq9rkfN2/vM2q2+u+7+j0U61B+h2Hw9aAKemHFxZLpyc0k4fA4eSk5apeQptU9r
X-Gm-Gg: AYBFou2ga95NKfKlqPcmWBoUX8KWTHOpcswKixjaBTk1jOojY6dXEEYJXd1qDUtgxZX
	J63mITZPhYDgENIwKhjYw2o2YUuM6auP4hG8vVy5q0/68A1yhidtX8e5uRhLfLtJ+zE4haDfNzT
	tkd8ZdBhSXbmC12CeBzoy0ZG/dtZOVCBMsBNErhe2Uc6XxfVYEFeNSL6grSC1ILpfXo0TgDqFBH
	wAyvBS7kppNKuSArK8UyXF8ruZC4zNM/wR3a6B8E4jLssbupLMmVj4dIVmRjU3jm7JG7COFux2r
	D7MqkJA/OBUwi+14Li5oAKjKaxYXQCBV8uJrXf98frEYi7ZHiNV81N5OERETf3Sm5LellN/OYSp
	ApcWc+hBSQykeYh4=
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353676485a.13.1790329421460;
        Fri, 25 Sep 2026 02:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353671885a.13.1790329420834;
        Fri, 25 Sep 2026 02:43:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm53968535e9.1.2026.09.25.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:43:39 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:43:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab6424e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=i2aUADT-vu4eOaQSyNQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: g8tUfAzzGwo4ZoHpDsBXKpI2HXfj3rEg
X-Proofpoint-GUID: g8tUfAzzGwo4ZoHpDsBXKpI2HXfj3rEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX3dK9pwJTgHFy
 hDCSGc5CTUnrkT1/xIs7pj6MJLrIeKBcPv9bodO/kYrCWldJTM6N226/PdsB20NJrvqS4F65Ygy
 QvWOkiCjhb55qXircQxsX288GvKOUepgeY8cgj6mCwmghjFLuKhewLD6zM35FUl4Vmmab1b7Ejy
 3opSUvQZ2OgEZc0HitJGMDT8Nbf1PLaUovb0T8JT2nhnrB2533g7x4G4Qs3Z4CQcK2O5uN4RhuT
 YBbYQ80vwTZbNjWc0H2XmjPppqxuJ1hm2UEb7zTsdPwVibeVJpgi1vBznatuFFEk3VcYQj/QoB4
 DF9v18ggERjiBeh29GD4ViBCqmidLQAKwZjRvrTxGwWJzrPx4MTFLHRRXtGMEtq8PLUhVpzPIR6
 IrkG973VYXbfz6s2lgUkZmx0loYoUpdy0FPmVoU5W6qASiCHDX7aF+D5XT0RQC6+KyzrGXQ4e5E
 XzrdwrU74lGA1dCq1sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX1DMya4vuLgdr
 at2r18tuiGnNWV3LWG7bWKsgRkKNhC8xkvQOj0QnycHYSZ+3TnCMCbHBKMJaI5NCHxWEHWN5kez
 rcWAtWTWAL+6KdE46ynjKLbOA0tzqR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250038

On 26-09-24 19:52:32, Gaurav Kohli wrote:
> Shikra firmware handles CPU thermal mitigation up to 117 C, while
> Linux CPU critical trips trigger at 115 C. This can shut the system
> down before firmware reaches the end of its mitigation range.
> 
> Drop the critical trips from the CPU thermal zones and leave the hot
> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.

I thought that was the whole point of having the critical trips set to
115 C, so that the kernel can gracefully shut down before firmware cuts
it off.

What happens if CPU gets to 117 C and the critical trips are removed?
How will firmware thermal mitigation handle it?

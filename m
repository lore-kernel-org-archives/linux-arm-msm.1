Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69B358373
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410068; cv=none; b=S3yZvRmMYc6aRV/BacL1slIVHFvilVn/OD2XUXlHGtir0x/e+IMGFgjsvzv0B5+MPOcVloIOFnS9fwLrMjeIJLPJjAs6HhjtKDg4BzIPUFGn+VthB/k6s04DWDjBHKEU1zCeOIWz6unX59K0lvhay9BspCPuOSN2lRWKz0YSlYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410068; c=relaxed/simple;
	bh=etcNXBBDDQzHCuhn9WyhQRQcwV0yDZKYkLQCSlrBMdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdSpunMuTAAeulgVyGxTEGdFVHmcdCdSxyjuO26pBWXzhkAzr/ayHVonXec/rCNdDkJRq9YT12tF7TYNIlQqdecasflzfxiWWcIcI6k03ejmchI1PYuxVYol7PkTLUjEQrVaR2sXR1HyfqvDCe5tWPLrN8Q5UB22tndQm+pOuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUJDVLMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEpF6Lud; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUJDVLMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEpF6Lud"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpoMp2687118
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7AgUwPpZ6ylBFvFSPApEkM29
	i+AJLtwNGpDaxug4H9g=; b=FUJDVLMniirLor7pOsg86uadALTgQdrNocSWwq3F
	IsFkmukO0qWWrhSFxupaMigQcW7hXYokQxIGVROxMWAIrhOBzCNylgEcdI3JboL3
	qVX64Zn4unEqcYMi9qTnPKhxFlcNO59MTWNeYYkbO9qDyrYjjrhId4kf/9Ap34m1
	xkodpOo1nLbRiQwznfnb/CjXa4k6d7lgS5nU/NCsXTM4f8SneiQxwUBXp2iz0bZX
	OJYHb/7Qml+uH8dbVtXQr2F405c7YDE34BmuBcC8VWmkAamXqOyWvD+Z107XnpCH
	DItbWwvt+u8ozZ01lGJdyXHV+2NzPjkd75wqRUum3ZXlsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjshs9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:01:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso18248685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410063; x=1787014863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AgUwPpZ6ylBFvFSPApEkM29i+AJLtwNGpDaxug4H9g=;
        b=UEpF6LudAC4r9DjxgRwZ1ZTLVM/2BPavQ4H0qh+hTti59JSfU8q3N5wuuEYyQjqF8a
         LRlVLjTON/qUNL97x0l5PAM416F8kAPLzMyChTiSNltFFoKdJUqQX3SWHvJ4mc9zDBs1
         wme+llUrWCVcyLiUcsya5G+PI/DJA1jLu28ZMZ95DdrLyOwqkEk5+UL2YCN1/jjxkDzk
         q+FrHeIH9GHGwSg2AKDwM+22ndrjqCRdChwkyC9SHK7NhHHV5GGMxB1BHOQiBTcVZxjv
         BZlyJAi9XeXy5JXkB4pXn0LnRHLiKB+yRd2ju5hsRHyuFcAw9Uh6kGPCm69uJ7ekdS7Q
         xUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410063; x=1787014863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AgUwPpZ6ylBFvFSPApEkM29i+AJLtwNGpDaxug4H9g=;
        b=GlAkUfS3ukLImNcGNUycL5rOX6/rTkQbJvB1ZlBhRuBc8p9rGu5jpP/3tMRiTBTumn
         8nXiRiP6FkT047VKIRrD2uK+Gc3L7ni5zaYCuCRACjbHny+7QMlGLjhH7ih7Dot2Yiy/
         eGTZgYv7V9c2Edof2CsExyw0atKfJwnAncYA8Eqw6f2YW7R0NiwTXk8wUdWiphUR1bzh
         vY1OXbmp+tZ5x/Soa3fKH69WOKhZ3mU9nM+avq6osjf+ZZ/OYHmpK6VGjpLMfFnmGuDp
         WOyJbemlxZD5fz5TXceTOiU0bWdoUJp1VLMIomJRS6LMDm8B7K/YuahrdFgSJaOWD7wU
         jUYw==
X-Forwarded-Encrypted: i=1; AHgh+RocDpB6NBL/LFzjFHP9cq/tZy9XMY7DkqCpvlFZzIdS9PwCEkiivvFdjBhj7BzLVzizcQHQZ3B7qbin4ZxF@vger.kernel.org
X-Gm-Message-State: AOJu0YxwX9OSudINuDzCo+LFPAaAkT52dhoxZ9yhqlWzfJcHGJ/VsIAm
	+CQTSwlmJycQuTtw0pqeoFMlEDPfZ2n4abmmiMHFyDCB3PnhDJnQ/ifoGv+Xzb/Ncoagf7Mu1+O
	RIbWgRW6XhIajqafBJIr8vWPkdQeGrsq2L5Z7ErNvbOB6nQLe5/3LucrjCVV0UEefWIgD
X-Gm-Gg: AR+sD12wuhb3uKW1SnYE7y46pV50fS56JzVDiMPpK9yAJYmfeM+gxfoJKTwzYdf9R+M
	+MDJPAvUPycmRRjAje3OFy9I4vHg4DVVa3XEMqy2QnNIzHiawebtFNDlCnTpHBhHltq3nXx3R5X
	W6U2kCAL8JXon/Bsxxn8+grlCGKuGxeE0nkjly2XFQ+wVOEUE77nL+YyBZ+0x7SFlDcQVkQWSWu
	uiW4S1zvw3Y/51JOwAxMDg01PpMR+ONzNXp7yPQC6AVdtvOtoyrW7psBlbZsPlvYcaVnDLdbQAk
	kauxteyH9HgoD7enVHDMDLedd3WEz/6A37g6+Qz1hSEsdnaPLHRXp6R1FGdmfzihvprOG9NS7If
	vqRroRQ84jPh8tiQNkEBTtswefBd9IhxatL2h+69emvhvIOj0zqyMVIBc3By77Alwcql2D/JdGy
	CMBu8pRcnMq8sXyQ==
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr489635641cf.5.1786410063051;
        Mon, 10 Aug 2026 18:01:03 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr489634881cf.5.1786410062529;
        Mon, 10 Aug 2026 18:01:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm24711921fa.36.2026.08.10.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:01:00 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:00:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX8ZObrBN233ZS
 iDkuunD3TSxrxQqcyS3nEoB7Snan2+uGiwzOVxplvt3NxaPpv7Bi7NY/S9eaMlFrD4sWzRgjhtr
 vvrM0gXw7OZKf/cVxUj9/YgZ/2XFxu0=
X-Proofpoint-GUID: ljl1Qwl-RlKggUYk47HlgAOkJcC7anNe
X-Proofpoint-ORIG-GUID: ljl1Qwl-RlKggUYk47HlgAOkJcC7anNe
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7a7450 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pe0felBmJweB1gBNqhwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX14KYcOyfbasu
 A9okgLr/Dr0rPsk/hznD/LFg7gOk1ljhB+JubE+SSwr7DnZ5EUB+weVtRHVdmwWmIxtRos5MhW9
 PfsXZVaA6nSzzuNc3j/zcfbD+rLF1xOzrCzmGUcZ2QnQKJwqlGHFeEsdMmf0rhfJ6+ELCE9R8q/
 vLReAYUEULQkLx2NGu54owRD/XAon7abckEz/icikNtS/uktv18zGvgM6IgX49HuOsMlWmBGwkZ
 C+hrl8nIhwSR2fQphCi9RCtHwxNlKn/VP9BF75K9Hh92nRwbwqqOgaNl9opJtOviRdbDKLK+ccC
 jT9fE6G1k73qjxyGEjgoEQU+6gIoGGwKq5OmDGX91vJwd2Mre3tx+L48XOa9zrch7RHGq6ZQgMm
 lY9cl57oxbiZNqsQWd7rGg8/pliLtYS5K7CE2RCG4Hf6Bx3fgpkG9wJVzZThVn/1qvHRPfkxLoI
 1BAFlcbDByFQFW641fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |  13 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 993 insertions(+)

Please add QoS settings.


-- 
With best wishes
Dmitry

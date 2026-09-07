Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E2230BD5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771140; cv=none; b=KuVoqxF1FR2D31WMKCN1lNVPHws5VDzOtzOh6KxUMKU46bZEExPtICRwzeOq+ZiDtNvSzrb6sJDf45rGwpylH2QbQLw63+iDq4KEeEfOhPiBPEyYacy7Rqo5qKbFr40862J6DeTzfHw/YMXhwC4JNQZZ76VvI3avABXptY/laL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771140; c=relaxed/simple;
	bh=3q6Z39zXu+sXz4L20YENV+ryY3+KVhZBD8nZWaT2u4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFxhWUvYZJUhQVvGxs09UwsW5MpEFLXJ4DDB/omnl5m4eIQ3UKvi6n9VtzyOQVpAl9jjQw10OC8L8mdK8gOQZQghxej7cm7iCrUrnFvhdTZhFAeZ8osa+e8cEz/trEAHU1PA+A6dnRfL1axtYUjnBW9ZLYvkcOHJoWFDkmiefYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jB3TrXkE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBEgnkic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jB3TrXkE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBEgnkic"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877p0Qw3657544
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=; b=jB3TrXkE1zwUtZjg
	B2r8P8Xx5ngw3qziVapRbL2rKVCMvTdes+HAJ3MGDZcaMHufVkAdvjVkB42vkW4o
	3r6eKQAS4wX9+KmbeRHIMlAscWH49dB+FOUMXLl2oHunWXNA2LuUHoywKreIn2/K
	HqMnWpwmH3nDlHcfXWQ8w+gcXnuhP1RtR8M7eXqZzNMoad52sFE18AkvKMfR9oq3
	nW5P5f2cnNF3CQy/Am4ORP3Cfvnlm0geT0gdB0JOGefj9neMZh64ARPZP7cxjr2J
	K/c+oqeTELW+bQPhwkBfpXhiKiVY2/nUzC4fFWrIlUjn+XG6TB6+qaWEdHrmEuSz
	ncqxvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r8na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:52:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93917f4ccb4so405326185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771127; x=1789375927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=;
        b=UBEgnkicoYYjdkta3FrgLNxvklmcus4rNA++qke/zEoq48dE0aD6gmL1anUW2kQklj
         /zkmdILEKGj4rP4cozHyro4IGUubyHrhSR7hgSG85BQUmFOQOPUQSjC7CMC7qz/bzEfD
         5AKdaH92Iu9LfSdpw3Wp/6FxMosVoTi5KbGaDIta6Kn/GFMvnmn9yLZ21eVT0K4CyZWV
         udIjT31s0cHPbK4WdXhaE+efb7Tx3No8GNy579R2VWBJ9yelZzfY9feqiNmUZLMf3X+d
         XkekIFxVgw754QshbqXedkr8IQRR05M6zjWVCiY6yHJg6TvPF4dRKgsu3M1Z3912wMZ6
         dIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771127; x=1789375927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=;
        b=KQUeqAseJupnTvRUcO5fA3KT/r38UjZP6FklQBRUwSHJ1Wi0rkSeCl4P8CHE5N9ieH
         8j5i3xX6mD+BEPPzNpTxKzNbuBWpSZzT3Gqix35NKv07Radhgv58V/6fDRY0oO8Nt+O7
         bSzvd8LszwEw9yhiS+0vZ5QDqCG6kxOWuRt33hFKgiEjqZTJjIH/Yq7iedKD3x18bfFw
         evNSj6SFNiZ+u2xYtwc2GvY2gDAqldysyG+2Frlh6qxhXNfAPLBe/QAp44wLpl/k4TRW
         LvIfr8V4VWX/yeOnMtQq+WPjV9MePae9YPFFX/5hI5pcoKx1UtHaJ+iZvgwH4oADif99
         syAg==
X-Forwarded-Encrypted: i=1; AKwUvBx7APkUZgk0IrvnLiUiZWR199lwvCXiM42gtU0NQHKg+jdaWPuGYYC00dC8lkJJxkBwZvHuf2I6kclgMNOa@vger.kernel.org
X-Gm-Message-State: AFuF++l6Kigc4I5YZbg+Wjxt7stOjJkuWXebs/yZyobS9nMiN5bH8/VO
	wf9PgSs6DQ/p6a+S2z51sde39RkHoFyVpGCtUTeJOQWpf8tvBU+c1nBRYzyik/u5vAA6TavV6ca
	H8TFG17PETji+TztnoRxuSeblzg1gPrqrAB70uwJO/gpTVdYyNqQEPdzNhIrZcYNele8b
X-Gm-Gg: AYBFou1z65cfjF2/G7V9cX2J6q7PjEUIDZvPb0y49setb10mosxd8FACj8NKsZ2I9r+
	Mi6kmseTg/l7e7TAgnJ8Z7C91Y+PXfAItsugS166IGApZ4i9Gofk8eDQzuhoCSoykir4nGuCsdr
	Moa776AXMIFk7isoYOsr5kYLbA547qGEZP/YV5LdHjtA3tdMZBdkX/xyBc5jpNe4XYcZ38G3IXS
	eS5UQc7hVhB1SEdJ56E71lqLxVSjP7vyI4pdXxLnHuDBHu5BKGCSTDADpM8xEWYW8bwaiECK8Or
	Id9UcZZEg6tRQTtqiA/QGQHy3CWMWy5MLYuIZsta6FZ/tgu8JxPDxVxOHqmLbpS9oZas445W7IQ
	2iX+hegIBoG9zAzvXH2qCZxgSGw==
X-Received: by 2002:a05:620a:2894:b0:937:11c9:37f1 with SMTP id af79cd13be357-939803455a3mr2211877585a.16.1788771126813;
        Mon, 07 Sep 2026 01:52:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:937:11c9:37f1 with SMTP id af79cd13be357-939803455a3mr2211874385a.16.1788771126413;
        Mon, 07 Sep 2026 01:52:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm207319055e9.4.2026.09.07.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:52:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, "hpp.iscas" <hppiscas@163.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
Date: Mon,  7 Sep 2026 10:52:03 +0200
Message-ID: <178877112161.9799.4801508873821815896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905134340.67477-1-hppiscas@163.com>
References: <20260905134340.67477-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ckc8XRZaWj2zxhn_o6aqDPrIDo2w7cZ8
X-Proofpoint-ORIG-GUID: ckc8XRZaWj2zxhn_o6aqDPrIDo2w7cZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX1/SOvedLkZee
 kR+De3fHV749Wm/+iLtpBTDICSrwk5yJhvpUwASE82khYnBmikiw4WyY69SZWtbXzQ3V4O02JyC
 m7l/3uPVNTGJl5lq9Sqo6hACSLqO6cY=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e7b3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UYzP0Bt1LNVb4JyMi9kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX6PBJd3rRieTR
 XxP3D3TFYYKXw6CLSQZijGh7a9TKCwtixLSFNnT1vfxZjrdRf9pPJZw4aJn2fTTZrv2W5U5aZ4H
 oAFns9wEU9YhDJvoP+1AxrSX3Zi06XBRNBCjjCZvYFZQIPtdtav7IzRrsRrwrvgPC4mji5Avw34
 vbS7RqPn01+defrr3+HgQrEDUK3e8L2xEWAP0VeOI/2kTb+IxHIbnmjqLxoOSr+jQvDSWY0gmP6
 FufWyjkmAb2DHb1aLI/kU77DjFvDmaQkA8oPG1ZBx7EF9vZFZbQ4aeqKe9fxP5Ot7xrOXItbp/l
 PH3esDqenBfZD/6xwtG0Lb4Vg+057GfbgCNVIwI5VBMce8COtuqNAJ6fDf+w0D8Ly8QQe4tWKLC
 IyJ1s4mvzC3WWJnN03vRU0lq3iZN6BX9ONQ6XRY/1j75vWf5IzF8dTQwtPOFZcq+OBb4MCgQ1bH
 2mNIzWPUcLhfldWjSRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096


On Sat, 05 Sep 2026 21:43:40 +0800, hpp.iscas wrote:
> The IPQ5210 TLMM platform driver can be a module and matches through
> ipq5210_tlmm_of_match. This table is not published for OF modalias
> matching.
> 
> Publish the existing table, preserving arch_initcall ordering and
> the shared MSM pinctrl probe.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5210: Publish the OF module alias
      https://git.kernel.org/brgl/c/818103dc7f5998a0d7957fb71d4deecdf4d579e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

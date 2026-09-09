Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB043AAF66
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935362; cv=none; b=n9QS5sL4K0vv166uDUsViIS4CRk1nerXnl1t8/qtWCCzP4zoJsPv6CbURTsJgY7BNfs9cH4wimf67S73rjsElth74t4SXQitrP44scabtPmsTy6za7z5Cm4AeSlNXE2d+pTN4dQEz39JUZ0wQQ1MidPgGysDMc+vgl4ewaStlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935362; c=relaxed/simple;
	bh=GApF9KA7a7An3y3e0JIVJ0bz/r94i/L+WtuY8JrvS10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpx/SrFk/oLr0A/NyaYi6Dwyxno3mOx4Y3Djq8JFTNthvqEXifBlr+fO04ZDwBDDJD4IQErZ7KxJFTZ7vy3Nh2KtcKSHo1jPp/4xyxPUf881q+rH3saxVwrqhadbwKV1dxACaYlk2/O76VKVZ18Y5GvrHmJsPcTDl15Zor9dr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNkndGI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjUCDJ6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNkndGI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjUCDJ6M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896GdcH131921
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuVzlSB31qLhxRy93vlak5xk
	hcEfOZHHWWOiuFWT7KI=; b=LNkndGI+F2sVu3y5Jk29Y6qr8RzZHDbUDldUWiet
	jDNwQBuB1w53SE5u7S6smxLJvGwsbmuQizXPBfXnrHsCJMLMzvmSs1Z8V5d+Ex2q
	QYYjDQps+IxT4+nUEawE6bDduSv+xQrhJF5ccgaQ84bjKaz786cGcUOYA8y1YED8
	InVhv7bYQnLFb4v36zcGVO9EOLrmPRUZ1z8XCGHuFrToVlGpcg4tpUnRhJA75NbV
	G4Tpge1Axdb1PhY5KFtXcJYoUi6Zbgw1uVVAdnxYAOj9yB8+lQiDzlJ/5SN0oqou
	8IOwNIEBYCNoYFRKYzTR2OlIEAiBOXaFQfyLtkEWEP+A6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk2pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:29:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85602449126so3867667b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935356; x=1789540156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=JjUCDJ6MYGkhy1Z8JVs0iQooCFNn2aF1q0DperjyXqjqsAPVTMLcxjUeHu/JgoDNdT
         anwYZyL2ihKPi8om9wqpCN/2pqwG3risJy5OkrjSFgL0VPp1wBhE/WSac99yu30iA+F1
         qbmM+FwNu0xiHewN0ZurQnqHb6LLrjuMnkBgfb3zK/XG19XfT898FYrNy5fuvcqZPxAy
         Z/OJ4PO4fOfW6yvDqn0dWXVZBjUW2bk2L5PDP0q5PdgqO7YPk07YmW+t0adhK79fQnR0
         ZzCPkSkNkLhuR3ghdpvo17epyHCfDYeXr+WaRemahCgvjwQbtCE5P1e/QhFFDvQDEAlc
         Cw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935356; x=1789540156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=pUhUbKUgoNTQRbQu/WPAcKVtaXY/tUBeVUBOAzgVqdE9MfrCkjMCsQcH0o3Z2OEt54
         YfvtzAFhb/wHX4CmeZnT+NCfrCy2xlNZ7V2zHlmzx1YakXtHRUwWQqlWT7mtt5TQSBM8
         qsmVth9SoT7GN9SkaJEwt/FWV27GQkyh+yK7lWWzG6t5IBUBV7uW9tMVZxpZv0iaK0vW
         RTisZd2GN7yv17U8jy/ie56J6QGIY0Xk5hXRT3vKknIZzYmthEP3ctp7LEKtxKfVloIr
         h+JrTedRl7pVpVdbffsKfvwmH5j1aIKUsavbipRAxnGqU7aOgy/iP1LYmFnPidJumqcd
         5BLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi9arNNPzej6hrp5UYikQHgWM7rg1M+qYXWLv0AdLf7e8Sjc7G3UgF36nK7d3Voq+fVhyi1EtU+Pxyz1+X@vger.kernel.org
X-Gm-Message-State: AFuF++kYmGQqZEPhpc7bKHo012hmvVmydQ77F6X4KnsieRzReHjEMAjE
	AkbILTbwEGdS3m+Wm6G1RoMG09IQnlkATvDsi2pAlg061v/ijs4cnrmodbz4K9dBlQa5Xgrg487
	eD2cUaUDT5eisCryIA6fA4uVIyqVVg0wbZUgz2Kh4Hnu74FT0jVR5nBgIo+k4KNhQReVV8Bh4+e
	ET
X-Gm-Gg: AYBFou3zn2BKhdbKFOWfc9cIEMqxR4mKhU23eJmvyTO6saAxH06GyYOR/YU2jirOCKJ
	wS8SrAbgf0eRuVeZQttl574hoR6TJ0nNLj0YFLbP30bOrrROTCq6Bs4nDI3aSU8Qkw4Sg6ybfJa
	JBlkGtbk4+Tp8LRjdvGbniRDn1IOfGdHnDClnu4ACNcNC71BS2ywnAvUBFgOu+YPMzu/juDD7Ke
	zzb4TuHK0174+6zkfCRp5/t0Jiqca0NwcbKbiEcl5XVSuhrWr0QC10TQULEA8ZzDnnaocDXNcId
	GeJQjd1u2/jjFWGSPAQSQvXozPUmicxRthZNXBbINmkX6pjFEpiS3vH6CCTrEww/S3jO8IYH3y6
	Y069YhrNxLbVTUVtkoCJdUjddzkw=
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556887637.9.1788935355843;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556828637.9.1788935355402;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm47823081eec.7.2026.09.08.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:29:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:59:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX98k1trq3wza6
 YdKUICWzzb3vupd/tJ52bjoG3ju1ipGNakx2njI6oPh+60jBqhCy1ZhrrwTy9swBCIZH5S/Wriv
 r5eULQTlT+GMekiuQs+Kq108U1oEqgafD2einatDd32LN3M5lEHsLBslREmRpxkDlL65n8Bl4XS
 399pDOalnyjtUyHZ2DDx1AnoD+70fc01OvMQaxL+DegeM+N7Gv8LHAS3Y6lkDTX2WhnZs/Jodll
 R6gaJaWAwmeDb+NzGtmFNWTPwdmHEt6kB8Acx24BB59Sn6DMuib79p3Q8WTUsznDyZWKlrmlsS8
 bW8OS2vBTVyxtAMx7v6fRCZjtNO454v3OaN8vlcpU/JI8ws1xFfvRVKZzyRGmfk2xLCD4r+C2/6
 ed5XQ4Lkk0ZsuzFboPKdSXxe/zXMzS19Mp2JZP1UEtKTATq4BNRHpW53vkqIeyNgKRNUDUFNJsf
 UDBxDXZ3dN6TYgifhEQ==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0fcbc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K9csx1bNu7bmPCVkKm4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: tuOwlgDCpqnlthTMRzBg-06zpY1nrPC9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX//a8Vta0E+xR
 OKgrvggAOqqQVSbuzX2q+JPESBVLg3zFk4UmzHLr441E3Zjqs+oizDCGySRDeedSvA+E+6EdnxF
 0JJSARw2MTaajf2mGiE0ktr8ZdNR518=
X-Proofpoint-GUID: tuOwlgDCpqnlthTMRzBg-06zpY1nrPC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090071

On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #3: Switch to built-in for everything, with explanation in
>   commit msg.
> - Tags
> - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> 
> Similarly to clocks and pinctrl, interconnects should not be a user
> visible choice.

Is there a conclusion on this series? As I was depending on this series for
Hawi interconnect config enablement.

-- 
-Mukesh Ojha

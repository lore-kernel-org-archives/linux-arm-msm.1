Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D370443AA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432123; cv=none; b=jviosX6WbA9zn6dJ62p5SWk9FHiwjKIKtpNNk1t9PrxjOSlIZ074hyqqMhrXbLEeY2SYmUw68f5AJ+z4tIrXYPG4FESPg5FDXZGfDS2DuiMf8ss/jztK8TWAvmJbdWQxNZYCGdUWmqPKX/5JQiAuzZpMcyoZ+wQRBbHSSoCeRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432123; c=relaxed/simple;
	bh=3g73Sg08njy59Fs9RN+HZI5vG37ruxtXwFEEBcAecK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdQ1idc+INSCOKldgdJ0wK0Sa5EaeszwpHu7lNJJDeNt2TKtd2yEyq0Z7kK8UG6at6LYntBnkdUS1aLdFxd2KZX4D8P4cfKKKDoBD9dl6RZ1DhlxnmALCqgeEsS8awmc8BU2cSSnukqQHirEs5ydyBC/h4BqwJC3x6yiXq+3AQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnoUlefr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVxSLfEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnoUlefr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVxSLfEX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHABk440128
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 10:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7l7azTOzD2PfcWSmzIDw97sw
	UeA7tLeX4+tJ49O8eSo=; b=JnoUlefrI9Z2PgwbPPDmowoXUSUtqRJzMqwbQ4WC
	O4MmYWtXf4t9ZqBCSncQHCh6avZGoSH2pmkksVd/62VtOIMULNZFmdA1htm+isIi
	IgBuOQfQ3UjkIPo+t5JAQbj5SP50ZN8I/N5gO22nSai4DRnJIyBhCmXn3/5HWfiV
	LqjfnHfSph2M/KiR2IKPX2zFgmXvVszoyaUiU7Rvcv7ymSPAdi0KPTJx7L+WVg2Y
	2FoEZrb1MnZLcZPpI9WUORKMRvpcU7eKBPZVcidtLE4J+JpB+yYyiHNeTGICSvB3
	gtk197E7agSUIFNoJ9H2QyVPwwxnQwg8Vb5UBaCsHRvC4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70625-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 10:42:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso162942985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432120; x=1789036920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l7azTOzD2PfcWSmzIDw97swUeA7tLeX4+tJ49O8eSo=;
        b=PVxSLfEXYuntzC6Rj5sWX9k8lc+BXn0QrYMv4qr+eRyhwu9HxhsjJazn9+emafJyPU
         IElHI1ZBcdW7a3WQ/tcbtHln128sBTMCW/xjvsuo5OQKz9Vs98g5x4DEHL9VB7kT1URj
         ng7VvFTIatgHAc4nY0GVMhIvCOK4829AAcDjPd4Ebr+WdKuUZ7odBSRopUF8YtZuz9ZR
         5D2loYCb94lwEoPG+qB90i2QBXKI/O20NbaG+323EUI4M+Ng+20MLTBTYafCxS464Eha
         PWukeitBX8ysEJgPIZqdTHJ2DwGNvtC6RTyWxj3qlt7MaVyZc46TDYMWvoSXmoW3Blkc
         zfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432120; x=1789036920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l7azTOzD2PfcWSmzIDw97swUeA7tLeX4+tJ49O8eSo=;
        b=h5OnQfZqkONEENBPlUB30/9Jy31nSgbIjq4YlFulBVZovoEBtymqUZMw7CnrQzhM8E
         EW0WOxMt0E7RBToX1IXsVQGIHS07t6uktsDFQBJ83gE6l+C9kkEybD9m/Eo1ELRqC8qI
         UTqYOtvUMywBToVoce7BDibEN3252czc6jQBWWhVbdvLyPhCVAnC6qJ/abq89lFCqkJI
         LraNPNwAc+J6H33aNgzbZXHOi1b2EzhLCJHbbgggwK0emR4MstZNamIn2d2pOJ8x2pGK
         dIhR9RoHqtiYz7cNqdiL1nXKHd9T0KzCp/2xe+iUxukFhO5aGE/BuIrIecJa9xWiBtiT
         0BEw==
X-Forwarded-Encrypted: i=1; AKwUvBwHx8PHxa/L0qOomCfujoItK/emd6C2mq6ugL9qmqwAUSl1X2YNmZKUjshU0Roj0uCO6wlyfD8FO0fgFwzS@vger.kernel.org
X-Gm-Message-State: AFuF++ngHqcfhQh5Fq1+0YpfIjBeXPvuTfa5ElmUsH9R34oMVEu3Awv2
	borXBIDkT1q1mBoyANlRFuNUHP12zTnp3DBAiwRS0xZQDWGsFNq9PrreabN+WIXlZWmpcSvkP00
	RhkZWrycLgUPH3jh/0dSQNwSLldL2oCUhQ4FMQ14Jj/5MhYuQsZkg54XPTdLyz4xh9sYY
X-Gm-Gg: AYBFou3w13EJnTVolY55GZFREISm/3FMx6JTLBAhUDE+3nZHiemg5sgqA7osNyy73UF
	yOT0vSFEwBYNv7VkJwCA/UuwyAG8YlL889PdvnMJU3sxZaDie6DscnCllqYHeFYZxiyuEaTvb2n
	W1NfjzF0bg6eRLT1LMNo6s9y1yZNY447dEj9M3tua4uwkNWBsc8pjwxgOGvKxshRu2bNzLIgrvp
	alewlFAnUQPkuFIkKCMAW9Hk9N2FbolHvsOFGnTAM7tskYxhV6mTxRDD+qzfia6gIi+7U+54y8x
	pkFENLmTl3d5HLAW7mUeBYwv8BTxO2dweyLMUAi3qX78fy13QaGoP3zr9U/MRT86oxKW8oqIw+g
	7FNRi5VJF/daG
X-Received: by 2002:a05:620a:6498:b0:939:4a47:932b with SMTP id af79cd13be357-9396e10d8b6mr610855485a.36.1788432119927;
        Thu, 03 Sep 2026 03:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:939:4a47:932b with SMTP id af79cd13be357-9396e10d8b6mr610850385a.36.1788432119258;
        Thu, 03 Sep 2026 03:41:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea96csm10939260f8f.29.2026.09.03.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:41:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:41:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
Message-ID: <hzh2k6bxe7nmriyyjn55ahxsj4f7gax7w7v2nx6oya4bilmbqb@lwv7ivio5ijr>
References: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 0RXwtVrGJhaKXrOubirr_KPOhrfRdXIK
X-Proofpoint-ORIG-GUID: 0RXwtVrGJhaKXrOubirr_KPOhrfRdXIK
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a994ef8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ilf_V6A9UdN43Ifd920A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfXz0mQPB2ShpMJ
 xRnVMWo+m6MWnxwCUKyJDM3W2B+H6MHMnVMJjcrPF8o2zBKvWdEeUAaVuPZph1/9L00RmWdQitc
 dFHU0D/RjTenrLTIrdnT7Epx28atvcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfXyON0OQzxICWb
 sddMdeEvTNxuWTZJHPVWhFMzGuzMFDg/NQ1qatzrHb54idmFF3/Qe9JSX8PQWjgYRAoz8D+VZiN
 PcvGiBbrp8t+PqGvPNeIG86v8dmuoljAW+HngTBc9t/ReIJ4OTYl1NLD0sy6rBAEgeyLvuhTVfB
 yG67BmCtjM2qbOGDZh+asKIVvZUClwcy5wSSCzwqWcXPSQLFchyC6tK6jUlUYhIX0xoFK9mwulx
 wEYdAqSpu3K15skRqI+ocu0PGZE2iMGtjTuo4LKTgCepXuCmXXYivXwSXsuXGvRd3pgP4ZFGvTz
 Um9vNO6XGR5yXdVvDk6xa2Cg+2NM2HtaeYNL9NOe7hxYDyavqe0LFLUbwDOOiUeY9nzLkrRiOsV
 BAu8ctwaigXVoCUsmG7RpOn2AytqpnG8FeVhAaB8h6vW6PUDh73Dhh+8jr1ATa7rzCuqJ+Yp1A0
 1klYkirKg9SZCQFJ/1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092

On 26-09-03 09:43:09, Shawn Guo wrote:
> From: Gourav Kumar <gouravk@qti.qualcomm.com>
> 
> Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
> Glymur's UBWC capabilities.
> 
> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
